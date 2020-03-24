-- Originally written by the Ace Team, ported to WAR by Werelds
local ACEDB_MAJOR, ACEDB_MINOR = "WAR-AceDB-3.0", 11
local AceDB, oldminor = LibStub:NewLibrary(ACEDB_MAJOR, ACEDB_MINOR)

if not AceDB then return end -- No upgrade needed

local type = type
local pairs, next = pairs, next
local rawget, rawset = rawget, rawset
local setmetatable = setmetatable

AceDB.db_registry = AceDB.db_registry or {}
--REMOVED: AceDB.frame = AceDB.frame or CreateFrame("Frame")

local CallbackHandler
local CallbackDummy = { Fire = function() end }

local DBObjectLib = {}

local doOnce = true

--[[-------------------------------------------------------------------------
	AceDB Utility Functions
---------------------------------------------------------------------------]]

-- Simple shallow copy for copying defaults
local function copyTable(src, dest)
	if type(dest) ~= "table" then dest = {} end
	if type(src) == "table" then
		for k,v in pairs(src) do
			if type(v) == "table" then
				-- try to index the key first so that the metatable creates the defaults, if set, and use that table
				v = copyTable(v, dest[k])
			end
			dest[k] = v
		end
	end
	return dest
end

-- Called to add defaults to a section of the database
--
-- When a ["*"] default section is indexed with a new key, a table is returned
-- and set in the host table.  These tables must be cleaned up by removeDefaults
-- in order to ensure we don't write empty default tables.
local function copyDefaults(dest, src)
	-- this happens if some value in the SV overwrites our default value with a non-table
	--if type(dest) ~= "table" then return end
	for k, v in pairs(src) do
		if k == "*" or k == "**" then
			if type(v) == "table" then
				-- This is a metatable used for table defaults
				local mt = {
					-- This handles the lookup and creation of new subtables
					__index = function(t,k)
							if k == nil then return nil end
							local tbl = {}
							copyDefaults(tbl, v)
							rawset(t, k, tbl)
							return tbl
						end,
				}
				setmetatable(dest, mt)
				-- handle already existing tables in the SV
				for dk, dv in pairs(dest) do
					if not rawget(src, dk) and type(dv) == "table" then
						copyDefaults(dv, v)
					end
				end
			else
				-- Values are not tables, so this is just a simple return
				local mt = {__index = function(t,k) return k~=nil and v or nil end}
				setmetatable(dest, mt)
			end
		elseif type(v) == "table" then
			if not rawget(dest, k) then rawset(dest, k, {}) end
			if type(dest[k]) == "table" then
				copyDefaults(dest[k], v)
				if src['**'] then
					copyDefaults(dest[k], src['**'])
				end
			end
		else
			if rawget(dest, k) == nil then
				rawset(dest, k, v)
			end
		end
	end
end

-- Called to remove all defaults in the default table from the database
local function removeDefaults(db, defaults, blocker)
	for k,v in pairs(defaults) do
		if k == "*" or k == "**" then
			if type(v) == "table" then
				-- Loop through all the actual k,v pairs and remove
				for key, value in pairs(db) do
					if type(value) == "table" then
						-- if the key was not explicitly specified in the defaults table, just strip everything from * and ** tables
						if defaults[key] == nil and (not blocker or blocker[key] == nil) then
							removeDefaults(value, v)
							-- if the table is empty afterwards, remove it
							if not next(value) then
								db[key] = nil
							end
						-- if it was specified, only strip ** content, but block values which were set in the key table
						elseif k == "**" then 
							removeDefaults(value, v, defaults[key])
						end
					end
				end
			elseif k == "*" then
				-- check for non-table default
				for key, value in pairs(db) do
					if defaults[key] == nil and v == value then
						db[key] = nil
					end
				end
			end
		elseif type(v) == "table" and type(db[k]) == "table" then
			-- if a blocker was set, dive into it, to allow multi-level defaults
			removeDefaults(db[k], v, blocker and blocker[k])
			if not next(db[k]) then
				db[k] = nil
			end
		else
			-- check if the current value matches the default, and that its not blocked by another defaults table
			if db[k] == defaults[k] and (not blocker or blocker[k] == nil) then
				db[k] = nil
			end
		end
	end
	-- remove all metatables from the db
	setmetatable(db, nil)
end

-- This is called when a table section is first accessed, to set up the defaults
local function initSection(db, section, svstore, key, defaults)
	local sv = rawget(db, "sv")
	
	local tableCreated
	if not sv[svstore] then sv[svstore] = {} end
	if not sv[svstore][key] then
		sv[svstore][key] = {}
		tableCreated = true
	end
	
	local tbl = sv[svstore][key]
	
	if defaults then
		copyDefaults(tbl, defaults)
	end
	rawset(db, section, tbl)
	
	return tableCreated, tbl
end

-- Metatable to handle the dynamic creation of sections and copying of sections.
local dbmt = {
	__index = function(t, section)
			local keys = rawget(t, "keys")
			local key = keys[section]
			if key then
				local defaultTbl = rawget(t, "defaults")
				local defaults = defaultTbl and defaultTbl[section]
				
				if section == "profile" then
					local new = initSection(t, section, "profiles", key, defaults)
					if new then
						-- Callback: OnNewProfile, database, newProfileKey
						t.callbacks:Fire("OnNewProfile", t, key)
					end
				elseif section == "profiles" then
					local sv = rawget(t, "sv")
					if not sv.profiles then sv.profiles = {} end
					rawset(t, "profiles", sv.profiles)
				elseif section == "global" then
					local sv = rawget(t, "sv")
					if not sv.global then sv.global = {} end
					if defaults then
						copyDefaults(sv.global, defaults)
					end
					rawset(t, section, sv.global)
				else
					initSection(t, section, section, key, defaults)
				end
			end
			
			return rawget(t, section)
		end
}

local function validateDefaults(defaults, keyTbl, offset)
	if not defaults then return end
	offset = offset or 0
	for k in pairs(defaults) do
		if not keyTbl[k] or k == "profiles" then
			error(("Usage: AceDBObject:RegisterDefaults(defaults): '%s' is not a valid datatype."):format(k), 3 + offset)
		end
	end
end

local preserve_keys = {
	["callbacks"] = true,
	["RegisterCallback"] = true,
	["UnregisterCallback"] = true,
	["UnregisterAllCallbacks"] = true,
	["children"] = true,
}

--ADDED
--[[
	Ahead is some stuff added/modified by Werelds, to cope with Mythic's weirdass naming stuff
	Theoretically, every career has not only a different name for male and female characters,
	but also for the different tiers. Technically, there are 10 different names for each and every single career.

	Currently, however, absolutely none of this is implemented, and I've just created some mapping tables.
	By my knowledge, there's no way to "force" the client to return an english-localised string from the string tables.

	Note for discussion: Should we go by career _line_ name, or careername? As said, it's not implemented, but Mythic
	clearly had plans to have careers change names as they leveled up, although that's not in use at the moment, the foundation is still there.
--]]

-- Quick function to convert to string and remove gender suffixes
local function prepareString(input)
	-- Convert to string.
	if (type(input) == "wstring") then
		input = WStringToString(input)
	else
		input = tostring(input)
	end

	-- Remove suffix.
	input = input:gsub("%^[fFmM]", "")
	
	-- Done..For now.
	return input
end

-- Convert career ID to career Line.
-- I made this algorithm a couple of weeks ago; the career ID table has a very fixed structure, and lines are easier to map to than ID's
function GetCareerLineFromId(careerId)
	-- Input check.
	if (type(careerId) ~= "number") then return false end
	
	local careerIdToMinimum = (careerId - 11) % 8
	if (careerIdToMinimum == 0) then careerIdToMinimum = 8 end
		
	if (careerId >= 12 and careerId <= 51) then
		return careerIdToMinimum
	elseif (careerId >= 52 and careerId <= 91) then
		return careerIdToMinimum + 8
	elseif (careerId >= 92 and careerId <= 131) then
		return careerIdToMinimum + 16
	else
		return 0
	end
end

-- Two lookup maps; one going by careerline, the other by race. These are here to avoid localisation issues.
local careerLineMap =
{
	[0] = { Name = "Unknown", Faction = "Unknown" }, -- Failsafe.
	[1] = { Name = "Ironbreaker", Faction = "Order" },
	[2] = { Name = "Slayer", Faction = "Order" },
	[3] = { Name = "Rune Priest", Faction = "Order" },
	[4] = { Name = "Engineer", Faction = "Order" },
	[9] = { Name = "Witch Hunter", Faction = "Order" },
	[10] = { Name = "Knight of the Blazing Sun", Faction = "Order" },
	[11] = { Name = "Bright Wizard", Faction = "Order" },
	[12] = { Name = "Warrior Priest", Faction = "Order" },
	[17] = { Name = "Swordmaster", Faction = "Order" },
	[18] = { Name = "Shadow Warrior", Faction = "Order" },
	[19] = { Name = "White Lion", Faction = "Order" },
	[20] = { Name = "Archmage", Faction = "Order" },
	[5] = { Name = "Black Orc", Faction = "Destruction" },
	[6] = { Name = "Choppa", Faction = "Destruction" },
	[7] = { Name = "Shaman", Faction = "Destruction" },
	[8] = { Name = "Squig Herder", Faction = "Destruction" },
	[13] = { Name = "Chosen", Faction = "Destruction" },
	[14] = { Name = "Marauder", Faction = "Destruction" },
	[15] = { Name = "Zealot", Faction = "Destruction" },
	[16] = { Name = "Magus", Faction = "Destruction" },
	[21] = { Name = "Blackguard", Faction = "Destruction" },
	[22] = { Name = "Witch Elf", Faction = "Destruction" },
	[23] = { Name = "Disciple of Khain", Faction = "Destruction" },
	[24] = { Name = "Sorcerer", Faction = "Destruction" },
}

local raceMap =
{
	[0] = { Name = "" },
	[1] = { Name = "Dwarf" },
	[2] = { Name = "Orc" },
	[3] = { Name = "Goblin" },
	[4] = { Name = "High Elf" },
	[5] = { Name = "Dark Elf" },
	[6] = { Name = "Empire" },
	[7] = { Name = "Chaos" },
}

-- Storing careerline for use in the keys
local careerLine = GetCareerLineFromId(GameData.Player.career.id)

local realmKey = prepareString(GameData.Account.ServerName)
local charKey = prepareString(GameData.Account.SelectedCharacterSlot) .. " - " .. realmKey
local raceKey = raceMap[GameData.Player.race.id].Name
local classKey = careerLineMap[careerLine].Name
local factionKey = careerLineMap[careerLine].Faction
local factionrealmKey = factionKey .. " - " .. realmKey

-- Actual database initialization function
local function initdb(sv, defaults, defaultProfile, olddb, parent)
	-- Generate the database keys for each section
	
	-- Make a container for profile keys
	if not sv.profileKeys then sv.profileKeys = {} end
	
	-- Try to get the profile selected from the char db
	local profileKey = sv.profileKeys[charKey] or defaultProfile or charKey
	sv.profileKeys[charKey] = profileKey
	
	-- This table contains keys that enable the dynamic creation 
	-- of each section of the table.  The 'global' and 'profiles'
	-- have a key of true, since they are handled in a special case
	local keyTbl= {
		["char"] = charKey,
		["realm"] = realmKey,
		["class"] = classKey,
		["race"] = raceKey,
		["faction"] = factionKey,
		["factionrealm"] = factionrealmKey,
		["profile"] = profileKey,
		["global"] = true,
		["profiles"] = true,
	}
	
	validateDefaults(defaults, keyTbl, 1)
	
	-- This allows us to use this function to reset an entire database
	-- Clear out the old database
	if olddb then
		for k,v in pairs(olddb) do if not preserve_keys[k] then olddb[k] = nil end end
	end
	
	-- Give this database the metatable so it initializes dynamically
	local db = setmetatable(olddb or {}, dbmt)
	
	if not rawget(db, "callbacks") then 
		-- try to load CallbackHandler-1.0 if it loaded after our library
		if not CallbackHandler then CallbackHandler = LibStub:GetLibrary("WAR-CallbackHandler-1.0", true) end
		db.callbacks = CallbackHandler and CallbackHandler:New(db) or CallbackDummy
	end
	
	-- Copy methods locally into the database object, to avoid hitting
	-- the metatable when calling methods
	
	if not parent then
		for name, func in pairs(DBObjectLib) do
			db[name] = func
		end
	else
		-- hack this one in
		db.RegisterDefaults = DBObjectLib.RegisterDefaults
		db.ResetProfile = DBObjectLib.ResetProfile
	end
	
	-- Set some properties in the database object
	db.profiles = sv.profiles
	db.keys = keyTbl
	db.sv = sv
	--db.sv_name = name
	db.defaults = defaults
	db.parent = parent
	
	-- store the DB in the registry
	AceDB.db_registry[db] = true
	
	return db
end

--ADDED
-- Had to make this global :(
-- As far as I know, you can't register a local function to a window either, right?
-- Handles logging out of the game; removes all defaults from all databases.
--

-- Wikki - version 10 --
-- Due to how Mythic generates the EXIT_GAME, QUIT and LOG_OUT events, it is not
-- viable to execute this function from them.
--
-- Any addon using this library should call this function in their OnShutdown
-- event in the .mod file.  This will cause the profiles to be cleaned up properly
-- before saving.
--
-- Using this method requires the user then handle the OnDatabaseShutdown callback
-- if they wish to do any profile changes, as this function only executes once
-- and is on a first come first serve basis as we can not control addon shutdown
-- order
--
-- OnShutdown is called for logging out of a character, logging out of the game,
-- or exiting the game. 
--
function AceDBLogoutHandler()
	if doOnce == false then return end
	
	doOnce = false
	
	for db in pairs(AceDB.db_registry) do
		db.callbacks:Fire("OnDatabaseShutdown", db)
		for section, key in pairs(db.keys) do
			if db.defaults and db.defaults[section] and rawget(db, section) then
				removeDefaults(db[section], db.defaults[section])
			end
		end
	end
end

--[[-------------------------------------------------------------------------
	AceDB Object Method Definitions
---------------------------------------------------------------------------]]

-- DBObject:RegisterDefaults(defaults)
-- defaults (table) - A table of defaults for this database
--
-- Sets the defaults table for the given database object by clearing any
-- that are currently set, and then setting the new defaults.
function DBObjectLib:RegisterDefaults(defaults)
	if defaults and type(defaults) ~= "table" then
		error("Usage: AceDBObject:RegisterDefaults(defaults): 'defaults' - table or nil expected.", 2)
	end
	
	validateDefaults(defaults, self.keys)
	
	-- Remove any currently set defaults
	if self.defaults then
		for section,key in pairs(self.keys) do
			if self.defaults[section] and rawget(self, section) then
				removeDefaults(self[section], self.defaults[section])
			end
		end
	end
	
	-- Set the DBObject.defaults table
	self.defaults = defaults
	
	-- Copy in any defaults, only touching those sections already created
	if defaults then
		for section,key in pairs(self.keys) do
			if defaults[section] and rawget(self, section) then
				copyDefaults(self[section], defaults[section])
			end
		end
	end
end

-- DBObject:SetProfile(name)
-- name (string) - The name of the profile to set as the current profile
--
-- Changes the profile of the database and all of it's namespaces to the
-- supplied named profile
function DBObjectLib:SetProfile(name)
	if type(name) ~= "string" then
		error("Usage: AceDBObject:SetProfile(name): 'name' - string expected.", 2)
	end
	
	-- changing to the same profile, dont do anything
	if name == self.keys.profile then return end
	
	local oldProfile = self.profile
	local defaults = self.defaults and self.defaults.profile
	
	if oldProfile and defaults then
		-- Remove the defaults from the old profile
		removeDefaults(oldProfile, defaults)
	end
	
	self.profile = nil
	self.keys["profile"] = name
	self.sv.profileKeys[charKey] = name

	-- populate to child namespaces
	if self.children then
		for _, db in pairs(self.children) do
			DBObjectLib.SetProfile(db, name)
		end
	end
	
	-- Callback: OnProfileChanged, database, newProfileKey
	self.callbacks:Fire("OnProfileChanged", self, name)
end

-- DBObject:GetProfiles(tbl)
-- tbl (table) - A table to store the profile names in (optional)
--
-- Returns a table with the names of the existing profiles in the database.
-- You can optionally supply a table to re-use for this purpose.
function DBObjectLib:GetProfiles(tbl)
	if tbl and type(tbl) ~= "table" then
		error("Usage: AceDBObject:GetProfiles(tbl): 'tbl' - table or nil expected.", 2)
	end

	-- Clear the container table
	if tbl then
		for k,v in pairs(tbl) do tbl[k] = nil end
	else
		tbl = {}
	end

	local curProfile = self.keys.profile
	
	local i = 0
	for profileKey in pairs(self.profiles) do
		i = i + 1
		tbl[i] = profileKey
		if curProfile and profileKey == curProfile then curProfile = nil end
	end

	-- Add the current profile, if it hasn't been created yet
	if curProfile then
		i = i + 1
		tbl[i] = curProfile
	end
	
	return tbl, i
end

-- DBObject:GetCurrentProfile()
--
-- Returns the current profile name used by the database
function DBObjectLib:GetCurrentProfile()
	return self.keys.profile
end

-- DBObject:DeleteProfile(name)
-- name (string) - The name of the profile to be deleted
--
-- Deletes a named profile.  This profile must not be the active profile.
function DBObjectLib:DeleteProfile(name, silent)
	if type(name) ~= "string" then
		error("Usage: AceDBObject:DeleteProfile(name): 'name' - string expected.", 2)
	end
	
	if self.keys.profile == name then
		error("Cannot delete the active profile in an AceDBObject.", 2)
	end
	
	if not rawget(self.sv.profiles, name) and not silent then
		error("Cannot delete profile '" .. name .. "'. It does not exist.", 2)
	end
	
	self.sv.profiles[name] = nil
	
	-- populate to child namespaces
	if self.children then
		for _, db in pairs(self.children) do
			DBObjectLib.DeleteProfile(db, name, true)
		end
	end
	
	-- Callback: OnProfileDeleted, database, profileKey
	self.callbacks:Fire("OnProfileDeleted", self, name)
end

-- DBObject:CopyProfile(name)
-- name (string) - The name of the profile to be copied into the current profile
--
-- Copies a named profile into the current profile, overwriting any conflicting
-- settings.
function DBObjectLib:CopyProfile(name, silent)
	if type(name) ~= "string" then
		error("Usage: AceDBObject:CopyProfile(name): 'name' - string expected.", 2)
	end
	
	if name == self.keys.profile then
		error("Cannot have the same source and destination profiles.", 2)
	end
	
	if not rawget(self.sv.profiles, name) and not silent then
		error("Cannot copy profile '" .. name .. "'. It does not exist.", 2)
	end
	
	-- Reset the profile before copying
	DBObjectLib.ResetProfile(self)
	
	local profile = self.profile
	local source = self.sv.profiles[name]
	
	copyTable(source, profile)
	
	-- populate to child namespaces
	if self.children then
		for _, db in pairs(self.children) do
			DBObjectLib.CopyProfile(db, name, true)
		end
	end
	
	-- Callback: OnProfileCopied, database, sourceProfileKey
	self.callbacks:Fire("OnProfileCopied", self, name)
end

-- DBObject:ResetProfile()
-- noChildren (boolean) - if set to true, the reset will not be populated to the child namespaces of this DB object
--
-- Resets the current profile
function DBObjectLib:ResetProfile(noChildren)
	local profile = self.profile
	
	for k,v in pairs(profile) do
		profile[k] = nil
	end
	
	local defaults = self.defaults and self.defaults.profile
	if defaults then
		copyDefaults(profile, defaults)
	end
	
	-- populate to child namespaces
	if self.children and not noChildren then
		for _, db in pairs(self.children) do
			DBObjectLib.ResetProfile(db)
		end
	end
	
	-- Callback: OnProfileReset, database
	self.callbacks:Fire("OnProfileReset", self)
end

-- DBObject:ResetDB(defaultProfile)
-- defaultProfile (string) - The profile name to use as the default
--
-- Resets the entire database, using the string defaultProfile as the default
-- profile.
function DBObjectLib:ResetDB(defaultProfile)
	if defaultProfile and type(defaultProfile) ~= "string" then
		error("Usage: AceDBObject:ResetDB(defaultProfile): 'defaultProfile' - string or nil expected.", 2)
	end
	
	local sv = self.sv
	for k,v in pairs(sv) do
		sv[k] = nil
	end
	
	local parent = self.parent
	
	initdb(sv, self.defaults, defaultProfile, self)
	
	-- fix the child namespaces
	if self.children then
		if not sv.namespaces then sv.namespaces = {} end
		for name, db in pairs(self.children) do
			if not sv.namespaces[name] then sv.namespaces[name] = {} end
			initdb(sv.namespaces[name], db.defaults, self.keys.profile, db, self)
		end
	end
	
		-- Callback: OnDatabaseReset, database
	self.callbacks:Fire("OnDatabaseReset", self)
	-- Callback: OnProfileChanged, database, profileKey
	self.callbacks:Fire("OnProfileChanged", self, self.keys["profile"])
	
	return self
end

-- DBObject:RegisterNamespace(name [, defaults])
-- name (string) - The name of the new namespace
-- defaults (table) - A table of values to use as defaults
--
-- Creates a new database namespace, directly tied to the database.  This
-- is a full scale database in it's own rights other than the fact that
-- it cannot control its profile individually
function DBObjectLib:RegisterNamespace(name, defaults)
	if type(name) ~= "string" then
		error("Usage: AceDBObject:RegisterNamespace(name, defaults): 'name' - string expected.", 2)
	end
	if defaults and type(defaults) ~= "table" then
		error("Usage: AceDBObject:RegisterNamespace(name, defaults): 'defaults' - table or nil expected.", 2)
	end
	if self.children and self.children[name] then
		error ("Usage: AceDBObject:RegisterNamespace(name, defaults): 'name' - a namespace with that name already exists.", 2)
	end
	
	local sv = self.sv
	if not sv.namespaces then sv.namespaces = {} end
	if not sv.namespaces[name] then
		sv.namespaces[name] = {}
	end
	
	local newDB = initdb(sv.namespaces[name], defaults, self.keys.profile, nil, self)
	
	if not self.children then self.children = {} end
	self.children[name] = newDB
	return newDB
end

--[[-------------------------------------------------------------------------
	AceDB Exposed Methods
---------------------------------------------------------------------------]]

-- AceDB:New(name, defaults, defaultProfile)
-- name (table or string) - The name of variable, or table to use for the database
-- defaults (table) - A table of database defaults
-- defaultProfile (string) - The name of the default profile
--
-- Creates a new database object that can be used to handle database settings
-- and profiles.
function AceDB:New(tbl, defaults, defaultProfile)
	if type(tbl) == "string" then
		local name = tbl
		--CHANGED: get/set-global() aren't available, we'll just use _G[""]
		tbl = _G[name]
		if not tbl then
			tbl = {}
			_G[name] = tbl
		end
	end
	
	if type(tbl) ~= "table" then
		error("Usage: AceDB:New(tbl, defaults, defaultProfile): 'tbl' - table expected.", 2)
	end
	
	if defaults and type(defaults) ~= "table" then
		error("Usage: AceDB:New(tbl, defaults, defaultProfile): 'defaults' - table expected.", 2)
	end
	
	if defaultProfile and type(defaultProfile) ~= "string" then
		error("Usage: AceDB:New(tbl, defaults, defaultProfile): 'defaultProfile' - string expected.", 2)
	end
	
	return initdb(tbl, defaults, defaultProfile)
end

-- upgrade existing databases
for db in pairs(AceDB.db_registry) do
	if not db.parent then
		for name,func in pairs(DBObjectLib) do
			db[name] = func
		end
	else
		db.RegisterDefaults = DBObjectLib.RegisterDefaults
	end
end
-- Make Squared table ref local for performance
local Squared = Squared

-- If it doesn't already exist, make it

if not Squared.Profiles then Squared.Profiles = {active=0,names={},data={},perchar={}} end

-- Make utility functions local for performance
local pairs = pairs
local unpack = unpack
local tonumber = tonumber
local tostring = tostring
local towstring = towstring
local max = math.max
local min = math.min
local wstring_sub = wstring.sub
local wstring_format = wstring.format
local tinsert = table.insert
local tremove = table.remove

-- generic deepcopy
local function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return new_table
    end
    return _copy(object)
end

local function GetCurrentSlot()
	for k,v in pairs(GameData.Account.CharacterSlot) do
		if v.Name == GameData.Player.name then
			return k
		end
	end
	return nil
end

local swappingProfile = false -- This is a flag to disable the below function while changing profiles
function Squared.UpdateActiveProfile(key, value)
	if swappingProfile then return end
	if key then
		Squared.Profiles.data[Squared.Profiles.active][key] = value
	end
end

function Squared.ResetActiveProfile()
	if Squared.Profiles and Squared.Profiles.data and Squared.Profiles.data[Squared.Profiles.active] then
		Squared.Profiles.data[Squared.Profiles.active] = deepcopy(Squared.Defaults)
	end
end

-- Initialize the profile system (called from Squared.OnLoad)
function Squared.InitProfiles()
    if Squared.Profiles.active == 0 then
		-- Empty profiles table - initialize the 'default' profile
		Squared.Profiles.active = Squared.AddProfile(L"default")
		local slot = GetCurrentSlot()
		if not slot then d("Couldn't figure out what character slot this is!") return end
		Squared.Profiles.perchar[slot] = L"default"
	else
		-- Non-empty profiles table - check for smart activation
		local slot = GetCurrentSlot()
		local profile = Squared.Profiles.perchar[slot]
		if profile then
			Squared.ActivateProfile(profile)
		else
			Squared.Profiles.perchar[slot] = L"default"
			Squared.ActivateProfile(L"default")
		end
	end
	
	-- Don't register this until after initially activating whatever profile we want
	Squared.RegisterEventHandler("setsetting", Squared.UpdateActiveProfile)
end

function Squared.AddProfile(name, source)
	local sourceId = nil
	
	-- First check to see if we're adding a profile which already exists,
	-- if we are then just return that profile's id
	for k,v in ipairs(Squared.Profiles.names) do
		if v == name then return k end
		-- Might as well find the source Id while we're at it
		if v == source then sourceId = k end
	end
	
	-- If it doesn't exist, add it
	tinsert(Squared.Profiles.names, name)
	local data = Squared.GetProfileData(sourceId)
	if data then
		tinsert(Squared.Profiles.data, data)
	else
		tinsert(Squared.Profiles.data, deepcopy(Squared.Defaults))
		local id = #Squared.Profiles.data
		for k,v in pairs(Squared.Settings) do
			Squared.Profiles.data[id][k] = deepcopy(v)
		end
	end
	
	return #Squared.Profiles.names
end

function Squared.GetProfileData(source)
	-- If specified by name, look up the id
	if type(source) == "wstring" then
		for k,v in ipairs(Squared.Profiles.names) do
			if v == source then
				source = k
				break
			end
		end
	end
	
	if type(source) == "number" then
		return deepcopy(Squared.Profiles.data[source])
	else
		-- invalid profile
		return nil
	end
end

function Squared.ActivateProfile(source, force)
	-- Find the profile if specified by name
	if type(source) == "wstring" then
		for k,v in ipairs(Squared.Profiles.names) do
			if v == source then source = k end
		end
	end
	
	if type(source) ~= "number" then return end
	
	local sourceName = Squared.Profiles.names[source]
	
	if not force and Squared.Profiles.active == source then return end
	
	local data = Squared.GetProfileData(source)
	if not data then return end
	
	Squared.Profiles.active = source
	swappingProfile = true
	Squared.MassSetSettings(data)
	swappingProfile = false
	
	local slot = GetCurrentSlot()
	if slot then
		Squared.Profiles.perchar[slot] = sourceName
	end
	
	return source
end

function Squared.GetProfileList()
	return deepcopy(Squared.Profiles.names)
end

function Squared.GetCurrentProfile()
	return Squared.Profiles.active, Squared.Profiles.names[Squared.Profiles.active]
end

function Squared.DeleteProfile(source)
	-- Find the profile if specified by name
	if type(source) == "wstring" then
		for k,v in ipairs(Squared.Profiles.names) do
			if v == source then source = k end
		end
	end
	
	if type(source) ~= "number" then return end
	
	-- Don't allow people to delete the default profile, or a nonexistant one
	if source < 2 or not Squared.Profiles.names[source] then return end
	
	local sourceName = Squared.Profiles.names[source]
	
	-- Remove the profile
	tremove(Squared.Profiles.names, source)
	tremove(Squared.Profiles.data, source)
	
	-- Swap any perchars which were the deleted profile back to default
	local slot = GetCurrentSlot()
	for k,v in pairs(Squared.Profiles.perchar) do
		if v == sourceName then
			Squared.Profiles.perchar[k] = L"default"
			-- If our current character was set to the deleted profile, activate default
			if k == slot then
				Squared.ActivateProfile(L"default")
			end
		end
	end
end
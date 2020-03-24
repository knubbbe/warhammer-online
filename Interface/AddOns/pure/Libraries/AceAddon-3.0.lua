-- WAR port of AceAddon - note that this cannot be run embedded.
--      We will however still utilize LibStub on the offchance some other copy of AceAddon-3.0 manages to exist.
local MAJOR, MINOR = "WAR-AceAddon-3.0", 1
local oldminor
AceAddon, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

if not AceAddon then return end -- No Upgrade needed.

local aceLoaded = false -- flag for whether we have loaded yet

AceAddon.addons = AceAddon.addons or {} -- addons in general
AceAddon.statuses = AceAddon.statuses or {} -- statuses of addon.
AceAddon.initializequeue = AceAddon.initializequeue or {} -- addons that are new and not initialized
AceAddon.enablequeue = AceAddon.enablequeue or {} -- addons that are initialized and waiting to be enabled
AceAddon.embeds = AceAddon.embeds or setmetatable({}, {__index = function(tbl, key) tbl[key] = {} return tbl[key] end }) -- contains a list of libraries embedded in an addon
AceAddon.updateRegistered = AceAddon.updateRegistered or false

local tinsert, tconcat, tremove = table.insert, table.concat, table.remove
local fmt = string.format
local pairs, next, type = pairs, next, type

local pcall = pcall

local function errorchecker(success, ...)
	if not success then
        d(...)
        return nil
    else
        return ...
    end
end
 
local function safecall(func, ...)
	return errorchecker(pcall(func, ...))
end

-- local functions that will be implemented further down
local Enable, Disable, EnableModule, DisableModule, Embed, NewModule, GetModule, GetName, SetDefaultModuleState, SetDefaultModuleLibraries, SetEnabledState, SetDefaultModulePrototype

-- used in the addon metatable
local function addontostring( self ) return self.name end 

-- AceAddon:NewAddon( [object, ]name, [lib, lib, lib, ...] ) 
-- [object] (table) - table to use as the base for the addon
-- name (string) - unique addon object name
-- [lib] (string) - optional libs to embed in the addon object
--
-- returns the addon object when succesful
function AceAddon:NewAddon(objectorname, ...)
	local object,name
	local i=1
	if type(objectorname)=="table" then
		object=objectorname
		name=...
		i=2
	else
		name=objectorname
	end
	if type(name)~="string" then
		error(("Usage: NewAddon([object,] name, [lib, lib, lib, ...]): 'name' - string expected got '%s'."):format(type(name)), 2)
	end
	if self.addons[name] then 
		error(("Usage: NewAddon([object,] name, [lib, lib, lib, ...]): 'name' - Addon '%s' already exists."):format(name), 2)
	end
	
	object = object or {}
	object.name = name

	local addonmeta = {}
	local oldmeta = getmetatable(object)
	if oldmeta then
		for k, v in pairs(oldmeta) do addonmeta[k] = v end
	end
	addonmeta.__tostring = addontostring
	
	setmetatable( object, addonmeta )
	self.addons[name] = object
	object.modules = {}
	object.defaultModuleLibraries = {}
	Embed( object ) -- embed NewModule, GetModule methods
	self:EmbedLibraries(object, select(i,...))
	
	-- add to queue of addons to be initialized upon ADDON_LOADED
	tinsert(self.initializequeue, object)
	return object
end


-- AceAddon:GetAddon( name, [silent])
-- name (string) - unique addon object name
-- silent (boolean) - if true, addon is optional, silently return nil if its not found
--
-- throws an error if the addon object can not be found (except silent is set)
-- returns the addon object if found
function AceAddon:GetAddon(name, silent)
	if not silent and not self.addons[name] then
		error(("Usage: GetAddon(name): 'name' - Cannot find an AceAddon '%s'."):format(tostring(name)), 2)
	end
	return self.addons[name]
end

-- AceAddon:EmbedLibraries( addon, [lib, lib, lib, ...] )
-- addon (object) - addon to embed the libs in
-- [lib] (string) - optional libs to embed
function AceAddon:EmbedLibraries(addon, ...)
	for i=1,select("#", ... ) do
		local libname = select(i, ...)
		self:EmbedLibrary(addon, libname, false, 4)
	end
end

-- AceAddon:EmbedLibrary( addon, libname, silent, offset )
-- addon (object) - addon to embed the libs in
-- libname (string) - lib to embed
-- [silent] (boolean) - optional, marks an embed to fail silently if the library doesn't exist.
-- [offset] (number) - will push the error messages back to said offset defaults to 2
function AceAddon:EmbedLibrary(addon, libname, silent, offset)
	local lib = LibStub:GetLibrary(libname, true)
	if not lib and not silent then
		error(("Usage: EmbedLibrary(addon, libname, silent, offset): 'libname' - Cannot find a library instance of %q."):format(tostring(libname)), offset or 2)
	elseif lib and type(lib.Embed) == "function" then
		lib:Embed(addon)
		tinsert(self.embeds[addon], libname)
		return true
	elseif lib then
		error(("Usage: EmbedLibrary(addon, libname, silent, offset): 'libname' - Library '%s' is not Embed capable"):format(libname), offset or 2)
	end
end

-- addon:GetModule( name, [silent])
-- name (string) - unique module object name
-- silent (boolean) - if true, module is optional, silently return nil if its not found
--
-- throws an error if the addon object can not be found (except silent is set)
-- returns the module object if found
function GetModule(self, name, silent)
	if not self.modules[name] and not silent then
		error(("Usage: GetModule(name, silent): 'name' - Cannot find module '%s'."):format(tostring(name)), 2)
	end
	return self.modules[name]
end

local function IsModuleTrue(self) return true end

-- addon:NewModule( name, [prototype, [lib, lib, lib, ...] )
-- name (string) - unique module object name for this addon
-- prototype (object) - object to derive this module from, methods and values from this table will be mixed into the module, if a string is passed a lib is assumed
-- [lib] (string) - optional libs to embed in the addon object
--
-- returns the addon object when succesful
function NewModule(self, name, prototype, ...)
	if type(name) ~= "string" then error(("Usage: NewModule(name, [prototype, [lib, lib, lib, ...]): 'name' - string expected got '%s'."):format(type(name)), 2) end
	if type(prototype) ~= "string" and type(prototype) ~= "table" and type(prototype) ~= "nil" then error(("Usage: NewModule(name, [prototype, [lib, lib, lib, ...]): 'prototype' - table (prototype), string (lib) or nil expected got '%s'."):format(type(prototype)), 2) end
	
	if self.modules[name] then error(("Usage: NewModule(name, [prototype, [lib, lib, lib, ...]): 'name' - Module '%s' already exists."):format(name), 2) end
	
	-- modules are basically addons. We treat them as such. They will be added to the initializequeue properly as well.
	-- NewModule can only be called after the parent addon is present thus the modules will be initialized after their parent is.
	local module = AceAddon:NewAddon(fmt("%s_%s", self.name or tostring(self), name))
	
	module.IsModule = IsModuleTrue
	module:SetEnabledState(self.defaultModuleState)
	module.moduleName = name

	if type(prototype) == "string" then
		AceAddon:EmbedLibraries(module, prototype, ...)
	else
		AceAddon:EmbedLibraries(module, ...)
	end
	AceAddon:EmbedLibraries(module, unpack(self.defaultModuleLibraries))

	if not prototype or type(prototype) == "string" then
		prototype = self.defaultModulePrototype or nil
	end
	
	if type(prototype) == "table" then
		local mt = getmetatable(module)
		mt.__index = prototype
		setmetatable(module, mt)  -- More of a Base class type feel.
	end
	
	safecall(self.OnModuleCreated, self, module) -- Was in Ace2 and I think it could be a cool thing to have handy.
	self.modules[name] = module
	
	return module
end

--addon:GetName()
-- Returns the real name of the addon or module, without any prefix
function GetName(self)
	return self.moduleName or self.name
end

--addon:Enable()
-- Enables the Addon if possible, return true or false depending on success
function Enable(self)
	self:SetEnabledState(true)
	return AceAddon:EnableAddon(self)
end

--addon:Disable()
-- Disables the Addon if possible, return true or false depending on success
function Disable(self)
	self:SetEnabledState(false)
	return AceAddon:DisableAddon(self)
end

-- addon:EnableModule( name )
-- name (string) - unique module object name
--
-- Enables the Module if possible, return true or false depending on success
function EnableModule(self, name)
	local module = self:GetModule( name )
	return module:Enable()
end

-- addon:DisableModule( name )
-- name (string) - unique module object name
--
-- Disables the Module if possible, return true or false depending on success
function DisableModule(self, name)
	local module = self:GetModule( name )
	return module:Disable()
end

-- addon:SetDefaultModuleLibraries( [lib, lib, lib, ...]  )
-- [lib] (string) - libs to embed in every module
function SetDefaultModuleLibraries(self, ...)
	if next(self.modules) then
		error("Usage: SetDefaultModuleLibraries(...): cannot change the module defaults after a module has been registered.", 2)
	end
	self.defaultModuleLibraries = {...}
end

-- addon:SetDefaultModuleState( state )
-- state (boolean) - default state for new modules (enabled=true, disabled=false)
function SetDefaultModuleState(self, state)
	if next(self.modules) then
		error("Usage: SetDefaultModuleState(state): cannot change the module defaults after a module has been registered.", 2)
	end
	self.defaultModuleState = state
end

-- addon:SetDefaultModulePrototype( prototype )
-- prototype (string or table) - the default prototype to use if none is specified on module creation
function SetDefaultModulePrototype(self, prototype)
	if next(self.modules) then
		error("Usage: SetDefaultModulePrototype(prototype): cannot change the module defaults after a module has been registered.", 2)
	end
	if type(prototype) ~= "table" then
		error(("Usage: SetDefaultModulePrototype(prototype): 'prototype' - table expected got '%s'."):format(type(prototype)), 2)
	end
	self.defaultModulePrototype = prototype
end

-- addon:SetEnabledState ( state )
-- state ( boolean ) - set the state of an addon or module  (enabled=true, disabled=false)
--
-- should only be called before any Enabling actually happend, aka in OnInitialize
function SetEnabledState(self, state)
	self.enabledState = state
end


local function IterateModules(self) return pairs(self.modules) end
local function IterateEmbeds(self) return pairs(AceAddon.embeds[self]) end
local function IsEnabled(self) return self.enabledState end
local mixins = {
	NewModule = NewModule,
	GetModule = GetModule,
	Enable = Enable,
	Disable = Disable,
	EnableModule = EnableModule,
	DisableModule = DisableModule,
	IsEnabled = IsEnabled,
	SetDefaultModuleLibraries = SetDefaultModuleLibraries,
	SetDefaultModuleState = SetDefaultModuleState,
	SetDefaultModulePrototype = SetDefaultModulePrototype,
	SetEnabledState = SetEnabledState,
	IterateModules = IterateModules,
	IterateEmbeds = IterateEmbeds,
	GetName = GetName,
}
local function IsModule(self) return false end
local pmixins = {
	defaultModuleState = true,
	enabledState = true,
	IsModule = IsModule,
}
-- Embed( target )
-- target (object) - target object to embed aceaddon in
--
-- this is a local function specifically since it's meant to be only called internally
function Embed(target)
	for k, v in pairs(mixins) do
		target[k] = v
	end
	for k, v in pairs(pmixins) do
		target[k] = target[k] or v
	end
end


-- AceAddon:IntializeAddon( addon )
-- addon (object) - addon to intialize
--
-- calls OnInitialize on the addon object if available
-- calls OnEmbedInitialize on embedded libs in the addon object if available
function AceAddon:InitializeAddon(addon)
	safecall(addon.OnInitialize, addon)
	
	local embeds = self.embeds[addon]
	for i = 1, #embeds do
		local lib = LibStub:GetLibrary(embeds[i], true)
		if lib then safecall(lib.OnEmbedInitialize, lib, addon) end
	end
	
	-- we don't call InitializeAddon on modules specifically, this is handled
	-- from the event handler and only done _once_
end

-- AceAddon:EnableAddon( addon )
-- addon (object) - addon to enable
--
-- calls OnEnable on the addon object if available
-- calls OnEmbedEnable on embedded libs in the addon object if available
function AceAddon:EnableAddon(addon)
	if type(addon) == "string" then addon = AceAddon:GetAddon(addon) end
	if self.statuses[addon.name] or not addon.enabledState then return false end
	
	-- set the statuses first, before calling the OnEnable. this allows for Disabling of the addon in OnEnable.
	self.statuses[addon.name] = true
	
	-- TODO: handle 'first'? Or let addons do it on their own?
	safecall(addon.OnEnable, addon)
	
	-- make sure we're still enabled before continueing
	if self.statuses[addon.name] then
		local embeds = self.embeds[addon]
		for i = 1, #embeds do
			local lib = LibStub:GetLibrary(embeds[i], true)
			if lib then safecall(lib.OnEmbedEnable, lib, addon) end
		end
	
		-- enable possible modules.
		for name, module in pairs(addon.modules) do
			self:EnableAddon(module)
		end
	end
	return self.statuses[addon.name] -- return true if we're disabled
end

-- AceAddon:DisableAddon( addon )
-- addon (object|string) - addon to disable
--
-- calls OnDisable on the addon object if available
-- calls OnEmbedDisable on embedded libs in the addon object if available
function AceAddon:DisableAddon(addon)
	if type(addon) == "string" then addon = AceAddon:GetAddon(addon) end
	if not self.statuses[addon.name] then return false end
	
	-- set statuses first before calling OnDisable, this allows for aborting the disable in OnDisable.
	self.statuses[addon.name] = false
	
	safecall( addon.OnDisable, addon )
	
	-- make sure we're still disabling...
	if not self.statuses[addon.name] then 
		local embeds = self.embeds[addon]
		for i = 1, #embeds do
			local lib = LibStub:GetLibrary(embeds[i], true)
			if lib then safecall(lib.OnEmbedDisable, lib, addon) end
		end
		-- disable possible modules.
		for name, module in pairs(addon.modules) do
			self:DisableAddon(module)
		end
	end
	
	return not self.statuses[addon.name] -- return true if we're disabled
end

--The next few funcs are just because no one should be reaching into the internal registries
--Thoughts?
function AceAddon:IterateAddons() return pairs(self.addons) end
function AceAddon:IterateEmbedsOnAddon(addon) return pairs(self.embeds[addon]) end
function AceAddon:IterateAddonStatus() return pairs(self.statuses) end
function AceAddon:IterateModulesOfAddon(addon) return pairs(addon.modules) end

if AceAddon.updateRegistered == false then
    RegisterEventHandler(SystemData.Events.UPDATE_PROCESSED, "AceAddon_OnUpdate_DONOTTOUCH")
    AceAddon.updateRegistered = true
end

function AceAddon_OnUpdate_DONOTTOUCH()
    if (not aceLoaded) and (SystemData.LoadingData.isLoading == false) then
        AceAddon.InitEnable()
        AceAddon_OnUpdate_DONOTTOUCH = function() return end
    elseif aceLoaded then
        AceAddon_OnUpdate_DONOTTOUCH = function() return end
    end
end

function AceAddon.InitEnable()
    
    while(#AceAddon.initializequeue > 0) do
        local addon = tremove(AceAddon.initializequeue, 1)
        AceAddon:InitializeAddon(addon)
        tinsert(AceAddon.enablequeue, addon)
    end
    
    while(#AceAddon.enablequeue > 0) do
        local addon = tremove(AceAddon.enablequeue, 1)
        AceAddon:EnableAddon(addon)
    end
    
    aceLoaded = true
    
end

-- upgrade embeded
for name, addon in pairs(AceAddon.addons) do
	Embed(addon)
end
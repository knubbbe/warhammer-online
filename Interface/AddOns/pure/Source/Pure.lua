--[[
	This application is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    The applications is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with the applications.  If not, see <http://www.gnu.org/licenses/>.
--]]

if not Pure then Pure = {} end

local pairs 		= pairs
local ipairs		= ipairs
local tonumber 		= tonumber
local tostring 		= tostring
local towstring 	= towstring
local tinsert		= table.insert
local tsort			= table.sort
local tconcat		= table.concat
local string_format = string.format

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local alpha = false
--[===[@alpha@
alpha = true
--@end-alpha@]===]

local T 				= LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )
local CallbackHandler	= LibStub( "WAR-CallbackHandler-1.0" )
local LSA				= LibStub( "LibSharedAssets" )

local db ---				= LibStub( "WAR-AceDB-3.0" ) : New( "PureDB", Pure.DefaultSettings, "Default" )
local dbOptions --			= LibStub( "WAR-AceDBOptions-3.0" ) : GetOptionsTable( db )

local VERSION 			= { MAJOR = 1, MINOR = 2, REV = 5 }
local DisplayVersion 	= string.format( "%d.%d.%d", VERSION.MAJOR, VERSION.MINOR, VERSION.REV )

if( debug ) then
	DisplayVersion 			= DisplayVersion .. " Dev"
else
	DisplayVersion 			= DisplayVersion .. " r" .. ( tonumber( "232" ) or 0 )
	
	if( alpha ) then
		DisplayVersion = DisplayVersion .. "-alpha"
	end
end

local firstLoad 				= true
local runtimeSettings			= {}
local dispellableDebuff 		= {}

local defaultTextureName		= "PureBar"
local defaultTextureSize		= { 256, 32 }

local hitPointsTextureName		= defaultTextureName
local hitPointsTextureSize		= defaultTextureSize

local actionPointsTextureName	= defaultTextureName
local actionPointsTextureSize	= defaultTextureSize

Pure.dispelTargetType = 
{
	ALL			= 1,
	SELF		= 2,
	FRIENDLY	= 3,
	HOSTILE		= 4,
}

local careerArchSettings 		= {}
local careerPetClasses 			= {}

function Pure.GetVersion()
	return DisplayVersion
end

Pure.ResetAnchor =
{
	RelativeTo 		= "Root",
	RelativePoint	= "center",
	Point 			= "center",
	XOffset 		= 0,
	YOffset 		= 0 ,
}

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

function Pure.CopyTable( t )
	return deepcopy( t )
end 
 
function Pure.GetDB() return db end

function Pure.OnInitialize()
	-- Create our configuration objects
	db				= LibStub( "WAR-AceDB-3.0" ) : New( "PureDB", Pure.DefaultSettings, "Default" )
	dbOptions		= LibStub( "WAR-AceDBOptions-3.0" ) : GetOptionsTable( db )
	dbOptions.args = {} -- We do not use these args, so free up the mem

	-- Preloading profile update
	Pure.PreLoadProfileUpdate()
		
	RegisterEventHandler( SystemData.Events.RELOAD_INTERFACE, "Pure.OnLoad" )
	RegisterEventHandler( SystemData.Events.LOADING_END, "Pure.OnLoad" )
end

function Pure.OnLoad()
	if( firstLoad ) then
		--[[
		if( alpha ) then
			 DialogManager.MakeOneButtonDialog( L"You are running an alpha version of Pure.  Use at your own risk.", L"Ok", nil )
		end
		--]]
		
		-- Register a callback to know if the profile changes
		db.RegisterCallback( Pure, "OnProfileChanged", Pure.OnProfileChanged )
		db.RegisterCallback( Pure, "OnProfileCopied", Pure.OnProfileChanged )
		db.RegisterCallback( Pure, "OnProfileReset", Pure.OnProfileChanged )
		db.RegisterCallback( Pure, "OnDatabaseShutdown", Pure.OnDatabaseShutdown )
		
		-- Register our slash commands with LibSlash
		Pure.Debug( "Registering slash commands" )
		
		-- Attempt to register one of our handlers
		if( LibSlash ~= nil and type( LibSlash.RegisterSlashCmd ) == "function" ) then
			LibSlash.RegisterSlashCmd( "pure", Pure.Slash )
			LibSlash.RegisterSlashCmd( "pureconfig", Pure.Slash )
			LibSlash.RegisterSlashCmd( "showpure", Pure.Slash )
		end
		
		-- Build our class maps
		Pure.GenerateClassMaps()
		
		-- Build our dispel table
		Pure.BuildDispelTable()
		
		-- Load our configuration window
		PureConfig.OnLoad( dbOptions )
		
		-- Load our unit frames
		Pure.LoadUnitFrames()
		
		-- Post loading profile update
		Pure.PostLoadProfileUpdate()
		
		-- Print our initialization usage
		local init = WStringToString( T["Pure %s initialized."] )
		Pure.Print( init:format( DisplayVersion ) )
		
		Pure.PrintActiveProfile()
		
		d( "Pure loaded." )
	
		firstLoad = false
	end
	
	--
	-- This is here to let the player frame know to update the players arch color(if necessary)
	--
	if( PurePlayer.IsLoaded() ) then
		PurePlayer.RefreshInformation()
	end
end

function Pure.OnDatabaseShutdown()
	Pure.UnloadUnitFrames()
end

function Pure.OnProfileChanged( eventName )
	Pure.UnloadUnitFrames()
	Pure.PreLoadProfileUpdate()
	Pure.LoadUnitFrames()
	Pure.PostLoadProfileUpdate()
	PureConfig.RevertDialog()
	if( eventName == "OnProfileChanged" )then Pure.PrintActiveProfile() end
end

function Pure.PreLoadProfileUpdate()
	local currentVersion = Pure.Get( "version" )
		
	--[[
		--This is no longer needed
	if( currentVersion < 000706 ) then
		DialogManager.MakeOneButtonDialog(
            L"Pure 0.7.6 now supports profiles.  Due to the changes old configuration information was not copied over.",
            L"Ok", nil)
    end
    --]]
end

function Pure.PostLoadProfileUpdate()
	local currentVersion = Pure.Get( "version" )
	
	-- Update our version for the current profile
	Pure.Set( "version", Version )
end

function Pure.PrintActiveProfile()
	local currentProfile	= dbOptions.handler:GetCurrentProfile()
	local wCurrentProfile	= dbOptions.handler:GetProfileDisplayName( currentProfile )
	local profile 			= wCurrentProfile or towstring( currentProfile )
	Pure.Print( L"(Pure) " .. T["Active Profile:"] .. L" '" .. profile .. L"'" )
end

function Pure.LoadUnitFrames()
	if( Pure.Get( "general-enable-addon" ) ) then
		-- Load our unit frame textures
		Pure.LoadUnitFrameTextures()
	
		PurePlayer.LoadUnitFrame()
		PurePlayerPet.LoadUnitFrame()
		PureTarget.LoadUnitFrame()
		PureTargetHUD.LoadUnitFrame()
		PureGroup.LoadUnitFrame()
		PureGroupPet.LoadUnitFrame()
		PurePlayerPetTarget.LoadUnitFrame()
	end
end

function Pure.UnloadUnitFrames()
	PurePlayer.UnloadUnitFrame()
	PurePlayerPet.UnloadUnitFrame()
	PureTarget.UnloadUnitFrame()
	PureTargetHUD.UnloadUnitFrame()
	PureGroup.UnloadUnitFrame()
	PureGroupPet.UnloadUnitFrame()
	PurePlayerPetTarget.UnloadUnitFrame()
end

function Pure.RefreshUnitFrames()
	Pure.UnloadUnitFrames()
	Pure.LoadUnitFrames()
end

function Pure.LoadUnitFrameTextures()
	if( LSA == nil ) then return end
	
	local hitPointsMeta
	local actionPointsMeta
	
	-- Load the hit points texture
	hitPointsTextureName 	= Pure.Get( "general-hitpoints-texture" )
	hitPointsMeta			= LSA:GetMetadata( hitPointsTextureName )
	
	if( hitPointsMeta ~= nil ) then
		hitPointsTextureSize = hitPointsMeta.size
	else
		Pure.Debug( "No meta found for hit points texture: " .. hitPointsTextureName )
		
		-- Use the default texture name/size
		hitPointsTextureName = defaultTextureName
		hitPointsTextureSize = defaultTextureSize
	end
	
	-- Load the action points texture
	actionPointsTextureName = Pure.Get( "general-actionpoints-texture" )
	actionPointsMeta		= LSA:GetMetadata( actionPointsTextureName )

	if( actionPointsMeta ~= nil ) then
		actionPointsTextureSize = actionPointsMeta.size
	else
		Pure.Debug( "No meta found for action points texture: " .. actionPointsTextureName )
		
		-- Use the default texture name/size
		actionPointsTextureName = defaultTextureName
		actionPointsTextureSize = defaultTextureSize
	end
end

function Pure.GetHitPointsTextureAndSize()
	return hitPointsTextureName, hitPointsTextureSize
end

function Pure.GetActionPointsTextureAndSize()
	return actionPointsTextureName, actionPointsTextureSize
end

function Pure.UpdateDispelTable( targetType, dispelTable, changedEffects, isFullList )
	-- If we do not dispel anything get out fast
	if( dispellableDebuff[GameData.Player.career.line] == nil ) then return false, {} end

	local dispel = false
	
	if( isFullList ) then dispelTable = {} end
	
	-- Update the dispel table
	for effectIndex, effect in pairs( changedEffects )
	do
		-- If this is an outgoing buff, remove it from the table just incase it existed
		if( effect.name == nil ) then
			dispelTable[effectIndex] = nil
		else
			if( Pure.CheckDispels( targetType, effect ) ) then
				tinsert( dispelTable, effectIndex, effect.name )
			end
		end
	end
	
	local k,_ = next( dispelTable )
	return k ~= nil, dispelTable
end

function Pure.CheckDispels( targetType, effect )
	-- Get the type of effect this is
	local effectType = DataUtils.GetAbilityTypeText( effect )
	
	-- Get the target type, if any, this class can dispel for this effect type
	local dTT = dispellableDebuff[GameData.Player.career.line][effectType]
	
	if( dTT ~= nil ) then
		if( dTT == Pure.dispelTargetType.ALL ) 															then return true end
		if( dTT == Pure.dispelTargetType.SELF 		and targetType == Pure.dispelTargetType.SELF ) 		then return true end
		if( dTT == Pure.dispelTargetType.FRIENDLY 	and targetType == Pure.dispelTargetType.SELF ) 		then return true end
		if( dTT == Pure.dispelTargetType.FRIENDLY 	and targetType == Pure.dispelTargetType.FRIENDLY ) 	then return true end
		if( dTT == Pure.dispelTargetType.HOSTILE 	and targetType == Pure.dispelTargetType.HOSTILE ) 	then return true end
	end
	
	return false
end

function Pure.BuildDispelTable()
	local isHex 		= GetString( StringTables.Default.LABEL_ABILITY_TYPE_HEX )
	local isAilment 	= GetString( StringTables.Default.LABEL_ABILITY_TYPE_AILMENT )
	local isCurse		= GetString( StringTables.Default.LABEL_ABILITY_TYPE_CURSE )
	local isEnchantment	= GetString( StringTables.Default.LABEL_ABILITY_TYPE_ENCHANTMENT )
		
	-- Archmage
	dispellableDebuff[GameData.CareerLine.ARCHMAGE] = {}
	dispellableDebuff[GameData.CareerLine.ARCHMAGE][isHex]					= Pure.dispelTargetType.FRIENDLY
	dispellableDebuff[GameData.CareerLine.ARCHMAGE][isAilment]				= Pure.dispelTargetType.FRIENDLY
	
	if( Pure.Get( "debug" ) ) then
		dispellableDebuff[GameData.CareerLine.ARCHMAGE][isEnchantment]		= Pure.dispelTargetType.FRIENDLY
	end
	
	-- DoK
	-- 1.4 CODE
	if( GameData.CareerLine.DISCIPLE ~= nil ) then
		dispellableDebuff[GameData.CareerLine.DISCIPLE] = {}
		dispellableDebuff[GameData.CareerLine.DISCIPLE][isHex]				= Pure.dispelTargetType.FRIENDLY
		dispellableDebuff[GameData.CareerLine.DISCIPLE][isAilment]			= Pure.dispelTargetType.FRIENDLY
	else
		dispellableDebuff[GameData.CareerLine.BLOOD_PRIEST] = {}
		dispellableDebuff[GameData.CareerLine.BLOOD_PRIEST][isHex]				= Pure.dispelTargetType.FRIENDLY
		dispellableDebuff[GameData.CareerLine.BLOOD_PRIEST][isAilment]			= Pure.dispelTargetType.FRIENDLY
	end
	
	-- BW
	dispellableDebuff[GameData.CareerLine.BRIGHT_WIZARD] = {}
	dispellableDebuff[GameData.CareerLine.BRIGHT_WIZARD][isHex]				= Pure.dispelTargetType.SELF
	dispellableDebuff[GameData.CareerLine.BRIGHT_WIZARD][isAilment]			= Pure.dispelTargetType.SELF
	dispellableDebuff[GameData.CareerLine.BRIGHT_WIZARD][isCurse]			= Pure.dispelTargetType.SELF
	
	-- RP
	dispellableDebuff[GameData.CareerLine.RUNE_PRIEST] = {}
	dispellableDebuff[GameData.CareerLine.RUNE_PRIEST][isCurse]				= Pure.dispelTargetType.FRIENDLY
	dispellableDebuff[GameData.CareerLine.RUNE_PRIEST][isAilment]			= Pure.dispelTargetType.FRIENDLY
	
	-- Shaman
	dispellableDebuff[GameData.CareerLine.SHAMAN] = {}
	dispellableDebuff[GameData.CareerLine.SHAMAN][isCurse]					= Pure.dispelTargetType.FRIENDLY
	dispellableDebuff[GameData.CareerLine.SHAMAN][isAilment]				= Pure.dispelTargetType.FRIENDLY
	
	-- WP
	dispellableDebuff[GameData.CareerLine.WARRIOR_PRIEST] = {}
	dispellableDebuff[GameData.CareerLine.WARRIOR_PRIEST][isCurse]			= Pure.dispelTargetType.FRIENDLY
	dispellableDebuff[GameData.CareerLine.WARRIOR_PRIEST][isHex]			= Pure.dispelTargetType.FRIENDLY
	dispellableDebuff[GameData.CareerLine.WARRIOR_PRIEST][isEnchantment]	= Pure.dispelTargetType.HOSTILE
	
	-- Zealot
	dispellableDebuff[GameData.CareerLine.ZEALOT] = {}
	dispellableDebuff[GameData.CareerLine.ZEALOT][isCurse]					= Pure.dispelTargetType.FRIENDLY
	dispellableDebuff[GameData.CareerLine.ZEALOT][isHex]					= Pure.dispelTargetType.FRIENDLY
	
	-- SM
	dispellableDebuff[GameData.CareerLine.SWORDMASTER] = {}
	dispellableDebuff[GameData.CareerLine.SWORDMASTER][isEnchantment]		= Pure.dispelTargetType.HOSTILE
	
	-- Black Orc
	dispellableDebuff[GameData.CareerLine.BLACK_ORC] = {}
	dispellableDebuff[GameData.CareerLine.BLACK_ORC][isEnchantment]			= Pure.dispelTargetType.HOSTILE
	
	-- KotBS
	dispellableDebuff[GameData.CareerLine.KNIGHT] = {}
	dispellableDebuff[GameData.CareerLine.KNIGHT][isEnchantment]			= Pure.dispelTargetType.HOSTILE
	
	-- Blackguard
	-- 1.4 CODE
	if( GameData.CareerLine.BLACKGUARD ~= nil ) then
		dispellableDebuff[GameData.CareerLine.BLACKGUARD] = {}
		dispellableDebuff[GameData.CareerLine.BLACKGUARD][isEnchantment]				= Pure.dispelTargetType.HOSTILE
	else
		dispellableDebuff[GameData.CareerLine.SHADE] = {}
		dispellableDebuff[GameData.CareerLine.SHADE][isEnchantment]				= Pure.dispelTargetType.HOSTILE
	end
end		

function Pure.GetEffectWindowAnchor( windowId, location )
	local effectAnchor = {}
	
	effectAnchor.RelativeTo = windowId

	if( location == "top" ) then
		effectAnchor.Point 			= "topleft"
		effectAnchor.RelativePoint 	= "bottomleft"
		effectAnchor.XOffset		= 0
		effectAnchor.YOffset		= -1
	elseif( location == "left" ) then
		effectAnchor.Point 			= "bottomleft"
		effectAnchor.RelativePoint 	= "bottomright"
		effectAnchor.XOffset		= -2
		effectAnchor.YOffset		= 0
	elseif( location == "right" ) then
		effectAnchor.Point 			= "bottomright"
		effectAnchor.RelativePoint 	= "bottomleft"
		effectAnchor.XOffset		= 2
		effectAnchor.YOffset		= 0
	else
		effectAnchor.Point 			= "bottomleft"
		effectAnchor.RelativePoint 	= "topleft"
		effectAnchor.XOffset		= 0
		effectAnchor.YOffset		= 1
	end

	return effectAnchor
end

function Pure.GetGroupUnitFrameAnchor( windowId, location, xOffset, yOffset )
	local anchor = {}
	
	anchor.RelativeTo = windowId
	
	if( location == "up" ) then
		anchor.Point 			= "topleft"
		anchor.RelativePoint 	= "bottomleft"
		anchor.XOffset			= xOffset 
		anchor.YOffset			= yOffset * -1
	elseif( location == "left" ) then
		anchor.Point 			= "bottomleft"
		anchor.RelativePoint 	= "bottomright"
		anchor.XOffset			= xOffset * -1
		anchor.YOffset			= yOffset
	elseif( location == "right" ) then
		anchor.Point 			= "bottomright"
		anchor.RelativePoint 	= "bottomleft"
		anchor.XOffset			= xOffset 
		anchor.YOffset			= yOffset
	else
		anchor.Point 			= "bottomleft"
		anchor.RelativePoint 	= "topleft"
		anchor.XOffset			= xOffset
		anchor.YOffset			= yOffset
	end

	return anchor
end

function Pure.GetHUDFrameAnchor( windowId, location, xOffset, yOffset )
	local anchor = {}
	
	anchor.RelativeTo = windowId
	
	if( location == "top" ) then
		anchor.Point 			= "top"
		anchor.RelativePoint 	= "bottom"
		anchor.XOffset			= xOffset 
		anchor.YOffset			= yOffset * -1
	elseif( location == "left" ) then
		anchor.Point 			= "left"
		anchor.RelativePoint 	= "right"
		anchor.XOffset			= xOffset * -1
		anchor.YOffset			= yOffset
	elseif( location == "right" ) then
		anchor.Point 			= "right"
		anchor.RelativePoint 	= "left"
		anchor.XOffset			= xOffset 
		anchor.YOffset			= yOffset
	else
		anchor.Point 			= "bottom"
		anchor.RelativePoint 	= "top"
		anchor.XOffset			= xOffset
		anchor.YOffset			= yOffset
	end

	return anchor
end

function Pure.GetCareerLineColor( careerLine )
	local default = {255,255,255}
	local color = {255,255,255}

	if( careerArchSettings[careerLine] == nil ) then return default end

	-- Attempt to pull the color from squared if it exists
	if( Pure.Get( "general-use-squared-archtype-color" ) and Squared ~= nil and type( Squared.GetSetting ) == "function" ) then
		local archetype = Squared.GetSetting( careerArchSettings[careerLine] )
        if archetype then
        	--Pure.Debug( "Color pulled from Squared." )
            color = Squared.GetSetting( "colorgroup-"..archetype ) or default
        end
    else
    	local archetype = Pure.Get( careerArchSettings[careerLine] )
        if archetype then
        	--Pure.Debug( "Color pulled from Pure." )
            color = Pure.Get( "colorgroup-" .. archetype ) or default
        end
	end
	
	return color
end

function Pure.IsCareerPetClass( career )
	return careerPetClasses[career] ~= nil
end

function Pure.GetCareerPetHeal( career )
	local abilityId
	if( careerPetClasses[career] ~= nil and careerPetClasses[career].healAbilityId ~= nil ) then
		abilityId = careerPetClasses[career].healAbilityId
	end
	return abilityId
end

local recursions = {}
local function better_toString(data, depth)
    if type(data) == "string" then
        return ("%q"):format(data)
    elseif type(data) == "wstring" then
        return ("w%q"):format(WStringToString(data))
    elseif type(data) ~= "table" then
        return ("%s"):format(tostring(data))
    else
        if recursions[data] then
            return "{<recursive table>}"
        end
        recursions[data] = true
        if next(data) == nil then
            return "{}"
        elseif next(data, next(data)) == nil then
            return "{ [" .. better_toString(next(data), depth) .. "] = " .. better_toString(select(2, next(data)), depth) .. " }"
        else
            local t = {}
            t[#t+1] = "{\n"
            local keys = {}
            for k in pairs(data) do
                keys[#keys+1] = k
            end
            tsort(keys, mysort)
            for _, k in ipairs(keys) do
                local v = data[k]
                for i = 1, depth do
                    t[#t+1] = "    "
                end
                t[#t+1] = "["
                t[#t+1] = better_toString(k, depth+1)
                t[#t+1] = "] = "
                t[#t+1] = better_toString(v, depth+1)
                t[#t+1] = ",\n"
            end
            
            for i = 1, depth do
                t[#t+1] = "    "
            end
            t[#t+1] = "}"
            return tconcat(t)
        end
    end
end

local function pformat(...)
    local n = select('#', ...)
    local t = {'value: '}
    for i = 1, n do
        if i > 1 then
            t[#t+1] = ", "
        end
        t[#t+1] = better_toString((select(i, ...)), 0)
    end
    for k in pairs(recursions) do
        recursions[k] = nil
    end
    return tconcat(t), n
end

function Pure.Slash( input )
	local opt, val = input:match("([a-z0-9_-]+)[ ]?(.*)")
	
	if( opt ) then
		-- options handler
        if opt == "options" then
        	local optString = nil
            for k,_ in pairs( runtimeSettings ) do
                if not k:find("anchor") and (not val or val == "" or k:find(val)) then
                    if optString then
                        optString = optString .. ", " .. k
                    else
                        optString = k
                    end
                end
            end
            if optString then
                if not val or val == "" then
                    Pure.Print("[Pure] Currently known options: "..optString.." (Use '/Pure options <searchtext>' to filter.)")
                else
                    Pure.Print("[Pure] Currently known options matching '"..val.."': "..optString)
                end
            else
               Pure.Print("[Pure] No options have been modified from defaults.")
            end
            return
        end
        
        if( not val or val == "" ) then
			Pure.Print( "[Pure] '" .. opt .. "' has " .. pformat( Pure.Get( opt ) ) .. "'" )
		else
			local oldSetting = Pure.Get(opt)
            if type(oldSetting) == "number" then
                val = tonumber(val)
                if val then Pure.Set(opt, val) end
            elseif type(oldSetting) == "boolean" then
                if val == "true" or val == "1" or val == "yes" or val == "on" then
                    Pure.Set(opt, true)
                elseif val == "toggle" then
                    Pure.Set(opt, not oldSetting)
                else
                    Pure.Set(opt, false)
                end
            elseif type(oldSetting) == "wstring" then
                Pure.Set(opt, towstring(val))
            elseif type(oldSetting) == "string" then
                Pure.Set(opt, val)
            elseif type(oldSetting) == "table" then
                local tab = {}
                for word in val:gmatch("%w+") do
                    if tonumber(word) then
                        tinsert(tab, tonumber(word))
                    else
                        tinsert(tab, word)
                    end
                end
                Pure.Set(opt, tab)
            else
                -- if we can't figure out something else, then see if the input could be a number, if so set it that way
                -- otherwise, set it to just the string
                if tonumber(val) then
                    Pure.Set(opt, tonumber(val))
                else
                    Pure.Set(opt, val)
                end
            end
            
            Pure.Print( "[Pure] '" ..opt.. "' set ".. pformat( Pure.Get( opt ) ) )
            
            if( opt ~= "debug" ) then
            	Pure.RefreshUnitFrames()
            end
		end
	else
		Pure.ToggleConfig()
	end
end

function Pure.ToggleConfig()
	if( DoesWindowExist( PureConfig.GetWindowName() ) ) then
		WindowSetShowing( PureConfig.GetWindowName(), not WindowGetShowing( PureConfig.GetWindowName() ) )
	else
		Pure.Print("[Pure] is installed. Use '/pure <option>' to view a setting, and '/pure <option> <value>' to change one. To get a list of known options, use '/pure options'.")		
	end
end

function Pure.Get( key )
	if( db.profile[key] == nil ) then
		d( "Pure.Get called with key that is nil:" .. tostring( key ) )
	end
	
	return db.profile[key]
end

function Pure.GetDefault( key )
	if( Pure.DefaultSettings.profile[key] == nil ) then
		d( "Pure.Get called with key that is nil:" .. tostring( key ) )
	end
	
	return Pure.DefaultSettings.profile[key]
end

function Pure.Set( key, value )
	if( db.profile[key] == nil ) then
		d( "Pure.Set called with key that is nil:" .. tostring( key ) )
	end

	db.profile[key] = value
end

function Pure.Print( wstr )
	EA_ChatWindow.Print( towstring( wstr ), ChatSettings.Channels[SystemData.ChatLogFilters.SAY].id )
end

function Pure.Debug(str)
	if( Pure.Get( "debug" ) ) then
	 	DEBUG(towstring(str))
	end
end

function Pure.GenerateClassMaps()
-- Part of the career coloring scheme borrowed from Squared
-- to help keep the 2 UFs consistant with one another
careerArchSettings = {
   [GameData.CareerLine.IRON_BREAKER] = "colortype-ironbreaker",
   [GameData.CareerLine.SWORDMASTER] = "colortype-swordmaster",
   [GameData.CareerLine.CHOSEN] = "colortype-chosen",
   [GameData.CareerLine.BLACK_ORC] = "colortype-blackorc",
   [GameData.CareerLine.WITCH_HUNTER] = "colortype-witchhunter",
   [GameData.CareerLine.WHITE_LION or GameData.CareerLine.SEER] = "colortype-whitelion",				-- 1.3.6 527
   [GameData.CareerLine.MARAUDER or GameData.CareerLine.WARRIOR] = "colortype-marauder",				-- 1.3.6 527
   [GameData.CareerLine.WITCH_ELF or GameData.CareerLine.ASSASSIN] = "colortype-witchelf",				-- 1.3.6 527
   [GameData.CareerLine.BRIGHT_WIZARD] = "colortype-brightwizard",
   [GameData.CareerLine.MAGUS] = "colortype-magus",
   [GameData.CareerLine.SORCERER] = "colortype-sorcerer",
   [GameData.CareerLine.ENGINEER] = "colortype-engineer",
   [GameData.CareerLine.SHADOW_WARRIOR] = "colortype-shadowwarrior",
   [GameData.CareerLine.SQUIG_HERDER] = "colortype-squigherder",
   [GameData.CareerLine.WARRIOR_PRIEST] = "colortype-warriorpriest",
   [GameData.CareerLine.DISCIPLE or GameData.CareerLine.BLOOD_PRIEST] = "colortype-discipleofkhaine",	-- 1.3.6 527
   [GameData.CareerLine.ARCHMAGE] = "colortype-archmage",
   [GameData.CareerLine.SHAMAN] = "colortype-shaman",
   [GameData.CareerLine.RUNE_PRIEST] = "colortype-runepriest",
   [GameData.CareerLine.ZEALOT] = "colortype-zealot",
   [GameData.CareerLine.KNIGHT] = "colortype-kotbs",
   [GameData.CareerLine.BLACKGUARD or GameData.CareerLine.SHADE] = "colortype-blackguard",				-- 1.3.6 527
   [GameData.CareerLine.CHOPPA] = "colortype-choppa",
   [GameData.CareerLine.SLAYER or GameData.CareerLine.HAMMERER] = "colortype-slayer",
}

careerPetClasses = {
   [GameData.CareerLine.WHITE_LION or GameData.CareerLine.SEER] 			= { healAbilityId=9164, },
   [GameData.CareerLine.MAGUS] 			= { healAbilityId=8473, },
   [GameData.CareerLine.ENGINEER] 		= { healAbilityId=1512, },
   [GameData.CareerLine.SQUIG_HERDER] 	= { healAbilityId=1836, },
}
end

function Pure.FormatLargeValue( value )
	if value < 9999 then
		return tostring( value )
	elseif value < 999999 then
		return string_format( "%.1fk", value / 1000 )
	else
		return string_format( "%.2fm", value / 1000000 )
	end
end

-- Lua gmatch implementation from:
-- http://code.google.com/p/kahlua/
function Pure.gmatch( str, pattern )
    local init = 1
    local function gmatch_it()
        if init <= str:len() then 
            local s, e = str:find(pattern, init)
            if s then
                local res = {str:match(pattern, init)}
                init = e+1
                return unpack(res)
            end
        end
    end
    return gmatch_it
end

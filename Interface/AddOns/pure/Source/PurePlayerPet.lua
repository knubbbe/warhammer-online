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

if not PurePlayerPet then PurePlayerPet = {} end

local PurePlayerPet = PurePlayerPet

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local c_PLAYER_PET_NAME_LENGTH 		= 24
local c_FRIENDLY_TARGET         	= "selffriendlytarget"

local frameObject					= PurePlayerPetUnitFrame
local frameType						= "PurePlayerPet_Default"
local windowId 						= "PurePlayerPetUnitFrame"
local unitId						= "selfpetpure"
local petFrame						= nil

local bIsLoaded						= false
local clickHealRegistered			= false

if( PureTemplates ~= nil ) then 
	PureTemplates.RegisterTemplate( PureTemplates.Types.PLAYER_PET, frameType, frameObject, L"Pure - Default" ) 
end

function PurePlayerPet.IsLoaded() return bIsLoaded end

function PurePlayerPet.LoadUnitFrame()
	-- Only load if we are set to show
	if( not Pure.Get( "playerpet-frame-show" ) or bIsLoaded ) then return end
	
	-- Retrieve our template information
	local template = PureTemplates.GetTemplateByName( PureTemplates.Types.PLAYER_PET, Pure.Get( "playerpet-frame-template" ) )
	if( template ~= nil ) then
		frameObject 			= template.m_Frame
		frameType				= template.m_Type
		frameObject.m_Template 	= template.m_FrameType
	else
		d( "Pure player template(" .. tostring( Pure.Get( "playerpet-frame-template" ) ) .. ") not found.  Using default." )
	end
	
	-- Create our frame factory
	UnitFrames:AddFrameFactory( frameType, frameObject )
	
	-- Create the unit frame
	petFrame = UnitFrames:CreateNewFrame( windowId, frameType, unitId )
	
	-- Sanity check
	if( petFrame == nil ) then
		d( "Error creating Pure Player Pet frame from template: " .. frameType )
		return	
	end
	
	-- Update our show when interface hidden setting
	WindowSetDrawWhenInterfaceHidden( petFrame:GetName(), Pure.Get( "playerpet-frame-showinsiege" ) )
	
	-- Update the location of our player frame
	PurePlayerPet.UpdateWindowPosition()
	
	-- Load the unit frame
	petFrame:LoadUnitFrame()
	
	-- Initialize the frame with the first round of information
	PurePlayerPet.RefreshInformation()
	
	-- Register to know when the layout editor is complete
    local layoutEditorEventHandlerFound = false
    for k,v in pairs( LayoutEditor.EventHandlers )
    do
    	if( tostring( v ) == tostring( PurePlayerPet.OnLayoutEditorEnd ) ) then
    		layoutEditorEventHandlerFound = true
    	end
    end
    if( not layoutEditorEventHandlerFound ) then
    	table.insert( LayoutEditor.EventHandlers, PurePlayerPet.OnLayoutEditorEnd )
    end
	
	-- Register our event handlers
	RegisterEventHandler( SystemData.Events.PLAYER_PET_UPDATED, 			"PurePlayerPet.OnPlayerPetUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_PET_HEALTH_UPDATED, 		"PurePlayerPet.OnPlayerPetHealthUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_SINGLE_ABILITY_UPDATED, 	"PurePlayerPet.OnPlayerSingleAbilityUpdated" )
	
	-- Set our auto heal clicking
    if( not clickHealRegistered and Pure.Get( "playerpet-auto-heal-on-click" ) ) then
		local petHealAbility = Pure.GetCareerPetHeal( GameData.Player.career.line )
		if( petHealAbility ~= nil and Player.GetAbilityData( petHealAbility ) ~= nil ) then
			WindowSetGameActionData( petFrame:GetName(), GameData.PlayerActions.DO_ABILITY, petHealAbility, L"" )
			clickHealRegistered = true  
		end
	end
	
	-- The frame is now loaded	    
    bIsLoaded = true
end

function PurePlayerPet.UnloadUnitFrame()
	if( not bIsLoaded ) then return end
	bIsLoaded = false
	
	UnregisterEventHandler( SystemData.Events.PLAYER_PET_UPDATED, 				"PurePlayerPet.OnPlayerPetUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_PET_HEALTH_UPDATED, 		"PurePlayerPet.OnPlayerPetHealthUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_SINGLE_ABILITY_UPDATED, 	"PurePlayerPet.OnPlayerSingleAbilityUpdated" )
    
    -- Unload the unit frame
    LayoutEditor.UnregisterWindow( petFrame:GetName() )
	petFrame:UnloadUnitFrame()
	petFrame:Show( false )
	UnitFrames:DestroyFrame( unitId, UnitFrames.REMOVE_DESTROYED_FRAME )
	petFrame = nil
	hasPet = false
end

function PurePlayerPet.OnLayoutEditorEnd( exitCode )
	if( exitCode == LayoutEditor.EDITING_END ) then
        local anchor = {}
        anchor.Point, anchor.RelativePoint, anchor.RelativeTo, anchor.XOffset, anchor.YOffset = WindowGetAnchor( petFrame:GetName(), 1 )
        
        if( not DoesWindowExist( anchor.RelativeTo ) ) then
    		anchor = Pure.CopyTable( Pure.ResetAnchor )
    	end
        
		Pure.Set( "playerpet-anchor-point", anchor.Point )
        Pure.Set( "playerpet-anchor-relpoint", anchor.RelativePoint )
        Pure.Set( "playerpet-anchor-relwin", anchor.RelativeTo )
        Pure.Set( "playerpet-anchor-x", anchor.XOffset )
        Pure.Set( "playerpet-anchor-y", anchor.YOffset )
        Pure.Set( "playerpet-anchor-scale", petFrame:GetScale() )
        
        -- Reload the unit frame
        petFrame:UpdateLayout()
    end
    
    -- Refresh the unit frames information
    PurePlayerPet.RefreshInformation()
end

function PurePlayerPet.UpdateWindowPosition()
	-- Unregister from the layout editor
	LayoutEditor.UnregisterWindow( petFrame:GetName() )
	
	local anchor = {}
	anchor.Point 			= Pure.Get( "playerpet-anchor-point" )
	anchor.RelativeTo  		= Pure.Get( "playerpet-anchor-relwin" )
    anchor.RelativePoint	= Pure.Get( "playerpet-anchor-relpoint" )
    anchor.XOffset			= Pure.Get( "playerpet-anchor-x" )
    anchor.YOffset			= Pure.Get( "playerpet-anchor-y" )
    
	if( not DoesWindowExist( anchor.RelativeTo ) ) then
    	anchor = Pure.CopyTable( Pure.ResetAnchor )
    end

	-- Update the frame accordingly
	petFrame:SetAnchor( anchor )
	petFrame:SetScale( Pure.Get( "playerpet-anchor-scale" ) )
	petFrame:SetDimensions( Pure.Get("playerpet-anchor-dx"), Pure.Get( "playerpet-anchor-dy" ) )
	
	-- Register with the layout editor
   	LayoutEditor.RegisterWindow( petFrame:GetName(), T["Player Pet"] .. L" (Pure)", T["Player Pet"] .. L" (Pure)", false, false, false, nil )
end

function PurePlayerPet.RefreshInformation()
	PurePlayerPet.OnPlayerPetUpdated()
end

function PurePlayerPet.OnPlayerPetUpdated()
	if( petFrame == nil ) then return end
	
	local hasPet = PurePlayerPet.HasPet()
	
	if( hasPet ) then
		PurePlayerPet.UpdateInformation()
		PurePlayerPet.OnPlayerPetHealthUpdated()
		PurePlayerPet.UpdateLevel()
	end
	
	petFrame:Show( hasPet )
end

function PurePlayerPet.OnPlayerPetHealthUpdated()
	if( petFrame == nil ) then return end
	petFrame:UpdateHitPoints( GameData.Player.Pet.healthPercent )
end

function PurePlayerPet.UpdateLevel()
	if( petFrame == nil ) then return end
	petFrame:UpdateLevel( GameData.Player.Pet.level )
end

function PurePlayerPet.UpdateInformation()
	if( petFrame == nil ) then return end
	petFrame:UpdateInformation( GameData.Player.Pet.name )
end

function PurePlayerPet.HasPet()
    return GameData.Player.Pet.name ~= L""
end

function PurePlayerPet.OnRButtonDown( flags )
end

function PurePlayerPet.OnLButtonDown( flags )
	if( Pure.Get( "playerpet-clear-friendly-on-click" ) ) then
		-- Update our target info from the client
    	TargetInfo:UpdateFromClient()
    	
    	local entityId = TargetInfo:UnitEntityId( c_FRIENDLY_TARGET )
    	
    	-- If we are not targetting our pet, clear our target
    	if( entityId ~= GameData.Player.Pet.objNum ) then
			ClearTarget( GameData.TargetType.FRIENDLY )
		end 
	end
end

function PurePlayerPet.OnPlayerSingleAbilityUpdated( ability )
	if( not clickHealRegistered and Pure.Get( "playerpet-auto-heal-on-click" ) ) then
		local petHealAbility = Pure.GetCareerPetHeal( GameData.Player.career.line )
		if( petHealAbility ~= nil and ability == petHealAbility ) then
			WindowSetGameActionData( petFrame:GetName(), GameData.PlayerActions.DO_ABILITY, petHealAbility, L"" )
			clickHealRegistered = true  
		end
	end
end
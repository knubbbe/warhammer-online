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

if not PurePlayerPetTarget then PurePlayerPetTarget = {} end

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local c_PLAYER_PET_NAME_LENGTH 		= 24
local frameObject					= PurePlayerPetTargetUnitFrame
local frameType						= "PurePlayerPetTarget_Default"
local windowId 						= "PurePlayerPetTargetUnitFrame"
local unitId						= "selfpettargetpure"
local targetFrame					= nil

local bIsLoaded				= false

if( PureTemplates ~= nil ) then 
	PureTemplates.RegisterTemplate( PureTemplates.Types.PLAYER_PET_TARGET, frameType, frameObject, L"Pure - Default" ) 
end

function PurePlayerPetTarget.IsLoaded() return bIsLoaded end

function PurePlayerPetTarget.LoadUnitFrame()
	-- Only load if we are set to show
	if( not Pure.Get( "playerpettarget-frame-show" ) or bIsLoaded ) then return end
	
	-- Retrieve our template information
	local template = PureTemplates.GetTemplateByName( PureTemplates.Types.PLAYER_PET_TARGET, Pure.Get( "playerpettarget-frame-template" ) )
	if( template ~= nil ) then
		frameObject 			= template.m_Frame
		frameType				= template.m_Type
		frameObject.m_Template 	= template.m_FrameType
	else
		d( "Pure player template(" .. tostring( Pure.Get( "playerpettarget-frame-template" ) ) .. ") not found.  Using default." )
	end
	
	-- Create our frame factory
	UnitFrames:AddFrameFactory( frameType, frameObject )
	
	-- Create the unit frame
	targetFrame = UnitFrames:CreateNewFrame( windowId, frameType, unitId )
	
	-- Sanity check
	if( targetFrame == nil ) then
		d( "Error creating Pure Player Pet Target frame from template: " .. frameType )
		return	
	end
	
	-- Update our show when interface hidden setting
	WindowSetDrawWhenInterfaceHidden( targetFrame:GetName(), Pure.Get( "playerpettarget-frame-showinsiege" ) )
	
	-- Update the location of our player frame
	PurePlayerPetTarget.UpdateWindowPosition()
	
	-- Load the unit frame
	targetFrame:LoadUnitFrame()
	
	-- Initialize the frame with the first round of information
	PurePlayerPetTarget.RefreshInformation()
	
	-- Register to know when the layout editor is complete
    local layoutEditorEventHandlerFound = false
    for k,v in pairs( LayoutEditor.EventHandlers )
    do
    	if( tostring( v ) == tostring( PurePlayerPetTarget.OnLayoutEditorEnd ) ) then
    		layoutEditorEventHandlerFound = true
    	end
    end
    if( not layoutEditorEventHandlerFound ) then
    	table.insert( LayoutEditor.EventHandlers, PurePlayerPetTarget.OnLayoutEditorEnd )
    end
	
	-- Register our event handlers
	RegisterEventHandler( SystemData.Events.PLAYER_PET_TARGET_HEALTH_UPDATED, 	"PurePlayerPetTarget.OnHealthUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_PET_TARGET_UPDATED, 			"PurePlayerPetTarget.OnTargetUpdated" )
    
	bIsLoaded = true
end

function PurePlayerPetTarget.UnloadUnitFrame()
	if( not bIsLoaded ) then return end
	bIsLoaded = false
	
	UnregisterEventHandler( SystemData.Events.PLAYER_PET_TARGET_HEALTH_UPDATED, 	"PurePlayerPetTarget.OnHealthUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_PET_TARGET_UPDATED, 			"PurePlayerPetTarget.OnTargetUpdated" )
    
    LayoutEditor.UnregisterWindow( targetFrame:GetName() )
	targetFrame:UnloadUnitFrame()
	targetFrame:Show( false )
	UnitFrames:DestroyFrame( unitId, UnitFrames.REMOVE_DESTROYED_FRAME )
	targetFrame = nil
end

function PurePlayerPetTarget.OnLayoutEditorEnd( exitCode )
	if( exitCode == LayoutEditor.EDITING_END ) then
        local point, relpoint, relwin, x, y = WindowGetAnchor( targetFrame:GetName(), 1 )
        
        local anchor = {}
        anchor.Point, anchor.RelativePoint, anchor.RelativeTo, anchor.XOffset, anchor.YOffset = WindowGetAnchor( targetFrame:GetName(), 1 )
	        
        if( not DoesWindowExist( anchor.RelativeTo ) ) then
    		anchor = Pure.CopyTable( Pure.ResetAnchor )
    	end
        
        Pure.Set( "playerpettarget-anchor-point", anchor.Point )
        Pure.Set( "playerpettarget-anchor-relpoint", anchor.RelativePoint )
        Pure.Set( "playerpettarget-anchor-relwin", anchor.RelativeTo )
        Pure.Set( "playerpettarget-anchor-x", anchor.XOffset )
        Pure.Set( "playerpettarget-anchor-y", anchor.YOffset )
        Pure.Set( "playerpettarget-anchor-scale", targetFrame:GetScale() )
        
        -- Reload the unit frame
        targetFrame:UpdateLayout()
    end
    
    -- Refresh the unit frames information
    PurePlayerPetTarget.RefreshInformation()
end

function PurePlayerPetTarget.UpdateWindowPosition()
	-- Remove our window from the layout editor
	LayoutEditor.UnregisterWindow( targetFrame:GetName() )
	
	local anchor = {}
	anchor.Point 			= Pure.Get( "playerpettarget-anchor-point" )
	anchor.RelativeTo  		= Pure.Get( "playerpettarget-anchor-relwin" )
    anchor.RelativePoint	= Pure.Get( "playerpettarget-anchor-relpoint" )
    anchor.XOffset			= Pure.Get( "playerpettarget-anchor-x" )
    anchor.YOffset			= Pure.Get( "playerpettarget-anchor-y" )
	
	if( not DoesWindowExist( anchor.RelativeTo ) ) then
    	anchor = Pure.CopyTable( Pure.ResetAnchor )
    end
	
	-- Update the frame accordingly
	targetFrame:SetAnchor( anchor )
	targetFrame:SetScale( Pure.Get( "playerpettarget-anchor-scale" ) )
	targetFrame:SetDimensions( Pure.Get("playerpettarget-anchor-dx"), Pure.Get( "playerpettarget-anchor-dy" ) )
	
	-- Register with the layout editor
   	LayoutEditor.RegisterWindow( targetFrame:GetName(), T["Player Pet Target"] .. L" (Pure)", T["Player Pet Target"] .. L" (Pure)", false, false, false, nil )
end

function PurePlayerPetTarget.RefreshInformation()
	PurePlayerPetTarget.OnTargetUpdated()
end

function PurePlayerPetTarget.OnTargetUpdated()
	if( targetFrame == nil ) then return end
	
	local hasTarget = PurePlayerPetTarget.HasTarget()
	if( hasTarget ) then
		PurePlayerPetTarget.UpdateInformation()
		PurePlayerPetTarget.OnHealthUpdated()
		PurePlayerPetTarget.UpdateLevel()
	end
	targetFrame:Show( hasTarget )
end

function PurePlayerPetTarget.OnHealthUpdated()
	if( targetFrame == nil ) then return end
	targetFrame:UpdateHitPoints( GameData.Player.Pet.Target.healthPercent )
end

function PurePlayerPetTarget.UpdateLevel()
	if( targetFrame == nil ) then return end
	targetFrame:UpdateLevel( GameData.Player.Pet.Target.level, GameData.Player.Pet.Target.conType, GameData.Player.Pet.Target.tier )
end

function PurePlayerPetTarget.UpdateInformation()
	if( targetFrame == nil ) then return end
	targetFrame:UpdateInformation( GameData.Player.Pet.Target.name )
end

function PurePlayerPetTarget.HasTarget()
    return GameData.Player.Pet.Target.name ~= L""
end

function PurePlayerPetTarget.OnRButtonDown( flags )
end

function PurePlayerPetTarget.OnRButtonDown( flags )
end
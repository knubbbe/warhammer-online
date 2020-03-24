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

if not PureTarget then PureTarget = {} end

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local c_HOSTILE_TARGET          = "selfhostiletarget"
local c_FRIENDLY_TARGET         = "selffriendlytarget"

local windowId 					= "PureTargetUnitFrame"

local frameHostileObject		= PureTargetUnitFrame
local frameHostileType			= "PureTargetHostile_Default"
local windowHostile 			= windowId .. "Hostile"
local hostileUnitId				= c_HOSTILE_TARGET .. "pure"

local frameFriendlyObject		= PureTargetUnitFrame
local frameFriendlyType			= "PureTargetFriendly_Default"
local windowFriendly 			= windowId .. "Friendly"
local friendlyUnitId			= c_FRIENDLY_TARGET .. "pure"

local bIsLoaded						= false
local bRegisterEffectHandling		= false

local friendlyFrame 				= nil
local hostileFrame 					= nil

local friendlyShow					= false
local hostileShow					= false

local lastFriendlyTargetId			= -1
local lastHostileTargetId			= -1

local hostileDispellableEffects		= {}
local friendlyDispellableEffects	= {}

if( PureTemplates ~= nil ) then 
	PureTemplates.RegisterTemplate( PureTemplates.Types.TARGET_FRIENDLY, frameFriendlyType, frameFriendlyObject, L"Pure - Default" ) 
	PureTemplates.RegisterTemplate( PureTemplates.Types.TARGET_HOSTILE, frameHostileType, frameHostileObject, L"Pure - Default" )
end

function PureTarget.IsLoaded() return bIsLoaded end

function PureTarget.LoadUnitFrame()

	-- Only load if we are set to show
	if( ( not Pure.Get( "hostile-frame-show" ) and not Pure.Get( "friendly-frame-show" ) ) or bIsLoaded ) then return end
	
	bRegisterEffectHandling = Pure.Get( "hostile-dispel-show" ) or Pure.Get( "hostile-effects-show" ) or 
				Pure.Get( "friendly-dispel-show" ) or Pure.Get( "friendly-effects-show" )
	
	-- Reset our last target ids
	lastFriendlyTargetId		= -1
	lastHostileTargetId			= -1
	
	-- Store any configuration values we need to
	friendlyShow = Pure.Get( "friendly-frame-show" )
	hostileShow =  Pure.Get( "hostile-frame-show" )
	
	if( hostileShow ) then
		local template = PureTemplates.GetTemplateByName( PureTemplates.Types.TARGET_HOSTILE, Pure.Get( "hostile-frame-template" ) )
		if( template ~= nil ) then
			frameHostileObject 				= template.m_Frame
			frameHostileType				= template.m_Type
			frameHostileObject.m_Template 	= template.m_FrameType
		else
			d( "Pure target hostile template(" .. tostring( Pure.Get( "hostile-frame-template" ) ) .. ") not found.  Using default." )
		end
		
		-- Create our frame factory
		UnitFrames:AddFrameFactory( frameHostileType, frameHostileObject )
		
		-- Create the unit frame
		hostileFrame = UnitFrames:CreateNewFrame( windowHostile, frameHostileType, hostileUnitId )
		
		-- Sanity check
		if( hostileFrame == nil ) then
			d( "Error creating Pure Hostile Target frame from template: " .. frameHostileType )
			return	
		end
		
		-- Update our show when interface hidden setting
		WindowSetDrawWhenInterfaceHidden( hostileFrame:GetName(), Pure.Get( "hostile-frame-showinsiege" ) )
	end
	
	if( friendlyShow ) then
    	local template = PureTemplates.GetTemplateByName( PureTemplates.Types.TARGET_FRIENDLY, Pure.Get( "friendly-frame-template" ) )
		if( template ~= nil ) then
			frameFriendlyObject 			= template.m_Frame
			frameFriendlyType				= template.m_Type
			frameFriendlyObject.m_Template 	= template.m_FrameType
		else
			d( "Pure target friendly template(" .. tostring( Pure.Get( "friendly-frame-template" ) ) .. ") not found.  Using default." )
		end
		
		-- Create our frame factory
		UnitFrames:AddFrameFactory( frameFriendlyType, frameFriendlyObject )
		
		-- Create the unit frame
		friendlyFrame = UnitFrames:CreateNewFrame( windowFriendly, frameFriendlyType, friendlyUnitId )
		
		-- Sanity check
		if( friendlyFrame == nil ) then
			d( "Error creating Pure Friendly Target HUD frame from template: " .. frameFriendlyType )
			return	
		end
		
		-- Update our show when interface hidden setting
		WindowSetDrawWhenInterfaceHidden( friendlyFrame:GetName(), Pure.Get( "friendly-frame-showinsiege" ) )
	end
	
	-- Update the location of our target frames
	PureTarget.UpdateWindowPosition()
	
	if hostileShow then hostileFrame:LoadUnitFrame() end
	if friendlyShow then friendlyFrame:LoadUnitFrame() end
	
	local layoutEditorEventHandlerFound = false
    for k,v in pairs( LayoutEditor.EventHandlers )
    do
    	if( tostring( v ) == tostring( PureTarget.OnLayoutEditorEnd ) ) then
    		layoutEditorEventHandlerFound = true
    	end
    end
    if( not layoutEditorEventHandlerFound ) then
    	table.insert( LayoutEditor.EventHandlers, PureTarget.OnLayoutEditorEnd )
    end
    
    --
    -- Perform an update of the targets (This may not function on first load as the client may not have that info yet)
    --
    TargetInfo:UpdateFromClient()
    PureTarget.OnTargetUpdated( c_HOSTILE_TARGET, TargetInfo:UnitEntityId( c_HOSTILE_TARGET ), TargetInfo:UnitType( c_HOSTILE_TARGET ) )
    PureTarget.OnTargetUpdated( c_FRIENDLY_TARGET, TargetInfo:UnitEntityId( c_FRIENDLY_TARGET ), TargetInfo:UnitType( c_FRIENDLY_TARGET ) )
    
	-- Register our event handlers
    RegisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 			"PureTarget.OnTargetUpdated" )
    if( bRegisterEffectHandling ) then
    	RegisterEventHandler( SystemData.Events.PLAYER_TARGET_EFFECTS_UPDATED, 	"PureTarget.OnTargetEffectsUpdated" )
    end
    
    bIsLoaded = true
end

function PureTarget.UnloadUnitFrame()
	if( not bIsLoaded ) then return end
	
	bIsLoaded = false
	
	-- Unregister our event handlers
	UnregisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 			"PureTarget.OnTargetUpdated" )
	if( bRegisterEffectHandling ) then
    	UnregisterEventHandler( SystemData.Events.PLAYER_TARGET_EFFECTS_UPDATED, 	"PureTarget.OnTargetEffectsUpdated" )
    end
	
	-- Unload our unit frames
	if( hostileShow ) then
		LayoutEditor.UnregisterWindow( hostileFrame:GetName() )
		hostileFrame:UnloadUnitFrame()
		hostileFrame:Show( false )
		UnitFrames:DestroyFrame( hostileUnitId, UnitFrames.REMOVE_DESTROYED_FRAME )
		hostileFrame = nil
	end
	
	if( friendlyShow ) then
		LayoutEditor.UnregisterWindow( friendlyFrame:GetName() )
		friendlyFrame:UnloadUnitFrame()
		friendlyFrame:Show( false )
		UnitFrames:DestroyFrame( friendlyUnitId, UnitFrames.REMOVE_DESTROYED_FRAME )
		friendlyFrame = nil
	end
end

function PureTarget.OnLayoutEditorEnd( exitCode )
	if( exitCode == LayoutEditor.EDITING_END ) then
		if( hostileShow ) then
	        local anchor = {}
	        anchor.Point, anchor.RelativePoint, anchor.RelativeTo, anchor.XOffset, anchor.YOffset = WindowGetAnchor( hostileFrame:GetName(), 1 )
	        
	        if( not DoesWindowExist( anchor.RelativeTo ) ) then
        		anchor = Pure.CopyTable( Pure.ResetAnchor )
        	end
	        
			Pure.Set( "hostile-anchor-point", anchor.Point )
	        Pure.Set( "hostile-anchor-relpoint", anchor.RelativePoint )
	        Pure.Set( "hostile-anchor-relwin", anchor.RelativeTo )
	        Pure.Set( "hostile-anchor-x", anchor.XOffset )
	        Pure.Set( "hostile-anchor-y", anchor.YOffset )
	        Pure.Set( "hostile-anchor-scale", WindowGetScale( hostileFrame:GetName()  ) )
	        
	        -- Let the frame know we updated the layout
	        hostileFrame:UpdateLayout()
	    end
	    
	    if( friendlyShow ) then
	    	local anchor = {}
	        anchor.Point, anchor.RelativePoint, anchor.RelativeTo, anchor.XOffset, anchor.YOffset = WindowGetAnchor( friendlyFrame:GetName(), 1 )
	        
	        if( not DoesWindowExist( anchor.RelativeTo ) ) then
        		anchor = Pure.CopyTable( Pure.ResetAnchor )
        	end
	        
			Pure.Set( "friendly-anchor-point", anchor.Point )
	        Pure.Set( "friendly-anchor-relpoint", anchor.RelativePoint )
	        Pure.Set( "friendly-anchor-relwin", anchor.RelativeTo )
	        Pure.Set( "friendly-anchor-x", anchor.XOffset )
	        Pure.Set( "friendly-anchor-y", anchor.YOffset )
	        Pure.Set( "friendly-anchor-scale", WindowGetScale( friendlyFrame:GetName()  ) )
	        
	        -- Let the frame know we updated the layout
	        friendlyFrame:UpdateLayout()
	    end
    end
end

function PureTarget.UpdateWindowPosition()
	if( hostileShow ) then
		local anchor = {}
		anchor.Point 			= Pure.Get( "hostile-anchor-point" )
		anchor.RelativeTo  		= Pure.Get( "hostile-anchor-relwin" )
	    anchor.RelativePoint	= Pure.Get( "hostile-anchor-relpoint" )
	    anchor.XOffset			= Pure.Get( "hostile-anchor-x" )
	    anchor.YOffset			= Pure.Get( "hostile-anchor-y" )
		
		-- Unregsiter our window from the layout editor
		LayoutEditor.UnregisterWindow( hostileFrame:GetName() )
		
		if( not DoesWindowExist( anchor.RelativeTo ) ) then
        	anchor = Pure.CopyTable( Pure.ResetAnchor )
        end
		
		-- Clear any anchors playerFrame:GetName() window has
		hostileFrame:SetAnchor( anchor )
		hostileFrame:SetScale( Pure.Get( "hostile-anchor-scale" ) )
		hostileFrame:SetDimensions( Pure.Get("hostile-anchor-dx"), Pure.Get( "hostile-anchor-dy" ) )
		
		-- Register with the layout editor
	   	LayoutEditor.RegisterWindow( hostileFrame:GetName(), T["Hostile Target"] .. L" (Pure)", T["Hostile Target"] .. L" (Pure)", false, false, false, nil )
	end
	
	if( friendlyShow ) then	
		local anchor = {}
		anchor.Point 			= Pure.Get( "friendly-anchor-point" )
		anchor.RelativeTo  		= Pure.Get( "friendly-anchor-relwin" )
	    anchor.RelativePoint	= Pure.Get( "friendly-anchor-relpoint" )
	    anchor.XOffset			= Pure.Get( "friendly-anchor-x" )
	    anchor.YOffset			= Pure.Get( "friendly-anchor-y" )
	    
	    if( not DoesWindowExist( anchor.RelativeTo ) ) then
        	anchor = Pure.CopyTable( Pure.ResetAnchor )
        end
	    
		-- Unregsiter our window from the layout editor
		LayoutEditor.UnregisterWindow( friendlyFrame:GetName() )
		friendlyFrame:SetAnchor( anchor )
		friendlyFrame:SetScale( Pure.Get( "friendly-anchor-scale" ) )
		friendlyFrame:SetDimensions( Pure.Get("friendly-anchor-dx"), Pure.Get( "friendly-anchor-dy" ) )
		
		-- Register with the layout editor
	   	LayoutEditor.RegisterWindow( friendlyFrame:GetName(), T["Friendly Target"] .. L" (Pure)", T["Friendly Target"] .. L" (Pure)", false, false, false, nil )
	end
end

function PureTarget.OnTargetUpdated( targetClassification, targetId, targetType )
    if( targetClassification ~= c_HOSTILE_TARGET and targetClassification ~= c_FRIENDLY_TARGET ) then
        return
    end
    
    -- Update our target info from the client
    TargetInfo:UpdateFromClient()
    
	-- Handle according to classification
    if( targetClassification == c_HOSTILE_TARGET ) then
    	if( hostileShow ) then
	    	-- Update the unit frame
	    	hostileFrame:UpdateUnit()
	    	
	    	-- If we no longer have a target, clear our effects
	    	if( targetType == SystemData.TargetObjectType.NONE ) then
	    		lastHostileTargetId = -1
		    	hostileFrame:ClearAllEffects()
				hostileDispellableEffects = {}	
		    else
		    	-- If we have a new target, check for dispels and update effects
				if( lastHostileTargetId ~= targetId ) then
		    		lastHostileTargetId = targetId
		    		hostileDispellableEffects = {}
		    		hostileFrame:RefreshEffects()
		    		hostileFrame:UpdateEffectsDispel( false )
		    	end
		    end
		end
    elseif( targetClassification == c_FRIENDLY_TARGET ) then
    	if( friendlyShow ) then
	    	-- Update the unit frame
	    	friendlyFrame:UpdateUnit()
	    	
	    	-- If we no longer have a target, clear our effects
	    	if( targetType == SystemData.TargetObjectType.NONE ) then
	    		lastFriendlyTargetId = -1
		    	friendlyFrame:ClearAllEffects()
		    	friendlyDispellableEffects = {}
		    else
		    	-- If we have a new target, check for dispels and update effects
				if( lastFriendlyTargetId ~= targetId ) then
		    		lastFriendlyTargetId = targetId
		    		friendlyDispellableEffects = {}
		    		friendlyFrame:RefreshEffects()
		    		friendlyFrame:UpdateEffectsDispel( false )
		    	end
		    end
	    end
    end
end

function PureTarget.OnTargetEffectsUpdated( targetType, changedEffects, isFullList )
	if( changedEffects == nil ) then return end
	if( targetType == GameData.BuffTargetType.TARGET_HOSTILE ) then
		if( hostileShow ) then
			hostileFrame:UpdateEffects( changedEffects, isFullList )
			if( Pure.Get( "hostile-dispel-show" ) ) then
				local dispel
				dispel, hostileDispellableEffects = Pure.UpdateDispelTable( Pure.dispelTargetType.HOSTILE, hostileDispellableEffects, changedEffects, isFullList )
				hostileFrame:UpdateEffectsDispel( dispel )
			end	
		end
	elseif( targetType == GameData.BuffTargetType.TARGET_FRIENDLY ) then
		if( friendlyShow ) then
			friendlyFrame:UpdateEffects( changedEffects, isFullList )
		
			if( Pure.Get( "friendly-dispel-show" ) ) then
				local dispel
				dispel, friendlyDispellableEffects = Pure.UpdateDispelTable( Pure.dispelTargetType.FRIENDLY, friendlyDispellableEffects, changedEffects, isFullList )
				friendlyFrame:UpdateEffectsDispel( dispel )
			end	
		end
	end
end

function PureTarget.OnRButtonUp( flags, x, y, targetType )
	local targetName = TargetInfo:UnitName( targetType )
    local targetObjectType = TargetInfo:UnitType( targetType )
	
	if( targetName ~= GameData.Player.name and targetObjectType == SystemData.TargetObjectType.ALLY_PLAYER and PlayerMenuWindow ~= nil ) then
    	PlayerMenuWindow.ShowMenu (targetName)
    end
end

function PureTarget.OnLButtonUp( flags, x, y, targetType )
end

function PureTarget.OnLButtonUp_Sigil( flags, x, y, sigilInfo )
	if( sigilInfo == nil ) then return end
	
	if( TomeWindow ) then
        TomeWindow.OpenTomeToEntry( GameData.Tome.SECTION_ARMORY_SIGILS, sigilInfo.id )    
    end
end

function PureTarget.OnMouseOver_Sigil( flags, x, y, sigilInfo )
	if( sigilInfo == nil ) then return end
        
    Tooltips.CreateTextOnlyTooltip( SystemData.ActiveWindow.name )
    Tooltips.SetTooltipText( 1, 1, sigilInfo.name )
    Tooltips.SetTooltipColorDef( 1, 1, Tooltips.COLOR_HEADING )
    Tooltips.Finalize();
    Tooltips.AnchorTooltip( ANCHOR_WINDOW_VARIABLE )
end
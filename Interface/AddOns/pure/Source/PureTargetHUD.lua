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

if not PureTargetHUD then PureTargetHUD = {} end

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local c_HOSTILE_TARGET          	= "selfhostiletarget"
local c_FRIENDLY_TARGET         	= "selffriendlytarget"

local anchorTemplate				= "PureTargetHUDAnchor"
local windowId 						= "PureTargetHUD"

local frameHostileObject			= PureTargetHUDUnitFrame
local frameHostileType				= "PureTargetHUDHostile_Default"
local windowHostile 				= windowId .. "Hostile"
local hostileUnitId					= c_HOSTILE_TARGET .. "hudpure"
local windowHostileAnchor			= windowHostile .. "Anchor"

local frameFriendlyObject			= PureTargetHUDUnitFrame
local frameFriendlyType				= "PureTargetHUDFriendly_Default"
local windowFriendly 				= windowId .. "Friendly"
local friendlyUnitId				= c_FRIENDLY_TARGET .. "hudpure"
local windowFriendlyAnchor			= windowFriendly .. "Anchor"

local c_HUD_FRAME_DY				= 55

local bIsLoaded						= false
local bRegisterEffectHandling		= false

local friendlyFrame 				= nil
local hostileFrame 					= nil

local friendlyShow					= false
local hostileShow					= false

local friendlyTargetType			= "friendly"
local hostileTargetType				= "hostile"

local lastFriendlyTargetId			= -1
local lastHostileTargetId			= -1

local hostileDispellableEffects		= {}
local friendlyDispellableEffects	= {}

if( PureTemplates ~= nil ) then 
	PureTemplates.RegisterTemplate( PureTemplates.Types.TARGET_FRIENDLY_HUD, frameFriendlyType, frameFriendlyObject, L"Pure - Default" ) 
	PureTemplates.RegisterTemplate( PureTemplates.Types.TARGET_HOSTILE_HUD, frameHostileType, frameHostileObject, L"Pure - Default" )
end

function PureTargetHUD.IsLoaded() return bIsLoaded end

function PureTargetHUD.LoadUnitFrame()
	-- Only load if we are set to show
	if( ( not Pure.Get( "hostilehud-frame-show" ) and not Pure.Get( "friendlyhud-frame-show" ) ) or bIsLoaded ) then return end
	
	-- Store any configuration values we need to
	friendlyShow = Pure.Get( "friendlyhud-frame-show" )
	hostileShow =  Pure.Get( "hostilehud-frame-show" )
	
	bRegisterEffectHandling = Pure.Get( "hostilehud-dispel-show" ) or Pure.Get( "friendlyhud-dispel-show" )
	
	if( hostileShow ) then
		if( not DoesWindowExist( windowHostileAnchor ) ) then CreateWindowFromTemplate( windowHostileAnchor, anchorTemplate, "Root" ) end
		WindowSetDimensions( windowHostileAnchor, 1, 1 )
		WindowSetShowing( windowHostileAnchor, true )
		
		local template = PureTemplates.GetTemplateByName( PureTemplates.Types.TARGET_HOSTILE_HUD, Pure.Get( "hostilehud-frame-template" ) )
		if( template ~= nil ) then
			frameHostileObject 				= template.m_Frame
			frameHostileType				= template.m_Type
			frameHostileObject.m_Template 	= template.m_FrameType
		else
			d( "Pure target hostile hud template(" .. tostring( Pure.Get( "hostilehud-frame-template" ) ) .. ") not found.  Using default." )
		end
		
		-- Create our frame factory
		UnitFrames:AddFrameFactory( frameHostileType, frameHostileObject )
		
		-- Create the unit frame
		hostileFrame = UnitFrames:CreateNewFrame( windowHostile, frameHostileType, hostileUnitId )
		
		-- Sanity check
		if( hostileFrame == nil ) then
			d( "Error creating Pure Hostile Target HUD frame from template: " .. frameHostileType )
			return	
		end
		
		hostileFrame:SetParent( windowHostileAnchor )
	end
	
	if( friendlyShow ) then
		-- Create and initialize our friendly anchor
		if( not DoesWindowExist( windowFriendlyAnchor ) ) then CreateWindowFromTemplate( windowFriendlyAnchor, anchorTemplate, "Root" ) end
		WindowSetDimensions( windowFriendlyAnchor, 1, 1 )
		WindowSetShowing( windowFriendlyAnchor, true )
						
    	local template = PureTemplates.GetTemplateByName( PureTemplates.Types.TARGET_FRIENDLY_HUD, Pure.Get( "friendlyhud-frame-template" ) )
		if( template ~= nil ) then
			frameFriendlyObject 			= template.m_Frame
			frameFriendlyType				= template.m_Type
			frameFriendlyObject.m_Template 	= template.m_FrameType
		else
			d( "Pure target friendly template(" .. tostring( Pure.Get( "friendlyhud-frame-template" ) ) .. ") not found.  Using default." )
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
		
		friendlyFrame:SetParent( windowFriendlyAnchor )
	end
	
	-- Update our window positions
	PureTargetHUD.UpdateWindowPosition()
	
	if hostileShow then hostileFrame:LoadUnitFrame() end
	if friendlyShow then friendlyFrame:LoadUnitFrame() end
	
	-- Reanchor our HUD frames
	PureTargetHUD.ReanchorHUDFrames()
	
	local layoutEditorEventHandlerFound = false
    for k,v in pairs( LayoutEditor.EventHandlers )
    do
    	if( tostring( v ) == tostring( PureTargetHUD.OnLayoutEditorEnd ) ) then
    		layoutEditorEventHandlerFound = true
    	end
    end
    if( not layoutEditorEventHandlerFound ) then
    	table.insert( LayoutEditor.EventHandlers, PureTargetHUD.OnLayoutEditorEnd )
    end
    
    --
    -- Perform an update of the targets (This may not function on first load as the client may not have that info yet)
    --
    TargetInfo:UpdateFromClient()
    PureTargetHUD.OnTargetUpdated( c_HOSTILE_TARGET, TargetInfo:UnitEntityId( c_HOSTILE_TARGET ), TargetInfo:UnitType( c_HOSTILE_TARGET ) )
    PureTargetHUD.OnTargetUpdated( c_FRIENDLY_TARGET, TargetInfo:UnitEntityId( c_FRIENDLY_TARGET ), TargetInfo:UnitType( c_FRIENDLY_TARGET ) )
	
	-- Register our event handlers
    RegisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 			"PureTargetHUD.OnTargetUpdated" )
    if( bRegisterEffectHandling ) then
    	RegisterEventHandler( SystemData.Events.PLAYER_TARGET_EFFECTS_UPDATED, 	"PureTargetHUD.OnTargetEffectsUpdated" )
    end
    
    bIsLoaded = true
end

function PureTargetHUD.UnloadUnitFrame()
	if( not bIsLoaded ) then return end
	
	-- Unregister our event handlers
	UnregisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 			"PureTargetHUD.OnTargetUpdated" )
	if( bRegisterEffectHandling ) then
    	UnregisterEventHandler( SystemData.Events.PLAYER_TARGET_EFFECTS_UPDATED, 	"PureTargetHUD.OnTargetEffectsUpdated" )
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
	
	bIsLoaded = false
end

function PureTargetHUD.OnLayoutEditorEnd( exitCode )
	if( exitCode == LayoutEditor.EDITING_END ) then
		if( hostileShow ) then
	        local point, relpoint, relwin, x, y = WindowGetAnchor( hostileFrame:GetName(), 1 )
	        
			Pure.Set( "hostilehud-anchor-point", point )
	        Pure.Set( "hostilehud-anchor-relpoint", relpoint )
	        Pure.Set( "hostilehud-anchor-relwin", relwin )
	        Pure.Set( "hostilehud-anchor-x", x )
	        Pure.Set( "hostilehud-anchor-y", y )
	        Pure.Set( "hostilehud-anchor-scale",  WindowGetScale( hostileFrame:GetName() ) )
	        
	        hostileFrame:UpdateLayout()
	    end
	    
	    if( friendlyShow ) then
	        local point, relpoint, relwin, x, y = WindowGetAnchor( friendlyFrame:GetName(), 1 )
	        
			Pure.Set( "friendlyhud-anchor-point", point )
	        Pure.Set( "friendlyhud-anchor-relpoint", relpoint )
	        Pure.Set( "friendlyhud-anchor-relwin", relwin )
	        Pure.Set( "friendlyhud-anchor-x", x )
	        Pure.Set( "friendlyhud-anchor-y", y )
	        Pure.Set( "friendlyhud-anchor-scale", WindowGetScale( friendlyFrame:GetName()  ) )
	        
	        friendlyFrame:UpdateLayout()
	    end
	end
	
	PureTargetHUD.ReanchorHUDFrames()
end

function PureTargetHUD.UpdateWindowPosition()
	if( hostileShow ) then
		-- Remove our window from the layout editor
		LayoutEditor.UnregisterWindow( hostileFrame:GetName() )
		
		local anchor = {}
		anchor.Point 			= Pure.Get( "hostilehud-anchor-point" )
		anchor.RelativeTo  		= Pure.Get( "hostilehud-anchor-relwin" )
	    anchor.RelativePoint	= Pure.Get( "hostilehud-anchor-relpoint" )
	    anchor.XOffset			= Pure.Get( "hostilehud-anchor-x" )
	    anchor.YOffset			= Pure.Get( "hostilehud-anchor-y" )
	    
		-- Unregsiter with the layout editor
		LayoutEditor.UnregisterWindow( hostileFrame:GetName() )
		hostileFrame:SetAnchor( anchor )
		hostileFrame:SetScale( Pure.Get( "hostilehud-anchor-scale" ) )
		hostileFrame:SetDimensions( Pure.Get( "hostilehud-anchor-dx" ), Pure.Get( "hostilehud-anchor-dy" ) )

		-- Register with the layout editor
	   	LayoutEditor.RegisterWindow( hostileFrame:GetName(), T["Hostile Target HUD"] .. L" (Pure)", T["Hostile Target HUD"] .. L" (Pure)", false, false, false, nil )
	end
	
	if( friendlyShow ) then
		-- Remove our window from the layout editor
		LayoutEditor.UnregisterWindow( friendlyFrame:GetName() )
		
		local anchor = {}
		anchor.Point 			= Pure.Get( "friendlyhud-anchor-point" )
		anchor.RelativeTo  		= Pure.Get( "friendlyhud-anchor-relwin" )
	    anchor.RelativePoint	= Pure.Get( "friendlyhud-anchor-relpoint" )
	    anchor.XOffset			= Pure.Get( "friendlyhud-anchor-x" )
	    anchor.YOffset			= Pure.Get( "friendlyhud-anchor-y" )
	    
		-- Unregsiter with the layout editor
		LayoutEditor.UnregisterWindow( friendlyFrame:GetName() )
		friendlyFrame:SetAnchor( anchor )
		friendlyFrame:SetScale( Pure.Get( "friendlyhud-anchor-scale" ) )
		friendlyFrame:SetDimensions( Pure.Get("friendlyhud-anchor-dx"), Pure.Get( "friendlyhud-anchor-dy" ) )

		-- Register with the layout editor
	   	LayoutEditor.RegisterWindow( friendlyFrame:GetName(), T["Friendly Target HUD"] .. L" (Pure)", T["Friendly Target HUD"] .. L" (Pure)", false, false, false, nil )
	end
end

function PureTargetHUD.ReanchorHUDFrames()
	if( hostileShow ) then	
		-- Anchor the hud to the hostile HUD anchor
		local anchor = Pure.GetHUDFrameAnchor( windowHostileAnchor, Pure.Get( "hostilehud-window-anchor" ), Pure.Get(  "hostilehud-window-dx" ), Pure.Get( "hostilehud-window-dy" ) )
		hostileFrame:SetAnchor( anchor )
	end
	
	if( friendlyShow ) then
		-- Anchor the hud to the friendly HUD anchor
		local anchor = Pure.GetHUDFrameAnchor( windowFriendlyAnchor, Pure.Get( "friendlyhud-window-anchor" ), Pure.Get(  "friendlyhud-window-dx" ), Pure.Get( "friendlyhud-window-dy" ) )
		friendlyFrame:SetAnchor( anchor )
	end
end

function PureTargetHUD.OnTargetUpdated( targetClassification, targetId, targetType )
    if( targetClassification ~= c_HOSTILE_TARGET and targetClassification ~= c_FRIENDLY_TARGET ) then
        return
    end
    
    -- Update our target info from the client
    TargetInfo:UpdateFromClient()
    
	-- Handle according to classification
    if( targetClassification == c_HOSTILE_TARGET ) then
    	if( hostileShow ) then
	    	-- If we no longer have a target, clear our effects
	    	if( targetType == SystemData.TargetObjectType.NONE ) then
	    		DetachWindowFromWorldObject( windowHostileAnchor, lastHostileTargetId )
	    		lastHostileTargetId = -1
		    	hostileDispellableEffects = {}
		    	hostileFrame:Show( false )
			else
				-- Update the unit frame
	    		hostileFrame:UpdateUnit()
	    	
		    	-- If we have a new target, check for dispels and update effects
				if( lastHostileTargetId ~= targetId ) then
				    DetachWindowFromWorldObject( windowHostileAnchor, lastHostileTargetId )
		    		AttachWindowToWorldObject( windowHostileAnchor, targetId )
		    		hostileDispellableEffects = {}
		    		hostileFrame:UpdateEffectsDispel( false )
		    		lastHostileTargetId = targetId
		    	end
		    end
		end
    elseif( targetClassification == c_FRIENDLY_TARGET ) then
    	if( friendlyShow ) then
	    	-- If we no longer have a target, clear our effects
	    	if( ( targetType == SystemData.TargetObjectType.NONE ) or
			( targetId == GameData.Player.worldObjNum and not Pure.Get( "friendlyhud-show-self" ) ) ) then
	    		DetachWindowFromWorldObject( windowFriendlyAnchor, lastFriendlyTargetId )
	    		lastFriendlyTargetId = -1
		    	friendlyDispellableEffects = {}
		    	friendlyFrame:Show( false )
		    else
		    	-- Update the unit frame
	    		friendlyFrame:UpdateUnit()
	    	
	    		-- If we have a new target, check for dispels and update effects
				if( lastFriendlyTargetId ~= targetId ) then
					DetachWindowFromWorldObject( windowFriendlyAnchor, lastFriendlyTargetId )
		    		AttachWindowToWorldObject( windowFriendlyAnchor, targetId )
		    		friendlyDispellableEffects = {}
		    		friendlyFrame:UpdateEffectsDispel( false )
		    		lastFriendlyTargetId = targetId
		    	end
		    end
	    end
    end
end

function PureTargetHUD.OnTargetEffectsUpdated( targetType, changedEffects, isFullList )
	if( changedEffects == nil ) then return end
	if( targetType == GameData.BuffTargetType.TARGET_HOSTILE ) then
		if( hostileShow ) then
			if( Pure.Get( "hostilehud-dispel-show" ) ) then
				local dispel
				dispel, hostileDispellableEffects = Pure.UpdateDispelTable( Pure.dispelTargetType.HOSTILE, hostileDispellableEffects, changedEffects, isFullList )
				hostileFrame:UpdateEffectsDispel( dispel )
			end	
		end
	elseif( targetType == GameData.BuffTargetType.TARGET_FRIENDLY ) then
		if( friendlyShow ) then
			if( Pure.Get( "friendlyhud-dispel-show" ) ) then
				local dispel
				dispel, friendlyDispellableEffects = Pure.UpdateDispelTable( Pure.dispelTargetType.FRIENDLY, friendlyDispellableEffects, changedEffects, isFullList )
				friendlyFrame:UpdateEffectsDispel( dispel )
			end	
		end
	end
end
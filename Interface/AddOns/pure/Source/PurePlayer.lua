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

if not PurePlayer then PurePlayer = {} end

local PurePlayer = PurePlayer

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local c_FRIENDLY_TARGET         	= "selffriendlytarget"

local playerFrame					= nil

local frameObject					= PurePlayerUnitFrame
local frameType						= "PurePlayer_Default"
local windowId 						= "PurePlayerUnitFrame"
local unitId						= "selfpure"

local bIsLoaded						= false
local bIsCurrentTarget				= false
local bRegisterEffectHandling		= false
local bRegisterCombatHandling		= false
local bCombatShowHandling			= false

local prevFriendlyTargetId			= -1
local dispellableEffects			= {}

local hitPointUpdateFunctions		= {}
local actionPointUpdateFunctions	= {}

if( PureTemplates ~= nil ) then 
	PureTemplates.RegisterTemplate( PureTemplates.Types.PLAYER, frameType, frameObject, L"Pure - Default" ) 
end

function PurePlayer.IsLoaded() return bIsLoaded end

function PurePlayer.LoadUnitFrame()
	-- Only load if we are set to show
	if( not Pure.Get( "player-frame-show" ) or bIsLoaded ) then return end
	
	-- Generate our hitpoint/actionpoint update functions
	local hpFormat = Pure.Get( "player-hitpoints-format" )
	local apFormat = Pure.Get( "player-actionpoints-format" )
	
	bRegisterEffectHandling 	= Pure.Get( "player-dispel-show" ) or Pure.Get( "player-effects-show" )
	bRegisterCombatHandling 	= not Pure.Get( "player-frame-show-outofcombat" )
	bCombatShowHandling 		= not Pure.Get( "player-frame-show-outofcombat" ) -- just incase bRegisterCombatHandling gets other uses in the future 
	
	hitPointUpdateFunctions = {}
	for token in Pure.gmatch( hpFormat, "%a+" ) 
	do
		if( PureConstants.PlayerHitPointReplacement[token] ~= nil and
			PureConstants.PlayerHitPointReplacement[token].func ) then
			hitPointUpdateFunctions[token] = PureConstants.PlayerHitPointReplacement[token].func
		end
	end
	
	actionPointUpdateFunctions = {}
	for token in Pure.gmatch( apFormat, "%a+" ) 
	do
		if( PureConstants.PlayerActionPointReplacement[token] ~= nil and
			PureConstants.PlayerActionPointReplacement[token].func ) then
			actionPointUpdateFunctions[token] = PureConstants.PlayerActionPointReplacement[token].func
		end
	end
	
	-- Retrieve our template information
	local template = PureTemplates.GetTemplateByName( PureTemplates.Types.PLAYER, Pure.Get( "player-frame-template" ) )
	if( template ~= nil ) then
		frameObject 			= template.m_Frame
		frameType				= template.m_Type
		frameObject.m_Template 	= template.m_FrameType
	else
		d( "Pure player template(" .. tostring( Pure.Get( "player-frame-template" ) ) .. ") not found.  Using default." )
	end
	
	-- Create our frame factory
	UnitFrames:AddFrameFactory( frameType, frameObject )
	
	-- Create the unit frame
	playerFrame = UnitFrames:CreateNewFrame( windowId, frameType, unitId )
	
	-- Sanity check
	if( playerFrame == nil ) then
		d( "Error creating Pure Player frame from template: " .. frameType )
		return	
	end
	
	-- Update our show when interface hidden setting
	WindowSetDrawWhenInterfaceHidden( playerFrame:GetName(), Pure.Get( "player-frame-showinsiege" ) )
	
	-- Update the location of our player frame
	PurePlayer.UpdateWindowPosition()
	
	-- Load the unit frame
	playerFrame:LoadUnitFrame()
	
	-- Show the frame
	playerFrame:Show( true )
	
	-- Initialize the frame with the first round of information
	PurePlayer.RefreshInformation()
	
	-- Refresh our effects
	PurePlayer.RefreshEffects()
	
	local layoutEditorEventHandlerFound = false
    for k,v in pairs( LayoutEditor.EventHandlers )
    do
    	if( tostring( v ) == tostring( PurePlayer.OnLayoutEditorEnd ) ) then
    		layoutEditorEventHandlerFound = true
    	end
    end
    if( not layoutEditorEventHandlerFound ) then
    	table.insert( LayoutEditor.EventHandlers, PurePlayer.OnLayoutEditorEnd )
    end
	
	-- Register our event handlers
	RegisterEventHandler( SystemData.Events.LOADING_END, 						"PurePlayer.OnLoadingEnd" )
	RegisterEventHandler( SystemData.Events.PLAYER_CAREER_RANK_UPDATED,       	"PurePlayer.OnPlayerLevelUpdated" )
	RegisterEventHandler( SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED,     "PurePlayer.OnPlayerCareerResourceUpdated" )
	if( bRegisterCombatHandling ) then
    	RegisterEventHandler( SystemData.Events.PLAYER_COMBAT_FLAG_UPDATED,     "PurePlayer.OnPlayerCombatFlagUpdated" )
    end
	RegisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, 	"PurePlayer.OnPlayerActionPointsUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED,    	"PurePlayer.OnPlayerHitPointsUpdated" )
    if( bRegisterEffectHandling ) then
    	RegisterEventHandler( SystemData.Events.PLAYER_EFFECTS_UPDATED,       	"PurePlayer.OnPlayerEffectsUpdated" )
    end
    RegisterEventHandler( SystemData.Events.PLAYER_MAX_ACTION_POINTS_UPDATED, 	"PurePlayer.OnPlayerActionPointsUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED,    	"PurePlayer.OnPlayerHitPointsUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_RVR_FLAG_UPDATED,          	"PurePlayer.OnPlayerRvRFlagUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_MORALE_UPDATED,          	"PurePlayer.OnPlayerMoraleUpdated" )
    RegisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 				"PurePlayer.OnTargetUpdated" )
    RegisterEventHandler( SystemData.Events.RELOAD_INTERFACE, 					"PurePlayer.OnLoadingEnd" )
	
	-- The frame is now loaded	    
    bIsLoaded = true
end

function PurePlayer.UnloadUnitFrame()
	if( not bIsLoaded ) then return end
	
	bIsLoaded = false
	
	-- Unregister our events
	UnregisterEventHandler( SystemData.Events.LOADING_END, 							"PurePlayer.OnLoadingEnd" )
	UnregisterEventHandler( SystemData.Events.PLAYER_CAREER_RANK_UPDATED,       	"PurePlayer.OnPlayerLevelUpdated" )
	UnregisterEventHandler( SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED,     	"PurePlayer.OnPlayerCareerResourceUpdated" )
	if( bRegisterCombatHandling ) then
    	UnregisterEventHandler( SystemData.Events.PLAYER_COMBAT_FLAG_UPDATED,     	"PurePlayer.OnPlayerCombatFlagUpdated" )
    end
	UnregisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, 	"PurePlayer.OnPlayerActionPointsUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED,    	"PurePlayer.OnPlayerHitPointsUpdated" )
    if( bRegisterEffectHandling ) then
    	UnregisterEventHandler( SystemData.Events.PLAYER_EFFECTS_UPDATED,       	"PurePlayer.OnPlayerEffectsUpdated" )
    end
    UnregisterEventHandler( SystemData.Events.PLAYER_MAX_ACTION_POINTS_UPDATED, 	"PurePlayer.OnPlayerActionPointsUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED,    	"PurePlayer.OnPlayerHitPointsUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_RVR_FLAG_UPDATED,          	"PurePlayer.OnPlayerRvRFlagUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_MORALE_UPDATED,          		"PurePlayer.OnPlayerMoraleUpdated" )
    UnregisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 				"PurePlayer.OnTargetUpdated" )
    UnregisterEventHandler( SystemData.Events.RELOAD_INTERFACE, 					"PurePlayer.OnLoadingEnd" )
    
    -- Unload the unit frame
    LayoutEditor.UnregisterWindow( playerFrame:GetName() )
	playerFrame:UnloadUnitFrame()
	playerFrame:Show( false )
	UnitFrames:DestroyFrame( unitId, UnitFrames.REMOVE_DESTROYED_FRAME )
	playerFrame = nil
end

function PurePlayer.OnLayoutEditorEnd( exitCode )
	if( playerFrame == nil ) then return end
	
	if( exitCode == LayoutEditor.EDITING_END ) then
        local anchor = {}
        anchor.Point, anchor.RelativePoint, anchor.RelativeTo, anchor.XOffset, anchor.YOffset = WindowGetAnchor( playerFrame:GetName(), 1 )
        
        if( not DoesWindowExist( anchor.RelativeTo ) ) then
    		anchor = Pure.CopyTable( Pure.ResetAnchor )
    	end

		Pure.Set( "player-anchor-point", anchor.Point )
        Pure.Set( "player-anchor-relpoint", anchor.RelativePoint )
        Pure.Set( "player-anchor-relwin", anchor.RelativeTo )
        Pure.Set( "player-anchor-x", anchor.XOffset )
        Pure.Set( "player-anchor-y", anchor.YOffset )
        Pure.Set( "player-anchor-scale", playerFrame:GetScale() )
        
        -- Let the frame know we updated the layout
        playerFrame:UpdateLayout()
        
        -- Refresh the unit frames information
        PurePlayer.RefreshInformation()
    end
end

function PurePlayer.UpdateWindowPosition()
	if( playerFrame == nil ) then return end
	
	local anchor = {}
	anchor.Point 			= Pure.Get( "player-anchor-point" )
	anchor.RelativeTo  		= Pure.Get( "player-anchor-relwin" )
    anchor.RelativePoint	= Pure.Get( "player-anchor-relpoint" )
    anchor.XOffset			= Pure.Get( "player-anchor-x" )
    anchor.YOffset			= Pure.Get( "player-anchor-y" )
	
	-- Unregister with the layout editor
	LayoutEditor.UnregisterWindow( playerFrame:GetName() )
	
	if( not DoesWindowExist( anchor.RelativeTo ) ) then
		anchor = Pure.CopyTable( Pure.ResetAnchor )
	end
	
	-- Update the frame accordingly
	playerFrame:SetAnchor( anchor )
	playerFrame:SetScale( Pure.Get( "player-anchor-scale" ) )
	playerFrame:SetDimensions( Pure.Get("player-frame-dx" ), Pure.Get( "player-frame-dy" ) )
	
	-- Register with the layout editor
	LayoutEditor.RegisterWindow( playerFrame:GetName(), T["Player"] .. L" (Pure)", T["Player"] .. L" (Pure)", false, false, false, nil )
end

function PurePlayer.RefreshInformation()
	PurePlayer.UpdateInformation()
	PurePlayer.OnPlayerHitPointsUpdated()
	PurePlayer.OnPlayerActionPointsUpdated()
	PurePlayer.OnPlayerLevelUpdated()
	PurePlayer.OnPlayerRvRFlagUpdated()
	PurePlayer.OnPlayerCombatFlagUpdated()
	PurePlayer.OnPlayerMoraleUpdated( 0, GetPlayerMoraleLevel() )
	PurePlayer.OnPlayerCareerResourceUpdated(  0, GetCareerResource( GameData.BuffTargetType.SELF ) )
	PurePlayer.UpdateIsTarget( bIsCurrentTarget )
	PurePlayer.UpdateEffectsDispel( false )
end

function PurePlayer.UpdateInformation()
	playerFrame:UpdateName( GameData.Player.name, GameData.Player.career.line, GameData.Player.career.name )
end

function PurePlayer.UpdateIsTarget( isTarget )
	bIsCurrentTarget = isTarget
	playerFrame:UpdateIsTarget( isTarget )
end

function PurePlayer.OnPlayerLevelUpdated()
	playerFrame:UpdateLevel( GameData.Player.level, GameData.Player.Renown.curRank )
end

function PurePlayer.OnPlayerActionPointsUpdated()
	playerFrame:UpdateActionPoints( GameData.Player.actionPoints.current, GameData.Player.actionPoints.maximum )
	PurePlayer.CheckFrameDisplay()
end

function PurePlayer.OnPlayerCareerResourceUpdated( old, new )
	playerFrame:UpdateCareerResource( old, new )
end

function PurePlayer.OnPlayerHitPointsUpdated()
	playerFrame:UpdateHitPoints( GameData.Player.hitPoints.current, GameData.Player.hitPoints.maximum )
	PurePlayer.CheckFrameDisplay()
end

function PurePlayer.OnLoadingEnd()
	PurePlayer.RefreshEffects()
end

function PurePlayer.OnPlayerRvRFlagUpdated()
	playerFrame:UpdateRvRFlag( GameData.Player.rvrPermaFlagged or GameData.Player.rvrZoneFlagged )
end

function PurePlayer.OnPlayerMoraleUpdated( moralePercent, moraleLevel )
	playerFrame:UpdateMorale( moralePercent, moraleLevel )
end

function PurePlayer.OnPlayerEffectsUpdated( changedEffects, isFullList )
	if( changedEffects == nil ) then return end
	playerFrame:UpdateEffects( changedEffects, isFullList )
	
	if( Pure.Get( "player-dispel-show" ) ) then
		local dispel
		dispel, dispellableEffects = Pure.UpdateDispelTable( Pure.dispelTargetType.SELF, dispellableEffects, changedEffects, isFullList )
		PurePlayer.UpdateEffectsDispel( dispel )
	end
end

function PurePlayer.OnPlayerCombatFlagUpdated()
	PurePlayer.CheckFrameDisplay()
end

function PurePlayer.CheckFrameDisplay()
	if( bCombatShowHandling ) then
		local show = ( GameData.Player.inCombat ) 
			or ( GameData.Player.hitPoints.current < GameData.Player.hitPoints.maximum ) 
			or ( GameData.Player.actionPoints.current < GameData.Player.actionPoints.maximum )
		playerFrame:Show( show )
	end
end

function PurePlayer.OnTargetUpdated( targetClassification, targetId, targetType )
	if( targetClassification ~= c_FRIENDLY_TARGET and prevFriendlyTargetId ~= targetId ) then return end
	PurePlayer.UpdateIsTarget( targetType == SystemData.TargetObjectType.SELF )
	prevFriendlyTargetId = targetId
end

function PurePlayer.RefreshEffects()
	PurePlayer.OnPlayerEffectsUpdated( GetBuffs( GameData.BuffTargetType.SELF ), true )
end

function PurePlayer.UpdateEffectsDispel( dispel )
	playerFrame:UpdateEffectsDispel( dispel )
end

function PurePlayer.OnLButtonDown(flags)
	BroadcastEvent( SystemData.Events.TARGET_SELF )
end

function PurePlayer.OnRButtonUp(flags)
	local disableUnflag = true
    if (GameData.Player.rvrZoneFlagged == false and GameData.Player.rvrPermaFlagged == true) then
        disableUnflag = false
    end
    
    EA_Window_ContextMenu.CreateContextMenu( "PlayerWindow" )
    EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_FLAG_PLAYER_RVR), PlayerWindow.OnMenuClickFlagRvR, GameData.Player.rvrZoneFlagged or GameData.Player.rvrPermaFlagged, true )
    EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_UNFLAG_PLAYER_RVR), PlayerWindow.OnMenuClickUnFlagRvR, disableUnflag, true )
    
    -- Show the "Leave Party" option if the player is currently in a player-made party
    if( ( GroupWindow.inWorldGroup or IsWarBandActive() ) and not GameData.Player.isInScenario ) then
        EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_GROUP_OPTIONS ), EA_Window_OpenParty.OpenToManageTab, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
        EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_LEAVE_GROUP), PlayerWindow.OnMenuClickLeaveGroup, false, true )
        if ( GameData.Player.isGroupLeader ) then
			SystemData.UserInput.selectedGroupMember = GameData.Player.name
			EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_MAKE_MAIN_ASSIST ), GroupWindow.OnMakeMainAssist, IsPlayerMainAssist() == 1, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
        end
    else
    	EA_Window_ContextMenu.AddMenuItem( T["Open Parties Window"], PurePlayer.OnOpenPartiesWindow, WindowGetShowing( "EA_Window_OpenParty" ), true )
    end
    
    -- Show the "Leave Scenario Party" option if the player is in a scenario party
    if( GroupWindow.inScenarioGroup ) then
        EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_LEAVE_SCENARIO_GROUP), PlayerWindow.OnMenuClickLeaveScenarioGroup, false, true )        
    end
    
    EA_Window_ContextMenu.Finalize()
end

function PurePlayer.OnOpenPartiesWindow()
	EA_Window_OpenParty.SelectTab( EA_Window_OpenParty.TAB_NEARBY )
    EA_Window_OpenParty.ToggleFullWindow()
end

function PurePlayer.FormatHitPoints()
	local format = Pure.Get( "player-hitpoints-format" )
	for token, func in pairs( hitPointUpdateFunctions )
	do
		format = format:gsub( token, func )
	end
	return format
end

function PurePlayer.FormatActionPoints()
	local format = Pure.Get( "player-actionpoints-format" )
	for token, func in pairs( actionPointUpdateFunctions )
	do
		format = format:gsub( token, func )
	end
	return format
end
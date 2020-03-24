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

if not PureGroup then PureGroup = {} end

local PureGroup 					= PureGroup

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local pairs 						= pairs
local ipairs 						= ipairs
local tostring 						= tostring
local towstring 					= towstring
local tinsert 						= table.insert
local WindowSetShowing				= WindowSetShowing
local WindowSetScale				= WindowSetScale
local WindowSetDimensions			= WindowSetDimensions
local WStringsCompareIgnoreGrammer	= WStringsCompareIgnoreGrammer
local RegisterEventHandler			= RegisterEventHandler
local UnregisterEventHandler 		= UnregisterEventHandler

-- We use the group member end + 1 for ourself
local c_MAX_GROUP_MEMBERS			= 6
local c_FRIENDLY_TARGET         	= "selffriendlytarget"

local frameObject					= PureGroupUnitFrame
local frameType						= "PureGroup_Default"
local windowId						= "PureGroupUnitFrame"
local windowLayout 					= "PureGroupLayout"

local bIsLoaded						= false
local groupMembers					= {}
local groupData						= {}
local bIsShowing					= true
local warbandGroupIndex				= -1
local bShowPlayerInGroup			= true
local bRegisterEffectHandling		= false
local groupDispellableEffects		= {}

local prevFriendlyTargetId			= -1
local prevFriendlyTargetIndex		= -1

local function rev_iter(t, key)
  if (key <= 1) then
    return nil
  else
    local nkey = key - 1
    return nkey, t[nkey]
  end
end

local function ripairs(t)
  return rev_iter, t, (1 + table.getn(t))
end

if( PureTemplates ~= nil ) then 
	PureTemplates.RegisterTemplate( PureTemplates.Types.GROUP, frameType, frameObject, L"Pure - Default" ) 
end

function PureGroup.IsLoaded() return bIsLoaded end

function PureGroup.LoadUnitFrame()
	
	-- Only load if we are set to show
	if( not Pure.Get( "group-frame-show" ) or bIsLoaded ) then return end
	
	-- Store any configuration values we need to
	bShowPlayerInGroup = Pure.Get( "group-player-show" )
	bRegisterEffectHandling = Pure.Get( "group-dispel-show" ) or Pure.Get( "group-effects-show" )
	
	-- Create our layout window
	if( not DoesWindowExist( windowLayout ) ) then CreateWindow( windowLayout, false ) end
	WindowSetShowing( windowLayout, false )
	WindowSetHandleInput( windowLayout, Pure.Get( "group-frame-handleinput" ) )
	
	-- Retrieve our template information
	local template = PureTemplates.GetTemplateByName( PureTemplates.Types.GROUP, Pure.Get( "group-frame-template" ) )
	if( template ~= nil ) then
		frameObject 			= template.m_Frame
		frameType				= template.m_Type
		frameObject.m_Template 	= template.m_FrameType
	else
		d( "Pure group template(" .. tostring( Pure.Get( "group-frame-template" ) ) .. ") not found.  Using default." )
	end
	
	-- Create our frame factory
	UnitFrames:AddFrameFactory( frameType, frameObject )
	
	-- Create a frame for each potential group member
	for index = 1, c_MAX_GROUP_MEMBERS 
	do
		local frame = UnitFrames:CreateNewFrame( windowId  .. index, frameType, "group" .. index .. "pure" )
		
		-- Sanity check
		if( frame == nil ) then
			d( "Error creating Pure Group frame from template: " .. frameType )
			return	
		end
		
		-- Update our show when interface hidden setting
		WindowSetDrawWhenInterfaceHidden( frame:GetName(), Pure.Get( "group-frame-showinsiege" ) )
		
		if( index == 1 ) then
			frame:SetParent( windowLayout )
		else
			frame:SetParent( "Root" )
		end
		
		frame:Show( false )
		groupMembers[index] = frame
		groupDispellableEffects[index] = {}
	end
	
	-- Update the location of our frame
	PureGroup.UpdateWindowPosition()
	
	-- Load our unit frames
	for index, frame in ipairs( groupMembers )
	do
		frame:LoadUnitFrame()
	end
	
	-- Add our handler so we can resize our group unit frames accordingly, if it isnt already a handler
    local layoutEditorEventHandlerFound = false
    for k,v in pairs( LayoutEditor.EventHandlers )
    do
    	if( tostring( v ) == tostring( PureGroup.OnLayoutEditorEnd ) ) then
    		layoutEditorEventHandlerFound = true
    	end
    end
    if( not layoutEditorEventHandlerFound ) then
    	tinsert( LayoutEditor.EventHandlers, PureGroup.OnLayoutEditorEnd )
    end
    
    -- Register our event handlers
	RegisterEventHandler( SystemData.Events.BATTLEGROUP_UPDATED, 				"PureGroup.OnBattlegroupUpdated" )
	if( bRegisterEffectHandling ) then
		RegisterEventHandler( SystemData.Events.GROUP_EFFECTS_UPDATED, 			"PureGroup.OnGroupEffectsUpdated" )
	end
	RegisterEventHandler( SystemData.Events.GROUP_PLAYER_ADDED, 				"PureGroup.OnGroupPlayerAdded" )
	RegisterEventHandler( SystemData.Events.GROUP_STATUS_UPDATED, 				"PureGroup.OnGroupStatusUpdated" )
	RegisterEventHandler( SystemData.Events.GROUP_UPDATED, 						"PureGroup.OnGroupUpdated" )
	if( bShowPlayerInGroup ) then
		RegisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, 	"PureGroup.OnPlayerActionPointsUpdated" )
	    RegisterEventHandler( SystemData.Events.PLAYER_MAX_ACTION_POINTS_UPDATED, 	"PureGroup.OnPlayerActionPointsUpdated" )
	    RegisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED,    	"PureGroup.OnPlayerHitPointsUpdated" )
	    RegisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED,    	"PureGroup.OnPlayerHitPointsUpdated" )
	    if( bRegisterEffectHandling ) then
	    	RegisterEventHandler( SystemData.Events.PLAYER_EFFECTS_UPDATED,     "PureGroup.OnPlayerEffectsUpdated" )
	    end
	    RegisterEventHandler( SystemData.Events.PLAYER_MORALE_UPDATED,          "PureGroup.OnPlayerMoraleUpdated" )
	    RegisterEventHandler( SystemData.Events.PLAYER_RVR_FLAG_UPDATED,        "PureGroup.OnPlayerRvRFlagUpdated" )
	end
	RegisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 				"PureGroup.OnTargetUpdated" )
	RegisterEventHandler( SystemData.Events.SCENARIO_BEGIN, 					"PureGroup.OnScenarioBegin" )
    RegisterEventHandler( SystemData.Events.SCENARIO_END, 						"PureGroup.OnScenarioEnd" )
    RegisterEventHandler( SystemData.Events.SCENARIO_GROUP_JOIN, 				"PureGroup.OnScenarioGroupJoin" )
    RegisterEventHandler( SystemData.Events.SCENARIO_GROUP_LEAVE, 				"PureGroup.OnScenarioGroupLeave" )
    
    if( IsWarBandActive() ) then
    	PureGroup.OnBattlegroupUpdated()
    end
    PureGroup.OnGroupUpdated()
    
	bIsLoaded = true
end

function PureGroup.UnloadUnitFrame()
	if( not bIsLoaded ) then return end
	bIsLoaded = false
	
	UnregisterEventHandler( SystemData.Events.BATTLEGROUP_UPDATED, 				"PureGroup.OnBattlegroupUpdated" )
	if( bRegisterEffectHandling ) then
		UnregisterEventHandler( SystemData.Events.GROUP_EFFECTS_UPDATED, 		"PureGroup.OnGroupEffectsUpdated" )
	end
	UnregisterEventHandler( SystemData.Events.GROUP_PLAYER_ADDED, 				"PureGroup.OnGroupPlayerAdded" )
	UnregisterEventHandler( SystemData.Events.GROUP_STATUS_UPDATED, 			"PureGroup.OnGroupStatusUpdated" )
	UnregisterEventHandler( SystemData.Events.GROUP_UPDATED, 					"PureGroup.OnGroupUpdated" )
	if( bShowPlayerInGroup ) then
		UnregisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, "PureGroup.OnPlayerActionPointsUpdated" )
	    UnregisterEventHandler( SystemData.Events.PLAYER_MAX_ACTION_POINTS_UPDATED, "PureGroup.OnPlayerActionPointsUpdated" )
	    UnregisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED,    "PureGroup.OnPlayerHitPointsUpdated" )
	    UnregisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED,    "PureGroup.OnPlayerHitPointsUpdated" )
	    if( bRegisterEffectHandling ) then
	    	UnregisterEventHandler( SystemData.Events.PLAYER_EFFECTS_UPDATED,   "PureGroup.OnPlayerEffectsUpdated" )	
		end
	    UnregisterEventHandler( SystemData.Events.PLAYER_MORALE_UPDATED,        "PureGroup.OnPlayerMoraleUpdated" )
	    UnregisterEventHandler( SystemData.Events.PLAYER_RVR_FLAG_UPDATED,      "PureGroup.OnPlayerRvRFlagUpdated" )
	end
	UnregisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, 			"PureGroup.OnTargetUpdated" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_BEGIN, 					"PureGroup.OnScenarioBegin" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_END, 					"PureGroup.OnScenarioEnd" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_GROUP_JOIN, 				"PureGroup.OnScenarioGroupJoin" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_GROUP_LEAVE, 			"PureGroup.OnScenarioGroupLeave" )
    
    -- Unregister the unit frame with the layout editor
	LayoutEditor.UnregisterWindow( windowLayout )
    
    -- Destroy the unit frames
	for index, frame in ripairs( groupMembers )
	do
		frame:UnloadUnitFrame()
		frame:Show( false )
		UnitFrames:DestroyFrame( "group" .. index .. "pure", UnitFrames.REMOVE_DESTROYED_FRAME )
	end
	groupMembers = {}
end

function PureGroup.OnLayoutEditorEnd( exitCode )
	if( exitCode == LayoutEditor.EDITING_END ) then
        local anchor = {}
        anchor.Point, anchor.RelativePoint, anchor.RelativeTo, anchor.XOffset, anchor.YOffset = WindowGetAnchor( windowLayout, 1 )
        local scale = WindowGetScale( windowLayout )
        
        if( not DoesWindowExist( anchor.RelativeTo ) ) then
    		anchor = Pure.CopyTable( Pure.ResetAnchor )
    	end
        
		Pure.Set( "group-anchor-point", anchor.Point )
        Pure.Set( "group-anchor-relpoint", anchor.RelativePoint )
        Pure.Set( "group-anchor-relwin", anchor.RelativeTo )
        Pure.Set( "group-anchor-x", anchor.XOffset )
        Pure.Set( "group-anchor-y", anchor.YOffset )
        Pure.Set( "group-anchor-scale", scale )
        
        --
		-- Update the scale of the group unit frames
		--
		for index, frame in ipairs( groupMembers )
		do
			frame:SetDimensions( Pure.Get("group-anchor-dx"), Pure.Get( "group-anchor-dy" ) )
			frame:SetScale( scale )
			frame:UpdateLayout()
		end
		
		-- Reanchor the groups
		PureGroup.ReanchorGroupUnitFrames()
    end
end

function PureGroup.UpdateWindowPosition()
	-- Remove our window from the layout editor
	LayoutEditor.UnregisterWindow( windowLayout )
	
	local anchor = {}
	anchor.Point 			= Pure.Get( "group-anchor-point" )
	anchor.RelativeTo  		= Pure.Get( "group-anchor-relwin" )
    anchor.RelativePoint	= Pure.Get( "group-anchor-relpoint" )
    anchor.XOffset			= Pure.Get( "group-anchor-x" )
    anchor.YOffset			= Pure.Get( "group-anchor-y" )
	
	-- Clear any anchors playerFrame:GetName() window has
	WindowClearAnchors( windowLayout )

	if( not DoesWindowExist( anchor.RelativeTo ) ) then
    	anchor = Pure.CopyTable( Pure.ResetAnchor )
    end

	-- Set the anchor for its position on the screen
	WindowAddAnchor( windowLayout, 
		anchor.Point, 
		anchor.RelativeTo, 
		anchor.RelativePoint, 
		anchor.XOffset, 
		anchor.YOffset )
	
	-- Set the window's scale
	WindowSetScale( windowLayout, Pure.Get( "group-anchor-scale" ) )
	WindowSetDimensions( windowLayout, Pure.Get("group-anchor-dx"), Pure.Get( "group-anchor-dy" ) )
	
	--
	-- Update the scale of the group unit frames
	--
	for index, frame in ipairs( groupMembers )
	do
		frame:SetScale( Pure.Get( "group-anchor-scale" ) )
		frame:SetDimensions( Pure.Get("group-anchor-dx"), Pure.Get( "group-anchor-dy" ) )
	end
	
	-- Register the window with the layout editor
	LayoutEditor.RegisterWindow( windowLayout, T["Group"] .. L" (Pure)", T["Group"] .. L" (Pure)", false, false, false, nil )
end

function PureGroup.OnBattlegroupUpdated()
	Pure.Debug( "OnBattlegroupUpdated" )
	PureGroup.ConditionalDisplay()
end

function PureGroup.ConditionalDisplay()
	local isGroupDisplayable = PureGroup.IsGroupDisplayable()
	
	if( not isGroupDisplayable ) then
		if( PureGroup.IsShowing() ) then
			PureGroup.Show( false )
		end
		return false
	else
		if( not PureGroup.IsShowing() ) then
			PureGroup.Show( true )
		end
		return true
	end
	
	return PureGroup.IsShowing()
end

function PureGroup.OnGroupUpdated()
	Pure.Debug( "OnGroupUpdated" )
	PureGroup.UpdateGroupMembers()
end

function PureGroup.OnGroupStatusUpdated( groupMemberIndex )
	Pure.Debug( "OnGroupStatusUpdated" )
	if( not PureGroup.ConditionalDisplay() ) then return end
	
	local member = PartyUtils.GetPartyMember( groupMemberIndex )
	
	PureGroup.UpdateMemberStatus( groupMembers[groupMemberIndex], member )
end

function PureGroup.OnGroupPlayerAdded()
	Pure.Debug( "OnGroupPlayerAdded" )
	if( not PureGroup.ConditionalDisplay() ) then return end
	
	Sound.Play( Sound.GROUP_PLAYER_ADDED )
	
	-- Refresh member effects
	PureGroup.RefreshMemberEffects()
end

function PureGroup.UpdateGroupMembers()
	local isValid 			= false
	local isPlayerDisplayed = false
	
	if( not PureGroup.ConditionalDisplay() ) then return end
	
	--
	-- Retrieve our group data and add our player info to it if needed
	--
	groupData =  PartyUtils.GetPartyData()
	
	--
	-- Handle our regular group members
	--
	for index = 1, c_MAX_GROUP_MEMBERS - 1
	do
		isValid = PartyUtils.IsPartyMemberValid( index ) 
		
		if( isValid ) then
			PureGroup.UpdateFullMember( groupMembers[index], groupData[index] )
		end
		
		groupMembers[index]:Show( isValid )
	end
	
	-- Toggle the showing of the layout window 
	WindowSetShowing( windowLayout, groupMembers[1]:IsShowing() )
	
	--
	-- Handle our player group frame if needed
	--
	isPlayerDisplayed = bShowPlayerInGroup and ( PartyUtils.IsPartyActive() or ( GameData.Player.isInScenario and GameData.Player.isInScenarioGroup ) )
		
	if( isPlayerDisplayed ) then
		PureGroup.UpdateFullMember( groupMembers[c_MAX_GROUP_MEMBERS], PureGroup.GeneratePlayerGroupData() )
	end
	groupMembers[c_MAX_GROUP_MEMBERS]:Show( isPlayerDisplayed )
	
	--
	-- Reanchor the group frames
	--
	PureGroup.ReanchorGroupUnitFrames()
end

function PureGroup.UpdateFullMember( frame, member )
	-- Update the entire frame
	frame:UpdateUnit( member.name )
	frame:UpdateCareer( member.careerLine, member.careerName )
	frame:UpdateIsInSameRegion( member.isInSameRegion )
	frame:UpdateGroupLeader( member.isGroupLeader )
	frame:UpdateMainAssist( member.isMainAssist )
	frame:UpdateAssistant( member.isAssistant )
	frame:UpdateMasterLooter( member.isMasterLooter )
	frame:UpdateOnline( member.online )
	
	PureGroup.UpdateMemberStatus( frame, member )
	
	WindowSetGameActionData( frame:GetName(), GameData.PlayerActions.SET_TARGET, 0, member.name )
end

function PureGroup.UpdateMemberStatus( frame, member )
	frame:UpdateHitPoints( member.healthPercent )
	frame:UpdateActionPoints( member.actionPointPercent )
	frame:UpdateMorale( member.moraleLevel )
	frame:UpdateLevel( member.level )
	frame:UpdateRvRFlag( member.isRVRFlagged )
end

function PureGroup.Show( bShow )
	for index, frame in ipairs( groupMembers )
	do
		frame:Show( bShow and PureGroup.IsMemberValidByIndex( index ) )
	end
	
	bIsShowing = bShow
end

function PureGroup.IsShowing()
	return bIsShowing
end

function PureGroup.ReanchorGroupUnitFrames()
	-- Anchor all of the group unit frames off of the layout window
	local fillDirection				= Pure.Get( "group-fill-direction" )
	local xOffset					= Pure.Get( "group-frame-horizontal-offset" )
	local yOffset					= Pure.Get( "group-frame-vertical-offset" )
	local currentAnchor 			= {}
	currentAnchor.Point             = "topleft"
	currentAnchor.RelativePoint     = "topleft"
	currentAnchor.RelativeTo        = windowLayout
	currentAnchor.XOffset           = 0
	currentAnchor.YOffset           = 0 
	 
	for index, frame in pairs( groupMembers )
	do
		if( frame:IsShowing() ) then
			-- Clear the anchors for this frame
			frame:ClearAnchors()
			-- Set the new anchor for the frame
			frame:SetAnchor( currentAnchor )
			-- Get the anchor for the next frame
			currentAnchor = Pure.GetGroupUnitFrameAnchor( frame:GetName(), fillDirection, xOffset, yOffset )
		end
	end
end

function PureGroup.OnPlayerActionPointsUpdated()
	if( not PureGroup.IsShowing() ) then return end
	local frame = PureGroup.GetUnitFrameByMemberIndex( c_MAX_GROUP_MEMBERS ) 
	if( frame ~= nil ) then
		frame:UpdateActionPoints( ( GameData.Player.actionPoints.current / GameData.Player.actionPoints.maximum ) * 100 )
	end
end

function PureGroup.OnPlayerHitPointsUpdated()
	if( not PureGroup.IsShowing() ) then return end
	local frame = PureGroup.GetUnitFrameByMemberIndex( c_MAX_GROUP_MEMBERS )
	if( frame ~= nil ) then
		frame:UpdateHitPoints( ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum ) * 100 )
	end
end

function PureGroup.OnPlayerMoraleUpdated( moralePercent, moraleLevel )
	if( not PureGroup.IsShowing() ) then return end
	local frame = PureGroup.GetUnitFrameByMemberIndex( c_MAX_GROUP_MEMBERS )
	if( frame ~= nil ) then
		frame:UpdateMorale( moraleLevel )
	end
end

function PureGroup.OnPlayerRvRFlagUpdated()
	if( not PureGroup.IsShowing() ) then return end
	local frame = PureGroup.GetUnitFrameByMemberIndex( c_MAX_GROUP_MEMBERS )
	if( frame ~= nil ) then
		frame:UpdateRvRFlag( GameData.Player.rvrPermaFlagged or GameData.Player.rvrZoneFlagged )
	end
end

function PureGroup.OnGroupEffectsUpdated( memberIndex, changedEffects, isFullList, dispelType )
	PureGroup.ProcessEffectsUpdated( memberIndex + 1, changedEffects, isFullList, Pure.dispelTargetType.FRIENDLY )
end

function PureGroup.OnPlayerEffectsUpdated( changedEffects, isFullList )
	if( not PureGroup.IsShowing() ) then return end
	PureGroup.ProcessEffectsUpdated( GameData.BuffTargetType.SELF, changedEffects, isFullList, Pure.dispelTargetType.SELF )
end

function PureGroup.ProcessEffectsUpdated( memberIndex, changedEffects, isFullList, dispelType )
	if( changedEffects == nil ) then return end
	if( memberIndex == nil ) then return end
	if( not PureGroup.IsShowing() ) then return end
	
	local frame = PureGroup.GetUnitFrameByMemberIndex( memberIndex )
	
	if( frame ~= nil and frame:IsShowing() ) then
	
		frame:UpdateEffects( changedEffects, isFullList )
		
		if( Pure.Get( "group-dispel-show" ) ) then
			local dispel
			dispel, groupDispellableEffects[memberIndex] = Pure.UpdateDispelTable( dispelType, groupDispellableEffects[memberIndex], changedEffects, isFullList )
			frame:UpdateEffectsDispel( dispel )
		end	
	end
end

function PureGroup.RefreshMemberEffects()
	if( not PureGroup.IsShowing() ) then return end
	
	-- Clear any current effects/dispel information
	for index, frame in ipairs( groupMembers )
	do
		groupDispellableEffects[index] = {}
		frame:ClearEffects()
	end
	
	-- Perform our dispel checks
	PureGroup.OnPlayerEffectsUpdated( GetBuffs( GameData.BuffTargetType.SELF ), true )
	
	for index = 1, c_MAX_GROUP_MEMBERS -1
	do
		-- Only update effects for showing group members
		if( groupMembers[index] ~= nil ) then
			local groupEffectIndex = GameData.BuffTargetType.GROUP_MEMBER_START + index - 1
			PureGroup.OnGroupEffectsUpdated( groupEffectIndex, GetBuffs( groupEffectIndex ), true )
		end
	end
end

function PureGroup.OnScenarioBegin()	
	Pure.Debug( "OnScenarioBegin" )
	PureGroup.OnGroupUpdated()
end

function PureGroup.OnScenarioEnd()
	Pure.Debug( "OnScenarioEnd" )
	
	PureGroup.Show( false )
	
	PureGroup.OnGroupUpdated()
end

function PureGroup.OnScenarioGroupJoin()
	Pure.Debug( "OnScenarioGroupJoin" )
	PureGroup.OnGroupUpdated()
end

function PureGroup.OnScenarioGroupLeave()
	Pure.Debug( "OnScenarioGroupLeave" )
	PureGroup.OnGroupUpdated()
end

function PureGroup.OnTargetUpdated( targetClassification, targetId, targetType )
	-- We only care about friendly targets
	if( targetClassification ~= c_FRIENDLY_TARGET or not PureGroup.IsShowing() ) then return end
	
	-- Only update our target highlight if the target changes
	if( prevFriendlyTargetId ~= targetId ) then
		local frame
		
		-- Remove our old highlight
		if( prevFriendlyTargetIndex ~= nil and groupMembers[prevFriendlyTargetIndex] ~= nil ) then
			groupMembers[prevFriendlyTargetIndex]:UpdateIsTarget( false )
			prevFriendlyTargetIndex = -1
		end	
		
		if( targetType ~= SystemData.TargetObjectType.NONE ) then
			TargetInfo:UpdateFromClient()
			
			prevFriendlyTargetIndex, frame = PureGroup.GetUnitFrameByUnitName( TargetInfo:UnitName( c_FRIENDLY_TARGET ) )
			
			if( frame ~= nil ) then
				frame:UpdateIsTarget( true )
			end
		end
		
		prevFriendlyTargetId = targetId
	end
end

function PureGroup.OnLButtonUp( flag, x, y, unitIndex )
	if( GetDesiredInteractAction() == SystemData.InteractActions.TELEPORT ) then
        UseItemTargeting.SendTeleport()
    end
end

function PureGroup.OnRButtonUp( flag, x, y, unitIndex )
	local unitName = L""
	local frame = PureGroup.GetUnitFrameByMemberIndex( unitIndex )
	
	if( frame ~= nil ) then
		unitName = frame:GetUnitName()
	end 
	
	if( unitName:len() == 0 ) then return end

	SystemData.UserInput.selectedGroupMember = unitName

    -- Build the Custom Section of the Player Menu    
    local customMenuItems = {}    
    
    -- 1) World-Based Group Options
    local isNotLeader = GameData.Player.isGroupLeader ~= true
    if( GameData.Player.isInScenario == false or GameData.Player.isInSiege )
    then
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_GROUP_OPTIONS ), EA_Window_OpenParty.OpenToManageTab, false ) )
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_PARTY_FORM_WARPARTY ), GroupWindow.OnFormWarparty, isNotLeader ) )
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_MAKE_LEADER ), GroupWindow.OnMakeLeader, isNotLeader ) )
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_LEAVE_GROUP ), GroupWindow.OnLeaveGroup, false ) )       
    end

    -- 2) Main Assist
    -- Don't show the main assist option unless the player is the current main assist or group leader in a non scenario party
    -- This is done to keep persistent with how battlegroup context menu behaves
    local currentMainAssist = GroupWindow.GetMainAssist()
    if( ( GameData.Player.isGroupLeader and not GameData.Player.isInScenario ) or currentMainAssist == GameData.Player.name )
    then
        local disableMainAssist = currentMainAssist == unitName
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_MAKE_MAIN_ASSIST ), GroupWindow.OnMakeMainAssist, disableMainAssist ) ) 
    end

    -- Create the Menu
    PlayerMenuWindow.ShowMenu( unitName, 0, customMenuItems ) 
end

function PureGroup.GetUnitFrameByUnitName( name )
	local unitName
	
	for index, frame in pairs( groupMembers )
	do
		if( frame:IsShowing() ) then 
			unitName = frame:GetUnitName()
			if( unitName ~= nil ) then
				if( WStringsCompareIgnoreGrammer( name, unitName ) == 0 ) then
					return index, frame
				end
			end
		end
	end
	
	return nil, nil
end

function PureGroup.GetUnitFrameByMemberIndex( memberIndex )
	return groupMembers[memberIndex]
end

function PureGroup.IsMemberValid( member )
    return ( member ~= nil and
             member.name ~= nil and
             member.name ~= L"" and
			 member.level > 0 )
end

function PureGroup.IsMemberValidByIndex( index )
	return PureGroup.IsMemberValid( groupData[index] )
end

function PureGroup.IsGroupDisplayable()
	Pure.Debug( "IsInScenario: " ..tostring(GameData.Player.isInScenario) .. " Game-IsInScenarioGroup:  " .. tostring( GameData.Player.isInScenarioGroup ) .. "  IsWarBandActive: " .. tostring(IsWarBandActive() ) .. "   IsInSiege: " ..tostring(GameData.Player.isInSiege ) )
	
	-- We are in a regular warband
	if( not GameData.Player.isInScenario and not GameData.Player.isInScenarioGroup and IsWarBandActive() ) then return false end
	
	-- This is the weird case where we are in a city siege, but arent in a group
	if( not GameData.Player.isInScenario and not GameData.Player.isInScenarioGroup and not IsWarBandActive() and GameData.Player.isInSiege ) then return false end
	
	-- If we are in a scenario but not in a scenario group
	if( GameData.Player.isInScenario and not GameData.Player.isInScenarioGroup ) then return false end
	
	-- If we are in a scenario or scenario group, we defer to the display setting
	if( ( GameData.Player.isInScenario or GameData.Player.isInScenarioGroup ) ) then return Pure.Get( "group-frame-showinscenario" ) end
	
	return true
end

function PureGroup.GeneratePlayerGroupData()
	local player 				= {}
	player.zoneNum				= GameData.Player.zone
	player.isAssistant			= GameData.Player.isWarbandAssistant
	player.isRVRFlagged			= GameData.Player.rvrPermaFlagged or GameData.Player.rvrZoneFlagged
	player.isInSameRegion		= true
	player.level				= GameData.Player.level
	player.healthPercent		= ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum ) * 100
	player.moraleLevel			= GetPlayerMoraleLevel()
	player.isGroupLeader		= GameData.Player.isGroupLeader
	player.name					= GameData.Player.name
	player.isMainAssist			= GroupWindow.GetMainAssist() == GameData.Player.name
	player.worldObjNum			= GameData.Player.worldObjNum
	player.careerLine			= GameData.Player.career.line 
	player.careerName			= GameData.Player.career.name
	player.online				= true
	player.actionPointPercent	= ( GameData.Player.actionPoints.current / GameData.Player.actionPoints.maximum ) * 100
	player.isMasterLooter		= GameData.Player.Group.Settings.playerIsMasterLooter
	
	-- We use this to flag this as the player 
	player.PurePlayerFlag		= true
	
	return player
end
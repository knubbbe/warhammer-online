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

if not PureGroupPet then PureGroupPet = {} end

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local PureGroupPet 	= PureGroupPet
local pairs 		= pairs
local ipairs 		= ipairs
local tostring 		= tostring
local towstring 	= towstring
local tinsert 		= table.insert

-- We use the group member end + 1 for ourself
local c_MAX_GROUP_MEMBERS			= GameData.BuffTargetType.GROUP_MEMBER_END + 1
local c_FRIENDLY_TARGET         	= "selffriendlytarget"

local frameObject					= PureGroupPetUnitFrame
local frameType						= "PureGroupPet_Default"
local windowId						= "PureGroupPetUnitFrame"
local windowLayout 					= "PureGroupPetLayout"

local bIsLoaded						= false
local groupMembers					= {}
local groupData						= nil
local sortedGroupData				= nil
local bIsShowing					= true
local prevFriendlyTargetId			= -1
local prevFriendlyTargetIndex		= -1

local unitIndexToTargetMap =
{
	[1]	= { targetEvent = SystemData.Events.TARGET_GROUP_MEMBER_1_PET },
	[2]	= { targetEvent = SystemData.Events.TARGET_GROUP_MEMBER_2_PET },
	[3]	= { targetEvent = SystemData.Events.TARGET_GROUP_MEMBER_3_PET },
	[4]	= { targetEvent = SystemData.Events.TARGET_GROUP_MEMBER_4_PET },
	[5]	= { targetEvent = SystemData.Events.TARGET_GROUP_MEMBER_5_PET },
}

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
	PureTemplates.RegisterTemplate( PureTemplates.Types.GROUP_PET, frameType, frameObject, L"Pure - Default" ) 
end

function PureGroupPet.IsLoaded() return bIsLoaded end

function PureGroupPet.LoadUnitFrame()
	
	-- Only load if we are set to show
	if( not Pure.Get( "grouppet-frame-show" ) or bIsLoaded ) then return end
	
	-- Create our layout window
	if( not DoesWindowExist( windowLayout ) ) then CreateWindow( windowLayout, false ) end
	WindowSetShowing( windowLayout, false )
	WindowSetHandleInput( windowLayout, Pure.Get( "grouppet-frame-handleinput" ) )
            
	-- Retrieve our template information
	local template = PureTemplates.GetTemplateByName( PureTemplates.Types.GROUP_PET, Pure.Get( "grouppet-frame-template" ) )
	if( template ~= nil ) then
		frameObject 			= template.m_Frame
		frameType				= template.m_Type
		frameObject.m_Template 	= template.m_FrameType
	else
		d( "Pure group pet template(" .. tostring( Pure.Get( "grouppet-frame-template" ) ) .. ") not found.  Using default." )
	end
	
	-- Create our frame factory
	UnitFrames:AddFrameFactory( frameType, frameObject )
	
	-- Create a frame for each potential group member
	for index = 1, c_MAX_GROUP_MEMBERS 
	do
		local frame = UnitFrames:CreateNewFrame( windowId  .. index, frameType, "grouppet" .. index .. "pure" )
		
		-- Sanity check
		if( frame == nil ) then
			d( "Error creating Pure Group Pet frame from template: " .. frameType )
			return	
		end
		
		-- Update our show when interface hidden setting
		WindowSetDrawWhenInterfaceHidden( frame:GetName(), Pure.Get( "grouppet-frame-showinsiege" ) )
		
		if( index == 1 ) then
			frame:SetParent( windowLayout )
		else
			frame:SetParent( "Root" )
		end
		
		groupMembers[index] = frame
	end
	
	-- Update the location of our frame
	PureGroupPet.UpdateWindowPosition()
	
	-- Load our unit frames
	for index, frame in ipairs( groupMembers )
	do
		frame:LoadUnitFrame()
	end

	-- Add our handler so we can resize our group unit frames accordingly, if it isnt already a handler
    local layoutEditorEventHandlerFound = false
    for k,v in pairs( LayoutEditor.EventHandlers )
    do
    	if( tostring( v ) == tostring( PureGroupPet.OnLayoutEditorEnd ) ) then
    		layoutEditorEventHandlerFound = true
    	end
    end
    if( not layoutEditorEventHandlerFound ) then
    	tinsert( LayoutEditor.EventHandlers, PureGroupPet.OnLayoutEditorEnd )
    end
	
	-- Register our event handlers
	RegisterEventHandler( SystemData.Events.BATTLEGROUP_UPDATED, 				"PureGroupPet.OnBattlegroupUpdated")
	RegisterEventHandler( SystemData.Events.GROUP_STATUS_UPDATED, 				"PureGroupPet.OnGroupStatusUpdated")
	RegisterEventHandler( SystemData.Events.GROUP_PLAYER_ADDED, 				"PureGroupPet.OnGroupPlayerAdded")
	RegisterEventHandler( SystemData.Events.GROUP_UPDATED, 						"PureGroupPet.OnGroupUpdated" )
	RegisterEventHandler( SystemData.Events.LOADING_END, 						"PureGroupPet.OnLoadingEnd" )
	RegisterEventHandler( SystemData.Events.PLAYER_PET_HEALTH_UPDATED,         	"PureGroupPet.OnPlayerPetHealthUpdated" )
    RegisterEventHandler( SystemData.Events.SCENARIO_BEGIN, 					"PureGroupPet.OnScenarioBegin" )
    RegisterEventHandler( SystemData.Events.SCENARIO_END, 						"PureGroupPet.OnScenarioEnd" )
    RegisterEventHandler( SystemData.Events.SCENARIO_GROUP_JOIN, 				"PureGroupPet.OnScenarioGroupJoin" )
    RegisterEventHandler( SystemData.Events.SCENARIO_GROUP_LEAVE, 				"PureGroupPet.OnScenarioGroupLeave" )
    
	-- Call our on group updated function
	PureGroupPet.OnGroupUpdated()
	
	bIsLoaded = true
end

function PureGroupPet.UnloadUnitFrame()
	if( not bIsLoaded ) then return end
	bIsLoaded = false
	
	UnregisterEventHandler( SystemData.Events.BATTLEGROUP_UPDATED, 				"PureGroupPet.OnBattlegroupUpdated")
	UnregisterEventHandler( SystemData.Events.GROUP_STATUS_UPDATED, 			"PureGroupPet.OnGroupStatusUpdated")
	UnregisterEventHandler( SystemData.Events.GROUP_PLAYER_ADDED, 				"PureGroupPet.OnGroupPlayerAdded")
	UnregisterEventHandler( SystemData.Events.GROUP_UPDATED, 					"PureGroupPet.OnGroupUpdated" )
	UnregisterEventHandler( SystemData.Events.LOADING_END, 						"PureGroupPet.OnLoadingEnd" )
	UnregisterEventHandler( SystemData.Events.PLAYER_PET_HEALTH_UPDATED,        "PureGroupPet.OnPlayerPetHealthUpdated" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_BEGIN, 					"PureGroupPet.OnScenarioBegin" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_END, 					"PureGroupPet.OnScenarioEnd" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_GROUP_JOIN, 				"PureGroupPet.OnScenarioGroupJoin" )
    UnregisterEventHandler( SystemData.Events.SCENARIO_GROUP_LEAVE, 			"PureGroupPet.OnScenarioGroupLeave" )
    
	-- Unregister the unit frame with the layout editor
	LayoutEditor.UnregisterWindow( windowLayout )
    
    -- Destroy the unit frames
	for index, frame in ripairs( groupMembers )
	do
		frame:UnloadUnitFrame()
		frame:Show( false )
		UnitFrames:DestroyFrame( "grouppet" .. index .. "pure", UnitFrames.REMOVE_DESTROYED_FRAME )
	end
	groupMembers = {}
end

function PureGroupPet.OnLayoutEditorEnd( exitCode )
	if( exitCode == LayoutEditor.EDITING_END ) then
		local anchor = {}
        anchor.Point, anchor.RelativePoint, anchor.RelativeTo, anchor.XOffset, anchor.YOffset = WindowGetAnchor( windowLayout, 1 )
        local scale = WindowGetScale( windowLayout )
        
        if( not DoesWindowExist( anchor.RelativeTo ) ) then
    		anchor = Pure.CopyTable( Pure.ResetAnchor )
    	end
		
		Pure.Set( "grouppet-anchor-point", anchor.Point )
        Pure.Set( "grouppet-anchor-relpoint", anchor.RelativePoint )
        Pure.Set( "grouppet-anchor-relwin", anchor.RelativeTo )
        Pure.Set( "grouppet-anchor-x", anchor.XOffset )
        Pure.Set( "grouppet-anchor-y", anchor.YOffset )
        Pure.Set( "grouppet-anchor-scale", scale )
        
        --
		-- Update the scale of the group unit frames
		--
		for index, frame in ipairs( groupMembers )
		do
			frame:SetDimensions( Pure.Get("grouppet-anchor-dx"), Pure.Get( "grouppet-anchor-dy" ) )
			frame:SetScale( scale )
			frame:UpdateLayout()
		end
		
		-- Reanchor the groups
		PureGroupPet.ReanchorGroupUnitFrames()
    end
end

function PureGroupPet.UpdateWindowPosition()
	local anchor = {}
	anchor.Point 			= Pure.Get( "grouppet-anchor-point" )
	anchor.RelativeTo  		= Pure.Get( "grouppet-anchor-relwin" )
    anchor.RelativePoint	= Pure.Get( "grouppet-anchor-relpoint" )
    anchor.XOffset			= Pure.Get( "grouppet-anchor-x" )
    anchor.YOffset			= Pure.Get( "grouppet-anchor-y" )
    
	-- Remove our window from the layout editor
	LayoutEditor.UnregisterWindow( windowLayout )
	
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
	WindowSetScale( windowLayout, Pure.Get( "grouppet-anchor-scale" ) )
	WindowSetDimensions( windowLayout, Pure.Get("grouppet-anchor-dx" ), Pure.Get( "grouppet-anchor-dy" ) )
	
	-- Register the window with the layout editor
	LayoutEditor.RegisterWindow( windowLayout, T["Group Pet"] .. L" (Pure)", T["Group Pet"] ..L" (Pure)", false, false, false, nil )
end

function PureGroupPet.OnBattlegroupUpdated()
	PureGroupPet.ConditionalDisplay()
end

function PureGroupPet.ConditionalDisplay()
	local isGroupDisplayable = PureGroupPet.IsGroupDisplayable()
	
	if( not isGroupDisplayable ) then
		if( PureGroupPet.IsShowing() ) then
			PureGroupPet.Show( false )
		end
		return false
	else
		if( not PureGroupPet.IsShowing() ) then
			PureGroupPet.Show( true )
		end
		return true
	end
	return PureGroupPet.IsShowing()
end

function PureGroupPet.OnGroupUpdated()
	if( not PureGroupPet.ConditionalDisplay() ) then return end
	
	groupData = PartyUtils.GetPartyData()
	
	-- Update the group members
	PureGroupPet.UpdateGroupMembers()
end

function PureGroupPet.OnGroupStatusUpdated( groupMemberIndex )
	if( not PureGroupPet.ConditionalDisplay() ) then return end
	
	local member = PartyUtils.GetPartyMember( groupMemberIndex )
	
	PureGroupPet.UpdateMemberStatus( groupMembers[groupMemberIndex], member )
end

function PureGroupPet.UpdateFullMember( frame, member )
	frame:UpdateUnit( member.name, member.careerLine, member.careerName )
	frame:UpdateIsInSameRegion( member.isInSameRegion )
	frame:UpdateOnline( member.online )
	
	PureGroupPet.UpdateMemberStatus( frame, member )
end

function PureGroupPet.UpdateMemberStatus( frame, member )
	frame:UpdateHitPoints( member.Pet.healthPercent )
end

function PureGroupPet.OnGroupPlayerAdded()
	if( not PureGroupPet.ConditionalDisplay() ) then return end
end

function PureGroupPet.OnLoadingEnd()
	PureGroupPet.OnGroupUpdated()
end

function PureGroupPet.UpdateGroupMembers()
	if( groupData == nil ) then return end
	
	local isValid 			= false
	local isPlayerDisplayed = false
	
	--
	-- Handle our regular group members
	--
	for index, member in ipairs( groupData )
	do
		isValid = PureGroupPet.IsMemberValid( member )
		
		if( isValid ) then
			PureGroupPet.UpdateFullMember( groupMembers[index], member )
		end
		
		groupMembers[index]:Show( isValid )
	end
	
	-- Toggle the showing of the layout window 
	WindowSetShowing( windowLayout, groupMembers[1]:IsShowing() )
	
	--
	-- Handle our player group frame if needed
	--
	isPlayerDisplayed = ( PartyUtils.IsPartyActive() or ( GameData.Player.isInScenario and GameData.Player.isInScenarioGroup ) ) and Pure.IsCareerPetClass( GameData.Player.careerLine )
		
	if( isPlayerDisplayed ) then
		PureGroupPet.UpdateFullMember( groupMembers[c_MAX_GROUP_MEMBERS], PureGroupPet.GeneratePlayerPetGroupData() )
	end
	
	groupMembers[c_MAX_GROUP_MEMBERS]:Show( isPlayerDisplayed )
	
	--
	-- Reanchor the group frames
	--
	PureGroupPet.ReanchorGroupUnitFrames()
end

function PureGroupPet.Show( bShow )
	for index, frame in ipairs( groupMembers )
	do
		frame:Show( bShow and PureGroupPet.IsMemberValidByIndex( index ) )
	end
	
	bIsShowing = bShow
end

function PureGroupPet.IsShowing()
	return bIsShowing
end

function PureGroupPet.ReanchorGroupUnitFrames()
	-- Anchor all of the group unit frames off of the layout window
	local fillDirection				= Pure.Get( "grouppet-fill-direction" )
	local xOffset					= Pure.Get( "grouppet-frame-horizontal-offset" )
	local yOffset					= Pure.Get( "grouppet-frame-vertical-offset" )
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

function PureGroupPet.OnScenarioBegin()
	PureGroupPet.OnGroupUpdated()
end

function PureGroupPet.OnScenarioEnd()
	PureGroupPet.Show( false )
	
	PureGroupPet.OnGroupUpdated()
end

function PureGroupPet.OnScenarioGroupJoin()
	PureGroupPet.OnGroupUpdated()
end

function PureGroupPet.OnScenarioGroupLeave()
	PureGroupPet.OnGroupUpdated()
end

function PureGroupPet.OnPlayerPetHealthUpdated()
	if( not PureGroupPet.IsShowing() ) then return end
	local frame = groupMembers[c_MAX_GROUP_MEMBERS]
	if( frame ~= nil ) then
		frame:UpdateHitPoints( GameData.Player.Pet.healthPercent )
	end
end

function PureGroupPet.OnLButtonDown( flags, x, y, unitIndex )
	if( unitIndexToTargetMap[unitIndex] ~= nil ) then
		BroadcastEvent( unitIndexToTargetMap[unitIndex].targetEvent )
	end
end

function PureGroupPet.IsMemberValid( member )
	if( not Pure.IsCareerPetClass( member.careerLine ) ) then return false end
	
    return ( member ~= nil and
             member.name ~= nil and
             member.name ~= L"" and
			 member.level > 0 )
end

function PureGroupPet.IsMemberValidByIndex( index )
	if( groupData == nil or groupData[index] == nil ) then return false end
	return PureGroupPet.IsMemberValid( groupData[index] )
end

function PureGroupPet.GeneratePlayerPetGroupData()
	local player 				= {}
	player.Pet 					= {}
	
	player.Pet.healthPercent	= GameData.Player.Pet.healthPercent
	player.name					= GameData.Player.name
	player.level				= GameData.Player.level
	player.careerLine			= GameData.Player.career.line
	player.isInSameRegion		= true
	player.online				= true
	
	return player
end

function PureGroupPet.IsGroupDisplayable()
	Pure.Debug( "IsInScenario: " ..tostring(GameData.Player.isInScenario) .. " Game-IsInScenarioGroup:  " .. tostring( GameData.Player.isInScenarioGroup ) .. "  IsWarBandActive: " .. tostring(IsWarBandActive() ) .. "   IsInSiege: " ..tostring(GameData.Player.isInSiege ) )
	
	-- We are in a regular warband
	if( not GameData.Player.isInScenario and not GameData.Player.isInScenarioGroup and IsWarBandActive() ) then return false end
	
	-- This is the weird case where we are in a city siege, but arent in a group
	if( not GameData.Player.isInScenario and not GameData.Player.isInScenarioGroup and not IsWarBandActive() and GameData.Player.isInSiege ) then return false end
	
	-- If we are in a scenario but not in a scenario group
	if( GameData.Player.isInScenario and not GameData.Player.isInScenarioGroup ) then return false end
	
	-- If we are in a scenario or scenario group, we defer to the display setting
	if( ( GameData.Player.isInScenario or GameData.Player.isInScenarioGroup ) ) then return Pure.Get( "grouppet-frame-showinscenario" ) end
	
	return true
end
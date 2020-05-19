----------------------------------------------------------------
-- Global Variables
----------------------------------------------------------------

CleanGroupWindow = {}

----------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------
CleanGroupWindow.MAX_GROUP_MEMBERS = 5
CleanGroupWindow.PLAYER_WINDOW_SIZE = { x=200, y=74 }
CleanGroupWindow.Buffs = {}
CleanGroupWindow.hitPointAlerts = {}

CleanGroupWindow.groupMembersAnchors = {}
CleanGroupWindow.groupMembers = {}
CleanGroupWindow.groupPets = {}

CleanGroupWindow.GrantedAbilityEffects = {}
CleanGroupWindow.currentMouseOverGrantedAbility = {}

CleanGroupWindow.curPlayer = { name=L"", objNum=0 }

CleanGroupWindow.inScenarioGroup = false
CleanGroupWindow.inWorldGroup = false

CleanGroupWindow.NUM_LOOT_MODES = 3
CleanGroupWindow.NUM_LOOT_THRESHOLDS = 5
local c_GROUP_MEMBER = "CleanGroupMember"
local c_GROUP_PET = "GroupPet"

CleanGroupWindow.LOOT_OPTIONS_TOOLTIP_ANCHOR = { Point="topright", RelativeTo="GroupOptionsWindow", RelativePoint="topleft", XOffset=5, YOffset=0 }

CleanGroupWindow.CONTAINER_WINDOW = "CleanGroupWindow"

----------------------------------------------------------------
-- CleanGroupWindow Functions
----------------------------------------------------------------

function CleanGroupWindow.Initialize()

    UnitFrames:AddFrameFactory ("CleanUnitFrame", CleanGroupMemberUnitFrame)

    -- Register this window for movement with the Layout Editor
    LayoutEditor.RegisterWindow( CleanGroupWindow.CONTAINER_WINDOW,  
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_PARTY_MEMBERS_NAME )..L" (Clean)",
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_PARTY_MEMBERS_DESC )..L" (Clean)",
                                false, false,
                                true, nil )

    -- Register events
    RegisterEventHandler( SystemData.Events.L_BUTTON_DOWN_PROCESSED, "CleanGroupWindow.OnLButtonDownProcessed")
    RegisterEventHandler( SystemData.Events.R_BUTTON_DOWN_PROCESSED, "CleanGroupWindow.OnRButtonDownProcessed")
    RegisterEventHandler( SystemData.Events.GROUP_UPDATED, "CleanGroupWindow.OnGroupUpdated")
    RegisterEventHandler( SystemData.Events.GROUP_STATUS_UPDATED, "CleanGroupWindow.OnStatusUpdated")
    RegisterEventHandler( SystemData.Events.GROUP_EFFECTS_UPDATED, "CleanGroupWindow.OnEffectsUpdated")
    RegisterEventHandler( SystemData.Events.GROUP_PLAYER_ADDED, "CleanGroupWindow.OnGroupPlayerAdded")
    RegisterEventHandler(SystemData.Events.BATTLEGROUP_UPDATED, "CleanGroupWindow.ConditionalShow")
    RegisterEventHandler( SystemData.Events.SCENARIO_BEGIN, "CleanGroupWindow.OnScenarioBegin")
    RegisterEventHandler( SystemData.Events.SCENARIO_END, "CleanGroupWindow.OnScenarioEnd")
    RegisterEventHandler( SystemData.Events.SCENARIO_GROUP_JOIN, "CleanGroupWindow.OnScenarioGroupJoin")
    RegisterEventHandler( SystemData.Events.SCENARIO_GROUP_LEAVE, "CleanGroupWindow.OnScenarioGroupLeave")
    RegisterEventHandler (SystemData.Events.INTERFACE_RELOADED, "CleanGroupWindow.UpdateGroupMembers")
    WindowRegisterEventHandler ("CleanGroupWindow", SystemData.Events.PLAYER_BEGIN_CAST, "CleanGroupWindow.OnPlayerCast")
    WindowRegisterEventHandler ("CleanGroupWindow", SystemData.Events.PLAYER_TARGET_UPDATED, "CleanGroupWindow.OnTargetUpdated")
    
    RegisterEventHandler(SystemData.Events.LOADING_END, "CleanGroupWindow.UpdateEffects")
    
    -- Stop the regular group buffs from showing
    GroupWindow.UpdateEffects = function() return end
    GroupWindow.OnEffectsUpdated = function() return end
    GroupWindow.UpdateGroupEffects = function() return end
    GroupWindow.UpdateGroupMembersEffects = function () return end
    
    -- Stop the regular group window from re-showing itself in a scenario
    GroupWindow.OnScenarioGroupJoin = function() return end
    GroupWindow.OnScenarioBegin = function() return end
    GroupWindow.ConditionalShow = function() return end
    GroupWindow.OnStatusUpdated = function() return end
    
    -- Hide the default group window
    WindowSetShowing("GroupWindow", false)
    
    -- Initialize the Group Window
    for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
        CleanGroupWindow.hitPointAlerts[index] = false        
    end    
    
    CleanGroupWindow.groupData = GetGroupData()
    CleanGroupWindow.UpdateGroupMembers()
    CleanGroupWindow.UpdateEffects()
    
    GroupWindow.UpdateGroupSettings = function() return end --meh, might as well fix the error message from Mythic's own code
end

function CleanGroupWindow.Shutdown()
    -- set the default group window to showing again
    WindowSetShowing("GroupWindow", true)
    WindowSetAlpha("GroupWindow", 1.0)
end

function CleanGroupWindow.OnPlayerCast(spellId, isChannel, castTime)
    if CleanSettings.MouseOverCast then
        groupIndex = tonumber((SystemData.MouseOverWindow.name):match("CleanGroupWindowPlayer([1-5])"))
        if groupIndex then
            local abilityData = GetAbilityTable(GameData.AbilityType.STANDARD)
            if (abilityData[spellId]) and (abilityData[spellId].targetType == 2) then
                CleanGroupWindow.oldTarget = TargetInfo:UnitName("selffriendlytarget")
                TargetPlayer(CleanGroupWindow.groupData[groupIndex].name)
            end
        end
    end
end

function CleanGroupWindow.OnTargetUpdated()
    if CleanGroupWindow.oldTarget then
        if CleanGroupWindow.oldTarget ~= L"" then TargetPlayer(CleanGroupWindow.oldTarget) end
        CleanGroupWindow.oldTarget = nil
    end
end

-- Scenario Begin Handler
function CleanGroupWindow.OnScenarioBegin()
        
    -- Hide the default group window while in a scenario and not in a scenario group
    if( GameData.Player.isInScenario ) then
        if( GameData.Player.isInSiege == false and CleanGroupWindow.inScenarioGroup == false ) then
            for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
                if (CleanGroupWindow.IsMemberValid(index) == true) then
                    CleanGroupWindow.groupMembers[index]:Show (false)
                    CleanGroupWindow.Buffs[index]:ClearAllBuffs()
                end
            end
        end
    end
    
end

-- Scenario End Handler
function CleanGroupWindow.OnScenarioEnd()
        
    -- When a scenario ends, force a group window to hide until the next group update
    -- passes through from the server
    CleanGroupWindow.inScenarioGroup = false
    for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
        if (CleanGroupWindow.IsMemberValid(index) == true) then
            CleanGroupWindow.groupMembers[index]:Show (false)
            CleanGroupWindow.Buffs[index]:ClearAllBuffs()
        end
    end
    CleanGroupWindow.UpdateGroupMembers()
end

-- Scenario Group Join Handler
function CleanGroupWindow.OnScenarioGroupJoin()
    
    if( GameData.Player.isInScenario ) then
        if( GameData.Player.isInSiege == false ) then
            CleanGroupWindow.inScenarioGroup = true
            CleanGroupWindow.UpdateGroupMembers()
        end
    end

end

-- Scenario Group Leave Handler
function CleanGroupWindow.OnScenarioGroupLeave()
    
    if( GameData.Player.isInScenario ) then
        if( GameData.Player.isInSiege == false ) then
            CleanGroupWindow.inScenarioGroup = false
            CleanGroupWindow.UpdateGroupMembers()
        end
    end

end

-- Update all available Group Member Windows with the correct anchor, as well as hide/show windows as needed.
-- Function will only Populate the Group Member information if parameter is set to 'true'
function CleanGroupWindow.PositionGroupMemberWindows ( shouldPopulate )
    for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
        if ( CleanGroupWindow.IsMemberValid(index) ) then
            -- New Player create the new window
            if (CleanGroupWindow.groupMembers[index] == nil ) then
                CleanGroupWindow.groupMembers[index] = UnitFrames:CreateNewFrame("CleanGroupWindowPlayer"..index, "CleanUnitFrame", c_GROUP_MEMBER..index)
                CleanGroupWindow.groupMembers[index]:SetParent( CleanGroupWindow.CONTAINER_WINDOW )
                CleanGroupWindow.groupMembers[index]:SetScale( WindowGetScale( CleanGroupWindow.CONTAINER_WINDOW ) )
            end
            -- Reposition the anchors so that it doesn't conflict with pet or buff windows.
            CleanGroupWindow.groupMembers[index]:ClearAnchors()
            if (index == 1) then
                CleanGroupWindow.groupMembers[index]:SetAnchor( {Point = "topleft", RelativePoint = "topleft", RelativeTo = CleanGroupWindow.CONTAINER_WINDOW, XOffset = 0, YOffset = 3} )
            else
                local prevIndex = index - 1
                --if (CleanGroupWindow.groupData[prevIndex].Pet.healthPercent ~= 0) then
                --    CleanGroupWindow.groupMembers[index]:SetAnchor( {Point = "bottomleft", RelativePoint = "topleft", RelativeTo = "CleanGroupWindowPlayer"..prevIndex, XOffset = 0, YOffset = 32} )
                --else
                  if CleanSettings.Group.showBuffs then
                    CleanGroupWindow.groupMembers[index]:SetAnchor( {Point = "bottomleft", RelativePoint = "topleft", RelativeTo = "CleanGroupWindowPlayer"..prevIndex, XOffset = 0, YOffset = 32} )
                  else
                    CleanGroupWindow.groupMembers[index]:SetAnchor( {Point = "bottomleft", RelativePoint = "topleft", RelativeTo = "CleanGroupWindowPlayer"..prevIndex, XOffset = 0, YOffset = -10} )
                  end
                --end
            end
            
            -- If this player has an active pet, create a frame for its information
            if (CleanGroupWindow.groupData[index].Pet.healthPercent ~= nil and 
                    CleanGroupWindow.groupData[index].Pet.healthPercent ~= 0) then
                if ( DoesWindowExist("GroupWindowPet"..index) == false ) then
                    GroupWindow.groupPets[index] = UnitFrames:CreateNewFrame("GroupWindowPet"..index, UnitFrames.UNITFRAME_GROUP_PET, c_GROUP_PET..index)
                    GroupWindow.groupPets[index]:SetParent( CleanGroupWindow.CONTAINER_WINDOW )
                    GroupWindow.groupPets[index]:SetScale( WindowGetScale( CleanGroupWindow.CONTAINER_WINDOW ) )
                else
                    -- steal the pet frame from the default if it already created it
                    GroupWindow.groupPets[index]:SetParent( CleanGroupWindow.CONTAINER_WINDOW )
                    GroupWindow.groupPets[index]:SetScale( WindowGetScale( CleanGroupWindow.CONTAINER_WINDOW ) )
                end
                WindowSetShowing("GroupWindowPet"..index.."Portrait", false)
                WindowSetShowing("GroupWindowPet"..index.."PortraitFrame", false)
                WindowSetLayer("GroupWindowPet"..index, 0)
                GroupWindow.groupPets[index]:ClearAnchors()
                GroupWindow.groupPets[index]:SetAnchor( {Point = "right", RelativePoint = "left", RelativeTo = "CleanGroupWindowPlayer"..index, XOffset = -40, YOffset = -10} )
                if CleanSettings.Group.showPets then
                    GroupWindow.groupPets[index]:Show(true)
                else
                    GroupWindow.groupPets[index]:Show(false)
                end
            else 
                if ( DoesWindowExist("GroupWindowPet"..index) == true) then
                    GroupWindow.groupPets[index]:Show (false)
                end
            end
            
            if (shouldPopulate == true) then
                CleanGroupWindow.PopulateGroupMemberWindow(index)
            end
        else
            -- Player does not exist, however they could've left the group check to see if we need to hide windows
            if (DoesWindowExist("CleanGroupWindowPlayer"..index) == true) then
                CleanGroupWindow.groupMembers[index]:Show (false)
                CleanGroupWindow.Buffs[index]:ClearAllBuffs()
            end
            if (DoesWindowExist("CleanGroupWindowPet"..index) == true) then
                CleanGroupWindow.groupPets[index]:Show (false)
            end
        end
    end
    
    --WindowResizeOnChildren( CleanGroupWindow.CONTAINER_WINDOW, false, 0 )
end

function CleanGroupWindow.PopulateGroupMemberWindow( groupIndex )
    
    -- Populate all of the data
    groupMemberKey = SystemData.Settings.Keybindings["TARGET_GROUP_MEMBER_"..groupIndex].bindings[1]
    if groupMemberKey and (groupMemberKey ~= L"NONE") then
        CleanGroupWindow.groupMembers[groupIndex]:SetName(groupMemberKey..L" "..CleanGroupWindow.groupData[groupIndex].name)
    else
        CleanGroupWindow.groupMembers[groupIndex]:SetName(CleanGroupWindow.groupData[groupIndex].name)
    end
    CleanGroupWindow.groupMembers[groupIndex]:SetCareerIcon(CleanGroupWindow.groupData[groupIndex].careerLine)
    
    if CleanSettings.Group.showIcons then
        WindowSetShowing("CleanGroupWindowPlayer"..groupIndex.."CareerIcon", true)
    else
        WindowSetShowing("CleanGroupWindowPlayer"..groupIndex.."CareerIcon", false)
    end
    
    CleanGroupWindow.groupMembers[groupIndex]:UpdateLevel(CleanGroupWindow.groupData[groupIndex].level)
    CleanGroupWindow.groupMembers[groupIndex]:UpdateHealth(CleanGroupWindow.groupData[groupIndex].healthPercent)
    CleanGroupWindow.groupMembers[groupIndex]:UpdateActionPoints(CleanGroupWindow.groupData[groupIndex].actionPointPercent)
    CleanGroupWindow.groupMembers[groupIndex]:UpdateRVRFlag(CleanGroupWindow.groupData[groupIndex].isRVRFlagged)
    CleanGroupWindow.groupMembers[groupIndex]:UpdateInSameRegion(CleanGroupWindow.groupData[groupIndex].isInSameRegion, CleanGroupWindow.groupData[groupIndex].healthPercent)
    WindowSetShowing("CleanGroupWindowPlayer"..groupIndex.."GroupLeaderCrown", CleanGroupWindow.groupData[groupIndex].isGroupLeader == true)
    
    if CleanSettings.showNameColors then
        local career = CleanGroupWindow.groupData[groupIndex].careerLine
        LabelSetTextColor( "CleanGroupWindowPlayer"..groupIndex.."Name", unpack( CleanSettings.archColors[ CleanSettings.arches[career] ] ) )
    else
        LabelSetTextColor( "CleanGroupWindowPlayer"..groupIndex.."Name", 255, 255, 255 )
    end
    
    CleanGroupWindow.groupMembers[groupIndex]:Show(true)
end

function CleanGroupWindow.ResetBuffFrames(point, relpoint, x, y)

    for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
        if CleanGroupWindow.groupMembers[index] then
            local buffAnchor = 
            {
                Point           = point or CleanSettings.Group.buffPoint or "bottomleft",
                RelativePoint   = relpoint or CleanSettings.Group.buffRelPoint or "topleft",
                RelativeTo      = "CleanGroupWindowPlayer"..index.."StatusContainer", 
                XOffset         = x or CleanSettings.Group.buffX or 8,
                YOffset         = y or CleanSettings.Group.buffY or 4,
            }
            
            if CleanGroupWindow.Buffs[index] then CleanGroupWindow.Buffs[index]:Shutdown() end
            CleanGroupWindow.Buffs[index] = BuffTracker:Create ("CleanGroup"..index.."Buffs", "Root", buffAnchor, GameData.BuffTargetType.GROUP_MEMBER_START + (index - 1), 10, 10, HIDE_BUFF_FRAME_TIMER_LABELS)
        end
    end
    
    CleanGroupWindow.UpdateEffects()
end

-- This function should update every group member's effects without getting any additional data about the players.
function CleanGroupWindow.UpdateGroupEffects()
    if ( CleanGroupWindow.groupData == nil ) then
        return
    end
    for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
        local target = GameData.BuffTargetType.GROUP_MEMBER_START + index - 1
        if( target > GameData.BuffTargetType.GROUP_MEMBER_END ) then
            DEBUG( L"CleanGroupWindow.UpdateGroupEffects(): Error, index went wrong" )
            return
        end
        CleanGroupWindow.groupData[index].Effects = GetBuffs( GameData.BuffTargetType.GROUP_MEMBER_START + index - 1 )
    end
end

function CleanGroupWindow.UpdateGroupMembers()
    if ( CleanGroupWindow.groupData == nil ) 
    then
        return
    end

    -- If there is a valid group member in index 1, then we should show the CleanGroupWindow
    CleanGroupWindow.inWorldGroup = CleanGroupWindow.IsMemberValid( 1 )
    
    if (CleanGroupWindow.inWorldGroup == false and WindowGetShowing("GroupOptionsWindow") == true)
    then
        -- Hide the Group Options window, if we're not in a group anymore
        WindowSetShowing("GroupOptionsWindow", false)
    end
    -- Position & Populate the Group Member Windows
    CleanGroupWindow.PositionGroupMemberWindows(true)
    
    -- If the player is in a scenario, but not in a group, hide the window
    if( GameData.Player.isInScenario ) 
    then
        if( GameData.Player.isInSiege == false and CleanGroupWindow.inScenarioGroup == false ) 
        then
            CleanGroupWindow.inWorldGroup = false
        end
    end
        
    -- If we have valid data on a player-made group housed on the client,
    -- depict this player as being in a world group
    for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
        if (CleanGroupWindow.IsMemberValid(index) == true) then
            CleanGroupWindow.groupMembers[index]:Show (CleanGroupWindow.inWorldGroup)
        end
    end
    
    LabelSetText("GroupOptionsWindowMasterLootGroupMember1Label", GameData.Player.name )
    for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS 
    do
        if( CleanGroupWindow.IsMemberValid( index ) ) 
        then
            groupMemberButtonIndex = index + 1
            LabelSetText("GroupOptionsWindowMasterLootGroupMember"..groupMemberButtonIndex.."Label", CleanGroupWindow.groupData[index].name )
        end
    end
end

function CleanGroupWindow.UpdateMemberStatus( groupMemberIndex, playerHealth, actionPts, level, morale, petHealth, rvrFlagStatus )
    if ( CleanGroupWindow.groupData == nil ) then
        return
    end
    
    if( CleanGroupWindow.IsMemberValid(groupMemberIndex) ) then       
       CleanGroupWindow.groupData[groupMemberIndex].actionPointPercent = actionPts
       CleanGroupWindow.groupData[groupMemberIndex].level = level
       
        CleanGroupWindow.groupData[groupMemberIndex].healthPercent = playerHealth
        CleanGroupWindow.groupMembers[groupMemberIndex]:UpdateHealth(CleanGroupWindow.groupData[groupMemberIndex].healthPercent)
        CleanGroupWindow.groupMembers[groupMemberIndex]:UpdateLevel(CleanGroupWindow.groupData[groupMemberIndex].level)
        CleanGroupWindow.groupMembers[groupMemberIndex]:UpdateActionPoints(CleanGroupWindow.groupData[groupMemberIndex].actionPointPercent)
		CleanGroupWindow.groupMembers[groupMemberIndex]:UpdateInSameRegion(CleanGroupWindow.groupData[groupMemberIndex].isInSameRegion, CleanGroupWindow.groupData[groupMemberIndex].healthPercent)
        if (CleanGroupWindow.groupData[groupMemberIndex].isRVRFlagged ~= rvrFlagStatus)
        then
            -- Only do this if the flag has changed.
            CleanGroupWindow.groupData[groupMemberIndex].isRVRFlagged = rvrFlagStatus
            CleanGroupWindow.groupMembers[groupMemberIndex]:UpdateRVRFlag(rvrFlagStatus)
        end
    end
end

function CleanGroupWindow.UpdateEffects()
    if (BattlegroupWindow == nil or not BattlegroupWindow.Active)
    then
        for index = 1,  CleanGroupWindow.MAX_GROUP_MEMBERS do
            if (CleanGroupWindow.IsMemberValid( index )) then
                if CleanSettings.Group.showBuffs and WindowGetShowing("CleanGroupWindowPlayer"..index) and WindowGetShowing("CleanGroupWindow") then
                    CleanGroupWindow.Buffs[index]:ClearAllBuffs()
                    CleanGroupWindow.Buffs[index]:Refresh()
                else
                    CleanGroupWindow.Buffs[index]:ClearAllBuffs()
                end
            elseif CleanGroupWindow.Buffs[index] then
                if GroupWindow.Buffs[index] then
                    GroupWindow.Buffs[index]:ClearAllBuffs()
                end
                CleanGroupWindow.Buffs[index]:ClearAllBuffs()
            end
        end
    else
        for index = 1,  CleanGroupWindow.MAX_GROUP_MEMBERS do
            if CleanGroupWindow.Buffs[index] then
                CleanGroupWindow.Buffs[index]:ClearAllBuffs()
                if GroupWindow.Buffs[index] then
                    GroupWindow.Buffs[index]:ClearAllBuffs()
                end
            end
        end
    end
end

function CleanGroupWindow.OnEffectsUpdated( updateType, updatedEffects )
    if ( updateType < GameData.BuffTargetType.GROUP_MEMBER_START or
         updateType > GameData.BuffTargetType.GROUP_MEMBER_END )
    then
        return
    end

    local memberIndex = updateType - GameData.BuffTargetType.GROUP_MEMBER_START + 1
    if CleanSettings.Group.showBuffs and WindowGetShowing("CleanGroupWindowPlayer"..memberIndex) and WindowGetShowing("CleanGroupWindow") then
        CleanGroupWindow.Buffs[ memberIndex ]:UpdateBuffs( updatedEffects )
    else
        CleanGroupWindow.Buffs[ memberIndex ]:ClearAllBuffs()
    end
end


function CleanGroupWindow.UpdateGroupMembersEffects( groupMemberIndex )
    if (CleanGroupWindow.IsMemberValid( groupMemberIndex )) then
        if CleanSettings.Group.showBuffs and WindowGetShowing("CleanGroupWindowPlayer"..groupMemberIndex) and WindowGetShowing("CleanGroupWindow") then
            CleanGroupWindow.Buffs[groupMemberIndex]:Refresh()
        else
            CleanGroupWindow.Buffs[groupMemberIndex]:ClearAllBuffs()
        end
    elseif CleanGroupWindow.Buffs[groupMemberIndex] then
        CleanGroupWindow.Buffs[groupMemberIndex]:ClearAllBuffs()
    end
end

function CleanGroupWindow.ShowMenu( playerName )
    -- Don't let players use the group window menus if they are in a scenario
    -- since they do not have control over any of the group functionality in
    -- these kinds of server-owned groups!
    if( GameData.Player.isInScenario )
    then
        if( GameData.Player.isInSiege == false )
        then
            return
        end
    end
    
    SystemData.UserInput.selectedGroupMember = playerName
    local isNotLeader = GameData.Player.isGroupLeader ~= true
    
    EA_Window_ContextMenu.CreateContextMenu( SystemData.ActiveWindow.name, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_GROUP_OPTIONS ), GroupWindow.OnViewGroupOptions, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    --EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_PARTY_SHOW_WARPARTY ), GroupWindow.OnShowWarparty, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_PARTY_FORM_WARPARTY ), GroupWindow.OnFormWarparty, isNotLeader, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_MAKE_LEADER ), GroupWindow.OnMakeLeader, isNotLeader, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_LEAVE_GROUP ), GroupWindow.OnLeaveGroup, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_KICK_FROM_GROUP ), GroupWindow.OnGroupKick, isNotLeader, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_TELL ), GroupWindow.OnTellMember, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_TARGET ), GroupWindow.OnTargetMember, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_ASSIST ), GroupWindow.OnAssistMember, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
    
    EA_Window_ContextMenu.Finalize()
    
end

function CleanGroupWindow.HideMenu()
    -- Not really needed any longer, but just keeping here until cleanup
end

function CleanGroupWindow.IsMemberValid(index)
    return ( CleanGroupWindow.groupData ~= nil and
             CleanGroupWindow.groupData[index] ~= nil and
             CleanGroupWindow.groupData[index].name ~= nil and
             CleanGroupWindow.groupData[index].name ~= L"" )
end

function CleanGroupWindow.OnGroupUpdated()
    CleanGroupWindow.groupData = GetGroupData()
    CleanGroupWindow.UpdateGroupMembers()
    CleanGroupWindow.ConditionalShow()
    
    -- Just make sure the default group window isn't showing.
    WindowSetShowing("GroupWindow", false)
end

function CleanGroupWindow.OnStatusUpdated( groupMemberIndex )
    local hp, ap, morale, lvl, petHp, rvrFlag = GetGroupMemberStatusData(groupMemberIndex)
    CleanGroupWindow.UpdateGroupMembersEffects(groupMemberIndex)
    CleanGroupWindow.UpdateMemberStatus(groupMemberIndex, hp, ap, lvl, morale, petHp, rvrFlag)    
    CleanGroupWindow.ConditionalShow()
end

function CleanGroupWindow.OnGroupPlayerAdded()
    -- The "player added" event always comes after a "group updated" event so any variable updates are done in CleanGroupWindow.OnGroupUpdated().
    Sound.Play( Sound.GROUP_PLAYER_ADDED )
    
    CleanGroupWindow.ConditionalShow()
end

function CleanGroupWindow.ConditionalShow()
    
    if( (GameData.Player.isInScenario == false) and (CleanGroupWindow.inScenarioGroup == false)) then
        for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
            if (CleanGroupWindow.IsMemberValid(index) == true) then
                CleanGroupWindow.groupMembers[index]:Show(true)
            else
                if CleanGroupWindow.Buffs[index] then
                    CleanGroupWindow.Buffs[index]:ClearAllBuffs()
                end
            end
        end
    end
    
    -- Never show the group window when a battlegroup is active
    -- \TODO: This should tie in with UI Customization Settings at a later point when
    -- that window is available for players
    if( (BattlegroupWindow.Active) ) then
        for index = 1, CleanGroupWindow.MAX_GROUP_MEMBERS do
            if (CleanGroupWindow.IsMemberValid(index) == true) then
                CleanGroupWindow.groupMembers[index]:Show (false)
                CleanGroupWindow.Buffs[index]:ClearAllBuffs()
                if (DoesWindowExist("CleanGroupWindowPet"..index) == true)
                then
                    CleanGroupWindow.groupPets[index]:Show (false)
                end
            end
        end
    end
    
end

function CleanGroupWindow.OnLButtonDownProcessed()
    if( SystemData.InputProcessed.LButtonDown == false ) then
        --CleanGroupWindow.HideMenu()
    end 
end

function CleanGroupWindow.OnRButtonDownProcessed()
    --CleanGroupWindow.HideMenu()
end
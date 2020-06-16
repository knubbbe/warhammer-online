SquaredWarband = {}

local parent = nil

local groupData = nil

local QueuedMenuGroup = nil
local QueuedMenuMember = nil

local QueuedNextUpdate = nil

local timeCount = 0
local updateDelay = 0.5

local playersName

function SquaredWarband.Initialize()
    -- register us as a handler with Squared
    parent = Squared.RegisterModeHandler("warband", SquaredWarband)
end

function SquaredWarband.OnLoad()
    RegisterEventHandler(SystemData.Events.BATTLEGROUP_UPDATED, "SquaredWarband.UpdateGroupProxy")
	
	-- 1.1.1 check
	if PartyUtils then
		RegisterEventHandler(SystemData.Events.BATTLEGROUP_MEMBER_UPDATED, "SquaredWarband.UpdateMember")
	end
	
    playersName = GameData.Player.name:match(L"([^^]+)^?([^^]*)")
    updateDelay = Squared.GetSetting("update-freq") or 0.5
    
    SquaredWarband.UpdateGroup()
end

function SquaredWarband.OnUnload()
    UnregisterEventHandler(SystemData.Events.BATTLEGROUP_UPDATED, "SquaredWarband.UpdateGroupProxy")
	
	-- 1.1.1 check
	if PartyUtils then
		UnregisterEventHandler(SystemData.Events.BATTLEGROUP_MEMBER_UPDATED, "SquaredWarband.UpdateMember")
	end
	
    QueuedMenuGroup = nil
    QueuedMenuMember = nil
end

function SquaredWarband.OnUpdate(timePassed)
    timeCount = timeCount + timePassed
    
    if QueuedNextUpdate then
        QueuedNextUpdate = false
        SquaredWarband.UpdateGroup()
    end
end

function SquaredWarband.UpdateGroupProxy()
    QueuedNextUpdate = true
end

function SquaredWarband.UpdateGroup()
    
    groupData = PartyUtils.GetWarbandData()
    
    if not groupData then return end
    
    parent.SoftClearGroups()
    
    for groupIndex = 4,1,-1 do
        local playersGroup = false
        local groupSize = #groupData[groupIndex].players
        for memberIndex = 1,groupSize do
            --is this the player's group?
            if groupData[groupIndex].players[memberIndex].name:match(L"([^^]+)^?([^^]*)") == playersName then
                playersGroup = true
            end
        end
        for memberIndex = 1,6 do
            if memberIndex <= groupSize then
                local unitFrame = parent.AddUnit(groupIndex, memberIndex, true)
                local memberData = groupData[groupIndex].players[memberIndex]
                if not memberData then continue end
                unitFrame:SetName(memberData.name)
                unitFrame:SetCareer(memberData.careerLine)
                unitFrame:SetMaxVal(100)
                unitFrame:SetVal(memberData.healthPercent)
                unitFrame:SetAP(memberData.actionPointPercent)
                unitFrame:SetLevel(memberData.level)
                unitFrame:SetInRegion(memberData.isInSameRegion)
                unitFrame:SetOnline(memberData.online)
                unitFrame:SetZone(memberData.zoneNum)
                unitFrame:SetDistant(memberData.isDistant)
                unitFrame:SetCareerName(memberData.careerName)
                if playersGroup then unitFrame:SetMyGroupFlag(true) end
                unitFrame:SetLeaderFlag(memberData.isGroupLeader or false)
                unitFrame:SetMainAssistFlag(memberData.isMainAssist)
                unitFrame:Update()
            end
        end
    end
    parent.FinalizeSoftClear()
    parent.ReanchorGroups()
end

function SquaredWarband.UpdateMember(partyIndex, memberIndex)
	
	local unitFrame = parent.GetUnit(partyIndex, memberIndex)
    if not unitFrame then return end
	local memberData = PartyUtils.GetWarbandMember(partyIndex, memberIndex)
    if not memberData then return end
    
	unitFrame:SetVal(memberData.healthPercent)
	unitFrame:SetAP(memberData.actionPointPercent)
	unitFrame:SetLevel(memberData.careerLine)
    unitFrame:SetLevel(memberData.level)
    unitFrame:SetDistant(memberData.isDistant)
	unitFrame:Update()
end

function SquaredWarband:UnitLClick(group, member, flags)
    return
end

function SquaredWarband:UnitLRelease(group,member)
    if GetDesiredInteractAction() == SystemData.InteractActions.TELEPORT then
        UseItemTargeting.SendTeleport()
    end
end

function SquaredWarband:UnitRRelease(group, member)
    if Squared.GetSetting("showmenu") then
        SquaredWarband:ShowMenu(group, member)
    end
end

function SquaredWarband:UnitMouseOver(group, member, flags)
    
    -- Only show tooltip if shift is being held.
    if flags ~= 4 then return end

    local unitFrame = parent.GetUnit(group, member)
    if not unitFrame then return end
    
    -- Create the tooltip
    Tooltips.CreateTextOnlyTooltip(unitFrame:GetName().."Action")
    
    -- First row: full name and health
    Tooltips.SetTooltipText(1,1, unitFrame.rawname)
    Tooltips.SetTooltipText(1,3, towstring(unitFrame.curval)..L"%")
    
    -- Second row: career and level
    Tooltips.SetTooltipText(2,1, unitFrame.careername)
    Tooltips.SetTooltipText(2,3, towstring(unitFrame.level))
    
    -- Third row: current zone
    if unitFrame.zone > 0 then
        Tooltips.SetTooltipText(3,1, GetZoneName(unitFrame.zone))
        if unitFrame.zone == GameData.Player.zone then
            Tooltips.SetTooltipColor(3,1, 0, 150, 0)
        else
            Tooltips.SetTooltipColor(3,1, 100, 100, 100)
        end
    end
    
    Tooltips.Finalize()
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
end

function SquaredWarband:ShowMenu(group, member)

    local playerName = nil
    local playerLevel = nil
    local groupNum = tonumber(group)
    if not groupData then return end
    if groupData[groupNum] then
        if groupData[groupNum].players[member] then
            playerName = groupData[groupNum].players[member].name
            playerLevel = groupData[groupNum].players[member].level
        end
    end
    
    if not playerName then return end
    
    SystemData.UserInput.selectedGroupMember = playerName
    
    local isPlayerSelf = WStringsCompareIgnoreGrammer( playerName, GameData.Player.name ) == 0
        
    -- Build the Custom Section of the Player Menu    
    local customMenuItems = {}            
    
    -- 2) Show the "Show Warband" option if the player is in an active warband
    if( IsWarBandActive() ) 
    then
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_SHOW_WARBAND), SquaredWarband.OnMenuClickShowWarband, false ) )
    end
    
    if GroupWindow.OnViewGroupOptions then
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_GROUP_OPTIONS ), GroupWindow.OnViewGroupOptions, false ))
    end
    
    -- 4) Show the "Make Leader" option if the player is a group leader
    if( GameData.Player.isGroupLeader ) then
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_MAKE_LEADER ), SquaredWarband.OnMenuClickMakeLeader, false ))
    end
    
    -- 5) Main Assist
    local currentMainAssist = nil
    if PartyUtils then
        local MAData = PartyUtils.GetWarbandMainAssist()
        currentMainAssist = MAData.name
    else
        currentMainAssist = GroupWindow.GetMainAssist()
    end
    if( GameData.Player.isGroupLeader or ( WStringsCompareIgnoreGrammer( currentMainAssist, GameData.Player.name ) == 0 )  )
    then
        local disableMainAssist = ( WStringsCompareIgnoreGrammer( currentMainAssist, playerName ) == 0 )
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_MAKE_MAIN_ASSIST ), SquaredWarband.OnMenuClickMakeMainAssist, disableMainAssist ))
    end
    
    -- 5.5) Summoning
    if (not isPlayerSelf) and (not GameData.Player.isInScenario or GameData.Player.isInSiege) then
        local singleSummonInvSlot = DataUtils.HasRequiredSummoningStone(playerLevel)
		local disablePlayerSummon = GameData.Player.inCombat or singleSummonInvSlot == nil
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem(
            GetString(StringTables.Default.LABEL_SUMMON_PLAYER),
            PartyUtils.OnSummonPlayer, disablePlayerSummon ) ) 
    end
    
    -- 6) Show the "Leave Party" option if the player is currently in a player-made party
    if( GroupWindow.inWorldGroup or IsWarBandActive() ) then
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_LEAVE_GROUP), SquaredWarband.OnMenuClickLeaveGroup, false ))
    end
  
     -- Create the Menu
    PlayerMenuWindow.ShowMenu( playerName, 0, customMenuItems ) 

end

function SquaredWarband.OnMenuClickShowWarband()
    if EA_Window_OpenParty then
        EA_Window_OpenParty.OpenToManageTab()
    elseif DoesWindowExist("BattlegroupWindow") then
        WindowSetShowing("BattlegroupWindow", true)
    end
end

function SquaredWarband.OnMenuClickGroupKick()
	SendChatText(L"/partyremove "..SystemData.UserInput.selectedGroupMember, L"")
end

function SquaredWarband.OnMenuClickMakeLeader()
	SendChatText(L"/warbandleader "..SystemData.UserInput.selectedGroupMember, L"") 
end

function SquaredWarband.OnMenuClickTellMember()
    EA_ChatWindow.SwitchChannelWithExistingText(L"/tell "..SystemData.UserInput.selectedGroupMember..L" ")
end

function SquaredWarband.OnMenuClickTargetMember()
	SendChatText(L"/target "..SystemData.UserInput.selectedGroupMember, L"")
end

function SquaredWarband.OnMenuClickAssistMember()
	SendChatText(L"/assist "..SystemData.UserInput.selectedGroupMember, L"")
end

function SquaredWarband.OnMenuClickLeaveGroup()
    BroadcastEvent( SystemData.Events.GROUP_LEAVE )
end

function SquaredWarband.OnMenuClickMakeMainAssist()    
    if( ButtonGetDisabledFlag(SystemData.ActiveWindow.name ) == true ) then
        return
    end
    
    BroadcastEvent( SystemData.Events.GROUP_SET_MAIN_ASSIST )    
end
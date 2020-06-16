SquaredGroup = {}

-- Make Squared table ref local for performance
local Squared = Squared

-- Make utility functions local for performance
local pairs = pairs
local unpack = unpack
local tonumber = tonumber
local tostring = tostring
local towstring = towstring
local max = math.max
local min = math.min
local wstring_sub = wstring.sub
local wstring_format = wstring.format
local tinsert = table.insert
local tremove = table.remove

local parent = nil

local groupData = nil

local QueuedMenuGroup = nil
local QueuedMenuMember = nil

function SquaredGroup.Initialize()
    -- register us as a handler with Squared
    parent = Squared.RegisterModeHandler("group", SquaredGroup)
end

function SquaredGroup.OnLoad()
    RegisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED, "SquaredGroup.UpdateCurHP")
    RegisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED, "SquaredGroup.UpdateMaxHP")
    RegisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, "SquaredGroup.UpdateAP")
    RegisterEventHandler( SystemData.Events.PLAYER_CAREER_RANK_UPDATED, "SquaredGroup.UpdateLevel")
    RegisterEventHandler( SystemData.Events.GROUP_UPDATED, "SquaredGroup.UpdateGroup")
    RegisterEventHandler( SystemData.Events.GROUP_STATUS_UPDATED, "SquaredGroup.UpdateGroupStatus")
   
    SquaredGroup.UpdateGroup()
end

function SquaredGroup.OnUnload()
    UnregisterEventHandler( SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED, "SquaredGroup.UpdateCurHP")
    UnregisterEventHandler( SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED, "SquaredGroup.UpdateMaxHP")
    UnregisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, "SquaredGroup.UpdateAP")
    UnregisterEventHandler( SystemData.Events.PLAYER_CAREER_RANK_UPDATED, "SquaredGroup.UpdateLevel")
    UnregisterEventHandler( SystemData.Events.GROUP_UPDATED, "SquaredGroup.UpdateGroup")
    UnregisterEventHandler( SystemData.Events.GROUP_STATUS_UPDATED, "SquaredGroup.UpdateGroupStatus")
end

function SquaredGroup.UpdateGroup()
    parent.SoftClearGroups()
    SquaredGroup.frames = {}
    groupData = PartyUtils.GetPartyData()
    
    -- add a frame for the player
    SquaredGroup.frames[1] = parent.AddUnit(1, 1, true)
	SquaredGroup.frames[1]:SetName(GameData.Player.name)
    SquaredGroup.frames[1]:SetCareer(GameData.Player.career.line)
    SquaredGroup.frames[1]:SetMaxVal(GameData.Player.hitPoints.maximum)
    SquaredGroup.frames[1]:SetVal(GameData.Player.hitPoints.current)
    SquaredGroup.frames[1]:SetAP((GameData.Player.actionPoints.current/GameData.Player.actionPoints.maximum)*100)
    SquaredGroup.frames[1]:SetLevel(GameData.Player.level)
    SquaredGroup.frames[1]:SetZone(GameData.Player.zone)
    SquaredGroup.frames[1]:SetCareerName(GameData.Player.career.name)
    SquaredGroup.frames[1]:SetLeaderFlag(GameData.Player.isGroupLeader or false)
    SquaredGroup.frames[1]:Update()
    -- add frames for each group member
    for index,memberData in ipairs(groupData) do
        if not memberData.name then continue end
        if memberData.name == GameData.Player.name then continue end
        local unitFrame = parent.AddUnit(1, index+1, true)
        if memberData.name and memberData.name ~= L"" then
            unitFrame:SetName(memberData.name)
            unitFrame:SetMaxVal(100)
			unitFrame:SetInRegion(memberData.isInSameRegion)
            unitFrame:SetVal(memberData.healthPercent)
            unitFrame:SetAP(memberData.actionPointPercent)
            unitFrame:SetCareer(memberData.careerLine)
            unitFrame:SetLevel(memberData.level)
            unitFrame:SetInRegion(memberData.isInSameRegion)
            unitFrame:SetOnline(memberData.online)
            unitFrame:SetZone(memberData.zoneNum)
            unitFrame:SetDistant(memberData.isDistant)
            unitFrame:SetCareerName(memberData.careerName)
            unitFrame:SetLeaderFlag(memberData.isGroupLeader or false)
            if memberData.isMainAssist then unitFrame:SetMainAssistFlag(true) end
            unitFrame:Update()
        else
            unitFrame:Show(false)
        end
        SquaredGroup.frames[index+1] = unitFrame
    end
    
    parent.FinalizeSoftClear()
    parent.ReanchorGroups()
end

function SquaredGroup.UpdateGroupStatus(memberIndex)
	local unitFrame = SquaredGroup.frames[memberIndex+1]
	
	if PartyUtils then
		local memberData = PartyUtils.GetPartyMember(memberIndex)
		if not memberData then return end
        
		unitFrame:SetVal(memberData.healthPercent)
		unitFrame:SetAP(memberData.actionPointPercent)
		unitFrame:SetLevel(memberData.level)
        unitFrame:SetDistant(memberData.isDistant)
		unitFrame:Update()
	end
end

function SquaredGroup.UpdateCurHP()
    --update hp for player
    SquaredGroup.frames[1]:SetVal(GameData.Player.hitPoints.current)
    SquaredGroup.frames[1]:UpdateText()
end

function SquaredGroup.UpdateMaxHP()
    SquaredGroup.frames[1]:SetMaxVal(GameData.Player.hitPoints.maximum)
    SquaredGroup.frames[1]:UpdateText()
end

function SquaredGroup.UpdateAP()
    SquaredGroup.frames[1]:SetAP((GameData.Player.actionPoints.current/GameData.Player.actionPoints.maximum)*100)
    SquaredGroup.frames[1]:UpdateText()
end

function SquaredGroup.UpdateLevel()
    SquaredGroup.frames[1]:SetLevel(GameData.Player.level)
    SquaredGroup.frames[1]:UpdateText()
end

function SquaredGroup:UnitLClick(group, member, flags)
    return
end

function SquaredGroup:UnitLRelease(group,member)
    if GetDesiredInteractAction() == SystemData.InteractActions.TELEPORT then
        UseItemTargeting.SendTeleport()
    end
end

function SquaredGroup:UnitRRelease(group, member)
    if Squared.GetSetting("showmenu") then
        SquaredGroup:ShowMenu(group, member)
    end
end

function SquaredGroup:UnitMouseOver(group, member, flags)
    
    -- Only show tooltip if shift is being held.
    if flags ~= 4 then return end

    local unitFrame = parent.GetUnit(group, member)
    if not unitFrame then return end
    
    -- Create the tooltip
    Tooltips.CreateTextOnlyTooltip(unitFrame:GetName().."Action")
    
    -- First row: full name and health
    Tooltips.SetTooltipText(1,1, unitFrame.rawname)
    Tooltips.SetTooltipText(1,3, wstring.format(L"%d%%", 100 * unitFrame.curval / unitFrame.maxval))
    
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

function SquaredGroup:ShowMenu(group, member)
    
    local unit = Squared.GetUnit(group, member)
    if not unit then return end
    local playerName = unit.rawname
    if not playerName then return end
    
    SystemData.UserInput.selectedGroupMember = playerName
    
    -- Build the Custom Section of the Player Menu    
    local customMenuItems = {}    
    
    -- 1) World-Based Group Options
    local isNotLeader = GameData.Player.isGroupLeader ~= true
    if( GameData.Player.isInScenario == false or GameData.Player.isInSiege )
    then
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_GROUP_OPTIONS ), SquaredGroup.OnViewGroupOptions, false ) )
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
        local disableMainAssist = currentMainAssist == playerName
        table.insert( customMenuItems, PlayerMenuWindow.NewCustomItem( GetString( StringTables.Default.LABEL_MAKE_MAIN_ASSIST ), GroupWindow.OnMakeMainAssist, disableMainAssist ) ) 
    end
    
    if (not GameData.Player.isInScenario) or GameData.Player.isInSiege then
        local playerLevel = nil
		local party = PartyUtils.GetPartyData()
		for index,member in ipairs(party)
		do
			if PartyUtils.IsPartyMemberValid(index) and member.name == playerName then
				playerLevel = member.level
			end
		end
    
        local singleSummonInvSlot = nil
		if playerLevel then
			singleSummonInvSlot = DataUtils.HasRequiredSummoningStone(playerLevel)
		end
		local disablePlayerSummon = GameData.Player.inCombat or singleSummonInvSlot == nil
        
        table.insert(customMenuItems, PlayerMenuWindow.NewCustomItem(
            GetString(StringTables.Default.LABEL_SUMMON_PLAYER),
            PartyUtils.OnSummonPlayer, disablePlayerSummon) )
    end
    
    -- Create the Menu
    PlayerMenuWindow.ShowMenu( playerName, 0, customMenuItems )
    
end

function SquaredGroup.OnViewGroupOptions()
    if EA_Window_OpenParty then
        EA_Window_OpenParty.OpenToManageTab()
    elseif GroupWindow.OnViewGroupOptions then
        GroupWindow.OnViewGroupOptions()
    end
end
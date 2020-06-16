SquaredScenario = {}

-- Make Squared table ref local for performance
local Squared = Squared

-- Make utility functions local for performance
local pairs = pairs
local ipairs = ipairs
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
local groups = nil

local updateFlag = false
local delay = 0
local UPDATE_DELAY = 0.3

local careerIDsToLines = {
        [20] = GameData.CareerLine.IRON_BREAKER,
        [100] = GameData.CareerLine.SWORDMASTER,
        [64] = GameData.CareerLine.CHOSEN,
        [24] = GameData.CareerLine.BLACK_ORC,
        [60] = GameData.CareerLine.WITCH_HUNTER,
        [102] = GameData.CareerLine.WHITE_LION,
        [65] = GameData.CareerLine.MARAUDER,
        [105] = GameData.CareerLine.WITCH_ELF,
        [62] = GameData.CareerLine.BRIGHT_WIZARD,
        [67] = GameData.CareerLine.MAGUS,
        [107] = GameData.CareerLine.SORCERER,
        [23] = GameData.CareerLine.ENGINEER,
        [101] = GameData.CareerLine.SHADOW_WARRIOR,
        [27] = GameData.CareerLine.SQUIG_HERDER,
        [63] = GameData.CareerLine.WARRIOR_PRIEST,
        [106] = GameData.CareerLine.DISCIPLE,
        [103] = GameData.CareerLine.ARCHMAGE,
        [26] = GameData.CareerLine.SHAMAN,
        [22] = GameData.CareerLine.RUNE_PRIEST,
        [66] = GameData.CareerLine.ZEALOT,
        [104] = GameData.CareerLine.BLACKGUARD,
        [61] = GameData.CareerLine.KNIGHT,
        [25] = GameData.CareerLine.CHOPPA,
        [21] = GameData.CareerLine.SLAYER,
    }

function SquaredScenario.Initialize()
    -- register us as a handler with Squared
    parent = Squared.RegisterModeHandler("scenario", SquaredScenario)

end

function SquaredScenario.OnLoad()
    RegisterEventHandler(SystemData.Events.SCENARIO_PLAYERS_LIST_GROUPS_UPDATED, "SquaredScenario.FlagUpdate")
    RegisterEventHandler(SystemData.Events.SCENARIO_PLAYERS_LIST_RESERVATIONS_UPDATED, "SquaredScenario.FlagUpdate")
    RegisterEventHandler(SystemData.Events.SCENARIO_PLAYER_HITS_UPDATED, "SquaredScenario.SinglePlayerUpdate")
   
    UPDATE_DELAY = Squared.GetSetting("update-freq") or 0.5
   
    SquaredScenario.UpdateGroup()
end

function SquaredScenario.OnUnload()
    UnregisterEventHandler( SystemData.Events.SCENARIO_PLAYERS_LIST_GROUPS_UPDATED, "SquaredScenario.FlagUpdate")
    UnregisterEventHandler(SystemData.Events.SCENARIO_PLAYERS_LIST_RESERVATIONS_UPDATED, "SquaredScenario.FlagUpdate")
    UnregisterEventHandler(SystemData.Events.SCENARIO_PLAYER_HITS_UPDATED, "SquaredScenario.SinglePlayerUpdate")
end

function SquaredScenario.FlagUpdate()
    updateFlag = true
end

function SquaredScenario.OnUpdate(timePassed)
    delay = delay - timePassed
    
    if delay <= 0 and updateFlag then
        updateFlag = false
        SquaredScenario.UpdateGroup()
        delay = UPDATE_DELAY
    end
end

function SquaredScenario.SinglePlayerUpdate(groupIndex, groupSlotNum, healthPercent)
	local unitFrame = Squared.GetUnit(groupIndex, groupSlotNum)
	if unitFrame == nil then return end
	unitFrame:SetVal(healthPercent)
	unitFrame:Update()
end


-- sort function that sorts elements in a table according to each subtable's second element
local function groupsortfunc(a,b)
	if a[2] < b[2] then return true else return false end
end

function SquaredScenario.UpdateGroup()
    
    groupData = GameData.GetScenarioPlayerGroups()
    
    if not groupData then return end
    
    parent.SoftClearGroups()
    
    groups = {}
    
    for index, player in ipairs(groupData) do
        if player.sgroupindex > 0 then
            local groupIndex = player.sgroupindex
            local groupSlotNum = player.sgroupslotnum
            if not groups[groupIndex] then groups[groupIndex] = {} end
            tinsert(groups[groupIndex], {index, groupSlotNum})
        end
    end
            
    for group,groupIndexes in pairs(groups) do
		
		-- sort the groups according to slot number
		table.sort(groupIndexes, groupsortfunc)
		
        local playerGroup = nil
        local playersName = GameData.Player.name:match(L"([^^]+)^?([^^]*)")
        for index,memberIndexData in ipairs(groupIndexes) do
			local memberIndex = memberIndexData[1]
            local memberData = groupData[memberIndex]
            if (memberData.name):match(L"([^^]+)^?([^^]*)") == playersName then
                playerGroup = true
            end
        end
        for index,memberIndexData in ipairs(groupIndexes) do
            local memberIndex = memberIndexData[1]
			local memberData = groupData[memberIndex]
            local unitFrame = parent.AddUnit(group, index, true)
            if memberData.name and memberData.name ~= L"" then
                unitFrame:SetName(memberData.name)
                unitFrame:SetCareer(careerIDsToLines[memberData.careerId])
                unitFrame:SetMaxVal(100)
                unitFrame:SetVal(memberData.health)
                unitFrame:SetAP(memberData.ap)
                unitFrame:SetLevel(memberData.rank)
                if playerGroup then unitFrame:SetMyGroupFlag(true) end
                unitFrame:SetMainAssistFlag(memberData.isMainAssist)
                unitFrame:Update()
            else
                unitFrame:Deactivate()
            end
        end
    end
    
    parent.FinalizeSoftClear()
    parent.ReanchorGroups()
end

function SquaredScenario:UnitLClick(group, member, flags)
    return
end

function SquaredScenario:UnitRRelease(group, member)
    if Squared.GetSetting("showmenu") then
        SquaredScenario:ShowMenu(group, member)
    end
end

function SquaredScenario:ShowMenu(group, member)
    local unit = Squared.GetUnit(group, member)
    if not unit then return end
    local playerName = unit.rawname
    if not playerName then return end
    
    SystemData.UserInput.selectedGroupMember = playerName
    
    PlayerMenuWindow.ShowMenu(playerName, 0)
end
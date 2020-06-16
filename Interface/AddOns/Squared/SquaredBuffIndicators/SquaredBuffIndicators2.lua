SquaredBuffIndicators = {}

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
local random = math.random
local wstring_sub = wstring.sub
local wstring_format = wstring.format
local tinsert = table.insert
local tremove = table.remove
local GetBuffs = GetBuffs

-- cache for the units we're looking for
local UnitCache = {}

local buffCache = {}

local indicatorCache = {}

local timeCount = 0
local nextUpdateTime = 0
local updateFreq = 0.5
local renderFreq = 0.3

local allBuff = false
local allDebuff = false
local allHoT = false

local UpdateQueue = {}

local playerName = L"" -- cache this, no need to do a pattern match each time

local dispels = nil
local function makeDispels()
   dispels = {
        [GameData.CareerLine.IRON_BREAKER] = {},
        [GameData.CareerLine.SWORDMASTER] = {},
        [GameData.CareerLine.CHOSEN] = {},
        [GameData.CareerLine.BLACK_ORC] = {},
        [GameData.CareerLine.WITCH_HUNTER] = {},
        [GameData.CareerLine.KNIGHT] = {},
        [GameData.CareerLine.BLACKGUARD] = {},
        [GameData.CareerLine.WHITE_LION] = {},
        [GameData.CareerLine.MARAUDER] = {},
        [GameData.CareerLine.WITCH_ELF] = {},
        [GameData.CareerLine.BRIGHT_WIZARD] = { ["Hex"] = "self", ["Ailment"] = "self", ["Curse"] = "self" },
        [GameData.CareerLine.MAGUS] = {},
        [GameData.CareerLine.SORCERER] = {},
        [GameData.CareerLine.ENGINEER] = {},
        [GameData.CareerLine.SHADOW_WARRIOR] = {},
        [GameData.CareerLine.SQUIG_HERDER] = {},
        [GameData.CareerLine.CHOPPA] = {},
        [GameData.CareerLine.SLAYER] = {},
        [GameData.CareerLine.WARRIOR_PRIEST] = { [ "Hex"] = "all", ["Curse"] = "all" },
        [GameData.CareerLine.DISCIPLE] = { ["Hex"] = "all", ["Ailment"] = "all" },
        [GameData.CareerLine.ARCHMAGE] = { ["Hex"] = "all", ["Ailment"] = "all" },
        [GameData.CareerLine.SHAMAN] = { [ "Curse"] = "all", ["Ailment"] = "all" },
        [GameData.CareerLine.RUNE_PRIEST] = { [ "Curse"] = "all", ["Ailment"] = "all" },
        [GameData.CareerLine.ZEALOT] = { [ "Hex"] = "all", ["Curse"] = "all" },
    }
end

local iPos = {}

local function setIndicators(unitName, refresh)
    -- refresh should be set to true if things have changed
    
    local cachedItems = indicatorCache[unitName]
    if not cachedItems then return end
    
    if refresh then
        -- rebuild the visual indicator cache
        cachedItems[iPos["Buff"]] = { show=false }
        cachedItems[iPos["Ailment"]] = { show=false }
        cachedItems[iPos["HoT"]] = { show=false }
        
        if not cachedItems.internal then cachedItems.internal = {} end
        
        for k,v in pairs(cachedItems.internal) do
            cachedItems[iPos[k]].show = true
            cachedItems[iPos[k]].color = v.color
        end
    end
    
    -- Update the actual visual indicators
    for k,v in pairs(cachedItems) do
        if k ~= "internal" then
            local indicator = UnitCache[unitName].indicators[k]
            if indicator then
                indicator.showing = v.show or false
                indicator.color = v.color or indicator.color
            end
        end
    end
end

local function markIndicator(unitName, data)

    local statusType = data.buffType
    
    -- First, get the data structure
    if not indicatorCache[unitName] then indicatorCache[unitName] = {} end
    local ind = indicatorCache[unitName]
    if not ind.internal then ind.internal = {} end
    local internal = ind.internal
    
    -- Now see if we need to actually add an indicator for this
    if not internal[statusType] or internal[statusType].expiry < data.expiry or
      (internal[statusType].lowPriority and not data.lowPriority) then
      
        internal[statusType] = {
            expiry = data.expiry,
            index = data.effectIndex,
            lowPriority = data.lowPriority,
            color = {
                data.typeColorRed or DefaultColor.AbilityType.BUFF.r,
                data.typeColorGreen or DefaultColor.AbilityType.BUFF.g,
                data.typeColorBlue or DefaultColor.AbilityType.BUFF.b,
            },
        }
        
        -- We made a change
        return true
    end
    
    -- If we didn't need to make a change
    return false
end

local function clearIndicator(unitName, data)
    -- If this isn't something we were tracking in the first place, then there's nothing to do
    if not (data and data.buffType) then return false end
    
    local buffType = data.buffType
    local removedIndex = data.effectIndex
    
    -- Get the data structure
    if not indicatorCache[unitName] then indicatorCache[unitName] = {} end
    local ind = indicatorCache[unitName]
    if not ind.internal then ind.internal = {} end
    local internal = ind.internal
    
    -- See if this is the effect currently causing the appropriate indicator - if it's not, nothing to do here.
    if internal[buffType].index ~= removedIndex then return false end
    
    -- Get the buffs for this unit
    local buffs = buffCache[unitName]
    
    -- See if there are any other active buffs/debuffs of this type that would continue to display an indicator
    local expiry, newData, lowPriority = nil, nil, false
    for k,v in pairs(buffs) do
        if k ~= removedIndex and v.buffType == buffType and ((not expiry) or v.expiry > expiry
          or (lowPriority and not v.lowPriority)) then
            newData = v
            lowPriority = v.lowPriority
            expiry = v.expiry
            -- We could just exit out here if we found *anything* that would give an indicator, but then we'd end up searching more. Better to find the longest.
        end
    end
    
    if newData then
        -- Update the indicator if there's another effect of that type
        internal[buffType] = {
            expiry = newData.expiry,
            index = newData.effectIndex,
            color = {
                newData.typeColorRed or DefaultColor.AbilityType.BUFF.r,
                newData.typeColorGreen or DefaultColor.AbilityType.BUFF.g,
                newData.typeColorBlue or DefaultColor.AbilityType.BUFF.b,
            },
        }
    else
        -- Otherwise, clear it
        internal[buffType] = nil
    end
    
    return true
end

local function purgeBuffs(unitName)
    if not buffCache[unitName] then return end
    
    local buffs = buffCache[unitName]
    local changes = false
    
    for index,data in pairs(buffs) do
        if data.expiry <= timeCount then
            clearIndicator(unitName, data)
            buffs[index] = nil
            changes = true
        end
    end
    
    if changes then setIndicators(unitName, true) end
end

function SquaredBuffIndicators.OnUpdate(timePassed)
    timeCount = timeCount + timePassed
    
    -- If there's nothing to update, don't try
    if #UpdateQueue == 0 then return end
    
    -- For now, we'll try rendering one unit per frame and see how that goes.
    
    local pName = tremove(UpdateQueue, 1) -- pop off front
    purgeBuffs(pName)
    UnitCache[pName]:UpdateIndicators() -- update
    tinsert(UpdateQueue, pName) -- push onto back again to rotate
    
end

function SquaredBuffIndicators.EffectsUpdated(updateType, effects, isFull)
    
    -- if we haven't yet initialized this, then do it... need to do it at some point anyways
    if not dispels then makeDispels() end
    
    -- Since PLAYER_EFFECTS_UPDATED doesn't bother to specify the updateType, swap the arguments around
    if type(updateType) == "table" then
        effects, isFull, updateType = updateType, effects, GameData.BuffTargetType.SELF
    end
    
    -- Ignore silly update events.
    if not updateType then return end
    
    local pName = L""
    local isMe = false
    
    -- What type of update are we dealing with?
    if updateType >= GameData.BuffTargetType.GROUP_MEMBER_START and
       updateType <= GameData.BuffTargetType.GROUP_MEMBER_END then
        -- This is a group member update
        local groupIndex = updateType - GameData.BuffTargetType.GROUP_MEMBER_START + 1
        pName = (GroupWindow.groupData[groupIndex].name):match(L"([^^]+)")
    elseif updateType == GameData.BuffTargetType.SELF then
        -- This is a player update
        pName = playerName
        isMe = true
    elseif updateType == GameData.BuffTargetType.TARGET_FRIENDLY then
        -- This is a friendly target update
        pName = (TargetInfo:UnitName("selffriendlytarget")):match(L"([^^]+)")
        if not pName then return end -- If we don't have a friendly target, there's nothing to update
        if pName == (GameData.Player.name):match(L"([^^]+)") then
            isMe = true
        end
    else
        return -- (Ignore hostile target or other updates, we don't care.)
    end
    
    -- If this unit isn't part of our Squared display, we don't care.
    if not UnitCache[pName] then return end
    
    -- If we haven't ever gotten a buff update for this unit before, set up the new table
    -- Also, if it's a full update, clear the table anyways
    if isFull or (not buffCache[pName]) then buffCache[pName] = {} end
    
    local changes = false
    
    -- If it's a full update, wipe out the indicator cache
    if isFull then
        indicatorCache[pName] = {}
        changes = true
    end
    
    
    local career = GameData.Player.career.line
    
    local dispelHex = dispels[career]["Hex"]
    local dispelCurse = dispels[career]["Curse"]
    local dispelAilment = dispels[career]["Ailment"]
    
    -- Okay, so it's a unit we know and care about! What's happened to it now?
    for index,data in pairs(effects) do
        if (data and data.effectIndex and data.iconNum and data.iconNum > 0) then
            -- This index means something. But do we care? Time for a lot of conditional blocks... first, let's see if it's a curable debuff.
            if data.isHex then
                if dispelHex == "all" or (dispelHex == "self" and isMe) or allDebuff then
                    -- it's a hex and we can dispel it
                    data.buffType = "Hex"
                else
                    data = nil
                end
            elseif data.isCurse then
                if dispelCurse == "all" or (dispelCurse == "self" and isMe) or allDebuff then
                    -- it's a curse and we can dispel it
                    data.buffType = "Curse"
                else
                    data = nil
                end
            elseif data.isAilment then
                if dispelAilment == "all" or (dispelAilment == "self" and isMe) or allDebuff then
                    -- it's a ailment and we can dispel it
                    data.buffType = "Ailment"
                else
                    data = nil
                end
            elseif data.duration > 0 then
                -- If it's not a debuff, then we only care if it is temporary
                if data.isHealing and (data.castByPlayer or allHoT) then
                    -- This is a HoT
                    data.buffType = "HoT"
                elseif (data.isBuff or data.isBlessing) and (data.castByPlayer or allBuff) then
                    -- This is a buff
                    data.buffType = "Buff"
                else
                    -- Dunno what the heck is, but I guess we don't care.
                    data = nil
                end
            else
                -- We don't care.
                data = nil
            end
            
            -- If we cared about it, then timestamp it and mark it
            if data then
                data.expiry = data.duration + timeCount
                if data.duration > 600 then
                    data.lowPriority = true
                end
                changes = markIndicator(pName, data) or changes
            end
            
            -- Update the cache
            buffCache[pName][index] = data
        else
            -- This index being removed.
            changes = clearIndicator(pName, buffCache[pName][index]) or changes
            buffCache[pName][index] = nil
        end
    end
    
    if changes then
        -- Something for the indicators changed, so force an update of the frame.
        setIndicators(pName, true)
    end
end

function SquaredBuffIndicators.SetNameHandler(unit)
    UnitCache[unit.name] = unit
    setIndicators(unit.name)
    tinsert(UpdateQueue, 1, unit.name)
end

function SquaredBuffIndicators.ClearGroupHandler()
    -- event handler for when Squared groups are reset (reset our box cache)
    UnitCache = {}
    UpdateQueue = {}
    
    -- convenient place to initialize settings that the user might have changed,
    -- since it will always be called after a settings command
    updateFreq = tonumber(Squared.GetSetting("bufftracking-freq")) or 0.5
    renderFreq = tonumber(Squared.GetSetting("bufftracking-render-freq")) or 0.3
    
    iPos["Ailment"] = Squared.GetSetting("status-debuff")
    iPos["Curse"] = iPos["Ailment"]
    iPos["Hex"] = iPos["Ailment"]
    
    iPos["Buff"] = Squared.GetSetting("status-buff")
    iPos["HoT"] = Squared.GetSetting("status-hot")
    
    allBuff = not Squared.GetSetting("status-buff-selfonly")
    allDebuff = not Squared.GetSetting("status-debuff-selfonly")
    allHoT = not Squared.GetSetting("status-hot-selfonly")
end

function SquaredBuffIndicators.Initialize()
    RegisterEventHandler(SystemData.Events.PLAYER_TARGET_EFFECTS_UPDATED, "SquaredBuffIndicators.EffectsUpdated")
    RegisterEventHandler(SystemData.Events.PLAYER_EFFECTS_UPDATED, "SquaredBuffIndicators.EffectsUpdated")
    RegisterEventHandler(SystemData.Events.GROUP_EFFECTS_UPDATED, "SquaredBuffIndicators.EffectsUpdated")
    Squared.RegisterEventHandler("cleargroups", SquaredBuffIndicators.ClearGroupHandler)
    Squared.RegisterEventHandler("setname", SquaredBuffIndicators.SetNameHandler)
    playerName = (GameData.Player.name):match(L"([^^]+)")
end
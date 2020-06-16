SquaredBuffIndicators = {}

-- Make Squared table ref local for performance
local Squared = Squared

-- Settings

local UNITS_UPDATED_PER_FRAME = 1 -- How many units' buff caches are processed per frame for potential updates (includes timeouts)

-- Table with sets of rules for indicator display, numerically indexed by priority (1=highest)
local IndicatorRuleset =
{
    --[
    {
        position = "bottomleft",
        color = {255,255,255},
        condition =
        {
            "buffs",
            type = "BUFFTYPE",
        }
    }
    --]]
}

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
local WStringsCompareIgnoreGrammer = WStringsCompareIgnoreGrammer -- Yes, the function name is misspelt in the API.

-- time counter
local currentTime = 0

-- Efficient Lua queue for updates
local updates = {
    queue = {},
    front = 0,
    back = -1,
    dequeue = function(self) -- value = updates:dequeue()
        local front = self.front
        if front > self.back then return end
        local value = self.queue[front]
        self.queue[front] = nil -- garbage collection
        self.front = front + 1
        return value
    end,
    enqueue = function(self, value) -- updates:enqueue(value)
        local back = self.back + 1
        self.back = back
        self.queue[back] = value
    end,
    uniqueEnqueue = function(self, value) -- updates:enqueue(value)
        local i = self.front
        local queue = self.queue
        while i <= self.back do
            if queue[i] == value then return end
        end
        self:enqueue(value)
    end
}

-- cache for the units we're looking for
local UnitCache = {}

-- So as it turns out, it's actually about 2-4x faster to go through and set about 10 values to nil, then it is to set something equal to {} every time.
local buffCache = setmetatable({}, {__index=function(t,k) t[k] = {} return t[k] end})
local function CreateStatusCache(t, unit)
    -- If this unit doesn't have a cache entry yet, create it
    t[unit] =
        {
            ailments = {},
            curses = {},
            hexes = {},
            debuffs = {},
            healings = {},
            buffs = {},
            defensives = {},
            damagings = {},
            offensives = {},
            passives = {},
            granteds = {},
            selfcasts = {},
        }
    return t[unit]
end
local statusCache = setmetatable({}, {__index = CreateStatusCache})

local function ClearStatusCache(unit)
    
    local s = statusCache[unit]
    for k,v in pairs(s.curses) do s.curses[k] = nil end
    for k,v in pairs(s.ailments) do s.ailments[k] = nil end
    for k,v in pairs(s.hexes) do s.hexes[k] = nil end
    for k,v in pairs(s.debuffs) do s.debuffs[k] = nil end
    for k,v in pairs(s.healings) do s.healings[k] = nil end
    for k,v in pairs(s.buffs) do s.buffs[k] = nil end
    for k,v in pairs(s.defensives) do s.defensives[k] = nil end
    for k,v in pairs(s.damagings) do s.damagings[k] = nil end
    for k,v in pairs(s.offensives) do s.offensives[k] = nil end
    for k,v in pairs(s.passives) do s.passives[k] = nil end
    for k,v in pairs(s.granteds) do s.granteds[k] = nil end
    for k,v in pairs(s.selfcasts) do s.selfcasts[k] = nil end
    
    local b = buffCache[unit]
    for k,v in pairs(b) do b[k] = nil end
end

local function UpdateStatusCache(unit, i, data)
    
    local changed = false
    local s = statusCache[unit]

    if (data and data.effectIndex and data.iconNum and data.iconNum > 0) then
        s.ailments[i]       = data.isAilment            or nil
        s.curses[i]         = data.isCurse              or nil
        s.hexes[i]          = data.isHex                or nil
        s.debuffs[i]        = data.isDebuff             or nil
        s.healings[i]       = data.isHealing            or nil
        s.buffs[i]          = data.isBuff               or nil
        s.defensives[i]     = data.isDefensive          or nil
        s.damagings[i]      = data.isDamaging           or nil
        s.offensives[i]     = (not data.isDefensive)    or nil
        s.passives[i]       = data.isPassive            or nil
        s.granteds[i]       = data.isGranted            or nil
        s.selfcasts[i]      = data.castByPlayer         or nil
        
        -- Cache the buff data as well
        if (not buffCache[unit][i]) or (buffCache[unit][i].abilityId ~= data.abilityId) then
            changed = true
        end
        buffCache[unit][i] = data
        
        -- Calculate the expiry timestamp for the buff
        data.expiryTime = data.duration + currentTime
        
        -- Also calculate a lower-case version of the buff name for quick case-insensitive comparisons later
        data.lowerName = (data.name):lower()
        
    else
        -- No buff data for this index, so clear out the entries
        s.curses[i]         = nil
        s.ailments[i]       = nil
        s.hexes[i]          = nil
        s.debuffs[i]        = nil
        s.healings[i]       = nil
        s.buffs[i]          = nil
        s.defensives[i]     = nil
        s.damagings[i]      = nil
        s.offensives[i]     = nil
        s.passives[i]       = nil
        s.granteds[i]       = nil
        s.selfcasts[i]      = nil
        
        -- Clear the buff data cache for this buff index
        if buffCache[unit][i] then changed = true end
        buffCache[unit][i] = nil
        
    end
    
    return changed
end

local playerName = L"" -- cache this, no need to do a pattern match each time

-- Lookup table for what careers can display which types of debuffs
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

-- Returns true or false for the given condition on the specified unit.
local function ProcessConditionForUnit(unit, condition)
    if not (unit and condition) then return end
    
    local ctype = condition.type
    
    if ctype == "AND" then
        -- [1] = first condition to check
        -- [2] = second condition to check
        return
            (
                ProcessConditionForUnit(unit, condition[1])
            and
                ProcessConditionForUnit(unit, condition[2])
            )
            
    elseif ctype == "OR" then
        -- [1] = first condition to check
        -- [2] = second condition to check
        return
            (
                ProcessConditionForUnit(unit, condition[1])
            or
                ProcessConditionForUnit(unit, condition[2])
            )
            
    elseif ctype == "NOT" then
        -- [1] = condition to negate
        return not ProcessConditionForUnit(unit, condition[1])
            
    elseif ctype == "BUFFTYPE" then
        -- [1] = type of buff to check the presence of
        return (next(statusCache[unit][condition[1]]) and true or false)
    
    elseif ctype == "ABILITYID" then
        -- each numerical index will be looked for, this condition is true as long as at least one is present
        local b = buffCache[unit]
        for k,v in pairs(b) do
            for _,aid in ipairs(condition) do
                if v.abilityId == aid then return true end
            end
        end
        return false
        
    elseif ctype == "BUFFNAME" then
        -- each numerical index will be looked for, this condition is true as long as at least one is present
        -- (each name should be specified in lower case)
        local b = buffCache[unit]
        for k,v in pairs(b) do
            for _,bname in ipairs(condition) do
                if v.lowerName == bname then return true end
            end
        end
        return false
        
    elseif ctype == "DISPELLABLE" then
        local dtypes = dispels[GameData.Player.career.line]
        local s = statusCache[unit]
        if unit == playerName then
            if dtypes["Ailment"] and next(s.ailments) then return true end
            if dtypes["Curse"] and next(s.curses) then return true end
            if dtypes["Hex"] and next(s.hexes) then return true end
        else
            if dtypes["Ailment"] == "all" and next(s.ailments) then return true end
            if dtypes["Curse"] == "all" and next(s.curses) then return true end
            if dtypes["Hex"] == "all" and next(s.hexes) then return true end
        end
        return false
        
    end
end

local function GenerateIndicatorsForUnit(unit)
    -- If it's not a unit we care about, why are we trying to generate indicators for it?
    local u = UnitCache[unit]
    if not u then return end
    
    local inds = u.indicators
    
    local s = statusCache[unit]
    
    local finished = {}
    
    -- Clear out our existing indicators
    for pos,ind in pairs(inds) do
        if ind.sbicreated then
            inds[pos].showing = false
            ind.sbicreated = nil
        end
    end
    
    -- Loop through the indicator rules. Only use the first indicator that is active for each position.
    local pos
    for i,rule in ipairs(IndicatorRuleset) do
        pos = rule.position
        if not finished[pos] then
            if ProcessConditionForUnit(unit, rule.condition) then
                local ind = inds[pos]
                ind.showing = true
                ind.color = {unpack(rule.color)} -- dirty hack for deepcopy on a single-level table
                ind.sbicreated = true -- mark this indicator as having come from our module so we can erase it later
                finished[pos] = true
            end
        end
    end
    
    UnitCache[unit]:UpdateIndicators()
    
end

function SquaredBuffIndicators.SetNameHandler(unit)
    UnitCache[unit.name] = unit
    --setIndicators(unit.name)
    --tinsert(UpdateQueue, 1, unit.name)
end

function SquaredBuffIndicators.ClearGroupHandler()
    -- event handler for when Squared groups are reset (reset our box cache)
    UnitCache = {}
end

function SquaredBuffIndicators.EffectsUpdated(updateType, effects, isFull)
    
    -- if we haven't yet initialized this, then do it... need to do it at some point anyways
    if not dispels then makeDispels() end
    
    -- Since PLAYER_EFFECTS_UPDATED doesn't bother to specify the updateType, swap the arguments around
    if type(updateType) == "table" then
        effects, isFull, updateType = updateType, effects, GameData.BuffTargetType.SELF
    end
    
    -- Ignore silly update events (ones called with no arguments).
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
        if WStringsCompareIgnoreGrammer(pName, GameData.Player.name) == 0 then
            --isMe = true
            return -- We don't need to process friendly target updates for ourself, that'd just be duplicating the self updates
        end
    else
        return -- (Ignore hostile target or other updates, we don't care.)
    end
    
    -- If this unit isn't part of our Squared display, we don't care.
    if not UnitCache[pName] then return end
    
    if isFull then
        ClearStatusCache(pName)
    end
    
    -- Okay, so it's a unit we know and care about! What's happened to it now?
    local changes = false
    for index,data in pairs(effects) do
        changes = UpdateStatusCache(pName, index, data) or changes
    end
    
    if changes then
        -- Something for the indicators changed, so force an update of the frame.
        updates:uniqueEnqueue(pName)
    end
end

function SquaredBuffIndicators.OnUpdate(timePassed)
    currentTime = currentTime + timePassed
    
    -- if we haven't yet initialized this, then do it... need to do it at some point anyways
    if not dispels then makeDispels() end
    
    -- Process one unit's worth of updates per frame, if any need processing
    for _=1,UNITS_UPDATED_PER_FRAME do
        local updateUnit = updates:dequeue()
        if updateUnit then
            GenerateIndicatorsForUnit(updateUnit)
        else
            break
        end
    end
end

function SquaredBuffIndicators.Initialize()
    RegisterEventHandler(SystemData.Events.PLAYER_TARGET_EFFECTS_UPDATED, "SquaredBuffIndicators.EffectsUpdated")
    RegisterEventHandler(SystemData.Events.PLAYER_EFFECTS_UPDATED, "SquaredBuffIndicators.EffectsUpdated")
    RegisterEventHandler(SystemData.Events.GROUP_EFFECTS_UPDATED, "SquaredBuffIndicators.EffectsUpdated")
    Squared.RegisterEventHandler("cleargroups", SquaredBuffIndicators.ClearGroupHandler)
    Squared.RegisterEventHandler("setname", SquaredBuffIndicators.SetNameHandler)
    playerName = (GameData.Player.name):match(L"([^^]+)")
end

--[===[@debug@
-- return what are normally local tables
function SBIT()
    return {statusCache, buffCache, unitCache}
end
--@end-debug@]===]
SquaredRangeFading = {}

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
local wstring_match = wstring.match
local wstring_format = wstring.format
local string_match = string.match
local tinsert = table.insert
local tremove = table.remove

-- cache for the units we're looking for
local UnitCache = {}
local RangeBlacklist = {}

local updateFreq = 0
local buffUpdateFreq = updateFreq + 0.3
local nextUpdateTime = 0
local nextTargetUpdate = updateFreq / 2
local timeCount = 0

local baseMinAlpha = 0.2
local baseMaxAlpha = 0.5

local minAlpha = 0.3
local maxAlpha = 0.8
local InitialBlacklistTime = 10

local noAutoUnfade = false
local doFade = true

-- Flag that we're trying to target a unit
local clickedUnit = nil

-- might as well cache this
local abilityId = nil

-- Lookup function for ability IDs
local function getAbility(career)

    -- All of these are available at level 1, so we can always check them
    if career == GameData.CareerLine.SHAMAN             then return 1898 end -- Gork'll Fix It
    if career == GameData.CareerLine.RUNE_PRIEST        then return 1587 end -- Grungni's Gift
    if career == GameData.CareerLine.DISCIPLE	        then return 9548 end -- Restore Essence
    if career == GameData.CareerLine.ARCHMAGE           then return 9236 end -- Healing Energy
    if career == GameData.CareerLine.WARRIOR_PRIEST     then return 8238 end -- Divine Aid
    if career == GameData.CareerLine.ZEALOT             then return 8569 end -- Flash Of Chaos
    if career == GameData.CareerLine.IRON_BREAKER       then return 1353 end -- Oath Friend
    
    -- Only check for Guard if the player is at least level 10
    if GameData.Player.level >= 10 then
        if career == GameData.CareerLine.CHOSEN             then return 8325 end -- Guard (Chosen)
        if career == GameData.CareerLine.SWORDMASTER        then return 9008 end -- Guard (Swordmaster)
        if career == GameData.CareerLine.BLACK_ORC          then return 1674 end -- Save Da Runts
        if career == GameData.CareerLine.KNIGHT             then return 8013 end -- Guard (Knight of the Blazing Sun)
        if career == GameData.CareerLine.BLACKGUARD         then return 9325 end -- Guard (Black Guard)
    end
    
    return nil
end

function SquaredRangeFading.BlacklistName(blackName)

    if blackName and blackName ~= L"" then
        blackName = blackName:match(L"([^^]+)^?([^^]*)")
        -- we have a name, blacklist it
        if not RangeBlacklist[blackName] then
            RangeBlacklist[blackName] = {
                ["started"] = timeCount,
                ["expires"] = timeCount + InitialBlacklistTime,
            }
        else
            -- don't increment the blacklist unless we're down to at least half of the total blacklist time
            -- (prevents excessive blacklisting for rapid checks on the same target)
            local fractionDone = (timeCount - RangeBlacklist[blackName].started) /
                (RangeBlacklist[blackName].expires - RangeBlacklist[blackName].started)
                
            if fractionDone >= 0.5 then
                local totalTime = RangeBlacklist[blackName].expires - RangeBlacklist[blackName].started
                local newTotalTime = totalTime * 2
                RangeBlacklist[blackName].started = timeCount
                RangeBlacklist[blackName].expires = newTotalTime + timeCount
            end
        end
        
    end
            
end

function SquaredRangeFading.TargetUpdated(targetType)
    -- Only bother with this if we have an ability to check
    
    abilityId = abilityId or getAbility(GameData.Player.career.line) or 0
    if (not abilityId) or (abilityId == 0) then return end
    
    -- if we have a new friendly target, check to see if it's in range or not and update blacklist as necessary
    if targetType == "selffriendlytarget" or targetType == "squaredforce" then
        local valid, selected = IsTargetValid(abilityId)
        if not valid then
            if targetType == "selffriendlytarget" then TargetInfo:UpdateFromClient() end
            local failedName = TargetInfo:UnitName("selffriendlytarget")
            if failedName and failedName ~= L"" then
                failedName = failedName:match(L"([^^]+)^?([^^]*)")
                -- we have a name, blacklist it
                if not RangeBlacklist[failedName] then
                    RangeBlacklist[failedName] = {
                        ["started"] = timeCount,
                        ["expires"] = timeCount + InitialBlacklistTime,
                    }
                else
                    -- don't increment the blacklist unless we're down to at least half of the total blacklist time
                    -- (prevents excessive blacklisting for rapid checks on the same target)
                    local fractionDone = (timeCount - RangeBlacklist[failedName].started) /
                        (RangeBlacklist[failedName].expires - RangeBlacklist[failedName].started)
                        
                    if fractionDone >= 0.5 then
                        local totalTime = RangeBlacklist[failedName].expires - RangeBlacklist[failedName].started
                        local newTotalTime = totalTime * 2
                        RangeBlacklist[failedName].started = timeCount
                        RangeBlacklist[failedName].expires = newTotalTime + timeCount
                    end
                end
            end
       
        else
            -- Oh hey, the target is valid! Let's take them off blacklist.
            if targetType == "selffriendlytarget" then TargetInfo:UpdateFromClient() end
            local validName = TargetInfo:UnitName("selffriendlytarget")
            if validName and validName ~= L"" then
                validName = validName:match(L"([^^]+)^?([^^]*)")
                if RangeBlacklist[validName] then
                    RangeBlacklist[validName] = nil
                    UnitCache[validName] = UnitCache[validName] or Squared.GetUnitByName(validName)
                    if UnitCache[validName] then
                        UnitCache[validName].fadealpha = nil
                        UnitCache[validName]:Update()
                    end
                end
            end
        end
    end
end

function SquaredRangeFading.OnUpdate(timePassed)
    timeCount = timeCount + timePassed
    
    -- Wait until the update cycle is over to check
    if clickedUnit then
        local targetName = (TargetInfo:UnitName("selffriendlytarget")):match(L"([^^]+)^?([^^]*)")
        if targetName == nil then targetName = (GameData.Player.name):match(L"([^^]+)^?([^^]*)") end
        
        if targetName ~= clickedUnit then
            SquaredRangeFading.BlacklistName(clickedUnit)
        end
        
        clickedUnit = nil
    end
    
    if timeCount >= nextUpdateTime then
        nextUpdateTime = timeCount + updateFreq
        
        local doFade = Squared.GetSetting("rangefading")
        -- process fading updates
        for k,v in pairs(RangeBlacklist) do
            -- first, process still running blacklist timers
            if doFade and v.expires > timeCount then
                -- update cache if necessary
                local fractionDone = (timeCount - v.started) / (v.expires - v.started)
                UnitCache[k] = UnitCache[k] or Squared.GetUnitByName(k)
                if UnitCache[k] then
                    UnitCache[k].fadealpha = minAlpha + (min(fractionDone, 1) * (maxAlpha - minAlpha))
                    UnitCache[k]:UpdateFade()
                end
            -- next, process timers that just expired this update
            elseif v.expires > timeCount - timePassed and not noAutoUnfade then
                UnitCache[k] = UnitCache[k] or Squared.GetUnitByName(k)
                if UnitCache[k] then
                    UnitCache[k].fadealpha = nil
                    UnitCache[k]:UpdateFade()
                end
            end
        end
        
    end
    
    if timeCount >= nextTargetUpdate then
        -- always make sure this is happening on a different frame from the fading update, assuming it can be
        nextTargetUpdate = nextUpdateTime + (buffUpdateFreq / 2)
        
        SquaredRangeFading.TargetUpdated("squaredforce")
    end
end

function SquaredRangeFading.GetRangeAlpha(name)
    if not RangeBlacklist[name] then return nil end
    
    if RangeBlacklist[name].expires <= timeCount then
        if noAutoUnfade then
            return maxAlpha
        else
            return nil
        end
    end
    
    local fractionDone = (timeCount - RangeBlacklist[name].started) / (RangeBlacklist[name].expires - RangeBlacklist[name].started)
    local alpha = minAlpha + (min(fractionDone, 1) * (maxAlpha - minAlpha))
    
    return alpha
end

function SquaredRangeFading.SetNameHandler(unit)
    local name = unit.name
    UnitCache[name] = unit
    if RangeBlacklist[name] then
        local alpha = SquaredRangeFading.GetRangeAlpha(name)
        if alpha and doFade then
            UnitCache[name].fadealpha = alpha
            UnitCache[name]:UpdateFade()
        end
    end
end

function SquaredRangeFading.ClearGroupHandler()
    -- event handler for when Squared groups are reset (reset our box cache)
    UnitCache = {}
    
    doFade = Squared.GetSetting("rangefading")
    
    baseMinAlpha = Squared.GetSetting("rangefading-min") or 0.2
    baseMaxAlpha = Squared.GetSetting("rangefading-max") or 0.5
    
    minAlpha = baseMinAlpha * Squared.GetSetting("alpha")
    maxAlpha = baseMaxAlpha * Squared.GetSetting("alpha")
    
    noAutoUnfade = Squared.GetSetting("rangefading-noautounfade") or false
    
    updateFreq = tonumber(Squared.GetSetting("rangefading-freq")) or 0
    buffUpdateFreq = updateFreq + 0.3
end

function SquaredRangeFading.LButtonUp()
    local group, member = string_match(SystemData.MouseOverWindow.name, "SquaredUnit_([0-9]+)_([0-9]+).*")
    if not (group or member) then return end
    
    -- mouse released on a Squared unit - it should be targeted now if it's in range.
    local selectedUnit = Squared.GetUnit(tonumber(group), tonumber(member))
    if not selectedUnit then return end
    
    clickedUnit = selectedUnit.name
    
end

function SquaredRangeFading.ProcessAlert()
    for _,v in ipairs(SystemData.AlertText.VecText) do
        -- Generating matching patterns from localization format strings... I love it.
        local alertName = v:match(GetStringFormat(StringTables.Default.TEXT_TARGET_PLAYER_ERROR,{L"(%S+)"}))
        if alertName then
            SquaredRangeFading.BlacklistName(alertName)
        end
    end
end

function SquaredRangeFading.LoadingEnd()
    abilityId = getAbility(GameData.Player.career.line) or 0
end

function SquaredRangeFading.Initialize()
    RegisterEventHandler(SystemData.Events.PLAYER_TARGET_UPDATED, "SquaredRangeFading.TargetUpdated")
    RegisterEventHandler(SystemData.Events.SHOW_ALERT_TEXT, "SquaredRangeFading.ProcessAlert")
    RegisterEventHandler(SystemData.Events.LOADING_END, "SquaredRangeFading.LoadingEnd")
    --RegisterEventHandler(SystemData.Events.L_BUTTON_UP_PROCESSED, "SquaredRangeFading.LButtonUp")
    Squared.RegisterEventHandler("cleargroups", SquaredRangeFading.ClearGroupHandler)
    Squared.RegisterEventHandler("setname", SquaredRangeFading.SetNameHandler)
end
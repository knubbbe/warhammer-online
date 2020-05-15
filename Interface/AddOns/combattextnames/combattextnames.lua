-- The MIT License (MIT)
--
-- Copyright (c) 2019 cupnoodles
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--
--
CombatTextNames = {}

-- truncate styles
CombatTextNames.TRUNCATE_NONE = nil -- never truncate
CombatTextNames.TRUNCATE_SIMPLE = 1 -- truncate to min length
CombatTextNames.TRUNCATE_ABBREV = 2 -- abbreviate

-- these can be changed with /script and are reset on restarts
-- although you could set initial values here
CombatTextNames.CombatTextEnabled = true
CombatTextNames.IncomingHealsEnabled = true
CombatTextNames.IncomingMissesEnabled = true
CombatTextNames.IncomingDamageEnabled = true

-- constants, do not toucha!
local COMBAT_EVENT = 1

function CombatTextNames.Initialize()
    -- hooks
    EA_System_PointGainEntry.SetupText =
        CombatTextNames.HookPointGainTextScaler(
            EA_System_PointGainEntry.SetupText)

    if CombatTextNames.Settings.ResetPositionOnLOS then
        EA_System_EventTracker.Update = CombatTextNames.HookLOSPositioner(
                                            EA_System_EventTracker.Update)
    end

    -- REPLACEMENTS
    EA_System_EventText.AddCombatEventText = CombatTextNames.AddCombatEventText
    EA_System_EventEntry.SetupText = CombatTextNames.SetupText
    EA_System_EventTracker.InitializeAnimationData =
        CombatTextNames.InitializeAnimationData

    EA_System_EventEntry.m_Template = "CombatTextNames_Window_EventTextLabel"
    EA_System_PointGainEntry.m_Template =
        "CombatTextNames_Window_EventTextLabel"
end

-- CombatTextNames.HookPointGainTextScaler is a hook for
-- EA_System_PointGainEntry.SetupText that makes it possible to configure scale
-- of point gain text (influence, RR, etc).
function CombatTextNames.HookPointGainTextScaler(fn)
    return function(self, hitTargetObjectNumber, pointAmount, pointType)
        fn(self, hitTargetObjectNumber, pointAmount, pointType)
        self:SetRelativeScale(CombatTextNames.Settings.PointGainScaleFactor)
    end
end

-- CombatTextNames.AddCombatEventText is a replacement
-- for EA_System_EventText.AddCombatEventText which adds additional fields
-- (skill name and icon) to events it creates.
function CombatTextNames.AddCombatEventText(hitTargetObjectNumber, hitAmount,
                                            textType, abilityID)
    -- skip incoming events if they're toggled off
    if (hitTargetObjectNumber == GameData.Player.worldObjNum) and
        ((hitAmount < 0 and not CombatTextNames.IncomingDamageEnabled) or
            (hitAmount > 0 and not CombatTextNames.IncomingHealsEnabled) or
            (hitAmount == 0 and not CombatTextNames.IncomingMissesEnabled)) then
        return
    end

    if hitAmount ~= 0 and
        (math.abs(hitAmount) < CombatTextNames.Settings.MinHitAmount) then
        return
    end

    local data = GetAbilityData(abilityID)

    -- The SetupText function is going to receive only eventData.amount member.
    -- So we replace eventData.amount with a table that contains all the data we
    -- need. That is, we add ability name there. Doing things the "proper" way
    -- would require replacing more EA code, I'd rather avoid this.
    local eventData = {
        event = COMBAT_EVENT,
        amount = {
            hit = hitAmount,
            name = data.name,
            abilityID = abilityID,
            iconNum = data.iconNum
        },
        type = textType
    }

    if (EA_System_EventText.EventTrackers[hitTargetObjectNumber] == nil) then
        local newTrackerAnchorWindowName =
            "EA_System_EventTextAnchor" .. hitTargetObjectNumber
        CreateWindowFromTemplate(newTrackerAnchorWindowName,
                                 "EA_Window_EventTextAnchor",
                                 "EA_Window_EventTextContainer")
        local tracker = EA_System_EventTracker:Create(
                            newTrackerAnchorWindowName, hitTargetObjectNumber)
        EA_System_EventText.EventTrackers[hitTargetObjectNumber] = tracker

        -- For CombatTextNames.HookLOSPositioner, mark tracker as attached:
        tracker.attachedToObject = true
        tracker.timer = 0
    end

    EA_System_EventText.EventTrackers[hitTargetObjectNumber]:AddEvent(eventData)
end

function CombatTextNames.TruncateAbilityName(style, text)
    if style == CombatTextNames.TRUNCATE_SIMPLE then
        return
            wstring.sub(text, 1, CombatTextNames.Settings.TruncateMinLength) ..
                L"..."
    end

    text = wstring.gsub(wstring.gsub(text, L" of ", L"O"), L"%s", L"")
    return wstring.match(wstring.gsub(text, L"%l*", L""), L"([^^]+)^?.*")
end

-- CombatTextNames.SetupText is a replacement for EA_System_EventEntry.SetupText
-- that expects a `hitData` table (containing hit amount, skill name and icon)
-- instead of `amount` as the 3rd argument, and uses the bonus fields to set up
-- the combat text with an icon and/or a skill name.
function CombatTextNames.SetupText(self, hitTargetObjectNumber, hitData,
                                   textType)
    if CombatTextNames.Settings.EnableIcons and hitData.iconNum ~= 0 then
        local texture, x, y = GetIconData(hitData.iconNum)
        DynamicImageSetTexture(self:GetName() .. "Icon", texture, x, y)
    end

    local name = L""
    if CombatTextNames.Settings.EnableAbilityNames and hitData.name ~= L"" then
        if CombatTextNames.Settings.TruncateStyle and
            (wstring.len(hitData.name) >
                CombatTextNames.Settings.TruncateMinLength) then
            name = CombatTextNames.TruncateAbilityName(
                       CombatTextNames.Settings.TruncateStyle, hitData.name)
        else
            name = hitData.name
        end

        name = L" (" .. towstring(name) .. L")"
    end

    local amount = hitData.hit
    local text = L""
    local scale = CombatTextNames.Settings.OwnEventScaleFactor

    -- labels such as "Block" or "Absorb" replace damage numbers
    local replacementLabel = CombatTextNames.EventLabelReplacement[textType]
    if not replacementLabel then
        text = amount .. name
        if (amount > 0) then
            text = L"+" .. text
        end

        if ((textType == GameData.CombatEvent.CRITICAL) or
            (textType == GameData.CombatEvent.ABILITY_CRITICAL)) then
            text = text .. CombatTextNames.Settings.CritPostfix
            scale = CombatTextNames.Settings.CriticalScaleFactor
        end
    else
        text = replacementLabel
        if CombatTextNames.Settings.EnableNamesOnMissText then
            text = text .. name
        end
    end

    local color = CombatTextNames.GetCombatEventColor(hitTargetObjectNumber,
                                                      amount, textType)
    LabelSetTextColor(self:GetName(), color.r, color.g, color.b)
    self:SetRelativeScale(scale)
    LabelSetText(self:GetName(), text)
end

-- CombatTextNames.HookLOSPositioner will try to position EventTracker
-- on screen according to LOS: in the center of the screen if the worldobj is
-- out of LOS, or attached to worldobj otherwise. It is meant to be hooked on
-- EA_System_EventTracker.Update
function CombatTextNames.HookLOSPositioner(fn)
    return function(self, elapsedTime)
        self.timer = (self.timer or 0) + elapsedTime
        if self.timer >= CombatTextNames.Settings.LOSCheckPeriod and
            self.m_TargetObject then
            self.timer = self.timer - CombatTextNames.Settings.LOSCheckPeriod
            if not self.attachedToObject then
                -- NOTE: atm AttachWindowToWorldObject doesn't support heights
                -- different than `1` so using self.m_AttachHeight would
                -- result in flicker.
                MoveWindowToWorldObject(self.m_Anchor, self.m_TargetObject, 1)
            end

            if not WindowGetShowing(self.m_Anchor) then
                self.attachedToObject = false
                DetachWindowFromWorldObject(self.m_Anchor, self.m_TargetObject)
                WindowSetShowing(self.m_Anchor, true)
                WindowClearAnchors(self.m_Anchor)
                WindowAddAnchor(self.m_Anchor, "center", "Root", "center", 0, 0)
            elseif not self.attachedToObject then
                self.attachedToObject = true
                WindowClearAnchors(self.m_Anchor)
                DetachWindowFromWorldObject(self.m_Anchor, self.m_TargetObject)
                AttachWindowToWorldObject(self.m_Anchor, self.m_TargetObject)
            end
        end

        fn(self, elapsedTime)
    end
end

-- CombatTextNames.InitializeAnimationData is a replacement
-- for EA_System_EventTracker:InitializeAnimationData that makes it possible
-- to configure animation parameters from this addon.
function CombatTextNames.InitializeAnimationData(self, displayType)
    local baseAnimation = CombatTextNames.Settings.Animation.Friendly

    if (displayType == COMBAT_EVENT) then
        if (self.m_TargetObject == GameData.Player.worldObjNum) then
            baseAnimation = CombatTextNames.Settings.Animation.Friendly
        else
            baseAnimation = CombatTextNames.Settings.Animation.Hostile
        end
    else
        baseAnimation = CombatTextNames.Settings.Animation.Default
    end

    local animationData = {
        start = {x = baseAnimation.start.x, y = baseAnimation.start.y},
        target = {x = baseAnimation.target.x, y = baseAnimation.target.y},
        current = {x = baseAnimation.start.x, y = baseAnimation.start.y},
        maximumDisplayTime = baseAnimation.maximumDisplayTime,
        fadeDelay = baseAnimation.fadeDelay,
        fadeDuration = baseAnimation.fadeDuration
    }

    return animationData
end

-- CombatTextNames.GetCombatEventColor is an alternative to
-- DefaultColor.GetCombatEventColor with configurable colors (although you
-- could hijack DefaultColor...).
function CombatTextNames.GetCombatEventColor(hitTargetObjectNumber, hitAmount,
                                             textType)
    local colors = CombatTextNames.Settings.Colors
    local isPlayer = hitTargetObjectNumber == GameData.Player.worldObjNum

    if (hitAmount < 0) then
        local color = colors.Attack[isPlayer][textType]
        if color then
            return color
        end

        if isPlayer then
            return colors.OUTGOING_DAMAGE
        end

        return colors.INCOMING_DAMAGE
    end

    local color = colors.Defense[isPlayer][textType]
    if color then
        return color
    end

    -- NOTE: On RoR misses have positive hitAmounts. Not that it matters
    -- because known miss types should be present in colors.Defense table.
    if (hitAmount > 0) then
        if isPlayer then
            return colors.INCOMING_HEALING
        end

        return colors.OUTGOING_HEALING
    end

    if isPlayer then
        return colors.INCOMING_MISS
    end

    return colors.OUTGOING_MISS
end

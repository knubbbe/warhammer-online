-- User interaction functions are in this file
--
--
-- Use these macros if you want to toggle text for all/some events:
--
-- /script CombatTextNames.Toggle(); CombatTextNames.PrintState()
-- /script CombatTextNames.ToggleIncomingDamage(); CombatTextNames.PrintState()
-- /script CombatTextNames.ToggleIncomingHeals(); CombatTextNames.PrintState()
-- /script CombatTextNames.ToggleIncomingMisses(); CombatTextNames.PrintState()
--
function CombatTextNames.Print(str)
    TextLogAddEntry("Chat", 0, L"CombatTextNames: " .. towstring(str))
end

function CombatTextNames.PrintState()
    local stateText
    if (CombatTextNames.CombatTextEnabled and
        CombatTextNames.IncomingMissesEnabled and
        CombatTextNames.IncomingDamageEnabled and
        CombatTextNames.IncomingHealsEnabled) then
        stateText = "All events enabled."
    else
        stateText = "Disabled: ["
        if not CombatTextNames.IncomingMissesEnabled then
            stateText = stateText .. " inc.miss"
        end
        if not CombatTextNames.IncomingDamageEnabled then
            stateText = stateText .. " inc.dmg"
        end
        if not CombatTextNames.IncomingHealsEnabled then
            stateText = stateText .. " inc.heal"
        end
        if not CombatTextNames.CombatTextEnabled then
            stateText = stateText .. " ALL"
        end
        stateText = stateText .. " ]"
    end
    CombatTextNames.Print(stateText)
end

function CombatTextNames.SetEnabled(b)
    if b then
        CombatTextNames.Enable()
    else
        CombatTextNames.Disable()
    end
end

function CombatTextNames.Disable()
    CombatTextNames.CombatTextEnabled = false
    UnregisterEventHandler(SystemData.Events.WORLD_OBJ_COMBAT_EVENT,
                           "EA_System_EventText.AddCombatEventText")
end

function CombatTextNames.Enable()
    CombatTextNames.CombatTextEnabled = true
    RegisterEventHandler(SystemData.Events.WORLD_OBJ_COMBAT_EVENT,
                         "EA_System_EventText.AddCombatEventText")
end

function CombatTextNames.Toggle()
    CombatTextNames.SetEnabled(not CombatTextNames.CombatTextEnabled)
end

function CombatTextNames.IsEnabled()
    return CombatTextNames.CombatTextEnabled
end

function CombatTextNames.GetState()
    return CombatTextNames.IncomingDamageEnabled,
           CombatTextNames.IncomingHealsEnabled,
           CombatTextNames.IncomingMissesEnabled
end

function CombatTextNames.SetIncomingDamage(b)
    CombatTextNames.IncomingDamageEnabled = b
end

function CombatTextNames.SetIncomingHeals(b)
    CombatTextNames.IncomingHealsEnabled = b
end

function CombatTextNames.SetIncomingMisses(b)
    CombatTextNames.IncomingMissesEnabled = b
end

function CombatTextNames.ToggleIncomingDamage()
    CombatTextNames.IncomingDamageEnabled =
        not CombatTextNames.IncomingDamageEnabled
end

function CombatTextNames.ToggleIncomingHeals()
    CombatTextNames.IncomingHealsEnabled =
        not CombatTextNames.IncomingHealsEnabled
end

function CombatTextNames.ToggleIncomingMisses()
    CombatTextNames.IncomingMissesEnabled =
        not CombatTextNames.IncomingMissesEnabled
end

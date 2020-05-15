-- This table is provided as a quick way to set multiple colors in settings below
-- instead of copypasting values.
local Colors = {
    INCOMING_DAMAGE = {r = 255, g = 0, b = 0},
    INCOMING_DAMAGE_CRIT = {r = 255, g = 0, b = 0},
    OUTGOING_DAMAGE = {r = 235, g = 235, b = 235},
    OUTGOING_DAMAGE_CRIT = {r = 235, g = 235, b = 235},
    INCOMING_SPECIAL_DAMAGE = {r = 255, g = 66, b = 0},
    INCOMING_SPECIAL_DAMAGE_CRIT = {r = 255, g = 66, b = 0},
    OUTGOING_SPECIAL_DAMAGE = {r = 235, g = 215, b = 135},
    OUTGOING_SPECIAL_DAMAGE_CRIT = {r = 235, g = 215, b = 135},
    INCOMING_ABSORB = {r = 11, g = 66, b = 233},
    OUTGOING_ABSORB = {r = 11, g = 66, b = 233},
    INCOMING_HEALING = {r = 0, g = 200, b = 0},
    OUTGOING_HEALING = {r = 0, g = 138, b = 0},
    INCOMING_MISS = {r = 228, g = 228, b = 228},
    OUTGOING_MISS = {r = 156, g = 156, b = 156},
    EXPERIENCE_GAIN = {r = 255, g = 170, b = 0},
    RENOWN_GAIN = {r = 194, g = 56, b = 153},
    INFLUENCE_GAIN = {r = 0, g = 170, b = 163}
}

CombatTextNames.Settings = {
    ResetPositionOnLOS = true, -- whether to center text on screen if the worldobj it's attached to is out of LOS
    LOSCheckPeriod = 0.5,
    EnableIcons = true,
    EnableAbilityNames = true,
    EnableNamesOnMissText = true, -- only works if names are enabled
    CritPostfix = L"", -- text to append to crits (e.g. L"!" or L" crit")
    TruncateStyle = CombatTextNames.TRUNCATE_ABBREV, -- see combattextnames.lua for styles
    TruncateMinLength = 8, -- only ability names longer than this are truncated
    MinHitAmount = 0, -- min absolute dmg/healing amount to display the event text (set to 0 to display all)
    Colors = {
        -- Attack colors are used for hits with `hitAmount < 0`
        Attack = {
            -- is player (incoming)
            [true] = {
                [GameData.CombatEvent.HIT] = Colors.INCOMING_DAMAGE,
                [GameData.CombatEvent.CRITICAL] = Colors.INCOMING_DAMAGE_CRIT,
                [GameData.CombatEvent.ABILITY_HIT] = Colors.INCOMING_SPECIAL_DAMAGE,
                [GameData.CombatEvent.ABILITY_CRITICAL] = Colors.INCOMING_SPECIAL_DAMAGE_CRIT
            },
            -- not player
            [false] = {
                [GameData.CombatEvent.HIT] = Colors.OUTGOING_DAMAGE,
                [GameData.CombatEvent.CRITICAL] = Colors.OUTGOING_DAMAGE_CRIT,
                [GameData.CombatEvent.ABILITY_HIT] = Colors.OUTGOING_SPECIAL_DAMAGE,
                [GameData.CombatEvent.ABILITY_CRITICAL] = Colors.OUTGOING_SPECIAL_DAMAGE_CRIT
            }
        },
        -- Defense is used for misses.
        -- (For some reason, on RoR misses have positive hitAmount so this table
        -- will be used for heals too if you set GameData.CombatEvent.ABILITY_HIT
        -- and such).
        Defense = {
            -- is player (incoming)
            [true] = {
                [GameData.CombatEvent.ABSORB] = Colors.INCOMING_ABSORB,
                [GameData.CombatEvent.BLOCK] = Colors.INCOMING_MISS,
                [GameData.CombatEvent.PARRY] = Colors.INCOMING_MISS,
                [GameData.CombatEvent.DISRUPT] = Colors.INCOMING_MISS,
                [GameData.CombatEvent.EVADE] = Colors.INCOMING_MISS,
                [GameData.CombatEvent.IMMUNE] = Colors.INCOMING_MISS,
                [GameData.CombatEvent.BLOCK] = Colors.INCOMING_MISS
            },
            -- not player
            [false] = {
                [GameData.CombatEvent.ABSORB] = Colors.OUTGOING_ABSORB,
                [GameData.CombatEvent.BLOCK] = Colors.OUTGOING_MISS,
                [GameData.CombatEvent.PARRY] = Colors.OUTGOING_MISS,
                [GameData.CombatEvent.DISRUPT] = Colors.OUTGOING_MISS,
                [GameData.CombatEvent.EVADE] = Colors.OUTGOING_MISS,
                [GameData.CombatEvent.IMMUNE] = Colors.OUTGOING_MISS,
                [GameData.CombatEvent.BLOCK] = Colors.OUTGOING_MISS
            }
        },
        -- Fallback colors for events not specified in Defense or Attack colors.
        INCOMING_DAMAGE = Colors.INCOMING_DAMAGE,
        OUTGOING_DAMAGE = Colors.OUTGOING_DAMAGE,
        INCOMING_HEALING = Colors.INCOMING_HEALING,
        OUTGOING_HEALING = Colors.OUTGOING_HEALING,
        INCOMING_MISS = Colors.INCOMING_MISS,
        OUTGOING_MISS = Colors.OUTGOING_MISS
    },
    PointGainScaleFactor = 1.3,
    CriticalScaleFactor = 1.3,
    OwnEventScaleFactor = 1,
    Animation = {
        Default = {
            start = {x = 0, y = -100},
            target = {x = 0, y = -180},
            current = {x = 0, y = -100},
            maximumDisplayTime = 4,
            fadeDelay = 2,
            fadeDuration = 0.75
        },
        Hostile = {
            start = {x = 0, y = -100},
            target = {x = 0, y = -180},
            current = {x = 0, y = -100},
            maximumDisplayTime = 4,
            fadeDelay = 2,
            fadeDuration = 0.75
        },
        Friendly = {
            start = {x = -150, y = 70},
            target = {x = -150, y = -70},
            current = {x = -150, y = 70},
            maximumDisplayTime = 4,
            fadeDelay = 2,
            fadeDuration = 0.75
        }
    }
}

CombatTextNames.EventLabelReplacement = {
    [GameData.CombatEvent.BLOCK] = GetStringFromTable("CombatEvents",
                                                      StringTables.CombatEvents
                                                          .LABEL_BLOCK),
    [GameData.CombatEvent.PARRY] = GetStringFromTable("CombatEvents",
                                                      StringTables.CombatEvents
                                                          .LABEL_PARRY),
    [GameData.CombatEvent.EVADE] = GetStringFromTable("CombatEvents",
                                                      StringTables.CombatEvents
                                                          .LABEL_EVADE),
    [GameData.CombatEvent.DISRUPT] = GetStringFromTable("CombatEvents",
                                                        StringTables.CombatEvents
                                                            .LABEL_DISRUPT),
    [GameData.CombatEvent.ABSORB] = GetStringFromTable("CombatEvents",
                                                       StringTables.CombatEvents
                                                           .LABEL_ABSORB),
    [GameData.CombatEvent.IMMUNE] = GetStringFromTable("CombatEvents",
                                                       StringTables.CombatEvents
                                                           .LABEL_IMMUNE)
}

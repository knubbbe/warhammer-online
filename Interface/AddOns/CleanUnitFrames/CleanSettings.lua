function CleanSettingsSetDefaultTable()


         CleanSettings = {
         
--------------------- DO NOT EDIT ABOVE THIS LINE ------------------------------

------------------------------- GENERAL ----------------------------------------
            archColors = {
               TANK  = { 205, 140, 60 }, -- brown for tanks
               MPDPS = { 255, 80, 80 }, --red for melee physical dps
               RPDPS = { 255, 180, 0 }, --orange for ranged physical dps
               RMDPS = { 255, 255, 60 }, -- yellow for ranged magical dps
               MSUPP = { 180, 120, 255 }, --lavender for melee support
               RSUPP = { 160, 170, 255 }, --lightblue for ranged support
            },
            
            arches = { --[[
               [GameData.CareerLine.IRON_BREAKER] = "TANK",
               [GameData.CareerLine.SWORDMASTER] = "TANK",
               [GameData.CareerLine.CHOSEN] = "TANK",
               [GameData.CareerLine.BLACK_ORC] = "TANK",
               --[GameData.CareerLine.SHADE] = "TANK",
               [GameData.CareerLine.KNIGHT] = "TANK",
               [GameData.CareerLine.WITCH_HUNTER] = "MPDPS",
               [GameData.CareerLine.SEER] = "MPDPS", -- White Lion (go figure?)
               [GameData.CareerLine.WARRIOR] = "MPDPS", -- Marauder
               [GameData.CareerLine.ASSASSIN] = "MPDPS", -- Witch Elf
               [GameData.CareerLine.BRIGHT_WIZARD] = "RMDPS",
               [GameData.CareerLine.MAGUS] = "RMDPS",
               [GameData.CareerLine.SORCERER] = "RMDPS",
               --["Sorceress"] = "RMDPS", -- Not needed now that we're line-based instead of name
               [GameData.CareerLine.ENGINEER] = "RPDPS",
               [GameData.CareerLine.SHADOW_WARRIOR] = "RPDPS",
               [GameData.CareerLine.SQUIG_HERDER] = "RPDPS",
               [GameData.CareerLine.WARRIOR_PRIEST] = "MSUPP",
               [GameData.CareerLine.BLOOD_PRIEST] = "MSUPP", -- Disciple of Khaine
               [GameData.CareerLine.ARCHMAGE] = "RSUPP",
               [GameData.CareerLine.SHAMAN] = "RSUPP",
               [GameData.CareerLine.RUNE_PRIEST] = "RSUPP",
               [GameData.CareerLine.ZEALOT] = "RSUPP",
]]
                [GameData.CareerLine.ZEALOT]             = "RSUPP",
                [GameData.CareerLine.ARCHMAGE]           = "RSUPP",
                [GameData.CareerLine.SHAMAN]             = "RSUPP",
                [GameData.CareerLine.RUNE_PRIEST]        = "RSUPP",
                [GameData.CareerLine.DISCIPLE]           = "MSUPP",
                [GameData.CareerLine.WARRIOR_PRIEST]     = "MSUPP",

                [GameData.CareerLine.SLAYER]             = "MPDPS",
                [GameData.CareerLine.MARAUDER]           = "MPDPS",
                [GameData.CareerLine.WITCH_ELF]          = "MPDPS",
                [GameData.CareerLine.WHITE_LION]         = "MPDPS",
                [GameData.CareerLine.CHOPPA]             = "MPDPS",
                [GameData.CareerLine.WITCH_HUNTER]       = "MPDPS",
                
                [GameData.CareerLine.ENGINEER]           = "RPDPS",
                [GameData.CareerLine.SHADOW_WARRIOR]     = "RPDPS",
                [GameData.CareerLine.SQUIG_HERDER]       = "RPDPS",
                [GameData.CareerLine.SORCERER]           = "RMDPS",
                [GameData.CareerLine.MAGUS]              = "RMDPS",
                [GameData.CareerLine.BRIGHT_WIZARD]      = "RMDPS",
                
                [GameData.CareerLine.IRON_BREAKER]       = "TANK",
                [GameData.CareerLine.KNIGHT]             = "TANK",
                [GameData.CareerLine.SWORDMASTER]        = "TANK",
                [GameData.CareerLine.BLACKGUARD]         = "TANK",
                [GameData.CareerLine.CHOSEN]             = "TANK",
                [GameData.CareerLine.BLACK_ORC]          = "TANK",
            },
            
----------------------------- CUF-SPECIFIC -------------------------------------

            showNameColors = true,

            Group = {
               showIcons = true,
               showPets = true,
               showBuffs = true,
               buffPoint = "bottomleft",
               buffRelPoint = "topleft",
               buffX = 8,
               buffY = 4,
            },
            
            hostileAbilityCheck = nil,
            friendlyAbilityCheck = nil,
            
            MouseOverTarget = false,
            MouseOverCast = false,
            
            ShowTargetBuffs = true,
            ShowPlayerBuffs = true,
            
            ShowTargets = true,
            
--------------------- DO NOT EDIT BELOW THIS LINE ------------------------------            
            
         }

end

function CleanSettingsInitialize()
    if not (type(CleanSettings)=="table") then
        CleanSettingsSetDefaultTable()
    -- elseif not CleanSettings.arches[GameData.CareerLine.SHADE] then
    --     CleanSettings.arches[GameData.CareerLine.SHADE] = "TANK"
    --     CleanSettings.arches[GameData.CareerLine.KNIGHT] = "TANK"
    end
   
   -- Slash commands
   LibSlash.RegisterSlashCmd("clean",
      function(args)
         local opt, val = args:match("([a-z0-9]+)[ ]?(.*)")
         
         -- SHOW/HIDE
         if opt == "show" or opt == "hide" then
            local opt2, val2 = val:match("([a-z0-9]+)[ ]?(.*)")
            if opt2 == "group" then
               if val2 == "buffs" then
                  CleanSettings.Group.showBuffs = (opt == "show")
                  CleanGroupWindow.PositionGroupMemberWindows(true)
                  CleanGroupWindow.UpdateEffects()
               elseif val2 == "icons" then
                  CleanSettings.Group.showIcons = (opt == "show")
                  CleanGroupWindow.PositionGroupMemberWindows(true)
               elseif val2 == "pets" then
                  CleanSettings.Group.showPets = (opt == "show")
                  CleanGroupWindow.PositionGroupMemberWindows(true)
               end
            elseif opt2 == "namecolors" then
                CleanSettings.showNameColors = (opt == "show")
                CleanGroupWindow.PositionGroupMemberWindows(true)
                CleanPlayerWindow.UpdatePlayer()
            end
         end
         
         -- SET
         if opt == "set" then
            local opt2, val2 = val:match("([a-z0-9]+)[ ]?(.*)")
            if opt2 == "group" then
               local pref, prefval = val2:match("([a-z0-9]+)[ ]?(.*)")
               
               -- buff positioning
               if pref == "buffpoint" then
                  CleanSettings.Group.buffPoint = prefval
                  CleanGroupWindow.ResetBuffFrames()
               elseif pref == "buffrelpoint" then
                  CleanSettings.Group.buffRelPoint = prefval
                  CleanGroupWindow.ResetBuffFrames()
               elseif pref == "buffx" then
                  CleanSettings.Group.buffX = tonumber(prefval)
                  CleanGroupWindow.ResetBuffFrames()
               elseif pref == "buffy" then
                  CleanSettings.Group.buffY = tonumber(prefval)
                  CleanGroupWindow.ResetBuffFrames()
               end
               
            elseif opt2 == "hostilespell" then
                local abilityId = tonumber(val2)
                local abilityData = GetAbilityTable(GameData.AbilityType.STANDARD)
                if not abilityId then
                    for k,v in pairs(abilityData) do
                        if (v["name"]:lower()):find(towstring(val2:lower())) then abilityId = k end
                    end
                end
                if abilityId then
                    
                    if abilityData[abilityId] then
                        if abilityData[abilityId].targetType == 1 then
                            CleanSettings.hostileAbilityCheck = abilityId
                            TextLogAddEntry("Chat", 0, L"Hostile ability checking enabled for '"..abilityData[abilityId].name..L"'.")
                        else
                            TextLogAddEntry("Chat", 0,L"Could not set hostile ability to check: "..abilityData[abilityId].name..L"is not an offensive spell.")
                        end
                    else
                        TextLogAddEntry("Chat", 0, L"Could not set hostile ability to check: "..towstring(abilityId)..L" is not an id for a spell you have.")
                    end
                else
                    TextLogAddEntry("Chat", 0,L"Could not set hostile ability to check: invalid input.")
                end
            elseif opt2 == "friendlyspell" then
                local abilityId = tonumber(val2)
                local abilityData = GetAbilityTable(GameData.AbilityType.STANDARD)
                if not abilityId then
                    for k,v in pairs(abilityData) do
                        if (v["name"]:lower()):find(towstring(val2:lower())) then abilityId = k end
                    end
                end
                if abilityId then
                    if abilityData[abilityId] then
                        if abilityData[abilityId].targetType == 2 then
                            CleanSettings.friendlyAbilityCheck = abilityId
                            TextLogAddEntry("Chat", 0,L"Friendly ability checking enabled for '"..abilityData[abilityId].name..L"'.")
                        else
                            TextLogAddEntry("Chat", 0,L"Could not set friendly ability to check: "..abilityData[abilityId].name..L"is not a defensive spell.")
                        end
                    else
                        TextLogAddEntry("Chat", 0,L"Could not set friendly ability to check: "..towstring(abilityId)..L" is not an id for a spell you have.")
                    end
                else
                    TextLogAddEntry("Chat", 0,L"Could not set friendly ability to check: invalid input.")
                end
            elseif opt2 == "hovertarget" then
                if val2 == "on" then
                    CleanSettings.MouseOverTarget = true
                    TextLogAddEntry("Chat", 0,L"Mouseover targeting enabled for player and group frames.")
                else
                    CleanSettings.MouseOverTarget = false
                    TextLogAddEntry("Chat", 0,L"Mouseover targeting disabled for player and group frames.")
                end
                
            elseif opt2 == "hovercast" then
                if val2 == "on" then
                    CleanSettings.MouseOverCast = true
                    TextLogAddEntry("Chat", 0,L"Mouseover casting enabled for player and group frames.")
                else
                    CleanSettings.MouseOverCast = false
                    TextLogAddEntry("Chat", 0,L"Mouseover casting disabled for player and group frames.")
                end
                
            elseif opt2 == "targetbuffs" then
                if val2 == "on" then
                    CleanSettings.ShowTargetBuffs = true
                    TextLogAddEntry("Chat", 0,L"Buffs and debuffs for targets are now showing.")
                else
                    CleanSettings.ShowTargetBuffs = false
                    TextLogAddEntry("Chat", 0,L"Buffs and debuffs for targets are no longer showing.")
                end
                
            elseif opt2 == "playerbuffs" then
                if val2 == "on" then
                    CleanSettings.ShowPlayerBuffs = true
                    CleanPlayerWindow.UpdateBuffs()
                    TextLogAddEntry("Chat", 0,L"Buffs and debuffs for player are now showing.")
                else
                    CleanSettings.ShowPlayerBuffs = false
                    CleanPlayerWindow.UpdateBuffs()
                    TextLogAddEntry("Chat", 0,L"Buffs and debuffs for player are no longer showing.")
                end
                
            elseif opt2 == "targets" then
                if val2 == "on" then
                    CleanSettings.ShowTargets = true
                    TextLogAddEntry("Chat", 0,L"Player targets are now showing.")
                else
                    CleanSettings.ShowTargets = false
                    TextLogAddEntry("Chat", 0,L"Player targets are no longer showing.")
                end
            end   
         end
         
      end) -- end slash command
end
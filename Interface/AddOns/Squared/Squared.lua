if not Squared then Squared = {} end

local VERSION = { MAJOR = 3, MINOR = 8, REV = 10 }

-- Make Squared table ref local for performance
local Squared = Squared

Squared.Build = L"259"

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

-- 1.1.1 upgrades
local GetGroupData = PartyUtils and PartyUtils.GetPartyData or GetGroupData

-- generic deepcopy
local function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return new_table
    end
    return _copy(object)
end

local firstLoad = true

local handlers = {}
local mode = nil
local eventHandlers = {
    ["addunit"] = {},
    ["layoutgroup"] = {},
    ["layoutgroups"] = {},
    ["changemode"] = {},
    ["unitlclick"] = {},
    ["unitrclick"] = {},
    ["unitlrelease"] = {},
    ["unitrrelease"] = {},
	["unitmouseover"] = {},
	["unitmouseout"] = {},
    ["cleargroups"] = {},
    ["setname"] = {},
    ["setsetting"] = {},
}

-- since eventHandlers are local to this file, we need to allow unitframe objects to fire this
function Squared.FireSetNameHandler(unit)
    -- trigger any registered event handlers
    for _,v in ipairs(eventHandlers["setname"]) do
        v(unit)
    end
end

local targetUpdatedFlag = true

SquaredDisabled = {}
function SquaredDisabled.OnLoad() Squared.ClearGroups() end
function SquaredDisabled.OnUnload() return end

function Squared.OldVersionTasks(oldVersion)
    if oldVersion == nil then
        -- Okay, we've released enough versions since 2.2 that an unset oldVersion probably means a fresh install.
    elseif oldVersion.MAJOR <= 2 and oldVersion.MINOR <= 3 then
        DialogManager.MakeOneButtonDialog(
            L"In Squared 2.4+ you should no longer need to set rangefading-ability.",
            L"Ok", nil)
    elseif oldVersion.MAJOR <= 2 and oldVersion.MINOR <= 5 then
        DialogManager.MakeOneButtonDialog(
            L"Squared 2.6+ has a GUI config interface accessible via /squared.",
            L"Ok", nil)
    elseif oldVersion.MAJOR <= 2 then
        DialogManager.MakeOneButtonDialog(
            L"Squared 3.0 now supports textures, which are finally possible after Patch 1.1.",
            L"Ok", nil)
	elseif oldVersion.MAJOR <= 3 and oldVersion.MINOR <= 3 then
		DialogManager.MakeOneButtonDialog(
            L"Squared 3.4+ now has a minimap toggle button - LClick to toggle, RClick for settings.",
            L"Ok", nil)
    elseif oldVersion.MAJOR <= 3 and oldVersion.MINOR <= 5 then
        DialogManager.MakeOneButtonDialog(
            L"Did you know that you can use the mod 'Busted' to help submit more useful bug reports? You can find it on Curse.",
            L"Ok", nil)
    end
end

function Squared.ResetSettings()
    Squared.Settings = {}
	Squared.ResetActiveProfile()
    Squared.SetSetting("version", VERSION)
    Squared.RestorePosition()
    Squared.SavePosition(2)
end

function Squared.Initialize()
    
    Squared.groups = {}
    mode = nil
    
    Squared.oldTargetName = nil
    Squared.targetName = nil
    
    if not Squared.Settings then Squared.Settings = {} end
    if not Squared.Defaults then Squared.Defaults = {} end
    
    Squared.InitializeDefaults()
    Squared.InitImportExport()
    
    -- Register this window for movement with the Layout Editor
    LayoutEditor.RegisterWindow("SquaredAnchor", L"Squared Anchor", L"The anchor point for Squared.",
        false, false, true, nil)
    
    RegisterEventHandler(SystemData.Events.LOADING_END, "Squared.OnLoad")
    RegisterEventHandler(SystemData.Events.RELOAD_INTERFACE, "Squared.OnLoad")
    RegisterEventHandler(SystemData.Events.GROUP_UPDATED, "Squared.ChangeMode")
    RegisterEventHandler(SystemData.Events.SCENARIO_BEGIN, "Squared.ChangeMode")
    RegisterEventHandler(SystemData.Events.SCENARIO_END, "Squared.ChangeMode")
    
    -- 1.3.5
    if SystemData.Events.CITY_SCENARIO_BEGIN then
        RegisterEventHandler(SystemData.Events.CITY_SCENARIO_BEGIN, "Squared.ChangeMode")
        RegisterEventHandler(SystemData.Events.CITY_SCENARIO_END, "Squared.ChangeMode")
    end
    
    RegisterEventHandler(SystemData.Events.SCENARIO_GROUP_JOIN, "Squared.ChangeMode")
    RegisterEventHandler(SystemData.Events.SCENARIO_GROUP_LEAVE, "Squared.ChangeMode")
    RegisterEventHandler(SystemData.Events.BATTLEGROUP_UPDATED, "Squared.ChangeMode")
    RegisterEventHandler(SystemData.Events.PLAYER_TARGET_UPDATED, "Squared.TargetUpdate")
    RegisterEventHandler(SystemData.Events.PLAYER_BEGIN_CAST, "Squared.TargetUpdate")
    
    Squared.RegisterModeHandler("disabled", SquaredDisabled)
    
	Squared.InitializeClickAssist()
	
    d("Squared loaded.")
end

function Squared.OnLoad()
    
    if not firstLoad then return end
    firstLoad = false

	-- Register us to know when the layout editor is done.
    tinsert(LayoutEditor.EventHandlers, Squared.SavePosition)
	
	if Squared.InitProfiles then
		Squared.InitProfiles()
	end
    
    Squared.RestorePosition()
    
    if LibSlash and type(Squared.SlashHandler) == "function" then
        if not LibSlash.IsSlashCmdRegistered("squared") then
            LibSlash.RegisterSlashCmd("squared", Squared.SlashHandler)
            LibSlash.RegisterSlashCmd("sqr", Squared.SlashHandler)
        end
    end
        
    Squared.ChangeMode()
    Squared.ResetMode()
    
    -- Version checking
    local oldVersion = Squared.GetSetting("version")
    Squared.SetSetting("version", VERSION)
    Squared.OldVersionTasks(oldVersion)
end

function Squared.ToggleActive()
	Squared.SetSetting("disable", not Squared.GetSetting("disable"))
	Squared.ChangeMode()
end

function Squared.ShowSettings()
	if SquaredConfigurator and SquaredConfigurator.Toggle then
		SquaredConfigurator.Toggle()
	end
end

function Squared.RestorePosition()
    -- Restore the previous position of the window, even across addon version changes
    
    LayoutEditor.UnregisterWindow("SquaredAnchor")
    
    WindowClearAnchors("SquaredAnchor")
    WindowAddAnchor("SquaredAnchor",
        Squared.GetSetting("anchor-point"),
        Squared.GetSetting("anchor-relwin"),
        Squared.GetSetting("anchor-relpoint"),
        Squared.GetSetting("anchor-x"),
        Squared.GetSetting("anchor-y"))
    WindowSetScale("SquaredAnchor", Squared.GetSetting("anchor-scale"))
    WindowSetDimensions("SquaredAnchor", Squared.GetSetting("boxwidth") / InterfaceCore.GetScale(), Squared.GetSetting("boxheight") / InterfaceCore.GetScale())
    
    LayoutEditor.RegisterWindow("SquaredAnchor", L"Squared Anchor", L"The anchor point for Squared.",
        false, false, false, nil)
		
	LayoutEditor.UnregisterWindow("SquaredIcon")
    
    WindowClearAnchors("SquaredIcon")
    WindowAddAnchor("SquaredIcon",
        Squared.GetSetting("anchoricon-point"),
        Squared.GetSetting("anchoricon-relwin"),
        Squared.GetSetting("anchoricon-relpoint"),
        Squared.GetSetting("anchoricon-x"),
        Squared.GetSetting("anchoricon-y"))
	WindowSetShowing("SquaredIcon", Squared.GetSetting("anchoricon-show"))
    
    LayoutEditor.RegisterWindow("SquaredIcon", L"Squared Toggle", L"The toggle button for Squared.",
        false, false, true, nil)
    
    Squared.ReanchorGroups()
end

function Squared.SavePosition(eventId)
    -- Save position when the layout editor tells us it's finished.
    if eventId == LayoutEditor.EDITING_END then
        local point, relpoint, relwin, x, y = WindowGetAnchor("SquaredAnchor", 1)
        Squared.SetSetting("anchor-point", point)
        Squared.SetSetting("anchor-relpoint", relpoint)
        Squared.SetSetting("anchor-relwin", relwin)
        Squared.SetSetting("anchor-x", x)
        Squared.SetSetting("anchor-y", y)
        Squared.SetSetting("anchor-scale", WindowGetScale("SquaredAnchor"))
		
		local point, relpoint, relwin, x, y = WindowGetAnchor("SquaredIcon", 1)
        Squared.SetSetting("anchoricon-point", point)
        Squared.SetSetting("anchoricon-relpoint", relpoint)
        Squared.SetSetting("anchoricon-relwin", relwin)
        Squared.SetSetting("anchoricon-x", x)
        Squared.SetSetting("anchoricon-y", y)
		Squared.SetSetting("anchoricon-show", WindowGetShowing("SquaredIcon"))
		
        Squared.ResetMode()
    end
end

function Squared.OnUpdate(timePassed)
    if handlers[mode] and handlers[mode].OnUpdate then
        handlers[mode].OnUpdate(timePassed)
    end
    
    if targetUpdatedFlag then
        local newTargetName = TargetInfo:UnitName("selffriendlytarget")
        if not newTargetName then return end
        Squared.targetName = newTargetName:match(L"([^^]+)^?([^^]*)")
        if Squared.targetName ~= Squared.oldTargetName then
            if Squared.oldTargetName and Squared.oldTargetName ~= L"" then
                local oldTargetUnit = Squared.GetUnitByName(Squared.oldTargetName)
                if oldTargetUnit then
                    oldTargetUnit:SetMyTargetFlag(false)
                    oldTargetUnit:Update()
                end
            end
            local newTargetUnit = Squared.GetUnitByName(Squared.targetName)
            if newTargetUnit then
                Squared.oldTargetName = Squared.targetName
                newTargetUnit:SetMyTargetFlag(true)
                newTargetUnit:Update()
            else
                Squared.oldTargetName = nil
            end
        end
    
        targetUpdatedFlag = false
    end
    
    if Squared.GetSetting("rangefading") then
        SquaredRangeFading.OnUpdate(timePassed)
    end
end

function Squared.TargetUpdate(targetType)
    targetUpdatedFlag = true
end

function Squared.ChangeMode(shouldReset)
    -- Figure out what mode we should use. Prefer later modes, but default to earlier ones.
    local newMode = "default"
    
    if Squared.GetSetting("disable") then
        newMode = "disabled"
    elseif Squared.GetSetting("testmode") then
        newMode = "testmode"
    else
    
        local groupData = GetGroupData()
        for k,v in pairs(groupData) do
            if v and v.name and v.name ~= L"" then
                newMode = "group"
            end
        end
        
        if IsWarBandActive() then
            newMode = "warband"
        end
        
        if GameData.Player.isInSiege or GameData.Player.isInScenario then
            newMode = "scenario"
        end
        
    end
    
    -- trigger any registered event handlers
    -- they can return a mode, or just return nil/false and the auto-chosen one will be used
    for _,v in ipairs(eventHandlers["changemode"]) do
        newMode = v(newMode) or newMode
    end
    
    -- Now that we know what mode we should be using, do we need to change?
    if (newMode ~= mode) or shouldReset then
        if mode and handlers[mode] then
            handlers[mode].OnUnload()
        end
        if not Squared.GetSetting("disable-"..newMode) then
            mode = newMode
        else
            mode = "disabled"
        end
        Squared.ClearGroups()
        if handlers[mode] then
            handlers[mode].OnLoad()
        else
            d("Squared could not find a handler for mode '"..mode.."'!")
        end
    end
end

function Squared.GetMode()
    return mode
end

function Squared.SetMode(newMode)
    if newMode ~= mode then
        if mode and handlers[mode] then
            handlers[mode].OnUnload()
        end
        mode = newMode
        Squared.ClearGroups()
        if handlers[mode] then
            handlers[mode].OnLoad()
        else
            d("Squared could not find a handler for mode '"..mode.."'!")
        end
    end
end

function Squared.ResetMode()
    if mode then
        if handlers[mode] then
            handlers[mode].OnUnload()
            Squared.ClearGroups()
            handlers[mode].OnLoad()
        else
            d("Squared could not find a handler for mode '"..mode.."'!")
        end
    end
end

function Squared.RegisterModeHandler(mode, obj)
    if type(obj) ~= "table" then
        d("Attempt to register non-table object as Squared handler for mode '"..mode.."' failed.")
        return nil
    else
        if handlers[mode] then
            d("Warning: overwriting existing handler for Squared mode '"..mode.."'.")
        end
        handlers[mode] = obj
        return Squared
    end
end

function Squared.RegisterEventHandler(event, func)
    -- sanity checks
    if not type(func) == "function" then return false end
    if not eventHandlers[event] then return false end
    
    for _,v in ipairs(eventHandlers[event]) do
        if v == func then return nil end
    end
    tinsert(eventHandlers[event], func)
    return true
end

function Squared.UnregisterEventHandler(event, func)
    if not eventHandlers[event] then return false end
    for k,v in ipairs(eventHandlers[event]) do
        if v == func then
            tremove(eventHandlers[event], k)
            return true
        end
    end
    return nil
end

function Squared.ClearGroups()
    -- trigger any registered Squared event handlers
    for _,v in ipairs(eventHandlers["cleargroups"]) do
        v(Squared.groups)
    end
    
    for k,v in pairs(Squared.groups) do
        for k2,v2 in pairs(v) do
            Squared.groups[k][k2]:Destroy()
            Squared.groups[k][k2] = nil
        end
        Squared.groups[k] = nil
    end
    Squared.groups = {}
end

function Squared.SoftClearGroups()
    -- trigger any registered Squared event handlers
    for _,v in ipairs(eventHandlers["cleargroups"]) do
        v(Squared.groups)
    end
    
    for k,v in pairs(Squared.groups) do
        for k2,v2 in pairs(v) do
            Squared.groups[k][k2]:Deactivate()
        end
    end

end

function Squared.FinalizeSoftClear()
    for k,v in pairs(Squared.groups) do
        for k2,v2 in pairs(v) do
            if Squared.groups[k][k2].inactive then
                Squared.groups[k][k2]:Show(false)
            end
        end
    end
end

function Squared.AddGroup(group)
    if not Squared.groups[group] then
        Squared.groups[group] = {}
        return Squared.groups[group]
    else
        return Squared.groups[group]
    end
end

function Squared.GetGroup(group)
    return Squared.groups[group]
end

function Squared.AddUnit(group, member, show)
    if not Squared.groups[group] then
        Squared.AddGroup(group)
    end
    if Squared.groups[group][member] then
        return Squared.groups[group][member]:Activate(show)
    else
        local newUnit = SquaredUnitFrame:Create(group, member)
        if newUnit then
        
            -- trigger any registered event handlers
            -- they can return a unitframe, or just return nil/false and the one created will be used
            for _,v in ipairs(eventHandlers["addunit"]) do
                newUnit = v(newUnit) or newUnit
            end
            
            Squared.groups[group][member] = newUnit
            
            if show or show == nil then
                newUnit:Show(true)
            else
                newUnit:Show(false)
            end
            Squared.ReanchorGroup(group)
        end
        return newUnit
    end
end

function Squared.GetUnit(group, member)
    if not Squared.groups[group] then return nil end
    return Squared.groups[group][member]
end

function Squared.GetUnitByName(name)
    if not name or name == L"" then return nil end
    for k1,group in pairs(Squared.groups) do
        for k2,v in pairs(group) do
            if (v.name):match(L"([^^]+)^?([^^]*)") == name:match(L"([^^]+)^?([^^]*)") then return Squared.groups[k1][k2] end
        end
    end
    return nil
end

function Squared.ReanchorGroup(group)
    if not Squared.groups[group] then return nil end
    
    -- trigger any registered event handlers
    -- they can return a group object, or just return nil/false and the current one will be used
    for _,v in ipairs(eventHandlers["layoutgroup"]) do
        Squared.groups[group] = v(Squared.groups[group]) or Squared.groups[group]
    end
    
    local memDir = Squared.GetSetting("direction-member")
    local prevMember = nil
    local memberOffset = (Squared.GetSetting("spacing-member") or 0)  / InterfaceCore.GetResolutionScale()
    for k,member in ipairs(Squared.groups[group]) do
        -- Ignore inactive items
        if not member.inactive then
            
            -- only anchor units after the first
            if prevMember then
                local prevName = prevMember:GetName()
                if member.anchoredTo ~= prevName then
                    member:ClearAnchors()
                    if memDir == "up" then
                        member:AddAnchor("top", prevMember:GetName(), "bottom", 0, -1*memberOffset)
                    elseif memDir == "left" then
                        member:AddAnchor("left", prevMember:GetName(), "right", -1*memberOffset, 0)
                    elseif memDir == "down" then
                        member:AddAnchor("bottom", prevMember:GetName(), "top", 0, memberOffset)
                    else --default "right"
                        member:AddAnchor("right", prevMember:GetName(), "left", memberOffset, 0)
                    end
                    member.anchoredTo = prevName
                end
            end
            prevMember = member
        end
        
    end
end

function Squared.ReanchorGroups()

    -- trigger any registered event handlers
    -- they can return a group object, or just return nil/false and the current one will be used
    for _,v in ipairs(eventHandlers["layoutgroups"]) do
        Squared.groups = v(Squared.groups) or Squared.groups
    end

    local groupDir = Squared.GetSetting("direction-group")
    local memDir = Squared.GetSetting("direction-member")
    
    local groupOffset = (Squared.GetSetting("spacing-group") or 0) / InterfaceCore.GetResolutionScale()
    
    local colSize = Squared.GetSetting("columnsize") or 0
    local colDir = Squared.GetSetting("direction-column") or "down"
    local colSpace = (Squared.GetSetting("spacing-column") or 0) / InterfaceCore.GetResolutionScale()
    
    local anchorName = nil
    local columnTop = nil
    local displayedCount = 0
    for k,v in pairs(Squared.groups) do
        if v[1] and not v[1].inactive then
            -- Check if we should start a new column
            if (colSize > 0) and ((displayedCount % colSize) == 0) then anchorName = nil end
            
            displayedCount = displayedCount + 1
            
            local anchorSquare = v[1]
            if anchorName then
                if anchorSquare.anchoredTo ~= anchorName then
                    anchorSquare:ClearAnchors()
                    
                    if groupDir == "up" then
                        anchorSquare:AddAnchor("topleft", anchorName, "bottomleft", 0, -1*groupOffset)
                    elseif groupDir == "right" then
                        anchorSquare:AddAnchor("topright", anchorName, "topleft", groupOffset, 0)
                    elseif groupDir == "left" then
                        anchorSquare:AddAnchor("topleft", anchorName, "topright", -1*groupOffset, 0)
                    else -- default "down"
                        anchorSquare:AddAnchor("bottomleft", anchorName, "topleft", 0, groupOffset)
                    end
                    anchorSquare.anchoredTo = anchorName
                end
            else
                    
                if columnTop then
                    if anchorSquare.anchoredTo ~= columnTop then
                        anchorSquare:ClearAnchors()
                        if colDir == "up" then
                            anchorSquare:AddAnchor("topleft", columnTop, "bottomleft", 0, -1*colSpace)
                        elseif colDir == "down" then
                            anchorSquare:AddAnchor("bottomleft", columnTop, "topleft", 0, colSpace)
                        elseif colDir == "left" then
                            anchorSquare:AddAnchor("topleft", columnTop, "topright", -1*colSpace, 0)
                        else
                            anchorSquare:AddAnchor("topright", columnTop, "topleft", colSpace, 0)
                        end
                        anchorSquare.anchoredTo = columnTop
                    end
                else
                    if anchorSquare.anchoredTo ~= "SquaredAnchor" then
                        anchorSquare:ClearAnchors()
                        anchorSquare:AddAnchor("topleft", "SquaredAnchor", "topleft", 0, 0)
                        anchorSquare.anchoredTo = "SquaredAnchor"
                    end
                end
                columnTop = anchorSquare:GetName()
            end
            
            if groupDir == memDir then
                anchorName = v[#v]:GetName()
            else
                anchorName = v[1]:GetName()
            end
        end
    end
    
    Squared.TargetUpdate("selffriendlytarget")
end

function Squared.UnitLClick(flags, x, y)
    local mouseWin = SystemData.MouseOverWindow.name
    local group, member = mouseWin:match("^SquaredUnit_([0-9]+)_([0-9]+).*")
    
    group = tonumber(group)
    member = tonumber(member)
    
    if group and member then
        -- trigger any registered event handlers
        -- if they return a non-false value, handling will stop
        for _,v in ipairs(eventHandlers["unitlclick"]) do
            if v(group, member, flags) then return end
        end
        
        if handlers[mode] and handlers[mode].UnitLClick then
            handlers[mode]:UnitLClick(group, member, flags)
        end
        
        -- Might as well update fading status for current unit
        if SquaredRangeFading then
            SquaredRangeFading.TargetUpdated("squaredforce")
        end
    end
end

function Squared.UnitRClick(flags, x, y)
    local mouseWin = SystemData.MouseOverWindow.name
    local group, member = mouseWin:match("^SquaredUnit_([0-9]+)_([0-9]+).*")
    
    group = tonumber(group)
    member = tonumber(member)
    
    if group and member then
        -- trigger any registered event handlers
        -- if they return a non-false value, handling will stop
        for _,v in ipairs(eventHandlers["unitrclick"]) do
            if v(group, member, flags) then return end
        end
        
        if handlers[mode] and handlers[mode].UnitRClick then
            handlers[mode]:UnitRClick(group, member, flags)
        end
    end
end

function Squared.UnitLRelease(flags, x, y)
    local mouseWin = SystemData.MouseOverWindow.name
    local group, member = mouseWin:match("^SquaredUnit_([0-9]+)_([0-9]+).*")
    
    group = tonumber(group)
    member = tonumber(member)
    
    if group and member then
        -- trigger any registered event handlers
        -- if they return a non-false value, handling will stop
        for _,v in ipairs(eventHandlers["unitlrelease"]) do
            if v(group, member, flags) then return end
        end
        
        if handlers[mode] and handlers[mode].UnitLRelease then
            handlers[mode]:UnitLRelease(group, member, flags)
        end
    end
end

function Squared.UnitRRelease(flags, x, y)
    local mouseWin = SystemData.MouseOverWindow.name
    local group, member = mouseWin:match("^SquaredUnit_([0-9]+)_([0-9]+).*")
    
    group = tonumber(group)
    member = tonumber(member)
    
    if group and member then
        -- trigger any registered event handlers
        -- if they return a non-false value, handling will stop
        for _,v in ipairs(eventHandlers["unitrrelease"]) do
            if v(group, member, flags) then return end
        end
        
        if handlers[mode] and handlers[mode].UnitRRelease then
            handlers[mode]:UnitRRelease(group, member, flags)
        end
    end
end

function Squared.UnitMouseOver(flags, x, y)
    local mouseWin = SystemData.MouseOverWindow.name
    local group, member = mouseWin:match("^SquaredUnit_([0-9]+)_([0-9]+).*")
    
    group = tonumber(group)
    member = tonumber(member)
    
    if group and member then
        -- trigger any registered event handlers
        -- if they return a non-false value, handling will stop
        for _,v in ipairs(eventHandlers["unitmouseover"]) do
            if v(group, member, flags) then return end
        end
        
        if handlers[mode] and handlers[mode].UnitMouseOver then
            handlers[mode]:UnitMouseOver(group, member, flags)
        else
			-- silent for mouseover, otherwise this would probably get spammy on many modes.
        end
    end
end

function Squared.UnitMouseOut(flags, x, y)
    local mouseWin = SystemData.MouseOverWindow.name
    local group, member = mouseWin:match("^SquaredUnit_([0-9]+)_([0-9]+).*")
    
    group = tonumber(group)
    member = tonumber(member)
    
    if group and member then
        -- trigger any registered event handlers
        -- if they return a non-false value, handling will stop
        for _,v in ipairs(eventHandlers["unitmouseout"]) do
            if v(group, member, flags) then return end
        end
        
        if handlers[mode] and handlers[mode].UnitMouseOut then
            handlers[mode]:UnitMouseOut(group, member, flags)
        else
			-- silent for mouseover, otherwise this would probably get spammy on many modes.
        end
    end
end

function Squared.GetSetting(key)
    if Squared.Settings[key] ~= nil then
        return Squared.Settings[key]
    else
        if Squared.Defaults[key] ~= nil then
            Squared.Settings[key] = Squared.Defaults[key]
            return Squared.Settings[key]
        else
            return nil
        end
    end
end

function Squared.SetSetting(key, value)
    -- call any registered event handlers
    -- they can return nil to not change inputs,
    -- or return a value to change the set value,
    -- or return a key, value pair to change both the set key and the set value
    for _,v in ipairs(eventHandlers["setsetting"]) do
        local rKey, rValue = v(key, value)
        if not rValue then rKey, rValue = nil, rKey end
        key = rKey or key
        value = rValue or value
    end

    Squared.Settings[key] = value
    Squared.ResetMode()
end

function Squared.MassSetSettings(newsettings)
	-- accepts a table of key=>value mappings to change
	-- only calls ResetMode() once instead of for each setting,
	-- much more efficient for changing numerous settings at once
	
	for k,v in pairs(newsettings) do
		for _,h in ipairs(eventHandlers["setsetting"]) do
	        local rKey, rValue = h(k, v)
	        if not rValue then rKey, rValue = nil, rKey end
	        k = rKey or k
	        v = rValue or v
	    end

	    Squared.Settings[k] = deepcopy(v)
	end
	
	Squared.ResetMode()
end

-- Settings import/export handling
local function diff(a, b)
    if type(a) ~= type(b) then return true end
    if type(a) == "table" then
        if a[1] ~= b[1] then return true end
        if a[2] ~= b[2] then return true end
        if a[3] ~= b[3] then return true end
    else
        if a ~= b then return true end
    end
    return false
end
    
local function default_diff()
    local settings = deepcopy(Squared.Settings)
    
    local items = {}
    
    for k,v in pairs(settings) do
        if k:sub(1,6) ~= "anchor" and k:sub(1,7) ~= "version" and diff(v, Squared.Defaults[k]) then
            local vstr = k..":"..type(v):sub(1,1)..":"
            if type(v) == "table" then
                vstr = vstr..string.format("%d,%d,%d", v[1], v[2], v[3])
            else
                vstr = vstr..tostring(v)
            end
            table.insert(items, vstr)
        end
    end
    return table.concat(items, "|")
end

function Squared.InitImportExport()
    CreateWindow("SquaredImportExport", false)
    ButtonSetText("SquaredImportExportFrameImportButton", L"Import")
    ButtonSetText("SquaredImportExportFrameExportButton", L"Export")
    LabelSetText("SquaredImportExportTitleText", L"Squared Settings Import/Export")
    LabelSetText("SquaredImportExportFrameCopyInfo", L"Paste in text and then click Import, or click Export and then copy out text.")
end

function Squared.OpenImportExport()
    TextEditBoxSetText("SquaredImportExportFrameData", L"")
    WindowSetShowing("SquaredImportExport", true)
end

function Squared.CloseImportExport()
    WindowSetShowing("SquaredImportExport", false)
end

function Squared.ImportSettings()
    local data = TextEditBoxGetText("SquaredImportExportFrameData")
    data = WStringToString(data)
    
    local settings = {}
    
    -- Because string.gmatch is borken in 1.3.1 :(    
    local gmatch = function( str, pattern )
        local init = 1
        local function gmatch_it()
            if init <= str:len() then 
                local s, e = str:find(pattern, init)
                if s then
                    local res = {str:match(pattern, init)}
                    init = e+1
                    return unpack(res)
                end
            end
        end
        return gmatch_it
    end
    
    for k,t,v in gmatch(data, "([%a%d-]+):(%a):([^%s|]+)") do
        if t == "t" then -- table
            local r,g,b = v:match("(%d+),(%d+),(%d+)")
            settings[k] = {tonumber(r),tonumber(g),tonumber(b)}
        elseif t == "n" then -- number
            settings[k] = tonumber(v)
        elseif t == "b" then -- boolean
            settings[k] = (v == "true")
        elseif t == "s" then -- string
            settings[k] = v
        end
    end
    
    Squared.MassSetSettings(settings)
    
    TextEditBoxSetText("SquaredImportExportFrameData", L"Settings have been imported.")
    WindowAssignFocus("SquaredImportExportFrameData", true)
    
end

function Squared.ExportSettings()
    TextEditBoxSetText("SquaredImportExportFrameData", towstring(default_diff()))
    WindowAssignFocus("SquaredImportExportFrameData", true)
    TextEditBoxSelectAll("SquaredImportExportFrameData")
end

function Squared.TestDiff()
    return default_diff()
end
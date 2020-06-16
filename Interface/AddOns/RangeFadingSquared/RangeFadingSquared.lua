if not RangeFadingSquared then RangeFadingSquared = {} end
local Addon = RangeFadingSquared

-- Make Squared table ref local for performance
local Squared = Squared
local SquaredConfigurator = SquaredConfigurator
local LibGUI = LibStub("LibGUI")
-- cache for the units we're looking for
local UnitCache = {}

local baseMinAlpha = 0.2
local baseMaxAlpha = 1.0

local minAlpha = 0.2
local maxAlpha = 1.0

local targetbordercolorcache
local targetbordercolorOOS = {255, 0, 0}

local range3 = 30
local range2 = 100
local range1 = 150

local multi3 = 0.875
local multi2 = 0.75
local multi1 = 0.4

local currentMode = ""	-- Squared Mode

local unpack = unpack
local table_insert = table.insert
local WindowGetAnchor = WindowGetAnchor

local playersName = nil
local function GetPlayersName()
	if (playersName == nil) then
	    playersName = (GameData.Player.name):match(L"([^^]+)^?([^^]*)")
	end
	return playersName
end

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

function Addon.Print(args)
	if args == nil then 
		args = "nil"
	elseif type(args) == "boolean" then 
		args = args and L"true" or L"false"
	elseif type(args) == "wstring" then
		args = WStringToString(args)
	end
	EA_ChatWindoW.Print(L"RangeFadingSquared: "..towstring(args))
end

-- To be added to SquaredUnitFrame.lua
--[[function SquaredUnitFrame:GetDistant()
    return self.distant
end]]--

function Addon.OnRangeUpdated(_, name, distance)
	--if name:match(L"([^^]+)^?([^^]*)") == GameData.Player.name:match(L"([^^]+)^?([^^]*)") then DEBUG(L"Got "..name..L" in "..towstring(object)) end
	--DEBUG(name..L": "..distance)
	UnitCache[name] = UnitCache[name] or Squared.GetUnitByName(name)
	if not UnitCache[name] then return end
	local unitframe = UnitCache[name]
	-- Don't try to update inactive frames.
	if unitframe.inactive then return end
	
	local alpha
	local sphere = 0
	--d(L"Range",range)
	-- don´t do out of region here atm
	if distance > Squared.GetSetting("Range4") then	-- default 300 aka distant
		alpha= minAlpha
		sphere = 5
	elseif distance > Squared.GetSetting("Range3") then -- > default150
		alpha = minAlpha + (maxAlpha - minAlpha) * multi1
		sphere = 4
	elseif distance <= Squared.GetSetting("Range1") then --Guard distance
		alpha = maxAlpha
		sphere = 1
	elseif distance <= Squared.GetSetting("Range2") then	-- <= 100
		alpha = minAlpha + (maxAlpha - minAlpha) * multi3
		sphere = 2
	elseif distance <= Squared.GetSetting("Range3") then -- <= 150
		alpha = minAlpha + (maxAlpha - minAlpha) * multi2
		sphere = 3
	end
	--if alpha == nil then d(L"alpha == nil and distance is: ",distance) end
	if alpha > maxAlpha then alpha = maxAlpha end
	--d(L"Sphere",sphere)
    --local wName = unitframe:GetName()
    --local iconAlpha = Squared.GetSetting("icon-alpha") or 0.5
	
	unitframe.fadealpha = alpha
	unitframe:UpdateFade()

	local RangeLabel = unitframe.RangeLabel
	local position = Squared.GetSetting("Range-Label-Position"..sphere)
	--d(position)
	if position == 4 then
		RangeLabel:SetText(L"")
	else
		local pointOnAnchor = ""
		local pointOnSelf = ""
		if position == 1 then
			pointOnAnchor = "center"
			pointOnSelf = "center"
		elseif position == 2 then
			pointOnAnchor = "topright"
			pointOnSelf = "topright"
		elseif position == 3 then
			pointOnAnchor = "bottomright"
			pointOnSelf = "bottomright"
		end
		
		local x = Squared.GetSetting("Range-Label-X"..sphere)
		local y = Squared.GetSetting("Range-Label-Y"..sphere)

		if RangeLabel.xOffset ~= x or RangeLabel.yOffset ~= y or RangeLabel.pointOnAnchor ~= pointOnAnchor or RangeLabel.pointOnSelf ~= pointOnSelf then
			RangeLabel.pointOnAnchor = pointOnAnchor
			RangeLabel.pointOnSelf = pointOnSelf
			RangeLabel.xOffset = x
			RangeLabel.yOffset = y
			RangeLabel:AnchorTo(unitframe:GetName(), pointOnAnchor, pointOnSelf, x, y) -- anchor sequence correct?
		end
		--RangeLabel:ProcessAnchors() --necessary? doesn´t seem so
		
		local font = SquaredConfigurator.fonts[Squared.GetSetting("Range-Label-Font"..sphere)]
		if RangeLabel.font ~= font then
			RangeLabel.font = font
			RangeLabel:Font(font)
		end
		
		local red, green, blue = unpack(Squared.GetSetting("colorgroup-Range-Color"..sphere))
		local r,g,b = RangeLabel:Color()
		if red ~= r or green ~= g or blue ~= b then
			RangeLabel:Color(red, green, blue)
		end
	
		RangeLabel:SetText(distance)
	end
end

local lastIsInLOS
function Addon.OnFriendlyTargetLOSUpdated(_, name, los)
	UnitCache[name] = UnitCache[name] or Squared.GetUnitByName(name)
	--local unitFrame = Squared.GetUnit(playerGroupIndex, memberIndex)
	if not UnitCache[name] then return end
	local unitframe = UnitCache[name]
	-- Don't try to update inactive frames.
	if unitframe.inactive then return end

	if los and false == lastIsInLOS then	-- changed to LOS
		lastIsInLOS = true
		Squared.SetSetting("targetbordercolor", targetbordercolorcache)
	elseif false == los and true == lastIsInLOS then	-- changed to OOS
		lastIsInLOS = false
		Squared.SetSetting("targetbordercolor", targetbordercolorOOS)
	elseif nil == lastIsInLOS then	-- first run
		lastIsInLOS = los
		if false == lastIsInLOS then
			Squared.SetSetting("targetbordercolor", targetbordercolorOOS)
		end
	else	-- unaltered LOS, should actually not have been a broadcasted event...i suppose...
		return
	end

	unitframe:Update()
end

--
-- Squared Callbacks
--

function Addon.ChangeModeHandler(newMode)
	if newMode ~= currentMode then
		--DEBUG(L"ChangeModeHandler: new Mode: "..towstring(newMode))
		for rawname,_ in pairs(UnitCache) do
			--LibRange.StopMonitoringEntity(1, rawname)
			LibRange.UnregisterEventHandler("formation", Addon.OnRangeUpdated, "RangeFadingSquared", rawname)
		end
		UnitCache = {}
		minAlpha = baseMinAlpha * Squared.GetSetting("alpha")
		maxAlpha = baseMaxAlpha * Squared.GetSetting("alpha")
		for k,v in pairs(Squared.groups) do
			for k2,v2 in pairs(v) do
				if Squared.groups[k][k2].RangeLabel then
					Squared.groups[k][k2].RangeLabel:Clear()
				end
			end
		end
		currentMode = newMode
	end
end

function Addon.AddUnitHandler(unitframe)
	
	if not unitframe.RangeLabel then
		local unitFrameName = unitframe:GetName()
		local w = LibGUI("Label", unitFrameName.."_LabelRange")
		--w:Parent(unitFrameName)
		w:Resize(60)		
		w:IgnoreInput()
		w:Layer("secondary")
		w:SetText(L"")
		
		-- part of the WindowGetAnchor avoidance
		--w.anchorWindow = unitFrameName -- unnecessary, is it
		w.xOffset = Squared.GetSetting("Range-Label-X1")
		w.yOffset = Squared.GetSetting("Range-Label-Y1")
		w.font = SquaredConfigurator.fonts[Squared.GetSetting("Range-Label-Font1")]
		w:Font(w.font)
		local position = Squared.GetSetting("Range-Label-Position1") -- default to near
		if position == 1 then
			w:AnchorTo(unitFrameName, "center", "center", 0, 0)
			w:Align("center")
			w.pointOnAnchor = "center"
			w.pointOnSelf = "center"
		elseif position == 2 then
			w:AnchorTo(unitFrameName, "topright", "topright", 0, 0)
			w:Align("right")
			w.pointOnAnchor = "topright"
			w.pointOnSelf = "topright"
		elseif position == 3 then
			w:AnchorTo(unitFrameName, "bottomright", "bottomright", 0, 0)
			w:Align("right")
			w.pointOnAnchor = "bottomright"
			w.pointOnSelf = "bottomright"
		elseif position == 4 then
			--w:Hide()
			w:AnchorTo(unitFrameName, "topright", "topright", 0, 0)
			w:Align("right")
			w.pointOnAnchor = "topright"
			w.pointOnSelf = "topright"
		end
		unitframe.RangeLabel = w
	end
end

-- will always be followed by SetName and then LayoutGroups, therefore let´s collect follow this
local formationMemberNames = {}
-- Squared Group Update Step 1
function Addon.ClearGroupHandler(groups)
	formationMemberNames = {}
end

-- Squared Group Update Step 2
function Addon.SetNameHandler(unit)
    
	if unit.name == GetPlayersName() then
		unit.fadealpha = Squared.GetSetting("alpha")
		unit:UpdateFade()
		if unit.RangeLabel then unit.RangeLabel:Clear() end	-- alt: Hide(), Destroy()
	else
		local rawname = unit.rawname
		formationMemberNames[rawname] = true
		UnitCache[rawname] = unit
		LibRange.RegisterEventHandler("formation", Addon.OnRangeUpdated, "RangeFadingSquared", rawname)
	end
end

-- Squared Group Update Step 3
function Addon.LayoutGroupsHandler(groups) --Addon.ClearGroupHandler()
	for _,v in pairs(groups) do
        for _,v2 in pairs(v) do
            if v2.inactive then
                v2.RangeLabel:Clear()
            end
        end
    end
	for rawname,_ in pairs(UnitCache) do		
		if not formationMemberNames[rawname] then
			LibRange.UnregisterEventHandler("formation", Addon.OnRangeUpdated, "RangeFadingSquared", rawname)
			UnitCache[rawname] = nil
		end
	end
	if currentMode == "testmode" then
		Addon.TestMode()
	end

    --doFade = Squared.GetSetting("rangefading")
    --baseMinAlpha = Squared.GetSetting("rangefading-min") or 0.2
    --baseMaxAlpha = Squared.GetSetting("rangefading-max") or 1.0
    --noAutoUnfade = Squared.GetSetting("rangefading-noautounfade") or false
    --updateFreq = tonumber(Squared.GetSetting("rangefading-freq")) or 0
    --buffUpdateFreq = updateFreq + 0.3
end



--
-- Standard Events
--
function Addon.ResetToDefaults()
	-- Alpha
	Squared.SetSetting("Range-Fading-Enabled1", true)
	Squared.SetSetting("Range-Fading-Enabled2", true)
	Squared.SetSetting("Range-Fading-Enabled3", true)
	
	Squared.SetSetting("Range-Alpha1", 0.875)
	Squared.SetSetting("Range-Alpha2", 0.75)
	Squared.SetSetting("Range-Alpha3", 0.4)
	
	-- Label
	Squared.SetSetting("Range-Label-Position1", 4) -- not shown
	Squared.SetSetting("Range-Label-Position2", 4) -- not shown
	Squared.SetSetting("Range-Label-Position3", 4) -- not shown
	Squared.SetSetting("Range-Label-Position4", 4) -- not shown
	Squared.SetSetting("Range-Label-Position5", 4) -- not shown
	
	Squared.SetSetting("Range-Label-X1", 0)
	Squared.SetSetting("Range-Label-X2", 0)
	Squared.SetSetting("Range-Label-X3", 0)
	Squared.SetSetting("Range-Label-X4", 0)
	Squared.SetSetting("Range-Label-X5", 0)
	
	Squared.SetSetting("Range-Label-Y1", 0)
	Squared.SetSetting("Range-Label-Y2", 0)
	Squared.SetSetting("Range-Label-Y3", 0)
	Squared.SetSetting("Range-Label-Y4", 0)
	Squared.SetSetting("Range-Label-Y5", 0)
	
	Squared.SetSetting("Range-Label-Font1", 1)	-- tiny
	Squared.SetSetting("Range-Label-Font2", 1)
	Squared.SetSetting("Range-Label-Font3", 1)
	Squared.SetSetting("Range-Label-Font4", 1)
	Squared.SetSetting("Range-Label-Font5", 1)
	
	Squared.SetSetting("colorgroup-Range-Color1", {220,220,220}) -- __LIGHTGREY
	Squared.SetSetting("colorgroup-Range-Color2", {220,220,0})	-- __YELLOW
	Squared.SetSetting("colorgroup-Range-Color3", {220,0,0}) -- __RED_SAT
	Squared.SetSetting("colorgroup-Range-Color4", {100,0,0}) -- __RED_DARK
	Squared.SetSetting("colorgroup-Range-Color5", {50,0,0}) -- very Dark Red

	-- Sphere
	Squared.SetSetting("Range1", 30)
	Squared.SetSetting("Range2", 100)
	Squared.SetSetting("Range3", 150)
	Squared.SetSetting("Range4", 300)
	
end

function Addon.Initialize()
	-- update Squared settings
	--Addon.ResetToDefaults()

	-- Alpha
	Squared.SetSetting("Range-Fading-Enabled1",Squared.GetSetting("Range-Fading-Enabled1") or true)
	Squared.SetSetting("Range-Fading-Enabled2",Squared.GetSetting("Range-Fading-Enabled2") or true)
	Squared.SetSetting("Range-Fading-Enabled3",Squared.GetSetting("Range-Fading-Enabled3") or true)
	Squared.SetSetting("Range-Fading-Enabled4",Squared.GetSetting("Range-Fading-Enabled4") or true)
	Squared.SetSetting("Range-Fading-Enabled5",Squared.GetSetting("Range-Fading-Enabled5") or true)
	
	-- min and max alpha will do 1 and 5
	Squared.SetSetting("Range-Alpha1",Squared.GetSetting("Range-Alpha1") or 0.875)
	Squared.SetSetting("Range-Alpha2",Squared.GetSetting("Range-Alpha2") or 0.75)
	Squared.SetSetting("Range-Alpha3",Squared.GetSetting("Range-Alpha3") or 0.4)

	-- Label
	Squared.SetSetting("Range-Label-Position1",Squared.GetSetting("Range-Label-Position1") or 4) -- not shown
	Squared.SetSetting("Range-Label-Position2",Squared.GetSetting("Range-Label-Position2") or 4) -- not shown
	Squared.SetSetting("Range-Label-Position3",Squared.GetSetting("Range-Label-Position3") or 4) -- not shown
	Squared.SetSetting("Range-Label-Position4",Squared.GetSetting("Range-Label-Position4") or 4) -- not shown
	Squared.SetSetting("Range-Label-Position5",Squared.GetSetting("Range-Label-Position5") or 4) -- not shown

	Squared.SetSetting("Range-Label-X1", Squared.GetSetting("Range-Label-X1") or 0)
	Squared.SetSetting("Range-Label-X2", Squared.GetSetting("Range-Label-X2") or 0)
	Squared.SetSetting("Range-Label-X3", Squared.GetSetting("Range-Label-X3") or 0)
	Squared.SetSetting("Range-Label-X4", Squared.GetSetting("Range-Label-X4") or 0)
	Squared.SetSetting("Range-Label-X5", Squared.GetSetting("Range-Label-X5") or 0)
	
	Squared.SetSetting("Range-Label-Y1", Squared.GetSetting("Range-Label-Y1") or 0)
	Squared.SetSetting("Range-Label-Y2", Squared.GetSetting("Range-Label-Y2") or 0)
	Squared.SetSetting("Range-Label-Y3", Squared.GetSetting("Range-Label-Y3") or 0)
	Squared.SetSetting("Range-Label-Y4", Squared.GetSetting("Range-Label-Y4") or 0)
	Squared.SetSetting("Range-Label-Y5", Squared.GetSetting("Range-Label-Y5") or 0)
	
	Squared.SetSetting("Range-Label-Font1", Squared.GetSetting("Range-Label-Font1") or 1)	-- tiny
	Squared.SetSetting("Range-Label-Font2", Squared.GetSetting("Range-Label-Font2") or 1)	-- tiny
	Squared.SetSetting("Range-Label-Font3", Squared.GetSetting("Range-Label-Font3") or 1)	-- tiny
	Squared.SetSetting("Range-Label-Font4", Squared.GetSetting("Range-Label-Font4") or 1)	-- tiny
	Squared.SetSetting("Range-Label-Font5", Squared.GetSetting("Range-Label-Font5") or 1)	-- tiny
	
	Squared.SetSetting("colorgroup-Range-Color1", Squared.GetSetting("colorgroup-Range-Color1") or {220,220,220}) -- __LIGHTGREY
	Squared.SetSetting("colorgroup-Range-Color2", Squared.GetSetting("colorgroup-Range-Color2") or {220,220,0})	-- __YELLOW
	Squared.SetSetting("colorgroup-Range-Color3", Squared.GetSetting("colorgroup-Range-Color3") or {220,0,0}) -- __RED_SAT
	Squared.SetSetting("colorgroup-Range-Color4", Squared.GetSetting("colorgroup-Range-Color4") or {100,0,0}) -- __RED_DARK
	Squared.SetSetting("colorgroup-Range-Color5", Squared.GetSetting("colorgroup-Range-Color5") or {50,0,0}) -- very Dark Red
	
	-- Sphere
	Squared.SetSetting("Range1",Squared.GetSetting("Range1") or 30)
	Squared.SetSetting("Range2",Squared.GetSetting("Range2") or 100)
	Squared.SetSetting("Range3",Squared.GetSetting("Range3") or 150)
	Squared.SetSetting("Range4",Squared.GetSetting("Range4") or 300)	

	
	Addon.CreateConfigPanel()
	Addon.Enable()

    DEBUG(L"RangeFadingSquared loaded into Squared.")
end

function Addon.Enable()
	--[[LibRange.RegisterEventHandler(1, "Party", Addon.OnRangeUpdated)
	LibRange.RegisterEventHandler(2, "Warband", Addon.OnRangeUpdated)
	LibRange.RegisterEventHandler(3, "OrderArmy", Addon.OnRangeUpdated)
	LibRange.RegisterEventHandler(4, "DestructionArmy", Addon.OnRangeUpdated)]]--
	--LibRange.RegisterEventHandler(1, "Formation", Addon.OnRangeUpdated)
	LibRange.RegisterEventHandler("selffriendlytargetLOS", Addon.OnFriendlyTargetLOSUpdated, "selffriendlytargetLOS")
	
	Squared.RegisterEventHandler("changemode", Addon.ChangeModeHandler)
	Squared.RegisterEventHandler("addunit", Addon.AddUnitHandler)
	Squared.RegisterEventHandler("cleargroups", Addon.ClearGroupHandler)
	Squared.RegisterEventHandler("setname", Addon.SetNameHandler)
	Squared.RegisterEventHandler("layoutgroups", Addon.LayoutGroupsHandler)
	
	targetbordercolorcache = deepcopy(Squared.GetSetting("targetbordercolor"))
	local test_r, test_g, test_b = unpack(targetbordercolorcache)
	if test_r == 255 and test_g == 0 and test_b == 0 then targetbordercolorcache = {255, 255, 255} end -- bad hack i know
	
	Squared.SetSetting("rangefading", false)
	--[[for _,p in ipairs(SquaredConfigurator.Panels) do
		if p.title == L"Misc. Options" then
			--SquaredConfigurator.Panels[active]:update(key, value)
		end
	end]]--
end

function Addon.Shutdown()
	Squared.SetSetting("targetbordercolor", targetbordercolorcache)
end

------------------------------------------------------------------------------------------------
-------- Config Panel Functions
------------------------------------------------------------------------------------------------

local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

local oRed,oGreen,oBlue
oRed,oGreen,oBlue = 255, 255, 255
local oFadingEnabled = true
local oAlpha = 0.9
local oRange = 0
local oLabelPos = 4
local oGroup = 1
local oLabelXOffset = 0
local oLabelYOffset = 0
local oLabelFont = 1

-- Our panel window
local W

panel.title = L"Range"

-- Create the panel
function CreatePanel(self)
	-- Do we somehow have a window still around? If so, we're done, that was easy.
	if W and W.name then return W end
	
	W = LibGUI("Blackframe")
	-- Let´s try this...
	W:RegisterEvent("OnUpdate")
	W.OnUpdate = Addon.UpdateConfigPanel
	W:Resize(500, 500)
	
	local e
	
	-- Title label
	e = W("Label")
	e:Resize(480)
	e:AnchorTo(W, "top", "top", 0, 10)
	e:Font("font_clear_medium_bold")
	e:SetText(L"RangeFadingSquared Options")
	W.Title = e
	
	-- Sphere select label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W.Title, "bottom", "top", 0, 20)
    e:SetText(L"Select a Sphere to edit:")
    W.LabelSelectSphere = e
    
    -- Sphere select combobox
    e = W("Combobox")
	e:Add("Sphere 1")
	e:Add("Sphere 2")
	e:Add("Sphere 3")
	e:Add("Sphere 4")
	e:Add("Sphere 5")	
    e:AnchorTo(W.LabelSelectSphere, "bottom", "top", 0, 10)
	e:Select(1)
    W.EditSelectSphere = e
	
	-- Range Fading

	-- Alpha 'enable' Checkbox
	e = W("Checkbox")
	e:AnchorTo(W.Title, "bottom", "topright", -5, 120)
	W.CheckAlphaEnabled = e
	
	e = W("Label")
	e:Resize(150)
	e:Align("rightcenter")
	e:AnchorTo(W.CheckAlphaEnabled, "left", "right", 0, 0)
	e:SetText("Alpha: Enabled:")
	W.LabelAlphaEnabled = e

	e = W("Label")
	e:Resize(60)
	e:Align("rightcenter")
	e:AnchorTo(W.CheckAlphaEnabled, "right", "left", 10, 0)
	e:SetText("Value:")
	W.LabelAlpha = e
	
	e = W("Textbox")
	e:Resize(80)
	e:AnchorTo(W.LabelAlpha, "right", "left", 10, 0)
	e:SetText(255)
	W.EditAlpha = e
	
	--
	-- Range Fading Label
	--
	
	e = W("Label")
	e:Resize(180)
	e:Align("rightcenter")
	e:AnchorTo(W.LabelAlphaEnabled, "bottomright", "topright", -30, 10)
	e:SetText("Range text Position:")
	W.LabelAlphaPosition = e	-- yeah...
	
	-- Label 'enable' Checkbox
	--[[e = W("Checkbox")
	e:AnchorTo(W.LabelLabelEnabled, "right", "left", 10, 0)
	W.CheckLabelEnabled = e]]--
	-- Label combobox
	e = W("Combobox")
	e:AnchorTo(W.LabelAlphaPosition, "right", "left", 20, 0)
	for _,pos in ipairs(SquaredConfigurator.textpositionNames) do e:Add(pos) end
	e:SelectIndex(4)
	W.LabelPosition = e
	
	e = W("Label")
	e:Resize(30)
	e:Font(Addon.FontText)
	e:AnchorTo(W.LabelPosition, "bottomleft", "topleft", 0, 10)
	e:SetText(L"X:")
	e:Align("left")
	W.LabelXOffset = e

	e = W("Textbox")
	e:Resize(60)
	e:AnchorTo(W.LabelXOffset, "right", "left", 0, -5)
	e:SetText(0)
	W.EditXOffset = e
	
	e = W("Label")
	e:Resize(30)
	e:AnchorTo(W.LabelXOffset, "right", "left", 80, 0)
	e:SetText(L"Y:")
	e:Align("left")
	W.LabelYOffset = e
	
	e = W("Textbox")
	e:Resize(60)
	e:AnchorTo(W.LabelYOffset, "right", "left", 0, -5)
	e:SetText(0)
	W.EditYOffset = e
	
	-- Label Font
	e = W("Label")
	e:Resize(60)
	e:Align("rightcenter")
	e:AnchorTo(W.LabelAlphaPosition, "bottomright", "topright", 0, 50)
	e:SetText("Font:")
	W.LabelFontLabel = e	-- no comment
	
	e = W("Combobox")
	e:AnchorTo(W.LabelFontLabel, "right", "left", 20, 0)
	for _,font in ipairs(SquaredConfigurator.fontNames) do e:Add(font) end
	e:SelectIndex(1)
	W.LabelFont = e
	
	-- Preview label
	e = W("Label")
	e:AnchorTo(W.LabelFontLabel, "bottomleft", "topleft", 0, 10)
	e:Resize(480)
	e:Font("font_clear_large_bold")
	e:Color(255, 255, 255)
	e:Align("left")
	e:SetText("COLOR PREVIEW")
	W.LabelPreview = e
	
	-- Range threshold to the next range
	e = W("Textbox")
	e:Resize(50)
	e:AnchorTo(W.LabelFont, "bottomleft", "topleft", 0, 40)
	e:SetText(100)
	W.EditRange = e
	
	e = W("Label")
	e:Resize(85)
	e:Align("left")
	e:AnchorTo(W.EditRange, "left", "right", 10, 5)
	e:Color(255, 150, 0)
	e:SetText("Border:")
	W.LabelRange = e

	--
	-- Finish line
	--
	
	-- Reminder note
	e = W("Label")
	e:Resize(480)
	e:AnchorTo(W, "bottom", "bottom", 0, -65)
	e:SetText("Don't forget to hit Apply!")
	W.LabelReminder = e
	
	-- Apply button
	e = W("Button")
	e:Resize(200)
	e:SetText(L"Apply")
	e:AnchorTo(W, "bottomleft", "bottomleft", 40, -20)
	e.OnLButtonUp = function() ApplyPanel() end
	W.ButtonApply = e
	
	-- Revert button
	e = W("Button")
	e:Resize(200)
	e:SetText(L"Revert")
	e:AnchorTo(W, "bottomright", "bottomright", -40, -20)
	e.OnLButtonUp = function() UpdatePanel() end
	W.ButtonRevert = e
	
	return W
end

function ApplyPanel()
	
	--Squared.SetSetting("Range"..oGroup, oRange)	
	if oGroup ~= 5 then
		local range = tonumber(W.EditRange:GetText())
		local orig_range = Squared.GetSetting("Range"..oGroup)
		_ = range and orig_range ~= range and Squared.SetSetting("Range"..oGroup, range)
		_ = range or W.EditRange:SetText(towstring(orig_range))
	end
	
	-- Alpha Check Box
	local fadingEnabled = W.CheckAlphaEnabled:GetValue()
    local orig_fadingEnabled = Squared.GetSetting("Range-Fading-Enabled"..oGroup)
    _ = orig_fadingEnabled ~= fadingEnabled and Squared.SetSetting("Range-Fading-Enabled"..oGroup, fadingEnabled)
	
	-- Alpha Text Box
	if oGroup ~= 1 and oGroup ~= 5 then
		local rangeAlpha = tonumber(W.EditAlpha:GetText())
		local orig_rangeAlpha = Squared.GetSetting("Range-Alpha"..oGroup-1)
		_ = rangeAlpha and orig_rangeAlpha ~= rangeAlpha and Squared.SetSetting("Range-Alpha"..oGroup-1, rangeAlpha)
		_ = rangeAlpha or W.EditAlpha:SetText(towstring(orig_rangeAlpha))
	end
	
	-- Label Position Combo Box
	local labelPos = W.LabelPosition:SelectedIndex()
    local orig_labelPos = Squared.GetSetting("Range-Label-Position"..oGroup)
    _ = labelPos and orig_labelPos ~= labelPos and Squared.SetSetting("Range-Label-Position"..oGroup, labelPos)
    _ = labelPos or W.LabelPosition:SelectIndex(orig_labelPos)

	-- Label X Offset Text Box
	local labelXOffset = tonumber(W.EditXOffset:GetText())
	local orig_labelXOffset = Squared.GetSetting("Range-Label-X"..oGroup)
	_ = labelXOffset and orig_labelXOffset ~= labelXOffset and Squared.SetSetting("Range-Label-X"..oGroup, labelXOffset)
	_ = labelXOffset or W.EditXOffset:SetText(towstring(orig_labelXOffset))
	
	-- Label Y Offset Text Box
	local labelYOffset = tonumber(W.EditYOffset:GetText())
	local orig_labelYOffset = Squared.GetSetting("Range-Label-Y"..oGroup)
	_ = labelYOffset and orig_labelYOffset ~= labelYOffset and Squared.SetSetting("Range-Label-Y"..oGroup, labelYOffset)
	_ = labelYOffset or W.EditYOffset:SetText(towstring(orig_labelYOffset))
	
	-- Label Font Combo Box
	local labelFont = W.LabelFont:SelectedIndex()
    local orig_labelFont = Squared.GetSetting("Range-Label-Font"..oGroup)
    _ = labelFont and orig_labelFont ~= labelFont and Squared.SetSetting("Range-Label-Font"..oGroup, labelFont)
    _ = labelFont or W.LabelFont:SelectIndex(orig_labelFont)
	
	--Squared.SetSetting("Range-Color"..oGroup, {oRed, oGreen, oBlue})
	--oGroup = 0
	return
end

function UpdatePanel(self, key, value)
	---DEBUG(L"UpdatePanel: oGroup: "..oGroup)
	-- Range
	_ = (not key or key == "Range"..oGroup) and
    W.EditRange:SetText(towstring(value or Squared.GetSetting("Range"..oGroup)))
		
	-- Alpha	
	_ = (not key or key == "Range-Fading-Enabled"..oGroup) and
    W.CheckAlphaEnabled:SetValue(value or value == nil and Squared.GetSetting("Range-Fading-Enabled"..oGroup))
	
	if oGroup == 1 then
		W.EditAlpha:Hide()
		W.LabelAlpha:Hide()
	else
		_ = (not key or key == "Range-Alpha"..oGroup-1) and
		W.EditAlpha:SetText(towstring(value or Squared.GetSetting("Range-Alpha"..oGroup-1)))
		if not W.EditAlpha:Showing() then
			W.EditAlpha:Show()
			W.LabelAlpha:Show()
		end
	end
	
	-- Labels
	_ = (not key or key == "Range-Label-Position"..oGroup) and
	W.LabelPosition:SelectIndex(value or Squared.GetSetting("Range-Label-Position"..oGroup))
	
	_ = (not key or key == "Range-Label-X"..oGroup) and
    W.EditXOffset:SetText(towstring(value or Squared.GetSetting("Range-Label-X"..oGroup)))	
	
	_ = (not key or key == "Range-Label-Y"..oGroup) and
    W.EditYOffset:SetText(towstring(value or Squared.GetSetting("Range-Label-Y"..oGroup)))
	
	_ = (not key or key == "Range-Label-Font"..oGroup) and
	W.LabelFont:SelectIndex(value or Squared.GetSetting("Range-Label-Font"..oGroup))	
	
	if (oGroup == 0) then return end
	
	-- rgb
	local rgb = Squared.GetSetting("colorgroup-Range-Color"..oGroup)
	oRed, oGreen, oBlue = unpack(rgb)
	W.LabelPreview:Color(oRed, oGreen, oBlue)
	
	return
end

function Addon.CreateConfigPanel()

	if panel.id then return end
	if not SquaredConfigurator then return end

	panel.title = L"Range"

	-- Actually add the panel
	panel.create = CreatePanel
	panel.update = UpdatePanel
	panel.id = SquaredConfigurator.AddPanel(panel)

end

function Addon.UpdateConfigPanel()

	if (not W) or (not SquaredConfigurator.ActivePanel == panel.id) then return end
	-- workarounds stuff for mythics eventhandler waffleing
	cGroup = W.EditSelectSphere:SelectedIndex()
	if (cGroup ~= oGroup) then
		--DEBUG(L"cGroup: "..towstring(cGroup)..L"; oGroup: "..towstring(oGroup))
		-- Sphere 1: none, Sphere 2-4: Range 1-3; Sphere 5: none
		if cGroup == 1 or cGroup == 5 then
			W.EditAlpha:Hide()
			W.LabelAlpha:Hide()
		elseif oGroup == 1 or oGroup == 5 then
			W.EditAlpha:Show()
			W.LabelAlpha:Show()
			oAlpha = Squared.GetSetting("Range-Alpha"..cGroup-1)
			W.EditAlpha:SetText(towstring(oAlpha))
		else
			oAlpha = Squared.GetSetting("Range-Alpha"..cGroup-1)
			W.EditAlpha:SetText(towstring(oAlpha))
		end
		-- Range: Border 1-4; 5 none
		if cGroup == 5 then
			W.EditRange:Hide()
			W.LabelRange:Hide()
		elseif oGroup == 5 then
			W.EditRange:Show()
			W.LabelRange:Show()
			oRange = Squared.GetSetting("Range"..cGroup)
			W.EditRange:SetText(towstring(oRange))
		else				
			oRange = Squared.GetSetting("Range"..cGroup)
			W.EditRange:SetText(towstring(oRange))
		end
		
		-- Discard the previous selection, not needed anymore
		oGroup = cGroup
		
		-- Alpha
		oFadingEnabled = Squared.GetSetting("Range-Fading-Enabled"..oGroup)
		--d(L"UpdateConfigPanel: CheckAlphaEnabled:", oFadingEnabled)
		W.CheckAlphaEnabled:SetValue(oFadingEnabled)
		
		-- Labels
		oLabelPos = Squared.GetSetting("Range-Label-Position"..oGroup)
		--DEBUG(L"oLabelPos :"..towstring(oLabelPos))
		W.LabelPosition:SelectIndex(oLabelPos)--(SquaredConfigurator.textpositions[oLabelPos])
		
		oLabelXOffset = Squared.GetSetting("Range-Label-X"..oGroup)
		W.EditXOffset:SetText(towstring(oLabelXOffset))
		
		oLabelYOffset = Squared.GetSetting("Range-Label-Y"..oGroup)
		W.EditYOffset:SetText(towstring(oLabelYOffset))
		
		oLabelFont = Squared.GetSetting("Range-Label-Font"..oGroup)
		W.LabelFont:SelectIndex(oLabelFont)	
		
		local rgb = Squared.GetSetting("colorgroup-Range-Color"..oGroup)
		oRed, oGreen, oBlue = unpack(rgb)
		W.LabelPreview:Color(oRed, oGreen, oBlue)
	end
	
	oLabelPos = W.LabelPosition:SelectedIndex()
	
	W.LabelPreview:Color(oRed, oGreen, oBlue)
end

function Addon.TestMode()
	for i= 1,6 do
		for j=1,6 do
			Addon.OnRangeUpdated(nil, L"Unit"..i..j, math.random(1,400))
		end
	end
end
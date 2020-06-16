SquaredUnitFrame = Frame:Subclass("SquaredUnitFrame")

-- Make Squared table ref local for performance
local Squared = Squared

-- Make utility functions local for performance
local pairs = pairs
local unpack = unpack
local tonumber = tonumber
local towstring = towstring
local max = math.max
local min = math.min
local LabelSetText = LabelSetText
local LabelSetTextColor = LabelSetTextColor
local WindowAddAnchor = WindowAddAnchor
local WindowClearAnchors = WindowClearAnchors
local WindowGetScale = WindowGetScale
local WindowGetShowing = WindowGetShowing
local WindowSetAlpha = WindowSetAlpha
local WindowSetDimensions = WindowSetDimensions
local WindowSetShowing = WindowSetShowing
local WindowSetTintColor = WindowSetTintColor
local WindowSetScale = WindowSetScale
local wstring_sub = wstring.sub
local wstring_format = wstring.format

-- Locally replace the window-sizing functions to account for interface scale and make things work well pixel-wise
local StandardWSD = WindowSetDimensions
local StandardWAA = WindowAddAnchor

local function WindowSetDimensions(windowName, width, height)
    local scale = InterfaceCore.GetScale()
    local width = width / scale
    local height = height / scale
    StandardWSD(windowName, width, height)
end

local function WindowAddAnchor(windowName, point, relativeTo, relativePoint, x, y)
    local scale = InterfaceCore.GetScale()
    local x = x / scale
    local y = y / scale
    StandardWAA(windowName, point, relativeTo, relativePoint, x, y)
end


local LSA = LibStub("LibSharedAssets")
local textures = {}
local dims = {}
if LSA then
	textures = LSA:GetTextureList()
	for _,tex in ipairs(textures) do
		local metadata = LSA:GetMetadata(tex)
		if metadata and metadata.size then
			if metadata.tiled then
				dims[tex] = false
			else
				dims[tex] = metadata.size
			end
		else
			-- assume a tiled texture if size not specified
			dims[tex] = false
		end
	end
end

-- Lookup table for career setting names
local careerArchSettings = {
   [GameData.CareerLine.IRON_BREAKER] = "colortype-ironbreaker",
   [GameData.CareerLine.SWORDMASTER] = "colortype-swordmaster",
   [GameData.CareerLine.CHOSEN] = "colortype-chosen",
   [GameData.CareerLine.BLACK_ORC] = "colortype-blackorc",
   [GameData.CareerLine.WITCH_HUNTER] = "colortype-witchhunter",
   [GameData.CareerLine.WHITE_LION] = "colortype-whitelion",
   [GameData.CareerLine.MARAUDER] = "colortype-marauder",
   [GameData.CareerLine.WITCH_ELF] = "colortype-witchelf",
   [GameData.CareerLine.BRIGHT_WIZARD] = "colortype-brightwizard",
   [GameData.CareerLine.MAGUS] = "colortype-magus",
   [GameData.CareerLine.SORCERER] = "colortype-sorcerer",
   [GameData.CareerLine.ENGINEER] = "colortype-engineer",
   [GameData.CareerLine.SHADOW_WARRIOR] = "colortype-shadowwarrior",
   [GameData.CareerLine.SQUIG_HERDER] = "colortype-squigherder",
   [GameData.CareerLine.WARRIOR_PRIEST] = "colortype-warriorpriest",
   [GameData.CareerLine.DISCIPLE] = "colortype-discipleofkhaine",
   [GameData.CareerLine.ARCHMAGE] = "colortype-archmage",
   [GameData.CareerLine.SHAMAN] = "colortype-shaman",
   [GameData.CareerLine.RUNE_PRIEST] = "colortype-runepriest",
   [GameData.CareerLine.ZEALOT] = "colortype-zealot",
   [GameData.CareerLine.KNIGHT] = "colortype-kotbs",
   [GameData.CareerLine.BLACKGUARD] = "colortype-blackguard",
   [GameData.CareerLine.CHOPPA] = "colortype-choppa",
   [GameData.CareerLine.SLAYER or GameData.CareerLine.HAMMERER] = "colortype-slayer",
}

local indicatorName = {}
indicatorName["topleft"] = "TopLeft"
indicatorName["bottomleft"] = "BotLeft"
indicatorName["topright"] = "TopRight"
indicatorName["bottomright"] = "BotRight"

function SquaredUnitFrame:Create(group, member)
    -- Create this frame's window
    local window
    if not DoesWindowExist("SquaredUnit_"..group.."_"..member) then
        window = self:CreateFromTemplate("SquaredUnit_"..group.."_"..member)
        
        -- Our default texture is squared_tint, so initialize the variables that we'll use to minimize texture changes
        if window then
            window.activeBorderTexture = "squared_tint"
            window.activeBackTexture = "squared_tint"
            window.activeForeTexture = "squared_tint"
            window.activeDcTexture = "squared_tint"
        end
    else
        window = GetFrame("SquaredUnit_"..group.."_"..member)
    end
    
    if not window then return nil end
    
    local wName = window:GetName()
    
    -- a newly created unitframe should not be inactive
    window.inactive = false
    -- a newly created unitframe is not yet anchored
    window.anchoredTo = nil
    
    -- initialize member variables
    window.group = group
    window.member = member
    window.name = L""
    window.rawname = L""
    window.career = 0
    window.careername = L""
    window.level = 0
    
    window.online = true
	window.region = true
    window.distant = false
    
    window.showicon = Squared.GetSetting("showicon")
    
    window.alwaysdraw = Squared.GetSetting("always-draw")
    WindowSetDrawWhenInterfaceHidden(wName, window.alwaysdraw)
    
    window.text = L""
    window.toptext = L""
    window.bottext = L""
    
    window.bordertexture = Squared.GetSetting("texture-border") or "squared_tint"
    window.bgtexture = Squared.GetSetting("texture-background") or "squared_tint"
    window.fgtexture = Squared.GetSetting("texture-foreground") or "squared_tint"
    window.dctexture = Squared.GetSetting("texture-offline") or "squared_tint"
    
    window.textcolor = Squared.GetSetting("textcolor") or {255, 255, 255}
    window.toptextcolor = Squared.GetSetting("textcolor-top") or {255, 255, 255}
    window.bottextcolor = Squared.GetSetting("textcolor-bottom") or {255, 255, 255}
    
    LabelSetText(wName.."Text", L"")
    LabelSetFont(wName.."Text", Squared.GetSetting("text-font-center"), 22)
    LabelSetTextAlign(wName.."Text", Squared.GetSetting("text-align-center"))
    
    LabelSetText(wName.."TopText", L"")
    LabelSetFont(wName.."TopText", Squared.GetSetting("text-font-top"), 22)
    LabelSetTextAlign(wName.."TopText", Squared.GetSetting("text-align-top"))
    
    LabelSetText(wName.."BottomText", L"")
    LabelSetFont(wName.."BottomText", Squared.GetSetting("text-font-bottom"), 22)
    LabelSetTextAlign(wName.."BottomText", Squared.GetSetting("text-align-bottom"))
    
    window.maxval = 100
    window.curval = 100
    window.ap = 100
    
    window.zone = 0
    
    window:SetGroupText(group)
    
    window.fgcolor = Squared.GetSetting("fgcolor") or {0, 150, 0}
    window.bgcolor = Squared.GetSetting("bgcolor") or {0, 0, 0}
    window.bordercolor = Squared.GetSetting("bordercolor") or {128, 128, 128}
    
    window.isMyTarget = false
    window.isMyGroup = false
    window.isGroupLeader = false
    window.isMainAssist = false
    
    window.boxheight = Squared.GetSetting("boxheight") or 68
    window.boxwidth = Squared.GetSetting("boxwidth") or 68
    
    local border = (Squared.GetSetting("bordersize") or 4)
    
    window.fillwidth = max(window.boxwidth - (2*border), 1)
    window.fillheight = max(window.boxheight - (2*border), 1)
    
    WindowClearAnchors(wName.."BackFill")
    WindowAddAnchor(wName.."BackFill", "topleft", wName, "topleft", border, border)
    WindowAddAnchor(wName.."BackFill", "bottomright", wName, "bottomright", -1*border, -1*border)
    
    local iconAnchor = Squared.GetSetting("icon-position")
    local iconX = Squared.GetSetting("icon-offset-x") or 0
    local iconY = Squared.GetSetting("icon-offset-y") or 0
    WindowClearAnchors(wName.."Icon")
    WindowAddAnchor(wName.."Icon", iconAnchor, wName, iconAnchor, iconX, iconY)
    
    window.filldir = Squared.GetSetting("direction-fill") or "up"
    
    -- properly anchor the fill depending on this setting (default anchors are for "up")
    if window.filldir == "down" then
        WindowClearAnchors(wName.."ForeFill")
        WindowAddAnchor(wName.."ForeFill", "topleft", wName, "topleft", border, border)
        WindowAddAnchor(wName.."ForeFill", "topright", wName, "topright", -1*border, border)
    elseif window.filldir == "right" then
        WindowClearAnchors(wName.."ForeFill")
        WindowAddAnchor(wName.."ForeFill", "topleft", wName, "topleft", border, border)
        WindowAddAnchor(wName.."ForeFill", "bottomleft", wName, "bottomleft", border, -1*border)
    elseif window.filldir == "left" then
        WindowClearAnchors(wName.."ForeFill")
        WindowAddAnchor(wName.."ForeFill", "bottomright", wName, "bottomright", -1*border, -1*border)
        WindowAddAnchor(wName.."ForeFill", "topright", wName, "topright", -1*border, border)
    else
        WindowClearAnchors(wName.."ForeFill")
        WindowAddAnchor(wName.."ForeFill", "bottomright", wName, "bottomright", -1*border, -1*border)
        WindowAddAnchor(wName.."ForeFill", "bottomleft", wName, "bottomleft", border, -1*border)
    end
    
    window.alpha = Squared.GetSetting("alpha") or 1.0
    
    local iconScale = scale or Squared.GetSetting("icon-scale") or 0
    local iconAlpha = Squared.GetSetting("icon-alpha") or 0.5
    WindowSetAlpha(wName.."Icon", (window.fadealpha or window.alpha or 1.0)*iconAlpha)
    if iconScale > 0 then
        WindowSetScale(wName.."Icon", WindowGetScale(wName)*iconScale)
    else
        local smartScale = (min(window.fillwidth, window.fillheight) / 50) * 1.5
        WindowSetScale(wName.."Icon", WindowGetScale(wName)*smartScale)
    end
    
    window.indicators = {
        ["topleft"] = { ["showing"] = false, ["color"] = {255, 255, 255}, ["size"] = Squared.GetSetting("status-size") or 10 },
        ["bottomleft"] = { ["showing"] = false, ["color"] = {255, 255, 255}, ["size"] = Squared.GetSetting("status-size") or 10 },
        ["topright"] = { ["showing"] = false, ["color"] = {255, 255, 255}, ["size"] = Squared.GetSetting("status-size") or 10 },
        ["bottomright"] = { ["showing"] = false, ["color"] = {255, 255, 255}, ["size"] = Squared.GetSetting("status-size") or 10 },
    }
    
    return window
end

function SquaredUnitFrame:Destroy()
    self:Show(false)
    self.name = L""
    self.text = L""
    self.group = nil
    self.member = nil
end

function SquaredUnitFrame:Deactivate()
    self.inactive = true
end

function SquaredUnitFrame:Activate(show)
    self.inactive = false
    self:Show(show)
    return self
end

function SquaredUnitFrame:Show(visible)
    
    if WindowGetShowing("SquaredAnchor") then
        if visible ~= nil then
            -- Tell our parent to show first
            self:ParentShow(visible)
            -- Then make our own frame show
            WindowSetShowing(self:GetName(), visible)
        else
            self:ParentShow(true)
            WindowSetShowing(self:GetName(), true)
        end
    else
        WindowSetShowing(self:GetName(), false)
    end
end

function SquaredUnitFrame:ClearAnchors()
    WindowClearAnchors(self:GetName())
end

function SquaredUnitFrame:AddAnchor(point, relWindow, relPoint, x, y)
    WindowAddAnchor(self:GetName(), point, relWindow, relPoint, x, y)
end

function SquaredUnitFrame:SetCareerName(val)
    self.careername = val
end

function SquaredUnitFrame:SetZone(val)
    self.zone = val
end

function SquaredUnitFrame:SetDistant(val)
    self.distant = val
end

function SquaredUnitFrame:SetVal(val)
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    self.tempval = nil
    
    local wName = self:GetName()
    -- sanity check
    if val > 0 and val <= self.maxval then
        self.curval = val
        if not Squared.GetSetting("deplete-off") then
            if self.filldir == "left" or self.filldir == "right" then
                local fillVal = (self.curval / self.maxval) * self.fillwidth
                WindowSetDimensions(wName.."ForeFill", fillVal, self.fillheight)
            else
                local fillVal = (self.curval / self.maxval) * self.fillheight
                WindowSetDimensions(wName.."ForeFill", self.fillwidth, fillVal)
            end
        else
            WindowSetDimensions(wName.."ForeFill", self.fillwidth, self.fillheight)
        end
        WindowSetShowing(wName.."ForeFill", true)
        if not Squared.GetSetting("invert-bars") then
            WindowSetTintColor(wName.."BackFill", unpack(self.bgcolor))
        else
            WindowSetTintColor(wName.."BackFill", unpack(self.fgcolor))
        end
    elseif val == 0 then
        self.curval = 0
        WindowSetShowing(wName.."ForeFill", false)
        WindowSetTintColor(wName.."BackFill", unpack(Squared.GetSetting("colorgroup-hpdead")))
    elseif val > self.maxval then
        -- Handle stupid out-of-order event firings
        self.tempval = val
    end
    if Squared.GetSetting("color-hpnames") then self:SetHealthNameColor() end
    if Squared.GetSetting("color-hpbars") then self:SetHealthFillColor() end
    if Squared.GetSetting("color-hpborders") and not self.isMyTarget then self:SetHealthBorderColor() end
    
    local hpPos = Squared.GetSetting("text-position-hp")
    if hpPos ~= "none" then
        if self.online == false then
            self:SetText(L"D/C", hpPos)
		--elseif self.region == false then
		--	self:SetText(L"FAR", hpPos)
        elseif val == 0 then
            self:SetText(L"DEAD", hpPos)
        else
            self:SetText(wstring_format(L"%d", self.curval / self.maxval * 100), hpPos)
        end
    end
end

function SquaredUnitFrame:SetMaxVal(val)
    if val > 0 then
        self.maxval = val
        -- cap our cur val at the new max val
        if self.tempval then
            -- handle out of order events
            self:SetVal(min(self.tempval, self.maxval))
            self.tempval = nil
        else
            self:SetVal(min(self.curval, self.maxval))
        end
    end
end

function SquaredUnitFrame:SetAP(val)
    self.ap = val
    local apPos = Squared.GetSetting("text-position-ap")
    if apPos ~= "none" then
        self:SetText(wstring_format(L"%d", val), apPos)
    end
end

function SquaredUnitFrame:SetInRegion(val)
	self.region = val and true or false
end

function SquaredUnitFrame:SetHealthNameColor()
    local hpPercent = self.curval / self.maxval * 100
    local namePos = Squared.GetSetting("text-position-name")
    
    if hpPercent <= Squared.GetSetting("hp-low") then
        self:SetTextColor(namePos, unpack(Squared.GetSetting("colorgroup-hplow")))
    elseif hpPercent <= Squared.GetSetting("hp-medium") then
        self:SetTextColor(namePos, unpack(Squared.GetSetting("colorgroup-hpmedium")))
    elseif hpPercent <= Squared.GetSetting("hp-high") then
        self:SetTextColor(namePos, unpack(Squared.GetSetting("colorgroup-hphigh")))
    else
        self:SetTextColor(namePos, unpack(Squared.GetSetting("textcolor")))
    end
end

function SquaredUnitFrame:SetGroupText(group)
    local groupPos = Squared.GetSetting("text-position-group")
    if groupPos and groupPos ~= "none" then
        self:SetText(towstring(group), groupPos)
    end
end

function SquaredUnitFrame:SetHealthFillColor()
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    local hpPercent = self.curval / self.maxval * 100
    if not Squared.GetSetting("invert-bars") then
        -- If bars are normal, then update the foreground
        if hpPercent <= Squared.GetSetting("hp-low") then
            WindowSetTintColor(self:GetName().."ForeFill", unpack(Squared.GetSetting("colorgroup-hplow")))
        elseif hpPercent <= Squared.GetSetting("hp-medium") then
            WindowSetTintColor(self:GetName().."ForeFill", unpack(Squared.GetSetting("colorgroup-hpmedium")))
        elseif hpPercent <= Squared.GetSetting("hp-high") then
            WindowSetTintColor(self:GetName().."ForeFill", unpack(Squared.GetSetting("colorgroup-hphigh")))
        else
            WindowSetTintColor(self:GetName().."ForeFill", unpack(self.fgcolor))
        end
    else
        -- If bars are inverted, update the background
        if hpPercent <= Squared.GetSetting("hp-low") then
            WindowSetTintColor(self:GetName().."BackFill", unpack(Squared.GetSetting("colorgroup-hplow")))
        elseif hpPercent <= Squared.GetSetting("hp-medium") then
            WindowSetTintColor(self:GetName().."BackFill", unpack(Squared.GetSetting("colorgroup-hpmedium")))
        elseif hpPercent <= Squared.GetSetting("hp-high") then
            WindowSetTintColor(self:GetName().."BackFill", unpack(Squared.GetSetting("colorgroup-hphigh")))
        else
            WindowSetTintColor(self:GetName().."BackFill", unpack(self.fgcolor))
        end
    end
end

function SquaredUnitFrame:SetHealthBorderColor()
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    local hpPercent = self.curval / self.maxval * 100
    if hpPercent <= Squared.GetSetting("hp-low") then
        WindowSetTintColor(self:GetName().."Background", unpack(Squared.GetSetting("colorgroup-hplow")))
    elseif hpPercent <= Squared.GetSetting("hp-medium") then
        WindowSetTintColor(self:GetName().."Background", unpack(Squared.GetSetting("colorgroup-hpmedium")))
    elseif hpPercent <= Squared.GetSetting("hp-high") then
        WindowSetTintColor(self:GetName().."Background", unpack(Squared.GetSetting("colorgroup-hphigh")))
    else
        WindowSetTintColor(self:GetName().."Background", unpack(self.bordercolor))
    end
end

function SquaredUnitFrame:SetBorderColor(triplet)
    self.bordercolor = triplet
end

function SquaredUnitFrame:SetMyTargetFlag(val)
    self.isMyTarget = val
end

function SquaredUnitFrame:SetMyGroupFlag(val)
    self.isMyGroup = val
end

function SquaredUnitFrame:SetLeaderFlag(val)
    self.isGroupLeader = val
end

function SquaredUnitFrame:SetMainAssistFlag(val)
    self.isMainAssist = val
end

function SquaredUnitFrame:SetText(val, position)
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    if type(val) == "string" then val = towstring(val) end
    if type(val) == "wstring" then
        if position == "top" then
            if self.toptext ~= L"" then
                self.toptext = val..L" "..self.toptext
            else
                self.toptext = val
            end
            LabelSetText(self:GetName().."TopText", self.toptext)
        elseif position == "bottom" then
            if self.bottext ~= L"" then
                self.bottext = val..L" "..self.bottext
            else
                self.bottext = val
            end
            LabelSetText(self:GetName().."BottomText", self.bottext)
        elseif position ~= "none" then
            if self.text ~= L"" then
                self.text = val..L" "..self.text
            else
                self.text = val
            end
            LabelSetText(self:GetName().."Text", self.text)
        end
    end
end

function SquaredUnitFrame:UpdateText()
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    self.text = L""
    self.toptext = L""
    self.bottext = L""
    
	local namePos = Squared.GetSetting("text-position-name")
    if namePos ~= "none" then
        local shortName = wstring_sub(self.name, 1, Squared.GetSetting("namelength") or 5)
        self:SetText(shortName, namePos)
    end
	
	local careerPos = Squared.GetSetting("text-position-career")
	if careerPos ~= "none" and CareerNames[self.career] and CareerNames[self.career].name then
		self:SetText(CareerNames[self.career].name, careerPos)
	end
	
    local hpPos = Squared.GetSetting("text-position-hp")
    if hpPos ~= "none" then
        if self.online == false then
            self:SetText(L"D/C", hpPos)
		--elseif self.region == false then
		--	self:SetText(L"FAR", hpPos)
        elseif self.curval == 0 then
            self:SetText(L"DEAD", hpPos)
        else
            self:SetText(wstring_format(L"%d", self.curval / self.maxval * 100), hpPos)
        end
    end
    
    self:SetGroupText(self.group)
    
    self:SetAP(self.ap)
    
    self:SetLevel(self.level)
    
end

function SquaredUnitFrame:SetTextColor(position, red, green, blue)
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    if position == "top" then
        LabelSetTextColor(self:GetName().."TopText", red, green, blue)
        self.toptextcolor = {red, green, blue}
    elseif position == "bottom" then
        LabelSetTextColor(self:GetName().."BottomText", red, green, blue)
        self.bottextcolor = {red, green, blue}
    else
        LabelSetTextColor(self:GetName().."Text", red, green, blue)
        self.textcolor = {red, green, blue}
    end
end

function SquaredUnitFrame:SetLevel(val)
    val = tonumber(val)
    if not val then return end
    self.level = tonumber(val)
    local levelPos = Squared.GetSetting("text-position-level")
    if levelPos ~= "none" then
        self:SetText(towstring(val), levelPos)
    end
end

function SquaredUnitFrame:SetOnline(val)
    self.online = val and true or false
end

function SquaredUnitFrame:SetName(val)
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    self.name = val:match(L"([^^]+)^?([^^]*)")
    self.rawname = val
    if Squared.targetName then
        if (Squared.targetName):match(L"([^^]+)^?([^^]*)") == (self.name):match(L"([^^]+)^?([^^]*)") then
            self.isMyTarget = true
        end
    end
    if Squared.GetSetting("rangefading") then
        self.fadealpha = SquaredRangeFading.GetRangeAlpha(self.name)
    end
    
    local namePos = Squared.GetSetting("text-position-name")
    if namePos ~= "none" then
        local shortName = wstring_sub(self.name, 1, Squared.GetSetting("namelength") or 5)
        self:SetText(shortName, namePos)
    end
    
    WindowSetGameActionData(self:GetName().."Action", GameData.PlayerActions.SET_TARGET, 0, self.name)
    
    Squared.FireSetNameHandler(self)
end

function SquaredUnitFrame:SetCareerTextColor(careerLine)
    local textColor = Squared.GetSetting("textcolor") or {255, 255, 255}
    local namePos = Squared.GetSetting("text-position-name")
    
    if careerLine then
        local archetype = Squared.GetSetting(careerArchSettings[careerLine])
        if archetype then
            textColor = Squared.GetSetting("colorgroup-"..archetype) or textColor
        end
    end
    
    if namePos == "top" then
        self.toptextcolor = textColor
    elseif namePos == "bottom" then
        self.bottextcolor = textColor
    else
        self.textcolor = textColor
    end
end

function SquaredUnitFrame:SetCareerFillColor(careerLine)
    local fillColor = Squared.GetSetting("textcolor") or {255, 255, 255}
    if careerLine then
        local archetype = Squared.GetSetting(careerArchSettings[careerLine])
        if archetype then
            fillColor = Squared.GetSetting("colorgroup-"..archetype) or fillColor
        end
    end
    self.fgcolor = fillColor
end

function SquaredUnitFrame:SetCareerIcon(careerLine, alpha, scale)
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    local wName = self:GetName()
    local scale = scale or Squared.GetSetting("icon-scale") or 0
    
    if careerLine == nil or careerLine <= 0 then
        self.showicon = false
        return
    else
        self.showicon = true
    end
    local texture, x, y = GetIconData( Icons.GetCareerIconIDFromCareerLine( careerLine ) )
    DynamicImageSetTexture( wName.."Icon", texture, x, y )
    local iconAlpha = Squared.GetSetting("icon-alpha") or 0.5
    WindowSetAlpha(wName.."Icon", (self.fadealpha or self.alpha or 1.0)*iconAlpha)
    if scale > 0 then
        WindowSetScale(wName.."Icon", WindowGetScale(wName)*scale)
    else
        local smartScale = (min(self.fillwidth, self.fillheight) / 50) * 1.5
        WindowSetScale(wName.."Icon", WindowGetScale(wName)*smartScale)
    end
end

function SquaredUnitFrame:SetCareer(careerLine)
    if Squared.GetSetting("showicon") then self:SetCareerIcon(careerLine, 0.5) end
    if Squared.GetSetting("color-classnames") then self:SetCareerTextColor(careerLine) end
    if Squared.GetSetting("color-classbars") then self:SetCareerFillColor(careerLine) end
	local careerPos = Squared.GetSetting("text-position-career")
	if careerPos ~= "none" and CareerNames[careerLine] and CareerNames[careerLine].name then
		self:SetText(CareerNames[careerLine].name, careerPos)
	end
    self.career = careerLine
end

function SquaredUnitFrame:Update()
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    local wName = self:GetName()

    WindowSetDimensions(wName, self.boxwidth, self.boxheight)
    WindowSetDimensions(wName.."Text", self.fillwidth, 24)
    WindowSetDimensions(wName.."BottomText", self.fillwidth, 24)
    WindowSetDimensions(wName.."TopText", self.fillwidth, 24)
    WindowSetScale(wName, WindowGetScale("SquaredAnchor"))
    
    local gScale = InterfaceCore.GetScale()
    
    if self.bordertexture ~= self.activeBorderTexture then
        local tex = self.bordertexture
        DynamicImageSetTexture(wName.."Background", tex, 0, 0)
        if dims[tex] then
            DynamicImageSetTextureDimensions(wName.."Background", unpack(dims[tex]))
        end
        self.activeBorderTexture = tex
    end
    
    if self.bgtexture ~= self.activeBackTexture then
        local tex = self.bgtexture
        DynamicImageSetTexture(wName.."BackFill", tex, 0, 0)
        if dims[tex] then
            DynamicImageSetTextureDimensions(wName.."BackFill", unpack(dims[tex]))
        end
        self.activeBackTexture = tex
    end
    
    if self.fgtexture ~= self.activeForeTexture then
        local tex = self.fgtexture
        DynamicImageSetTexture(wName.."ForeFill", tex, 0, 0)
        if dims[tex] then
            DynamicImageSetTextureDimensions(wName.."ForeFill", unpack(dims[tex]))
        end
        self.activeForeTexture = tex
    end
    
    if self.dctexture ~= self.activeDcTexture then
        local tex = self.dctexture
        DynamicImageSetTexture(wName.."Offline", tex, 0, 0)
        if dims[tex] then
            DynamicImageSetTextureDimensions(wName.."Offline", unpack(dims[tex]))
        end
        self.activeDcTexture = tex
    end
    
    self:UpdateText()
    
    LabelSetText(wName.."Text", self.text)
    LabelSetText(wName.."TopText", self.toptext)
    LabelSetText(wName.."BottomText", self.bottext)
    
    if Squared.GetSetting("color-hpnames") then
        self:SetHealthNameColor()
    end
    
    LabelSetTextColor(wName.."Text", unpack(self.textcolor))
    LabelSetTextColor(wName.."TopText", unpack(self.toptextcolor))
    LabelSetTextColor(wName.."BottomText", unpack(self.bottextcolor))
    
    if self.curval > 0 then
        if not Squared.GetSetting("deplete-off") then
            if self.filldir == "left" or self.filldir == "right" then
                local fillVal = (self.curval / self.maxval) * self.fillwidth
                WindowSetDimensions(wName.."ForeFill", fillVal, self.fillheight)
            else
                local fillVal = (self.curval / self.maxval) * self.fillheight
                WindowSetDimensions(wName.."ForeFill", self.fillwidth, fillVal)
            end
        else
            WindowSetDimensions(wName.."ForeFill", self.fillwidth, self.fillheight)
        end
        if not Squared.GetSetting("invert-bars") then
            WindowSetTintColor(wName.."ForeFill", unpack(self.fgcolor))
        else
            WindowSetTintColor(wName.."ForeFill", unpack(self.bgcolor))
        end
        WindowSetShowing(wName.."ForeFill", true)
    else
        WindowSetShowing(wName.."ForeFill", false)
    end
    
    if self.isMyTarget then
        WindowSetTintColor(wName.."Background", unpack(Squared.GetSetting("targetbordercolor")))
    elseif Squared.GetSetting("color-hpborders") then
        self:SetHealthBorderColor()
    elseif self.isGroupLeader then
        WindowSetTintColor(wName.."Background", unpack(Squared.GetSetting("leaderbordercolor")))
    elseif self.isMainAssist then
        WindowSetTintColor(wName.."Background", unpack(Squared.GetSetting("assistbordercolor")))
    elseif self.isMyGroup then
        WindowSetTintColor(wName.."Background", unpack(Squared.GetSetting("groupbordercolor")))
    else
        WindowSetTintColor(wName.."Background", unpack(self.bordercolor))
    end
    
    if Squared.GetSetting("color-hpbars") then
        self:SetHealthFillColor()
    else
        if self.curval > 0 then
            if not Squared.GetSetting("invert-bars") then
                WindowSetTintColor(wName.."BackFill", unpack(self.bgcolor))
            else
                WindowSetTintColor(wName.."BackFill", unpack(self.fgcolor))
            end
        else
            WindowSetTintColor(wName.."BackFill", unpack(Squared.GetSetting("colorgroup-hpdead")))
        end
    end
    
    WindowSetShowing(wName.."Icon", self.showicon)
    
    self:UpdateIndicators()
    
    self:UpdateFade()
    
    -- Online indicator
    if self.online then
        WindowSetShowing(wName.."Offline", false)
    else
        WindowSetShowing(wName.."Offline", true)
    end
    
    local alwaysDraw = Squared.GetSetting("always-draw")
    if alwaysDraw ~= self.alwaysdraw then
        WindowSetDrawWhenInterfaceHidden(wName, alwaysDraw)
        self.alwaysdraw = alwaysDraw
    end
end

function SquaredUnitFrame:UpdateFade()
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    local wName = self:GetName()
    local iconAlpha = Squared.GetSetting("icon-alpha") or 0.5
    if self.distant and Squared.GetSetting("rangefading") then
        WindowSetAlpha(wName, Squared.GetSetting("rangefading-min"))
    else
        WindowSetAlpha(wName, self.fadealpha or self.alpha)
    end
    WindowSetAlpha(wName.."BackFill", 1.0)
    WindowSetAlpha(wName.."Icon", (self.fadealpha or self.alpha or 1.0)*iconAlpha)
end

function SquaredUnitFrame:UpdateIndicators()
    -- Don't try to update inactive frames.
    if self.inactive then return end
    
    local wName = self:GetName()
    
    for k,v in pairs(self.indicators) do
        if indicatorName[k] then
            if v.showing then
                WindowSetAlpha(wName..indicatorName[k], 1.0)
            else
                WindowSetAlpha(wName..indicatorName[k], 0.0)
            end
            WindowSetTintColor(wName..indicatorName[k], unpack(v.color))
            WindowSetDimensions(wName..indicatorName[k], v.size, v.size)
        end
    end
    
    self:UpdateFade()
end
if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

local oRed,oGreen,oBlue
oRed,oGreen,oBlue = 255, 255, 255
local oGroup = nil

local colorsettings = SquaredConfigurator.colorsettings
local colorsettingNames = SquaredConfigurator.colorsettingNames

-- Our panel window
local W

panel.title = L"Misc. Colors"

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 500)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Miscellaneous Color Options")
    W.Title = e
    
    -- Color option select label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W.Title, "bottom", "top", 0, 40)
    e:SetText(L"Select a color option to edit:")
    W.LabelSelectCG = e
    
    -- Color option select combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelSelectCG, "bottom", "top", 0, 10)
    W.EditSelectCG = e
    
    -- Preview label
    e = W("Label")
    e:AnchorTo(W.EditSelectCG, "bottom", "top", 0, 30)
    e:Resize(480)
    e:Font("font_clear_large_bold")
    e:Color(255, 255, 255)
    e:SetText("COLOR PREVIEW")
    W.LabelPreview = e
    
    -- Color sliders
    e = W("Slider")
    e:AnchorTo(W.LabelPreview, "bottom", "top", 0, 40)
    e:SetRange(0,255)
    W.SliderRed = e
    
    e = W("Label")
    e:Resize(100)
    e:Align("rightcenter")
    e:AnchorTo(W.SliderRed, "left", "right", -10, 0)
    e:SetText("Red")
    W.LabelRed = e
    
    e = W("Textbox")
    e:Resize(50)
    e:AnchorTo(W.SliderRed, "right", "left", 10, 0)
    e:SetText(255)
    W.EditRed = e
    
    e = W("Slider")
    e:AnchorTo(W.SliderRed, "bottom", "top", 0, 10)
    e:SetRange(0,255)
    W.SliderGreen = e
    
    e = W("Label")
    e:Resize(100)
    e:Align("rightcenter")
    e:AnchorTo(W.SliderGreen, "left", "right", -10, 0)
    e:SetText("Green")
    W.LabelGreen = e
    
    e = W("Textbox")
    e:Resize(50)
    e:AnchorTo(W.SliderGreen, "right", "left", 10, 0)
    e:SetText(255)
    W.EditGreen = e
    
    e = W("Slider")
    e:AnchorTo(W.SliderGreen, "bottom", "top", 0, 10)
    e:SetRange(0,255)
    W.SliderBlue = e
    
    e = W("Label")
    e:Resize(100)
    e:Align("rightcenter")
    e:AnchorTo(W.SliderBlue, "left", "right", -10, 0)
    e:SetText("Blue")
    W.LabelBlue = e
    
    e = W("Textbox")
    e:Resize(50)
    e:AnchorTo(W.SliderBlue, "right", "left", 10, 0)
    e:SetText(255)
    W.EditBlue = e
    
    -- Reminder note
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "bottom", "bottom", 0, -65)
    e:SetText("Don't forget to hit Apply for each color!")
    W.LabelReminder = e
    
    -- Apply button
    e = W("Button")
    e:Resize(200)
    e:SetText(L"Apply This Color")
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
    
    local cGroup = W.EditSelectCG:SelectedIndex()
    if cGroup == nil then return end
    cGroup = colorsettings[cGroup]
    if cGroup == nil then return end
    
    local red, green, blue
    red = tonumber(W.EditRed:GetText()) or math.floor(W.SliderRed:GetValue())
    green = tonumber(W.EditGreen:GetText()) or math.floor(W.SliderGreen:GetValue())
    blue = tonumber(W.EditBlue:GetText()) or math.floor(W.SliderBlue:GetValue())
    
    Squared.SetSetting(cGroup, {red, green, blue})
    
    return
end

function UpdatePanel(self, key, value)
    
    local keyindex = 1
    if key and colorsettings[key] then
        keyindex = colorsettings[key]
    elseif key then return end -- if this isn't a general update and it's not for a colorsetting, we don't need to do anything else
    
    W.EditSelectCG:Clear()
    for _,color in ipairs(colorsettingNames) do
        W.EditSelectCG:Add(color)
    end
    
    W.EditSelectCG:SelectIndex(keyindex)
    
    oGroup = towstring(colorsettingNames[keyindex])
    
    local cGroup = colorsettings[keyindex]
    local rgb = value or Squared.GetSetting(cGroup)

    if not rgb then return end
    
    oRed, oGreen, oBlue = unpack(rgb)
    
    W.SliderRed:SetValue(oRed)
    W.SliderGreen:SetValue(oGreen)
    W.SliderBlue:SetValue(oBlue)

    W.EditRed:SetText(towstring(oRed))
    W.EditGreen:SetText(towstring(oGreen))
    W.EditBlue:SetText(towstring(oBlue))
    
    W.LabelPreview:Color(oRed, oGreen, oBlue)
    
    return
end

function SquaredConfiguratorUpdateMiscColorPanel()
    if not (SquaredConfigurator.ActivePanel == panel.id) then return end
    
    -- Check to see if new group was selected
    local cGroup = W.EditSelectCG:Selected()
    if cGroup ~= nil and cGroup ~= oGroup then
        oGroup = cGroup
        cGroup = colorsettings[W.EditSelectCG:SelectedIndex()]
        
        local rgb = Squared.GetSetting(cGroup)
        
        if not rgb then return end
        
        oRed, oGreen, oBlue = unpack(rgb)
        
        W.SliderRed:SetValue(oRed)
        W.SliderGreen:SetValue(oGreen)
        W.SliderBlue:SetValue(oBlue)
    
        W.EditRed:SetText(towstring(oRed))
        W.EditGreen:SetText(towstring(oGreen))
        W.EditBlue:SetText(towstring(oBlue))
        
        W.LabelPreview:Color(oRed, oGreen, oBlue)
        
        return
    end
    
    -- Check to see if color selectors have been updated
    
    local sRed, sGreen, sBlue
    local eRed, eGreen, eBlue
    local updated = false
    local eupdated = false
    
    sRed = math.floor(W.SliderRed:GetValue())
    sGreen = math.floor(W.SliderGreen:GetValue())
    sBlue = math.floor(W.SliderBlue:GetValue())
        
    eRed = tonumber(W.EditRed:GetText()) or math.floor(W.SliderRed:GetValue())
    eGreen = tonumber(W.EditGreen:GetText()) or math.floor(W.SliderGreen:GetValue())
    eBlue = tonumber(W.EditBlue:GetText()) or math.floor(W.SliderBlue:GetValue())
    
    if sRed ~= oRed then
        oRed = sRed
        updated = true
    elseif eRed ~= oRed then
        oRed = eRed
        eupdated = true
    end
    
    if sGreen ~= oGreen then
        oGreen = sGreen
        updated = true
    elseif eGreen ~= oGreen then
        oGreen = eGreen
        eupdated = true
    end
    
    if sBlue ~= oBlue then
        oBlue = sBlue
        updated = true
    elseif eBlue ~= oBlue then
        oBlue = eBlue
        eupdated = true
    end
    
    if not (updated or eupdated) then return end
    
    W.SliderRed:SetValue(oRed)
    W.SliderGreen:SetValue(oGreen)
    W.SliderBlue:SetValue(oBlue)
    
    if not eupdated then
        W.EditRed:SetText(towstring(oRed))
        W.EditGreen:SetText(towstring(oGreen))
        W.EditBlue:SetText(towstring(oBlue))
    end
    
    W.LabelPreview:Color(oRed, oGreen, oBlue)
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
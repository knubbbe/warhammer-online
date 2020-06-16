if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Dynamic Coloring"

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 450)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Dynamic Coloring Options")
    W.Title = e
    
    -- class color names label
    e = W("Label")
    e:Resize(200)
    e:Position(130,60)
    e:Align("leftcenter")
    e:SetText(L"Class-colored names:")
    W.LabelClassNames = e
    
    -- class color names checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelClassNames, "right", "left", 20, 0)
    W.CheckClassNames = e
    
    -- class color bars label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelClassNames, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Class-colored bars:")
    W.LabelClassBars = e
    
    -- class color bars checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelClassBars, "right", "left", 20, 0)
    W.CheckClassBars = e
    
    -- hp color names label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelClassBars, "bottomleft", "topleft", 0, 30)
    e:Align("leftcenter")
    e:SetText(L"HP-colored names:")
    W.LabelHpNames = e
    
    -- hp color names checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelHpNames, "right", "left", 20, 0)
    W.CheckHpNames = e
    
    -- hp color bars label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelHpNames, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"HP-colored bars:")
    W.LabelHpBars = e
    
    -- hp color bars checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelHpBars, "right", "left", 20, 0)
    W.CheckHpBars = e
    
    -- hp color names label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelHpBars, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"HP-colored borders:")
    W.LabelHpBorders = e
    
    -- hp color names checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelHpBorders, "right", "left", 20, 0)
    W.CheckHpBorders = e
    
    -- thresholds label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 280)
    e:SetText(L"HP thresholds:")
    W.LabelThresholds = e
    
    -- high editbox
    e = W("Textbox")
    e:Resize(60)
    e:AnchorTo(W.LabelThresholds, "bottom", "topright", -80, 10)
    W.EditHigh = e
    
    -- high label
    e = W("Label")
    e:Resize(80)
    e:AnchorTo(W.EditHigh, "left", "right", -10, 0)
    e:Align("rightcenter")
    e:SetText(L"High %:")
    W.LabelHigh = e
    
    -- medium editbox
    e = W("Textbox")
    e:Resize(60)
    e:AnchorTo(W.LabelThresholds, "bottom", "topright", 70, 10)
    W.EditMedium = e
    
    -- high label
    e = W("Label")
    e:Resize(80)
    e:AnchorTo(W.EditMedium, "left", "right", -10, 0)
    e:Align("rightcenter")
    e:SetText(L"Med. %:")
    W.LabelMedium = e
    
    -- low label
    e = W("Label")
    e:Resize(80)
    e:AnchorTo(W.EditMedium, "right", "left", 0, 0)
    e:Align("rightcenter")
    e:SetText(L"Low %:")
    W.LabelLow = e
    
    -- low editbox
    e = W("Textbox")
    e:Resize(60)
    e:AnchorTo(W.LabelLow, "right", "left", 10, 0)
    W.EditLow = e
    
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
    
    local classnames = W.CheckClassNames:GetValue()
    local orig_classnames = Squared.GetSetting("color-classnames")
    _ = orig_classnames ~= classnames and Squared.SetSetting("color-classnames", classnames)
    
    local classbars = W.CheckClassBars:GetValue()
    local orig_classbars = Squared.GetSetting("color-classbars")
    _ = orig_classbars ~= classbars and Squared.SetSetting("color-classbars", classbars)
    
    local hpnames = W.CheckHpNames:GetValue()
    local orig_hpnames = Squared.GetSetting("color-hpnames")
    _ = orig_hpnames ~= hpnames and Squared.SetSetting("color-hpnames", hpnames)
    
    local hpbars = W.CheckHpBars:GetValue()
    local orig_hpbars = Squared.GetSetting("color-hpbars")
    _ = orig_hpbars ~= hpbars and Squared.SetSetting("color-hpbars", hpbars)
    
    local hpborders = W.CheckHpBorders:GetValue()
    local orig_hpborders = Squared.GetSetting("color-hpborders")
    _ = orig_hpborders ~= hpborders and Squared.SetSetting("color-hpborders", hpborders)
    
    local high = tonumber(W.EditHigh:GetText())
    if high <= 0 then high = nil end
    local orig_high = Squared.GetSetting("hp-high")
    _ = high and orig_high ~= high and Squared.SetSetting("hp-high", high)
    _ = high or W.EditHigh:SetText(towstring(orig_high))
    
    local medium = tonumber(W.EditMedium:GetText())
    if medium <= 0 then medium = nil end
    local orig_medium = Squared.GetSetting("hp-medium")
    _ = medium and orig_medium ~= medium and Squared.SetSetting("hp-medium", medium)
    _ = medium or W.EditMedium:SetText(towstring(orig_medium))
    
    local low = tonumber(W.EditLow:GetText())
    if low <= 0 then low = nil end
    local orig_low = Squared.GetSetting("hp-low")
    _ = low and orig_low ~= low and Squared.SetSetting("hp-low", low)
    _ = low or W.EditLow:SetText(towstring(orig_low))
    
    return
end

function UpdatePanel(self, key, value)
        
    _ = (not key or key == "color-classnames") and
        W.CheckClassNames:SetValue(value or value == nil and Squared.GetSetting("color-classnames"))
        
    _ = (not key or key == "color-classbars") and
        W.CheckClassBars:SetValue(value or value == nil and Squared.GetSetting("color-classbars"))
        
    _ = (not key or key == "color-hpnames") and
        W.CheckHpNames:SetValue(value or value == nil and Squared.GetSetting("color-hpnames"))
        
    _ = (not key or key == "color-hpbars") and
        W.CheckHpBars:SetValue(value or value == nil and Squared.GetSetting("color-hpbars"))
        
    _ = (not key or key == "color-hpborders") and
        W.CheckHpBorders:SetValue(value or value == nil and Squared.GetSetting("color-hpborders"))
        
    _ = (not key or key == "hp-high") and
        W.EditHigh:SetText(towstring(value or Squared.GetSetting("hp-high")))

    _ = (not key or key == "hp-medium") and
        W.EditMedium:SetText(towstring(value or Squared.GetSetting("hp-medium")))
        
    _ = (not key or key == "hp-low") and
        W.EditLow:SetText(towstring(value or Squared.GetSetting("hp-low")))
        
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
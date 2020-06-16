if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Modes"

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 360)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Enabled Display Modes")
    W.Title = e
    
    -- 'disable' label
    e = W("Label")
    e:Resize(270)
    e:Position(90,60)
    e:Align("leftcenter")
    e:SetText(L"Completely disable Squared:")
    W.LabelDisable = e
    
    -- 'disable' Checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelDisable, "right", "left", 10, 0)
    e.OnLButtonUp =
        function()
            W.CheckDefault:SetEnabled(not W.CheckDisable:GetValue())
            W.CheckGroup:SetEnabled(not W.CheckDisable:GetValue())
            W.CheckWarband:SetEnabled(not W.CheckDisable:GetValue())
            W.CheckScenario:SetEnabled(not W.CheckDisable:GetValue())
        end
    W.CheckDisable = e
    
    -- 'default' label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelDisable, "bottomleft", "topleft", 0, 40)
    e:Align("leftcenter")
    e:SetText(L"Default (solo):")
    W.LabelDefault = e
    
    -- 'default' Checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelDefault, "right", "left", 60, 0)
    W.CheckDefault = e
    
    -- 'group' label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelDefault, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Group (party):")
    W.LabelGroup = e
    
    -- 'group' Checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelGroup, "right", "left", 60, 0)
    W.CheckGroup = e
    
    -- 'warband' label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelGroup, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Warband:")
    W.LabelWarband = e
    
    -- 'warband' Checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelWarband, "right", "left", 60, 0)
    W.CheckWarband = e
    
    -- 'scenario' label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelWarband, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Scenario:")
    W.LabelScenario = e
    
    -- 'scenario' Checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelScenario, "right", "left", 60, 0)
    W.CheckScenario = e
    
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
    
    local disable, orig_disable
    
    -- Apply 'disable'
    disable = W.CheckDisable:GetValue()
    orig_disable = Squared.GetSetting("disable")
    _ = orig_disable ~= disable and Squared.SetSetting("disable", disable)
    
    -- Apply 'disable-default'
    disable = not W.CheckDefault:GetValue()
    orig_disable = Squared.GetSetting("disable-default")
    _ = orig_disable ~= disable and Squared.SetSetting("disable-default", disable)
    
    -- Apply 'disable-group'
    disable = not W.CheckGroup:GetValue()
    orig_disable = Squared.GetSetting("disable-group")
    _ = orig_disable ~= disable and Squared.SetSetting("disable-group", disable)
    
    -- Apply 'disable-warband'
    disable = not W.CheckWarband:GetValue()
    orig_disable = Squared.GetSetting("disable-warband")
    _ = orig_disable ~= disable and Squared.SetSetting("disable-warband", disable)
    
    -- Apply 'disable-warband'
    disable = not W.CheckScenario:GetValue()
    orig_disable = Squared.GetSetting("disable-scenario")
    _ = orig_disable ~= disable and Squared.SetSetting("disable-scenario", disable)
    
    Squared.ChangeMode(true)
    
    return
end

function UpdatePanel(self, key, value)
    
    _ = (not key or key == "disable") and
        W.CheckDisable:SetValue(value or value == nil and Squared.GetSetting("disable"))
    
    W.CheckDefault:SetEnabled(not W.CheckDisable:GetValue())
    W.CheckGroup:SetEnabled(not W.CheckDisable:GetValue())
    W.CheckWarband:SetEnabled(not W.CheckDisable:GetValue())
    W.CheckScenario:SetEnabled(not W.CheckDisable:GetValue())
    
    _ = (not key or key == "disable-default") and
        W.CheckDefault:SetValue(not (value or value == nil and Squared.GetSetting("disable-default")))
    
    _ = (not key or key == "disable-group") and
        W.CheckGroup:SetValue(not (value or value == nil and Squared.GetSetting("disable-group")))
        
    _ = (not key or key == "disable-warband") and
        W.CheckWarband:SetValue(not (value or value == nil and Squared.GetSetting("disable-warband")))
        
    _ = (not key or key == "disable-scenario") and
        W.CheckScenario:SetValue(not (value or value == nil and Squared.GetSetting("disable-scenario")))
    
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Indicators"

local statusposes = SquaredConfigurator.statusposes
local statusposNames = SquaredConfigurator.statusposNames

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
    e:SetText(L"Status Indicator Options")
    W.Title = e
    
    -- indicator size
    e = W("Label")
    e:Resize(200)
    e:Position(20,60)
    e:Align("leftcenter")
    e:SetText(L"Indicator size:")
    W.LabelIndicatorSize = e
    
    -- indicator size editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelIndicatorSize, "right", "left", 20, 0)
    W.EditIndicatorSize = e
    
    -- buff pos
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelIndicatorSize, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText(L"Buff position:")
    W.LabelBuffPos = e
    
    -- buff pos combo
    e = W("Combobox")
    e:AnchorTo(W.LabelBuffPos, "right", "left", 20, 0)
    for _,pos in ipairs(statusposNames) do e:Add(pos) end
    W.EditBuffPos = e
    
    -- debuff position
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelBuffPos, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Debuff position:")
    W.LabelDebuffPos = e
    
    -- debuff position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelDebuffPos, "right", "left", 20, 0)
    for _,pos in ipairs(statusposNames) do e:Add(pos) end
    W.EditDebuffPos = e
    
    -- hot position
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelDebuffPos, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"HoT position:")
    W.LabelHotPos = e
    
    -- hot position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelHotPos, "right", "left", 20, 0)
    for _,pos in ipairs(statusposNames) do e:Add(pos) end
    W.EditHotPos = e
    
    -- buff self label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelHotPos, "bottomleft", "topleft", 0, 30)
    e:Align("leftcenter")
    e:SetText(L"Only self buffs:")
    W.LabelSelfBuff = e
    
    -- buff self checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelSelfBuff, "right", "left", 20, 0)
    W.CheckSelfBuff = e
    
    -- debuff self label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelSelfBuff, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Only curable debuffs:")
    W.LabelSelfDebuff = e
    
    -- debuff self checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelSelfDebuff, "right", "left", 20, 0)
    W.CheckSelfDebuff = e
    
    -- hot self label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelSelfDebuff, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Only self hots:")
    W.LabelSelfHot = e
    
    -- hot self checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelSelfHot, "right", "left", 20, 0)
    W.CheckSelfHot = e
    
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

    local buffpos = statusposes[W.EditBuffPos:SelectedIndex()]
    local orig_buffpos = Squared.GetSetting("status-buff")
    _ = buffpos and orig_buffpos ~= buffpos and Squared.SetSetting("status-buff", buffpos)
    
    local debuffpos = statusposes[W.EditDebuffPos:SelectedIndex()]
    local orig_debuffpos = Squared.GetSetting("status-debuff")
    _ = debuffpos and orig_debuffpos ~= debuffpos and Squared.SetSetting("status-debuff", debuffpos)
    
    local hotpos = statusposes[W.EditHotPos:SelectedIndex()]
    local orig_hotpos = Squared.GetSetting("status-hot")
    _ = hotpos and orig_hotpos ~= hotpos and Squared.SetSetting("status-hot", hotpos)
    
    local indsize = tonumber(W.EditIndicatorSize:GetText())
    local orig_indsize = Squared.GetSetting("status-size")
    _ = indsize and orig_indsize ~= indsize and Squared.SetSetting("status-size", indsize)
    _ = indsize or W.EditIndicatorSize:SetText(towstring(orig_indsize))
    
    --[[ DISABLED AS OF 1.0.6 - SHOULD HOPEFULLY BE POSSIBLE AGAIN IN 1.1
    local selfbuff = W.CheckSelfBuff:GetValue()
    local orig_selfbuff = Squared.GetSetting("status-buff-selfonly")
    _ = orig_selfbuff ~= selfbuff and Squared.SetSetting("status-buff-selfonly", selfbuff)
    --]]
    
    local selfdebuff = W.CheckSelfDebuff:GetValue()
    local orig_selfdebuff = Squared.GetSetting("status-debuff-selfonly")
    _ = orig_selfdebuff ~= selfdebuff and Squared.SetSetting("status-debuff-selfonly", selfdebuff)
    
    --[[ DISABLED AS OF 1.0.6 - SHOULD HOPEFULLY BE POSSIBLE AGAIN IN 1.1
    local selfhot = W.CheckSelfHot:GetValue()
    local orig_selfhot = Squared.GetSetting("status-hot-selfonly")
    _ = orig_selfhot ~= selfhot and Squared.SetSetting("status-hot-selfonly", selfhot)
    --]]
    
    return
end

function UpdatePanel(self, key, value)

    _ = (not key or key == "status-buff") and
        W.EditBuffPos:SelectIndex(statusposes[value or Squared.GetSetting("status-buff")])
        
    _ = (not key or key == "status-debuff") and
        W.EditDebuffPos:SelectIndex(statusposes[value or Squared.GetSetting("status-debuff")])
        
    _ = (not key or key == "status-hot") and
        W.EditHotPos:SelectIndex(statusposes[value or Squared.GetSetting("status-hot")])
        
    _ = (not key or key == "status-size") and
        W.EditIndicatorSize:SetText(towstring(value or Squared.GetSetting("status-size")))
    
    --[[ DISABLED AS OF 1.0.6 - SHOULD HOPEFULLY BE POSSIBLE AGAIN IN 1.1
    _ = (not key or key == "status-buff-selfonly") and
        W.CheckSelfBuff:SetValue(value or value == nil and Squared.GetSetting("status-buff-selfonly"))
    --]]
        
    _ = (not key or key == "status-debuff-selfonly") and
        W.CheckSelfDebuff:SetValue(value or value == nil and Squared.GetSetting("status-debuff-selfonly"))
        
    --[[ DISABLED AS OF 1.0.6 - SHOULD HOPEFULLY BE POSSIBLE AGAIN IN 1.1
    _ = (not key or key == "status-hot-selfonly") and
        W.CheckSelfHot:SetValue(value or value == nil and Squared.GetSetting("status-hot-selfonly"))
    --]]
        
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Performance"

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 300)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Performance Options")
    W.Title = e
    
    -- update freq label
    e = W("Label")
    e:Resize(220)
    e:Position(20,60)
    e:Align("leftcenter")
    e:SetText(L"General update delay:")
    W.LabelUpdateFreq = e
    
    -- update freq textbox
    e = W("Textbox")
    e:Resize(220)
    e:AnchorTo(W.LabelUpdateFreq, "right", "left", 20, 0)
    W.EditUpdateFreq = e
    
    -- indicator update freq label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelUpdateFreq, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Indicator update delay:")
    W.LabelBuffFreq = e
    
    -- indicator update freq Textbox
    e = W("Textbox")
    e:Resize(220)
    e:AnchorTo(W.LabelBuffFreq, "right", "left", 20, 0)
    W.EditBuffFreq = e
    
    -- indicator render freq
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelBuffFreq, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Indicator render delay:")
    W.LabelBuffRenderFreq = e
    
    -- indicator render freq
    e = W("Textbox")
    e:Resize(220)
    e:AnchorTo(W.LabelBuffRenderFreq, "right", "left", 20, 0)
    W.EditBuffRenderFreq = e
    
    -- fading freq
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelBuffRenderFreq, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Fading render delay:")
    W.LabelFadeFreq = e
    
    -- fading freq
    e = W("Textbox")
    e:Resize(220)
    e:AnchorTo(W.LabelFadeFreq, "right", "left", 20, 0)
    W.EditFadeFreq = e
    
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
    
    -- Apply update freq
    local updatefreq = tonumber(W.EditUpdateFreq:GetText())
    local orig_updatefreq = Squared.GetSetting("update-freq")
    _ = updatefreq and orig_updatefreq ~= updatefreq and Squared.SetSetting("update-freq", updatefreq)
    _ = updatefreq or W.EditUpdateFreq:SetText(towstring(orig_updatefreq))
    
    -- Apply bufftracking freq
    local bufffreq = tonumber(W.EditBuffFreq:GetText())
    local orig_bufffreq = Squared.GetSetting("bufftracking-freq")
    _ = bufffreq and orig_bufffreq ~= bufffreq and Squared.SetSetting("bufftracking-freq", bufffreq)
    _ = bufffreq or W.EditBuffFreq:SetText(towstring(orig_bufffreq))
    
    -- Apply buff render freq
    local buffrenderfreq = tonumber(W.EditBuffRenderFreq:GetText())
    local orig_buffrenderfreq = Squared.GetSetting("bufftracking-render-freq")
    _ = buffrenderfreq and orig_buffrenderfreq ~= buffrenderfreq and Squared.SetSetting("bufftracking-render-freq", buffrenderfreq)
    _ = buffrenderfreq or W.EditBuffRenderFreq:SetText(towstring(orig_buffrenderfreq))
    
    -- Apply fading freq
    local fadefreq = tonumber(W.EditFadeFreq:GetText())
    local orig_fadefreq = Squared.GetSetting("rangefading-freq")
    _ = fadefreq and orig_fadefreq ~= fadefreq and Squared.SetSetting("rangefading-freq", fadefreq)
    _ = fadefreq or W.EditFadeFreq:SetText(towstring(orig_fadefreq))
    
    return
end

function UpdatePanel(self, key, value)

    _ = (not key or key == "update-freq") and
        W.EditUpdateFreq:SetText(towstring(value or Squared.GetSetting("update-freq")))
        
    _ = (not key or key == "bufftracking-freq") and
        W.EditBuffFreq:SetText(towstring(value or Squared.GetSetting("bufftracking-freq")))
        
    _ = (not key or key == "bufftracking-render-freq") and
        W.EditBuffRenderFreq:SetText(towstring(value or Squared.GetSetting("bufftracking-render-freq")))
        
    _ = (not key or key == "rangefading-freq") and
        W.EditFadeFreq:SetText(towstring(value or Squared.GetSetting("rangefading-freq")))
    
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

local textposes = SquaredConfigurator.textpositions
local textposNames = SquaredConfigurator.textpositionNames

local modkeys = SquaredConfigurator.modifierkeys

panel.title = L"Misc. Options"

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 600)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Miscellaneous Options")
    W.Title = e
    
    -- showmenu label
    e = W("Label")
    e:Resize(220)
    e:Position(20,60)
    e:Align("leftcenter")
    e:SetText(L"Show right-click menus:")
    W.LabelShowMenu = e
    
    -- showmenu checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelShowMenu, "right", "left", 20, 0)
    W.CheckShowMenu = e
    
    -- rangefading label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelShowMenu, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText("Enable range/LoS fade:")
    W.LabelRangeFade = e
    
    -- rangefading checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelRangeFade, "right", "left", 20, 0)
    W.CheckRangeFade = e
    
    -- testmode label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelRangeFade, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText("Test mode:")
    W.LabelTestMode = e
    
    -- testmode checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelTestMode, "right", "left", 20, 0)
    W.CheckTestMode = e
    
    -- alpha label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelTestMode, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText("Overall transparency:")
    W.LabelAlpha = e
    
    -- alpha textbox
    e = W("Textbox")
    e:Resize(220)
    e:AnchorTo(W.LabelAlpha, "right", "left", 20, 0)
    W.EditAlpha = e
    
    -- rangefade-min textbox
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelAlpha, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText("Fading (initial):")
    W.LabelFadeInit = e
    
    -- rangefade-min textbox
    e = W("Textbox")
    e:Resize(220)
    e:AnchorTo(W.LabelFadeInit, "right", "left", 20, 0)
    W.EditFadeInit = e
    
    -- rangefade-max textbox
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelFadeInit, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText("Fading (final):")
    W.LabelFadeFinal = e
    
    -- rangefade-max textbox
    e = W("Textbox")
    e:Resize(220)
    e:AnchorTo(W.LabelFadeFinal, "right", "left", 20, 0)
    W.EditFadeFinal = e
    
    -- stay faded label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelFadeFinal, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText("Stay faded until click:")
    W.LabelStayFaded = e
    
    -- stay faded checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelStayFaded, "right", "left", 20, 0)
    W.CheckStayFaded = e
    
    -- assist text
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelStayFaded, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText("Assist modifier:")
    W.LabelKeyAssist = e
    
    -- assist combo
    e = W("Smallcombobox")
    e:AnchorTo(W.LabelKeyAssist, "right", "left", 20, 0)
    for _,modkey in ipairs(modkeys) do e:Add(modkey) end
    W.EditKeyAssist = e
    
    -- assist final label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelKeyAssist, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText("No target on assist:")
    W.LabelAssistFinal = e
    
    -- assist final checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelAssistFinal, "right", "left", 20, 0)
    W.CheckAssistFinal = e
    
    -- always draw label
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelAssistFinal, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText("Show when UI hidden:")
    W.LabelAlwaysDraw = e
    
    -- assist final checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelAlwaysDraw, "right", "left", 20, 0)
    W.CheckAlwaysDraw = e
    
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

    -- showmenu
    local showmenu = W.CheckShowMenu:GetValue()
    local orig_showmenu = Squared.GetSetting("showmenu")
    _ = orig_showmenu ~= showmenu and Squared.SetSetting("showmenu", showmenu)
    
    -- rangefading
    local rangefading = W.CheckRangeFade:GetValue()
    local orig_rangefading = Squared.GetSetting("rangefading")
    _ = orig_rangefading ~= rangefading and Squared.SetSetting("rangefading", rangefading)
    
    -- testmode
    local testmode = W.CheckTestMode:GetValue()
    local orig_testmode = Squared.GetSetting("testmode")
    _ = orig_testmode ~= testmode and Squared.SetSetting("testmode", testmode)
    
    -- Apply alpha
    local alpha = tonumber(W.EditAlpha:GetText())
    local orig_alpha = Squared.GetSetting("alpha")
    _ = alpha and orig_alpha ~= alpha and Squared.SetSetting("alpha", alpha)
    _ = alpha or W.EditAlpha:SetText(towstring(orig_alpha))
    
    -- Apply fade-init
    local fadeinit = tonumber(W.EditFadeInit:GetText())
    local orig_fadeinit = Squared.GetSetting("rangefading-min")
    _ = fadeinit and orig_fadeinit ~= fadeinit and Squared.SetSetting("rangefading-min", fadeinit)
    _ = fadeinit or W.EditFadeInit:SetText(towstring(orig_fadeinit))
    
    -- Apply fade-final
    local fadefinal = tonumber(W.EditFadeFinal:GetText())
    local orig_fadefinal = Squared.GetSetting("rangefading-max")
    _ = fadefinal and orig_fadefinal ~= fadefinal and Squared.SetSetting("rangefading-max", fadefinal)
    _ = fadefinal or W.EditFadeFinal:SetText(towstring(orig_fadefinal))
    
    -- stay faded
    local stayfaded = W.CheckStayFaded:GetValue()
    local orig_stayfaded = Squared.GetSetting("rangefading-noautounfade")
    _ = orig_stayfaded ~= stayfaded and Squared.SetSetting("rangefading-noautounfade", stayfaded)
    
    -- Apply assist modifier key
    local keyassist = modkeys[W.EditKeyAssist:SelectedIndex()]
    local orig_keyassist = Squared.GetSetting("key-assist")
    _ = keyassist and orig_keyassist ~= keyassist and Squared.SetSetting("key-assist", keyassist)
    _ = keyassist or W.EditKeyAssist:SelectIndex(modkeys[orig_keyassist])
    
    -- assist final
    local astfinal = W.CheckAssistFinal:GetValue()
    local orig_astfinal = Squared.GetSetting("key-assist-final")
    _ = orig_astfinal ~= astfinal and Squared.SetSetting("key-assist-final", astfinal)
    
    -- always-draw
    local alwaysdraw = W.CheckAlwaysDraw:GetValue()
    local orig_alwaysdraw = Squared.GetSetting("always-draw")
    _ = orig_alwaysdraw ~= alwaysdraw and Squared.SetSetting("always-draw", alwaysdraw)
    
    Squared.ChangeMode(true)
    
    return
end

function UpdatePanel(self, key, value)

    _ = (not key or key == "showmenu") and
        W.CheckShowMenu:SetValue(value or value == nil and Squared.GetSetting("showmenu"))
        
    _ = (not key or key == "rangefading") and
        W.CheckRangeFade:SetValue(value or value == nil and Squared.GetSetting("rangefading"))
        
    _ = (not key or key == "testmode") and
        W.CheckTestMode:SetValue(value or value == nil and Squared.GetSetting("testmode"))
        
    _ = (not key or key == "alpha") and
        W.EditAlpha:SetText(towstring(value or Squared.GetSetting("alpha")))
        
    _ = (not key or key == "rangefading-min") and
        W.EditFadeInit:SetText(towstring(value or Squared.GetSetting("rangefading-min")))
        
    _ = (not key or key == "rangefading-max") and
        W.EditFadeFinal:SetText(towstring(value or Squared.GetSetting("rangefading-max")))
    
    _ = (not key or key == "rangefading-noautounfade") and
        W.CheckStayFaded:SetValue(value or value == nil and Squared.GetSetting("rangefading-noautounfade"))
    
    _ = (not key or key == "key-assist") and
        W.EditKeyAssist:SelectIndex(modkeys[value or Squared.GetSetting("key-assist")])
        
    _ = (not key or key == "key-assist-final") and
        W.CheckAssistFinal:SetValue(value or value == nil and Squared.GetSetting("key-assist-final"))
    
    _ = (not key or key == "always-draw") and
        W.CheckAlwaysDraw:SetValue(value or value == nil and Squared.GetSetting("always-draw"))
    
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
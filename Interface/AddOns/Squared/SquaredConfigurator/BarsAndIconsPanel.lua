if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Bars and Icons"

local dirs = SquaredConfigurator.directions
local dirNames = SquaredConfigurator.directionNames

local poses = SquaredConfigurator.positions
local posNames = SquaredConfigurator.positionNames

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 520)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Bar/Icon Options")
    W.Title = e
    
    -- fill dir label
    e = W("Label")
    e:Resize(200)
    e:Position(20,60)
    e:Align("leftcenter")
    e:SetText(L"Bar fill direction:")
    W.LabelFillDir = e
    
    -- fill dir combo
    e = W("Combobox")
    e:AnchorTo(W.LabelFillDir, "right", "left", 20, 0)
    for _,dir in ipairs(dirNames) do e:Add(dir) end
    W.EditFillDir = e
    
    -- invert fill label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelFillDir, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Invert bar fills:")
    W.LabelInvertBars = e
    
    -- invert fill checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelInvertBars, "right", "left", 20, 0)
    W.CheckInvertBars = e
    
    -- deplete-off label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelInvertBars, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Keep bars full:")
    W.LabelDepleteOff = e
    
    -- deplete-off checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelDepleteOff, "right", "left", 20, 0)
    e.OnLButtonUp =
        function()
            W.EditFillDir:SetEnabled(not W.CheckDepleteOff:GetValue())
            W.CheckInvertBars:SetEnabled(not W.CheckDepleteOff:GetValue())
        end
    W.CheckDepleteOff = e
    
    -- icon show label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelDepleteOff, "bottomleft", "topleft", 0, 30)
    e:Align("leftcenter")
    e:SetText(L"Show icon:")
    W.LabelShowIcon = e
    
    -- icon show checkbox
    e = W("Checkbox")
    e:AnchorTo(W.LabelShowIcon, "right", "left", 20, 0)
    e.OnLButtonUp =
        function()
            W.EditIconPosition:SetEnabled(W.CheckShowIcon:GetValue())
        end
    W.CheckShowIcon = e
    
    -- icon scale label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelShowIcon, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Icon scale (0 = auto):")
    W.LabelIconScale = e
    
    -- icon scale editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelIconScale, "right", "left", 20, 0)
    W.EditIconScale = e
    
    -- icon alpha label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelIconScale, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Icon alpha:")
    W.LabelIconAlpha = e
    
    -- icon alpha editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelIconAlpha, "right", "left", 20, 0)
    W.EditIconAlpha = e
    
    -- icon position label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelIconAlpha, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Icon position:")
    W.LabelIconPosition = e
    
    -- icon position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelIconPosition, "right", "left", 20, 0)
    for _,pos in ipairs(posNames) do e:Add(pos) end
    W.EditIconPosition = e
    
    -- icon offset x label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelIconPosition, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Icon X offset:")
    W.LabelIconOffsetX = e
    
    -- icon offset x editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelIconOffsetX, "right", "left", 20, 0)
    W.EditIconOffsetX = e
    
    -- icon offset y label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelIconOffsetX, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Icon Y offset:")
    W.LabelIconOffsetY = e
    
    -- icon offset y editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelIconOffsetY, "right", "left", 20, 0)
    W.EditIconOffsetY = e
    
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
    
    local filldir = dirs[W.EditFillDir:SelectedIndex()]
    local orig_filldir = Squared.GetSetting("direction-fill")
    _ = filldir and orig_filldir ~= filldir and Squared.SetSetting("direction-fill", filldir)
    _ = filldir or W.EditFillDir:SelectIndex(dirs[orig_filldir])
    
    local invert = W.CheckInvertBars:GetValue()
    local orig_invert = Squared.GetSetting("invert-bars")
    _ = orig_invert ~= invert and Squared.SetSetting("invert-bars", invert)
    
    local depleteoff = W.CheckDepleteOff:GetValue()
    local orig_depleteoff = Squared.GetSetting("deplete-off")
    _ = orig_depleteoff ~= depleteoff and Squared.SetSetting("deplete-off", depleteoff)
    
    local showicon = W.CheckShowIcon:GetValue()
    local orig_showicon = Squared.GetSetting("showicon")
    _ = orig_showicon ~= showicon and Squared.SetSetting("showicon", showicon)
    
    local iconscale = tonumber(W.EditIconScale:GetText())
    local orig_iconscale = Squared.GetSetting("icon-scale")
    _ = iconscale and orig_iconscale ~= iconscale and Squared.SetSetting("icon-scale", iconscale)
    _ = iconscale or W.EditIconScale:SetText(towstring(orig_iconscale))
    
    local iconalpha = tonumber(W.EditIconAlpha:GetText())
    local orig_iconalpha = Squared.GetSetting("icon-alpha")
    _ = iconalpha and orig_iconalpha ~= iconalpha and Squared.SetSetting("icon-alpha", iconalpha)
    _ = iconalpha or W.EditIconAlpha:SetText(towstring(orig_iconalpha))
    
    local iconpos = poses[W.EditIconPosition:SelectedIndex()]
    local orig_iconpos = Squared.GetSetting("icon-position")
    _ = iconpos and orig_iconpos ~= iconpos and Squared.SetSetting("icon-position", iconpos)
    _ = iconpos or W.EditIconPosition:SelectIndex(poses[orig_iconpos])
    
    local iconoffsetx = tonumber(W.EditIconOffsetX:GetText())
    local orig_iconoffsetx = Squared.GetSetting("icon-offset-x")
    _ = iconoffsetx and orig_iconoffsetx ~= iconoffsetx and Squared.SetSetting("icon-offset-x", iconoffsetx)
    _ = iconoffsetx or W.EditIconOffsetX:SetText(towstring(orig_iconoffsetx))
    
    local iconoffsety = tonumber(W.EditIconOffsetY:GetText())
    local orig_iconoffsety = Squared.GetSetting("icon-offset-y")
    _ = iconoffsety and orig_iconoffsety ~= iconoffsety and Squared.SetSetting("icon-offset-y", iconoffsety)
    _ = iconoffsety or W.EditIconOffsetY:SetText(towstring(orig_iconoffsety))

    return
end

function UpdatePanel(self, key, value)

    _ = (not key or key == "direction-fill") and
        W.EditFillDir:SelectIndex(dirs[value or Squared.GetSetting("direction-fill")])
        
    _ = (not key or key == "icon-position") and
        W.EditIconPosition:SelectIndex(poses[value or Squared.GetSetting("icon-position")])
        
    _ = (not key or key == "invert-bars") and
        W.CheckInvertBars:SetValue(value or value == nil and Squared.GetSetting("invert-bars"))
        
    _ = (not key or key == "deplete-off") and
        W.CheckDepleteOff:SetValue(value or value == nil and Squared.GetSetting("deplete-off"))
        
    _ = (not key or key == "showicon") and
        W.CheckShowIcon:SetValue(value or value == nil and Squared.GetSetting("showicon"))
        
    _ = (not key or key == "icon-scale") and
        W.EditIconScale:SetText(towstring(value or Squared.GetSetting("icon-scale")))
        
    _ = (not key or key == "icon-alpha") and
        W.EditIconAlpha:SetText(towstring(value or Squared.GetSetting("icon-alpha")))
        
    _ = (not key or key == "icon-offset-x") and
        W.EditIconOffsetX:SetText(towstring(value or Squared.GetSetting("icon-offset-x")))
        
    _ = (not key or key == "icon-offset-y") and
        W.EditIconOffsetY:SetText(towstring(value or Squared.GetSetting("icon-offset-y")))
        
    W.EditFillDir:SetEnabled(not W.CheckDepleteOff:GetValue())
    W.CheckInvertBars:SetEnabled(not W.CheckDepleteOff:GetValue())
    
    W.EditIconPosition:SetEnabled(W.CheckShowIcon:GetValue())
      
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
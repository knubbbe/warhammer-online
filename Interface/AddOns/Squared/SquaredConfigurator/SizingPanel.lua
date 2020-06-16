if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Sizing and Texture"

local texs = SquaredConfigurator.textures
local texNames = SquaredConfigurator.textureNames

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 400)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Sizing and Texture Options")
    W.Title = e
    
    -- boxwidth label
    e = W("Label")
    e:Resize(200)
    e:Position(20,60)
    e:Align("leftcenter")
    e:SetText(L"Box width:")
    W.LabelWidth = e
    
    -- boxwidth Textbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelWidth, "right", "left", 20, 0)
    W.EditWidth = e
    
    -- boxheight label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelWidth, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Box height:")
    W.LabelHeight = e
    
    -- boxheight Textbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelHeight, "right", "left", 20, 0)
    W.EditHeight = e
    
    -- bordersize label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelHeight, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Border size:")
    W.LabelBorder = e
    
    -- boxheight Textbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelBorder, "right", "left", 20, 0)
    W.EditBorder = e
    
    -- border texture label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelBorder, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Border texture:")
    W.LabelBorderTex = e
    
    -- border texture combo
    e = W("Combobox")
    e:AnchorTo(W.LabelBorderTex, "right", "left", 20, 0)
    for _,tex in ipairs(texNames) do e:Add(tex) end
    W.EditBorderTex = e
    
    -- fore texture label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelBorderTex, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Foreground texture:")
    W.LabelForeTex = e
    
    -- fore texture combo
    e = W("Combobox")
    e:AnchorTo(W.LabelForeTex, "right", "left", 20, 0)
    for _,tex in ipairs(texNames) do e:Add(tex) end
    W.EditForeTex = e
    
    -- back texture label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelForeTex, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Background texture:")
    W.LabelBackTex = e
    
    -- back texture combo
    e = W("Combobox")
    e:AnchorTo(W.LabelBackTex, "right", "left", 20, 0)
    for _,tex in ipairs(texNames) do e:Add(tex) end
    W.EditBackTex = e
    
    -- back texture label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelBackTex, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Offline texture:")
    W.LabelOfflineTex = e
    
    -- back texture combo
    e = W("Combobox")
    e:AnchorTo(W.LabelOfflineTex, "right", "left", 20, 0)
    for _,tex in ipairs(texNames) do e:Add(tex) end
    W.EditOfflineTex = e
    
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
    
    -- Apply box width
    local boxwidth = tonumber(W.EditWidth:GetText())
    local orig_boxwidth = Squared.GetSetting("boxwidth")
    _ = boxwidth and orig_boxwidth ~= boxwidth and Squared.SetSetting("boxwidth", boxwidth)
    _ = boxwidth or W.EditWidth:SetText(towstring(orig_boxwidth))
    
    -- Apply box height
    local boxheight = tonumber(W.EditHeight:GetText())
    local orig_boxheight = Squared.GetSetting("boxheight")
    _ = boxheight and orig_boxheight ~= boxheight and Squared.SetSetting("boxheight", boxheight)
    _ = boxheight or W.EditHeight:SetText(towstring(orig_boxheight))
    
    -- Apply border size
    local bordersize = tonumber(W.EditBorder:GetText())
    local orig_bordersize = Squared.GetSetting("bordersize")
    _ = bordersize and orig_bordersize ~= bordersize and Squared.SetSetting("bordersize", bordersize)
    _ = bordersize or W.EditBorder:SetText(towstring(orig_bordersize))
    
    -- Apply border texture
    local bordertex = texs[W.EditBorderTex:SelectedIndex()]
    local orig_bordertex = Squared.GetSetting("texture-border")
    _ = bordertex and orig_bordertex ~= bordertex and Squared.SetSetting("texture-border", bordertex)
    _ = bordertex or W.EditBorderTex:SelectIndex(texs[orig_bordertex])
    
    -- Apply back texture
    local backtex = texs[W.EditBackTex:SelectedIndex()]
    local orig_backtex = Squared.GetSetting("texture-background")
    _ = backtex and orig_backtex ~= backtex and Squared.SetSetting("texture-background", backtex)
    _ = backtex or W.EditBackTex:SelectIndex(texs[orig_backtex])
    
    -- Apply fore texture
    local foretex = texs[W.EditForeTex:SelectedIndex()]
    local orig_foretex = Squared.GetSetting("texture-foreground")
    _ = foretex and orig_foretex ~= foretex and Squared.SetSetting("texture-foreground", foretex)
    _ = foretex or W.EditForeTex:SelectIndex(texs[orig_foretex])
    
    -- Apply back texture
    local dctex = texs[W.EditOfflineTex:SelectedIndex()]
    local orig_dctex = Squared.GetSetting("texture-offline")
    _ = dctex and orig_dctex ~= dctex and Squared.SetSetting("texture-offline", dctex)
    _ = dctex or W.EditOfflineTex:SelectIndex(texs[orig_dctex])
    
    return
end

function UpdatePanel(self, key, value)

    _ = (not key or key == "boxwidth") and
        W.EditWidth:SetText(towstring(value or Squared.GetSetting("boxwidth")))
    
    _ = (not key or key == "boxheight") and    
        W.EditHeight:SetText(towstring(value or Squared.GetSetting("boxheight")))
        
    _ = (not key or key == "bordersize") and
        W.EditBorder:SetText(towstring(value or Squared.GetSetting("bordersize")))
        
    _ = (not key or key == "texture-border") and
        W.EditBorderTex:SelectIndex(texs[value or Squared.GetSetting("texture-border")])
        
    _ = (not key or key == "texture-background") and
        W.EditBackTex:SelectIndex(texs[value or Squared.GetSetting("texture-background")])
        
    _ = (not key or key == "texture-foreground") and
        W.EditForeTex:SelectIndex(texs[value or Squared.GetSetting("texture-foreground")])
        
    _ = (not key or key == "texture-offline") and
        W.EditOfflineTex:SelectIndex(texs[value or Squared.GetSetting("texture-offline")])
    
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
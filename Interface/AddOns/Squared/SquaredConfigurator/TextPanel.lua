if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Text and Fonts"

local dirs = SquaredConfigurator.directions
local dirNames = SquaredConfigurator.directionNames

local poses = SquaredConfigurator.textaligns
local posNames = SquaredConfigurator.positionNames

local textposes = SquaredConfigurator.textpositions
local textposNames = SquaredConfigurator.textpositionNames

local fonts = SquaredConfigurator.fonts
local fontNames = SquaredConfigurator.fontNames

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 710)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Text and Font Options")
    W.Title = e
    
    -- name position
    e = W("Label")
    e:Resize(200)
    e:Position(20,60)
    e:Align("leftcenter")
    e:SetText(L"Name text position:")
    W.LabelNamePos = e
    
    -- name position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelNamePos, "right", "left", 20, 0)
    for _,pos in ipairs(textposNames) do e:Add(pos) end
    W.EditNamePos = e
    
    -- name length label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelNamePos, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Max name length:")
    W.LabelNameLength = e
    
    -- name length editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelNameLength, "right", "left", 20, 0)
    W.EditNameLength = e
    
	-- career position
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelNameLength, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText(L"Career text position:")
    W.LabelCareerPos = e
    
    -- career position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelCareerPos, "right", "left", 20, 0)
    for _,pos in ipairs(textposNames) do e:Add(pos) end
    W.EditCareerPos = e
	
    -- hp position
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelCareerPos, "bottomleft", "topleft", 0, 20)
    e:Align("leftcenter")
    e:SetText(L"HP text position:")
    W.LabelHpPos = e
    
    -- hp position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelHpPos, "right", "left", 20, 0)
    for _,pos in ipairs(textposNames) do e:Add(pos) end
    W.EditHpPos = e
    
    -- ap position
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelHpPos, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"AP text position:")
    W.LabelApPos = e
    
    -- ap position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelApPos, "right", "left", 20, 0)
    for _,pos in ipairs(textposNames) do e:Add(pos) end
    W.EditApPos = e
    
    -- level position
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelApPos, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Level text position:")
    W.LabelLevelPos = e
    
    -- level position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelLevelPos, "right", "left", 20, 0)
    for _,pos in ipairs(textposNames) do e:Add(pos) end
    W.EditLevelPos = e
    
    -- group position
    e = W("Label")
    e:Resize(220)
    e:AnchorTo(W.LabelLevelPos, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Group# text position:")
    W.LabelGroupPos = e
    
    -- group position combo
    e = W("Combobox")
    e:AnchorTo(W.LabelGroupPos, "right", "left", 0, 0)
    for _,pos in ipairs(textposNames) do e:Add(pos) end
    W.EditGroupPos = e
    
    -- top text align label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelGroupPos, "bottomleft", "topleft", 0, 30)
    e:Align("leftcenter")
    e:SetText(L"Upper text align:")
    W.LabelUpperAlign = e
    
    -- top text align combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelUpperAlign, "right", "left", 20, 0)
    for _,pos in ipairs(posNames) do e:Add(pos) end
    W.EditUpperAlign = e
    
    -- middle text align label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelUpperAlign, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Middle text align:")
    W.LabelMiddleAlign = e
    
    -- middle text align combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelMiddleAlign, "right", "left", 20, 0)
    for _,pos in ipairs(posNames) do e:Add(pos) end
    W.EditMiddleAlign = e
    
    -- bottom text align label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelMiddleAlign, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Lower text align:")
    W.LabelBottomAlign = e
    
    -- bottom text align combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelBottomAlign, "right", "left", 20, 0)
    for _,pos in ipairs(posNames) do e:Add(pos) end
    W.EditBottomAlign = e
    
    -- top text font label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelBottomAlign, "bottomleft", "topleft", 0, 30)
    e:Align("leftcenter")
    e:SetText(L"Upper text font:")
    W.LabelUpperFont = e
    
    -- top text font combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelUpperFont, "right", "left", 20, 0)
    for _,font in ipairs(fontNames) do e:Add(font) end
    W.EditUpperFont = e
    
    -- middle text font label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelUpperFont, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Middle text font:")
    W.LabelMiddleFont = e
    
    -- middle text font combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelMiddleFont, "right", "left", 20, 0)
    for _,font in ipairs(fontNames) do e:Add(font) end
    W.EditMiddleFont = e
    
    -- bottom text font label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelMiddleFont, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Lower text font:")
    W.LabelBottomFont = e
    
    -- bottom text font combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelBottomFont, "right", "left", 20, 0)
    for _,font in ipairs(fontNames) do e:Add(font) end
    W.EditBottomFont = e
    
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

    local namepos = textposes[W.EditNamePos:SelectedIndex()]
    local orig_namepos = Squared.GetSetting("text-position-name")
    _ = namepos and orig_namepos ~= namepos and Squared.SetSetting("text-position-name", namepos)
    
    local namelength = tonumber(W.EditNameLength:GetText())
    local orig_namelength = Squared.GetSetting("namelength")
    _ = namelength and orig_namelength ~= namelength and Squared.SetSetting("namelength", namelength)
    _ = namelength or W.EditNameLength:SetText(towstring(orig_namelength))
    
	local careerpos = textposes[W.EditCareerPos:SelectedIndex()]
    local orig_careerpos = Squared.GetSetting("text-position-career")
    _ = careerpos and orig_careerpos ~= careerpos and Squared.SetSetting("text-position-career", careerpos)
	
    local hppos = textposes[W.EditHpPos:SelectedIndex()]
    local orig_hppos = Squared.GetSetting("text-position-hp")
    _ = hppos and orig_hppos ~= hppos and Squared.SetSetting("text-position-hp", hppos)
    
    local appos = textposes[W.EditApPos:SelectedIndex()]
    local orig_appos = Squared.GetSetting("text-position-ap")
    _ = appos and orig_appos ~= appos and Squared.SetSetting("text-position-ap", appos)
    
    local levelpos = textposes[W.EditLevelPos:SelectedIndex()]
    local orig_levelpos = Squared.GetSetting("text-position-level")
    _ = levelpos and orig_levelpos ~= levelpos and Squared.SetSetting("text-position-level", levelpos)
    
    local grouppos = textposes[W.EditGroupPos:SelectedIndex()]
    local orig_grouppos = Squared.GetSetting("text-position-group")
    _ = grouppos and orig_grouppos ~= grouppos and Squared.SetSetting("text-position-group", grouppos)
    
    local topalign = poses[W.EditUpperAlign:SelectedIndex()]
    local orig_topalign = Squared.GetSetting("text-align-top")
    _ = topalign and orig_topalign ~= topalign and Squared.SetSetting("text-align-top", topalign)
    
    local midalign = poses[W.EditMiddleAlign:SelectedIndex()]
    local orig_midalign = Squared.GetSetting("text-align-center")
    _ = midalign and orig_midalign ~= midalign and Squared.SetSetting("text-align-center", midalign)
    
    local botalign = poses[W.EditBottomAlign:SelectedIndex()]
    local orig_botalign = Squared.GetSetting("text-align-bottom")
    _ = botalign and orig_botalign ~= botalign and Squared.SetSetting("text-align-bottom", botalign)
    
    local topfont = fonts[W.EditUpperFont:SelectedIndex()]
    local orig_topfont = Squared.GetSetting("text-font-top")
    _ = topfont and orig_topfont ~= topfont and Squared.SetSetting("text-font-top", topfont)
    
    local midfont = fonts[W.EditMiddleFont:SelectedIndex()]
    local orig_midfont = Squared.GetSetting("text-font-center")
    _ = midfont and orig_midfont ~= midfont and Squared.SetSetting("text-font-center", midfont)
    
    local botfont = fonts[W.EditBottomFont:SelectedIndex()]
    local orig_botfont = Squared.GetSetting("text-font-bottom")
    _ = botfont and orig_botfont ~= botfont and Squared.SetSetting("text-font-bottom", botfont)
    
    return
end

function UpdatePanel(self, key, value)

    _ = (not key or key == "text-position-name") and
        W.EditNamePos:SelectIndex(textposes[value or Squared.GetSetting("text-position-name")])
        
    _ = (not key or key == "namelength") and
        W.EditNameLength:SetText(towstring(value or Squared.GetSetting("namelength")))
        
	_ = (not key or key == "text-position-career") and
        W.EditCareerPos:SelectIndex(textposes[value or Squared.GetSetting("text-position-career")])
		
    _ = (not key or key == "text-position-hp") and
        W.EditHpPos:SelectIndex(textposes[value or Squared.GetSetting("text-position-hp")])
        
    _ = (not key or key == "text-position-ap") and
        W.EditApPos:SelectIndex(textposes[value or Squared.GetSetting("text-position-ap")])
        
    _ = (not key or key == "text-position-level") and
        W.EditLevelPos:SelectIndex(textposes[value or Squared.GetSetting("text-position-level")])
        
    _ = (not key or key == "text-position-group") and
        W.EditGroupPos:SelectIndex(textposes[value or Squared.GetSetting("text-position-group")])
        
    _ = (not key or key == "text-align-top") and
        W.EditUpperAlign:SelectIndex(poses[value or Squared.GetSetting("text-align-top")])
        
    _ = (not key or key == "text-align-center") and
        W.EditMiddleAlign:SelectIndex(poses[value or Squared.GetSetting("text-align-center")])
        
    _ = (not key or key == "text-align-bottom") and
        W.EditBottomAlign:SelectIndex(poses[value or Squared.GetSetting("text-align-bottom")])
        
    _ = (not key or key == "text-font-top") and
        W.EditUpperFont:SelectIndex(fonts[value or Squared.GetSetting("text-font-top")])
    
    _ = (not key or key == "text-font-center") and
        W.EditMiddleFont:SelectIndex(fonts[value or Squared.GetSetting("text-font-center")])
        
    _ = (not key or key == "text-font-bottom") and
        W.EditBottomFont:SelectIndex(fonts[value or Squared.GetSetting("text-font-bottom")])
    
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
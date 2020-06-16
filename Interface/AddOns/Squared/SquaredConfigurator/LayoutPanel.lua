if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

panel.title = L"Group Layout"

local dirs = SquaredConfigurator.directions
local dirNames = SquaredConfigurator.directionNames

-- Create the panel
function CreatePanel(self)
    -- Do we somehow have a window still around? If so, we're done, that was easy.
    if W and W.name then return W end
    
    W = LibGUI("Blackframe")
    W:Resize(500, 420)
    
    local e
    
    -- Title label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "top", "top", 0, 10)
    e:Font("font_clear_medium_bold")
    e:SetText(L"Group Layout Options")
    W.Title = e
    
    -- group dir label
    e = W("Label")
    e:Resize(200)
    e:Position(20,60)
    e:Align("leftcenter")
    e:SetText(L"Group direction:")
    W.LabelGroupDir = e
    
    -- group dir combo
    e = W("Combobox")
    e:AnchorTo(W.LabelGroupDir, "right", "left", 20, 0)
    for _,dir in ipairs(dirNames) do e:Add(dir) end
    W.EditGroupDir = e
    
    -- group spacing label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelGroupDir, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Group spacing:")
    W.LabelGroupSpace = e
    
    -- group spacing editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelGroupSpace, "right", "left", 20, 0)
    W.EditGroupSpace = e
    
    -- member dir label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelGroupSpace, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Member direction:")
    W.LabelMemberDir = e
    
    -- member dir combo
    e = W("Combobox")
    e:AnchorTo(W.LabelMemberDir, "right", "left", 20, 0)
    for _,dir in ipairs(dirNames) do e:Add(dir) end
    W.EditMemberDir = e
    
    -- member spacing label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelMemberDir, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Member spacing:")
    W.LabelMemberSpace = e
    
    -- member spacing editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelMemberSpace, "right", "left", 20, 0)
    W.EditMemberSpace = e
    
    -- column dir label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelMemberSpace, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Column direction:")
    W.LabelColumnDir = e
    
    -- column dir combo
    e = W("Combobox")
    e:AnchorTo(W.LabelColumnDir, "right", "left", 20, 0)
    for _,dir in ipairs(dirNames) do e:Add(dir) end
    W.EditColumnDir = e
    
    -- column spacing label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelColumnDir, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Column spacing:")
    W.LabelColumnSpace = e
    
    -- column spacing editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelColumnSpace, "right", "left", 20, 0)
    W.EditColumnSpace = e
    
    -- column size label
    e = W("Label")
    e:Resize(200)
    e:AnchorTo(W.LabelColumnSpace, "bottomleft", "topleft", 0, 10)
    e:Align("leftcenter")
    e:SetText(L"Max column length:")
    W.LabelColumnSize = e
    
    -- column size editbox
    e = W("Textbox")
    e:Resize(250)
    e:AnchorTo(W.LabelColumnSize, "right", "left", 20, 0)
    W.EditColumnSize = e
    
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
    
    -- Apply group direction
    local groupdir = dirs[W.EditGroupDir:SelectedIndex()]
    local orig_groupdir = Squared.GetSetting("direction-group")
    _ = groupdir and orig_groupdir ~= groupdir and Squared.SetSetting("direction-group", groupdir)
    _ = groupdir or W.EditGroupDir:SelectIndex(dirs[orig_groupdir])
    
    -- Apply member direction
    local memberdir = dirs[W.EditMemberDir:SelectedIndex()]
    local orig_memberdir = Squared.GetSetting("direction-member")
    _ = memberdir and orig_memberdir ~= memberdir and Squared.SetSetting("direction-member", memberdir)
    _ = memberdir or W.EditMemberDir:SelectIndex(dirs[orig_memberdir])
    
    -- Apply column direction
    local columndir = dirs[W.EditColumnDir:SelectedIndex()]
    local orig_columndir = Squared.GetSetting("direction-column")
    _ = columndir and orig_columndir ~= columndir and Squared.SetSetting("direction-column", columndir)
    _ = columndir or W.EditColumnDir:SelectIndex(dirs[orig_columndir])

    -- Apply group spacing
    local groupspace = tonumber(W.EditGroupSpace:GetText())
    local orig_groupspace = Squared.GetSetting("spacing-group")
    _ = groupspace and orig_groupspace ~= groupspace and Squared.SetSetting("spacing-group", groupspace)
    _ = groupspace or W.EditGroupSpace:SetText(towstring(orig_groupspace))
    
    -- Apply member spacing
    local memberspace = tonumber(W.EditMemberSpace:GetText())
    local orig_memberspace = Squared.GetSetting("spacing-member")
    _ = memberspace and orig_memberspace ~= memberspace and Squared.SetSetting("spacing-member", memberspace)
    _ = memberspace or W.EditMemberSpace:SetText(towstring(orig_memberspace))
    
    -- Apply column spacing
    local columnspace = tonumber(W.EditColumnSpace:GetText())
    local orig_columnspace = Squared.GetSetting("spacing-column")
    _ = columnspace and orig_columnspace ~= columnspace and Squared.SetSetting("spacing-column", columnspace)
    _ = columnspace or W.EditColumnSpace:SetText(towstring(orig_columnspace))
    
    -- Apply column size
    local columnsize = tonumber(W.EditColumnSize:GetText())
    local orig_columnsize = Squared.GetSetting("columnsize")
    _ = columnsize and orig_columnsize ~= columnsize and Squared.SetSetting("columnsize", columnsize)
    _ = columnsize or W.EditColumnSize:SetText(towstring(orig_columnsize))

    return
end

function UpdatePanel(self, key, value)

    _ = (not key or key == "direction-group") and
        W.EditGroupDir:SelectIndex(dirs[value or Squared.GetSetting("direction-group")])
    
    _ = (not key or key == "direction-member") and    
        W.EditMemberDir:SelectIndex(dirs[value or Squared.GetSetting("direction-member")])
        
    _ = (not key or key == "direction-column") and    
        W.EditColumnDir:SelectIndex(dirs[value or Squared.GetSetting("direction-column")])

    _ = (not key or key == "spacing-group") and
        W.EditGroupSpace:SetText(towstring(value or Squared.GetSetting("spacing-group")))

    _ = (not key or key == "spacing-member") and
        W.EditMemberSpace:SetText(towstring(value or Squared.GetSetting("spacing-member")))
        
    _ = (not key or key == "spacing-column") and
        W.EditColumnSpace:SetText(towstring(value or Squared.GetSetting("spacing-column")))
        
    _ = (not key or key == "columnsize") and
        W.EditColumnSize:SetText(towstring(value or Squared.GetSetting("columnsize")))
        
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
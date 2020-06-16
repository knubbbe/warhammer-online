if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel
local panel = {}

-- Our panel window
local W

panel.title = L"Import/Export"

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
    e:SetText(L"Import/Export Settings")
    W.Title = e
    
    -- Reset button
    e = W("Button")
    e:Resize(200)
    e:SetText(L"Open Import/Export")
    e:AnchorTo(W, "center", "center", 0, 0)
    e.OnLButtonUp = function() Squared.OpenImportExport() end
    W.ButtonReset = e
    
    return W
end

function UpdatePanel(self, key, value)
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
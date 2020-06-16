if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

-- Our panel window
local W

local oClass = nil

panel.title = L"Class Types"

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
    e:SetText(L"Class Color/Type Assignments")
    W.Title = e
    
    -- Class select label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W.Title, "bottom", "top", 00, 30)
    e:SetText(L"Class:")
    W.LabelSelectClass = e
    
    -- Class select combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelSelectClass, "bottom", "top", 0, 0)
    W.EditSelectClass = e
    
    -- Colorgroup select label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W.EditSelectClass, "bottom", "top", 0, 10)
    e:SetText(L"Assigned to colorgroup:")
    W.LabelSelectCG = e
    
    -- Colorgroup select combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelSelectCG, "bottom", "top", 0, 0)
    W.EditSelectCG = e
    
    
    -- Apply button
    e = W("Button")
    e:Resize(200)
    e:SetText(L"Apply This Type")
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
    
    local cClass = W.EditSelectClass:Selected()
    local cGroup = W.EditSelectCG:Selected()
    
    if not cClass or not cGroup then return end
    
    cClass = WStringToString(cClass)
    cGroup = WStringToString(cGroup)
    
    if not cClass or not cGroup then return end
    
    Squared.SetSetting("colortype-"..cClass, cGroup)
    
    return
end

function UpdatePanel(self, key, value)
    
    local seen = {}
    local flaggedForDeletion = nil
    local newlyUpdated = nil
    
    if key and key:sub(1,11) == "colorgroup-" then
        if value then
            local colorgroup = key:sub(12)
            seen[colorgroup] = true
        else
            flaggedForDeletion = key
        end
    elseif key and key:sub(1,10) == "colortype-" then
        if value then
            newlyUpdated = key:sub(11)
        end
    end
    
    W.EditSelectCG:Clear()
    for k,v in pairs(Squared.Settings) do
        if k ~= flaggedForDeletion then
            if k:sub(1,11) == "colorgroup-" then
                local colorgroup = k:sub(12)
                seen[colorgroup] = true
            end
        end
    end
    
    for k,v in pairs(Squared.Defaults) do
        if k:sub(1,11) == "colorgroup-" then
            local colorgroup = k:sub(12)
            seen[colorgroup] = true
        end
    end
    
    local sortedseen = {}
    for k,v in pairs(seen) do
        table.insert(sortedseen, k)
    end
    table.sort(sortedseen)
    
    for _,v in ipairs(sortedseen) do
        W.EditSelectCG:Add(v)
    end
    
    if #sortedseen > 0 then
        W.EditSelectCG:SelectIndex(1)
    end
    
    -- now initialize types box
    seen = {}
    
    W.EditSelectClass:Clear()
    for k,v in pairs(Squared.Settings) do
        if k:sub(1,10) == "colortype-" then
            local colortype = k:sub(11)
            seen[colortype] = true
        end
    end
    
    for k,v in pairs(Squared.Defaults) do
        if k:sub(1,10) == "colortype-" then
            local colortype = k:sub(11)
            seen[colortype] = true
        end
    end
    
    sortedseen = {}
    for k,v in pairs(seen) do
        table.insert(sortedseen, k)
    end
    table.sort(sortedseen)
    
    for _,v in ipairs(sortedseen) do
        W.EditSelectClass:Add(v)
    end
    
    if #sortedseen > 0 then
        W.EditSelectClass:SelectIndex(1)
        local group = Squared.GetSetting("colortype-"..sortedseen[1])
        if sortedseen[1] == newlyUpdated then group = value end
        if group then
            W.EditSelectCG:Select(group)
        end
    end
    
    return
end

function SquaredConfiguratorClassTypeUpdate()
    if not (SquaredConfigurator.ActivePanel == panel.id) then return end
    
    local cClass = W.EditSelectClass:Selected()
    if cClass ~= nil and cClass ~= oClass then
        oClass = cClass
        cClass = WStringToString(cClass)
        local group = Squared.GetSetting("colortype-"..cClass)
        if group then
            W.EditSelectCG:Select(group)
        end
    end
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
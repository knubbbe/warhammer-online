if not SquaredConfigurator then return end
local LibGUI = LibStub("LibGUI")
local CreatePanel, UpdatePanel, ApplyPanel
local panel = {}

local NewProfile, DelProfile

-- Our panel window
local W

panel.title = L"Profiles"

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
    e:SetText(L"Profile Management")
    W.Title = e
    
    -- Profile select label
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W.Title, "bottom", "top", 0, 50)
    e:SetText(L"Select a profile:")
    W.LabelSelectProfile = e
    
    -- Profile select combobox
    e = W("Combobox")
    e:AnchorTo(W.LabelSelectProfile, "bottom", "top", -50, 10)
    W.EditSelectProfile = e
    
    -- Delete button
    e = W("Button")
    e:Resize(100)
    e:AnchorTo(W.EditSelectProfile, "right", "left", 10, 0)
    e:SetText("Delete")
    e.OnLButtonUp = function() DelProfile() end
    W.ButtonDelete = e
    
    -- Add profile textbox
    e = W("Textbox")
    e:Resize(200)
    e:AnchorTo(W.EditSelectProfile, "bottom", "top", 25, 50)
    W.EditNewProfile = e
    
    e = W("Label")
    e:Resize(130)
    e:AnchorTo(W.EditNewProfile, "left", "right", -10, 0)
    e:SetText(L"Copy:")
    e:Align("rightcenter")
    W.LabelNewProfile = e
    
    e = W("Button")
    e:Resize(100)
    e:AnchorTo(W.EditNewProfile, "right", "left", 10, 0)
    e:SetText(L"Create")
    e.OnLButtonUp = function() NewProfile() end
    W.ButtonNewProfile = e
    
    -- Reminder note
    e = W("Label")
    e:Resize(480)
    e:AnchorTo(W, "bottom", "bottom", 0, -65)
    e:SetText("Don't forget to hit Apply to change profile!")
    W.LabelReminder = e
    
    -- Apply button
    e = W("Button")
    e:Resize(200)
    e:SetText(L"Apply Profile")
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

function NewProfile()
    local newProfile = W.EditNewProfile:GetText()
    if not newProfile then return end
	
	local profile = W.EditSelectProfile:Selected()
    if not profile then return end
	
	local id = Squared.AddProfile(newProfile, profile)
    Squared.ActivateProfile(id)
	
    W.EditNewProfile:SetText(L"")
    
	UpdatePanel()
	
    return
end

function DelProfile()
    local profile = W.EditSelectProfile:Selected()
    if not profile then return end
    
	Squared.DeleteProfile(profile)
	
	UpdatePanel()
	
    return
end

function ApplyPanel()
    
    local profile = W.EditSelectProfile:Selected()
    if not profile then return end
    
	Squared.ActivateProfile(profile)
	
	UpdatePanel()
    
    return
end

function UpdatePanel(self, key, value)
    
	-- This panel doesn't deal with regular settings, so if it's a normal setting update, ignore it
	if key then return end
	
    W.EditSelectProfile:Clear()
	local populated = false
    for k,v in pairs(Squared.GetProfileList()) do
        W.EditSelectProfile:Add(v)
		populated = true
    end
    
    if populated then
        W.EditSelectProfile:SelectIndex( (Squared.GetCurrentProfile()) )
    end
    
    return
end

-- Actually add the panel
panel.create = CreatePanel
panel.update = UpdatePanel
panel.id = SquaredConfigurator.AddPanel(panel)
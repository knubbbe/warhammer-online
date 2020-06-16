SquaredConfigurator = {}

local LibGUI = LibStub("LibGUI")

-- Our main window object
local W

-- cache panel windows after they've been created for the first time
local PanelCache = {}
local buttonPage = 1
local pageSize = 8

SquaredConfigurator.Panels = {}

local function SwapPage(page)
    if page < 1 then return end
    if page > math.ceil(#W.Container.Buttons / pageSize) then return end
    
    buttonPage = page
    
    for k,v in ipairs(W.Container.Buttons) do
        if k <= (page-1)*pageSize then
            W.Container.Buttons[k]:Hide()
        elseif k > (page)*pageSize then
            W.Container.Buttons[k]:Hide()
        else
            W.Container.Buttons[k]:Show()
        end
    end
    
    if page <= 1 then
        W.Container.PrevButton:Disable()
    else
        W.Container.PrevButton:Enable()
    end
    
    if page >= math.ceil(#W.Container.Buttons / pageSize) then
        W.Container.NextButton:Disable()
    else
        W.Container.NextButton:Enable()
    end
end

function SquaredConfigurator.SettingChanged(key, value)
    local active = SquaredConfigurator.ActivePanel
    if active then
        SquaredConfigurator.Panels[active]:update(key, value)
    end
end

function SquaredConfigurator.AddPanel(panelTable)
    table.insert(SquaredConfigurator.Panels, panelTable)
    return #SquaredConfigurator.Panels
end

function SquaredConfigurator.TogglePanel(panel)
    local Panels = SquaredConfigurator.Panels
    
    -- If we've never loaded this panel before, create its window
    if not PanelCache[panel] then
        PanelCache[panel] = Panels[panel]:create()
        -- don't use the LibGUI versions of these to make it easier if someone wants to use a non-LibGUI window as a panel
        -- (but they'll still have to return a table with .name, :Show(), and :Hide() for it to be properly handled)
        if PanelCache[panel] and PanelCache[panel].name then
            WindowClearAnchors(PanelCache[panel].name)
            WindowAddAnchor(PanelCache[panel].name, "left", W.name, "right", 5, 0)
            WindowSetPopable(PanelCache[panel].name, true)
        end
    end
    
    if SquaredConfigurator.ActivePanel and PanelCache[SquaredConfigurator.ActivePanel] then
        PanelCache[SquaredConfigurator.ActivePanel]:Hide()
        if SquaredConfigurator.ActivePanel == panel then
            SquaredConfigurator.ActivePanel = nil
            return
        end
    end
    
    SquaredConfigurator.ActivePanel = panel
    Panels[panel]:update()
    if PanelCache[panel] then
        PanelCache[panel]:Show()
    end
    
end

function SquaredConfigurator.Show(panel)
    -- We wait until the main menu is first shown to actually construct it - this gives other plugins time
    -- to register their own panels, if they want.
    if not W then
        SquaredConfigurator.BuildMainMenu()
    end
    
    W:Show()
    if panel then
        for k,p in ipairs(SquaredConfigurator.Panels) do
            if p.title == panel or k == panel then
                SquaredConfigurator.TogglePanel(k)
                SwapPage( math.ceil(k / pageSize) )
            end
        end
    end
end

function SquaredConfigurator.Hide()
	if SquaredConfigurator.ActivePanel and PanelCache[SquaredConfigurator.ActivePanel] then
		PanelCache[SquaredConfigurator.ActivePanel]:Hide()
	end
	SquaredConfigurator.ActivePanel = nil
	W:Hide()
end

function SquaredConfigurator.Toggle()
	if W and W.name and WindowGetShowing(W.name) then
		SquaredConfigurator.Hide()
	else
		SquaredConfigurator.Show()
	end
end

function SquaredConfigurator.BuildMainMenu()
    if W and W.name and DoesWindowExist(W.name) then
        d("Attempt to create second instance of main menu ignored.")
        return
    end
    
    local Panels = SquaredConfigurator.Panels
    
    W = LibGUI("Blackframe", "SquaredConfiguratorMain")
    W:MakeMovable()
    W:Popable(false)
    W:Resize(300, 300)
    W:AnchorTo("Root", "right", "right", -200, -100)
    
    W.Title = W("Label")
    W.Title:Resize(250)
    W.Title:AnchorTo(W, "top", "top", 0, 10)
    W.Title:Font("font_clear_large_bold")
    W.Title:SetText(L"Squared")
    W.Title:Align("center")
    W.Title:IgnoreInput()
    
    W.TitleSub = W("Label")
    W.TitleSub:Resize(250)
    W.TitleSub:AnchorTo(W.Title, "bottom", "top", 0, -4)
    W.TitleSub:Font("font_clear_default")
    W.TitleSub:SetText(L"configurator")
    W.TitleSub:Align("top")
    W.TitleSub:IgnoreInput()
    
    W.Container = W("Window")
    W.Container:Resize(230, math.min(#Panels+1, pageSize+1) * 45)
    W.Container:AnchorTo(W.Title, "bottom", "top", 0, 20)
    
    -- Set up panel buttons
    W.Container.Buttons = {}
    for k,p in ipairs(Panels) do
        local B = W.Container("Button")
        B:Resize(230)
        B:SetText(p.title)
        B.OnLButtonUp = function() SquaredConfigurator.TogglePanel(k) end
        if (((k-1) % pageSize) + 1) == 1 then
            B:AnchorTo(W.Container, "topleft", "topleft", 0, 2)
        else
            B:AnchorTo(W.Container.Buttons[k-1], "bottomleft", "topleft", 0, 4)
        end
        W.Container.Buttons[k] = B
    end
    
    -- Add the "next"/"prev" panel buttons
    W.Container.PrevButton = W.Container("Button")
    W.Container.PrevButton:Resize(115)
    W.Container.PrevButton:AnchorTo(W.Container, "bottomleft", "bottomleft")
    W.Container.PrevButton:SetText(L"<< More")
    W.Container.PrevButton.OnLButtonUp =
        function()
            if W.Container.PrevButton:Enabled() then
                SwapPage(buttonPage-1)
            end
        end
    
    W.Container.NextButton = W.Container("Button")
    W.Container.NextButton:Resize(115)
    W.Container.NextButton:AnchorTo(W.Container, "bottomright", "bottomright")
    W.Container.NextButton:SetText(L"More >>")
    W.Container.NextButton.OnLButtonUp =
        function()
            if W.Container.NextButton:Enabled() then
                SwapPage(buttonPage+1)
            end
        end
        
    SwapPage(1)
    
    -- Finally, make the main window's height actually properly fit the container, whatever size it is.
    W:Resize(300, W.Container.height+111)
	
	W.VersionLabel = W("Label")
    W.VersionLabel:Resize(250)
    W.VersionLabel:AnchorTo(W, "bottom", "bottom", 0, -5)
    W.VersionLabel:Font("font_clear_default")
    W.VersionLabel:Align("top")
    W.VersionLabel:IgnoreInput()
	local version = Squared.GetSetting("version")
	local vtext = wstring.format(L"v%d.%d.%d", version.MAJOR, version.MINOR, version.REV)
	if Squared.Build and Squared.Build ~= (L"@"..L"project-revision@") then
		vtext = vtext..L" Build "..towstring(Squared.Build)
	end
	W.VersionLabel:SetText(vtext)
	
    
    -- Add a close button
    W.CloseButton = W("Closebutton")
    W.CloseButton.OnLButtonUp =
        function()
            SquaredConfigurator.Hide()
        end
    
end

function SquaredConfigurator.Initialize()
    -- Sanity check, we have LibGUI right?
    if not LibGUI then
        EA_ChatWindow.Print(L"SquaredConfigurator failed to load a working instance of LibGUI and thus is unable to run.")
        return
    end
    
    Squared.RegisterEventHandler("setsetting", SquaredConfigurator.SettingChanged)
end
----------------------------------------------------------------
-- Chatty Cathy
--
--  Chatty Cathy is a chat addon that improves the default chat windows by removing clutter and inefficiencies.
--   To accomplish this, CC will hide all unneeded boxes such as tabs, social menu, and resize buttons for all active windows until they are needed.
--   CC will also maximize the displayed text in the chat window itself by expanding the text display region to fill the entire chat window with no wasted space.
--   CC also allows for the moving or hiding of scrollbars on each window.  CC improves upon the entry box by allowing the user to place it where they want or anchor it to the top/bottom of any chat window.
--   The text entry box is improved with a simple flat black background as opposed to the unsightly gray bordered box.
--
--  To use CC, typing '/ChattyCathy' will bring up the options window to customize how CC works.
--  Using '/ChattyCathy Show' will reshow the hidden components of the chat windows. They will be hidden the next time you open the text entry box for typing.
--  'ChattyCathy' and 'Show' can be replaced with 'cc' and 's' for short as well.
--
--  Dependencies: LibSlash
--
-- Written By NigelTufnel ( Adam.Dew@gmail.com )
----------------------------------------------------------------

----------------------------------------------------------------
-- Global Variables
----------------------------------------------------------------

ChattyCathy = {}

ChattyCathyVars = {}
ChattyCathyTabs = {}

----------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------

local SCROLLBAR_LEFT = 1
local SCROLLBAR_RIGHT = 2
local SCROLLBAR_HIDDEN = 3

local newWindowHook, removeTabHook
local CC_Set, CC_SetTabs, CC_SetWindow, CC_NewWindow, CC_RemoveTab, CC_ModelWindow, CC_FreeTextBox
local CCShowing = false

----------------------------------------------------------------
-- ChattyCathy Functions
----------------------------------------------------------------

function ChattyCathy.Init()

	-- Setup Slash Command
	LibSlash.RegisterSlashCmd("cc", function(input) ChattyCathy.Slash(input) end)
	LibSlash.RegisterSlashCmd("chattycathy", function(input) ChattyCathy.Slash(input) end)
	
	-- Make the movable text entry box window
    CreateWindow("TextEntry", true)  
    LayoutEditor.RegisterWindow( "TextEntry", L"Text Enter Box", "Text", false, false, true, nil )
	WindowSetShowing("TextEntry", false)

	-- Free the text box
	CC_FreeTextBox()
	
	-- Register our entry box hiding/showing based events
	RegisterEventHandler(SystemData.Events.BEGIN_ENTER_CHAT, "ChattyCathy.Check")
	RegisterEventHandler(SystemData.Events.CHAT_REPLY, "ChattyCathy.Check")
	RegisterEventHandler(SystemData.Events.ENTER_KEY_PROCESSED, "ChattyCathy.ChatOut")
	RegisterEventHandler(SystemData.Events.ESCAPE_KEY_PROCESSED, "ChattyCathy.ChatOut")
	
	-- Setup the options window
	CreateWindow("ChattyCathyOpt", true)
	if ChattyCathyVars.Alpha == nil then
		EA_ChatWindow.Print(ChattyCathyVars.Window)
		ChattyCathyVars.Alpha = .75
		ChattyCathyVars.Window = 1
		ChattyCathyVars.To = 1
		WindowSetShowing("ChattyCathyOpt", true)
	else
		WindowSetShowing("ChattyCathyOpt", false)
	end
	CC_ModelWindow()
	ChattyCathy.ApplyOptions()
	
	-- Hide chat box and unused stuff
	ChattyCathy.ChatOut()
	ChattyCathy.Hide()
	
	-- Initiate the settings for the tabs
	for window, state in pairs(ChattyCathyTabs) do
		CC_SetTabs(window, ChattyCathyTabs[window])
	end
	
	-- Hook the 2 functions to update options window live on window changes
	newWindowHook = EA_ChatTabManager.MoveTabToNewWndGroup
	EA_ChatTabManager.MoveTabToNewWndGroup = CC_NewWindow
	removeTabHook = EA_ChatWindow.RemoveTabFromWndGroup
	EA_ChatWindow.RemoveTabFromWndGroup = CC_RemoveTab
end

-- Slash command handler
function ChattyCathy.Slash(input)
	if input == "" then
		ChattyCathy.ShowOptions()
		return
	end
	input = string.lower(input)
	-- Show (S) will work to show the hidden features
	if input == "s" or input =="show" then
		ChattyCathy.Show()
		return
	end
end

-- Apply options and close the option menu
function ChattyCathy.SaveOptions()
	WindowSetShowing("ChattyCathyOpt", false)
	ChattyCathy.ApplyOptions()
	ChattyCathy.Hide()
	for window, state in pairs(ChattyCathyTabs) do
		CC_SetTabs(window, ChattyCathyTabs[window])
	end
end

-- Apply the settings changed and save them to variables
function ChattyCathy.ApplyOptions()
	
	-- Set the scroll bar settings for each active window
	for group,groupTable in pairs(EA_ChatWindow.Settings.WindowGroups) do
		ChattyCathyVars[group] = ComboBoxGetSelectedMenuItem("ChattyCathyGroup" .. group .. "Combo")
		ChattyCathyTabs[group] = ComboBoxGetSelectedMenuItem("ChattyCathyGroup" .. group .. "TabCombo")
	end
	
	-- Save variables
	ChattyCathyVars.To = ComboBoxGetSelectedMenuItem("ChattyCathyOptToCombo")
	ChattyCathyVars.Window = ComboBoxGetSelectedMenuItem("ChattyCathyOptWindowCombo")
	ChattyCathyVars.Alpha = SliderBarGetCurrentPosition("ChattyCathyOptAlphaSlider")
	
	-- Apply window state
	for window, state in pairs(ChattyCathyVars) do
		if window ~= "To" and window ~= "Window" and window ~= "Alpha" then
			CC_SetWindow(window, state)
		end
	end
	
	-- Free up the text entry
	WindowClearAnchors("EA_TextEntryGroup")
	
	-- If we dont want to fix to a window then achor it to the free moving box
	if ChattyCathyVars.Window == 1 then
		WindowAddAnchor("EA_TextEntryGroup", "topleft", "TextEntry", "topleft", 0, 0)
		WindowAddAnchor("EA_TextEntryGroup", "topright", "TextEntry", "topright", 0, 0)
	-- Fix it to its proper box on top/bottom
	else
		if ChattyCathyVars.To == 1 then
			WindowAddAnchor("EA_TextEntryGroup", "topleft", "EA_ChatWindowGroup" .. tostring(ChattyCathyVars.Window - 1) .. "Foreground", "bottomleft", 0, 0)
			WindowAddAnchor("EA_TextEntryGroup", "topright", "EA_ChatWindowGroup" .. tostring(ChattyCathyVars.Window - 1) .. "Foreground", "bottomright", 0, 0)
		else
			WindowAddAnchor("EA_TextEntryGroup", "bottomleft", "EA_ChatWindowGroup" .. tostring(ChattyCathyVars.Window - 1) .. "Foreground", "topleft", 0, 0)
			WindowAddAnchor("EA_TextEntryGroup", "bottomright", "EA_ChatWindowGroup" .. tostring(ChattyCathyVars.Window - 1) .. "Foreground", "topright", 0, 0)
		end
	end
	
	-- Set all the tabs to proper status on application of settings.
	for window, state in pairs(ChattyCathyTabs) do
		CC_SetTabs(window, ChattyCathyTabs[window])
	end
end

-- Clear out what user changed in the option menu
function ChattyCathy.CancelOptions()
	WindowSetShowing("ChattyCathyOpt", false)
	for group,groupTable in pairs(EA_ChatWindow.Settings.WindowGroups) do
		ComboBoxSetSelectedMenuItem("ChattyCathyGroup" .. group .. "Combo", ChattyCathyVars[group] )
	end
	if ChattyCathyVars.Window ~= nil then
		ComboBoxSetSelectedMenuItem("ChattyCathyOptWindowCombo", ChattyCathyVars.Window )
	end
	if ChattyCathyVars.To ~= nil then
		ComboBoxSetSelectedMenuItem("ChattyCathyOptToCombo", ChattyCathyVars.To )
	end
	ChattyCathy.Hide()
	SliderBarSetCurrentPosition("ChattyCathyOptAlphaSlider", ChattyCathyVars.Alpha)
end

-- Update the setup for the Entry Box
function ChattyCathy.UpdateEntrySetup()
	-- Show that no relative point can be set without anchored window
	if ComboBoxGetSelectedMenuItem("ChattyCathyOptWindowCombo") == 1 then
		ComboBoxClearMenuItems("ChattyCathyOptToCombo")
		ComboBoxAddMenuItem("ChattyCathyOptToCombo", L"N/A" )
		ComboBoxSetSelectedMenuItem("ChattyCathyOptToCombo", 1 )
	-- Show Top/Bottom options for window anchoring
	elseif ComboBoxGetSelectedText("ChattyCathyOptToCombo") == L"N/A" then
		ComboBoxClearMenuItems("ChattyCathyOptToCombo")
		ComboBoxAddMenuItem("ChattyCathyOptToCombo", L"Top" )
		ComboBoxAddMenuItem("ChattyCathyOptToCombo", L"Bottom" )
		ComboBoxSetSelectedMenuItem("ChattyCathyOptToCombo", 1 )
	end
end

-- As the slider for alpha changes give them a demo of it
function ChattyCathy.OnSlideAlpha()
	WindowStartAlphaAnimation("EA_TextEntryGroupEntryBoxBG", Window.AnimationType.EASE_OUT, WindowGetAlpha("EA_TextEntryGroupEntryBoxBG"), SliderBarGetCurrentPosition("ChattyCathyOptAlphaSlider"), .2, false, 0, 1)
end

-- Show the Option Window
function ChattyCathy.ShowOptions()
	CC_ModelWindow()
	WindowSetShowing("ChattyCathyOpt", true)
	ChattyCathy.Show()
end

-- Hide the bs
function ChattyCathy.Hide()
	CC_Set(false)
	CCShowing = false
end

-- Show the bs
function ChattyCathy.Show()
	CC_Set(true)
	CCShowing = true
end

-- Check if the window should be displayed
function ChattyCathy.Check()
	if CCShowing == true then
		ChattyCathy.Hide()
	end
	WindowSetDimensions("EA_TextEntryGroup", 500,34)
	WindowStartAlphaAnimation("EA_TextEntryGroupEntryBoxBG", Window.AnimationType.EASE_OUT, WindowGetAlpha("EA_TextEntryGroupEntryBoxBG"), ChattyCathyVars.Alpha, .2, false, 0, 1)
	
	--Hide tabs if they lie under the chat window
	if ChattyCathyTabs[ChattyCathyVars.Window - 1] == 1 and ChattyCathyVars.To == 1 then
		CC_SetTabs(ChattyCathyVars.Window - 1, 0)
	end
	
	for window, state in pairs(ChattyCathyTabs) do
		if ChattyCathyTabs[window] == 2 then CC_SetTabs(window, 2) end
	end
end

-- Hide the window when the chat goes out
function ChattyCathy.ChatOut()
	WindowStartAlphaAnimation("EA_TextEntryGroupEntryBoxBG", Window.AnimationType.EASE_OUT, WindowGetAlpha("EA_TextEntryGroupEntryBoxBG"), 0, .02, false, 0, 1)
	WindowSetDimensions("EA_TextEntryGroup", 1,1)
	
	if ChattyCathyVars.Window == nil then return end
	
	if ChattyCathyTabs[ChattyCathyVars.Window - 1] == 1 and ChattyCathyVars.To == 1 then
		CC_SetTabs(ChattyCathyVars.Window - 1, 1)
	end
end

----------------------------------------------------------------
-- Local/Utility Functions
----------------------------------------------------------------

-- Create the setup window
function CC_ModelWindow()

	-- Setup the content of labels and other gui factors
	LabelSetText("ChattyCathyOptTitle", L" ChattyCathy Options")
	LabelSetText("ChattyCathyOptScrollInfo", L"Scrollbar and Tab Setup")
	LabelSetText("ChattyCathyOptEntryInfo", L"Text Entry Box Setup")
	LabelSetText("ChattyCathyOptScrollSet", L"Scrollbar Posistion")
	LabelSetText("ChattyCathyOptTabSet", L"Tab Visibility")
	LabelSetText("ChattyCathyOptAlpha", L" Opacity: ")
	LabelSetText("ChattyCathyOptWindow", L" Anchor To:")
	LabelSetText("ChattyCathyOptTo", L" To The:")
	ButtonSetText("ChattyCathyOptSave", L"Save")
	ButtonSetText("ChattyCathyOptApply", L"Apply")
	ButtonSetText("ChattyCathyOptCancel", L"Cancel")
	
	ComboBoxClearMenuItems("ChattyCathyOptToCombo")
	ComboBoxAddMenuItem("ChattyCathyOptToCombo", L"Top" )
	ComboBoxAddMenuItem("ChattyCathyOptToCombo", L"Bottom" )
	ComboBoxClearMenuItems("ChattyCathyOptWindowCombo")
	ComboBoxAddMenuItem("ChattyCathyOptWindowCombo", L"Nothing" )
	
	local totalGroups = 0
	for group,groupTable in pairs(EA_ChatWindowGroups) do
		if groupTable.used == false then break end
		totalGroups = totalGroups + 1
		if DoesWindowExist("ChattyCathyGroup" .. group) == false then
			CreateWindowFromTemplate("ChattyCathyGroup" .. group, "CCBoxTemplate", "ChattyCathyOpt")
			WindowClearAnchors("ChattyCathyGroup" .. group)
			WindowAddAnchor("ChattyCathyGroup" .. group, "topleft", "ChattyCathyOpt", "topleft", 0, 65 + group * 35)
		end
		LabelSetText("ChattyCathyGroup" .. group .. "Text", towstring(group .. ": ") .. groupTable.Tabs[groupTable.activeTab].tabText)
		
		--Setup Window Group combo box for scrollbar state
		ComboBoxClearMenuItems("ChattyCathyGroup" .. group .. "Combo")
		ComboBoxAddMenuItem("ChattyCathyGroup" .. group .. "Combo", L"Left" )
		ComboBoxAddMenuItem("ChattyCathyGroup" .. group .. "Combo", L"Right" )
		ComboBoxAddMenuItem("ChattyCathyGroup" .. group .. "Combo", L"Hidden" )
		ComboBoxClearMenuItems("ChattyCathyGroup" .. group .. "TabCombo")
		ComboBoxAddMenuItem("ChattyCathyGroup" .. group .. "TabCombo", L"Show" )
		ComboBoxAddMenuItem("ChattyCathyGroup" .. group .. "TabCombo", L"Hide" )
		if ChattyCathyVars[group] == nil then
			ChattyCathyVars[group] = 3
		end
		if ChattyCathyTabs[group] == nil or ChattyCathyTabs[group] == 0 then
			ChattyCathyTabs[group] = 2
		end
		ComboBoxSetSelectedMenuItem("ChattyCathyGroup" .. group .. "TabCombo", ChattyCathyTabs[group] )
		ComboBoxSetSelectedMenuItem("ChattyCathyGroup" .. group .. "Combo", ChattyCathyVars[group] )
		
		-- Add this window as a possible anchor for the text entry box
		ComboBoxAddMenuItem("ChattyCathyOptWindowCombo", L"Window " .. group )
	end
	
	-- Clear out unused windows
	local curGroup = totalGroups + 1
	while DoesWindowExist("ChattyCathyGroup" .. curGroup) do
		DestroyWindow("ChattyCathyGroup" .. curGroup)
		curGroup = curGroup + 1
	end
	
	-- Bind the border around the potentially new contents
	WindowClearAnchors("ChattyCathyOptScrollSetupBorder")
	WindowAddAnchor("ChattyCathyOptScrollSetupBorder", "topleft", "ChattyCathyGroup1Text", "topleft", -13, -43)
	WindowAddAnchor("ChattyCathyOptScrollSetupBorder", "bottomright", "ChattyCathyGroup" .. totalGroups .. "TabCombo", "bottomright", 6, 10)
	
	-- Some restoring forces here for invalid/unset variables
	if ChattyCathyVars.Window == nil or ChattyCathyVars.Window == 0 then
		ChattyCathyVars.Window = 1
	end
	if ChattyCathyVars.Window > 1 and EA_ChatWindowGroups[ChattyCathyVars.Window - 1].used == false then
		ChattyCathyVars.Window = 1
	end
	if ChattyCathyVars.To == nil or ChattyCathyVars.To == 0 then
		ChattyCathyVars.To = 1
	end
	
	-- Load saved values into the window
	SliderBarSetCurrentPosition("ChattyCathyOptAlphaSlider", ChattyCathyVars.Alpha)
	ComboBoxSetSelectedMenuItem("ChattyCathyOptWindowCombo", ChattyCathyVars.Window )
	ComboBoxSetSelectedMenuItem("ChattyCathyOptToCombo", ChattyCathyVars.To )
	
	-- Scale window to its new contents
	WindowSetDimensions("ChattyCathyOpt", 455, totalGroups * 35 + 325)
	WindowSetDimensions("ChattyCathyOptBackground", 455, totalGroups * 35 + 295)
	
	ChattyCathy.UpdateEntrySetup()
end

-- Hook for new chat windows being made
function CC_NewWindow(...)
	newWindowHook(...)
	if not WindowGetShowing("ChattyCathyOpt") then return end
	CC_ModelWindow()
end

-- Hook for tabs being removed
function CC_RemoveTab(...)
	removeTabHook(...)
	
	if not WindowGetShowing("ChattyCathyOpt") then return end
	
	-- Store what window to be sure we dont need to reset the entry box
	local oldWindow = ChattyCathyVars.Window
	
	-- Remake the options window
	CC_ModelWindow()
	
	-- If we had no changes bail now
	if oldWindow == ChattyCathyVars.Window then return end
	
	-- If window got removed then reset entry box
	WindowClearAnchors("EA_TextEntryGroup")
	WindowAddAnchor("EA_TextEntryGroup", "topleft", "TextEntry", "topleft", 0, 0)
	WindowAddAnchor("EA_TextEntryGroup", "topright", "TextEntry", "topright", 0, 0)
	
end

-- Clear the text entry box out from its anchors
function CC_FreeTextBox()

	WindowClearAnchors("EA_ChatWindowGroup1Foreground") -- free the group 1 from the text box and re-anchor it
	WindowAddAnchor( "EA_ChatWindowGroup1Foreground", "bottomright", "EA_ChatWindowGroup1CycleRightButton", "topright", 0, 0 )
    WindowAddAnchor( "EA_ChatWindowGroup1Foreground", "bottomleft", "EA_ChatWindowGroup1", "bottomleft", 0, 0 )
	
	 -- free text group
	WindowClearAnchors("EA_TextEntryGroup")
	
	 -- reassociate entry box to fill entire text box
	WindowClearAnchors("EA_TextEntryGroupEntryBox")
	WindowAddAnchor( "EA_TextEntryGroupEntryBox", "topleft", "EA_TextEntryGroup", "topleft", 0, 0 )
	WindowAddAnchor( "EA_TextEntryGroupEntryBox", "topright", "EA_TextEntryGroup", "topright", 0, 0 )
	
	-- hide channel button
	WindowSetShowing("EA_TextEntryGroupChannelButton", false)
	
	-- blackify the lame ass text entry box to remove its grey border
	WindowSetTintColor("EA_TextEntryGroupEntryBoxBG", 0, 0, 0) 
	WindowSetAlpha("EA_TextEntryGroup", 1)
	WindowSetAlpha("EA_TextEntryGroupEntryBox", 1)
	
end

-- Sets visibility of usually hidden elements
function CC_Set(state)
	for group,groupTable in pairs(EA_ChatWindow.Settings.WindowGroups) do
		WindowSetShowing("EA_ChatWindowGroup" .. group .. "ResizeButton", state)
	end
	WindowSetShowing("ChatWindowSocialWindowButton", state)
	for tab,tabTable in pairs(EA_ChatTabManager.Tabs) do
		if tabTable.used == true then
			if state == true then
				WindowSetShowing(tabTable.name .. "Background", true)
				WindowSetShowing(tabTable.name .. "Button", true)
				WindowStartAlphaAnimation(tabTable.name .. "Background", Window.AnimationType.EASE_OUT, WindowGetAlpha(tabTable.name .. "Background"), EA_ChatWindow.Settings.WindowGroups[tabTable.wndGroupId].maxAlpha, .2, false, 0, 1)
				WindowStartAlphaAnimation(tabTable.name .. "Button", Window.AnimationType.EASE_OUT,  WindowGetAlpha(tabTable.name .. "Button"), 1, .2, false, 0, 1)
			else
				WindowSetAlpha(tabTable.name .. "Background", 0)
				WindowSetAlpha(tabTable.name .. "Button", 0)
				WindowSetShowing(tabTable.name .. "Background", false)
				WindowSetShowing(tabTable.name .. "Button", false)
			end
		end
	end
end 

-- Sets the tabs to be hidden/shown for a particular window
function CC_SetTabs(WindowId, state)
	for tab,tabTable in pairs(EA_ChatTabManager.Tabs) do
		if tabTable.wndGroupId == WindowId then
			if state == 1 then
				WindowSetShowing(tabTable.name .. "Background", true)
				WindowSetShowing(tabTable.name .. "Button", true)
				WindowStartAlphaAnimation(tabTable.name .. "Background", Window.AnimationType.EASE_OUT, WindowGetAlpha(tabTable.name .. "Background"), EA_ChatWindow.Settings.WindowGroups[tabTable.wndGroupId].maxAlpha, .2, false, 0, 1)
				WindowStartAlphaAnimation(tabTable.name .. "Button", Window.AnimationType.EASE_OUT,  WindowGetAlpha(tabTable.name .. "Button"), 1, .2, false, 0, 1)
			else
				WindowSetAlpha(tabTable.name .. "Background", 0)
				WindowSetAlpha(tabTable.name .. "Button", 0)
				WindowSetShowing(tabTable.name .. "Background", false)
				WindowSetShowing(tabTable.name .. "Button", false)
			end
		end
	end
end

-- Sets up a window to have proper scrollbar state
function CC_SetWindow(windowID, state)	
	group = "EA_ChatWindowGroup" .. windowID
	
	-- If window is not there then bail out
	if DoesWindowExist(group) == false then return end
	
	-- For each Tab, check if its used in this window and set it properly
	for tab,tabTable in pairs(EA_ChatTabManager.Tabs) do
		if tabTable.used == true and tabTable.wndGroupId == windowID then
		
			-- Setup the left scrollbar for the window
			if state == SCROLLBAR_LEFT then
				WindowClearAnchors(tabTable.name .. "TextLogScrollbar")
				WindowAddAnchor(tabTable.name .. "TextLogScrollbar","topleft",group,"topleft",0,33)
				WindowAddAnchor(tabTable.name .. "TextLogScrollbar","bottomleft",group,"bottomleft",0,-29)
				WindowClearAnchors(tabTable.name .. "TextLog")
				WindowAddAnchor(tabTable.name .. "TextLog", "topleft", tabTable.name .. "TextLogScrollbar", "topleft", -1, -5)
				WindowAddAnchor(tabTable.name .. "TextLog", "bottomright", group, "bottomright", 0, 5)
				
			-- Setup the right scrollbar for the window
			elseif state == SCROLLBAR_RIGHT then
				WindowClearAnchors(tabTable.name .. "TextLogScrollbar")
				WindowAddAnchor(tabTable.name .. "TextLogScrollbar", "topright", group, "topright", -7, 33)
				WindowAddAnchor(tabTable.name .. "TextLogScrollbar", "bottomright", group, "bottomright", -7, -29)
				WindowClearAnchors(tabTable.name .. "TextLog")
				WindowAddAnchor(tabTable.name .. "TextLog", "topleft", group, "topleft", -28, 28)
				WindowAddAnchor(tabTable.name .. "TextLog", "bottomleft", tabTable.name .. "TextLogScrollbar", "bottomright", 0, 36)
				WindowClearAnchors(group .. "ResizeButton")
				WindowAddAnchor(group .. "ResizeButton", "topleft", tabTable.name .. "TextLogScrollbar", "topright", 0, 0)
				
			-- Clear the scrollbar out through anchor glitching
			elseif state == SCROLLBAR_HIDDEN then
				WindowClearAnchors(tabTable.name .. "TextLogScrollbar") 
				WindowAddAnchor(tabTable.name .. "TextLogScrollbar", "bottom", tabTable.name .. "TextLog", "bottom", 0, 0)
				WindowAddAnchor(tabTable.name .. "TextLogScrollbar", "right", tabTable.name .. "TextLog", "right", 0, 0)
				WindowClearAnchors(tabTable.name .. "TextLog")
				WindowAddAnchor(tabTable.name .. "TextLog", "topleft", group, "topleft", -28, 28)
				WindowAddAnchor(tabTable.name .. "TextLog", "bottomright", group, "bottomright", 0, 5)
			end
		end
	end
	
	-- Tweak resize button if we arent right aligned
	if state ~= SCROLLBAR_RIGHT then
		WindowClearAnchors(group .. "ResizeButton")
		WindowAddAnchor(group .. "ResizeButton", "topright", group, "topright", 0, 33)
	end
	
	-- In order for the text log space to be maximized, things need to be put off the screen a bit
	-- This is easiestly achieved by taking the window off the edges then restoring their position
	-- Due to scaling and such, need to use a factor to resore it back
	local origx, origy = WindowGetScreenPosition(group)
	local width,height = GetScreenResolution()
	local superfactor = 1/(SystemData.Settings.Interface.globalUiScale * height *.000833333333)
	
	
	-- Apply the method
	WindowClearAnchors(group)
	WindowAddAnchor(group, "center", "Root", "center", 0, 0)
	WindowClearAnchors(group)
	WindowAddAnchor(group, "topleft", "Root", "topleft", origx * superfactor, origy * superfactor)
end 
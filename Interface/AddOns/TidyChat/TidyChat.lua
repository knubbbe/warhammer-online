


-----------------------------------
-- Global variables
-----------------------------------

TidyChat = {
	Options = {},
	Copy = {},
	LootRoll = {},
}

TidyChat.dVersion = L"2.2.6"

SystemData.ChatLogFilters.AUCTION = 28


-----------------------------------
-- Local variables
-----------------------------------

-- CONSTANTS
local c_MAX_TABS						= 20
local c_MAX_WINDOW_GROUPS				= 10

local c_SCROLLBAR_POSITION_LEFT			= 1
local c_SCROLLBAR_POSITION_RIGHT		= 2
local c_SCROLLBAR_POSITION_HIDDEN		= 3

local c_TEXTENTRY_ANCHOR_POINT_TOP		= 1
local c_TEXTENTRY_ANCHOR_POINT_BOTTOM	= 2

local c_TEXT_ENTRY_WINDOW				= "EA_TextEntryGroup"
local c_TEXT_ENTRY_ANCHOR				= "TextEntryAnchor"
local c_SOCIAL_BUTTON					= "ChatWindowSocialWindowButton"
local c_CHANNEL_MENU					= "ChatChannelSelectionWindow"
local c_TIDY_CHAT_OPTIONS				= "TidyChatOptions"
local c_TIDY_CHAT_COPY					= "TidyChatCopy"
local c_TIDY_CHAT_LOOT_ROLL				= "TidyChatLootRoll"

local c_FADE_TIME						= 0.6

local c_TIDY_CHAT_LOG					= "TidyChatLog"
local c_ADVANCED_LOOT_ROLL_CHANNEL_ID	= 20000
local c_LOG_UPDATE_TYPE_ADDED			= SystemData.TextLogUpdate.ADDED
local c_LOOT_ROLL_CHANNEL_ID			= SystemData.ChatLogFilters.LOOT_ROLL

-- PERFOMANCE
local TidyChat					= TidyChat
local TidyChatOptions			= TidyChat.Options
local TidyChatCopy				= TidyChat.Copy
local TidyChatLootRoll			= TidyChat.LootRoll

local pairs						= pairs
local ipairs					= ipairs
local tinsert					= table.insert
local tremove					= table.remove
local type						= type
local wstring_gsub				= wstring.gsub
local wstring_match				= wstring.match
local wstring_find				= wstring.find
local TextLogGetEntry			= TextLogGetEntry
local TextLogAddEntry			= TextLogAddEntry

local EA_ChatWindow				= EA_ChatWindow
local EA_ChatWindowGroups		= EA_ChatWindowGroups
local EA_ChatTabManager			= EA_ChatTabManager
local ChatSettings				= ChatSettings

local SystemData				= SystemData


-- INTERNAL VARIABLES
local rVersion					= 9
local firstLoad					= true
local tchat_debug				= false


-- INTERNAL FUNCTIONS
local TidyChatCore = {}
local TidyChatFrames = {}
local TidyChatLogs = {}
local TidyChatUtils = {}


-- HOOKS
local TidyChatHooks = {}


-- SETTINGS
local SavedSettings
local Settings = {}

-- defaults
local DefaultSettings = {
	version = 1,
	
	-- Text entry settings
	textentry_channel_showing			= true,
	textentry_channel_alpha				= 1.0,
	textentry_free						= false,
	textentry_relative_to				= 1,
	textentry_anchor_point				= c_TEXTENTRY_ANCHOR_POINT_TOP,
	textentry_background_alpha			= 1,
	
	-- Logs settings
	auction_filter_showing				= true,
	advanced_loot_roll_showing			= false,
	copy_showing						= true,
	
	-- Misc settings
	social_showing						= false,
	tobottom_showing					= true,
}

-- defaults for window groups
local DefaultWindowSettings = {
	chatwindow_tabs_showing				= true,
	chatwindow_background_showing		= false,
	chatwindow_click_through			= false,
	
	scrollbar_fadein_alpha				= 1.0,
	scrollbar_fadeout_enable			= true,
	scrollbar_fadeout_alpha				= 0.25,
	scrollbar_position					= c_SCROLLBAR_POSITION_LEFT,
}


-----------------------------------
-- End Local variables
-----------------------------------





-----------------------------------
-- Body
-----------------------------------
do


function TidyChat.Initialize()
	RegisterEventHandler( SystemData.Events.LOADING_END,		"TidyChat.OnLoad")
	RegisterEventHandler( SystemData.Events.RELOAD_INTERFACE,	"TidyChat.OnLoad")
	
	SavedSettings = TidyChat.Settings or {}
	TidyChatUtils.SetupSettings()
	
	TidyChatFrames.Initialize()
	TidyChatLogs.Initialize()
	
	TidyChatFrames.ResetAll()
	
	TidyChatHooks.SetupHooks()
	
	TidyChatOptions.InitializeOptions()
	TidyChatCopy.InitializeCopyWindow()
	TidyChatLootRoll.InitializeLootRollWindow()

	SavedSettings.version = rVersion
end


function TidyChat.OnShutdown()
	local wndGroupId = 1
	while( EA_ChatWindowGroups[wndGroupId] ) do
		if( EA_ChatWindowGroups[wndGroupId].used ) then
			wndGroupId				= wndGroupId + 1
			
		else
			local nextWndGroupId	= wndGroupId + 1
			
			while( EA_ChatWindowGroups[nextWndGroupId] and not EA_ChatWindowGroups[nextWndGroupId].used ) do
				nextWndGroupId		= nextWndGroupId + 1
			end
			
			TidyChatUtils.CopyWindowSettingsFromTo(nextWndGroupId, wndGroupId)
			
			wndGroupId				= nextWndGroupId + 1
		end
	end
	
	TidyChat.Settings = SavedSettings
end


function TidyChat.OnLoad()
	TidyChatUtils.Debug("TidyChat.OnLoad")
		
	if( firstLoad ) then
		firstLoad = false
		
		if( Phantom
			and Phantom.ImplementSettings
			and Phantom.Settings
			and Phantom.Settings.windows
			and Phantom.Settings.windows.SocialWindowButton ~= Settings.social_showing )
		then
			TidyChatUtils.Debug("SocialWindowButton = " .. tostring(Phantom.Settings.windows.SocialWindowButton))
			
			Phantom.Settings.windows.SocialWindowButton = Settings.social_showing
			Phantom.ImplementSettings()
		end
		
		-- Register slash command
		if( LibSlash and LibSlash.RegisterWSlashCmd ) then
            LibSlash.RegisterWSlashCmd("tchat", TidyChat.ToggleOptions)
		end

		
	end
	-- end firstLoad
end


function TidyChat.ToggleOptions()
	WindowSetShowing( c_TIDY_CHAT_OPTIONS, not WindowGetShowing(c_TIDY_CHAT_OPTIONS) )
end



end
-----------------------------------
-- end Body
-----------------------------------





-----------------------------------
-- Core Frames
-----------------------------------
do


function TidyChatCore.SetWindowGroup(	wndGroupId,
										chatwindow_tabs_showing,
										chatwindow_background_showing,
										chatwindow_click_through,
										scrollbar_alpha,
										scrollbar_position)
	
	local wndGroup = EA_ChatWindowGroups[wndGroupId]
	
	if( wndGroup and wndGroup.used ) then
		-- Check Settings
		if( chatwindow_tabs_showing			== nil ) then chatwindow_tabs_showing		= Settings[wndGroupId].chatwindow_tabs_showing end
		if( chatwindow_background_showing	== nil ) then chatwindow_background_showing = Settings[wndGroupId].chatwindow_background_showing end
		if( chatwindow_click_through		== nil ) then chatwindow_click_through		= Settings[wndGroupId].chatwindow_click_through end
		if( scrollbar_alpha					== nil ) then scrollbar_alpha				= TidyChatUtils.GetScrollBarAlphaSetting(wndGroupId) end
		if( scrollbar_position				== nil ) then scrollbar_position			= Settings[wndGroupId].scrollbar_position end
		
		
		local wndGroupName = wndGroup.name
		
		-- Set Tabs Showing
		TidyChatCore.SetWindowTabs(wndGroupId, chatwindow_tabs_showing)
		
		-- Set Background Showing
		WindowSetLayer(		wndGroupName .. "Background", 0)
		WindowSetShowing(	wndGroupName .. "Background", chatwindow_background_showing)
			
		-- Set Chat Window Clickable
		WindowSetHandleInput(wndGroupName, not chatwindow_click_through)		
		
		-- Reanchor Foreground
		local foregroundAnchor1To		= wndGroupName .. "CycleRightButton"
		local foregroundAnchor1Point	= "bottomright"
		if( not chatwindow_tabs_showing ) then
			foregroundAnchor1To			= wndGroupName
			foregroundAnchor1Point		= "topright"
		end
		
		local foregroundAnchor2YOffset	= 0
		if( not Settings.textentry_free and Settings.textentry_relative_to == wndGroupId and Settings.textentry_anchor_point == c_TEXTENTRY_ANCHOR_POINT_BOTTOM) then
			foregroundAnchor2YOffset	= -34
		end
		
		WindowClearAnchors(	wndGroupName .. "Foreground")
		WindowAddAnchor(	wndGroupName .. "Foreground", foregroundAnchor1Point , foregroundAnchor1To , "topright", 0, 0)
		WindowAddAnchor(	wndGroupName .. "Foreground", "bottomleft" , wndGroupName , "bottomleft", 0, foregroundAnchor2YOffset)
		
		
		-- Set Text Logs Windows
		for _, tab in ipairs( wndGroup.Tabs ) do
			TidyChatCore.SetWindowTextLog(tab.tabManagerId, scrollbar_alpha, scrollbar_position)
		end
		
		
		
		x, y = WindowGetOffsetFromParent(wndGroupName)
		
		WindowClearAnchors(	wndGroupName)
		WindowAddAnchor(	wndGroupName, "center" , "Root" , "center", 0, 0)
		
		WindowClearAnchors(	wndGroupName)
		WindowAddAnchor(	wndGroupName, "topleft" , "Root" , "topleft", x, y)
	end
end


function TidyChatCore.SetWindowTabs(	wndGroupId,
										chatwindow_tabs_showing)
	
	local wndGroup = EA_ChatWindowGroups[wndGroupId]
	
	if( wndGroup and wndGroup.used ) then
		-- Check Settings
		if( chatwindow_tabs_showing == nil ) then chatwindow_tabs_showing = Settings[wndGroupId].chatwindow_tabs_showing end
		
		
		local wndGroupName = wndGroup.name
		
		WindowSetShowing(wndGroupName .. "TabWindow", chatwindow_tabs_showing)
		
		if( chatwindow_tabs_showing ) then
			EA_ChatWindow.UpdateTabScrollWindow(wndGroupId)
			
		else
			EA_ChatWindow.ShowTabCycleButtons(wndGroupName, false)
		end
	end
end


function TidyChatCore.SetWindowTabsHandleInput( wndGroupId,
												chatwindow_tabs_handle_input)
	
	local wndGroup = EA_ChatWindowGroups[wndGroupId]
	
	if( wndGroup and wndGroup.used ) then
		local wndGroupName = wndGroup.name
		
		WindowSetHandleInput( wndGroupName .. "TabWindow", chatwindow_tabs_handle_input ~= false)
		
		WindowSetAlpha( wndGroupName .. "TabWindow", (chatwindow_tabs_handle_input ~= false and 1) or 0)
	end
end


function TidyChatCore.SetWindowTextLog(	tabManagerId,
										scrollbar_alpha,
										scrollbar_position)
	
	local tab = EA_ChatTabManager.Tabs[tabManagerId]
	
	if( tab and tab.used ) then
		local wndGroupId	= tab.wndGroupId
		
		-- Check Settings
		if( scrollbar_alpha		 == nil ) then scrollbar_alpha		= TidyChatUtils.GetScrollBarAlphaSetting(wndGroupId) end
		if( scrollbar_position	 == nil ) then scrollbar_position	= Settings[wndGroupId].scrollbar_position end
		
		
		local wndGroupName	= EA_ChatWindowGroups[wndGroupId].name
		local logDisplayName	= tab.name .. "TextLog"
		local scrollbarName = logDisplayName .. "Scrollbar"
		
		-- Set Scrollbar Alpha & Handle Input
		WindowStopAlphaAnimation(	scrollbarName)
		WindowSetAlpha(				scrollbarName, (scrollbar_position == c_SCROLLBAR_POSITION_HIDDEN and 0) or scrollbar_alpha)
		WindowStopAlphaAnimation(	logDisplayName .. "ToBottomButton")
		WindowSetAlpha(				logDisplayName .. "ToBottomButton", (scrollbar_position == c_SCROLLBAR_POSITION_HIDDEN and 0) or scrollbar_alpha)
		WindowSetHandleInput(		scrollbarName, scrollbar_position ~= c_SCROLLBAR_POSITION_HIDDEN)
		
		
		-- Set Scrollbar Position
		local textLogAnchor1XOffset = 0
		local textLogAnchor2XOffset = -5
		
		if( scrollbar_position == c_SCROLLBAR_POSITION_LEFT ) then
			WindowClearAnchors(	scrollbarName)
			WindowAddAnchor(	scrollbarName, "topleft", logDisplayName, "topleft", 0, 7)
			WindowAddAnchor(	scrollbarName, "bottomleft", logDisplayName, "bottomright", 22, -29)
			
		else
			textLogAnchor1XOffset = -22
			
			WindowClearAnchors(	scrollbarName)
			WindowAddAnchor(	scrollbarName, "topright", logDisplayName, "topright", -2, 7)
			WindowAddAnchor(	scrollbarName, "bottomright", logDisplayName, "bottomleft", -24, -29)
		end
		
		
		WindowClearAnchors(	logDisplayName)
		WindowAddAnchor(	logDisplayName, "topleft", wndGroupName .. "Foreground", "topleft", textLogAnchor1XOffset, 0)
		WindowAddAnchor(	logDisplayName, "bottomright", wndGroupName .. "Foreground", "bottomright", textLogAnchor2XOffset, 0)
	end
end


function TidyChatCore.SetSocialButton(social_showing)
	
	-- Check Settings
	if( social_showing  == nil ) then social_showing = Settings.social_showing end
	
	WindowSetShowing(c_SOCIAL_BUTTON, social_showing)
end


function TidyChatCore.SetTextEntry(	textentry_channel_showing,
									textentry_channel_alpha,
									textentry_free,
									textentry_relative_to,
									textentry_anchor_point,
									textentry_background_alpha)
	
	-- Check Settings
	if( textentry_channel_showing	== nil ) then textentry_channel_showing		= Settings.textentry_channel_showing end
	if( textentry_channel_alpha		== nil ) then textentry_channel_alpha		= Settings.textentry_channel_alpha end
	if( textentry_free				== nil ) then textentry_free				= Settings.textentry_free end
	if( textentry_relative_to		== nil ) then textentry_relative_to			= Settings.textentry_relative_to end
	if( textentry_anchor_point		== nil ) then textentry_anchor_point		= Settings.textentry_anchor_point end
	if( textentry_background_alpha	== nil ) then textentry_background_alpha	= Settings.textentry_background_alpha end
	
	-- Set Channel button showing & alpha
	WindowSetShowing(	c_TEXT_ENTRY_WINDOW .. "ChannelButton", textentry_channel_showing)
	WindowSetAlpha(		c_TEXT_ENTRY_WINDOW .. "ChannelButton", textentry_channel_alpha)
	
	-- Set Background Alpha
	WindowSetAlpha(		c_TEXT_ENTRY_WINDOW .. "EntryBoxBG", textentry_background_alpha)
	
	-- Reanchor entrybox
	WindowClearAnchors(	c_TEXT_ENTRY_WINDOW .. "EntryBox")
	
	local EntryBoxAnchorXOffset	= 0
	if( textentry_channel_showing ) then
		EntryBoxAnchorXOffset = 29
	end
	
	WindowAddAnchor(	c_TEXT_ENTRY_WINDOW .. "EntryBox", "topleft", c_TEXT_ENTRY_WINDOW, "topleft", EntryBoxAnchorXOffset, 0 )
	WindowAddAnchor(	c_TEXT_ENTRY_WINDOW .. "EntryBox", "bottomright", c_TEXT_ENTRY_WINDOW, "bottomright", 0, 0 )
	
	-- Reanchor text entry
	WindowClearAnchors(c_TEXT_ENTRY_WINDOW)
	
	local TEAnchorPoint
	local TEAnchorRelativePoint
	local TEAnchorRelativeWindow
	
	local wndGroup = not textentry_free and EA_ChatWindowGroups[textentry_relative_to]
	if( wndGroup and wndGroup.used ) then
		TEAnchorPoint					= "top"
		TEAnchorRelativePoint			= "bottom"
		
		if( textentry_anchor_point == c_TEXTENTRY_ANCHOR_POINT_BOTTOM ) then
			TEAnchorPoint				= "bottom"
			TEAnchorRelativePoint		= "top"
		end
		
		TEAnchorRelativeWindow = wndGroup.name .. "Foreground"
		
	else
		TEAnchorPoint					= "top"
		TEAnchorRelativePoint			= "top"

		if( textentry_anchor_point == c_TEXTENTRY_ANCHOR_POINT_BOTTOM ) then
			TEAnchorPoint				= "bottom"
			TEAnchorRelativePoint		= "bottom"
		end

		TEAnchorRelativeWindow = c_TEXT_ENTRY_ANCHOR
	end
	
	WindowAddAnchor(c_TEXT_ENTRY_WINDOW, TEAnchorPoint .. "left",	 TEAnchorRelativeWindow, TEAnchorRelativePoint .. "left", 0, 0 )
	WindowAddAnchor(c_TEXT_ENTRY_WINDOW, TEAnchorPoint .. "right", TEAnchorRelativeWindow, TEAnchorRelativePoint .. "right", 0, 0 )
end



end
-----------------------------------
-- end Core Frames
-----------------------------------





-----------------------------------
-- Core Logs
-----------------------------------
do


function TidyChatCore.AddNewChannels( ... )
	-- Check list
	local newChannelsList = { ... }
	
	for _, channelData in ipairs( newChannelsList ) do
		ChatSettings.Channels[channelData.id] = DataUtils.CopyTable(channelData)
		
		tinsert(ChatSettings.Ordering, channelData.id)
		
		ChatSettings.ChannelColors[channelData.id] = ChatSettings.ChannelColors[channelData.id] or channelData.defaultColor
	end
	
	
	local index = 0
	for wndGroupId, wndGroup in ipairs( EA_ChatWindowGroups ) do
		if( wndGroup.used ) then
			index = index + 1
			
			for k, tab in ipairs(wndGroup.Tabs) do
			
				-- Update filters' settings
				if( EA_ChatWindow.Settings
					and EA_ChatWindow.Settings.WindowGroups
					and EA_ChatWindow.Settings.WindowGroups[index]
					and EA_ChatWindow.Settings.WindowGroups[index].Tabs
					)
				then
					local savedTab = EA_ChatWindow.Settings.WindowGroups[index].Tabs[k]
					if( savedTab and savedTab.Filters ) then
						tab.Filters = tab.Filters or {}
						
						for _, channelData in ipairs( newChannelsList ) do
							tab.Filters[ channelData.id ] = savedTab.Filters[ channelData.id ]
						end
					end
				end
				
				
				-- Update filters' state and color
				local logDisplayName = EA_ChatTabManager.GetTabName(tab.tabManagerId) .. "TextLog"
				
				for _, channelData in pairs( newChannelsList ) do
					local enabled
					if( tab.Filters and tab.Filters[ channelData.id ] ~= nil ) then
						enabled = tab.Filters[ channelData.id ]
							
					else
						enabled = (k == 1 and wndGroupId == 1) or channelData.isOn							
					end
					
					LogDisplaySetFilterState( logDisplayName, channelData.logName, channelData.id, enabled )
					
					local color = ChatSettings.ChannelColors[ channelData.id ]
					LogDisplaySetFilterColor( logDisplayName, channelData.logName, channelData.id, color.r, color.g, color.b )
				end
			end
		end
	end
	
	EA_ChatWindow.OnSettingsChanged()
end


function TidyChatCore.RemoveChannel( ... )
	local removeChannelIds = { ... }
	
	for _, channelID in ipairs( removeChannelIds ) do
		ChatSettings.Channels[channelId] = nil
		
		for index, id in ipairs(ChatSettings.Ordering) do
			if( channelId == id ) then
				tremove(ChatSettings.Ordering, index)
			end
		end
		
		ChatSettings.ChannelColors[channelId] = nil
	end
	
	for _, wndGroup in ipairs( EA_ChatWindow.Settings.WindowGroups ) do
		for _, tab in ipairs( wndGroup.Tabs ) do
			if( tab.Filters ) then
				for _, channelID in ipairs( removeChannelIds ) do
					tab.Filters[channelId] = nil
				end
			end
		end
	end
end


function TidyChatCore.GetEntryCache( tabManagerId )
	local entryCache = {}
	local filtersTable = {}
	
	local tab = EA_ChatTabManager.Tabs[tabManagerId]
	
	if( tab and tab.used ) then	
		local logDisplayName = tab.name .. "TextLog"
		
		local logTable = {
			{
				logName = "Chat",
				index	= 0,
			},
		
			{
				logName = "Combat",
				index	= 0,
			},
		}
		
		for _, logData in ipairs( logTable ) do
			logData.numEntries = TextLogGetNumEntries( logData.logName )
		end
		
		local skipLoop
		repeat
			skipLoop	= false
			
			for _, logData in ipairs( logTable ) do
				if( logData.index < logData.numEntries ) then
					if( logData.entryNum ~= logData.index ) then
						logData.entryNum = logData.index
						logData.timestamp, logData.filterId, logData.text = TextLogGetEntry( logData.logName, logData.index )
						
						if( filtersTable[logData.filterId] == nil ) then
							filtersTable[logData.filterId] = LogDisplayGetFilterState( logDisplayName, logData.logName, logData.filterId)
						end
						
						if( not filtersTable[logData.filterId] ) then
							logData.index = logData.index + 1
							skipLoop = true
						end
					end
				else
					logData.endOfLog = true
				end
			end
			
			if( skipLoop ) then continue end
			
			local useLog
			if( not logTable[1].endOfLog and ( logTable[2].endOfLog or (logTable[1].timestamp <= logTable[2].timestamp) ) ) then
				useLog = 1
			elseif( not logTable[2].endOfLog and ( logTable[1].endOfLog or (logTable[1].timestamp > logTable[2].timestamp) ) ) then
				useLog = 2	
			end
			
			if( useLog ) then
				local logData = logTable[useLog]
				
				logData.index = logData.index + 1
				
				local entry = {
					--timestamp	= logData.timestamp,
					--filterId	= logData.filterId,
					text		= logData.text,
				}
				tinsert(entryCache, entry)
			end
				
		until( logTable[1].endOfLog and logTable[2].endOfLog )
	end
	
	return entryCache
end





end
-----------------------------------
-- end Core Logs
-----------------------------------





-----------------------------------
-- Hooks
-----------------------------------
do

local isLinkInserted = false

function TidyChatHooks.SetupHooks()
	TidyChatUtils.Debug("TidyChatHooks.SetupHooks")
	
	TidyChatHooks.oldCreateDefaultContextMenu		= EA_ChatWindow.CreateDefaultContextMenu
	EA_ChatWindow.CreateDefaultContextMenu			= TidyChatHooks.CreateDefaultContextMenuHook
	
	TidyChatHooks.oldStartAlphaAnimation			= EA_ChatWindow.StartAlphaAnimation
	EA_ChatWindow.StartAlphaAnimation				= TidyChatHooks.StartAlphaAnimationHook
	
	TidyChatHooks.oldUpdateAllChannelColors			= EA_ChatWindow.UpdateAllChannelColors
	EA_ChatWindow.UpdateAllChannelColors			= TidyChatHooks.oldUpdateAllChannelColorsHook
	
	TidyChatHooks.oldDock							= EA_ChatWindow.Dock
	EA_ChatWindow.Dock								= TidyChatHooks.DockHook
	
	TidyChatHooks.oldUndock							= EA_ChatWindow.Undock
	EA_ChatWindow.Undock							= TidyChatHooks.UndockHook
	
	TidyChatHooks.oldDestroyWindowGroup				= EA_ChatWindow.DestroyWindowGroup
	EA_ChatWindow.DestroyWindowGroup				= TidyChatHooks.DestroyWindowGroupHook
	
	TidyChatHooks.oldCreateTab						= EA_ChatTabManager.CreateTab
	EA_ChatTabManager.CreateTab						= TidyChatHooks.CreateTabHook
	
	TidyChatHooks.oldOnHyperLinkLButtonUp			= EA_ChatWindow.OnHyperLinkLButtonUp
	EA_ChatWindow.OnHyperLinkLButtonUp				= TidyChatHooks.OnHyperLinkLButtonUpHook
	
	TidyChatHooks.oldOnEnterChatText				= EA_ChatWindow.OnEnterChatText
	EA_ChatWindow.OnEnterChatText					= TidyChatHooks.OnEnterChatTextHook
	
	TidyChatHooks.oldInsertText						= EA_ChatWindow.InsertText
	EA_ChatWindow.InsertText						= TidyChatHooks.InsertTextHook
	
	--TidyChatHooks.oldInventoryLButtonUp				= EA_Window_Backpack.InventoryLButtonUp
	--EA_Window_Backpack.InventoryLButtonUp			= TidyChatHooks.InventoryLButtonUpHook
	
	RegisterEventHandler(SystemData.Events.L_BUTTON_UP_PROCESSED,"TidyChat.OnLBU")
end


function TidyChatHooks.CreateDefaultContextMenuHook(...)
	TidyChatUtils.Debug("TidyChatHooks.CreateDefaultContextMenuHook")
	
	TidyChatHooks.oldCreateDefaultContextMenu(...)
	
	local menuItemsAdded = false
	
	if( Settings.copy_showing ) then
		EA_Window_ContextMenu.AddMenuItem( L"Copy...", TidyChatCopy.OnCopyButton, false, true )
		menuItemsAdded = true
	end	
	
	if( Settings.tobottom_showing ) then
		EA_Window_ContextMenu.AddMenuItem( L"To Bottom", TidyChatFrames.OnToBottomButton, false, true )
		menuItemsAdded = true
	end
	
	if( menuItemsAdded ) then
		EA_Window_ContextMenu.Finalize()
	end
end


function TidyChatHooks.StartAlphaAnimationHook(...)
	--TidyChatUtils.Debug("TidyChatHooks.StartAlphaAnimationHook")
	
	TidyChatHooks.oldStartAlphaAnimation(...)
	
	local wndGroupId, forward = ...
	
	local startAlpha	= Settings[wndGroupId].scrollbar_fadeout_alpha
	local endAlpha		= Settings[wndGroupId].scrollbar_fadein_alpha
	local duration		= c_FADE_TIME
	
	if( (not Settings[wndGroupId].scrollbar_fadeout_enable) or (Settings[wndGroupId].scrollbar_position == c_SCROLLBAR_POSITION_HIDDEN) ) then
		return
	end
	
	if( forward == false ) then
		local temp	= startAlpha
		
		startAlpha	= endAlpha
		endAlpha	= temp
		duration	= c_FADE_TIME * 2
	end
	
	local wndGroup	= EA_ChatWindowGroups[wndGroupId]
	local activeTab = wndGroup.activeTab
	
	--TidyChatUtils.Debug("Start alpha animation, startalpha = " .. tostring(startAlpha) .. ", endalpha = " .. tostring(endAlpha) .. ", wndGroupId = " .. tostring(wndGroupId))
	
	for wndGroupTabId, tab in ipairs( wndGroup.Tabs ) do
		local tabName = EA_ChatTabManager.GetTabName(tab.tabManagerId)
		
		if( wndGroupTabId == activeTab ) then
			WindowStopAlphaAnimation(tabName .. "TextLogScrollbar")
			WindowStopAlphaAnimation(tabName .. "TextLogToBottomButton")
			
			WindowSetAlpha( tabName .. "TextLogScrollbar",		endAlpha )
			WindowSetAlpha( tabName .. "TextLogToBottomButton", endAlpha )
			
			WindowStartAlphaAnimation ( tabName .. "TextLogScrollbar",		Window.AnimationType.SINGLE, startAlpha, endAlpha, duration, false, 0, 0 )
			WindowStartAlphaAnimation ( tabName .. "TextLogToBottomButton", Window.AnimationType.SINGLE, startAlpha, endAlpha, duration, false, 0, 0 )
		else
			WindowSetAlpha( tabName .. "TextLogScrollbar",		endAlpha )
			WindowSetAlpha( tabName .. "TextLogToBottomButton", endAlpha )
		end
	end
end


function TidyChatHooks.oldUpdateAllChannelColorsHook(...)
	TidyChatUtils.Debug("TidyChatHooks.oldUpdateAllChannelColorsHook")
	
	TidyChatHooks.oldUpdateAllChannelColors(...)
	
	TidyChatFrames.UpdateTidyChannelButtonsColors()
end


function TidyChatHooks.DockHook(...)
	TidyChatUtils.Debug("TidyChatHooks.DockHook")
	
	TidyChatHooks.oldDock(...)
	
	if( EA_ChatWindow.settingsDirty ) then
		local srcTabId = ...
		TidyChatCore.SetWindowTextLog(srcTabId)
	end
end


function TidyChatHooks.UndockHook(...)
	TidyChatUtils.Debug("TidyChatHooks.UndockHook")
	
	TidyChatHooks.oldUndock(...)
	
	if( EA_ChatWindow.settingsDirty ) then
		local _, wndGroupId = ...
		
		TidyChatCore.SetWindowGroup(wndGroupId)
		
		if( WindowGetShowing(c_TIDY_CHAT_OPTIONS) ) then
			TidyChatOptions.UpdateGroupComboboxes()
		end
	end
end


function TidyChatHooks.DestroyWindowGroupHook(...)
	TidyChatUtils.Debug("TidyChatHooks.DestroyWindowGroupHook")
	
	TidyChatHooks.oldDestroyWindowGroup(...)
	
	if( WindowGetShowing(c_TIDY_CHAT_OPTIONS) ) then
		TidyChatOptions.UpdateGroupComboboxes()
	end
end


function TidyChatHooks.CreateTabHook(...)
	TidyChatUtils.Debug("TidyChatHooks.CreateTabHook")
	
	local results = { TidyChatHooks.oldCreateTab(...) }
	
	local tabManagerId = results[1]
	
	TidyChatCore.SetWindowTextLog(tabManagerId)
	
	return unpack(results)
end


local TCROLL_TAG	= L"TCROLL:"
local ERASE			= L""

function TidyChatHooks.OnHyperLinkLButtonUpHook(...)
	TidyChatUtils.Debug("TidyChatHooks.OnHyperLinkLButtonUpHook")
	
	TidyChatHooks.oldOnHyperLinkLButtonUp(...)
	
	local linkData = ...
	
	local rollIndex, findCount = wstring_gsub( linkData, TCROLL_TAG, ERASE )
	if( findCount > 0 ) then
		TidyChatLogs.DebugRoll( tonumber(rollIndex) )
		TidyChatLootRoll.OnRollLinkLButtonUp( tonumber(rollIndex) )
		return
	end
end


function TidyChatHooks.OnEnterChatTextHook(...)
	TidyChatUtils.Debug("TidyChatHooks.OnEnterChatTextHook")
	
	if( WindowGetShowing(c_TEXT_ENTRY_WINDOW .. "EntryBox") ) then					-- and EA_ChatWindow.curChannel ~= nil 
		WindowSetShowing(c_TEXT_ENTRY_WINDOW, true)
		WindowAssignFocus(c_TEXT_ENTRY_WINDOW .. "EntryBoxTextInput", true)
	else
		TidyChatHooks.oldOnEnterChatText(...)
	end
end


function TidyChatHooks.InsertTextHook(...)
	TidyChatUtils.Debug("TidyChatHooks.InsertTextHook")
	
	WindowSetShowing(c_TEXT_ENTRY_WINDOW, true)
	TidyChatHooks.oldInsertText(...)
	
	isLinkInserted = true
end

--[[
function TidyChatHooks.InventoryLButtonUpHook(...)
	TidyChatUtils.Debug("TidyChatHooks.InventoryLButtonUpHook")
	
	if( isLinkInserted and WindowGetShowing(c_TEXT_ENTRY_WINDOW .. "EntryBox") ) then
		WindowSetShowing(c_TEXT_ENTRY_WINDOW, true)
	end
	
	isLinkInserted = false
	
	TidyChatHooks.oldInventoryLButtonUp(...)
end
--]]


function TidyChat.OnLBU( flags )
	--TidyChatUtils.Debug("TidyChat.OnLBU")
	
	if( isLinkInserted and flags == SystemData.ButtonFlags.SHIFT and WindowGetShowing(c_TEXT_ENTRY_WINDOW .. "EntryBox") ) then
		WindowSetShowing(c_TEXT_ENTRY_WINDOW, true)
	end
	
	isLinkInserted = false
end


end
-----------------------------------
-- end Hooks
-----------------------------------





-----------------------------------
-- Frames
-----------------------------------
do


function TidyChatFrames.Initialize()
	
	-- Initialize Channel Button
	WindowClearAnchors(c_TEXT_ENTRY_WINDOW .. "ChannelButton")
	WindowSetParent(c_TEXT_ENTRY_WINDOW .. "ChannelButton", "Root")
	WindowSetLayer(c_TEXT_ENTRY_WINDOW .. "ChannelButton", 3)
	WindowAddAnchor(c_TEXT_ENTRY_WINDOW .. "ChannelButton", "topleft", c_TEXT_ENTRY_WINDOW, "topleft", 0, 0 )
	WindowRegisterCoreEventHandler(c_TEXT_ENTRY_WINDOW .. "ChannelButton", "OnRButtonUp", "TidyChat.ToggleOptions")
	WindowRegisterCoreEventHandler(c_TEXT_ENTRY_WINDOW .. "ChannelButton", "OnMButtonUp", "TidyChat.OnChannelButtonMButtonUp")
	
	-- Add new buttons to Channel Menu
	TidyChatFrames.InitializeChannelMenuTidyChannelButtons()
	
	
	-- Initialize Text Entry
	WindowClearAnchors(	c_TEXT_ENTRY_WINDOW)
	WindowSetParent(	c_TEXT_ENTRY_WINDOW, "Root")
	WindowSetLayer(		c_TEXT_ENTRY_WINDOW, 2)
	
	WindowSetTintColor(	c_TEXT_ENTRY_WINDOW .. "EntryBoxBG", 0, 0, 0)
	
	WindowRegisterCoreEventHandler(c_TEXT_ENTRY_WINDOW .. "EntryBox", "OnShown",  "TidyChat.OnEntryBoxUpdateShowing")
	WindowRegisterCoreEventHandler(c_TEXT_ENTRY_WINDOW .. "EntryBox", "OnHidden", "TidyChat.OnEntryBoxUpdateShowing")
	
	WindowRegisterCoreEventHandler(c_TEXT_ENTRY_WINDOW .. "EntryBoxTextInput", "OnLButtonDown", "TidyChat.OnEntryBoxTextInputLBD")
	
	TidyChat.OnEntryBoxUpdateShowing()
	
	CreateWindow(c_TEXT_ENTRY_ANCHOR, false)
	LayoutEditor.RegisterWindow(c_TEXT_ENTRY_ANCHOR, L"Chat Text Entry", L"Where Text Entry are displayed.", true, false, false, nil)
	
	
	-- Language Button
	if( DoesWindowExist(c_TEXT_ENTRY_WINDOW .. "EntryBoxLanguageButton") and WindowGetShowing(c_TEXT_ENTRY_WINDOW .. "EntryBoxLanguageButton") ) then
		WindowSetShowing(c_TEXT_ENTRY_WINDOW .. "EntryBoxLanguageButton", false)
		
		WindowClearAnchors( c_TEXT_ENTRY_WINDOW .. "EntryBoxTextInput" )
		WindowAddAnchor( c_TEXT_ENTRY_WINDOW .. "EntryBoxTextInput", "topright", c_TEXT_ENTRY_WINDOW .. "EntryBoxChannelLabel", "topleft", 2, -5 )
		WindowAddAnchor( c_TEXT_ENTRY_WINDOW .. "EntryBoxTextInput", "bottomright", c_TEXT_ENTRY_WINDOW .. "EntryBox", "bottomright", -4, 2 )
		
		WindowClearAnchors( c_TEXT_ENTRY_WINDOW .. "EntryBoxBG" )
		WindowAddAnchor( c_TEXT_ENTRY_WINDOW .. "EntryBoxBG", "topleft", c_TEXT_ENTRY_WINDOW .. "EntryBox", "topleft", 0, 0 )
		WindowAddAnchor( c_TEXT_ENTRY_WINDOW .. "EntryBoxBG", "bottomright", c_TEXT_ENTRY_WINDOW .. "EntryBox", "bottomright", 0, 0 )
	end
	
	-- TODO: option for lang button
end


-- Add new buttons to Channel Menu
function TidyChatFrames.InitializeChannelMenuTidyChannelButtons()
	x, y = WindowGetDimensions(c_CHANNEL_MENU)
	WindowSetDimensions(c_CHANNEL_MENU, x, y + 28*3 )
	
	
	-- Add Alliance Button to Channel Menu
	CreateWindowFromTemplate( c_CHANNEL_MENU .. "AllianceButton", "ChannelMenuButton", "ChatChannelSelectionWindow" )
	WindowAddAnchor(c_CHANNEL_MENU .. "AllianceButton", "bottomleft", c_CHANNEL_MENU .. "GuildButton", "topleft", 0, 8 )
	
	WindowClearAnchors(c_CHANNEL_MENU .. "WarbandButton")
	WindowAddAnchor(c_CHANNEL_MENU .. "WarbandButton", "bottomleft", c_CHANNEL_MENU .. "AllianceButton", "topleft", 0, 8 )
	
	WindowSetId( c_CHANNEL_MENU .. "AllianceButton", ChatSettings.Channels[SystemData.ChatLogFilters.ALLIANCE].id )
	ButtonSetText(c_CHANNEL_MENU .. "AllianceButton", L"/"..GetChatString(StringTables.Chat.CHAT_CHANNEL_NAME_ALLIANCE) )
	
	-- Add Advice Button to Channel Menu
	CreateWindowFromTemplate( c_CHANNEL_MENU .. "AdviceButton", "ChannelMenuButton", "ChatChannelSelectionWindow" )
	WindowAddAnchor(c_CHANNEL_MENU .. "AdviceButton", "bottomleft", c_CHANNEL_MENU .. "SayButton", "topleft", 0, 8 )
	
	WindowSetId( c_CHANNEL_MENU .. "AdviceButton", ChatSettings.Channels[SystemData.ChatLogFilters.ADVICE].id )
	ButtonSetText(c_CHANNEL_MENU .. "AdviceButton", L"/"..GetChatString(StringTables.Chat.CHAT_CHANNEL_NAME_ADVICE) )
	
	-- Add Scenario Button to Channel Menu
	CreateWindowFromTemplate( c_CHANNEL_MENU .. "ScenarioButton", "ChannelMenuButton", "ChatChannelSelectionWindow" )
	WindowAddAnchor(c_CHANNEL_MENU .. "ScenarioButton", "bottomleft", c_CHANNEL_MENU .. "AdviceButton", "topleft", 0, 8 )
	
	WindowSetId( c_CHANNEL_MENU .. "ScenarioButton", ChatSettings.Channels[SystemData.ChatLogFilters.SCENARIO].id )
	ButtonSetText(c_CHANNEL_MENU .. "ScenarioButton", L"/"..GetChatString(StringTables.Chat.CHAT_CHANNEL_NAME_SCENARIO) )
	
	TidyChatFrames.UpdateTidyChannelButtonsColors()
end


function TidyChatFrames.UpdateTidyChannelButtonsColors()
	
	-- AllianceButton
	local channelColor = ChatSettings.ChannelColors[ SystemData.ChatLogFilters.ALLIANCE ]
	local channelButton = c_CHANNEL_MENU .. "AllianceButton"
	
	ButtonSetTextColor(channelButton, Button.ButtonState.NORMAL,				channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.HIGHLIGHTED,			channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.PRESSED,				channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.PRESSED_HIGHLIGHTED,	channelColor.r, channelColor.g, channelColor.b)
	
	-- Advice Button
	channelColor = ChatSettings.ChannelColors[ SystemData.ChatLogFilters.ADVICE ]
	channelButton = c_CHANNEL_MENU .. "AdviceButton"
	
	ButtonSetTextColor(channelButton, Button.ButtonState.NORMAL,				channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.HIGHLIGHTED,			channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.PRESSED,				channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.PRESSED_HIGHLIGHTED,	channelColor.r, channelColor.g, channelColor.b)
	
	-- Scenario Button
	channelColor = ChatSettings.ChannelColors[ SystemData.ChatLogFilters.SCENARIO ]
	channelButton = c_CHANNEL_MENU .. "ScenarioButton"
	
	ButtonSetTextColor(channelButton, Button.ButtonState.NORMAL,				channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.HIGHLIGHTED,			channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.PRESSED,				channelColor.r, channelColor.g, channelColor.b)
	ButtonSetTextColor(channelButton, Button.ButtonState.PRESSED_HIGHLIGHTED,	channelColor.r, channelColor.g, channelColor.b)
end


function TidyChatFrames.ResetAll()
	TidyChatFrames.ResetChatWindows()
	TidyChatFrames.ResetTextEntry()
	TidyChatFrames.ResetSocialButton()
end


function TidyChatFrames.ResetChatWindows()
	TidyChatUtils.Debug("TidyChatFrames.ResetChatWindows")
	
	for wndGroupId = 1, #EA_ChatWindowGroups do
		TidyChatCore.SetWindowGroup(wndGroupId)
	end
end


function TidyChatFrames.ResetTextEntry()
	TidyChatUtils.Debug("TidyChatFrames.ResetTextEntry")
	
	TidyChatCore.SetTextEntry()
end


function TidyChatFrames.ResetSocialButton()
	TidyChatUtils.Debug("TidyChatFrames.ResetSocialButton")
	
	TidyChatCore.SetSocialButton()
end


function TidyChatFrames.OnToBottomButton()
	local wndGroup = EA_ChatWindowGroups[ WindowGetId(EA_Window_ContextMenu.activeWindow) ]
	
	if( wndGroup and wndGroup.used ) then
		local tabId = wndGroup.Tabs[ wndGroup.activeTab ].tabManagerId
		local logDisplayName = EA_ChatTabManager.Tabs[ tabId ].name .. "TextLog"
		
		LogDisplayScrollToBottom( logDisplayName )
	end
end



-- GLOBAL EVENT HANDLERS

function TidyChat.OnEntryBoxUpdateShowing()
	local textEntryShowing		= WindowGetShowing(c_TEXT_ENTRY_WINDOW .. "EntryBox")
	local textentry_relative_to	= Settings.textentry_relative_to
	
	WindowSetHandleInput(c_TEXT_ENTRY_WINDOW, textEntryShowing)
	if( textEntryShowing ) then
		WindowSetShowing(c_TEXT_ENTRY_WINDOW, true)
	end
	
	if( not Settings.textentry_free
		and Settings.textentry_anchor_point == c_TEXTENTRY_ANCHOR_POINT_TOP
		and Settings[textentry_relative_to].chatwindow_tabs_showing
		)
	then
		TidyChatCore.SetWindowTabsHandleInput(	textentry_relative_to, not textEntryShowing )
	end
end


function TidyChat.OnEntryBoxTextInputLBD()
	TidyChatUtils.Debug("TidyChat.OnEntryBoxTextInputLBD")
	
	WindowSetShowing(c_TEXT_ENTRY_WINDOW, true)
end


local defaultCT = true
function TidyChat.OnChannelButtonMButtonUp()
	TidyChatUtils.Debug("TidyChatFrames.OnChannelButtonMButtonUp, defaultCT = " .. tostring(defaultCT))

	if( defaultCT == true ) then
		defaultCT = false
		
		for wndGroupId = 1, #EA_ChatWindowGroups do
			TidyChatCore.SetWindowGroup(wndGroupId, nil, nil, true)
		end
	else
		defaultCT = true
		
		TidyChatFrames.ResetChatWindows()
	end
end



end
-----------------------------------
-- end Frames
-----------------------------------





-----------------------------------
-- Logs
-----------------------------------
do


local function ChatChannel( iname, iid, ilogName, ionFlag, iColor )
	local newChannel = {
		name			= iname,
		id				= iid,
		logName			= ilogName,
		isOn			= ionFlag,
		defaultColor	= iColor,
    }
	
	return newChannel;
end

local function ChannelColor( red, green, blue )
    return { r = red, g = green, b = blue }
end




TidyChatLogs.NewLogFilters = {
	Auction				= ChatChannel( L"Auction",				SystemData.ChatLogFilters.AUCTION,								"Chat",		true,	DefaultColor.CLEAR_WHITE ),
	
	AdvancedLootRoll	= ChatChannel( L"Advanced Loot Rolls",	c_ADVANCED_LOOT_ROLL_CHANNEL_ID,								"Chat",		false,	ChannelColor(121, 92, 99) ),
}


function TidyChatLogs.Initialize()
	if( Settings.auction_filter_showing ) then
		TidyChatCore.AddNewChannels( TidyChatLogs.NewLogFilters.Auction )
	end
	
	if( Settings.advanced_loot_roll_showing ) then
		TidyChatCore.AddNewChannels( TidyChatLogs.NewLogFilters.AdvancedLootRoll )
		
		local chatLogEventId = TextLogGetUpdateEventId( "Chat" )
		RegisterEventHandler( chatLogEventId, "TidyChat.OnChatLogUpdated" )
	end
	
	if( tchat_debug ) then
		TextLogCreate(c_TIDY_CHAT_LOG, 8184)		
		LogDisplayAddLog("EA_ChatTab5TextLog", c_TIDY_CHAT_LOG, true)
	
		local combatLogEventId = TextLogGetUpdateEventId( "Combat" )
		RegisterEventHandler( combatLogEventId, "TidyChat.OnCombatLogUpdated" )
		local systemLogEventId = TextLogGetUpdateEventId( "System" )
		RegisterEventHandler( systemLogEventId, "TidyChat.OnSystemLogUpdated" )
	end
	
	-- update prev version
	if( Settings.version < 9 ) then
		local channels = {
			SystemData.SystemLogFilters.GENERAL,
			SystemData.SystemLogFilters.NOTICE,
			SystemData.SystemLogFilters.ERROR,
		}
		
		for _, channelId in pairs(channels) do
			local defaultColor = ChatSettings.Channels[channelId].defaultColor
			ChatSettings.ChannelColors[channelId] = defaultColor
			
		    for tabId, tab in pairs(EA_ChatTabManager.Tabs) 
			do
				if ( tab.used == false )
				then
					continue
				end
		        
				local logDisplayName = tab.name.."TextLog"             
				LogDisplaySetFilterColor(logDisplayName,
										 "System",
										 channelId, 
										 defaultColor.r, defaultColor.g, defaultColor.b ) 
			end
		end
		
	end
end


function TidyChatLogs.ProcessEntry(filterId, text)
	if( Settings.advanced_loot_roll_showing and filterId == c_LOOT_ROLL_CHANNEL_ID ) then
		TidyChatLogs.ProcessLootRollEntry(text)
	end
end



-- GLOBAL EVENT HANDLERS

function TidyChat.OnChatLogUpdated(updateType)
	if( updateType == c_LOG_UPDATE_TYPE_ADDED ) then
		local _, filterId, text = TextLogGetEntry( "Chat", TextLogGetNumEntries("Chat") - 1 )
		
		if( tchat_debug ) then
			--TidyChatUtils.Debug(L"TidyChat.OnChatLogUpdated, updateType = " .. towstring(updateType) .. L", filterId = " .. towstring(filterId) .. L", text = " .. towstring(text))
			TextLogAddEntry(c_TIDY_CHAT_LOG, filterId, L"[Chat(" .. filterId .. L")]: " .. text)
		end

		TidyChatLogs.ProcessEntry(filterId, text)
	end
end


function TidyChat.OnCombatLogUpdated(updateType)
	if( updateType == c_LOG_UPDATE_TYPE_ADDED ) then
		local _, filterId, text = TextLogGetEntry( "Combat", TextLogGetNumEntries("Combat") - 1 )
		
		if( tchat_debug ) then
			--TidyChatUtils.Debug(L"TidyChat.OnCombatLogUpdated, updateType = " .. towstring(updateType) .. L", filterId = " .. towstring(filterId) .. L", text = " .. towstring(text))
			TextLogAddEntry(c_TIDY_CHAT_LOG, filterId, L"[Combat(" .. filterId .. L")]: " .. text)
		end
	end
end


function TidyChat.OnSystemLogUpdated(updateType)
	if( updateType == c_LOG_UPDATE_TYPE_ADDED ) then
		local _, filterId, text = TextLogGetEntry( "System", TextLogGetNumEntries("System") - 1 )
		
		if( tchat_debug ) then
			--TidyChatUtils.Debug(L"TidyChat.OnSystemLogUpdated, updateType = " .. towstring(updateType) .. L", filterId = " .. towstring(filterId) .. L", text = " .. towstring(text))
			TextLogAddEntry(c_TIDY_CHAT_LOG, filterId + 10000, L"[System(" .. filterId .. L")]: " .. text)
		end
	end
end



end
-----------------------------------
-- end Logs
-----------------------------------





-----------------------------------
-- Logs Loot Roll
-----------------------------------
do

local rollCache = {}
local usedCacheIndex = 0
local maxCache	= 100


-- Default language - english
--[[
TEXT_YOU_SELECT_NEED_FOR	You select Need for <<1>>.
TEXT_YOU_SELECT_GREED_FOR	You select Greed for <<1>>.
TEXT_YOU_SELECT_PASS_FOR	You select Pass for <<1>>.
TEXT_SELECTS_NEED_FOR	<<1>> selects Need for <<2>>.
TEXT_SELECTS_GREED_FOR	<<1>> selects Greed for <<2>>.
TEXT_SELECTS_PASS_FOR	<<1>> selects Pass for <<2>>.
TEXT_NEED_ROLL_HEADER	<<1>> - Need Roll.
TEXT_GREED_ROLL_HEADER	<<1>> - Greed Roll.
TEXT_ALL_PASSED_HEADER	<<1>> - All Passed.
TEXT_LOOT_TIE_BREAKER	There was a tie! Rolling for the tie breaker...
TEXT_YOU_ROLL_NUM_BONUS	You roll <<1>> (<<2>> + <<3>> bonus).
TEXT_NAME_ROLLS_NUM_BONUS	<<1>> rolls a <<2>> (<<3>> + <<4>> bonus).
TEXT_YOU_ROLL_NUMBER	You roll <<1>>.
TEXT_NAME_ROLLS_NUMBER	<<1>> rolls a <<2>>.
TEXT_WINNER_HEADER	Winner - <<1>>.
--]]

local find_TEXT_SELECT = L" select[s]? [NeedGreedPass]+ for "
local find_TEXT_NEEDGREED_ROLL_HEADER = L" %- [NeedGreed]+ Roll%.$"
local find_TEXT_ALL_PASSED_HEADER = L" %- All Passed%.$"
local equal_TEXT_LOOT_TIE_BREAKER = L"There was a tie! Rolling for the tie breaker..."
local match_TEXT_ROLL_NUMBER = L"^([^%s]+) roll[s a]* ([0-9]+)%.$"
local find_TEXT_WINNER_HEADER = L"^Winner %- "


-- Language - russian
--[[
TEXT_YOU_SELECT_NEED_FOR	Âû íóæäàåòåñü â ïðåäìåòå: <<1>>.
TEXT_YOU_SELECT_GREED_FOR	Âû õîòèòå ïðåäìåò: <<1>>.
TEXT_YOU_SELECT_PASS_FOR	Âû îòêàçûâàåòåñü îò ïðåäìåòà: <<1>>.
TEXT_SELECTS_NEED_FOR	<<C:1>> íóæäàåòñÿ â ïðåäìåòå: <<2>>.
TEXT_SELECTS_GREED_FOR	<<C:1>> õî÷åò ïðåäìåò: <<2>>.
TEXT_SELECTS_PASS_FOR	<<C:1>> îòêàçûâàåòñÿ îò ïðåäìåòà: <<2>>.
TEXT_NEED_ROLL_HEADER	<<C:1>> - æåðåáüåâêà ñðåäè íóæäàþùèõñÿ.
TEXT_GREED_ROLL_HEADER	<<C:1>> - æåðåáüåâêà ñðåäè æåëàþùèõ.
TEXT_ALL_PASSED_HEADER	<<C:1>> - âñå îòêàçàëèñü.
TEXT_LOOT_TIE_BREAKER	Íè÷üÿ! Äîïîëíèòåëüíàÿ æåðåáüåâêà...
TEXT_YOU_ROLL_NUM_BONUS	Âû áðîñèëè æðåáèé: <<1>> (<<2>> + <<3>> äîï.).
TEXT_NAME_ROLLS_NUM_BONUS	<<C:1>> áðîñàåò æðåáèé: <<2>> (<<3>> + <<4>> äîï.).
TEXT_YOU_ROLL_NUMBER	Âû áðîñèëè æðåáèé: <<1>> .
TEXT_NAME_ROLLS_NUMBER	<<C:1>> áðîñàåò æðåáèé: <<2>> .
TEXT_WINNER_HEADER	Ïîáåäèòåëü - <<1>>.
--]]


if( SystemData.Settings.Language.active == SystemData.Settings.Language.RUSSIAN ) then
	find_TEXT_SELECT = L" \x043F\x0440\x0435\x0434\x043C\x0435\x0442[\x0430\x043E\x043C\x0435]*: "
	find_TEXT_NEEDGREED_ROLL_HEADER = L" %- \x0436\x0435\x0440\x0435\x0431\x044C\x0435\x0432\x043A\x0430 \x0441\x0440\x0435\x0434\x0438 [\x043D\x0443\x0436\x0434\x0430\x044E\x0449\x0438\x0445\x0441\x044F\x0436\x0435\x043B\x0430\x044E\x0449\x0438\x0445]+%.$"
	find_TEXT_ALL_PASSED_HEADER = L" %- \x0432\x0441\x0435 \x043E\x0442\x043A\x0430\x0437\x0430\x043B\x0438\x0441\x044C%.$"
	equal_TEXT_LOOT_TIE_BREAKER = L"\x041D\x0438\x0447\x044C\x044F! \x0414\x043E\x043F\x043E\x043B\x043D\x0438\x0442\x0435\x043B\x044C\x043D\x0430\x044F \x0436\x0435\x0440\x0435\x0431\x044C\x0435\x0432\x043A\x0430..."
	match_TEXT_ROLL_NUMBER = L"^([^%s]+) \x0431\x0440\x043E\x0441[\x0430\x0435\x0442\x0438\x043B\x0438]+ \x0436\x0440\x0435\x0431\x0438\x0439: ([0-9]+)%s%.$"
	find_TEXT_WINNER_HEADER = L"^\x041F\x043E\x0431\x0435\x0434\x0438\x0442\x0435\x043B\x044C %- "
end


-- Language - german
--[[
TEXT_YOU_SELECT_NEED_FOR	Ihr wählt "Bedarf" für <<akk,A:1>>.
TEXT_YOU_SELECT_GREED_FOR	Ihr wählt "Gier" für <<akk,A:1>>.
TEXT_YOU_SELECT_PASS_FOR	Ihr wählt "Passen" für <<akk,A:1>>.
TEXT_SELECTS_NEED_FOR	<<C:1>> wählt "Bedarf" für <<akk,A:2>>.
TEXT_SELECTS_GREED_FOR	<<C:1>> wählt "Gier" für <<akk,A:2>>.
TEXT_SELECTS_PASS_FOR	<<C:1>> wählt "Passen" für <<akk,A:2>>.
TEXT_NEED_ROLL_HEADER	Für <<akk,A:1>> wird der Bedarf ausgewürfelt:
TEXT_GREED_ROLL_HEADER	Für <<akk,A:1>> wird die Gier ausgewürfelt:
TEXT_ALL_PASSED_HEADER	<<1>>: Alle haben gepasst.
TEXT_LOOT_TIE_BREAKER	Gleichstand! Gewinner wird ausgewürfelt...
TEXT_YOU_ROLL_NUM_BONUS	Ihr würfelt eine <<1>> (<<2>> + <<3>> Punkte).
TEXT_NAME_ROLLS_NUM_BONUS	<<1>> würfelt eine <<2>> (<<3>> + <<4>> Punkte).
TEXT_YOU_ROLL_NUMBER	Ihr würfelt eine <<1>>.
TEXT_NAME_ROLLS_NUMBER	<<1>> würfelt eine <<2>>.
TEXT_WINNER_HEADER	Und <<1{der Gewinner ist: $s/die Gewinnerin ist: $s}>>.
--]]

if( SystemData.Settings.Language.active == SystemData.Settings.Language.GERMAN ) then
	find_TEXT_SELECT = L" wählt [\"BedarfGierPassen]+ für "
	find_TEXT_NEEDGREED_ROLL_HEADER = L"^Für d[asen]+ .+ wird d[erie]+ ([BedarfGier]+) ausgewürfelt:$"
	find_TEXT_ALL_PASSED_HEADER = L": Alle haben gepasst%.$"
	equal_TEXT_LOOT_TIE_BREAKER = L"Gleichstand! Gewinner wird ausgewürfelt..."
	match_TEXT_ROLL_NUMBER = L"^([^%s]+) würfelt eine ([0-9]+)%.$"
	find_TEXT_WINNER_HEADER = L"^Und d[erie]+ Gewinner[in]* ist: "
end


-- Language - french
--[[
TEXT_YOU_SELECT_NEED_FOR	Vous avez choisi Besoin pour <<1>>.
TEXT_YOU_SELECT_GREED_FOR	Vous avez choisi Cupidité pour <<1>>.
TEXT_YOU_SELECT_PASS_FOR	Vous avez choisi de Passer pour <<1>>.
TEXT_SELECTS_NEED_FOR	<<1>> choisit Besoin pour <<2>>.
TEXT_SELECTS_GREED_FOR	<<1>> choisit Cupidité pour <<2>>.
TEXT_SELECTS_PASS_FOR	<<1>> choisit de Passer pour <<2>>.
TEXT_NEED_ROLL_HEADER	<<1>> - Lancer requis.
TEXT_GREED_ROLL_HEADER	<<1>> - Jet de cupidité.
TEXT_ALL_PASSED_HEADER	<<1>> - Tous passés.
TEXT_LOOT_TIE_BREAKER	Il y a une égalité ! Jet de dé pour départager...
TEXT_YOU_ROLL_NUM_BONUS	Vous obtenez <<1>> (<<2>> + <<3>> bonus).
TEXT_NAME_ROLLS_NUM_BONUS	<<1>> obtient un <<2>> (<<3>> + <<4>> bonus).
TEXT_YOU_ROLL_NUMBER	Vous obtenez <<1>>.
TEXT_NAME_ROLLS_NUMBER	<<1>> obtient un <<2>>.
TEXT_WINNER_HEADER	Gagnant - <<1>>.
--]]

if( SystemData.Settings.Language.active == SystemData.Settings.Language.FRENCH ) then
	find_TEXT_SELECT = L" choisi[t]? [BesoinCupiditéde Passer]+ pour "
	find_TEXT_NEEDGREED_ROLL_HEADER = L" %- ([Lancer requisJet de cupidité]+)%.$"
	find_TEXT_ALL_PASSED_HEADER = L" %- Tous passés%.$"
	equal_TEXT_LOOT_TIE_BREAKER = L"Il y a une égalité ! Jet de dé pour départager..."
	match_TEXT_ROLL_NUMBER = L"^([^%s]+) obt[ientenez]+[ un]* ([0-9]+)%.$"
	find_TEXT_WINNER_HEADER = L"^Gagnant %- "
end


-- Language - italian
--[[
TEXT_YOU_SELECT_NEED_FOR	Selezioni Bisogno per <<1>>.
TEXT_YOU_SELECT_GREED_FOR	Selezioni Avidità per <<1>>.
TEXT_YOU_SELECT_PASS_FOR	Selezioni Passaggio per <<1>>.
TEXT_SELECTS_NEED_FOR	<<1>> seleziona Bisogno per <<2>>.
TEXT_SELECTS_GREED_FOR	<<1>> seleziona Avidità per <<2>>.
TEXT_SELECTS_PASS_FOR	<<1>> seleziona Passaggio per <<2>>.
TEXT_NEED_ROLL_HEADER	<<1>> - Tiro Bisogno.
TEXT_GREED_ROLL_HEADER	<<1>> - Tiro Avidità.
TEXT_ALL_PASSED_HEADER	<<1>> - Passano tutti.
TEXT_LOOT_TIE_BREAKER	C'è stato un pareggio! Rilancia per uno spareggio...
TEXT_YOU_ROLL_NUM_BONUS	Fai <<1>> (<<2>> + <<3>> bonus).
TEXT_NAME_ROLLS_NUM_BONUS	<<1>> fa un <<2>> (<<3>> + <<4>> bonus).
TEXT_YOU_ROLL_NUMBER	Fai <<1>>.
TEXT_NAME_ROLLS_NUMBER	<<1>> tira un <<2>>.
TEXT_WINNER_HEADER	Vincitore - <<1>>.
--]]

if( SystemData.Settings.Language.active == SystemData.Settings.Language.ITALIAN ) then
	find_TEXT_SELECT = L"[Ss]elezion[ia] [BisognoAviditàPassaggio]+ per "
	find_TEXT_NEEDGREED_ROLL_HEADER = L" %- Tiro ([BisognoAvidità]+)%.$"
	find_TEXT_ALL_PASSED_HEADER = L" %- Tutti passano%.$"
	equal_TEXT_LOOT_TIE_BREAKER = L"C'è stato un pareggio! Rilancia per uno spareggio..."
	match_TEXT_ROLL_NUMBER = L"^([^%s]+) [tira un]-([0-9]+)%.$"
	find_TEXT_WINNER_HEADER = L"^Vincitore %- "
end


-- Language - spanish
--[[
TEXT_YOU_SELECT_NEED_FOR	Has seleccionado Necesidad para <<1>>.
TEXT_YOU_SELECT_GREED_FOR	Has seleccionado Avaricia para <<1>>.
TEXT_YOU_SELECT_PASS_FOR	Has seleccionado pase por <<1>>.
TEXT_SELECTS_NEED_FOR	<<1>> selecciona necesidad para <<2>>.
TEXT_SELECTS_GREED_FOR	<<1>> selecciona avaricia para <<2>>.
TEXT_SELECTS_PASS_FOR	<<1>> selecciona Pase para <<2>>.
TEXT_NEED_ROLL_HEADER	<<1>> - Necesita tirar.
TEXT_GREED_ROLL_HEADER	<<1>> - Tirada de la avaricia.
TEXT_ALL_PASSED_HEADER	<<1>> - Todas otorgadas.
TEXT_LOOT_TIE_BREAKER	¡Empate! Tirando para el desempate...
TEXT_YOU_ROLL_NUM_BONUS	Tiras<<1>> (Bonificación de <<2>> + <<3>>).
TEXT_NAME_ROLLS_NUM_BONUS	<<1>> tira <<2>> (<<3>> + <<4>> bonificación).
TEXT_YOU_ROLL_NUMBER	Tiras <<1>>.
TEXT_NAME_ROLLS_NUMBER	<<1>> tira <<2>>.
TEXT_WINNER_HEADER	Ganador - <<1>>.
--]]

if( SystemData.Settings.Language.active == SystemData.Settings.Language.SPANISH ) then
	find_TEXT_SELECT = L" selecciona[do]* [NnecesidadAavariciaPpase]+ p[araor]+ "
	find_TEXT_NEEDGREED_ROLL_HEADER = L" %- [Necesita tirarTirada de la avaricia]+.$"
	find_TEXT_ALL_PASSED_HEADER = L" %- - Todas otorgadas%.$"
	equal_TEXT_LOOT_TIE_BREAKER = L"¡Empate! Tirando para el desempate..."
	match_TEXT_ROLL_NUMBER = L"^([^%s]+) [tira ]-([0-9]+)%.$"
	find_TEXT_WINNER_HEADER = L"^Ganador %- "
end


function TidyChatLogs.ProcessLootRollEntry(text)
	if( not text ) then return end
	
	if( tchat_debug ) then TidyChatUtils.Debug(L"TidyChatLogs.ProcessLootRollEntry = <" .. text .. L">") end
	
	local value1, value2 = wstring_match(text, match_TEXT_ROLL_NUMBER)
	if( value1 and value2 ) then
		local itemRollData = rollCache[usedCacheIndex]
		
		if( tchat_debug ) then TidyChatUtils.Debug(L"matchStrRollNumber -> " .. value1 .. L"," .. value2 .. L"; usedCacheIndex = " .. usedCacheIndex) end
		
		if( itemRollData ) then
			if( itemRollData.playersRollDataStr ) then
				itemRollData.playersRollDataStr = itemRollData.playersRollDataStr .. L"," .. value1 .. L" " .. value2
			else
				itemRollData.playersRollDataStr = value1 .. L" " .. value2
			end
		end
		
		return true
	end
	
	
	if( wstring_find(text, find_TEXT_SELECT) ) then
		if( tchat_debug ) then DEBUG(L"exclude -> " .. text) end
		return true
	end
	
	
	if( wstring_find(text, find_TEXT_WINNER_HEADER) ) then
		local linkText		= text
		
		if( tchat_debug ) then TidyChatUtils.Debug(L"find_TEXT_WINNER_HEADER -> ; usedCacheIndex = " .. usedCacheIndex) end
		
		local itemRollData = rollCache[usedCacheIndex]
		if( itemRollData ) then
			itemRollData.info		= itemRollData.info .. L"\n" .. text
			
			linkText = itemRollData.info
		end
		
		local color = ChatSettings.ChannelColors[c_ADVANCED_LOOT_ROLL_CHANNEL_ID]

		TextLogAddEntry("Chat", c_ADVANCED_LOOT_ROLL_CHANNEL_ID, L"<LINK data=\"TCROLL:" .. usedCacheIndex .. L"\" text=\"" .. linkText .. L"\" color=\"" .. math.floor(color.r) .. L"," .. math.floor(color.g) .. L"," .. math.floor(color.b) .. L"\">")
		
		return true
	end
	
	
	if( wstring_find(text, find_TEXT_NEEDGREED_ROLL_HEADER) ) then
		
		usedCacheIndex = usedCacheIndex + 1
		
		if( usedCacheIndex > maxCache ) then
			usedCacheIndex = 1
		end
		
		rollCache[usedCacheIndex] = rollCache[usedCacheIndex] or {}
		local itemRollData = rollCache[usedCacheIndex]
		
		itemRollData.info = text
		itemRollData.playersRollDataStr = nil
		
		if( tchat_debug ) then TidyChatUtils.Debug(L"matchStrRoll -> ") end
		return true
	end
	
	
	if( text == equal_TEXT_LOOT_TIE_BREAKER ) then
		local itemRollData = rollCache[usedCacheIndex]
		
		if( itemRollData ) then
			itemRollData.playersRollDataStr = nil
		end
		
		return true
	end
	
	
	--TidyChatUtils.Debug(L"Cant match roll str -> " .. text)
	if( tchat_debug ) then DEBUG(L"Cant match roll str -> " .. text) end
	
	TextLogAddEntry("Chat", c_ADVANCED_LOOT_ROLL_CHANNEL_ID, text)
	
	return false
end


function TidyChatLogs.DebugRoll(rollIndex)
	if( tchat_debug ) then
		TidyChatUtils.Debug("rollIndex = " .. rollIndex)
		
		d(rollCache[rollIndex])
	end
end


function TidyChatLogs.GetItemRollData(rollIndex)
	local itemRollData
	
	if( rollCache[rollIndex] ) then
		itemRollData = WStringSplit(rollCache[rollIndex].playersRollDataStr, L",")
		itemRollData.info = rollCache[rollIndex].info
		
		for index, playerRollDataStr in ipairs(itemRollData) do
			itemRollData[index] = WStringSplit(playerRollDataStr)
		end
		
	end
	
	return itemRollData
end


end
-----------------------------------
-- end Logs Loot Roll
-----------------------------------





-----------------------------------
-- Utils
-----------------------------------
do


local function CheckSettingsTable( DefaultSettings, SavedSettings, LocalSettings, settingKey )
	if( settingKey ) then
		SavedSettings[settingKey] = SavedSettings[settingKey] or {}
		LocalSettings[settingKey] = LocalSettings[settingKey] or {}
		
		SavedSettings = SavedSettings[settingKey]
		LocalSettings = LocalSettings[settingKey]
	end
	
	
	for key, default in pairs( DefaultSettings ) do
		local setting		= SavedSettings[key]
		local old_setting	= LocalSettings[key]
		
		if( type(setting) == type(default) ) then
			LocalSettings[key] = setting
			
		elseif( type(old_setting) == type(default) ) then
			SavedSettings[key] = old_setting
			
		else
			LocalSettings[key]	= default
			SavedSettings[key]	= default
		end
	end

end




function TidyChatUtils.Debug(str)
	if( tchat_debug ) then
		DEBUG(L"TidyChat: " .. towstring(str))
	end
end


function TidyChatUtils.Print(wstr)
	if( type(wstr) == "wstring" ) then
		TextLogAddEntry("Chat", 0, wstr)
	end
end


function TidyChatUtils.SetupSettings()
	TidyChatUtils.Debug("TidyChatUtils.SetupSettings")
		
	CheckSettingsTable( DefaultSettings, SavedSettings, Settings )
	
	for wndGroupId, wndGroup in ipairs( EA_ChatWindowGroups ) do
		CheckSettingsTable( DefaultWindowSettings, SavedSettings, Settings, wndGroupId )
		
		if( Settings[wndGroupId].chatwindow_click_through ) then
			Settings[wndGroupId].scrollbar_position = c_SCROLLBAR_POSITION_HIDDEN
		end
	end
end


function TidyChatUtils.GetScrollBarAlphaSetting(wndGroupId)
	
	local scrollbar_alpha
	
	if( not Settings[wndGroupId].scrollbar_fadeout_enable or EA_ChatWindowGroups[wndGroupId].fadedIn ) then
		scrollbar_alpha		= Settings[wndGroupId].scrollbar_fadein_alpha
	else
		scrollbar_alpha		= Settings[wndGroupId].scrollbar_fadeout_alpha
	end
	
	return scrollbar_alpha
end


function TidyChatUtils.OnSettingsChanged()
	TidyChatUtils.SetupSettings()
	TidyChatFrames.ResetAll()
end


function TidyChatUtils.CopyWindowSettingsFromTo(wndGroupIdFrom, wndGroupIdTo)
	if( Settings[wndGroupIdFrom] and Settings[wndGroupIdTo] ) then
		SavedSettings[wndGroupIdTo] = SavedSettings[wndGroupIdTo] or {}
		
		for key, value in pairs(Settings[wndGroupIdFrom]) do
			Settings[wndGroupIdTo][key] = value
			SavedSettings[wndGroupIdTo][key] = value
		end
	end
end



end
-----------------------------------
-- end Utils
-----------------------------------





-----------------------------------
-- Options
-----------------------------------
do


local TCHAT_TITLE_LABEL								= c_TIDY_CHAT_OPTIONS .. "TitleLabel"
local TCHAT_VERSION_LABEL							= c_TIDY_CHAT_OPTIONS .. "VersionLabel"
local TCHAT_CLOSE_BUTTON							= c_TIDY_CHAT_OPTIONS .. "CloseButton"
local TCHAT_APPLY_BUTTON							= c_TIDY_CHAT_OPTIONS .. "ApplyButton"
local TCHAT_REVERT_BUTTON							= c_TIDY_CHAT_OPTIONS .. "RevertButton"
local TCHAT_CLOSE_BOTTOM_BUTTON						= c_TIDY_CHAT_OPTIONS .. "CloseBottomButton"

-- TABS

local TCHAT_WINDOWS_TAB								= 1
local TCHAT_TEXT_ENTRY_TAB							= 2
local TCHAT_LOGS_TAB								= 3
local TCHAT_MISC_TAB								= 4

local tabs = {
	[TCHAT_WINDOWS_TAB]								= { windowName = c_TIDY_CHAT_OPTIONS .. "TabWindows",	buttonName = c_TIDY_CHAT_OPTIONS .. "ViewMode1" },
	[TCHAT_TEXT_ENTRY_TAB]							= { windowName = c_TIDY_CHAT_OPTIONS .. "TabTextEntry",	buttonName = c_TIDY_CHAT_OPTIONS .. "ViewMode2" },
	[TCHAT_LOGS_TAB]								= { windowName = c_TIDY_CHAT_OPTIONS .. "TabLogs",		buttonName = c_TIDY_CHAT_OPTIONS .. "ViewMode3" },
	[TCHAT_MISC_TAB]								= { windowName = c_TIDY_CHAT_OPTIONS .. "TabMisc",		buttonName = c_TIDY_CHAT_OPTIONS .. "ViewMode4" },
}

local selectedTab


-- Tab Chat Windows
local TCHAT_WINDOWS_SELECT_WINDOW_LABEL				= tabs[TCHAT_WINDOWS_TAB].windowName .. "SelectWindowLabel"
local TCHAT_WINDOWS_SELECT_WINDOW_COMBO				= tabs[TCHAT_WINDOWS_TAB].windowName .. "SelectWindowCombo"
local TCHAT_WINDOWS_TABS_INFO_LABEL					= tabs[TCHAT_WINDOWS_TAB].windowName .. "TabsInfoLabel"
local TCHAT_WINDOWS_GROUP_TAB						= tabs[TCHAT_WINDOWS_TAB].windowName .. "Group"
local TCHAT_WINDOWS_TABS_SHOWING_CHECKBOX			= "TabsShowingCheckbox"
local TCHAT_WINDOWS_BG_SHOWING_CHECKBOX				= "BGShowingCheckbox"
local TCHAT_WINDOWS_CLICK_THROUGH_CHECKBOX			= "ClickThroughCheckbox"
local TCHAT_WINDOWS_SCROLLBAR_LABEL					= "ScrollbarLabel"
local TCHAT_WINDOWS_POSITION_LABEL					= "PositionLabel"
local TCHAT_WINDOWS_SCROLLBAR_POSITION_COMBO		= "ScrollbarPositionCombo"
local TCHAT_WINDOWS_SCROLLBAR_FADEIN_ALPHA_LABEL	= "ScrollbarFadeinAlphaLabel"
local TCHAT_WINDOWS_SCROLLBAR_FADEIN_ALPHA_SLIDER	= "ScrollbarFadeinAlphaSlider"
local TCHAT_WINDOWS_SCROLLBAR_FADEOUT_CHECKBOX		= "ScrollbarFadeoutCheckbox"
local TCHAT_WINDOWS_SCROLLBAR_FADEOUT_ALPHA_LABEL	= "ScrollbarFadeoutAlphaLabel"
local TCHAT_WINDOWS_SCROLLBAR_FADEOUT_ALPHA_SLIDER	= "ScrollbarFadeoutAlphaSlider"

-- Tab Text Entry
local TCHAT_TEXT_ENTRY_TEXT_ENTRY_LABEL				= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "TextEntryLabel"
local TCHAT_TEXT_ENTRY_FREE_TEXT_ENTRY_CHECKBOX		= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "FreeTextEntryCheckbox"
local TCHAT_TEXT_ENTRY_RELATIVE_TO_LABEL			= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "RelativeToLabel"
local TCHAT_TEXT_ENTRY_RELATIVE_TO_COMBO			= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "RelativeToCombo"
local TCHAT_TEXT_ENTRY_ANCHOR_POINT_LABEL			= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "AnchorPointLabel"
local TCHAT_TEXT_ENTRY_ANCHOR_POINT_COMBO			= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "AnchorPointCombo"
local TCHAT_TEXT_ENTRY_BACKGROUND_ALPHA_LABEL		= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "BackgroundAlphaLabel"
local TCHAT_TEXT_ENTRY_BACKGROUND_ALPHA_SLIDER		= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "BackgroundAlphaSlider"
local TCHAT_TEXT_ENTRY_CHANNEL_LABEL				= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "ChannelLabel"
local TCHAT_TEXT_ENTRY_CHANNEL_SHOWING_CHECKBOX		= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "ChannelShowingCheckbox"
local TCHAT_TEXT_ENTRY_CHANNEL_ALPHA_LABEL			= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "ChannelAlphaLabel"
local TCHAT_TEXT_ENTRY_CHANNEL_ALPHA_SLIDER			= tabs[TCHAT_TEXT_ENTRY_TAB].windowName .. "ChannelAlphaSlider"

-- Tab Logs
local TCHAT_LOGS_AUCTION_FILTER_CHECKBOX			= tabs[TCHAT_LOGS_TAB].windowName .. "AuctionFilterCheckbox"
local TCHAT_LOGS_LOOT_ROLL_FILTER_CHECKBOX			= tabs[TCHAT_LOGS_TAB].windowName .. "LootRollFilterCheckbox"
local TCHAT_LOGS_COPY_SHOWING_CHECKBOX				= tabs[TCHAT_LOGS_TAB].windowName .. "CopyShowingCheckbox"

-- Tab Misc
local TCHAT_MISC_SOCIAL_SHOWING_CHECKBOX			= tabs[TCHAT_MISC_TAB].windowName .. "SocialShowingCheckbox"
local TCHAT_MISC_TOBOTTOM_SHOWING_CHECKBOX			= tabs[TCHAT_MISC_TAB].windowName .. "ToBottomShowingCheckbox"



function TidyChatOptions.InitializeOptions()
	TidyChatUtils.Debug("TidyChatOptions.InitializeOptions")
	
	TidyChatOptions.InitializeGroupTabs()
	
	TidyChatOptions.SetupStringTables()
	TidyChatOptions.SetAllText()
	TidyChatOptions.RemoveStringTables()
	
	TidyChatOptions.ShowTab(TCHAT_WINDOWS_TAB)
end


function TidyChatOptions.SetupStringTables()
	-- Labels
	TidyChatOptions.labelStrings = {
		[TCHAT_TITLE_LABEL]											= L"Tidy Chat Options",
		[TCHAT_VERSION_LABEL]										= L"v" .. TidyChat.dVersion,
				
		[TCHAT_TEXT_ENTRY_TEXT_ENTRY_LABEL]							= L"Text entry",
		[TCHAT_TEXT_ENTRY_FREE_TEXT_ENTRY_CHECKBOX .. "Label"]		= L"Free text entry",
		[TCHAT_TEXT_ENTRY_RELATIVE_TO_LABEL]						= L"Relative to:",
		[TCHAT_TEXT_ENTRY_ANCHOR_POINT_LABEL]						= L"Anchor point:",
		[TCHAT_TEXT_ENTRY_BACKGROUND_ALPHA_LABEL]					= L"Background opacity:",
		[TCHAT_TEXT_ENTRY_CHANNEL_LABEL]							= L"Channel button",
		[TCHAT_TEXT_ENTRY_CHANNEL_SHOWING_CHECKBOX .. "Label"]		= L"Show channel button",
		[TCHAT_TEXT_ENTRY_CHANNEL_ALPHA_LABEL]						= L"Channel button opacity:",

		[TCHAT_WINDOWS_SELECT_WINDOW_LABEL]							= L"Select Window",
		
		[TCHAT_LOGS_AUCTION_FILTER_CHECKBOX .. "Label"]				= L"Show additional auction filter (need to Reload UI)",
		[TCHAT_LOGS_LOOT_ROLL_FILTER_CHECKBOX .. "Label"]			= L"Show advanced loot roll filter (need to Reload UI)",
		[TCHAT_LOGS_COPY_SHOWING_CHECKBOX .. "Label"]				= L"Show \"Copy...\" button in context menu",
		
		[TCHAT_MISC_SOCIAL_SHOWING_CHECKBOX .. "Label"]				= L"Show social button",
		[TCHAT_MISC_TOBOTTOM_SHOWING_CHECKBOX .. "Label"]			= L"Show \"ToBottom\" button in context menu",
	}
	
	for _, groupTabName in ipairs( TidyChatOptions.GroupTabs ) do
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_TABS_SHOWING_CHECKBOX .. "Label"]		= L"Show tabs"
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_BG_SHOWING_CHECKBOX .. "Label"]			= L"Show background"
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_CLICK_THROUGH_CHECKBOX .. "Label"]		= L"Click throught chat window"
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_SCROLLBAR_LABEL]							= L"Scrollbar"
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_POSITION_LABEL]							= L"Position:"
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEIN_ALPHA_LABEL]			= L"Faded-in opacity:"
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_CHECKBOX .. "Label"]	= L"Enable fade-out"
		TidyChatOptions.labelStrings[groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_ALPHA_LABEL]			= L"Faded-out opacity:"
	end
	
	
	-- Buttons
	TidyChatOptions.buttonsStrings = {
		[TCHAT_APPLY_BUTTON]										= L"Apply",
		[TCHAT_REVERT_BUTTON]										= L"Revert",
		[TCHAT_CLOSE_BOTTOM_BUTTON]									= L"Close",
		
		[tabs[TCHAT_WINDOWS_TAB].buttonName]						= L"Chat Windows",
		[tabs[TCHAT_TEXT_ENTRY_TAB].buttonName]						= L"Text Entry",
		[tabs[TCHAT_LOGS_TAB].buttonName]							= L"Logs",
		[tabs[TCHAT_MISC_TAB].buttonName]							= L"Misc",
	}
	
	
	-- Comboboxes
	TidyChatOptions.comboStrings = {
		[TCHAT_TEXT_ENTRY_ANCHOR_POINT_COMBO]						= { L"Top", L"Bottom", },
	}
	
	local pointer = { L"Left", L"Right", L"Hidden", }
	for _, groupTabName in ipairs( TidyChatOptions.GroupTabs ) do
		TidyChatOptions.comboStrings[groupTabName .. TCHAT_WINDOWS_SCROLLBAR_POSITION_COMBO]	= pointer
	end
end


function TidyChatOptions.RemoveStringTables()
	TidyChatOptions.labelStrings		= nil
	TidyChatOptions.buttonsStrings		= nil
	TidyChatOptions.comboStrings		= nil
end


function TidyChatOptions.SetAllText()
	-- Labels
	for labelName, text in pairs( TidyChatOptions.labelStrings ) do
		LabelSetText(labelName, text)
	end
	
	-- Buttons
	for buttonName, text in pairs( TidyChatOptions.buttonsStrings ) do
		ButtonSetText(buttonName, text)
	end
	
	-- Comboboxes
	for comboName, textTable in pairs( TidyChatOptions.comboStrings ) do
		ComboBoxClearMenuItems(comboName)
		for _, text in ipairs(textTable) do
			ComboBoxAddMenuItem(comboName, text)
		end
	end
end


function TidyChatOptions.UpdateGroupComboboxes()
	local comboList = { TCHAT_WINDOWS_SELECT_WINDOW_COMBO, TCHAT_TEXT_ENTRY_RELATIVE_TO_COMBO, }
	
	local comboTextTable = {}
	local addAll = false
	for wndGroupId = #EA_ChatWindowGroups, 1, -1 do
		wndGroup = EA_ChatWindowGroups[wndGroupId]
		if( ( wndGroup and wndGroup.used ) or addAll ) then
			addAll = true
			
			comboTextTable[wndGroupId] = L"Window " .. wndGroupId
			if( not wndGroup.used ) then
				comboTextTable[wndGroupId] = comboTextTable[wndGroupId] .. L" (deleted)"
			end
		end
	end
	
	local numMenuItems	= #comboTextTable
	
	for _, comboName in ipairs( comboList ) do
		local selectedTab	= ComboBoxGetSelectedMenuItem(comboName)
		
		ComboBoxClearMenuItems(comboName)
		for _, text in ipairs( comboTextTable ) do
			ComboBoxAddMenuItem(comboName, text)
		end
		
		if( not selectedTab or selectedTab == 0 ) then
			selectedTab = 1
		elseif( selectedTab > numMenuItems ) then
			selectedTab = numMenuItems
		end
		
		ComboBoxSetSelectedMenuItem(comboName, selectedTab)
	end
	
	TidyChatOptions.UpdateGroupTabs()
end


function TidyChatOptions.UpdateDisabledFlags()
	local pressed
	
	for _, groupTabName in ipairs( TidyChatOptions.GroupTabs ) do
		pressed = ButtonGetPressedFlag(groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_CHECKBOX .. "Button")
		WindowSetShowing(groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_ALPHA_LABEL, pressed)
		WindowSetShowing(groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_ALPHA_SLIDER, pressed)
		
		pressed = ButtonGetPressedFlag(groupTabName .. TCHAT_WINDOWS_CLICK_THROUGH_CHECKBOX .. "Button")
		ComboBoxSetDisabledFlag(groupTabName .. TCHAT_WINDOWS_SCROLLBAR_POSITION_COMBO, pressed)
	end
	
	pressed = ButtonGetPressedFlag(TCHAT_TEXT_ENTRY_FREE_TEXT_ENTRY_CHECKBOX .. "Button")
	ComboBoxSetDisabledFlag( TCHAT_TEXT_ENTRY_RELATIVE_TO_COMBO, pressed )
	
	pressed = ButtonGetPressedFlag(TCHAT_TEXT_ENTRY_CHANNEL_SHOWING_CHECKBOX .. "Button")
	WindowSetShowing(TCHAT_TEXT_ENTRY_CHANNEL_ALPHA_LABEL, pressed)
	WindowSetShowing(TCHAT_TEXT_ENTRY_CHANNEL_ALPHA_SLIDER, pressed)
end


function TidyChatOptions.Reset()
	TidyChatUtils.Debug("TidyChatOptions.Reset")
	
	-- Tab Chat Windows
	for index, groupTabName in ipairs( TidyChatOptions.GroupTabs ) do
		ButtonSetPressedFlag(			groupTabName .. TCHAT_WINDOWS_TABS_SHOWING_CHECKBOX .. "Button",		Settings[index].chatwindow_tabs_showing )
		ButtonSetPressedFlag(			groupTabName .. TCHAT_WINDOWS_BG_SHOWING_CHECKBOX .. "Button",			Settings[index].chatwindow_background_showing )
		ButtonSetPressedFlag(			groupTabName .. TCHAT_WINDOWS_CLICK_THROUGH_CHECKBOX .. "Button",		Settings[index].chatwindow_click_through )
		ComboBoxSetSelectedMenuItem(	groupTabName .. TCHAT_WINDOWS_SCROLLBAR_POSITION_COMBO,					Settings[index].scrollbar_position )
		SliderBarSetCurrentPosition(	groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEIN_ALPHA_SLIDER,			Settings[index].scrollbar_fadein_alpha )
		ButtonSetPressedFlag(			groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_CHECKBOX .. "Button",	Settings[index].scrollbar_fadeout_enable )
		SliderBarSetCurrentPosition(	groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_ALPHA_SLIDER,			Settings[index].scrollbar_fadeout_alpha )
	end
	
	-- Tab Text Entry
	ButtonSetPressedFlag(				TCHAT_TEXT_ENTRY_FREE_TEXT_ENTRY_CHECKBOX .. "Button",					Settings.textentry_free )
	ComboBoxSetSelectedMenuItem(		TCHAT_TEXT_ENTRY_RELATIVE_TO_COMBO,										Settings.textentry_relative_to )
	ComboBoxSetSelectedMenuItem(		TCHAT_TEXT_ENTRY_ANCHOR_POINT_COMBO,									Settings.textentry_anchor_point )
	SliderBarSetCurrentPosition(		TCHAT_TEXT_ENTRY_BACKGROUND_ALPHA_SLIDER,								Settings.textentry_background_alpha )
	ButtonSetPressedFlag(				TCHAT_TEXT_ENTRY_CHANNEL_SHOWING_CHECKBOX .. "Button",					Settings.textentry_channel_showing )
	SliderBarSetCurrentPosition(		TCHAT_TEXT_ENTRY_CHANNEL_ALPHA_SLIDER,									Settings.textentry_channel_alpha )
	
	-- Tab Logs
	ButtonSetPressedFlag(				TCHAT_LOGS_AUCTION_FILTER_CHECKBOX .. "Button",							Settings.auction_filter_showing )
	ButtonSetPressedFlag(				TCHAT_LOGS_LOOT_ROLL_FILTER_CHECKBOX .. "Button",						Settings.advanced_loot_roll_showing )
	ButtonSetPressedFlag(				TCHAT_LOGS_COPY_SHOWING_CHECKBOX .. "Button",							Settings.copy_showing )
	
	-- Tab Misc
	ButtonSetPressedFlag(				TCHAT_MISC_SOCIAL_SHOWING_CHECKBOX .. "Button",							Settings.social_showing )
	ButtonSetPressedFlag(				TCHAT_MISC_TOBOTTOM_SHOWING_CHECKBOX .. "Button",						Settings.tobottom_showing )
	
	
	TidyChatOptions.UpdateDisabledFlags()
	TidyChatOptions.UpdateGroupComboboxes()
end


function TidyChatOptions.OnApply()
	TidyChatUtils.Debug("TidyChatOptions.OnApply")
	
	-- Tab Chat Windows
	for index, groupTabName in ipairs( TidyChatOptions.GroupTabs ) do
		SavedSettings[index] = SavedSettings[index] or {}
		
		SavedSettings[index].chatwindow_tabs_showing		= ButtonGetPressedFlag(			groupTabName .. TCHAT_WINDOWS_TABS_SHOWING_CHECKBOX .. "Button" )
		SavedSettings[index].chatwindow_background_showing	= ButtonGetPressedFlag(			groupTabName .. TCHAT_WINDOWS_BG_SHOWING_CHECKBOX .. "Button" )
		SavedSettings[index].chatwindow_click_through		= ButtonGetPressedFlag(			groupTabName .. TCHAT_WINDOWS_CLICK_THROUGH_CHECKBOX .. "Button" )
		SavedSettings[index].scrollbar_position				= ComboBoxGetSelectedMenuItem(	groupTabName .. TCHAT_WINDOWS_SCROLLBAR_POSITION_COMBO )
		SavedSettings[index].scrollbar_fadein_alpha			= SliderBarGetCurrentPosition(	groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEIN_ALPHA_SLIDER )
		SavedSettings[index].scrollbar_fadeout_enable		= ButtonGetPressedFlag(			groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_CHECKBOX .. "Button" )
		SavedSettings[index].scrollbar_fadeout_alpha		= SliderBarGetCurrentPosition(	groupTabName .. TCHAT_WINDOWS_SCROLLBAR_FADEOUT_ALPHA_SLIDER )
	end
	
	-- Tab Text Entry
	SavedSettings.textentry_free							= ButtonGetPressedFlag(			TCHAT_TEXT_ENTRY_FREE_TEXT_ENTRY_CHECKBOX .. "Button" )
	SavedSettings.textentry_relative_to						= ComboBoxGetSelectedMenuItem(	TCHAT_TEXT_ENTRY_RELATIVE_TO_COMBO )
	SavedSettings.textentry_anchor_point					= ComboBoxGetSelectedMenuItem(	TCHAT_TEXT_ENTRY_ANCHOR_POINT_COMBO )
	SavedSettings.textentry_background_alpha				= SliderBarGetCurrentPosition(	TCHAT_TEXT_ENTRY_BACKGROUND_ALPHA_SLIDER )
	SavedSettings.textentry_channel_showing					= ButtonGetPressedFlag(			TCHAT_TEXT_ENTRY_CHANNEL_SHOWING_CHECKBOX .. "Button" )
	SavedSettings.textentry_channel_alpha					= SliderBarGetCurrentPosition(	TCHAT_TEXT_ENTRY_CHANNEL_ALPHA_SLIDER )
	
	-- Tab Logs
	SavedSettings.auction_filter_showing					= ButtonGetPressedFlag(			TCHAT_LOGS_AUCTION_FILTER_CHECKBOX .. "Button" )
	SavedSettings.advanced_loot_roll_showing				= ButtonGetPressedFlag(			TCHAT_LOGS_LOOT_ROLL_FILTER_CHECKBOX .. "Button" )
	SavedSettings.copy_showing								= ButtonGetPressedFlag(			TCHAT_LOGS_COPY_SHOWING_CHECKBOX .. "Button" )
	
	-- Tab Misc
	SavedSettings.social_showing							= ButtonGetPressedFlag(			TCHAT_MISC_SOCIAL_SHOWING_CHECKBOX .. "Button" )
	SavedSettings.tobottom_showing							= ButtonGetPressedFlag(			TCHAT_MISC_TOBOTTOM_SHOWING_CHECKBOX .. "Button" )
	
	TidyChatUtils.OnSettingsChanged()
end


function TidyChatOptions.OnClose()
	WindowSetShowing(c_TIDY_CHAT_OPTIONS, false)
end


function TidyChatOptions.OnShown()
	WindowUtils.OnShown()
	
	TidyChatOptions.Reset()
end


function TidyChatOptions.OnHidden()
	WindowUtils.OnHidden()
end


-----------------------------------------
-- Checkbox Control
-----------------------------------------

function TidyChatOptions.OnCheckboxLBU()
	local checkboxName = SystemData.MouseOverWindow.name .. "Button"
	
	if( ButtonGetDisabledFlag(checkboxName) ) then return end
	
	ButtonSetPressedFlag(checkboxName,   not ButtonGetPressedFlag(checkboxName) )
	
	TidyChatOptions.UpdateDisabledFlags()
end


-----------------------------------------
-- Radio Control
-----------------------------------------
--[[
function TidyChatOptions.OnRadioLBU()
	radioName = SystemData.MouseOverWindow.name
	TidyChatOptions.RadioSetId( radioName:sub(1, radioName:len() - 1), WindowGetId(radioName) )
end


function TidyChatOptions.RadioSetId(radioGroupName, id)
	if( ButtonGetPressedFlag(radioGroupName .. id .. "Button") ) then return end
	
	local index = 1
	
	while( DoesWindowExist(radioGroupName .. index) ) do
		ButtonSetPressedFlag(radioGroupName .. index .. "Button", index == id)
		index = index + 1
	end
end


function TidyChatOptions.RadioGetId(radioGroupName)
	local index = 1
	
	while( DoesWindowExist(radioGroupName .. index) ) do
		if( ButtonGetPressedFlag(radioGroupName .. index .. "Button") ) then
			return index
		end
		index = index + 1
	end
	
	--return 0
end

]]
-----------------------------------------
-- Tab Control
-----------------------------------------

function TidyChatOptions.ShowTab(tabIndex)
	if( tabIndex ) then
		selectedTab = tabIndex
	end
	
	for index, tabData in ipairs( tabs ) do        
		ButtonSetPressedFlag( tabData.buttonName, index == selectedTab )
		WindowSetShowing( tabData.windowName, index == selectedTab )
	end
end


function TidyChatOptions.OnTabLBU()
	local tabNumber	= WindowGetId (SystemData.ActiveWindow.name)
	TidyChatOptions.ShowTab(tabNumber)
end


-----------------------------------------
-- Group Tabs Control
-----------------------------------------

function TidyChatOptions.InitializeGroupTabs()
	TidyChatOptions.GroupTabs = {}
	
	for index = 1, #Settings do
		local groupTabName = TCHAT_WINDOWS_GROUP_TAB .. index
		
		if( CreateWindowFromTemplate(groupTabName, "TChatTabWindowsGroupTemplate", tabs[TCHAT_WINDOWS_TAB].windowName) ) then
			TidyChatOptions.GroupTabs[index] = groupTabName
		end
	end
end


function TidyChatOptions.UpdateGroupTabs()
	local selectedTab = ComboBoxGetSelectedMenuItem(TCHAT_WINDOWS_SELECT_WINDOW_COMBO)
	
	for index, groupTabName in ipairs( TidyChatOptions.GroupTabs ) do        
		WindowSetShowing( groupTabName, index == selectedTab )
	end
	
	
	-- Update info about tabs
	
	local tabsInfo = L""
	local wndGroup = EA_ChatWindowGroups[selectedTab]
	
	if( wndGroup and wndGroup.used ) then
		tabsInfo = L"Tabs: "
		
		for k, tab in ipairs( wndGroup.Tabs ) do
			if( k > 1 ) then
				tabsInfo = tabsInfo .. L", "
			end
			tabsInfo = tabsInfo .. tab.tabText
		end
		
		tabsInfo = tabsInfo .. L"."
	end
	
	LabelSetText(TCHAT_WINDOWS_TABS_INFO_LABEL, tabsInfo)
end



end
-----------------------------------
-- end Options
-----------------------------------





-----------------------------------
-- Copy Window
-----------------------------------
do


local entryCache = {}
local startEntry = 1
local entriesPerPage = 25

local function GetEntriesForCopy( firstEntry )
	
	local lastEntry = firstEntry + entriesPerPage
	if lastEntry > #entryCache then
		lastEntry = #entryCache
	end
	
	local copyText = entryCache[firstEntry].text
	for i = firstEntry + 1, lastEntry  do
		copyText = copyText .. L"\n" .. entryCache[i].text
	end
	
	TextEditBoxSetText( c_TIDY_CHAT_COPY .. "Log", copyText )
	LabelSetText( c_TIDY_CHAT_COPY .. "EntryCount", L"Entries " .. firstEntry .. L" to " .. lastEntry .. L" of " .. #entryCache .. L" entries")
	
	if firstEntry == 1 then
		ButtonSetDisabledFlag( c_TIDY_CHAT_COPY .. "Prev", true )
	else
		ButtonSetDisabledFlag( c_TIDY_CHAT_COPY .. "Prev", false )
	end
	
	if lastEntry < #entryCache then
		ButtonSetDisabledFlag( c_TIDY_CHAT_COPY .. "Next", false )
	else
		ButtonSetDisabledFlag( c_TIDY_CHAT_COPY .. "Next", true )
	end
	
	WindowAssignFocus( c_TIDY_CHAT_COPY .. "Log", true )
	--WindowAssignFocus( c_TIDY_CHAT_COPY .. "Log", false )
end




function TidyChatCopy.InitializeCopyWindow()
	LabelSetText( c_TIDY_CHAT_COPY .. "TitleBarText", L"Chat Copy" )
	ButtonSetText( c_TIDY_CHAT_COPY .. "Prev", L"Prev " .. entriesPerPage)
	ButtonSetText( c_TIDY_CHAT_COPY .. "Next", L"Next " .. entriesPerPage)
	--ButtonSetDisabledFlag( c_TIDY_CHAT_COPY .. "Prev", false )
	--ButtonSetDisabledFlag( c_TIDY_CHAT_COPY .. "Next", false )
end


function TidyChatCopy.OnCopyButton()
	local wndGroup = EA_ChatWindowGroups[ WindowGetId(EA_Window_ContextMenu.activeWindow) ]
	
	if( wndGroup and wndGroup.used ) then
		local tabManagerId = wndGroup.Tabs[ wndGroup.activeTab ].tabManagerId
				
		entryCache = TidyChatCore.GetEntryCache( tabManagerId )
	end
	
	local entryCount = #entryCache
	
	if entryCount == 0 then
		-- Dialog to say empty log
		DialogManager.MakeOneButtonDialog( L"Log is empty\n", L"Ok" )
		return
	end
	
	if entryCount < entriesPerPage then
		startEntry = 1
	else
		startEntry = entryCount - entriesPerPage
	end
	
	WindowSetShowing(c_TIDY_CHAT_COPY, true)
	
	GetEntriesForCopy( startEntry )
end


function TidyChatCopy.OnClose()
	WindowSetShowing(c_TIDY_CHAT_COPY, false)
end


function TidyChatCopy.OnShown()
	WindowUtils.OnShown()
end


function TidyChatCopy.OnHidden()
	WindowUtils.OnHidden()
	
	entryCache = {}
	TextEditBoxSetText( c_TIDY_CHAT_COPY .. "Log", L"" )
end


function TidyChatCopy.OnMouseWheel(x, y, delta, flags)
	if( delta < 0 ) then
		--TidyChatCopy.CopyNext()
		if startEntry < #entryCache then
			startEntry = startEntry + 1
		end
		GetEntriesForCopy( startEntry )
		
	elseif( delta > 0 ) then
		--TidyChatCopy.CopyPrev()
		if startEntry > 1 then
			startEntry = startEntry - 1
		end
		GetEntriesForCopy( startEntry )
	end
end


function TidyChatCopy.CopyPrev()
	if ButtonGetDisabledFlag( c_TIDY_CHAT_COPY .. "Prev" ) then
		return
	end
	startEntry = startEntry - entriesPerPage
	if startEntry < 1 then
		startEntry = 1
	end
	GetEntriesForCopy( startEntry )
end


function TidyChatCopy.CopyNext()
	if ButtonGetDisabledFlag( c_TIDY_CHAT_COPY .. "Next" ) then
		return
	end
	startEntry = startEntry + entriesPerPage
	if startEntry > #entryCache then
		startEntry = #entryCache - entriesPerPage
	end
	GetEntriesForCopy( startEntry )
end




end
-----------------------------------
-- end Copy Window
-----------------------------------





-----------------------------------
-- Loot Roll Window
-----------------------------------
do


TidyChatLootRoll.itemRollData				= {}
TidyChatLootRoll.itemRollDataDisplayOrder	= {}



function TidyChatLootRoll.InitializeLootRollWindow()
	LabelSetText( c_TIDY_CHAT_LOOT_ROLL .. "TitleBarText", L"Roll History" )
	
	-- Update the Row Background
	for row = 1, 10 do		
		local row_mod = math.mod(row, 2)
		local color = DataUtils.GetAlternatingRowColor( row_mod )
		DefaultColor.SetWindowTint( c_TIDY_CHAT_LOOT_ROLL .. "ListRow".. row .."Background", color )
	end
end


function TidyChatLootRoll.OnRollLinkLButtonUp(rollIndex)
	TidyChatLootRoll.itemRollData				= TidyChatLogs.GetItemRollData(rollIndex)
	TidyChatLootRoll.itemRollDataDisplayOrder	= {}
	
	if( TidyChatLootRoll.itemRollData ~= nil ) then
		for index, playerRollData in ipairs(TidyChatLootRoll.itemRollData) do
			if( playerRollData[1] and playerRollData[2] ) then
				tinsert(TidyChatLootRoll.itemRollDataDisplayOrder, index)
			end
		end
		
		LabelSetText( c_TIDY_CHAT_LOOT_ROLL .. "InfoLabel", TidyChatLootRoll.itemRollData.info )
		
		ListBoxSetDisplayOrder(c_TIDY_CHAT_LOOT_ROLL .. "List", TidyChatLootRoll.itemRollDataDisplayOrder)
	end
	
	WindowSetShowing(c_TIDY_CHAT_LOOT_ROLL, TidyChatLootRoll.itemRollDataDisplayOrder[1] ~= nil)
end


function TidyChatLootRoll.OnClose()
	WindowSetShowing(c_TIDY_CHAT_LOOT_ROLL, false)
end


function TidyChatLootRoll.OnShown()
	WindowUtils.OnShown()
end


function TidyChatLootRoll.OnHidden()
	WindowUtils.OnHidden()
end





end
-----------------------------------
-- end Loot Roll Window
-----------------------------------



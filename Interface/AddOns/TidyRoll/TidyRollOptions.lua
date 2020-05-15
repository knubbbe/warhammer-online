if( TidyRoll == nil ) then
	TidyRoll = {}
end

if( TidyRollOptions == nil ) then
	TidyRollOptions = {}
end


-----------------------------------
-- Local variables
-----------------------------------

local c_MODIFICATOR_NONE = 0
local c_MODIFICATOR_SHIFT = 4
local c_MODIFICATOR_CTRL = 8
local c_MODIFICATOR_ALT = 32


local TidyRoll = TidyRoll
local TidyRollOptions = TidyRollOptions
local pairs = pairs
local ipairs = ipairs

local GetSetting
local SetSetting


local offset = 15

local c_TIDY_ROLL_OPTIONS = "TidyRollOptions"
local c_TROLL_TITLE = c_TIDY_ROLL_OPTIONS .. "TitleText"
local c_TROLL_VERSION = c_TIDY_ROLL_OPTIONS .. "VersionText"
local c_TROLL_CLOSE = c_TIDY_ROLL_OPTIONS .. "CloseButton"
local c_TROLL_APPLY = c_TIDY_ROLL_OPTIONS .. "ApplyButton"
local c_TROLL_REVERT = c_TIDY_ROLL_OPTIONS .. "RevertButton"


-- TABS

local c_TROLL_GENERAL_TAB = 1
local c_TROLL_CONTROLS_TAB = 2
local c_TROLL_MISC_TAB = 3

local selectedTab

local tabs = {
	[c_TROLL_GENERAL_TAB] = { windowName = c_TIDY_ROLL_OPTIONS .. "TabGeneral",  buttonName = c_TIDY_ROLL_OPTIONS .. "ViewMode1", },
	[c_TROLL_CONTROLS_TAB] = { windowName = c_TIDY_ROLL_OPTIONS .. "TabControls",  buttonName = c_TIDY_ROLL_OPTIONS .. "ViewMode2", },
	[c_TROLL_MISC_TAB] = { windowName = c_TIDY_ROLL_OPTIONS .. "TabMisc",  buttonName = c_TIDY_ROLL_OPTIONS .. "ViewMode3", },
}


-- SETTINGS


-- General tab
local c_TROLL_DISABLE_DEFAULT = tabs[c_TROLL_GENERAL_TAB].windowName .. "DisableDefault"
local c_TROLL_DISABLE_COMPARISON = tabs[c_TROLL_GENERAL_TAB].windowName .. "DisableComparison"
local c_TROLL_BNUM_LABEL = tabs[c_TROLL_GENERAL_TAB].windowName .. "ButtonNumberText"
local c_TROLL_BNUM_TBOX = tabs[c_TROLL_GENERAL_TAB].windowName .. "ButtonNumberTextBox"
local c_TROLL_OFFSET_LABEL = tabs[c_TROLL_GENERAL_TAB].windowName .. "OffsetText"
local c_TROLL_OFFSET_TBOX = tabs[c_TROLL_GENERAL_TAB].windowName .. "OffsetTextBox"
local c_TROLL_DIRECTION_LABEL = tabs[c_TROLL_GENERAL_TAB].windowName .. "DirectionText"
local c_TROLL_DIRECTION_COMBO = tabs[c_TROLL_GENERAL_TAB].windowName .. "DirectionCombo"

local directionComboIndex = {
	[L"down"] = 1,
	[L"up"] = 2,
	[L"left"] = 3,
	[L"right"] = 4,
}



-- Controls tab
local c_TROLL_INVERT_SCROLL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "InvertScroll"
local c_TROLL_ONESC_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "OnEscText"
local c_TROLL_ONESC_COMBO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "OnEscCombo"
local c_TROLL_ONESC_RADIO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "OnEscRadio"
local c_TROLL_BINDS_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "BindsText"
local c_TROLL_NEED_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "NeedText"
local c_TROLL_NEED_COMBO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "NeedCombo"
local c_TROLL_NEED_MODIF_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "NeedModificatorText"
local c_TROLL_NEED_MODIF_RADIO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "NeedModificatorRadio"
local c_TROLL_GREED_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "GreedText"
local c_TROLL_GREED_COMBO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "GreedCombo"
local c_TROLL_GREED_MODIF_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "GreedModificatorText"
local c_TROLL_GREED_MODIF_RADIO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "GreedModificatorRadio"
local c_TROLL_PASS_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "PassText"
local c_TROLL_PASS_COMBO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "PassCombo"
local c_TROLL_PASS_MODIF_LABEL = tabs[c_TROLL_CONTROLS_TAB].windowName .. "PassModificatorText"
local c_TROLL_PASS_MODIF_RADIO = tabs[c_TROLL_CONTROLS_TAB].windowName .. "PassModificatorRadio"

local onEscControlComboLabels = { L"None", L"Need", L"Greed", L"Pass" }
local booleanRadioTransform = {
	[1] = false,
	[2] = true,
	[true] = 2,
	[false] = 1,
}
local mouseButtonsLabels = { L"None", L"Left Click", L"Right Click", L"Middle Click" }
local modificatorRadioLabels = { L"None", L"Shift", L"Ctrl", L"Alt" }
local modificatorRadioTransformToSetting = { c_MODIFICATOR_NONE, c_MODIFICATOR_SHIFT, c_MODIFICATOR_CTRL, c_MODIFICATOR_ALT }
local modificatorRadioTransformFromSetting = { [c_MODIFICATOR_NONE] = 1, [c_MODIFICATOR_SHIFT] = 2, [c_MODIFICATOR_CTRL] = 3, [c_MODIFICATOR_ALT] = 4 }



-- Misc tab
local c_TROLL_AUTO_GREED = tabs[c_TROLL_MISC_TAB].windowName .. "AutoGreed"
local c_TROLL_AUTO_NEED_FOR_MEDALLIONS = tabs[c_TROLL_MISC_TAB].windowName .. "AutoNeedForMedallions"
local c_TROLL_MANAGE_AUTO_ROLL_BUTTON = tabs[c_TROLL_MISC_TAB].windowName .. "ManageAutoRollButton"
local c_TROLL_TIMER_TEXT = tabs[c_TROLL_MISC_TAB].windowName .. "TimerText"
local c_TROLL_CAREER_ICON = tabs[c_TROLL_MISC_TAB].windowName .. "CareerIcon"
local c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE = tabs[c_TROLL_MISC_TAB].windowName .. "OnRollItemsChangeLabel"
local c_TROLL_SAVE_POSITION_RADIO = tabs[c_TROLL_MISC_TAB].windowName .. "SavePositionRadio"
local c_TROLL_FLASH_ON_NEW = tabs[c_TROLL_MISC_TAB].windowName .. "FlashOnNew"
local c_TROLL_GLOW_ON_NEW = tabs[c_TROLL_MISC_TAB].windowName .. "GlowOnNew"
local c_TROLL_FLASH_ONLY_NEW_ITEM = tabs[c_TROLL_MISC_TAB].windowName .. "FlashOnlyNewItem"
local c_TROLL_GLOW_ONLY_NEW_ITEM = tabs[c_TROLL_MISC_TAB].windowName .. "GlowOnlyNewItem"
local c_TROLL_SORTING_TEXT = tabs[c_TROLL_MISC_TAB].windowName .. "SortingLabel"
local c_TROLL_SORT_TYPE_TEXT = tabs[c_TROLL_MISC_TAB].windowName .. "SortTypeLabel"
local c_TROLL_SORT_TYPE_COMBO = tabs[c_TROLL_MISC_TAB].windowName .. "SortTypeCombo"
local c_TROLL_SORT_ORDER_TEXT = tabs[c_TROLL_MISC_TAB].windowName .. "SortOrderLabel"
local c_TROLL_SORT_ORDER_COMBO = tabs[c_TROLL_MISC_TAB].windowName .. "SortOrderCombo"

local sortTypeLabels = { L"Timer", L"Name" , L"Rarity", L"Level", L"Renown", L"Type" }
local sortOrderLabels = { L"Up", L"Down" }


-----------------------------------
-- End local variables
-----------------------------------


function TidyRollOptions.Initialize()
	
	-- Frame
	CreateWindow(c_TIDY_ROLL_OPTIONS, false)
	WindowSetHandleInput(c_TIDY_ROLL_OPTIONS .. "Background", false)
	WindowSetHandleInput(c_TIDY_ROLL_OPTIONS .. "Frame", false)
	
	
	-- Title Text
	if( CreateWindowFromTemplate(c_TROLL_TITLE, "EA_Label_DefaultText", c_TIDY_ROLL_OPTIONS) ) then
		WindowSetHandleInput(c_TROLL_TITLE, false)
		WindowAddAnchor(c_TROLL_TITLE, "topleft", c_TIDY_ROLL_OPTIONS, "topleft", 0, 10)
		WindowAddAnchor(c_TROLL_TITLE, "topright", c_TIDY_ROLL_OPTIONS, "topright", 0, 10)
		
		LabelSetFont(c_TROLL_TITLE, "font_clear_large_bold", 20)
		LabelSetText(c_TROLL_TITLE, L"Tidy Roll Options")
	end
	
	-- Version Text
	if( CreateWindowFromTemplate(c_TROLL_VERSION, "EA_Label_DefaultText", c_TIDY_ROLL_OPTIONS) ) then
		WindowSetHandleInput(c_TROLL_VERSION, false)
		WindowSetDimensions(c_TROLL_VERSION, 80, 30)
		WindowAddAnchor(c_TROLL_VERSION, "bottomleft", c_TIDY_ROLL_OPTIONS, "bottomleft", 2, -2)
		
		LabelSetText(c_TROLL_VERSION, TidyRoll.dVersion)
	end
	
	-- Close Button
	if( CreateWindowFromTemplate(c_TROLL_CLOSE, "EA_Button_DefaultWindowClose", c_TIDY_ROLL_OPTIONS) ) then
		WindowRegisterCoreEventHandler(c_TROLL_CLOSE, "OnLButtonUp", "TidyRollOptions.OnClose")
    end
	
	-- Apply Button
	if( CreateWindowFromTemplate(c_TROLL_APPLY, "TRollButton", c_TIDY_ROLL_OPTIONS) ) then
		WindowRegisterCoreEventHandler(c_TROLL_APPLY, "OnLButtonUp", "TidyRollOptions.OnApply")
		
		WindowAddAnchor(c_TROLL_APPLY, "bottom", c_TIDY_ROLL_OPTIONS, "bottom", 0, -10)
		
		ButtonSetText(c_TROLL_APPLY, L"Apply")
    end
	
	-- Revert Button
	if( CreateWindowFromTemplate(c_TROLL_REVERT, "TRollButton", c_TIDY_ROLL_OPTIONS) ) then
		WindowRegisterCoreEventHandler(c_TROLL_REVERT, "OnLButtonUp", "TidyRollOptions.Reset")
		
		WindowAddAnchor(c_TROLL_REVERT, "right", c_TROLL_APPLY, "left", 0, 0)
		
		ButtonSetText(c_TROLL_REVERT, L"Revert")
    end
	
	
	------------------------
	-- TABS
	------------------------
	
	-- TAB BUTTONS
	
	local tabButton
	
	-- General tab button
	tabButton = tabs[c_TROLL_GENERAL_TAB].buttonName
	
	if( CreateWindowFromTemplate(tabButton, "TRollTabButton", c_TIDY_ROLL_OPTIONS) ) then
		
		WindowSetId(tabButton, c_TROLL_GENERAL_TAB)
		
		WindowAddAnchor(tabButton, "bottomleft", c_TROLL_TITLE, "topleft", 6, 4)
		
		ButtonSetText(tabButton, L"General")
    end
	
	-- Controls tab button
	tabButton = tabs[c_TROLL_CONTROLS_TAB].buttonName
	
	if( CreateWindowFromTemplate(tabButton, "TRollTabButton", c_TIDY_ROLL_OPTIONS) ) then
		
		WindowSetId(tabButton, c_TROLL_CONTROLS_TAB)
		
		WindowAddAnchor(tabButton, "topright", tabs[c_TROLL_GENERAL_TAB].buttonName, "topleft", 0, 0)
		
		ButtonSetText(tabButton, L"Controls")
    end
	
	-- Misc tab button
	tabButton = tabs[c_TROLL_MISC_TAB].buttonName
	
	if( CreateWindowFromTemplate(tabButton, "TRollTabButton", c_TIDY_ROLL_OPTIONS) ) then
		
		WindowSetId(tabButton, c_TROLL_MISC_TAB)
		
		WindowAddAnchor(tabButton, "topright", tabs[c_TROLL_CONTROLS_TAB].buttonName, "topleft", 0, 0)
		
		ButtonSetText(tabButton, L"Misc")
    end
    
    
	-- TAB WINDOWS
	
	CreateWindowFromTemplate(tabs[c_TROLL_GENERAL_TAB].windowName, "TRollTabTemplate", c_TIDY_ROLL_OPTIONS)
	CreateWindowFromTemplate(tabs[c_TROLL_CONTROLS_TAB].windowName, "TRollTabTemplate", c_TIDY_ROLL_OPTIONS)
	CreateWindowFromTemplate(tabs[c_TROLL_MISC_TAB].windowName, "TRollTabTemplate", c_TIDY_ROLL_OPTIONS)
	
	
	TidyRollOptions.ShowTab(c_TROLL_GENERAL_TAB)
	
	
	
	------------------------
	-- SETTINGS
	------------------------
	local tabWindowName
	local anchor
	
	
	------------------------------------------------------------------------------------------------------
	-- GENERAL SETTINGS
	
	tabWindowName = tabs[c_TROLL_GENERAL_TAB].windowName
	
	-- Disable Default Roll Window Setting
	if( CreateWindowFromTemplate(c_TROLL_DISABLE_DEFAULT, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_DISABLE_DEFAULT, "topleft", tabWindowName, "topleft", 40, offset)
		WindowAddAnchor(c_TROLL_DISABLE_DEFAULT, "topright", tabWindowName, "topright", -10, offset)
		
		LabelSetText(c_TROLL_DISABLE_DEFAULT .. "Label", L"Default EA Roll window")
    end
    
    -- Disable Comparison Setting
	if( CreateWindowFromTemplate(c_TROLL_DISABLE_COMPARISON, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_DISABLE_COMPARISON, "bottomleft", c_TROLL_DISABLE_DEFAULT, "topleft", 0, 0)
		WindowAddAnchor(c_TROLL_DISABLE_COMPARISON, "bottomright", c_TROLL_DISABLE_DEFAULT, "topright", 0, 0)
		
		LabelSetText(c_TROLL_DISABLE_COMPARISON .. "Label", L"Comparison in tooltips")
    end
    
    -- Number of buttons text
	if( CreateWindowFromTemplate(c_TROLL_BNUM_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_BNUM_LABEL, "bottomleft", c_TROLL_DISABLE_COMPARISON, "topleft", 0, offset + 5)
		
		LabelSetText(c_TROLL_BNUM_LABEL, L"Number of buttons:")
	end
	
	-- Number of buttons textbox
	if( CreateWindowFromTemplate(c_TROLL_BNUM_TBOX, "EA_EditBox_DefaultFrame", tabWindowName) ) then
		WindowSetDimensions(c_TROLL_BNUM_TBOX, 50, 32)
		WindowSetLayer(c_TROLL_BNUM_TBOX, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_BNUM_TBOX, "right", c_TROLL_BNUM_LABEL, "left", 0, 0)
    end
    
    -- Buttons' offset text
	if( CreateWindowFromTemplate(c_TROLL_OFFSET_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_OFFSET_LABEL, "bottomleft", c_TROLL_BNUM_LABEL, "topleft", 0, offset)
		
		LabelSetText(c_TROLL_OFFSET_LABEL, L"Buttons' offset:")
	end
	
	-- Buttons' offset textbox
	if( CreateWindowFromTemplate(c_TROLL_OFFSET_TBOX, "EA_EditBox_DefaultFrame", tabWindowName) ) then
		WindowSetDimensions(c_TROLL_OFFSET_TBOX, 50, 32)
		WindowSetLayer(c_TROLL_OFFSET_TBOX, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_OFFSET_TBOX, "right", c_TROLL_OFFSET_LABEL, "left", 0, 0)
    end
    
    -- Buttons' growth direction text
	if( CreateWindowFromTemplate(c_TROLL_DIRECTION_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_DIRECTION_LABEL, "bottomleft", c_TROLL_OFFSET_LABEL, "topleft", 0, offset)
		
		LabelSetText(c_TROLL_DIRECTION_LABEL, L"Buttons' growth direction:")
	end
	
	-- Buttons' growth direction combobox
	if( CreateWindowFromTemplate(c_TROLL_DIRECTION_COMBO, "EA_ComboBox_DefaultResizable", tabWindowName) ) then
		WindowSetLayer(c_TROLL_DIRECTION_COMBO, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_DIRECTION_COMBO, "bottomleft", c_TROLL_DIRECTION_LABEL, "topleft", 0, 0)
		
		ComboBoxClearMenuItems(c_TROLL_DIRECTION_COMBO)
		ComboBoxAddMenuItem(c_TROLL_DIRECTION_COMBO, L"down")
		ComboBoxAddMenuItem(c_TROLL_DIRECTION_COMBO, L"up")
		ComboBoxAddMenuItem(c_TROLL_DIRECTION_COMBO, L"left")
		ComboBoxAddMenuItem(c_TROLL_DIRECTION_COMBO, L"right")
    end
    
    
    ------------------------------------------------------------------------------------------------------
    -- CONTROLS SETTINGS
    
	tabWindowName = tabs[c_TROLL_CONTROLS_TAB].windowName
	
	-- Invert Scroll Setting
	if( CreateWindowFromTemplate(c_TROLL_INVERT_SCROLL, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_INVERT_SCROLL, "topleft", tabWindowName, "topleft", 40, offset)
		WindowAddAnchor(c_TROLL_INVERT_SCROLL, "topright", tabWindowName, "topright", -10, offset)
		
		LabelSetText(c_TROLL_INVERT_SCROLL .. "Label", L"Invert scroll")
    end
	
	-- On Esc label
	if( CreateWindowFromTemplate(c_TROLL_ONESC_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_ONESC_LABEL, "bottomleft", c_TROLL_INVERT_SCROLL, "topleft", 0, offset / 2 )
		WindowAddAnchor(c_TROLL_ONESC_LABEL, "bottomright", c_TROLL_INVERT_SCROLL, "topright", 0, offset )
		
		LabelSetText(c_TROLL_ONESC_LABEL, L"On press Esc:")
	end
	
	-- On Esc control combobox
	if( CreateWindowFromTemplate(c_TROLL_ONESC_COMBO, "EA_ComboBox_DefaultResizable", tabWindowName) ) then
		WindowSetLayer(c_TROLL_ONESC_COMBO, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_ONESC_COMBO, "bottomleft", c_TROLL_ONESC_LABEL, "topleft", 0, 0)
		
		ComboBoxClearMenuItems(c_TROLL_ONESC_COMBO)
		for _, str in ipairs(onEscControlComboLabels) do
			ComboBoxAddMenuItem(c_TROLL_ONESC_COMBO, str)
		end
    end
	
	-- On Esc radio 1
	if( CreateWindowFromTemplate(c_TROLL_ONESC_RADIO .. 1, "TRollRadioTemplate", tabWindowName) ) then
		
		
		WindowSetDimensions(c_TROLL_ONESC_RADIO .. 1, 140, 37)
		WindowSetId(c_TROLL_ONESC_RADIO .. 1, 1)
		WindowAddAnchor(c_TROLL_ONESC_RADIO .. 1, "bottomleft", c_TROLL_ONESC_COMBO, "topleft", offset, offset )
		
		LabelSetText(c_TROLL_ONESC_RADIO .. 1 .. "Label", L"on all items")
	end
	
	-- On Esc radio 2
	if( CreateWindowFromTemplate(c_TROLL_ONESC_RADIO .. 2, "TRollRadioTemplate", tabWindowName) ) then
		
		
		WindowSetId(c_TROLL_ONESC_RADIO .. 2, 2)
		WindowAddAnchor(c_TROLL_ONESC_RADIO .. 2, "topright", c_TROLL_ONESC_RADIO .. 1, "topleft", 0, 0 )
		WindowAddAnchor(c_TROLL_ONESC_RADIO .. 2, "topright", tabWindowName, "topright", -10, 0 )
		
		LabelSetText(c_TROLL_ONESC_RADIO .. 2 .. "Label", L"on visible only")
	end
	
	-- Binds label
	if( CreateWindowFromTemplate(c_TROLL_BINDS_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_BINDS_LABEL, "bottomleft", c_TROLL_ONESC_RADIO .. 1, "topleft", -offset, offset )
		WindowAddAnchor(c_TROLL_BINDS_LABEL, "topright", tabWindowName, "topright", -10, 0 )
		
		LabelSetFont(c_TROLL_BINDS_LABEL, "font_clear_medium", 20)
		LabelSetText(c_TROLL_BINDS_LABEL, L"Mouse controls:")
	end
    
    -- Need text
	if( CreateWindowFromTemplate(c_TROLL_NEED_LABEL, "TRollLabel", tabWindowName) ) then
		WindowSetDimensions(c_TROLL_NEED_LABEL, 70, 20)
		WindowAddAnchor(c_TROLL_NEED_LABEL, "bottomleft", c_TROLL_BINDS_LABEL, "topleft", 0, offset)
		
		LabelSetText(c_TROLL_NEED_LABEL, L"Need:")
	end
	
	-- Need combobox
	if( CreateWindowFromTemplate(c_TROLL_NEED_COMBO, "EA_ComboBox_DefaultResizable", tabWindowName) ) then
		WindowSetLayer(c_TROLL_NEED_COMBO, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_NEED_COMBO, "right", c_TROLL_NEED_LABEL, "left", 0, 0)
		
		ComboBoxClearMenuItems(c_TROLL_NEED_COMBO)
		for _, str in ipairs(mouseButtonsLabels) do
			ComboBoxAddMenuItem(c_TROLL_NEED_COMBO, str)
		end
    end
    
    -- Need modificator text
	if( CreateWindowFromTemplate(c_TROLL_NEED_MODIF_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_NEED_MODIF_LABEL, "bottomleft", c_TROLL_NEED_LABEL, "topleft", offset, offset)
		
		LabelSetText(c_TROLL_NEED_MODIF_LABEL, L"Modificator:")
	end
    
	anchor = {
		RelativeTo = c_TROLL_NEED_MODIF_LABEL,
		Point = "bottomleft",
		RelativePoint = "topleft",
		XOffset = 0,
		YOffset = offset / 3,
	}
	
	for index, str in ipairs(modificatorRadioLabels) do
		if( CreateWindowFromTemplate(c_TROLL_NEED_MODIF_RADIO .. index, "TRollRadioTemplate", tabWindowName) ) then
			
			
			WindowSetDimensions(c_TROLL_NEED_MODIF_RADIO .. index, 80, 37)
			WindowSetId(c_TROLL_NEED_MODIF_RADIO .. index, index)
			WindowAddAnchor(c_TROLL_NEED_MODIF_RADIO .. index, anchor.Point, anchor.RelativeTo, anchor.RelativePoint, anchor.XOffset, anchor.YOffset)
			
			LabelSetText(c_TROLL_NEED_MODIF_RADIO .. index .. "Label", str)
			
			anchor = {
				RelativeTo = c_TROLL_NEED_MODIF_RADIO .. index,
				Point = "topright",
				RelativePoint = "topleft",
				XOffset = 0,
				YOffset = 0,
			}
		end
	end
	
    -- Greed text
	if( CreateWindowFromTemplate(c_TROLL_GREED_LABEL, "TRollLabel", tabWindowName) ) then
		WindowSetDimensions(c_TROLL_GREED_LABEL, 70, 20)
		WindowAddAnchor(c_TROLL_GREED_LABEL, "bottomleft", c_TROLL_NEED_MODIF_RADIO .. 1, "topleft", -offset, offset / 3)
		
		LabelSetText(c_TROLL_GREED_LABEL, L"Greed:")
	end
	
	-- Greed combobox
	if( CreateWindowFromTemplate(c_TROLL_GREED_COMBO, "EA_ComboBox_DefaultResizable", tabWindowName) ) then
		WindowSetLayer(c_TROLL_GREED_COMBO, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_GREED_COMBO, "right", c_TROLL_GREED_LABEL, "left", 0, 0)
		
		ComboBoxClearMenuItems(c_TROLL_GREED_COMBO)
		for _, str in ipairs(mouseButtonsLabels) do
			ComboBoxAddMenuItem(c_TROLL_GREED_COMBO, str)
		end
    end
    
    -- Greed modificator text
	if( CreateWindowFromTemplate(c_TROLL_GREED_MODIF_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_GREED_MODIF_LABEL, "bottomleft", c_TROLL_GREED_LABEL, "topleft", offset, offset)
		
		LabelSetText(c_TROLL_GREED_MODIF_LABEL, L"Modificator:")
	end
    
	anchor = {
		RelativeTo = c_TROLL_GREED_MODIF_LABEL,
		Point = "bottomleft",
		RelativePoint = "topleft",
		XOffset = 0,
		YOffset = offset / 3,
	}
	
	for index, str in ipairs(modificatorRadioLabels) do
		if( CreateWindowFromTemplate(c_TROLL_GREED_MODIF_RADIO .. index, "TRollRadioTemplate", tabWindowName) ) then
			
			
			WindowSetDimensions(c_TROLL_GREED_MODIF_RADIO .. index, 80, 37)
			WindowSetId(c_TROLL_GREED_MODIF_RADIO .. index, index)
			WindowAddAnchor(c_TROLL_GREED_MODIF_RADIO .. index, anchor.Point, anchor.RelativeTo, anchor.RelativePoint, anchor.XOffset, anchor.YOffset)
			
			LabelSetText(c_TROLL_GREED_MODIF_RADIO .. index .. "Label", str)
			
			anchor = {
				RelativeTo = c_TROLL_GREED_MODIF_RADIO .. index,
				Point = "topright",
				RelativePoint = "topleft",
				XOffset = 0,
				YOffset = 0,
			}
		end
	end
	
	-- Pass text
	if( CreateWindowFromTemplate(c_TROLL_PASS_LABEL, "TRollLabel", tabWindowName) ) then
		WindowSetDimensions(c_TROLL_PASS_LABEL, 70, 20)
		WindowAddAnchor(c_TROLL_PASS_LABEL, "bottomleft", c_TROLL_GREED_MODIF_RADIO .. 1, "topleft", -offset, offset / 3)
		
		LabelSetText(c_TROLL_PASS_LABEL, L"Pass:")
	end
	
	-- Pass combobox
	if( CreateWindowFromTemplate(c_TROLL_PASS_COMBO, "EA_ComboBox_DefaultResizable", tabWindowName) ) then
		WindowSetLayer(c_TROLL_PASS_COMBO, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_PASS_COMBO, "right", c_TROLL_PASS_LABEL, "left", 0, 0)
		
		ComboBoxClearMenuItems(c_TROLL_PASS_COMBO)
		for _, str in ipairs(mouseButtonsLabels) do
			ComboBoxAddMenuItem(c_TROLL_PASS_COMBO, str)
		end
    end
    
    -- Pass modificator text
	if( CreateWindowFromTemplate(c_TROLL_PASS_MODIF_LABEL, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_PASS_MODIF_LABEL, "bottomleft", c_TROLL_PASS_LABEL, "topleft", offset, offset)
		
		LabelSetText(c_TROLL_PASS_MODIF_LABEL, L"Modificator:")
	end
    
	anchor = {
		RelativeTo = c_TROLL_PASS_MODIF_LABEL,
		Point = "bottomleft",
		RelativePoint = "topleft",
		XOffset = 0,
		YOffset = offset / 3,
	}
	
	for index, str in ipairs(modificatorRadioLabels) do
		if( CreateWindowFromTemplate(c_TROLL_PASS_MODIF_RADIO .. index, "TRollRadioTemplate", tabWindowName) ) then
			
			
			WindowSetDimensions(c_TROLL_PASS_MODIF_RADIO .. index, 80, 37)
			WindowSetId(c_TROLL_PASS_MODIF_RADIO .. index, index)
			WindowAddAnchor(c_TROLL_PASS_MODIF_RADIO .. index, anchor.Point, anchor.RelativeTo, anchor.RelativePoint, anchor.XOffset, anchor.YOffset)
			
			LabelSetText(c_TROLL_PASS_MODIF_RADIO .. index .. "Label", str)
			
			anchor = {
				RelativeTo = c_TROLL_PASS_MODIF_RADIO .. index,
				Point = "topright",
				RelativePoint = "topleft",
				XOffset = 0,
				YOffset = 0,
			}
		end
	end
	
	
	------------------------------------------------------------------------------------------------------
    -- MISC SETTINGS
    
	tabWindowName = tabs[c_TROLL_MISC_TAB].windowName
	
	-- Auto greed, if not allowed to need Setting
	if( CreateWindowFromTemplate(c_TROLL_AUTO_GREED, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_AUTO_GREED, "topleft", tabWindowName, "topleft", 40, offset)
		WindowAddAnchor(c_TROLL_AUTO_GREED, "topright", tabWindowName, "topright", -10, offset)
		
		LabelSetText(c_TROLL_AUTO_GREED .. "Label", L"Auto greed, if not allowed to need")
    end
    
	-- Custom Auto Roll Setting
	if( CreateWindowFromTemplate(c_TROLL_AUTO_NEED_FOR_MEDALLIONS, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_AUTO_NEED_FOR_MEDALLIONS, "bottomleft", c_TROLL_AUTO_GREED, "topleft", 0, offset - 10)
		--WindowAddAnchor(c_TROLL_AUTO_NEED_FOR_MEDALLIONS, "bottomright", c_TROLL_AUTO_GREED, "topright", 0, offset - 10)
		
		LabelSetText(c_TROLL_AUTO_NEED_FOR_MEDALLIONS .. "Label", L"Custom auto roll")
    end
    
    -- Manage Auto Roll Button
    if( CreateWindowFromTemplate(c_TROLL_MANAGE_AUTO_ROLL_BUTTON, "TRollButton", tabWindowName) ) then
		WindowRegisterCoreEventHandler(c_TROLL_MANAGE_AUTO_ROLL_BUTTON, "OnLButtonUp", "TidyRoll.CustomAutoRoll.ToggleOptions")
		
		WindowAddAnchor(c_TROLL_MANAGE_AUTO_ROLL_BUTTON, "right", c_TROLL_AUTO_NEED_FOR_MEDALLIONS, "left", 0, -5)
		
		ButtonSetText(c_TROLL_MANAGE_AUTO_ROLL_BUTTON, L"Manage")
    end
	
    -- Timer Text Setting
	if( CreateWindowFromTemplate(c_TROLL_TIMER_TEXT, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_TIMER_TEXT, "bottomleft", c_TROLL_AUTO_NEED_FOR_MEDALLIONS, "topleft", 0, offset - 10)
		--WindowAddAnchor(c_TROLL_TIMER_TEXT, "bottomright", c_TROLL_AUTO_NEED_FOR_MEDALLIONS, "topright", 0, 0)
		WindowAddAnchor(c_TROLL_TIMER_TEXT, "topright", tabWindowName, "topright", -10, 0)
		
		LabelSetText(c_TROLL_TIMER_TEXT .. "Label", L"Show timer text")
    end
    
    -- Timer Text Setting
	if( CreateWindowFromTemplate(c_TROLL_CAREER_ICON, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_CAREER_ICON, "bottomleft", c_TROLL_TIMER_TEXT, "topleft", 0, 0)
		WindowAddAnchor(c_TROLL_CAREER_ICON, "bottomright", c_TROLL_TIMER_TEXT, "topright", 0, 0)
		
		LabelSetText(c_TROLL_CAREER_ICON .. "Label", L"Show career icon")
    end
    
    -- On new items label
	if( CreateWindowFromTemplate(c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE, "bottomleft", c_TROLL_CAREER_ICON, "topleft", 0, offset + 5 )
		WindowAddAnchor(c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE, "bottomright", c_TROLL_CAREER_ICON, "topright", 0, offset + 5)
		
		LabelSetFont(c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE, "font_clear_medium", 20)
		LabelSetText(c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE, L"On new items:")
	end
    
	-- Save position radio 1
	if( CreateWindowFromTemplate(c_TROLL_SAVE_POSITION_RADIO .. 1, "TRollRadioTemplate", tabWindowName) ) then
		
		
		WindowSetId(c_TROLL_SAVE_POSITION_RADIO .. 1, 1)
		WindowAddAnchor(c_TROLL_SAVE_POSITION_RADIO .. 1, "bottomleft", c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE, "topleft", offset, offset)
		WindowAddAnchor(c_TROLL_SAVE_POSITION_RADIO .. 1, "bottomright", c_TROLL_ON_ROLL_ITEMS_NUMBER_CHANGE, "topright", 0, offset)
		
		LabelSetText(c_TROLL_SAVE_POSITION_RADIO .. 1 .. "Label", L"Scroll to first item in list (after sorting)")
	end
	
	-- Save position radio 2
	if( CreateWindowFromTemplate(c_TROLL_SAVE_POSITION_RADIO .. 2, "TRollRadioTemplate", tabWindowName) ) then
		
		
		WindowSetId(c_TROLL_SAVE_POSITION_RADIO .. 2, 2)
		WindowAddAnchor(c_TROLL_SAVE_POSITION_RADIO .. 2, "bottomleft", c_TROLL_SAVE_POSITION_RADIO .. 1, "topleft", 0, 0 )
		WindowAddAnchor(c_TROLL_SAVE_POSITION_RADIO .. 2, "bottomright", c_TROLL_SAVE_POSITION_RADIO .. 1, "topright", 0, 0 )
		
		LabelSetText(c_TROLL_SAVE_POSITION_RADIO .. 2 .. "Label", L"Save scroll position")
	end
	
	-- Flash Setting
	if( CreateWindowFromTemplate(c_TROLL_FLASH_ON_NEW, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_FLASH_ON_NEW, "bottomleft", c_TROLL_SAVE_POSITION_RADIO .. 2, "topleft", 0, 0)
		WindowAddAnchor(c_TROLL_FLASH_ON_NEW, "bottom", c_TROLL_SAVE_POSITION_RADIO .. 2, "topright", 0, 0)
		
		LabelSetText(c_TROLL_FLASH_ON_NEW .. "Label", L"Flash")
	end
	
	-- Glow Setting
	if( CreateWindowFromTemplate(c_TROLL_GLOW_ON_NEW, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_GLOW_ON_NEW, "bottom", c_TROLL_SAVE_POSITION_RADIO .. 2, "topleft", 0, 0)
		WindowAddAnchor(c_TROLL_GLOW_ON_NEW, "bottomright", c_TROLL_SAVE_POSITION_RADIO .. 2, "topright", 0, 0)
		
		LabelSetText(c_TROLL_GLOW_ON_NEW .. "Label", L"Glow")
	end
	
	-- Flash only new item Setting
	if( CreateWindowFromTemplate(c_TROLL_FLASH_ONLY_NEW_ITEM, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_FLASH_ONLY_NEW_ITEM, "bottomleft", c_TROLL_FLASH_ON_NEW, "topleft", 0, 0)
		WindowAddAnchor(c_TROLL_FLASH_ONLY_NEW_ITEM, "bottomright", c_TROLL_FLASH_ON_NEW, "topright", 0, 0)
		
		LabelSetText(c_TROLL_FLASH_ONLY_NEW_ITEM .. "Label", L"Flash only new")
	end
	
	-- Glow only new item Setting
	if( CreateWindowFromTemplate(c_TROLL_GLOW_ONLY_NEW_ITEM, "TRollCheckboxTemplate", tabWindowName) ) then
		
		
		WindowAddAnchor(c_TROLL_GLOW_ONLY_NEW_ITEM, "bottomleft", c_TROLL_GLOW_ON_NEW, "topleft", 0, 0)
		WindowAddAnchor(c_TROLL_GLOW_ONLY_NEW_ITEM, "bottomright", c_TROLL_GLOW_ON_NEW, "topright", 0, 0)
		
		LabelSetText(c_TROLL_GLOW_ONLY_NEW_ITEM .. "Label", L"Glow only new")
	end
	
	
    -- Sorting label
	if( CreateWindowFromTemplate(c_TROLL_SORTING_TEXT, "TRollLabel", tabWindowName) ) then
		WindowAddAnchor(c_TROLL_SORTING_TEXT, "bottomleft", c_TROLL_FLASH_ONLY_NEW_ITEM, "topleft", -offset, offset + 5 )
		WindowAddAnchor(c_TROLL_SORTING_TEXT, "bottomright", c_TROLL_GLOW_ONLY_NEW_ITEM, "topright", 0, offset + 5)
		
		LabelSetFont(c_TROLL_SORTING_TEXT, "font_clear_medium", 20)
		LabelSetText(c_TROLL_SORTING_TEXT, L"Sorting:")
	end
	
	-- Sort type text
	if( CreateWindowFromTemplate(c_TROLL_SORT_TYPE_TEXT, "TRollLabel", tabWindowName) ) then
		WindowSetDimensions(c_TROLL_SORT_TYPE_TEXT, 70, 20)
		WindowAddAnchor(c_TROLL_SORT_TYPE_TEXT, "bottomleft", c_TROLL_SORTING_TEXT, "topleft", 0, offset)
		
		LabelSetText(c_TROLL_SORT_TYPE_TEXT, L"Sort by")
	end
	
	-- Sort type combobox
	if( CreateWindowFromTemplate(c_TROLL_SORT_TYPE_COMBO, "EA_ComboBox_DefaultResizable", tabWindowName) ) then
		WindowSetLayer(c_TROLL_SORT_TYPE_COMBO, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_SORT_TYPE_COMBO, "right", c_TROLL_SORT_TYPE_TEXT, "left", 0, 0)
		
		ComboBoxClearMenuItems(c_TROLL_SORT_TYPE_COMBO)
		for _, str in ipairs(sortTypeLabels) do
			ComboBoxAddMenuItem(c_TROLL_SORT_TYPE_COMBO, str)
		end
    end
    
    -- Sort order text
	if( CreateWindowFromTemplate(c_TROLL_SORT_ORDER_TEXT, "TRollLabel", tabWindowName) ) then
		WindowSetDimensions(c_TROLL_SORT_ORDER_TEXT, 70, 20)
		WindowAddAnchor(c_TROLL_SORT_ORDER_TEXT, "bottomleft", c_TROLL_SORT_TYPE_TEXT, "topleft", 0, offset)
		
		LabelSetText(c_TROLL_SORT_ORDER_TEXT, L"Order")
	end
	
	-- Sort order combobox
	if( CreateWindowFromTemplate(c_TROLL_SORT_ORDER_COMBO, "EA_ComboBox_DefaultResizable", tabWindowName) ) then
		WindowSetLayer(c_TROLL_SORT_ORDER_COMBO, Window.Layers.POPUP)
		WindowAddAnchor(c_TROLL_SORT_ORDER_COMBO, "right", c_TROLL_SORT_ORDER_TEXT, "left", 0, 0)
		
		ComboBoxClearMenuItems(c_TROLL_SORT_ORDER_COMBO)
		for _, str in ipairs(sortOrderLabels) do
			ComboBoxAddMenuItem(c_TROLL_SORT_ORDER_COMBO, str)
		end
    end

end


function TidyRollOptions.OnShown()
	WindowUtils.OnShown()
	
	TidyRollOptions.Reset()
	
	TidyRoll.SetTestMode(true)
	TidyRoll.UpdateLootRollDataWithDefault()
end


function TidyRollOptions.OnHidden()
	WindowUtils.OnHidden()

	TidyRoll.SetTestMode(false)
	TidyRoll.UpdateLootRollDataWithDefault()
end


function TidyRollOptions.Reset()
	-- General tab
	ButtonSetPressedFlag( c_TROLL_DISABLE_DEFAULT .. "Button",   not GetSetting("default-disable") )
	ButtonSetPressedFlag( c_TROLL_DISABLE_COMPARISON .. "Button",   not GetSetting("tooltip-disable-comparison") )
	TextEditBoxSetText( c_TROLL_BNUM_TBOX, towstring(GetSetting("button-number")) )
	TextEditBoxSetText( c_TROLL_OFFSET_TBOX, towstring(GetSetting("button-offset")) )
	ComboBoxSetSelectedMenuItem( c_TROLL_DIRECTION_COMBO, directionComboIndex[ GetSetting("button-growth-direction") ] )
	
	-- Controls tab
	ButtonSetPressedFlag( c_TROLL_INVERT_SCROLL .. "Button", GetSetting("scroll-invert") )
	ComboBoxSetSelectedMenuItem( c_TROLL_ONESC_COMBO, GetSetting("managment-onesc-rollchoice") + 2 )
	TidyRollOptions.RadioSetId( c_TROLL_ONESC_RADIO, booleanRadioTransform[ GetSetting("managment-onesc-visible-only") ] )
	ComboBoxSetSelectedMenuItem( c_TROLL_NEED_COMBO, GetSetting("managment-bind-need") )
	ComboBoxSetSelectedMenuItem( c_TROLL_GREED_COMBO, GetSetting("managment-bind-greed") )
	ComboBoxSetSelectedMenuItem( c_TROLL_PASS_COMBO, GetSetting("managment-bind-pass") )
	TidyRollOptions.RadioSetId( c_TROLL_NEED_MODIF_RADIO, modificatorRadioTransformFromSetting[ GetSetting("managment-bind-need-modificator") ] )
	TidyRollOptions.RadioSetId( c_TROLL_GREED_MODIF_RADIO, modificatorRadioTransformFromSetting[ GetSetting("managment-bind-greed-modificator") ] )
	TidyRollOptions.RadioSetId( c_TROLL_PASS_MODIF_RADIO, modificatorRadioTransformFromSetting[ GetSetting("managment-bind-pass-modificator") ] )
	
	-- Misc tab
	ButtonSetPressedFlag( c_TROLL_AUTO_GREED .. "Button", GetSetting("auto-greed") )
	ButtonSetPressedFlag( c_TROLL_AUTO_NEED_FOR_MEDALLIONS .. "Button", GetSetting("auto-need-for-medallions") )
	ButtonSetPressedFlag( c_TROLL_TIMER_TEXT .. "Button", GetSetting("timer-show-text") )
	ButtonSetPressedFlag( c_TROLL_CAREER_ICON .. "Button", GetSetting("career-icon-show") )
	TidyRollOptions.RadioSetId( c_TROLL_SAVE_POSITION_RADIO, booleanRadioTransform[ GetSetting("onnew-save-position") ] )
	ButtonSetPressedFlag( c_TROLL_FLASH_ON_NEW .. "Button", GetSetting("onnew-flash") )
	ButtonSetPressedFlag( c_TROLL_GLOW_ON_NEW .. "Button", GetSetting("onnew-glow") )
	ButtonSetPressedFlag( c_TROLL_FLASH_ONLY_NEW_ITEM .. "Button", GetSetting("onnew-flash-only-new-items") )
	ButtonSetPressedFlag( c_TROLL_GLOW_ONLY_NEW_ITEM .. "Button", GetSetting("onnew-glow-only-new-items") )
	ButtonSetDisabledFlag( c_TROLL_FLASH_ONLY_NEW_ITEM .. "Button",   not ButtonGetPressedFlag(c_TROLL_FLASH_ON_NEW .. "Button") )
	ButtonSetDisabledFlag( c_TROLL_GLOW_ONLY_NEW_ITEM .. "Button",   not ButtonGetPressedFlag(c_TROLL_GLOW_ON_NEW .. "Button") )
	ComboBoxSetSelectedMenuItem( c_TROLL_SORT_TYPE_COMBO, GetSetting("sort-type") )
	ComboBoxSetSelectedMenuItem( c_TROLL_SORT_ORDER_COMBO, GetSetting("sort-order") )
end


function TidyRollOptions.OnApply()
	-- General tab
	SetSetting( "default-disable",  not ButtonGetPressedFlag(c_TROLL_DISABLE_DEFAULT .. "Button") )
	SetSetting( "tooltip-disable-comparison",   not ButtonGetPressedFlag(c_TROLL_DISABLE_COMPARISON .. "Button") )
	SetSetting( "button-number", tonumber( TextEditBoxGetText(c_TROLL_BNUM_TBOX) ) )
	SetSetting( "button-offset", tonumber( TextEditBoxGetText(c_TROLL_OFFSET_TBOX) ) )
	SetSetting( "button-growth-direction", ComboBoxGetSelectedText(c_TROLL_DIRECTION_COMBO) )
	
	-- Controls tab
	SetSetting( "scroll-invert", ButtonGetPressedFlag(c_TROLL_INVERT_SCROLL .. "Button") )
	SetSetting( "managment-onesc-rollchoice", ComboBoxGetSelectedMenuItem(c_TROLL_ONESC_COMBO) - 2 )
	SetSetting( "managment-onesc-visible-only", booleanRadioTransform[ TidyRollOptions.RadioGetId(c_TROLL_ONESC_RADIO) ] )
	SetSetting( "managment-bind-need", ComboBoxGetSelectedMenuItem(c_TROLL_NEED_COMBO) )
	SetSetting( "managment-bind-greed", ComboBoxGetSelectedMenuItem(c_TROLL_GREED_COMBO) )
	SetSetting( "managment-bind-pass", ComboBoxGetSelectedMenuItem(c_TROLL_PASS_COMBO) )
	SetSetting( "managment-bind-need-modificator", modificatorRadioTransformToSetting[ TidyRollOptions.RadioGetId(c_TROLL_NEED_MODIF_RADIO) ] )
	SetSetting( "managment-bind-greed-modificator", modificatorRadioTransformToSetting[ TidyRollOptions.RadioGetId(c_TROLL_GREED_MODIF_RADIO) ] )
	SetSetting( "managment-bind-pass-modificator", modificatorRadioTransformToSetting[ TidyRollOptions.RadioGetId(c_TROLL_PASS_MODIF_RADIO) ] )
	
	-- Misc tab
	SetSetting( "auto-greed", ButtonGetPressedFlag(c_TROLL_AUTO_GREED .. "Button") )
	SetSetting( "auto-need-for-medallions", ButtonGetPressedFlag(c_TROLL_AUTO_NEED_FOR_MEDALLIONS .. "Button") )
	SetSetting( "timer-show-text", ButtonGetPressedFlag(c_TROLL_TIMER_TEXT .. "Button") )
	SetSetting( "career-icon-show", ButtonGetPressedFlag(c_TROLL_CAREER_ICON .. "Button") )
	SetSetting( "onnew-save-position", booleanRadioTransform[ TidyRollOptions.RadioGetId(c_TROLL_SAVE_POSITION_RADIO) ] )
	SetSetting( "onnew-flash", ButtonGetPressedFlag(c_TROLL_FLASH_ON_NEW .. "Button") )
	SetSetting( "onnew-glow", ButtonGetPressedFlag(c_TROLL_GLOW_ON_NEW .. "Button") )
	SetSetting( "onnew-flash-only-new-items", ButtonGetPressedFlag(c_TROLL_FLASH_ONLY_NEW_ITEM .. "Button") )
	SetSetting( "onnew-glow-only-new-items", ButtonGetPressedFlag(c_TROLL_GLOW_ONLY_NEW_ITEM .. "Button") )
	SetSetting( "sort-type", ComboBoxGetSelectedMenuItem(c_TROLL_SORT_TYPE_COMBO) )
	SetSetting( "sort-order", ComboBoxGetSelectedMenuItem(c_TROLL_SORT_ORDER_COMBO) )

	TidyRoll.Reload()
	TidyRoll.UpdateLootRollDataWithDefault()
end


function TidyRollOptions.OnClose()
	WindowSetShowing(c_TIDY_ROLL_OPTIONS, false)
end


-----------------------------------------
-- Checkbox Control
-----------------------------------------

function TidyRollOptions.OnCheckboxLBU()
	local checkboxName = SystemData.MouseOverWindow.name .. "Button"
	
	if( ButtonGetDisabledFlag(checkboxName) ) then return end
	
	ButtonSetPressedFlag(checkboxName,   not ButtonGetPressedFlag(checkboxName) )
	
	if( SystemData.MouseOverWindow.name == c_TROLL_FLASH_ON_NEW ) then
		ButtonSetDisabledFlag(c_TROLL_FLASH_ONLY_NEW_ITEM .. "Button",   not ButtonGetPressedFlag(checkboxName) )
	elseif( SystemData.MouseOverWindow.name == c_TROLL_GLOW_ON_NEW ) then
		ButtonSetDisabledFlag(c_TROLL_GLOW_ONLY_NEW_ITEM .. "Button",   not ButtonGetPressedFlag(checkboxName) )
	end
end


-----------------------------------------
-- Radio Control
-----------------------------------------

function TidyRollOptions.OnRadioLBU()
	radioName = SystemData.MouseOverWindow.name
	TidyRollOptions.RadioSetId( radioName:sub(1, radioName:len() - 1), WindowGetId(radioName) )
end


function TidyRollOptions.RadioSetId(radioGroupName, id)
	if( ButtonGetPressedFlag(radioGroupName .. id .. "Button") ) then return end
	
	local index = 1
	
	while( DoesWindowExist(radioGroupName .. index) ) do
		ButtonSetPressedFlag(radioGroupName .. index .. "Button", index == id)
		index = index + 1
	end
end


function TidyRollOptions.RadioGetId(radioGroupName)
	local index = 1
	
	while( DoesWindowExist(radioGroupName .. index) ) do
		if( ButtonGetPressedFlag(radioGroupName .. index .. "Button") ) then
			return index
		end
		index = index + 1
	end
	
	--return 0
end


-----------------------------------------
-- Tab Control
-----------------------------------------

function TidyRollOptions.ShowTab(tabIndex)
	if( tabIndex ) then
		selectedTab = tabIndex
	end
	
	for index, tabData in ipairs( tabs ) do        
		ButtonSetPressedFlag( tabData.buttonName, index == selectedTab )
		WindowSetShowing( tabData.windowName, index == selectedTab )
	end
end


function TidyRollOptions.OnTabLBU()
	local tabNumber	= WindowGetId (SystemData.ActiveWindow.name)
	TidyRollOptions.ShowTab(tabNumber)
end


--------------------------------------------------------------
-- UTILS
--------------------------------------------------------------

function TidyRollOptions.SetupLocals()
	GetSetting = TidyRoll.GetSetting
	SetSetting = TidyRoll.SetSetting
end
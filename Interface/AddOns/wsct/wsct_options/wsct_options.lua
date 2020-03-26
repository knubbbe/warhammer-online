local WSCT = WSCT
local options = WSCT.OPTIONS.Windows

local string_find = string.find
local floor = math.floor
local towstring = towstring

local selected_tab = "WSCTOptionsTabEvent"
local selected_color = ""
local selected_color_color
local selected_frame = WSCT.FRAME1

local arrAlign = {[1] = "left", [2] = "center", [3] = "right"}

----------------------
--Called when option page loads
function WSCT.OptionsOnInitialize()
  local color, value
  --Misc Options
  for k,v in pairs(options) do
    --titles
    if v.type == "title" then
      LabelSetText(k.."Text", v.label)
    elseif v.type == "label" then
      LabelSetText(k, v.label)
    --tabs
    elseif v.type == "button" then
      ButtonSetText(k, v.label)
    --events
    elseif v.type == "event" then
      --check box
      ButtonSetStayDownFlag(k.."ShowButton", true)
      ButtonSetPressedFlag(k.."ShowButton", (WSCT:Get(v.var)==1))
      --label
      LabelSetText(k.."ShowLabel", v.label)
      --color
      color = WSCT:Get(v.var, WSCT.COLORS_TABLE)
      LabelSetTextColor(k.."ShowLabel", color.r, color.g, color.b)
      ButtonSetText(k.."Color", WSCT.LOCALS.OPTION.COLORBUTTON)
      --crit
      ButtonSetStayDownFlag(k.."CritButton", true)
      ButtonSetPressedFlag(k.."CritButton", (WSCT:Get(v.var, WSCT.CRITS_TABLE)==1))
      LabelSetText(k.."CritLabel", WSCT.LOCALS.OPTION.CRIT.label)
      LabelSetTextColor(k.."CritLabel", color.r, color.g, color.b)
      --create combo box
      for frame, label in ipairs(WSCT.LOCALS.OPTION.FRAMECOMBO) do
        ComboBoxAddMenuItem(k.."FrameCombo", label)
      end
      --set to current
      ComboBoxSetSelectedMenuItem(k.."FrameCombo", WSCT:Get(v.var, WSCT.FRAMES_TABLE))
    --checkboxes
    elseif v.type == "check" then
      if v.table then
        value = WSCT:Get(v.var, WSCT.FRAMES_DATA_TABLE, v.table)
      else
        value = WSCT:Get(v.var)
      end
      if value then value = 1 end
      ButtonSetStayDownFlag(k.."Button", true)
      ButtonSetPressedFlag(k.."Button", (value==1))
      LabelSetText(k.."Label", v.label)
    --sliders
    elseif v.type == "slider" then
      if v.table then
        value = WSCT:Get(v.var, WSCT.FRAMES_DATA_TABLE, v.table)
      else
        value = WSCT:Get(v.var)
      end
      LabelSetText(k.."Label", v.label)
      LabelSetText(k.."Value", towstring(value))
      LabelSetText(k.."MinLabel", v.minLabel)
      LabelSetText(k.."MaxLabel", v.maxLabel)
      SliderBarSetCurrentPosition(k.."Slider", (value - v.minValue) / (v.maxValue - v.minValue))
    --comboboxes
    elseif v.type == "combo" then
      if v.table then
        value = WSCT:Get(v.var, WSCT.FRAMES_DATA_TABLE, v.table)
      else
        value = WSCT:Get(v.var)
      end
      LabelSetText(k.."Label", v.label)
      for id, data in ipairs(v.data) do
        if data.label then
          ComboBoxAddMenuItem(k.."Combo", data.label)
        else
          ComboBoxAddMenuItem(k.."Combo", data)
        end
      end
      --set to current
      ComboBoxSetSelectedMenuItem(k.."Combo", value)
    end
  end
  --setup dropdowns
  --events
  for k, v in ipairs(WSCT.LOCALS.OPTION.EVENTCOMBO) do
    ComboBoxAddMenuItem("WSCTOptionsEventWindowCombo", v)
  end
  --frames
  for k, v in ipairs(WSCT.LOCALS.OPTION.FRAMECOMBO) do
    ComboBoxAddMenuItem("WSCTOptionsFrameWindowCombo", v)
  end
  --profiles
  for k, v in ipairs(WSCT.LOCALS.OPTION.PROFILECOMBO) do
    ComboBoxAddMenuItem("WSCTOptionsProfileWindowCombo", v)
  end
  --for k, v in pairs(WSCT.db.profiles) do
  --  ComboBoxAddMenuItem("WSCTOptionsProfileWindowCombo", k)
  --end
  --set tab
  selected_tab = "WSCTOptionsTabEvent"
  WSCT:SetTab(selected_tab)
end

----------------------
--reset options (not pretty but don't feel like writing something less lazy =) )
function WSCT.ResetOptions()
  for k,v in pairs(options) do
    --titles
    if v.type == "event" then
      --check box
      ButtonSetPressedFlag(k.."ShowButton", (WSCT:Get(v.var)==1))
      --color
      color = WSCT:Get(v.var, WSCT.COLORS_TABLE)
      LabelSetTextColor(k.."ShowLabel", color.r, color.g, color.b)
      --crit
      ButtonSetPressedFlag(k.."CritButton", (WSCT:Get(v.var, WSCT.CRITS_TABLE)==1))
      LabelSetTextColor(k.."CritLabel", color.r, color.g, color.b)
      --set to current
      ComboBoxSetSelectedMenuItem(k.."FrameCombo", WSCT:Get(v.var, WSCT.FRAMES_TABLE))
    --checkboxes
    elseif v.type == "check" then
      if v.table then
        value = WSCT:Get(v.var, WSCT.FRAMES_DATA_TABLE, v.table)
      else
        value = WSCT:Get(v.var)
      end
      if value then value = 1 end
      ButtonSetPressedFlag(k.."Button", (value==1))
    --sliders
    elseif v.type == "slider" then
      if v.table then
        value = WSCT:Get(v.var, WSCT.FRAMES_DATA_TABLE, v.table)
      else
        value = WSCT:Get(v.var)
      end
      SliderBarSetCurrentPosition(k.."Slider", (value - v.minValue) / (v.maxValue - v.minValue))
    --comboboxes
    elseif v.type == "combo" then
      if v.table then
        value = WSCT:Get(v.var, WSCT.FRAMES_DATA_TABLE, v.table)
      else
        value = WSCT:Get(v.var)
      end
      --set to current
      ComboBoxSetSelectedMenuItem(k.."Combo", value)
    end
  end
  --set tab
  selected_tab = "WSCTOptionsTabEvent"
  WSCT:SetTab(selected_tab)
end

----------------------
--Called to open or create the option window
function WSCT:OpenMenu()
  if not (DoesWindowExist("WSCTOptions")) then
    CreateWindow("WSCTOptions", false)
  end
  WindowSetShowing("WSCTOptions", true)
end

----------------------
--Called to close option window
function WSCT.HideMenu()
  WindowSetShowing("WSCTOptions", false)
  if DoesWindowExist("WSCTOptionsColorPickerWindow") then
    WSCT.ColorHideMenu()
  end
end

----------------------
--Called when opened
function WSCT.OnShown()
  WindowUtils.OnShown(WSCT.HideMenu, WindowUtils.Cascade.MODE_NONE)
  --reset options 
  WSCT.ResetOptions()
end

----------------------
--Called when closed
function WSCT.OnHidden()
  WindowUtils.OnHidden()
  WSCT.HideExample()
  if DoesWindowExist("WSCTOptionsColorPickerWindow") then
    WSCT.ColorHideMenu()
  end
end

----------------------
--When Tab is clicked
function WSCT.TabOnLButtonUp()
  local tab = SystemData.ActiveWindow.name
  selected_tab = tab
  WSCT:SetTab(selected_tab)
end

----------------------
--Set the active tab
function WSCT:SetTab(tab)
  WSCT.HideExample()
  for k,v in pairs(WSCT.OPTIONS.TABS) do
    if (k ~= tab) then
      ButtonSetPressedFlag(k, false)
      WindowSetShowing(v, false)
    else
      ButtonSetPressedFlag(k, true)
      WindowSetShowing(v, true)
      if tab == "WSCTOptionsTabEvent" then
        ComboBoxSetSelectedMenuItem("WSCTOptionsEventWindowCombo", 1)
        WSCT.EventOnSelChanged(1)
      elseif tab == "WSCTOptionsTabFrame" then
        ComboBoxSetSelectedMenuItem("WSCTOptionsFrameWindowCombo", 1)
        WSCT.FrameOnSelChanged(1)
        WSCT.ShowExample()
      end
    end
  end
end

----------------------
--Set the active events
function WSCT.EventOnSelChanged(index)
  for k,v in pairs(options) do
    if v.type == "event" then
      if v.category == index then
        WindowSetShowing(k, true)
      else
        WindowSetShowing(k, false)
      end
    end
  end
end

----------------------
--Set the active frame
function WSCT.FrameOnSelChanged(index)
  local option, value
  selected_frame = index
  for k,v in pairs(WSCT.OPTIONS.FRAME_OPTIONS) do
    option = WSCT.OPTIONS.Windows[v]
    value = WSCT:Get(option.var, WSCT.FRAMES_DATA_TABLE, selected_frame)
    if option.type == "combo" then
      ComboBoxSetSelectedMenuItem(v.."Combo", value)
      if v == "WSCTComboANITYPE" then
        WSCT.UpdateAnimationOptions(value)
      end
    elseif option.type == "slider" then
      LabelSetText(v.."Value", towstring(value))
      SliderBarSetCurrentPosition(v.."Slider", (value - option.minValue) / (option.maxValue - option.minValue))
    elseif option.type == "check" then
      if value then value = 1 end
      ButtonSetPressedFlag(v.."Button", (value==1))
    end
  end
  WSCT.ShowExample()
  WSCT.ColorExample(index)
end

----------------------
--default tooltip style
function WSCT:MakeTooltip(window, text)
  Tooltips.CreateTextOnlyTooltip (window, text)
  Tooltips.SetTooltipColorDef (1, 1, Tooltips.COLOR_HEADING)
  Tooltips.AnchorTooltip (Tooltips.ANCHOR_WINDOW_RIGHT)
  Tooltips.Finalize ()
end

----------------------
--When Mousing Over
function WSCT.OnMouseOver()
  local window = SystemData.ActiveWindow.name
  local parent1 = WindowGetParent(window)
  local parent2 = WindowGetParent(parent1)
  if (options[window] and options[window].tooltiptext) then
    WSCT:MakeTooltip(window, options[window].tooltiptext)
  elseif (options[parent1] and options[parent1].tooltiptext) then
    WSCT:MakeTooltip(window, options[parent1].tooltiptext)
  elseif (options[parent2] and options[parent2].tooltiptext) then
    WSCT:MakeTooltip(window, options[parent2].tooltiptext)
  end
end

----------------------
--When Mousing Over Crit
function WSCT.CritOnMouseOver()
  local window = SystemData.ActiveWindow.name
  WSCT:MakeTooltip(window, WSCT.LOCALS.OPTION.CRITMOUSE)
end

----------------------
--When Mousing Over Frame Combobox
function WSCT.FrameComboOnMouseOver()
  local window = SystemData.ActiveWindow.name
  WSCT:MakeTooltip(window, WSCT.LOCALS.OPTION.FRAMEMOUSE)
end


----------------------
--When CheckBox clicked
function WSCT.CheckBoxOnLButtonUp()
  local button = SystemData.ActiveWindow.name.."Button"
  local pressed = ButtonGetPressedFlag(button)
  local crit = string_find(button, "Crit")
  --get option (from one or two parents)
  local option = options[WindowGetParent(button)] or options[WindowGetParent(WindowGetParent(button))]
  ButtonSetPressedFlag( button, not pressed)
  --save var
  local savevalue = not pressed
  if savevalue then savevalue = 1 end
  if crit then
    WSCT:Set(option.var, savevalue, WSCT.CRITS_TABLE)
  else
    if selected_frame and option.table then
      WSCT:Set(option.var, savevalue, WSCT.FRAMES_DATA_TABLE, selected_frame)
    else
      WSCT:Set(option.var, savevalue)
    end
  end
  WSCT.ShowExample()
end

----------------------
--When combo box changesd clicked
function WSCT.FrameComboOnSelChanged(index)
  local window = SystemData.ActiveWindow.name
  local var = options[WindowGetParent(window)].var
  WSCT:Set(var, index, WSCT.FRAMES_TABLE)
end

----------------------
--When Color button clicked
function WSCT.ColorOnButtonUp()
  local window = SystemData.ActiveWindow.name
  selected_color = WindowGetParent(window)
  local var = options[selected_color].var
  local color = WSCT:Get(var, WSCT.COLORS_TABLE)
  if not (DoesWindowExist("WSCTOptionsColorPickerWindow")) then
    CreateWindow("WSCTOptionsColorPickerWindow", false)
  end
  WindowSetShowing("WSCTOptionsColorPickerWindow", true)
  if color and var then
    -- Set the sliders
    SliderBarSetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorRedSlider", color.r / 255 )
    SliderBarSetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorGreenSlider", color.g / 255 )
    SliderBarSetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorBlueSlider", color.b / 255 )
    -- Set Swatch
    WindowSetTintColor("WSCTOptionsColorPickerWindowCustomColorSwatch", color.r, color.g, color.b)
  end
end

----------------------
--When Color Button Accept clicked
function WSCT.ColorAcceptButtonOnButtonUp()
  if selected_color and selected_color_color then
    local var = options[selected_color].var
    WSCT:Set(var, selected_color_color, WSCT.COLORS_TABLE)
    selected_color_color = nil
    selected_color = nil
  end
  WindowSetShowing("WSCTOptionsColorPickerWindow", false)
  WindowSetShowing("WSCTOptionsColorPickerWindowColorSelectionRing", false)
  WSCT.ShowExample()
end

----------------------
--When Color Button Accept clicked
function WSCT.ColorHideMenu()
  if selected_color then
    local var = options[selected_color].var
    local color = WSCT:Get(var, WSCT.COLORS_TABLE)
    LabelSetTextColor(selected_color.."ShowLabel", color.r, color.g, color.b)
    LabelSetTextColor(selected_color.."CritLabel", color.r, color.g, color.b)
    selected_color_color = nil
    selected_color = nil
  end
  WindowSetShowing("WSCTOptionsColorPickerWindow", false)
  WindowSetShowing("WSCTOptionsColorPickerWindowColorSelectionRing", false)
end

----------------------
--Called when color window loads
function WSCT.ColorOnInitialize()
  LabelSetText( "WSCTOptionsColorPickerWindowCustomColorText", GetChatString(StringTables.Chat.LABEL_CHAT_OPTIONS_CUSTOM) )
  LabelSetText( "WSCTOptionsColorPickerWindowCustomColorRedText", GetChatString(StringTables.Chat.LABEL_CHAT_OPTIONS_RED) )
  LabelSetText( "WSCTOptionsColorPickerWindowCustomColorGreenText", GetChatString(StringTables.Chat.LABEL_CHAT_OPTIONS_GREEN) )
  LabelSetText( "WSCTOptionsColorPickerWindowCustomColorBlueText", GetChatString(StringTables.Chat.LABEL_CHAT_OPTIONS_BLUE) )
  ButtonSetText( "WSCTOptionsColorPickerWindowAcceptButton", GetChatString(StringTables.Chat.LABEL_CHAT_SETTINGS_ACCEPT) )
  WindowSetShowing("WSCTOptionsColorPickerWindowColorSelectionRing", false)
  ColorPickerCreateWithColorTable("WSCTOptionsColorPickerWindowColorPicker", ChatSettings.Colors, 5, 10, 10)
end

----------------------
--Called when color selected
function WSCT.OnLButtonUpColorPicker(flags, x, y)
  if selected_color == nil then
      return true
  end
  local color = ColorPickerGetColorAtPoint( "WSCTOptionsColorPickerWindowColorPicker", x, y )
  -- We have a valid color
  if color  then
    -- Set Text Colors
    LabelSetTextColor(selected_color.."ShowLabel", color.r, color.g, color.b)
    LabelSetTextColor(selected_color.."CritLabel", color.r, color.g, color.b)
    -- Set the sliders
    SliderBarSetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorRedSlider", color.r / 255 )
    SliderBarSetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorGreenSlider", color.g / 255 )
    SliderBarSetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorBlueSlider", color.b / 255 )
    -- Set Swatch
    WindowSetTintColor("WSCTOptionsColorPickerWindowCustomColorSwatch", color.r, color.g, color.b)
    -- Update the position of the color ring
    WindowSetShowing("WSCTOptionsColorPickerWindowColorSelectionRing", true)
    WindowClearAnchors("WSCTOptionsColorPickerWindowColorSelectionRing")
    WindowAddAnchor( "WSCTOptionsColorPickerWindowColorSelectionRing", "topleft", "WSCTOptionsColorPickerWindowColorPicker", "topleft", color.x-5, color.y-5 )
    -- Update the color
    selected_color_color = color
  end
end

----------------------
--Called when color slider changed
function WSCT.OnSetCustomColor()
  if selected_color == nil then
      return true
  end
  local color = {r = 0, g = 0, b = 0}
  --Get Colors from Sliders
  color.r = SliderBarGetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorRedSlider") * 255
  color.g = SliderBarGetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorGreenSlider") * 255
  color.b = SliderBarGetCurrentPosition("WSCTOptionsColorPickerWindowCustomColorBlueSlider") * 255
  -- Set Text Colors
  LabelSetTextColor(selected_color.."ShowLabel", color.r, color.g, color.b)
  LabelSetTextColor(selected_color.."CritLabel", color.r, color.g, color.b)
  -- Set Swatch
  WindowSetTintColor("WSCTOptionsColorPickerWindowCustomColorSwatch", color.r, color.g, color.b)
  -- Update the color
  selected_color_color = color
end

----------------------
--Called when color slider changed
function WSCT.SliderOnSlide(value)
  local window = SystemData.ActiveWindow.name
  local option = options[WindowGetParent(window)]
  local diff = option.maxValue - option.minValue
  local base = (value * diff) + option.minValue
  local final = floor(base / option.valueStep) * option.valueStep
  if selected_frame and option.table then
    WSCT:Set(option.var, final, WSCT.FRAMES_DATA_TABLE, selected_frame)
  else
    WSCT:Set(option.var, final)
  end
  LabelSetText(WindowGetParent(window).."Value", towstring(final))
  WSCT.ShowExample()
end

----------------------
--When combo box selection
function WSCT.ComboOnSelChanged(index)
  local window = SystemData.ActiveWindow.name
  local option = options[WindowGetParent(window)]
  if selected_frame and option.table then
    WSCT:Set(option.var, index, WSCT.FRAMES_DATA_TABLE, selected_frame)
  else
    WSCT:Set(option.var, index)
  end
  if window == "WSCTComboANITYPECombo" then
    WSCT.UpdateAnimationOptions(index)
  end
  WSCT.ShowExample()
end

----------------------
--update available options
function WSCT.UpdateAnimationOptions(id)
  if (id == 1 or id == 6) then
    ButtonSetDisabledFlag("WSCTCheckboxDIRECTIONButton", false)
    WindowSetShowing("WSCTComboANISIDETYPE", false)
    WindowSetShowing("WSCTSliderGAPDIST", false)
  elseif (id == 7 or id == 8) then
    ButtonSetDisabledFlag("WSCTCheckboxDIRECTIONButton", false)
    WindowSetShowing("WSCTComboANISIDETYPE", true)
    WindowSetShowing("WSCTSliderGAPDIST", true)
  else
    ButtonSetDisabledFlag("WSCTCheckboxDIRECTIONButton", true)
    WindowSetShowing("WSCTComboANISIDETYPE", true)
    WindowSetShowing("WSCTSliderGAPDIST", false)
  end
end

-----------------------
--Show an example for each frame
function WSCT.ShowExample()
  local WSCT_TEXTSIZE_BASE = 24
  for k,v in ipairs(WSCT.LOCALS.OPTION.EXAMPLES) do
    --get values
    v.textname = v.name.."Text"
    v.font = WSCT.LOCALS.FONTS[WSCT:Get("FONT", WSCT.FRAMES_DATA_TABLE, v.frame)].font
    v.posX = WSCT:Get("XOFFSET", WSCT.FRAMES_DATA_TABLE, v.frame)
    v.posY = WSCT:Get("YOFFSET", WSCT.FRAMES_DATA_TABLE, v.frame)
    v.alpha = WSCT:Get("ALPHA", WSCT.FRAMES_DATA_TABLE, v.frame)
    v.textsize = WSCT:Get("TEXTSIZE", WSCT.FRAMES_DATA_TABLE, v.frame)
    v.align = WSCT:Get("ALIGN", WSCT.FRAMES_DATA_TABLE, v.frame)
    v.uiscale = InterfaceCore.GetScale()
    
    --setup window
    if not DoesWindowExist(v.name) then
      CreateWindowFromTemplate(v.name, "WSCTAnimationFrame", "WSCTContainer")
    end
    WindowClearAnchors(v.name)
    WindowAddAnchor(v.name, "center", "WSCTContainer", "center",  0, 0)
    LabelSetFont(v.textname, v.font, WindowUtils.FONT_DEFAULT_TEXT_LINESPACING)
    LabelSetText(v.textname, v.label)
    LabelSetTextAlign(v.textname, arrAlign[v.align])
    local x, y = LabelGetTextDimensions(v.textname)
    WindowSetDimensions(v.textname, x+5, y)
    
    WindowClearAnchors(v.textname)
    WindowAddAnchor(v.textname, arrAlign[2], v.name, arrAlign[v.align], v.posX, -v.posY)
    WindowSetFontAlpha(v.textname, v.alpha)
    WindowSetScale(v.textname, v.uiscale * (v.textsize/WSCT_TEXTSIZE_BASE))
    WindowSetShowing(v.name, true)
  end
end

-----------------------
--Hide an example for each frame
function WSCT.HideExample()
  for k,v in ipairs(WSCT.LOCALS.OPTION.EXAMPLES) do
    if DoesWindowExist(v.name) then
      DestroyWindow(v.name)
    end
  end
end

-----------------------
--highlight current frame example
function WSCT.ColorExample(index)
  for k,v in ipairs(WSCT.LOCALS.OPTION.EXAMPLES) do
    if k == index then
      LabelSetTextColor(v.name.."Text", 255, 255, 0)
    else
      LabelSetTextColor(v.name.."Text", 255, 255, 255)
    end
  end
end

-----------------------
--Test frame example
function WSCT.TestOnButtonUp()
  local color = {r=255,g=255,b=255}
  for k,v in ipairs(WSCT.LOCALS.OPTION.EXAMPLES) do
    WSCT:DisplayText(v.label, color, nil, "damage", v.frame, nil, nil, GetIconData(GetAbilityData(2490).iconNum))
  end
end

-----------------------
--Load the selected default profile
function WSCT.LoadProfileOnButtonUp()
  local id = ComboBoxGetSelectedMenuItem("WSCTOptionsProfileWindowCombo")
  WSCT.OPTIONS.PROFILE_FUNCS[id]()
  WSCT.ResetOptions()
end
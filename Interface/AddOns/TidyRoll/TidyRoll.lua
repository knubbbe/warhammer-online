if( TidyRoll == nil ) then
  TidyRoll = {}
end

TidyRoll.dVersion = L"v1.3.2"


--------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------

local c_PLAYER_CAREER_LINE = GameData.Player.career.line

local c_MAX_ROLL_BUTTONS = 10

local c_TIDY_ROLL_FRAME = "TidyRollFrame"
local c_TIDY_ROLL_ANCHOR = "TidyRollAnchor"
local c_TIDY_ROLL_OPTIONS = "TidyRollOptions"
local c_TIDY_ROLL_TIMER = "TidyRollTimer"
local c_TIDY_ROLL_ESC = "TidyRollEsc"

local c_ROLL_CHOICE_GREED = GameData.LootRoll.GREED
local c_ROLL_CHOICE_NEED = GameData.LootRoll.NEED
local c_ROLL_CHOICE_PASS = GameData.LootRoll.PASS
local c_ROLL_CHOICE_INVALID  = GameData.LootRoll.INVALID

local c_SORT_TYPE_TIMER = 1
local c_SORT_TYPE_NAME = 2
local c_SORT_TYPE_RARITY = 3
local c_SORT_TYPE_LEVEL = 4
local c_SORT_TYPE_RENOWN = 5
local c_SORT_TYPE_TYPE = 6

local c_SORT_ORDER_UP = 1
local c_SORT_ORDER_DOWN = 2

--------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------

local TidyRoll = TidyRoll
local pairs = pairs
local ipairs = ipairs
local tinsert = table.insert
local tremove = table.remove
local tsort = table.sort
local math_modf = math.modf

local SelectItemRollChoice = SelectItemRollChoice
local GetLootRollData = GetLootRollData
local GetItemRarityColor = DataUtils.GetItemRarityColor

local Settings
local GetSetting
local SetSetting


local rVersion = 14

local firstLoad =  true
local testMode = false
local troll_debug = false


local SetupTestData

local old_EASelectRollOption = nil
local old_EAUpdateLootRollData = nil

local rollFrames = {}
local lootData = {}
local lootDataDisplayOrder = { newItems = {} }


-- LOCAL SETTINGS FOR PERFORMANCE --

local LocalSettings = {}

local SCROLL_INVERT
local DEFAULT_ENABLED


-- DEFAULT SETTINGS --

local DefaultSettings = {
  -- General tab
  ["default-disable"] = true,
  ["tooltip-disable-comparison"] = false,
  ["button-number"] = 1,
  ["button-offset"] = 0,
  ["button-growth-direction"] = L"down",

  -- Controls tab
  ["scroll-invert"] = false,
  ["managment-onesc-rollchoice"] = c_ROLL_CHOICE_INVALID,
  ["managment-onesc-visible-only"] = true,
  ["managment-bind-need"] = 2,
  ["managment-bind-need-modificator"] = 0,
  ["managment-bind-greed"] = 3,
  ["managment-bind-greed-modificator"] = 0,
  ["managment-bind-pass"] = 4,
  ["managment-bind-pass-modificator"] = 0,

  -- Misc tab
  ["auto-greed"] = false,
  ["auto-need-for-medallions"] = false,
  ["timer-show-text"] = true,
  ["career-icon-show"] = true,
  ["onnew-save-position"] = true,
  ["onnew-flash"] = true,
  ["onnew-glow"] = true,
  ["onnew-flash-only-new-items"] = false,
  ["onnew-glow-only-new-items"] = false,
  ["sort-type"] = c_SORT_TYPE_TIMER,
  ["sort-order"] = c_SORT_ORDER_UP,
}

-- Custom items IDS --
local customAutoRollIds = {}


-- LOCAL FUNCTIONS --

local function ScrollTableDown(tbl)
  local temp = tbl[1]
  tremove(tbl, 1)
  tinsert(tbl, temp)
end



local function ScrollTableUp(tbl)
  local length = #tbl
  local temp = tbl[length]
  tremove(tbl, length)
  tinsert(tbl, 1, temp)
end


local sortKeys = {
  [c_SORT_TYPE_RARITY] = "rarity",
  [c_SORT_TYPE_LEVEL] = "level",
  [c_SORT_TYPE_RENOWN] = "renown",
  [c_SORT_TYPE_TYPE] = "type",
}

local function CompareItems(index1, index2)
  if( index1 == nil ) then
    return true
  end

  if( index2 == nil ) then
    return false
  end

  local type = GetSetting("sort-type")
  local order = GetSetting("sort-order")

  if( type ~= c_SORT_TYPE_TIMER ) then

    local rollData1 = lootData[index1]
    local rollData2 = lootData[index2]

    if( rollData1 == nil or rollData1.itemData == nil or rollData1.itemData.id == 0 ) then
      return false
    end
    if( rollData2 == nil or rollData2.itemData == nil or rollData2.itemData.id == 0 ) then
      return true
    end


    if( type == c_SORT_TYPE_NAME ) then
      -- Sort by name

      compareResult = WStringsCompare(rollData1.itemData.name, rollData2.itemData.name)

      if( compareResult ~= 0 ) then
        if( order == c_SORT_ORDER_UP ) then
          return( compareResult < 0 )
        else
          return( compareResult > 0 )
        end
      end

    else
      -- Sort by key-number

      local key = sortKeys[type]

      local value1 = rollData1.itemData[key]
      local value2 = rollData2.itemData[key]

      if( value1 ~= value2 ) then
        if( order == c_SORT_ORDER_UP ) then
          return( value1 < value2 )
        else
          return( value1 > value2 )
        end
      end
    end

  end

  -- Sort by timer
  if( order == c_SORT_ORDER_UP ) then
    return( index1 < index2 )
  else
    return( index1 > index2 )
  end
end


local function print_autoroll(text)
  TextLogAddEntry ("Chat", SystemData.ChatLogFilters.LOOT_ROLL, text)
end

--------------------------------------------------------------
-- END LOCAL VARIABLES
--------------------------------------------------------------


function TidyRoll.ToggleOptions()
  WindowSetShowing( c_TIDY_ROLL_OPTIONS, not WindowGetShowing(c_TIDY_ROLL_OPTIONS) )
end


function TidyRoll.Initialize()
  CreateWindow(c_TIDY_ROLL_ANCHOR, false)
  CreateWindow(c_TIDY_ROLL_TIMER, false)
  CreateWindow(c_TIDY_ROLL_ESC, false)

  LayoutEditor.RegisterWindow(c_TIDY_ROLL_ANCHOR, L"Tidy Roll", L"Where Tidy Roll are displayed.", false, false, true, nil)

  RegisterEventHandler( SystemData.Events.LOADING_END,  "TidyRoll.OnLoad")
  RegisterEventHandler( SystemData.Events.RELOAD_INTERFACE,  "TidyRoll.OnLoad")
  RegisterEventHandler( SystemData.Events.INTERACT_SHOW_LOOT_ROLL_DATA, "TidyRoll.UpdateLootRollData")
  RegisterEventHandler( SystemData.Events.INTERACT_LOOT_ROLL_FIRST_ITEM, "TidyRoll.OnLootRollFirstItem")

  tinsert(LayoutEditor.EventHandlers,
    function (eventId)
      if eventId == LayoutEditor.EDITING_END then
        TidyRoll.RefreshFrames()
      end
    end
  )
end


function TidyRoll.Shutdown()
  UnregisterEventHandler( SystemData.Events.LOADING_END,  "TidyRoll.OnLoad")
  UnregisterEventHandler( SystemData.Events.RELOAD_INTERFACE,  "TidyRoll.OnLoad")
  UnregisterEventHandler( SystemData.Events.INTERACT_SHOW_LOOT_ROLL_DATA, "TidyRoll.UpdateLootRollData")

  LayoutEditor.UnregisterWindow( c_TIDY_ROLL_ANCHOR )
end


function TidyRoll.SetupLocals()
  Settings = TidyRoll.Settings
  GetSetting = TidyRoll.GetSetting
  SetSetting = TidyRoll.SetSetting
end


function TidyRoll.OnLoad()
  if( firstLoad ) then
    firstLoad = false

    -- Register slash command
    if( LibSlash ~= nil ) then
      LibSlash.RegisterWSlashCmd("troll", TidyRoll.ToggleOptions)
    end

    if( TidyRoll.Settings == nil ) then TidyRoll.Settings = {} end

    TidyRoll.SetupLocals()
    TidyRollFrame.SetupLocals()
    TidyRollOptions.SetupLocals()
    TidyRoll.CustomAutoRoll.SetupLocals()

    TidyRoll.Reload()
    TidyRollOptions.Initialize()
    TidyRoll.CustomAutoRoll.Initialize()

    -- Unregister some events
    if( DoesWindowExist("EA_Window_LootRoll") ) then
      WindowUnregisterCoreEventHandler("EA_Window_LootRoll", "OnShown")
      WindowUnregisterCoreEventHandler("EA_Window_LootRoll", "OnHidden")

      if( not DEFAULT_ENABLED ) then
        WindowSetShowing("EA_Window_LootRoll", false)
      end

      -- Set hooks
      if( EA_Window_LootRoll and type(EA_Window_LootRoll.SelectRollOption) == "function" ) then
        old_EASelectRollOption = EA_Window_LootRoll.SelectRollOption
        EA_Window_LootRoll.SelectRollOption = function (...)
          old_EASelectRollOption(...)
          TidyRoll.UpdateLootRollData()
        end

        old_EAUpdateLootRollData = EA_Window_LootRoll.UpdateLootRollData
        EA_Window_LootRoll.UpdateLootRollData = function (...)
          if( DEFAULT_ENABLED ) then
            old_EAUpdateLootRollData(...)
          end
        end
      end

    end

    SetSetting("version", rVersion)
  end
  -- end firstLoad

  TidyRoll.UpdateLootRollData()
end


function TidyRoll.Reload()
  TidyRoll.SetupLocalSettings()

  TidyRoll.ToggleDefault()
  TidyRoll.InitializeFrames()
  TidyRoll.RefreshFrames()
end


function TidyRoll.ToggleDefault()
  if( not DEFAULT_ENABLED and EA_Window_LootRoll and EA_Window_LootRoll.lootDataDisplayOrder ) then
    EA_Window_LootRoll.lootDataDisplayOrder = nil
  end
end


function TidyRoll.InitializeFrames()
  local buttonNum = GetSetting("button-number")

  for index = 1, c_MAX_ROLL_BUTTONS do

    if ( index <= buttonNum ) and ( rollFrames[index] == nil ) then
      rollFrames[index] = TidyRollFrame:Create( c_TIDY_ROLL_FRAME .. tostring(index) )

    elseif ( index > buttonNum ) and ( rollFrames[index] ~= nil ) then
      rollFrames[index]:Destroy()
      rollFrames[index] = nil
    end
  end
end


function TidyRoll.RefreshFrames()
  local direction = GetSetting("button-growth-direction")
  local offset = GetSetting("button-offset")

  if type(offset) ~= "number" then offset = 0 end

  local anchor = {
    RelativeTo = c_TIDY_ROLL_ANCHOR,
    Point = "topleft",
    RelativePoint = "topleft",
  }

  for _, frame in ipairs(rollFrames) do
    frame:SetAnchor(anchor)
    frame:SetScale( WindowGetScale(c_TIDY_ROLL_ANCHOR) )

    anchor = TidyRoll.CreateAnchor( frame:GetName(), direction, offset )
  end
end


local function AutoRoll(lootIndex, rollData )
  local autoRollSettings = EA_Window_OpenPartyLootRollOptions.Settings
  local item = rollData.itemData
  local rolled = false

  -- Don't auto roll on item set pieces
  if item.itemSet > 0
  then
    return rolled
  end

  local function CheckAndDoAutoRoll( filter, rollChoice )
    if filter and rollChoice and rollChoice ~= c_ROLL_CHOICE_INVALID
    then
      rolled = TidyRoll.SelectRollOption( lootIndex, rollChoice, false )
      return true
    end
    return false
  end

  local function CheckAndDoAutoRollWithRarity( filter, rollChoiceTable )
    local rollChoice = rollChoiceTable[item.rarity]
    CheckAndDoAutoRoll( filter, rollChoice )
  end

  -- simple type checks
  if      CheckAndDoAutoRoll( item.rarity == SystemData.ItemRarity.UTILITY, autoRollSettings.trash )
    or  CheckAndDoAutoRollWithRarity( DataUtils.IsTradeSkillItem( item, nil ), autoRollSettings.crafting )
    or  CheckAndDoAutoRollWithRarity( item.type == GameData.ItemTypes.CURRENCY, autoRollSettings.currency )
    or  CheckAndDoAutoRollWithRarity( item.type == GameData.ItemTypes.POTION, autoRollSettings.potion )
    or  CheckAndDoAutoRollWithRarity( item.type == GameData.ItemTypes.ENHANCEMENT, autoRollSettings.talisman )
  then
    return rolled
  end

  -- equipment (usable and unusable)
  local playerCanEventuallyUse = DataUtils.PlayerCanEventuallyUseItem( item )
  local isEquipment = DataUtils.ItemIsWeapon( item ) or DataUtils.ItemIsArmor( item )
  if      CheckAndDoAutoRollWithRarity( isEquipment and playerCanEventuallyUse, autoRollSettings.usableEquipment )
    or  CheckAndDoAutoRollWithRarity( isEquipment and not playerCanEventuallyUse, autoRollSettings.unusableEquipment )
  then
    return rolled
  end

  return rolled
end


function TidyRoll.UpdateLootRollData( temptest )
  if( troll_debug and temptest~=123 ) then DEBUG(L"   TidyRoll.UpdateLootRollData") end

  local AUTO_GREED = GetSetting("auto-greed")
  local AUTO_NEED_FOR_MEDALLIONS = GetSetting("auto-need-for-medallions")
  local ONNEW_SAVE_POSITION = GetSetting("onnew-save-position")

  local oldListLen = #lootDataDisplayOrder

  local oldPositionId
  if( oldListLen > 0 ) then
    for index = 1, oldListLen do
      local lootIndex = lootDataDisplayOrder[index]
      local rollData = lootData[lootIndex]

      if( lootIndex and rollData.rollChoice == c_ROLL_CHOICE_INVALID ) then
        oldPositionId = rollData.sourceId
        break
      end
    end
  end

  lootData = GetLootRollData()
  lootDataDisplayOrder = { newItems = lootDataDisplayOrder.newItems }

  -- Test Data
  if( testMode and lootData[1].itemData.id == 0 ) then
    SetupTestData()
    oldListLen = 7

    if( AUTO_GREED ) then
      oldListLen = 3
    end
  end

  for lootIndex, rollData in ipairs( lootData )
  do
    local itemData = rollData.itemData
    
    -- check for unknown currency and add it to autoroll list
    if(itemData.id ~= 0 and itemData.type == GameData.ItemTypes.CURRENCY) then
      TidyRoll.checkForUnknownCurrency(itemData)
    end

    if( itemData.id ~= 0 and rollData.rollChoice == c_ROLL_CHOICE_INVALID )
    then
      if( AUTO_NEED_FOR_MEDALLIONS and customAutoRollIds[itemData.uniqueID]
        and ( rollData.allowNeed == true or customAutoRollIds[itemData.uniqueID] ~= c_ROLL_CHOICE_NEED ) ) then

        local choice = customAutoRollIds[itemData.uniqueID]
        if( choice ~= c_ROLL_CHOICE_INVALID ) then
          TidyRoll.SelectRollOption( lootIndex, choice, false )
          print_autoroll( L"TidyRoll: Auto Roll on " .. itemData.name .. L" !!!" )
          if( troll_debug ) then DEBUG(L"TidyRoll: Auto Roll on " .. itemData.name .. L" !!!") end
        else
          tinsert( lootDataDisplayOrder, lootIndex )
        end

      elseif( AUTO_GREED and not rollData.allowNeed ) then
        TidyRoll.SelectRollOption( lootIndex, c_ROLL_CHOICE_GREED, false )
        print_autoroll( L"TidyRoll: Auto Greed on " .. itemData.name .. L" !!!" )
        if( troll_debug ) then DEBUG(L"TidyRoll: Auto Greed on " .. itemData.name .. L" !!!") end

      elseif( not DEFAULT_ENABLED and AutoRoll(lootIndex, rollData) ) then
        print_autoroll( L"Auto Roll on " .. itemData.name .. L" !!!" )
        if( troll_debug ) then DEBUG(L"Auto Roll on " .. itemData.name .. L" !!!") end

      else
        tinsert( lootDataDisplayOrder, lootIndex )
      end
    end
  end

  -- NEW ITEM ANIMATION / SAVE POSITION / SORT

  local listLen = #lootDataDisplayOrder
  local diff = listLen - oldListLen

  local isNewItems

  if( diff == 0 ) then
  -- do nothing
  elseif( diff > 0 ) then
    if( not ONNEW_SAVE_POSITION ) then
      oldPositionId = nil
    end

    isNewItems = true

    lootDataDisplayOrder.newItems = {}

    for index = listLen - diff + 1, listLen
    do
      lootDataDisplayOrder.newItems[ lootData[ lootDataDisplayOrder[index] ].sourceId ] = true
    end
  else
    isNewItems = false
  end

  if( listLen > 1 ) then

    -- Sort Table
    tsort(lootDataDisplayOrder, CompareItems)

    -- Scroll to old position or to top item in list
    if( oldPositionId ) then
      local count = 0
      while( (lootData[ lootDataDisplayOrder[1] ].sourceId ~= oldPositionId) and (count ~= listLen) ) do
        count = count + 1

        ScrollTableDown(lootDataDisplayOrder)
      end
    end
  end

  TidyRoll.UpdateFrames(true, isNewItems)
end

function TidyRoll.checkForUnknownCurrency(itemData)
  if(itemData == nil or itemData.id == 0) then
     return
  end
  
  if(TidyRoll.CustomAutoRoll.SearchItemById( Settings.CustomAutoRollSettings, itemData.uniqueID ) == nil) then
    local autoRollRowData = {
      id    = itemData.uniqueID,
      iconNum = itemData.iconNum,
      name  = itemData.name,
      rarity  = itemData.rarity,
      choice  = GameData.LootRoll.INVALID,
    }
    tinsert(Settings.CustomAutoRollSettings, autoRollRowData)
    TidyRoll.UpdateCustomAutoRollIds(Settings.CustomAutoRollSettings)
  end
end

function TidyRoll.UpdateFrames(updateShowing, isNewItems)
  local ON_NEW_FLASH = GetSetting("onnew-flash")
  local ON_NEW_GLOW  = GetSetting("onnew-glow")
  local ON_NEW_FLASH_ONLY_NEW_ITEMS = GetSetting("onnew-flash-only-new-items")
  local ON_NEW_GLOW_ONLY_NEW_ITEMS  = GetSetting("onnew-glow-only-new-items")
  local CAREER_ICON_SHOW = GetSetting("career-icon-show")

  for index, lootIndex in ipairs( lootDataDisplayOrder )
  do
    local rollData = lootData[lootIndex]
    local frame = rollFrames[index]

    if( frame ) then

      -- Flash & Glow
      local flash = ON_NEW_FLASH and isNewItems and ( not ON_NEW_FLASH_ONLY_NEW_ITEMS or lootDataDisplayOrder.newItems[rollData.sourceId] == true )
      local glow  = ON_NEW_GLOW  and (ON_NEW_GLOW_ONLY_NEW_ITEMS or isNewItems) and ( not ON_NEW_GLOW_ONLY_NEW_ITEMS  or lootDataDisplayOrder.newItems[rollData.sourceId] == true )

      -- Career icon
      local careerIconNum

      if( CAREER_ICON_SHOW ) then
        local careers = rollData.itemData.careers
        local itemCareer = careers[1]

        if( careers[2] ~= nil ) then
          for _, careerLine in ipairs(careers) do
            if( careerLine == c_PLAYER_CAREER_LINE ) then
              itemCareer = careerLine
              break
            end
          end
        end

        careerIconNum = Icons.GetCareerIconIDFromCareerLine( itemCareer )
      end

      frame:SetLootData(
        lootIndex,
        rollData.itemData.iconNum,
        rollData.allowNeed,
        rollData.timer,
        GetItemRarityColor(rollData.itemData),
        careerIconNum,
        flash,
        glow)
    end
  end

  if( updateShowing ) then
    for index, frame in ipairs(rollFrames) do
      --Show frames when they contain items
      frame:Show( lootDataDisplayOrder[index] ~= nil  )
    end

    local listNotEmpty = lootDataDisplayOrder[1] ~= nil

    WindowSetShowing( c_TIDY_ROLL_TIMER, listNotEmpty )

    if( (listNotEmpty) and (GetSetting("managment-onesc-rollchoice") ~= c_ROLL_CHOICE_INVALID) and (not testMode) ) then
      TidyRoll.CallInDelay(TidyRoll.ShowEsc, 0.1)
    else
      WindowSetShowing( c_TIDY_ROLL_ESC, false )
    end

    TidyRoll.UpdateTooltip()
  end
end


function TidyRoll.ShowEsc()
  WindowSetShowing( c_TIDY_ROLL_ESC, true )
end


function TidyRoll.UpdateTooltip(rollFrame)
  rollFrame = rollFrame or FrameManager:GetMouseOverWindow()

  if( rollFrame and rollFrame.isValidTidyRollFrame ) then
    Tooltips.CreateItemTooltip( lootData[rollFrame.m_LootIndex].itemData, SystemData.MouseOverWindow.name, nil, GetSetting("tooltip-disable-comparison") )
  end
end


function TidyRoll.SelectRollOption( lootIndex, rollChoice, update )
  local rollData = lootData[lootIndex]
  if( troll_debug ) then
    DEBUG(L"TidyRoll.SelectRollOption lootIndex = " .. lootIndex .. L" rollChoice = " .. rollChoice .. L" name = " .. rollData.itemData.name)
  end

  if( rollChoice ~= c_ROLL_CHOICE_NEED or rollData.allowNeed == true ) then
    rollData.rollChoice = rollChoice

    SelectItemRollChoice( rollData.sourceId, rollData.lootSlot, rollChoice )

    if( update ~= false ) then
      TidyRoll.UpdateLootRollDataWithDefault()
    end

    return true
  end

  return false
end


function TidyRoll.UpdateLootRollDataWithDefault()
  --if( troll_debug ) then DEBUG(L"TidyRoll.UpdateLootRollDataWithDefault") end

  TidyRoll.UpdateLootRollData(123)

  if( DEFAULT_ENABLED and EA_Window_LootRoll and EA_Window_LootRoll.UpdateLootRollData ) then
    EA_Window_LootRoll.UpdateLootRollData()
  end
end


--------------------------------------------------------------
-- UTILS
--------------------------------------------------------------

local delayFunctions = {}

function TidyRoll.CallInDelay(func, delay, timePassed)
  if( timePassed ~= nil ) and ( #delayFunctions > 0 ) then
    for index, fData in ipairs(delayFunctions) do
      fData.timer = fData.timer - timePassed

      if fData.timer <= 0 then
        tremove(delayFunctions, index)

        fData.f()
      end
    end
  end

  if( func ~= nil ) and ( type(func) == "function" ) then
    local fData = {
      f = func,
      timer = delay or 1,
    }
    tinsert(delayFunctions, fData)
  end
end


function TidyRoll.CreateAnchor( toWindow, direction, offset )
  local anchor = {
    RelativeTo = toWindow,
    Point = "bottomleft",
    RelativePoint = "topleft",
    XOffset = 0,
    YOffset = 0,
  }

  if( direction == L"left" ) then
    anchor.Point = "topleft"
    anchor.RelativePoint = "topright"
    anchor.XOffset = - offset
  elseif( direction == L"right" ) then
    anchor.Point = "topright"
    anchor.RelativePoint = "topleft"
    anchor.XOffset = offset
  elseif( direction == L"up" ) then
    anchor.Point = "topleft"
    anchor.RelativePoint = "bottomleft"
    anchor.YOffset = - offset
  else
    anchor.YOffset = offset
  end

  return anchor
end


function TidyRoll.GetSetting(key)
  return LocalSettings[key]
end

function TidyRoll.SetSetting(key, value)
  Settings[key] = value
end


function TidyRoll.SetupLocalSettings()
  for key, default in pairs( DefaultSettings ) do
    local setting = Settings[key]
    local old_setting = LocalSettings[key]

    if( type(setting) == type(default) ) then
      LocalSettings[key] = setting

    elseif( type(old_setting) == type(default) ) then
      Settings[key] = old_setting

    else
      LocalSettings[key] = default
      Settings[key] = default
    end
  end

  -- Fix number if needed
  local key = "button-number"
  if( LocalSettings[key] > c_MAX_ROLL_BUTTONS ) then
    LocalSettings[key] = c_MAX_ROLL_BUTTONS
    Settings[key] = c_MAX_ROLL_BUTTONS
  elseif( LocalSettings[key] < 1 ) then
    LocalSettings[key] = 1
    Settings[key] = 1
  end


  -- SCROLL_INVERT
  local direction = LocalSettings["button-growth-direction"]
  local invert = LocalSettings["scroll-invert"]

  if( (direction == L"up") or (direction == L"right") ) then
    SCROLL_INVERT = true
  else
    SCROLL_INVERT = false
  end

  if( invert == true ) then
    SCROLL_INVERT = not SCROLL_INVERT
  end


  -- DEFAULT_ENABLED
  DEFAULT_ENABLED = not LocalSettings["default-disable"]

  TidyRollFrame.SetupLocalSettings()
end


function TidyRoll.UpdateCustomAutoRollIds( customAutoRollSettings )
  customAutoRollIds = {}

  for _, autoRollData in ipairs( customAutoRollSettings ) do
    local choice = autoRollData.choice
    if( choice == c_ROLL_CHOICE_INVALID or choice == c_ROLL_CHOICE_NEED or choice == c_ROLL_CHOICE_GREED or choice == c_ROLL_CHOICE_PASS ) then
      customAutoRollIds[autoRollData.id] = choice
    end
  end
end


-------------------
-- TEST DATA
-------------------

function TidyRoll.SetTestMode(flag)
  testMode = flag
end


function SetupTestData()
  for index = 1, c_MAX_ROLL_BUTTONS do
    local flag = false
    if( math.mod(index, 2) == 0 ) then flag = true end

    lootData[index] = {
      lootSlot = index - 1,
      timer = 40 + index * 2,
      allowNeed = flag,
      rollChoice = -1,
      sourceId = 12345000 + index,
      itemData = {
        id = 12345,
        uniqueId = 123456789,
        iconNum = math.floor(math.random(200, 934)),
        name = L"Test Item " .. index,
        description = L"Test Item 1 - the oldest, Test Item 10 - the newest",
        level = math.floor(math.random(40)),
        renown = math.floor(math.random(40)),
        iLevel = math.floor(math.random(40)),
        equipSlot = math.floor(math.random(20)),
        rarity = math.floor(math.random(6)),
        careers = { [1] = math.floor(math.random(24)), },

        timeLeftBeforeDecay = 0,
        timestamp = 111,
        decayPaused = false,
        currChargesRemaining = 0,
        noChargeLeftDontDelete = 0,
        maxEquip = 0,
        armor = 0,
        dps = 0,
        speed = 0,
        blockRating = 0,
        dyeTintA = 0,
        dyeTintB = 0,
        numEnhancementSlots = 0,
        itemSet = 0,
        type = 0,

        races = {},
        flags = {},
        skills = {},
        bonus = {},
        enhSlot = {},
        craftingBonus = {},
        slots = {},
      }
    }
  end
end


--------------------------------------------------------------
-- EVENTS
--------------------------------------------------------------

function TidyRoll.OnUpdate( timePassed )
  TidyRoll.CallInDelay(nil, nil, timePassed)

  local allLootsDone = true
  local updateNeeded = false

  if( lootDataDisplayOrder ~= nil and lootData ~= nil )
  then
    for index, lootIndex in ipairs( lootDataDisplayOrder )
    do
      local rollData = lootData[ lootIndex ]
      local frame = rollFrames[index]

      -- Decrement the Timer
      if( rollData.timer ~= nil and rollData.timer ~= 0 )
      then
        rollData.timer = rollData.timer - timePassed

        if( rollData.timer <= 0 )
        then
          rollData.timer = 0
          if( rollData.itemData.id ~= 0 and rollData.rollChoice == c_ROLL_CHOICE_INVALID )
          then
            if( troll_debug ) then DEBUG(L"TidyRoll: timer = 0 pass on item, name = " .. towrustring(torustring(rollData.itemData.name))) end

            TidyRoll.SelectRollOption( lootIndex, c_ROLL_CHOICE_PASS, false )
            updateNeeded = true
          end
        else
          allLootsDone = false

          if( frame ) then
            frame:SetTimer( rollData.timer )
          end
        end
      end
    end
  end

  if( allLootsDone )
  then
    if( troll_debug ) then DEBUG(L"TidyRoll.OnUpdate allLootsDone") end

    TidyRoll.UpdateFrames(true)
    lootDataDisplayOrder = { newItems = lootDataDisplayOrder.newItems }
  end

  if( updateNeeded ) then
    TidyRoll.UpdateLootRollDataWithDefault()
  end
end


function TidyRoll.OnMouseWheel (x, y, delta, flags, rollFrame)
  if( not lootDataDisplayOrder[2] ) then
    return
  end

  if( SCROLL_INVERT ) then
    delta = - delta
  end

  if( delta < 0 ) then
    ScrollTableDown (lootDataDisplayOrder)
  elseif( delta > 0 ) then
    ScrollTableUp (lootDataDisplayOrder)
  end

  TidyRoll.UpdateFrames()
  TidyRoll.UpdateTooltip(rollFrame)
end


function TidyRoll.OnEsc()
  WindowUtils.OnHidden()

  local rollChoice = GetSetting("managment-onesc-rollchoice")

  if( (not lootDataDisplayOrder[1]) or (rollChoice == c_ROLL_CHOICE_INVALID) or (testMode) ) then
    return
  end

  if( GetSetting("managment-onesc-visible-only") ) then
    if( troll_debug ) then DEBUG(L"TidyRoll.OnEsc roll on visible-only") end

    for _, frame in ipairs(rollFrames) do
      if( frame:IsShowing() == true ) then
        TidyRoll.SelectRollOption( frame.m_LootIndex, rollChoice, false )
      end
    end
  else
    if( troll_debug ) then DEBUG(L"TidyRoll.OnEsc roll on all") end

    for rowIndex, rollData in ipairs( lootData ) do
      if( rollData.itemData.id ~= 0 and rollData.rollChoice == c_ROLL_CHOICE_INVALID ) then
        TidyRoll.SelectRollOption( rowIndex, rollChoice, false )
        --SelectItemRollChoice( rollData.sourceId, rollData.lootSlot, rollChoice )
      end
    end
  end

  TidyRoll.UpdateLootRollDataWithDefault()
end


function TidyRoll.OnLootRollFirstItem(rollChoice)
  if( troll_debug ) then DEBUG(L"TidyRoll.OnLootRollFirstItem, rollChoice = " .. towstring(tostring(rollChoice))) end
end


-- test stuff
function TidyRoll.addTestItem()
  local itemData = {
    uniqueID    = 124,
    iconNum = 2304,
    name  = L"TestItem",
    rarity  = SystemData.ItemRarity.UNCOMMON,
  }

  if(itemData
    and itemData.id ~= 0
    and TidyRoll.CustomAutoRoll.SearchItemById( Settings.CustomAutoRollSettings, itemData.uniqueID ) == nil
    ) then
    local autoRollRowData = {
      id    = itemData.uniqueID,
      iconNum = itemData.iconNum,
      name  = itemData.name,
      rarity  = itemData.rarity,
      choice  = GameData.LootRoll.NEED,
    }
    tinsert(Settings.CustomAutoRollSettings, autoRollRowData)
  end
  --TidyRoll.CustomAutoRoll.AddByItemData( itemData )
end

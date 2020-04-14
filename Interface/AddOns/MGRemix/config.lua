--[[
  MGRemix (Miracle Grow Remix) version 2.30
  by Irinia of Volkmar
  MGRemix puts all the functionality of the cultivation interface into a small
  window.  Also added are quick item selection and one-click repeat
  
  This file contains everything related to the config UI
--]]
local mg=MiracleGrow2

mg.vValidSounds={}
mg.sConfigSound={L"",L""}

mg.vLangMapFwd={}
mg.vLangMapRev={}

function mg.InitConfig()
  local x,y

  CreateWindow(mg.sWindowName.."Settings",false)
  IraConfig.CreateTabSet(mg.sWindowName.."SettingsTabs",500)

  CreateWindowFromTemplate("MiracleGrow2ConfigHelp","MiracleGrow2CfgHelpBtn","IraConfig")
  WindowSetId("MiracleGrow2ConfigHelp",1)
  IraConfig.HelpCreateContext("MiracleGrow2Config")
  CreateWindowFromTemplate("MiracleGrow2LayoutHelp","MiracleGrow2CfgHelpBtn","IraConfig")
  WindowSetId("MiracleGrow2LayoutHelp",2)
  IraConfig.HelpCreateContext("MiracleGrow2Layout")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Config","MiracleGrow2ConfigLanguageSection",{
      {relativeTo="MiracleGrow2ConfigLanguageSection"},
      {relativeTo="MiracleGrow2ConfigLanguageSection",point="topleft",x=450,y=52},
    },1,MiracleGrow2.GetPhrase,"help","setlang")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Config","MiracleGrow2ConfigWindowSection",{
      {relativeTo="MiracleGrow2ConfigWindowSection"},
      {relativeTo="MiracleGrow2ConfigWindowSection",point="topleft",x=450,y=142},
    },1,MiracleGrow2.GetPhrase,"help","setmainwin")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Config","MiracleGrow2ConfigIngredientSection",{
      {relativeTo="MiracleGrow2ConfigIngredientSection"},
      {relativeTo="MiracleGrow2ConfigIngredientSection",point="topleft",x=450,y=86},
    },1,MiracleGrow2.GetPhrase,"help","setingred")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Config","MiracleGrow2ConfigSoundSection",{
      {relativeTo="MiracleGrow2ConfigSoundSection"},
      {relativeTo="MiracleGrow2ConfigSoundSection",point="topleft",x=450,y=132},
    },1,MiracleGrow2.GetPhrase,"help","setsound")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Config","MiracleGrow2ConfigAutoReapSection",{
      {relativeTo="MiracleGrow2ConfigAutoReapSection"},
      {relativeTo="MiracleGrow2ConfigAutoReapSection",point="topleft",x=450,y=84},
    },1,MiracleGrow2.GetPhrase,"help","setautoreap")
  


  IraConfig.AddTab(mg.sWindowName.."SettingsTabs",mg.GetPhrase("config","tabsettings"),mg.GetPhrase("config","tabsettingsdesc"),mg.sWindowName.."SettingsConfig",mg.ConfigTabChange)
  IraConfig.AddTab(mg.sWindowName.."SettingsTabs",mg.GetPhrase("config","tablayout"),mg.GetPhrase("config","tablayoutdesc"),mg.sWindowName.."SettingsLayout",mg.ConfigTabChange)
  IraConfig.AddTab(mg.sWindowName.."SettingsTabs",mg.GetPhrase("config","tabpreset"),mg.GetPhrase("config","tabpresetdesc"),mg.sWindowName.."SettingsPreset",mg.ConfigTabChange)
  mg.nConfigTab=IraConfig.RegisterAddonNoScroll(L"MGRemix",mg.GetPhrase("general","mgremix"),mg.sWindowName.."Settings",mg.ConfigCallback)


  mg.ConfigCallback(IraConfig.CALLBACK_OPEN,mg.nConfigTab)
  IraConfig.SetupSpinner(mg.sWindowName.."ConfigThrobColorR",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."ConfigThrobColorG",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."ConfigThrobColorB",255,0,8)
  TextEditBoxSetTextColor(mg.sWindowName.."ConfigThrobColorR",255,0,0)
  TextEditBoxSetTextColor(mg.sWindowName.."ConfigThrobColorG",0,255,0)
  TextEditBoxSetTextColor(mg.sWindowName.."ConfigThrobColorB",0,0,255)
  IraConfig.SetupSpinner(mg.sWindowName.."ConfigSound1Edit",1999)
  IraConfig.SetupSpinner(mg.sWindowName.."ConfigSound2Edit",1999)
  IraConfig.SetupSpinner(mg.sWindowName.."ConfigReserveCount",50,1)
  for k,v in pairs(GameData.Sound) do
    mg.vValidSounds[v]=k
  end
  mg.InitLayout()
  mg.InitPresets()
  
end

function mg.ConfigTabChange(nMessage)
  IraConfig.HelpHide("MiracleGrow2Config")
  if WindowGetShowing("MiracleGrow2Settings") then
    WindowSetShowing("MiracleGrow2ConfigHelp",WindowGetShowing("MiracleGrow2SettingsConfig"))
    WindowSetShowing("MiracleGrow2LayoutHelp",WindowGetShowing("MiracleGrow2SettingsLayout"))
  else
    WindowSetShowing("MiracleGrow2ConfigHelp",false)
    WindowSetShowing("MiracleGrow2LayoutHelp",false)
  end
end

function mg.ConfigCallback(nMessage,nTab)
  local x,y
  local sWin=mg.sWindowName.."Config"
  mg.ConfigTabChange()
  if nMessage==IraConfig.CALLBACK_RESIZE then
    ScrollWindowUpdateScrollRect(mg.sWindowName.."SettingsConfigScroll")
    ScrollWindowUpdateScrollRect(mg.sWindowName.."SettingsLayoutScroll")
  elseif nMessage==IraConfig.CALLBACK_OPEN then
    IraConfig.SetActiveTab(mg.sWindowName.."SettingsTabs",1)
    --Version
    LabelSetText(sWin.."Version",mg.GetPhrase("messages","help1",mg.nVersion))
    --Window
    LabelSetText(sWin.."WindowSection",mg.GetPhrase("config","sectionwindow"))
    LabelSetText(sWin.."ShowLabel",mg.GetPhrase("config","show"))
    LabelSetText(sWin.."ShowToggleLabel",mg.GetPhrase("config","enabletoggle"))
    LabelSetText(sWin.."ThrobLabel",mg.GetPhrase("config","throb"))
    LabelSetText(sWin.."ThrobColorLabel",mg.GetPhrase("config","throbcolor"))
    --Sound
    LabelSetText(sWin.."SoundSection",mg.GetPhrase("config","sectionsound"))
    LabelSetText(sWin.."SoundLabel",mg.GetPhrase("config","soundenable"))
    LabelSetText(sWin.."Sound1Label",mg.GetPhrase("config","sound1label"))
    ButtonSetText(sWin.."Sound1Test",mg.GetPhrase("config","soundtest"))
    LabelSetText(sWin.."Sound2Label",mg.GetPhrase("config","sound2label"))
    ButtonSetText(sWin.."Sound2Test",mg.GetPhrase("config","soundtest"))
    --Ingredient
    LabelSetText(sWin.."IngredientSection",mg.GetPhrase("config","sectioningredient"))
    ComboBoxClearMenuItems(sWin.."MinLvl")
    ComboBoxClearMenuItems(sWin.."MaxLvl")
    ComboBoxAddMenuItem(sWin.."MinLvl",mg.GetPhrase("config","minlvl0"))
    ComboBoxAddMenuItem(sWin.."MaxLvl",mg.GetPhrase("config","maxlvl0"))
    for i=25,200,25 do
      ComboBoxAddMenuItem(sWin.."MinLvl",mg.GetPhrase("config","minlvl",i))
      ComboBoxAddMenuItem(sWin.."MaxLvl",mg.GetPhrase("config","maxlvl",i))
    end
    --Auto reap
    LabelSetText(sWin.."AutoReapSection",mg.GetPhrase("config","sectionautoreap"))
    LabelSetText(sWin.."ReserveLabel",mg.GetPhrase("config","reserveenable"))
    LabelSetText(sWin.."ReserveCountLabel",mg.GetPhrase("config","reserveunits"))
    --Language
    LabelSetText(sWin.."LanguageSection",mg.GetPhrase("config","sectionlanguage"))
    ComboBoxClearMenuItems(sWin.."Language")
    ComboBoxAddMenuItem(sWin.."Language",mg.GetPhrase("config","langdefault"))
    mg.vLangMapFwd={[0]=1}
    mg.vLangMapRev={[1]=0}
    local i=2
    for k,v in pairs(MiracleGrow2.T) do
      mg.vLangMapFwd[k]=i
      mg.vLangMapRev[i]=k
      i=i+1
      ComboBoxAddMenuItem(sWin.."Language",v.general.thislanguage)
    end
    ScrollWindowUpdateScrollRect(mg.sWindowName.."SettingsConfigScroll")
    ScrollWindowUpdateScrollRect(mg.sWindowName.."SettingsLayoutScroll")
  elseif nMessage==IraConfig.CALLBACK_RESET then
    --Window
    ButtonSetPressedFlag(sWin.."ShowButton",mg.vSettings.showing)
    ButtonSetPressedFlag(sWin.."ShowToggleButton",mg.vSettings.showtoggle)
    ButtonSetPressedFlag(sWin.."ThrobButton",mg.vSettings.throb)
    TextEditBoxSetText(sWin.."ThrobColorR",towstring(mg.vSettings.throbc[1]))
    TextEditBoxSetText(sWin.."ThrobColorG",towstring(mg.vSettings.throbc[2]))
    TextEditBoxSetText(sWin.."ThrobColorB",towstring(mg.vSettings.throbc[3]))
    --Sound
    ButtonSetPressedFlag(sWin.."SoundButton",mg.vSettings.sound)
    TextEditBoxSetText(sWin.."Sound1Edit",towstring(mg.vSettings.soundnum))
    TextEditBoxSetText(sWin.."Sound2Edit",towstring(mg.vSettings.soundnum2))
    --Ingredient
    ComboBoxSetSelectedMenuItem(sWin.."MinLvl",1+math.ceil(mg.vSettings.minlvl/25))
    ComboBoxSetSelectedMenuItem(sWin.."MaxLvl",1+math.floor(mg.vSettings.maxlvl/25))
    --Auto reap
    ButtonSetPressedFlag(sWin.."ReserveButton",mg.vSettings.reserve)
    TextEditBoxSetText(sWin.."ReserveCount",towstring(mg.vSettings.seedreserve))
    if CraftValueTip and CraftValueTip.version>=1.23 then
      LabelSetTextColor(sWin.."AutoReapSection",255,255,255)
      WindowSetHandleInput(sWin.."Reserve",true)
      LabelSetTextColor(sWin.."ReserveLabel",255,255,255)
      ButtonSetDisabledFlag(sWin.."ReserveButton",false)
      WindowSetHandleInput(sWin.."ReserveCount",true)
      TextEditBoxSetTextColor(sWin.."ReserveCount",255,255,255)
      ButtonSetDisabledFlag(sWin.."ReserveCountSpinnerButtonPlus",false)
      WindowSetHandleInput(sWin.."ReserveCountSpinnerButtonPlus",true)
      ButtonSetDisabledFlag(sWin.."ReserveCountSpinnerButtonMinus",false)
      WindowSetHandleInput(sWin.."ReserveCountSpinnerButtonMinus",true)
      LabelSetTextColor(sWin.."ReserveCountLabel",255,255,255)
    else
      LabelSetTextColor(sWin.."AutoReapSection",128,128,128)
      WindowSetHandleInput(sWin.."Reserve",false)
      LabelSetTextColor(sWin.."ReserveLabel",128,128,128)
      ButtonSetDisabledFlag(sWin.."ReserveButton",true)
      WindowSetHandleInput(sWin.."ReserveCount",false)
      TextEditBoxSetTextColor(sWin.."ReserveCount",128,128,128)
      ButtonSetDisabledFlag(sWin.."ReserveCountSpinnerButtonPlus",true)
      WindowSetHandleInput(sWin.."ReserveCountSpinnerButtonPlus",false)
      ButtonSetDisabledFlag(sWin.."ReserveCountSpinnerButtonMinus",true)
      WindowSetHandleInput(sWin.."ReserveCountSpinnerButtonMinus",false)
      LabelSetTextColor(sWin.."ReserveCountLabel",128,128,128)
    end
    --Language
    if mg.vLangMapFwd[mg.vSettings.language] then
      ComboBoxSetSelectedMenuItem(sWin.."Language",mg.vLangMapFwd[mg.vSettings.language])
    else
      ComboBoxSetSelectedMenuItem(sWin.."Language",1)
    end
  elseif nMessage==IraConfig.CALLBACK_SAVE then
    --Window
    mg.vSettings.showing=ButtonGetPressedFlag(sWin.."ShowButton")
    if mg.vSettings.showing then
      mg.show()
    else
      mg.hide()
    end
    local bState=ButtonGetPressedFlag(sWin.."ShowToggleButton")
    if bState~=mg.vSettings.showtoggle then
      mg.vSettings.showtoggle=bState
      if bState then
        WindowSetShowing(mg.sWindowName.."Icon",true)
	      LayoutEditor.RegisterWindow(mg.sWindowName.."Icon",L"MGRemix",mg.GetPhrase("tooltips","togglewindow"),false,false,true,nil)
      else
        WindowSetShowing(mg.sWindowName.."Icon",false)
	      LayoutEditor.UnregisterWindow(mg.sWindowName.."Icon")
      end
    end
    mg.vSettings.throb=ButtonGetPressedFlag(sWin.."ThrobButton")
    mg.vSettings.throbc[1]=tonumber(TextEditBoxGetText(sWin.."ThrobColorR"))
    mg.vSettings.throbc[2]=tonumber(TextEditBoxGetText(sWin.."ThrobColorG"))
    mg.vSettings.throbc[3]=tonumber(TextEditBoxGetText(sWin.."ThrobColorB"))
    --Sound
    mg.vSettings.sound=ButtonGetPressedFlag(sWin.."SoundButton")
    mg.vSettings.soundnum=tonumber(TextEditBoxGetText(sWin.."Sound1Edit"))
    mg.vSettings.soundnum2=tonumber(TextEditBoxGetText(sWin.."Sound2Edit"))
    --Ingredient
    mg.vSettings.minlvl=ComboBoxGetSelectedMenuItem(sWin.."MinLvl")*25-25
    mg.vSettings.maxlvl=ComboBoxGetSelectedMenuItem(sWin.."MaxLvl")*25-25
    --Auto reap
    mg.vSettings.reserve=ButtonGetPressedFlag(sWin.."ReserveButton")
    mg.vSettings.seedreserve=tonumber(TextEditBoxGetText(sWin.."ReserveCount"))
    --Language
    local nLangSel=tonumber(ComboBoxGetSelectedMenuItem(sWin.."Language"))
    if mg.vLangMapRev[nLangSel]~=mg.vSettings.language then
      if mg.vLangMapRev[nLangSel] then
        mg.vSettings.language=mg.vLangMapRev[nLangSel]
      else
        mg.vSettings.language=0
      end
      mg.SetLanguage(mg.vSettings.language)
      mg.ConfigCallback(IraConfig.CALLBACK_OPEN,nTab)
      mg.ConfigCallback(IraConfig.CALLBACK_RESET,nTab)
    end
  end
  mg.ConfigCallbackLayout(nMessage)
  mg.ConfigCallbackPresets(nMessage)
end

function mg.ConfigSoundTest()
  local sName=SystemData.MouseOverWindow.name
  if WindowGetId(WindowGetParent(sName))==2 then
    PlaySound(tonumber(TextEditBoxGetText(mg.sWindowName.."ConfigSound2Edit")))
  else
    PlaySound(tonumber(TextEditBoxGetText(mg.sWindowName.."ConfigSound1Edit")))
  end
end

function mg.ConfigSoundTestTip()
  local sName=SystemData.MouseOverWindow.name
  if WindowGetId(WindowGetParent(sName))==2 then
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.sConfigSound[2])
  else
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.sConfigSound[1])
  end
  Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_RIGHT)
end

function mg.ConfigSoundChanged()
  local sName=SystemData.ActiveWindow.name
  if not (sName==(mg.sWindowName.."ConfigSound1Edit")) and not (sName==(mg.sWindowName.."ConfigSound2Edit"))then
    return
  end
  IraConfig.SpinnerChange()
  local nValue=tonumber(TextEditBoxGetText(sName))
  local sSound
  if mg.vValidSounds[nValue] then
    TextEditBoxSetTextColor(sName,0,255,0)
    sSound=L"GameData.Sound."..towstring(mg.vValidSounds[nValue])
  else
    local nMin=200
    local nMax=-200
    for i=1,100 do
      if mg.vValidSounds[nValue+i] then
        nMin=i
        break
      end
    end
    for i=-1,-100,-1 do
      if mg.vValidSounds[nValue+i] then
        nMax=i
        break
      end
    end
    if (nMin<=10) or (nMax>=-10) then
      TextEditBoxSetTextColor(sName,255,255,0)
    elseif (nMin<=100) or (nMax>=-100) then
      TextEditBoxSetTextColor(sName,255,0,0)
    else
      TextEditBoxSetTextColor(sName,192,192,192)
      sSound=mg.GetPhrase("config","soundtipfail",100)
    end
    if not sSound then
      if nMax==-200 then
        sSound=mg.GetPhrase("config","soundtip1",nValue+nMin)
      elseif nMin==200 then
        sSound=mg.GetPhrase("config","soundtip1",nValue+nMax)
      else
        sSound=mg.GetPhrase("config","soundtip2",nValue+nMax,nValue+nMin)
      end
    end
  end
  mg.sConfigSound[WindowGetId(WindowGetParent(sName))]=sSound
end

function mg.ConfigThrobCChanged()
  IraConfig.SpinnerChange()
  local r=tonumber(TextEditBoxGetText(mg.sWindowName.."ConfigThrobColorR"))
  local g=tonumber(TextEditBoxGetText(mg.sWindowName.."ConfigThrobColorG"))
  local b=tonumber(TextEditBoxGetText(mg.sWindowName.."ConfigThrobColorB"))
  LabelSetTextColor(mg.sWindowName.."ConfigThrobColorLabel",r,g,b)
end

function mg.ConfigHelp()
  local sBtn=SystemData.ActiveWindow.name
  local nId=WindowGetId(sBtn)
  if nId==1 then
    IraConfig.HelpToggle("MiracleGrow2Config")
  elseif nId==2 then
    IraConfig.HelpToggle("MiracleGrow2Layout")
  end
end

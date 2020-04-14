--[[
  MGRemix (Miracle Grow Remix) version 2.30
  by Irinia of Volkmar
  MGRemix puts all the functionality of the cultivation interface into a small
  window.  Also added are quick item selection and one-click repeat
  
  This file contains stuff related to the layout config tab
--]]
local mg=MiracleGrow2

local nMult=5

local nDragOfsX
local nDragOfsY
local nLastX
local nLastY

local nVis=0

local bProgValid

local sPriorityInfo

mg.vBoxData={
  [1]={
    name="repeatseed",
    win="ButtonSeed",
    template="MiracleGrow2LayoutSeed",
    dimx=5,
    dimy=5,
    vis={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
  },
  [2]={
    name="repeatsoil",
    win="ButtonSoil",
    template="MiracleGrow2LayoutSoil",
    dimx=5,
    dimy=5,
    vis={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
  },
  [3]={
    name="repeatwater",
    win="ButtonWater",
    template="MiracleGrow2LayoutWater",
    dimx=5,
    dimy=5,
    vis={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
  },
  [4]={
    name="repeatnut",
    win="ButtonNutrient",
    template="MiracleGrow2LayoutNut",
    dimx=5,
    dimy=5,
    vis={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
  },
  [5]={
    name="harvest",
    win="Harvest",
    template="MiracleGrow2LayoutHarvest",
    dimx=5,
    dimy=5,
  },
  [6]={
    name="Repeat",
    win="Repeat",
    template="MiracleGrow2LayoutRepeat",
    dimx=5,
    dimy=5,
  },
  [7]={
    name="hrepeat",
    win="HarvestRepeat",
    template="MiracleGrow2LayoutHRepeat",
    dimx=5,
    dimy=5,
  },
  [8]={
    name="timestage",
    win="Stage",
    template="MiracleGrow2LayoutTimer",
    dimx=8,
    dimy=4,
    text=L"15s",
    vis={[1]=true,[2]=true,[3]=true},
  },
  [9]={
    name="timeplot",
    win="Time",
    template="MiracleGrow2LayoutTimer",
    dimx=8,
    dimy=4,
    text=L"215s",
    vis={[1]=true,[2]=true,[3]=true},
  },
  [10]={
    name="plotnum",
    win="PlotNum",
    template="MiracleGrow2LayoutPlotNum",
    dimx=3,
    dimy=4,
    text=L"3",
    vis={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
  },
}

mg.vTexCombo={
  [0]={
    fill={
      tex="EA_TintableImage",
      left=0,
      top=0,
      width=10,
      height=10,
    },
    back={
      tex="EA_TintableImage",
      left=0,
      top=0,
      width=10,
      height=10,
    },
  },
  [1]={
    fill={
      tex="EA_HUD_01",
      left=259,
      top=261,
      width=73,
      height=18,
    },
    back={
      tex="EA_TintableImage",
      left=0,
      top=0,
      width=10,
      height=10,
    },
  },
  [2]={
    fill={
      tex="EA_HUD_01",
      left=259,
      top=261,
      width=73,
      height=18,
    },
    back={
      tex="EA_HUD_01",
      left=259,
      top=261,
      width=73,
      height=18,
    },
  },
  [3]={
    fill={
      tex="EA_HUD_01",
      left=186,
      top=261,
      width=73,
      height=18,
    },
    back={
      tex="EA_TintableImage",
      left=0,
      top=0,
      width=10,
      height=10,
    },
  },
  [4]={
    fill={
      tex="EA_HUD_01",
      left=186,
      top=261,
      width=73,
      height=18,
    },
    back={
      tex="EA_HUD_01",
      left=186,
      top=261,
      width=73,
      height=18,
    },
  },
  [5]={
    fill={
      tex="EA_VictoryPoints01_32b",
      left=1,
      top=0,
      width=19,
      height=28,
    },
    back={
      tex="EA_TintableImage",
      left=0,
      top=0,
      width=10,
      height=10,
    },
  },
  [6]={
    fill={
      tex="EA_VictoryPoints01_32b",
      left=1,
      top=0,
      width=19,
      height=28,
    },
    back={
      tex="EA_VictoryPoints01_32b",
      left=1,
      top=0,
      width=19,
      height=28,
    },
  },
  [7]={
    fill={
      tex="EA_HUD_01",
      left=346,
      top=656,
      width=50,
      height=12,
    },
    back={
      tex="EA_TintableImage",
      left=0,
      top=0,
      width=10,
      height=10,
    },
  },
  [8]={
    fill={
      tex="EA_HUD_01",
      left=346,
      top=656,
      width=50,
      height=12,
    },
    back={
      tex="EA_HUD_01",
      left=346,
      top=656,
      width=50,
      height=12,
    },
  },
}

mg.vLayout={}

mg.vBoxLayout={}

mg.vBoxVis={}

mg.vProg={}

function mg.InitLayout()
  RegisterEventHandler(SystemData.Events.L_BUTTON_UP_PROCESSED,"MiracleGrow2.LayoutEndDrag")
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutSetDimX",50)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutSetDimY",50)
  WindowSetShowing(mg.sWindowName.."LayoutHover",false)
  WindowSetTintColor(mg.sWindowName.."LayoutHover",128,192,255)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgDimX1",50)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgDimY1",50)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgDimX2",50)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgDimY2",50)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgFillR",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgFillG",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgFillB",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgFillA",255,0,8)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgFillR",255,0,0)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgFillG",0,255,0)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgFillB",0,0,255)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgFillA",128,128,128)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgBackR",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgBackG",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgBackB",255,0,8)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutProgBackA",255,0,8)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgBackR",255,0,0)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgBackG",0,255,0)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgBackB",0,0,255)
  TextEditBoxSetTextColor(mg.sWindowName.."LayoutProgBackA",128,128,128)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutPlotsCount",4,1)
  IraConfig.SetupSpinner(mg.sWindowName.."LayoutPlotsSep",20)

  IraConfig.HelpCreateComplexArea("MiracleGrow2Layout","MiracleGrow2LayoutVBar",{
      {relativeTo="MiracleGrow2LayoutVBar"},
      {relativeTo="MiracleGrow2LayoutVBar",point="topleft",x=250,y=250},
    },1,MiracleGrow2.GetPhrase,"help","laydraganddrop")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Layout","MiracleGrow2Layout",{
      {relativeTo="MiracleGrow2Layout",point="topright",relativePoint="topright"},
      {relativeTo="MiracleGrow2Layout",point="topright",relativePoint="bottomleft",x=-150,y=90},
    },1,MiracleGrow2.GetPhrase,"help","layunusedbin")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Layout","MiracleGrow2LayoutSetDimLabel",{
      {relativeTo="MiracleGrow2LayoutSetDimLabel"},
      {relativeTo="MiracleGrow2LayoutSetDimLabel",point="topleft",x=190,y=62},
    },1,MiracleGrow2.GetPhrase,"help","layplotsize")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Layout","MiracleGrow2LayoutSetVisLabel",{
      {relativeTo="MiracleGrow2LayoutSetVisLabel"},
      {relativeTo="MiracleGrow2LayoutSetVisLabel",point="topleft",x=215,y=82},
    },1,MiracleGrow2.GetPhrase,"help","layvis")
  IraConfig.HelpCreateSimpleArea("MiracleGrow2Layout","MiracleGrow2LayoutProg",1,MiracleGrow2.GetPhrase,"help","layprog")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Layout","MiracleGrow2LayoutProgDimX1",{
      {relativeTo="MiracleGrow2LayoutProgDimX1Label",y=-5},
      {relativeTo="MiracleGrow2LayoutProgDimY2SpinnerButtonMinus"},
    },2,MiracleGrow2.GetPhrase,"help","layprogdim")
  IraConfig.HelpCreateSimpleArea("MiracleGrow2Layout","MiracleGrow2LayoutProgShow",2,MiracleGrow2.GetPhrase,"help","layprogfill")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Layout","MiracleGrow2LayoutProgBarFill",{
      {relativeTo="MiracleGrow2LayoutProgBarFill",y=-3},
      {relativeTo="MiracleGrow2LayoutProgBarMinus"},
    },2,MiracleGrow2.GetPhrase,"help","layprogtex")
  IraConfig.HelpCreateComplexArea("MiracleGrow2Layout","MiracleGrow2LayoutProgFill",{
      {relativeTo="MiracleGrow2LayoutProgFill"},
      {relativeTo="MiracleGrow2LayoutProgBack"},
    },2,MiracleGrow2.GetPhrase,"help","layprogtint")
  IraConfig.HelpCreateSimpleArea("MiracleGrow2Layout","MiracleGrow2LayoutPlots",1,MiracleGrow2.GetPhrase,"help","layarrange")
  
  for k,v in ipairs(mg.vBoxData) do
    local sBase=mg.sWindowName.."LayoutBlock"..k
    CreateWindowFromTemplate(sBase,mg.sWindowName.."LayoutBlock",mg.sWindowName.."Layout")
    WindowSetId(sBase,k)
    WindowSetDimensions(sBase,v.dimx*nMult,v.dimy*nMult)
    WindowAddAnchor(sBase,"topright",mg.sWindowName.."Layout","topright",0,0)
    CreateWindowFromTemplate(sBase.."Child",v.template,sBase)
    WindowAddAnchor(sBase.."Child","bottomleft",sBase,"bottomleft",0,0)
    if v.text then
      LabelSetText(sBase.."Child",v.text)
      WindowSetLayer(sBase,3)
    end
    WindowSetHandleInput(sBase,true)
  end
  for i=0,4 do
    ButtonSetCheckButtonFlag(mg.sWindowName.."LayoutSetStage"..i,true)
  end
end

function mg.ConfigCallbackLayout(nMessage)
  local sWin=mg.sWindowName.."Layout"
  local nTemp
  if nMessage==IraConfig.CALLBACK_OPEN then
    LabelSetText(sWin.."SetDimLabel",mg.GetPhrase("config","plotsize"))
    LabelSetText(sWin.."SetDimXLabel",mg.GetPhrase("config","x"))
    LabelSetText(sWin.."SetDimYLabel",mg.GetPhrase("config","y"))
    LabelSetText(sWin.."SetVisLabel",mg.GetPhrase("config","visibility"))
    LabelSetText(sWin.."ProgLabel",mg.GetPhrase("config","sectionprog"))
    LabelSetText(sWin.."ProgDimX1Label",mg.GetPhrase("config","x"))
    LabelSetText(sWin.."ProgDimY1Label",mg.GetPhrase("config","y"))
    LabelSetText(sWin.."ProgDimX2Label",mg.GetPhrase("config","x"))
    LabelSetText(sWin.."ProgDimY2Label",mg.GetPhrase("config","y"))
    LabelSetText(sWin.."ProgDimBar",L"--")
    LabelSetText(sWin.."Instructions",mg.GetPhrase("config","layoutinstructions"))
    LabelSetTextColor(sWin.."Instructions",64,64,64)
    ComboBoxClearMenuItems(sWin.."ProgShow")
    ComboBoxAddMenuItem(sWin.."ProgShow",mg.GetPhrase("config","proghide"))
    ComboBoxAddMenuItem(sWin.."ProgShow",mg.GetPhrase("config","proglefttoright"))
    ComboBoxAddMenuItem(sWin.."ProgShow",mg.GetPhrase("config","progrighttoleft"))
    ComboBoxAddMenuItem(sWin.."ProgShow",mg.GetPhrase("config","progbottomtotop"))
    ComboBoxAddMenuItem(sWin.."ProgShow",mg.GetPhrase("config","progtoptobottom"))
    LabelSetText(sWin.."ProgFillLabel",mg.GetPhrase("config","progfill"))
    LabelSetText(sWin.."ProgBackLabel",mg.GetPhrase("config","progback"))
    LabelSetText(sWin.."PlotsLabel",mg.GetPhrase("config","sectionplots"))
    ComboBoxClearMenuItems(sWin.."PlotsArrange")
    ComboBoxAddMenuItem(sWin.."PlotsArrange",mg.GetPhrase("config","plotvertical"))
    ComboBoxAddMenuItem(sWin.."PlotsArrange",mg.GetPhrase("config","plothorizontal"))
    ComboBoxAddMenuItem(sWin.."PlotsArrange",mg.GetPhrase("config","plotsquare"))
    LabelSetText(sWin.."PlotsCountLabel",mg.GetPhrase("config","plotcountlabel"))
    LabelSetText(sWin.."PlotsBorderLabel",mg.GetPhrase("config","plotlines"))
    LabelSetText(sWin.."PlotsSepLabel",mg.GetPhrase("config","plotspacing"))

  elseif nMessage==IraConfig.CALLBACK_RESET then
    mg.vLayout={}
    for k,v in pairs(mg.vSettings.layout) do
      mg.vLayout[k]=v
    end
    mg.vBoxLayout={}
    for k,v in pairs(mg.vSettings.boxlayout) do
      mg.vBoxLayout[k]={v[1],v[2]}
    end
    mg.vBoxVis={}
    for k,v in pairs(mg.vSettings.boxvis) do
      mg.vBoxVis[k]={[0]=v[0],[1]=v[1],[2]=v[2],[3]=v[3],[4]=v[4]}
    end
    mg.vProg={}
    for k,v in pairs(mg.vSettings.progress) do
      if type(v)=="table" then
        mg.vProg[k]={}
        for k2,v2 in pairs(v) do
          mg.vProg[k][k2]=v2
        end
      else
        mg.vProg[k]=v
      end
    end
    WindowSetDimensions(sWin.."VBar",(mg.vLayout.dimx)*nMult+5,(mg.vLayout.dimy)*nMult+5)
    TextEditBoxSetText(sWin.."SetDimX",towstring(mg.vLayout.dimx))
    TextEditBoxSetText(sWin.."SetDimY",towstring(mg.vLayout.dimy))
    for k,v in ipairs(mg.vBoxData) do
      WindowClearAnchors(sWin.."Block"..k)
      if mg.vBoxLayout[k] then
        WindowAddAnchor(sWin.."Block"..k,"topleft",sWin.."VBar","topleft",mg.vBoxLayout[k][1]*nMult+2,mg.vBoxLayout[k][2]*nMult+2)
      else
        WindowAddAnchor(sWin.."Block"..k,"topright",mg.sWindowName.."Layout","topright",math.floor((k-1)/3)*-40,math.mod(k-1,3)*30)
      end
      WindowSetTintColor(sWin.."Block"..k,255,255,255)
      if mg.vBoxData[k].text then
        LabelSetTextColor(sWin.."Block"..k.."Child",255,255,255)
      end
    end
    nVis=0
    mg.NextVis()
    TextEditBoxSetText(sWin.."ProgDimX1",towstring(mg.vLayout.progdimx1))
    TextEditBoxSetText(sWin.."ProgDimY1",towstring(mg.vLayout.progdimy1))
    TextEditBoxSetText(sWin.."ProgDimX2",towstring(mg.vLayout.progdimx2))
    TextEditBoxSetText(sWin.."ProgDimY2",towstring(mg.vLayout.progdimy2))
    
    ComboBoxSetSelectedMenuItem(sWin.."ProgShow",mg.vProg.arrange)
    TextEditBoxSetText(sWin.."ProgFillR",towstring(mg.vProg.fill.r))
    TextEditBoxSetText(sWin.."ProgFillG",towstring(mg.vProg.fill.g))
    TextEditBoxSetText(sWin.."ProgFillB",towstring(mg.vProg.fill.b))
    TextEditBoxSetText(sWin.."ProgFillA",towstring(mg.vProg.fill.a))
    TextEditBoxSetText(sWin.."ProgBackR",towstring(mg.vProg.back.r))
    TextEditBoxSetText(sWin.."ProgBackG",towstring(mg.vProg.back.g))
    TextEditBoxSetText(sWin.."ProgBackB",towstring(mg.vProg.back.b))
    TextEditBoxSetText(sWin.."ProgBackA",towstring(mg.vProg.back.a))
    mg.LayoutAdjDemoProgBar()

    ComboBoxSetSelectedMenuItem(sWin.."PlotsArrange",mg.vLayout.arrange)
    TextEditBoxSetText(sWin.."PlotsCount",towstring(mg.vLayout.count))
    mg.LayoutPlotArrChanged()
    ButtonSetPressedFlag(sWin.."PlotsBorderButton",mg.vLayout.border)
    TextEditBoxSetText(sWin.."PlotsSep",towstring(mg.vLayout.spacing))
    
  elseif nMessage==IraConfig.CALLBACK_SAVE then
    --Fist, we need to capture the non-interactive controls...
    mg.vLayout.arrange=ComboBoxGetSelectedMenuItem(sWin.."PlotsArrange")
    if mg.vLayout.arrange==3 then
      mg.vLayout.count=4
    else
      mg.vLayout.count=tonumber(TextEditBoxGetText(sWin.."PlotsCount"))
    end
    mg.vLayout.border=ButtonGetPressedFlag(sWin.."PlotsBorderButton")
    mg.vLayout.spacing=tonumber(TextEditBoxGetText(sWin.."PlotsSep"))
    
    --Then store everything
    mg.NextVis()
    mg.PrevVis()
    if mg.vLayout.progdimx1>mg.vLayout.dimx then
      mg.vLayout.progdimx1=mg.vLayout.dimx
    end
    if mg.vLayout.progdimx2>mg.vLayout.dimx then
      mg.vLayout.progdimx2=mg.vLayout.dimx
    end
    if mg.vLayout.progdimy1>mg.vLayout.dimy then
      mg.vLayout.progdimy1=mg.vLayout.dimy
    end
    if mg.vLayout.progdimy2>mg.vLayout.dimy then
      mg.vLayout.progdimy2=mg.vLayout.dimy
    end
    mg.vSettings.layout={}
    for k,v in pairs(mg.vLayout) do
      mg.vSettings.layout[k]=v
    end
    mg.vSettings.boxlayout={}
    for k,v in pairs(mg.vBoxLayout) do
      if ((v[1]+mg.vBoxData[k].dimx)<=mg.vLayout.dimx) and ((v[2]+mg.vBoxData[k].dimy)<=mg.vLayout.dimy) then
        mg.vSettings.boxlayout[k]={v[1],v[2]}
      end
    end
    mg.vSettings.boxvis={}
    for k,v in pairs(mg.vBoxVis) do
      mg.vSettings.boxvis[k]={[0]=v[0],[1]=v[1],[2]=v[2],[3]=v[3],[4]=v[4]}
    end
    mg.vSettings.progress={}
    for k,v in pairs(mg.vProg) do
      if type(v)=="table" then
        mg.vSettings.progress[k]={}
        for k2,v2 in pairs(v) do
          mg.vSettings.progress[k][k2]=v2
        end
      else
        mg.vSettings.progress[k]=v
      end
    end

    --Clip and Normalize our progress bar location
    if mg.vSettings.layout.progdimx2<mg.vSettings.layout.progdimx1 then
      nTemp=mg.vSettings.layout.progdimx2
      mg.vSettings.layout.progdimx2=mg.vSettings.layout.progdimx1
      mg.vSettings.layout.progdimx1=nTemp
    end
    if mg.vSettings.layout.progdimy2<mg.vSettings.layout.progdimy1 then
      nTemp=mg.vSettings.layout.progdimy2
      mg.vSettings.layout.progdimy2=mg.vSettings.layout.progdimy1
      mg.vSettings.layout.progdimy1=nTemp
    end
    if mg.vSettings.layout.progdimx1>mg.vSettings.layout.dimx then
      mg.vSettings.layout.progdimx1=mg.vSettings.layout.dimx
    end
    if mg.vSettings.layout.progdimx2>mg.vSettings.layout.dimx then
      mg.vSettings.layout.progdimx2=mg.vSettings.layout.dimx
    end
    if mg.vSettings.layout.progdimy1>mg.vSettings.layout.dimy then
      mg.vSettings.layout.progdimy1=mg.vSettings.layout.dimy
    end
    if mg.vSettings.layout.progdimy2>mg.vSettings.layout.dimy then
      mg.vSettings.layout.progdimy2=mg.vSettings.layout.dimy
    end

    mg.LayoutMainWindow()
    mg.ForceUpdate()
  end

end

function mg.LayoutDimChanged()
  local sName=SystemData.ActiveWindow.name
  if not (sName==(mg.sWindowName.."LayoutSetDimX")) and not (sName==(mg.sWindowName.."LayoutSetDimY"))then
    return
  end
  IraConfig.SpinnerChange()
  local nValue=tonumber(TextEditBoxGetText(sName))
  if sName==(mg.sWindowName.."LayoutSetDimX") then
    mg.vLayout.dimx=nValue
  else
    mg.vLayout.dimy=nValue
  end
  WindowSetDimensions(mg.sWindowName.."LayoutVBar",(mg.vLayout.dimx)*nMult+5,(mg.vLayout.dimy)*nMult+5)
  for k,v in pairs(mg.vBoxLayout) do
    if ((v[1]+mg.vBoxData[k].dimx)>mg.vLayout.dimx) or ((v[2]+mg.vBoxData[k].dimy)>mg.vLayout.dimy) then
      WindowSetTintColor(mg.sWindowName.."LayoutBlock"..k,255,0,0)
      if mg.vBoxData[k].text then
        LabelSetTextColor(mg.sWindowName.."LayoutBlock"..k.."Child",255,0,0)
      end
    else
      WindowSetTintColor(mg.sWindowName.."LayoutBlock"..k,255,255,255)
      if mg.vBoxData[k].text then
        LabelSetTextColor(mg.sWindowName.."LayoutBlock"..k.."Child",255,255,255)
      end
    end
  end
  mg.LayoutAdjDemoProgBar()
end

function mg.LayoutIdentify()
  local sName=SystemData.MouseOverWindow.name
  local nId=WindowGetId(sName)
  if mg.vBoxData[nId] then
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.GetPhrase("tooltips",mg.vBoxData[nId].name))
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
  end
end

function mg.LayoutStartDrag()
  local sName=SystemData.MouseOverWindow.name
  local nId=WindowGetId(sName)
  if sName~=(mg.sWindowName.."LayoutBlock"..nId) then
    return
  end
  mg.nLayoutDrag=nId
  Tooltips.ClearTooltip()
  local nBaseX,nBaseY=WindowGetScreenPosition(sName)
  nDragOfsX=-math.floor((SystemData.MousePosition.x-nBaseX)/InterfaceCore.GetScale())
  nDragOfsY=-math.floor((SystemData.MousePosition.y-nBaseY)/InterfaceCore.GetScale())
  WindowClearAnchors(sName)
  WindowAddAnchor(sName,"topleft","CursorWindow","topleft",nDragOfsX,nDragOfsY)
  for k,v in ipairs(mg.vBoxData) do
    WindowSetHandleInput(mg.sWindowName.."LayoutBlock"..k,false)
  end
  --This does not update until the mouse moves, so we must give it some help
  SystemData.MouseOverWindow.name=mg.sWindowName.."Layout"
  WindowSetDimensions(mg.sWindowName.."LayoutHover",mg.vBoxData[nId].dimx*nMult+2,mg.vBoxData[nId].dimy*nMult+2)
  nLastX=nil
  nLastY=nil
end

function mg.LayoutEndDrag()
  local sOver=SystemData.MouseOverWindow.name
  local sDrag
  local nDrag=mg.nLayoutDrag
  if not mg.nLayoutDrag then
    return
  end
  mg.nLayoutDrag=nil
  sDrag=mg.sWindowName.."LayoutBlock"..nDrag
  WindowSetShowing(mg.sWindowName.."LayoutHover",false)
  for k,v in ipairs(mg.vBoxData) do
    WindowSetHandleInput(mg.sWindowName.."LayoutBlock"..k,true)
  end
  WindowSetTintColor(sDrag,255,255,255)
  if mg.vBoxData[nDrag].text then
    LabelSetTextColor(sDrag.."Child",255,255,255)
  end
  if sOver==(mg.sWindowName.."Layout") then
    local nPosX,nPosY
    local nBaseX,nBaseY=WindowGetScreenPosition(mg.sWindowName.."LayoutVBar")
    nPosX=math.floor((((SystemData.MousePosition.x-nBaseX)/InterfaceCore.GetScale())+nDragOfsX)/nMult)
    nPosY=math.floor((((SystemData.MousePosition.y-nBaseY)/InterfaceCore.GetScale())+nDragOfsY)/nMult)
    if (nPosX>=0) and ((nPosX+mg.vBoxData[nDrag].dimx)<=mg.vLayout.dimx) and (nPosY>=0) and ((nPosY+mg.vBoxData[nDrag].dimy)<=mg.vLayout.dimy) then
      WindowClearAnchors(sDrag)
      WindowAddAnchor(sDrag,"topleft",mg.sWindowName.."LayoutVBar","topleft",nPosX*nMult+2,nPosY*nMult+2)
      --This does not update until the mouse moves, so we must give it some help
      SystemData.MouseOverWindow.name=sDrag
      mg.vBoxLayout[nDrag]={nPosX,nPosY}
      return
    end
  end
  mg.vBoxLayout[nDrag]=nil
  WindowClearAnchors(sDrag)
  WindowAddAnchor(sDrag,"topright",mg.sWindowName.."Layout","topright",math.floor((nDrag-1)/3)*-40,math.mod(nDrag-1,3)*30)
end

function mg.LayoutUpdate(nElapsed)
  if not mg.nLayoutDrag then
    return
  end
  local sOver=SystemData.MouseOverWindow.name
  local nDrag=mg.nLayoutDrag
  if (nLastX~=SystemData.MousePosition.x) or (nLastY~=SystemData.MousePosition.y) then
    nLastX=SystemData.MousePosition.x
    nLastY=SystemData.MousePosition.y
    if sOver==(mg.sWindowName.."Layout") then
      local nPosX,nPosY
      local nBaseX,nBaseY=WindowGetScreenPosition(mg.sWindowName.."LayoutVBar")
      nPosX=math.floor((((SystemData.MousePosition.x-nBaseX)/InterfaceCore.GetScale())+nDragOfsX)/nMult)
      nPosY=math.floor((((SystemData.MousePosition.y-nBaseY)/InterfaceCore.GetScale())+nDragOfsY)/nMult)
      if (nPosX>=0) and ((nPosX+mg.vBoxData[nDrag].dimx)<=mg.vLayout.dimx) and (nPosY>=0) and ((nPosY+mg.vBoxData[nDrag].dimy)<=mg.vLayout.dimy) then
        WindowClearAnchors(mg.sWindowName.."LayoutHover")
        WindowAddAnchor(mg.sWindowName.."LayoutHover","topleft",mg.sWindowName.."LayoutVBar","topleft",nPosX*nMult+1,nPosY*nMult+1)
        WindowSetShowing(mg.sWindowName.."LayoutHover",true)
        return
      end
    end
    WindowSetShowing(mg.sWindowName.."LayoutHover",false)
  end
end

function mg.LayoutMainWindow()
  local sWin=mg.sWindowName.."Plant"
  --Layout the stuff within each plot
  for i=1,4 do
    LabelSetText(sWin..i.."PlotNum",towstring(i))
    WindowSetDimensions(sWin..i,mg.vSettings.layout.dimx*nMult+mg.vSettings.layout.spacing,mg.vSettings.layout.dimy*nMult+mg.vSettings.layout.spacing)
    for k,v in ipairs(mg.vBoxData) do
      WindowClearAnchors(sWin..i..v.win)
      if mg.vSettings.boxlayout[k] then
        if not v.text then
          WindowSetHandleInput(sWin..i..v.win,true)
        end
        WindowSetAlpha(sWin..i..v.win,1)
        WindowAddAnchor(sWin..i..v.win,"topleft",sWin..i,"bottomleft",mg.vSettings.boxlayout[k][1]*nMult,(mg.vSettings.boxlayout[k][2]+v.dimy)*nMult)
      else
        WindowSetHandleInput(sWin..i..v.win,false)
        WindowSetAlpha(sWin..i..v.win,0)
      end
    end
    --Setup progress bar...
    if (mg.vSettings.progress.arrange>1) and (mg.vSettings.layout.progdimx1~=mg.vSettings.layout.progdimx2) and (mg.vSettings.layout.progdimy1~=mg.vSettings.layout.progdimy2) then
      WindowSetAlpha(sWin..i.."Bar",1)
      WindowClearAnchors(sWin..i.."Bar")
      WindowAddAnchor(sWin..i.."Bar","topleft",sWin..i,"topleft",mg.vSettings.layout.progdimx1*nMult,mg.vSettings.layout.progdimy1*nMult)
      WindowAddAnchor(sWin..i.."Bar","topleft",sWin..i,"bottomright",mg.vSettings.layout.progdimx2*nMult,mg.vSettings.layout.progdimy2*nMult)
      WindowClearAnchors(sWin..i.."BarFill")
      WindowClearAnchors(sWin..i.."BarBack")
      if mg.vSettings.progress.arrange==2 then
        --L2R
        WindowAddAnchor(sWin..i.."BarFill","topleft",sWin..i.."Bar","topleft",0,0)
        WindowAddAnchor(sWin..i.."BarFill","bottomleft",sWin..i.."Bar","bottomleft",0,0)
        WindowAddAnchor(sWin..i.."BarBack","topright",sWin..i.."BarFill","topleft",0,0)
        WindowAddAnchor(sWin..i.."BarBack","bottomright",sWin..i.."Bar","bottomright",0,0)
      elseif mg.vSettings.progress.arrange==3 then
        --R2L
        WindowAddAnchor(sWin..i.."BarFill","topright",sWin..i.."Bar","topright",0,0)
        WindowAddAnchor(sWin..i.."BarFill","bottomright",sWin..i.."Bar","bottomright",0,0)
        WindowAddAnchor(sWin..i.."BarBack","topleft",sWin..i.."Bar","topleft",0,0)
        WindowAddAnchor(sWin..i.."BarBack","bottomleft",sWin..i.."BarFill","bottomright",0,0)
      elseif mg.vSettings.progress.arrange==4 then
        --B2T
        WindowAddAnchor(sWin..i.."BarFill","bottomleft",sWin..i.."Bar","bottomleft",0,0)
        WindowAddAnchor(sWin..i.."BarFill","bottomright",sWin..i.."Bar","bottomright",0,0)
        WindowAddAnchor(sWin..i.."BarBack","topleft",sWin..i.."Bar","topleft",0,0)
        WindowAddAnchor(sWin..i.."BarBack","topright",sWin..i.."BarFill","bottomright",0,0)
      elseif mg.vSettings.progress.arrange==5 then
        --T2B
        WindowAddAnchor(sWin..i.."BarFill","topleft",sWin..i.."Bar","topleft",0,0)
        WindowAddAnchor(sWin..i.."BarFill","topright",sWin..i.."Bar","topright",0,0)
        WindowAddAnchor(sWin..i.."BarBack","bottomleft",sWin..i.."BarFill","topleft",0,0)
        WindowAddAnchor(sWin..i.."BarBack","bottomright",sWin..i.."Bar","bottomright",0,0)
      end
      local vCombo=mg.vTexCombo[mg.vSettings.progress.texture]
      DynamicImageSetTexture(sWin..i.."BarFill",vCombo.fill.tex,vCombo.fill.left,vCombo.fill.top)
      DynamicImageSetTextureDimensions(sWin..i.."BarFill",vCombo.fill.width,vCombo.fill.height)
      DynamicImageSetTexture(sWin..i.."BarBack",vCombo.back.tex,vCombo.back.left,vCombo.back.top)
      DynamicImageSetTextureDimensions(sWin..i.."BarBack",vCombo.back.width,vCombo.back.height)
      WindowSetTintColor(sWin..i.."BarFill",mg.vSettings.progress.fill.r,mg.vSettings.progress.fill.g,mg.vSettings.progress.fill.b)
      WindowSetTintColor(sWin..i.."BarBack",mg.vSettings.progress.back.r,mg.vSettings.progress.back.g,mg.vSettings.progress.back.b)
      WindowSetAlpha(sWin..i.."BarFill",mg.vSettings.progress.fill.a/255)
      WindowSetAlpha(sWin..i.."BarBack",mg.vSettings.progress.back.a/255)
    else
      --disabled or invisible
      WindowSetAlpha(sWin..i.."Bar",0)
    end
  end
  --Layout the plots
  for i=1,3 do
    WindowSetShowing(mg.sWindowName.."VSep"..i,false)
    WindowSetShowing(mg.sWindowName.."HSep"..i,false)
  end
  WindowClearAnchors(sWin.."1")
  WindowAddAnchor(sWin.."1","topleft",mg.sWindowName,"topleft",7+mg.vSettings.layout.spacing,3+mg.vSettings.layout.spacing)
  if mg.vSettings.layout.arrange==1 then
    --top to bottom
    for i=2,4 do
      WindowClearAnchors(sWin..i)
      WindowAddAnchor(sWin..i,"bottomleft",sWin..(i-1),"topleft",0,0)
    end
    WindowSetDimensions(mg.sWindowName,
      14+nMult*mg.vSettings.layout.dimx+(mg.vSettings.layout.spacing*2),
      10+(mg.vSettings.layout.spacing*(mg.vSettings.layout.count+1))+(nMult*mg.vSettings.layout.dimy*mg.vSettings.layout.count))
    if mg.vSettings.layout.border then
      for i=1,(mg.vSettings.layout.count-1) do
        WindowSetShowing(mg.sWindowName.."HSep"..i,true)
        WindowClearAnchors(mg.sWindowName.."HSep"..i)
        WindowAddAnchor(mg.sWindowName.."HSep"..i,"topleft",mg.sWindowName,"topleft",7,
          3+(((nMult*mg.vSettings.layout.dimy)+mg.vSettings.layout.spacing)*i)+(mg.vSettings.layout.spacing/2)-2)
        WindowAddAnchor(mg.sWindowName.."HSep"..i,"topright",mg.sWindowName,"topright",-7,
          3+(((nMult*mg.vSettings.layout.dimy)+mg.vSettings.layout.spacing)*i)+(mg.vSettings.layout.spacing/2)-2)
        DynamicImageSetTextureDimensions(mg.sWindowName.."HSep"..i,58,4)
      end
    end
  elseif mg.vSettings.layout.arrange==2 then
    --left to right
    for i=2,4 do
      WindowClearAnchors(sWin..i)
      WindowAddAnchor(sWin..i,"topright",sWin..(i-1),"topleft",0,0)
    end
    WindowSetDimensions(mg.sWindowName,
      14+(mg.vSettings.layout.spacing*(mg.vSettings.layout.count+1))+(nMult*mg.vSettings.layout.dimx*mg.vSettings.layout.count),
      10+nMult*mg.vSettings.layout.dimy+(mg.vSettings.layout.spacing*2))
    if mg.vSettings.layout.border then
      for i=1,(mg.vSettings.layout.count-1) do
        WindowSetShowing(mg.sWindowName.."VSep"..i,true)
        WindowClearAnchors(mg.sWindowName.."VSep"..i)
        WindowAddAnchor(mg.sWindowName.."VSep"..i,"topleft",mg.sWindowName,"topleft",
          7+(((nMult*mg.vSettings.layout.dimx)+mg.vSettings.layout.spacing)*i)+(mg.vSettings.layout.spacing/2)-2,
          3)
        WindowAddAnchor(mg.sWindowName.."VSep"..i,"bottomleft",mg.sWindowName,"bottomleft",
          7+(((nMult*mg.vSettings.layout.dimx)+mg.vSettings.layout.spacing)*i)+(mg.vSettings.layout.spacing/2)-2,
          -7)
        DynamicImageSetTextureDimensions(mg.sWindowName.."VSep"..i,4,20)
      end
    end
  else
    --square
    WindowClearAnchors(sWin..2)
    WindowAddAnchor(sWin..2,"topright",sWin..1,"topleft",0,0)
    WindowClearAnchors(sWin..3)
    WindowAddAnchor(sWin..3,"bottomleft",sWin..1,"topleft",0,0)
    WindowClearAnchors(sWin..4)
    WindowAddAnchor(sWin..4,"bottomright",sWin..1,"topleft",0,0)
    WindowSetDimensions(mg.sWindowName,
      14+(mg.vSettings.layout.spacing*3)+(nMult*mg.vSettings.layout.dimx*2),
      10+(mg.vSettings.layout.spacing*3)+(nMult*mg.vSettings.layout.dimy*2))
    if mg.vSettings.layout.border then
      WindowSetShowing(mg.sWindowName.."HSep1",true)
      WindowClearAnchors(mg.sWindowName.."HSep1")
      WindowAddAnchor(mg.sWindowName.."HSep1","topleft",mg.sWindowName,"topleft",7,
        3+((nMult*mg.vSettings.layout.dimy)+mg.vSettings.layout.spacing)+(mg.vSettings.layout.spacing/2)-2)
      WindowAddAnchor(mg.sWindowName.."HSep1","topright",mg.sWindowName,"topright",-7,
        3+((nMult*mg.vSettings.layout.dimy)+mg.vSettings.layout.spacing)+(mg.vSettings.layout.spacing/2)-2)
      DynamicImageSetTextureDimensions(mg.sWindowName.."HSep1",58,4)
      WindowSetShowing(mg.sWindowName.."VSep1",true)
      WindowClearAnchors(mg.sWindowName.."VSep1")
      WindowAddAnchor(mg.sWindowName.."VSep1","topleft",mg.sWindowName,"topleft",
        7+((nMult*mg.vSettings.layout.dimx)+mg.vSettings.layout.spacing)+(mg.vSettings.layout.spacing/2)-2,
        3)
      WindowAddAnchor(mg.sWindowName.."VSep1","bottomleft",mg.sWindowName,"bottomleft",
        7+((nMult*mg.vSettings.layout.dimx)+mg.vSettings.layout.spacing)+(mg.vSettings.layout.spacing/2)-2,
        -7)
      DynamicImageSetTextureDimensions(mg.sWindowName.."VSep1",4,20)
    end
  end
end

function mg.NextVis()
  local nTemp
  if nVis>0 then
    mg.vBoxVis[nVis]={}
    for i=0,4 do
      mg.vBoxVis[nVis][i]=ButtonGetPressedFlag(mg.sWindowName.."LayoutSetStage"..i)
    end
  end
  for k,v in ipairs(mg.vBoxData) do
    if (v.vis) and (k>nVis) then
      nTemp=k
      break
    end
  end
  if not nTemp then
    for k,v in ipairs(mg.vBoxData) do
      if v.vis then
        nTemp=k
        break
      end
    end
  end
  nVis=nTemp
  if DoesWindowExist(mg.sWindowName.."LayoutSetVisTargetChild") then
    DestroyWindow(mg.sWindowName.."LayoutSetVisTargetChild")
  end
  CreateWindowFromTemplate(mg.sWindowName.."LayoutSetVisTargetChild",mg.vBoxData[nVis].template,mg.sWindowName.."LayoutSetVisTarget")
  WindowAddAnchor(mg.sWindowName.."LayoutSetVisTargetChild","bottomright",mg.sWindowName.."LayoutSetVisTarget","bottomright",0,0)
  WindowSetId(mg.sWindowName.."LayoutSetVisTarget",nVis)
  if mg.vBoxData[nVis].text then
    LabelSetText(mg.sWindowName.."LayoutSetVisTargetChild",mg.vBoxData[nVis].text)
  end
  for i=0,4 do
    if mg.vBoxData[nVis].vis[i] then
      ButtonSetDisabledFlag(mg.sWindowName.."LayoutSetStage"..i,false)
      ButtonSetPressedFlag(mg.sWindowName.."LayoutSetStage"..i,mg.vBoxVis[nVis][i])
    else
      ButtonSetDisabledFlag(mg.sWindowName.."LayoutSetStage"..i,true)
      ButtonSetPressedFlag(mg.sWindowName.."LayoutSetStage"..i,false)
    end
  end
end

function mg.PrevVis()
  local nTemp
  mg.vBoxVis[nVis]={}
  for i=0,4 do
    mg.vBoxVis[nVis][i]=ButtonGetPressedFlag(mg.sWindowName.."LayoutSetStage"..i)
  end
  for k,v in ipairs(mg.vBoxData) do
    if k==nVis then
      break
    end
    if v.vis then
      nTemp=k
    end
  end
  if not nTemp then
    for k,v in ipairs(mg.vBoxData) do
      if v.vis then
        nTemp=k
      end
    end
  end
  nVis=nTemp
  if DoesWindowExist(mg.sWindowName.."LayoutSetVisTargetChild") then
    DestroyWindow(mg.sWindowName.."LayoutSetVisTargetChild")
  end
  CreateWindowFromTemplate(mg.sWindowName.."LayoutSetVisTargetChild",mg.vBoxData[nVis].template,mg.sWindowName.."LayoutSetVisTarget")
  WindowAddAnchor(mg.sWindowName.."LayoutSetVisTargetChild","bottomright",mg.sWindowName.."LayoutSetVisTarget","bottomright",0,0)
  WindowSetId(mg.sWindowName.."LayoutSetVisTarget",nVis)
  if mg.vBoxData[nVis].text then
    LabelSetText(mg.sWindowName.."LayoutSetVisTargetChild",mg.vBoxData[nVis].text)
  end
  for i=0,4 do
    if mg.vBoxData[nVis].vis[i] then
      ButtonSetDisabledFlag(mg.sWindowName.."LayoutSetStage"..i,false)
      ButtonSetPressedFlag(mg.sWindowName.."LayoutSetStage"..i,mg.vBoxVis[nVis][i])
    else
      ButtonSetDisabledFlag(mg.sWindowName.."LayoutSetStage"..i,true)
      ButtonSetPressedFlag(mg.sWindowName.."LayoutSetStage"..i,false)
    end
  end
end

function mg.LayoutProgDimChanged()
  local sName=SystemData.ActiveWindow.name
  if not (sName==(mg.sWindowName.."LayoutProgDimX1")) and not (sName==(mg.sWindowName.."LayoutProgDimY1")) and not (sName==(mg.sWindowName.."LayoutProgDimX2")) and not (sName==(mg.sWindowName.."LayoutProgDimY2")) then
    return
  end
  IraConfig.SpinnerChange()
  local nID=WindowGetId(sName)
  local nValue=tonumber(TextEditBoxGetText(sName))
  if nID==1 then
    mg.vLayout.progdimx1=nValue
  elseif nID==2 then
    mg.vLayout.progdimy1=nValue
  elseif nID==3 then
    mg.vLayout.progdimx2=nValue
  elseif nID==4 then
    mg.vLayout.progdimy2=nValue
  end  
  mg.LayoutAdjDemoProgBar()
end

function mg.LayoutAdjDemoProgBar()
  local x1,x2,y1,y2
  if mg.vLayout.progdimx1>mg.vLayout.progdimx2 then
    x2=mg.vLayout.progdimx1
    x1=mg.vLayout.progdimx2
  else
    x1=mg.vLayout.progdimx1
    x2=mg.vLayout.progdimx2
  end
  if mg.vLayout.progdimy1>mg.vLayout.progdimy2 then
    y2=mg.vLayout.progdimy1
    y1=mg.vLayout.progdimy2
  else
    y1=mg.vLayout.progdimy1
    y2=mg.vLayout.progdimy2
  end
  WindowSetShowing(mg.sWindowName.."LayoutBar",(x1~=x2) and (y1~=y2))
  if (x2>mg.vLayout.dimx) or (y2>mg.vLayout.dimy) then
    bProgValid=false
  else
    bProgValid=true
  end
  mg.LayoutShowDemoTex()
  if (x1~=x2) and (y1~=y2) and (mg.vProg.arrange>1) then
    WindowSetShowing(mg.sWindowName.."LayoutBar",true)
    WindowClearAnchors(mg.sWindowName.."LayoutBarFill")
    WindowClearAnchors(mg.sWindowName.."LayoutBarBack")
    if mg.vProg.arrange==2 then
      --L2R
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","topleft",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","bottom",mg.sWindowName.."LayoutBar","bottomright",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","top",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","bottomright",mg.sWindowName.."LayoutBar","bottomright",0,0)
    elseif mg.vProg.arrange==3 then
      --R2L
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","top",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","bottomright",mg.sWindowName.."LayoutBar","bottomright",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","topleft",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","bottom",mg.sWindowName.."LayoutBar","bottomright",0,0)
    elseif mg.vProg.arrange==4 then
      --B2T
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","left",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","bottomright",mg.sWindowName.."LayoutBar","bottomright",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","topleft",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","right",mg.sWindowName.."LayoutBar","bottomright",0,0)
    elseif mg.vProg.arrange==5 then
      --T2B
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","topleft",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarFill","right",mg.sWindowName.."LayoutBar","bottomright",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","left",mg.sWindowName.."LayoutBar","topleft",0,0)
      WindowAddAnchor(mg.sWindowName.."LayoutBarBack","bottomright",mg.sWindowName.."LayoutBar","bottomright",0,0)
    end
  else
    WindowSetShowing(mg.sWindowName.."LayoutBar",false)
  end
  WindowClearAnchors(mg.sWindowName.."LayoutBar")
  WindowAddAnchor(mg.sWindowName.."LayoutBar","topleft",mg.sWindowName.."LayoutVBar","topleft",x1*nMult+2,y1*nMult+2)
  WindowAddAnchor(mg.sWindowName.."LayoutBar","topleft",mg.sWindowName.."LayoutVBar","bottomright",x2*nMult+2,y2*nMult+2)
end

function mg.LayoutShowChanged()
  mg.vProg.arrange=ComboBoxGetSelectedMenuItem(mg.sWindowName.."LayoutProgShow")
  mg.LayoutAdjDemoProgBar()
end

function mg.LayoutPrevBar()
  mg.vProg.texture=mg.vProg.texture-1
  if not mg.vTexCombo[mg.vProg.texture] then
    for k,v in ipairs(mg.vTexCombo) do
      mg.vProg.texture=k
    end
  end
  mg.LayoutShowDemoTex()
end

function mg.LayoutNextBar()
  mg.vProg.texture=mg.vProg.texture+1
  if not mg.vTexCombo[mg.vProg.texture] then
    mg.vProg.texture=0
  end
  mg.LayoutShowDemoTex()
end

function mg.LayoutBarCChanged()
  local sName=SystemData.ActiveWindow.name
  IraConfig.SpinnerChange()
  local nID=WindowGetId(sName)+(WindowGetId(WindowGetParent(sName))*4)
  local nValue=tonumber(TextEditBoxGetText(sName))
  if nID==5 then
    mg.vProg.fill.r=nValue
  elseif nID==6 then
    mg.vProg.fill.g=nValue
  elseif nID==7 then
    mg.vProg.fill.b=nValue
  elseif nID==8 then
    mg.vProg.fill.a=nValue
  elseif nID==9 then
    mg.vProg.back.r=nValue
  elseif nID==10 then
    mg.vProg.back.g=nValue
  elseif nID==11 then
    mg.vProg.back.b=nValue
  elseif nID==12 then
    mg.vProg.back.a=nValue
  end
  mg.LayoutShowDemoTex()
end

function mg.LayoutShowDemoTex()
  local vCombo=mg.vTexCombo[mg.vProg.texture]
  DynamicImageSetTexture(mg.sWindowName.."LayoutBarFill",vCombo.fill.tex,vCombo.fill.left,vCombo.fill.top)
  DynamicImageSetTextureDimensions(mg.sWindowName.."LayoutBarFill",vCombo.fill.width,vCombo.fill.height)
  DynamicImageSetTexture(mg.sWindowName.."LayoutBarBack",vCombo.back.tex,vCombo.back.left,vCombo.back.top)
  DynamicImageSetTextureDimensions(mg.sWindowName.."LayoutBarBack",vCombo.back.width,vCombo.back.height)
  if bProgValid then
    WindowSetTintColor(mg.sWindowName.."LayoutBarFill",mg.vProg.fill.r,mg.vProg.fill.g,mg.vProg.fill.b)
    WindowSetTintColor(mg.sWindowName.."LayoutBarBack",mg.vProg.back.r,mg.vProg.back.g,mg.vProg.back.b)
  else
    WindowSetTintColor(mg.sWindowName.."LayoutBarFill",255,0,0)
    WindowSetTintColor(mg.sWindowName.."LayoutBarBack",255,0,0)
  end
  WindowSetAlpha(mg.sWindowName.."LayoutBarFill",mg.vProg.fill.a/255)
  WindowSetAlpha(mg.sWindowName.."LayoutBarBack",mg.vProg.back.a/255)

  DynamicImageSetTexture(mg.sWindowName.."LayoutProgBarFill",vCombo.fill.tex,vCombo.fill.left,vCombo.fill.top)
  DynamicImageSetTextureDimensions(mg.sWindowName.."LayoutProgBarFill",vCombo.fill.width,vCombo.fill.height)
  DynamicImageSetTexture(mg.sWindowName.."LayoutProgBarBack",vCombo.back.tex,vCombo.back.left,vCombo.back.top)
  DynamicImageSetTextureDimensions(mg.sWindowName.."LayoutProgBarBack",vCombo.back.width,vCombo.back.height)

  DynamicImageSetTexture(mg.sWindowName.."LayoutProgFillTest",vCombo.fill.tex,vCombo.fill.left,vCombo.fill.top)
  DynamicImageSetTextureDimensions(mg.sWindowName.."LayoutProgFillTest",vCombo.fill.width,vCombo.fill.height)
  DynamicImageSetTexture(mg.sWindowName.."LayoutProgBackTest",vCombo.back.tex,vCombo.back.left,vCombo.back.top)
  DynamicImageSetTextureDimensions(mg.sWindowName.."LayoutProgBackTest",vCombo.back.width,vCombo.back.height)
  WindowSetTintColor(mg.sWindowName.."LayoutProgFillTest",mg.vProg.fill.r,mg.vProg.fill.g,mg.vProg.fill.b)
  WindowSetTintColor(mg.sWindowName.."LayoutProgBackTest",mg.vProg.back.r,mg.vProg.back.g,mg.vProg.back.b)
  WindowSetAlpha(mg.sWindowName.."LayoutProgFillTest",mg.vProg.fill.a/255)
  WindowSetAlpha(mg.sWindowName.."LayoutProgBackTest",mg.vProg.back.a/255)
end

function mg.LayoutPlotArrChanged()
  local nValue=ComboBoxGetSelectedMenuItem(mg.sWindowName.."LayoutPlotsArrange")
  if nValue==3 then
    TextEditBoxSetText(mg.sWindowName.."LayoutPlotsCount",towstring(4))
    ButtonSetDisabledFlag(mg.sWindowName.."LayoutPlotsCountSpinnerButtonPlus",true)
    ButtonSetDisabledFlag(mg.sWindowName.."LayoutPlotsCountSpinnerButtonMinus",true)
    TextEditBoxSetTextColor(mg.sWindowName.."LayoutPlotsCount",128,128,128)
    LabelSetTextColor(mg.sWindowName.."LayoutPlotsCountLabel",128,128,128)
    WindowSetHandleInput(mg.sWindowName.."LayoutPlotsCount",false)
    WindowSetHandleInput(mg.sWindowName.."LayoutPlotsCountSpinnerButtonPlus",false)
    WindowSetHandleInput(mg.sWindowName.."LayoutPlotsCountSpinnerButtonMinus",false)
  else
    ButtonSetDisabledFlag(mg.sWindowName.."LayoutPlotsCountSpinnerButtonPlus",false)
    ButtonSetDisabledFlag(mg.sWindowName.."LayoutPlotsCountSpinnerButtonMinus",false)
    TextEditBoxSetTextColor(mg.sWindowName.."LayoutPlotsCount",255,255,255)
    LabelSetTextColor(mg.sWindowName.."LayoutPlotsCountLabel",255,255,255)
    WindowSetHandleInput(mg.sWindowName.."LayoutPlotsCount",true)
    WindowSetHandleInput(mg.sWindowName.."LayoutPlotsCountSpinnerButtonPlus",true)
    WindowSetHandleInput(mg.sWindowName.."LayoutPlotsCountSpinnerButtonMinus",true)
  end
end

function mg.PioritizePlots()
  local vInfo
  local nPriority
  local vPlots={}
  local nCount=mg.vSettings.layout.count
  local nMax
  local nMaxPlot
  --local sInfo="Priority "
  --Show everything if we're set to
  if mg.vSettings.layout.count==4 then
    for i=1,4 do
      WindowSetShowing(mg.sWindowName.."Plant"..i,true)
      WindowSetDimensions(mg.sWindowName.."Plant"..i,mg.vSettings.layout.dimx*nMult+mg.vSettings.layout.spacing,mg.vSettings.layout.dimy*nMult+mg.vSettings.layout.spacing)
    end
    return
  end
  --Determine the priority of each plot
  for i=1,4 do
    vInfo=GetCultivationInfo(i)
    if vInfo.StageNum==4 then
      nPriority=300000
      if mg.CanRepeat(i) then
        nPriority=nPriority+10000
      end
    elseif vInfo.StageNum==0 then
      nPriority=200000
      if mg.CanRepeat(i) then
        nPriority=nPriority+10000
      end
    elseif vInfo.StageNum>4 then
      nPriority=0
    else
      nPriority=100000
      if vInfo.Additives[vInfo.StageNum+1].uniqueID==0 then
        nPriority=nPriority+10000
      end
      nPriority=nPriority+9990-vInfo.TotalTimer*10
    end
    vPlots[i]=nPriority+4-i
  end
  for i=1,4 do
    nMax=0
    for k,v in pairs(vPlots) do
      if v>nMax then
        nMax=v
        nMaxPlot=k
      end
    end
    vPlots[nMaxPlot]=nil
    --sInfo=sInfo.."("..nMaxPlot..","..nMax..") "
    if nCount>0 then
      nCount=nCount-1
      WindowSetShowing(mg.sWindowName.."Plant"..nMaxPlot,true)
      WindowSetDimensions(mg.sWindowName.."Plant"..nMaxPlot,mg.vSettings.layout.dimx*nMult+mg.vSettings.layout.spacing,mg.vSettings.layout.dimy*nMult+mg.vSettings.layout.spacing)
    else
      WindowSetShowing(mg.sWindowName.."Plant"..nMaxPlot,false)
      WindowSetDimensions(mg.sWindowName.."Plant"..nMaxPlot,0,0)
    end
  end
--  if sInfo~=sPriorityInfo then
--    sPriorityInfo=sInfo
--    d(sInfo)
--  end
end


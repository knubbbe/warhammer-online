--[[
  MGRemix (Miracle Grow Remix) version 2.30
  by Irinia of Volkmar
  MGRemix puts all the functionality of the cultivation interface into a small
  window.  Also added are quick item selection and one-click repeat
 
  This file contains code related to harvesting and repeating
--]]
 
local mg=MiracleGrow2
 
--Keep track of time passed here. Time is in seconds
mg.nTime=0
 
--Whether or not we are auto filling do to a repeat command
mg.abAuto={false,false,false,false}
 
--When we entered the repeat state, if we are waiting to start (from mg.nTime)
--Last repeat tick, if we are in progress
mg.atRepeat={0,0,0,0}
 
--Tick system to account for lag in delays
mg.tLastTick=0
mg.nTickCount=0
 
--Number of ticks we've been repeating
mg.aiRepeatTicks={0,0,0,0}
 
--Are we out of state 4?  Updated in the on change handler so our onupdate handler is quicker
mg.abRepeatGo={false,false,false,false}
 
--Keep of the last thing grown in each plot, in case we want to grow it again
mg.aiLastGrow={
  [1]={0,0,0,0},
  [2]={0,0,0,0},
  [3]={0,0,0,0},
  [4]={0,0,0,0},
}
mg.asLastGrowName={
  [1]={L"",L"",L"",L""},
  [2]={L"",L"",L"",L""},
  [3]={L"",L"",L"",L""},
  [4]={L"",L"",L"",L""},
}
 
--List of items we are refining and number of ticks untill we can retry
mg.aiRefining={}
mg.aLastStage={255,255,255,255}
 
local function c(sString)
  EA_ChatWindow.Print(towstring(sString),SystemData.ChatLogFilters.CRAFTING)
end
 
--This function determines how many of uniqueID are available, taking into account items scheduled to be placed.
-- It's possible to return a negative value
function mg.GetItemCount(uniqueID)
  local vBagItems=DataUtils.GetItems();
  local iCount=0
  --Count items in our bag
  for k,v in pairs(vBagItems) do
    if v.uniqueID==uniqueID then
      iCount=iCount+v.stackCount
    end
  end
  if mg.TYPE_CRAFTING then
    vBagItems=DataUtils.GetCraftingItems()
    for k,v in pairs(vBagItems) do
      if v.uniqueID==uniqueID then
        iCount=iCount+v.stackCount
      end
    end
  end
  --Subtract items scheduled
  for i=1,4 do
    if mg.abAuto[i] then
      for j=1,4 do
        if mg.aiLastGrow[i][j]==uniqueID then
          iCount=iCount-1
        end
      end
    end
  end
  return iCount
end
 
--This function manages the repeat list (automaticly)
local function SaveContents(iPlot,vPlot)
  if vPlot.StageNum==4 then
    mg.aiLastGrow[iPlot][1]=vPlot.Seed.uniqueID
    mg.aiLastGrow[iPlot][2]=vPlot.Additives[2].uniqueID
    mg.aiLastGrow[iPlot][3]=vPlot.Additives[3].uniqueID
    mg.aiLastGrow[iPlot][4]=vPlot.Additives[4].uniqueID
    mg.asLastGrowName[iPlot][1]=vPlot.Seed.name
    mg.asLastGrowName[iPlot][2]=vPlot.Additives[2].name
    mg.asLastGrowName[iPlot][3]=vPlot.Additives[3].name
    mg.asLastGrowName[iPlot][4]=vPlot.Additives[4].name
    for i=1,4 do
      if mg.asLastGrowName[iPlot][i]==L"" then
        mg.asLastGrowName[iPlot][i]=mg.GetPhrase("tooltips","nothing")
      end
    end
  elseif (vPlot.StageNum>0) and (vPlot.StageNum~=255) then
    mg.aiLastGrow[iPlot][1]=0
  end
end
 
--This function places ingredients in slots for the repeat functionality
local function DoRepeat(id)
  local cul = GetCultivationInfo(id);
  if cul.StageNum==0 or cul.StageNum == 255 then
    nSlot,nLoc,vItem=mg.GetSlotByItemId(mg.aiLastGrow[id][1])
    AddCraftingItem( 3, id, nSlot, nLoc )
    mg.aiLastGrow[id][1]=0
  elseif cul.StageNum==1 and cul.Additives[2].uniqueID==0 and mg.aiLastGrow[id][2] ~= 0 then
    nSlot,nLoc,vItem=mg.GetSlotByItemId(mg.aiLastGrow[id][2])
    AddCraftingItem( 3, id, nSlot, nLoc )
    mg.aiLastGrow[id][2]=0
  elseif cul.StageNum==2 and cul.Additives[3].uniqueID==0 and mg.aiLastGrow[id][3] ~= 0 then
    nSlot,nLoc,vItem=mg.GetSlotByItemId(mg.aiLastGrow[id][3])
    AddCraftingItem( 3, id, nSlot, nLoc )
    mg.aiLastGrow[id][3]=0
  elseif cul.StageNum==3 and cul.Additives[4].uniqueID==0 and mg.aiLastGrow[id][4] ~= 0 then
    nSlot,nLoc,vItem=mg.GetSlotByItemId(mg.aiLastGrow[id][4])
    AddCraftingItem( 3, id, nSlot, nLoc )
    mg.aiLastGrow[id][4]=0
  elseif cul.StageNum == 4 then
  end
end
 
--This function determines if repeat is available
function mg.CanRepeat(iPlot)
  --Prevent disabling ourselves as we start.  If we're already repeating, we can repeat.
  if mg.abAuto[iPlot] then
    return true
  end
  if mg.aiLastGrow[iPlot][1]==0 then
    return false
  end
  local vInfo=GetCultivationInfo(iPlot)
  for k,v in pairs(mg.aiLastGrow[iPlot]) do
    if v~=0 and mg.GetItemCount(v)<1 then
      --The rare seeds don't go away; we can repeat one if it's in the seed slot
      if (vInfo.Seed.uniqueID~=v) or (vInfo.Seed.rarity~=SystemData.ItemRarity.RARE) then
        return false
      end
    end
  end
  return true
end
 
--This function takes care of all the setup when starting a repeat
local function StartRepeat(iPlot)
  mg.abAuto[iPlot]=true
  mg.atRepeat[iPlot]=mg.nTime
  mg.aiRepeatTicks[iPlot]=0
end
 
--If CIT is installed, do safety stocking
function mg.SafetyStock(seedID)
  --Are we safety stocking?
  if (not mg.bCIT) or (not mg.vSettings.reserve) then
--    d("Not enabled")
    return
  end
  --Are we already refining for this?
  if mg.aiRefining[seedID] then
--    d("Already refining for "..seedID)
    return
  end
  --Do we need more seeds?
  local nShort=mg.vSettings.seedreserve-mg.GetItemCount(seedID)
  if nShort<1 then
--    d("Already have enough "..seedID)
    return
  else
    --d("Short "..nShort)
  end
  --Do we know the plant for this seed?
  local aSeedInfo=CraftValueTip.SeedList[seedID]
  --d(aSeedInfo)
  if (not aSeedInfo) or (aSeedInfo[1]~="std") or (aSeedInfo[4]==0) then
--    d("Don't know how to make more "..seedID)
    return
  end
  local plantID=aSeedInfo[4]
  --Do we have any plant and is it refinable?
--  d("SafetyStock "..seedID.."="..plantID)
  local nSlot,nLoc,vItem=mg.GetSlotByItemId(plantID)
  if (nSlot==0) or (not vItem) or (not vItem.isRefinable) then
--    d("Don't have mats to refine for "..seedID)
    return
  end
  --We have refinable plant.  Refine it
  local nNumPlants=mg.GetItemCount(plantID)
  if nNumPlants<nShort then
    mg.aiRefining[seedID]={200,mg.vSettings.seedreserve-nShort+nNumPlants}
  else
    mg.aiRefining[seedID]={200,mg.vSettings.seedreserve}
  end
  mg.RefineItem(plantID,nShort)
end
 
--Reduce the requirement to refine again by one
function mg.EatReserve(seedID)
--  d("EatReserve "..seedID)
  if mg.aiRefining[seedID] then
    mg.aiRefining[seedID][2]=mg.aiRefining[seedID][2]-1
    if mg.aiRefining[seedID][2]<1 then
      mg.aiRefining[seedID]=nil
    end
  end
end
 
--Initialize
function mg.HRInit()
  --Create our tooltip window
  CreateWindow(mg.sWindowName.."RepeatTip",false)
  mg.HRSetLang()
   
    --Setup the harvest buttons
  WindowSetGameActionData(mg.sWindowName.."Plant1Harvest",GameData.PlayerActions.PERFORM_CRAFTING,GameData.TradeSkills.CULTIVATION,L"")
  WindowSetGameActionData(mg.sWindowName.."Plant2Harvest",GameData.PlayerActions.PERFORM_CRAFTING,GameData.TradeSkills.CULTIVATION,L"")
  WindowSetGameActionData(mg.sWindowName.."Plant3Harvest",GameData.PlayerActions.PERFORM_CRAFTING,GameData.TradeSkills.CULTIVATION,L"")
  WindowSetGameActionData(mg.sWindowName.."Plant4Harvest",GameData.PlayerActions.PERFORM_CRAFTING,GameData.TradeSkills.CULTIVATION,L"")
end
 
function mg.HRSetLang()
  if DoesWindowExist(mg.sWindowName.."RepeatTip") then
    LabelSetText(mg.sWindowName.."RepeatTipTitle",mg.GetPhrase("tooltips","repeattitle"))
    LabelSetText(mg.sWindowName.."RepeatTipSeedTitle",mg.GetPhrase("tooltips","repeatseed"))
    LabelSetText(mg.sWindowName.."RepeatTipSoilTitle",mg.GetPhrase("tooltips","repeatsoil"))
    LabelSetText(mg.sWindowName.."RepeatTipWaterTitle",mg.GetPhrase("tooltips","repeatwater"))
    LabelSetText(mg.sWindowName.."RepeatTipNutTitle",mg.GetPhrase("tooltips","repeatnut"))
  end
end
 
--Script command to repeat
function mg.Repeat(id)
  local bFull=true
  local vInfo=GetCultivationInfo(id)
  if vInfo.StageNum~=0 then
    return
  end
  if not mg.CanRepeat(id) then
    return
  end
  StartRepeat(id)
end
 
--This function is called each tick
function mg.HRUpdate(nTimeElapsed)
  --Keep our timebase
  mg.nTime=mg.nTime+nTimeElapsed
 
  --Cancel repeat if mouse is over the Default harvest button
  if SystemData.MouseOverWindow.name == CultivationWindow.windowName.."Harvest" then
    mg.abAuto[GameData.Player.Cultivation.CurrentPlot]=false
    mg.ForceUpdate()
  end
 
  --Is this a new tick?
  if (mg.nTime-mg.tLastTick)>=0.10 then
    mg.nTickCount=mg.nTickCount+1
    mg.tLastTick=mg.nTime
    mg.OnTick()
  end
end
 
--Ticks happen no more frequently than every .1 seconds
function mg.OnTick()
  --Process auto-repeat stuff
  for i=1,4 do
    --if this plot isn't in auto, we don't care
    if mg.abAuto[i] then
      --If we've been in auto mode in stage 4 for 5 seconds, cancel auto
      if (not mg.abRepeatGo[i]) and ((mg.nTime-mg.atRepeat[i])>=5) then
        mg.abAuto[i]=false
        mg.ForceUpdate()
      end
      if mg.abRepeatGo[i] then
        if mg.aiRepeatTicks[i]==0 then
          --We're good to go, but haven't started
          DoRepeat(i)
          mg.aiRepeatTicks[i]=1
          mg.atRepeat[i]=mg.nTime
        else
          --We're in-process
          mg.aiRepeatTicks[i]=mg.aiRepeatTicks[i]+1
          if math.fmod(mg.aiRepeatTicks[i],15)==0 then
            DoRepeat(i)
          end
        end
      end
    end
  end
  --Process refining
  local __,nOverflowCount=GetOverflowData()
  for k,v in pairs(mg.aiRefining) do
    --d("Refine "..k.." "..v[1])
    if nOverflowCount>0 then
      --backpack is overflowing; we're not going to get our seeds
--      d("overflow")
      mg.aiRefining[k]=nil
    elseif mg.GetItemCount(k)>=v[2] then
      --We have our seeds, cancel
--      d("die")
      mg.aiRefining[k]=nil
    else
      mg.aiRefining[k][1]=mg.aiRefining[k][1]-1
      if mg.aiRefining[k][1]<=0 then
        mg.aiRefining[k]=nil
        mg.SafetyStock(k)
      end
    end
  end
end
 
local function StageChange(i,vPlot)
  local iStageNum=vPlot.StageNum
  if (iStageNum~=255) and (mg.aLastStage[i]~=iStageNum) then
    if mg.aLastStage[i]==255 then
      mg.aLastStage[i]=iStageNum
      return
    end
--    d("Change "..i.." "..mg.aLastStage[i]..">"..iStageNum)
    mg.aLastStage[i]=iStageNum
   
    --Do safety stocks
    if (iStageNum==0) and (mg.aiLastGrow[i][1]~=0) then
      --Stock after harvest
--      d("Harvest "..i)
      mg.SafetyStock(mg.aiLastGrow[i][1])
    elseif iStageNum==1 then
      --Stock after plant
--      d("Plant "..i)
      mg.EatReserve(vPlot.Seed.uniqueID)
      mg.SafetyStock(vPlot.Seed.uniqueID)
    end
  end
end
 
--This function is called when something changes
function mg.HRUpdatePlot(i,vPlot)
  local sBaseName=mg.sWindowName.."Plant"..i
  local iStageNum=vPlot.StageNum
  mg.abRepeatGo[i]=iStageNum~=4
  SaveContents(i,vPlot)
  StageChange(i,vPlot)
 
  if iStageNum>4 then
    WindowSetShowing(sBaseName.."Harvest",false)
    WindowSetShowing(sBaseName.."HarvestRepeat",false)
    WindowSetShowing(sBaseName.."Repeat",false)
  elseif iStageNum==4 then
    WindowSetShowing(sBaseName.."Harvest",true)
    WindowSetShowing(sBaseName.."HarvestRepeat",true)
    WindowSetShowing(sBaseName.."Repeat",false)
    if mg.CanRepeat(i) then
      WindowSetTintColor(sBaseName.."HarvestRepeat",DefaultColor.ZERO_TINT.r,DefaultColor.ZERO_TINT.g,DefaultColor.ZERO_TINT.b)
      WindowSetGameActionData(sBaseName.."HarvestRepeat",GameData.PlayerActions.PERFORM_CRAFTING,GameData.TradeSkills.CULTIVATION,L"")
    else
        WindowSetTintColor(sBaseName.."HarvestRepeat",DefaultColor.RED.r,DefaultColor.RED.g,DefaultColor.RED.b)
      WindowSetGameActionData(sBaseName.."HarvestRepeat",0,0,L"")
    end
  elseif iStageNum==0 then
    WindowSetShowing(sBaseName.."Harvest",false)
    WindowSetShowing(sBaseName.."HarvestRepeat",false)
    if mg.aiLastGrow[i][1]~=0 then
      WindowSetShowing(sBaseName.."Repeat",true)
    else
      WindowSetShowing(sBaseName.."Repeat",false)
    end
    if mg.CanRepeat(i) then
      WindowSetTintColor(sBaseName.."Repeat",DefaultColor.ZERO_TINT.r,DefaultColor.ZERO_TINT.g,DefaultColor.ZERO_TINT.b)
    else
        WindowSetTintColor(sBaseName.."Repeat",DefaultColor.RED.r,DefaultColor.RED.g,DefaultColor.RED.b)
    end
  else
    WindowSetShowing(sBaseName.."Harvest",false)
    WindowSetShowing(sBaseName.."HarvestRepeat",false)
    WindowSetShowing(sBaseName.."Repeat",false)
  end
--[[
  if (iStageNum<2) and mg.abAuto[i] then
    --d("auto"..i)
    DoRepeat(i)
  end
--]]
end
 
 
--------------------------
-- Events
--------------------------
 
function mg.onHHover()
  local sWin=SystemData.ActiveWindow.name
  local id=WindowGetId(WindowGetParent(sWin))
  if WindowGetId(sWin)==2 then
    mg.onHoverRepeat()
  else
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.GetPhrase("tooltips","harvest"))
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
  end
end
 
function mg.onHClick()
  local sWin=SystemData.ActiveWindow.name
  local id=WindowGetId(WindowGetParent(sWin))
  Tooltips.ClearTooltip()
  --d("Click "..id)
  --Change plot to the one clicked so the harvest action harvests the correct plot
  GameData.Player.Cultivation.CurrentPlot=id
  CultivationWindow.UpdateAllPlots()
  if (WindowGetId(sWin)==2) and mg.CanRepeat(id) then
    --d("HAuto "..id)
    StartRepeat(id)
  else
    --d("over "..sWin)
    mg.abAuto[id]=false
  end
  mg.ForceUpdate()  --Force an update so that repeat buttons can be disabled
end  
 
function mg.onHoverRepeat()
    local name = SystemData.MouseOverWindow.name
  local id = WindowGetId(WindowGetParent(name))
  local nSWidth,nSHeight
  local nWLocX,nWLocY
  local nScale
  local nCount
  local vAnchor={
    Point="topright",
    RelativeTo=mg.sWindowName,
    RelativePoint="topleft",
    XOffset=0,
    YOffset=0
  }
  if mg.aiLastGrow[id][1]~=0 then
    LabelSetText(mg.sWindowName.."RepeatTipSeed",mg.asLastGrowName[id][1])
    if mg.aiLastGrow[id][1]==0 then
      LabelSetText(mg.sWindowName.."RepeatTipSeedCount",L"")
      LabelSetTextColor(mg.sWindowName.."RepeatTipSeed",255,255,255)
    else
      nCount=mg.GetItemCount(mg.aiLastGrow[id][1])
      LabelSetText(mg.sWindowName.."RepeatTipSeedCount",towstring(nCount))
      if nCount>=1 then
        LabelSetTextColor(mg.sWindowName.."RepeatTipSeed",255,255,255)
        LabelSetTextColor(mg.sWindowName.."RepeatTipSeedCount",255,255,255)
      else
        LabelSetTextColor(mg.sWindowName.."RepeatTipSeed",255,0,0)
        LabelSetTextColor(mg.sWindowName.."RepeatTipSeedCount",255,0,0)
      end
    end
    LabelSetText(mg.sWindowName.."RepeatTipSoil",mg.asLastGrowName[id][2])
    if mg.aiLastGrow[id][2]==0 then
      LabelSetText(mg.sWindowName.."RepeatTipSoilCount",L"")
      LabelSetTextColor(mg.sWindowName.."RepeatTipSoil",255,255,255)
    else
      nCount=mg.GetItemCount(mg.aiLastGrow[id][2])
      LabelSetText(mg.sWindowName.."RepeatTipSoilCount",towstring(nCount))
      if nCount>=1 then
        LabelSetTextColor(mg.sWindowName.."RepeatTipSoil",255,255,255)
        LabelSetTextColor(mg.sWindowName.."RepeatTipSoilCount",255,255,255)
      else
        LabelSetTextColor(mg.sWindowName.."RepeatTipSoil",255,0,0)
        LabelSetTextColor(mg.sWindowName.."RepeatTipSoilCount",255,0,0)
      end
    end
    LabelSetText(mg.sWindowName.."RepeatTipWater",mg.asLastGrowName[id][3])
    if mg.aiLastGrow[id][3]==0 then
      LabelSetText(mg.sWindowName.."RepeatTipWaterCount",L"")
      LabelSetTextColor(mg.sWindowName.."RepeatTipWater",255,255,255)
    else
      nCount=mg.GetItemCount(mg.aiLastGrow[id][3])
      LabelSetText(mg.sWindowName.."RepeatTipWaterCount",towstring(nCount))
      if nCount>=1 then
        LabelSetTextColor(mg.sWindowName.."RepeatTipWater",255,255,255)
        LabelSetTextColor(mg.sWindowName.."RepeatTipWaterCount",255,255,255)
      else
        LabelSetTextColor(mg.sWindowName.."RepeatTipWater",255,0,0)
        LabelSetTextColor(mg.sWindowName.."RepeatTipWaterCount",255,0,0)
      end
    end
    LabelSetText(mg.sWindowName.."RepeatTipNut",mg.asLastGrowName[id][4])
    if mg.aiLastGrow[id][4]==0 then
      LabelSetText(mg.sWindowName.."RepeatTipNutCount",L"")
      LabelSetTextColor(mg.sWindowName.."RepeatTipNut",255,255,255)
    else
      nCount=mg.GetItemCount(mg.aiLastGrow[id][4])
      LabelSetText(mg.sWindowName.."RepeatTipNutCount",towstring(nCount))
      if nCount>=1 then
        LabelSetTextColor(mg.sWindowName.."RepeatTipNut",255,255,255)
        LabelSetTextColor(mg.sWindowName.."RepeatTipNutCount",255,255,255)
      else
        LabelSetTextColor(mg.sWindowName.."RepeatTipNut",255,0,0)
        LabelSetTextColor(mg.sWindowName.."RepeatTipNutCount",255,0,0)
      end
    end
    Tooltips.CreateCustomTooltip(name,mg.sWindowName.."RepeatTip")
   
    --Choose the position for the tooltip
    nScale=InterfaceCore.GetScale()
    nSWidth,nSHeight=WindowGetDimensions("Root")
    nWLocX,nWLocY=WindowGetScreenPosition(mg.sWindowName)
    nWLocX=nWLocX/nScale;nWLocY=nWLocY/nScale
    --If we're too close to the right side, we can't use the default
    if (nSWidth-nWLocX)<600 then
      if nWLocY>200 then
        --Top
        vAnchor.RelativePoint="bottomright"
      else
        --Bottom
        vAnchor.Point="bottomright"
        vAnchor.RelativePoint="topright"
      end
    end
    Tooltips.AnchorTooltip(vAnchor)
  end
end
 
function mg.onRepeat()
  local id=WindowGetId(WindowGetParent(SystemData.ActiveWindow.name))
  Tooltips.ClearTooltip()
  mg.Repeat(id)
end
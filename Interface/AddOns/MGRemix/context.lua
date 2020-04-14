--[[
  MGRemix (Miracle Grow Remix) version 2.30
  by Irinia of Volkmar
  MGRemix puts all the functionality of the cultivation interface into a small
  window.  Also added are quick item selection and one-click repeat

  This file contains all the context menu code for item lists
--]]

local mg=MiracleGrow2

--Holds all the data for the context menu. Two dimensional. First dimension 
--  is 1 or submenu number, second is item number within the menu
mg.vContext={}

--Indicates the current value of the first dimension of mg.context
mg.iContextIdx=1

--Which plot we act uppon on context menu clck
mg.iContextPlot=0

--==============
-- UI Stuff
--==============

--Adds the item in vItem to menu number iMenuNum, with ID iItem
local function AddContextItem(vItem,iMenuNum,iItem)
  local sName
  local bEffect=false
  if mg.bCIT and ((vItem.item.cultivationType==GameData.CultivationTypes.SEED) or (vItem.item.cultivationType==GameData.CultivationTypes.SPORE)) then
    sName=mg.sWindowName.."ContextCIT"..iItem
    if not DoesWindowExist(sName) then
      CreateWindowFromTemplate(sName,mg.sWindowName.."ContextItemCIT","Root")
    end
    bEffect=true
  else
    sName=mg.sWindowName.."Context"..iItem
    if not DoesWindowExist(sName) then
      CreateWindowFromTemplate(sName,mg.sWindowName.."ContextItem","Root")
    end
  end

  LabelSetText(sName.."Count",mg.GetPhrase("cmenus","count",vItem.count))
  LabelSetText(sName.."Level",mg.GetPhrase("cmenus","level",vItem.item.craftingSkillRequirement))
  LabelSetText(sName.."Item",vItem.item.name)
  LabelSetTextColor(sName.."Level",GameDefs.ItemRarity[vItem.item.rarity].color.r,GameDefs.ItemRarity[vItem.item.rarity].color.g,GameDefs.ItemRarity[vItem.item.rarity].color.b)
  LabelSetTextColor(sName.."Item",GameDefs.ItemRarity[vItem.item.rarity].color.r,GameDefs.ItemRarity[vItem.item.rarity].color.g,GameDefs.ItemRarity[vItem.item.rarity].color.b)
  if bEffect then
    LabelSetText(sName.."Effect",vItem.effect)
  end
  EA_Window_ContextMenu.AddUserDefinedMenuItem(sName,iMenuNum)
end

--Build a context menu from a list of items
local function BuildContextMenu(vData,iPlot)
  local iLvl=-1
  local iRarity=-1
  local iContext=0
  local iIndex=0
  local iSubIndex=1
  mg.iContextPlot=iPlot
  EA_Window_ContextMenu.CreateContextMenu("",EA_Window_ContextMenu.CONTEXT_MENU_1)
  mg.vContext={}
  if #vData<=20 then
    mg.iContextIdx=1
    mg.vContext[1]={}
    for k,v in pairs(vData) do
      iIndex=iIndex+1
      if (iLvl~=-1) and ((v.item.craftingSkillRequirement>iLvl) or (v.item.rarity~=iRarity)) then
        EA_Window_ContextMenu.AddMenuDivider(1)
        mg.vContext[1][iIndex]={}
      end
      iLvl=v.item.craftingSkillRequirement
      iRarity=v.item.rarity
      mg.vContext[1][iIndex]=v
      AddContextItem(v,EA_Window_ContextMenu.CONTEXT_MENU_1,iIndex)
    end
  else
    mg.vContext[iIndex]={}
    for k,v in pairs(vData) do
      if (v.item.craftingSkillRequirement>iLvl) or (v.item.rarity~=iRarity) then
        iIndex=iIndex+1
        mg.vContext[iIndex]={}      
        iSubIndex=1
        EA_Window_ContextMenu.AddCascadingMenuItem(mg.GetPhrase("cmenus","lvlandrarity",v.item.craftingSkillRequirement,GameDefs.ItemRarity[v.item.rarity].desc),mg.ContextSubMenu,false,EA_Window_ContextMenu.CONTEXT_MENU_1)
      end
      iLvl=v.item.craftingSkillRequirement
      iRarity=v.item.rarity
      mg.vContext[iIndex][iSubIndex]=v
      iSubIndex=iSubIndex+1
    end
  end
  EA_Window_ContextMenu.Finalize(EA_Window_ContextMenu.CONTEXT_MENU_1);
end

function mg.ContextSubMenu()
  mg.iContextIdx=WindowGetId(SystemData.MouseOverWindow.name)
  EA_Window_ContextMenu.CreateContextMenu("",EA_Window_ContextMenu.CONTEXT_MENU_2)
  for k,v in pairs(mg.vContext[mg.iContextIdx]) do
    AddContextItem(v,EA_Window_ContextMenu.CONTEXT_MENU_2,k)
  end
  EA_Window_ContextMenu.Finalize(EA_Window_ContextMenu.CONTEXT_MENU_2);
end

function mg.ContextItem()
  local nSlot,nLoc,vItem=mg.GetSlotByItemId(mg.vContext[mg.iContextIdx][WindowGetId(SystemData.MouseOverWindow.name)].item.uniqueID)
  mg.AddCraftingItem(3,mg.iContextPlot,nSlot,nLoc) 
  EA_Window_ContextMenu.Hide(1)
  EA_Window_ContextMenu.Hide(2)
end

function mg.ContextHover()
  Tooltips.CreateItemTooltip(mg.vContext[mg.iContextIdx][WindowGetId(SystemData.MouseOverWindow.name)].item,SystemData.MouseOverWindow.name,Tooltips.ANCHOR_WINDOW_RIGHT)
end


function mg.CreateFillAll(id)
  mg.iContextPlot=id
  EA_Window_ContextMenu.CreateContextMenu(mg.sWindowName,nil,mg.GetPhrase("cmenus","fillalltitle"))
  EA_Window_ContextMenu.AddMenuItem(mg.GetPhrase("cmenus","fillallvendor"),mg.ContextFillAll,false,true);
  EA_Window_ContextMenu.AddMenuItem(mg.GetPhrase("cmenus","fillallrhya"),mg.ContextFillAll,false,true);
  EA_Window_ContextMenu.Finalize();
end


--Fill all additives
function mg.ContextFillAll()
  local id=WindowGetId(SystemData.MouseOverWindow.name)
  local vPlot=GetCultivationInfo(mg.iContextPlot)
  local iTemp
  local nSlot,nLoc,vItem
  if (vPlot.StageNum==1) and (vPlot.Additives[2].uniqueID==0) then
    local vTry={184983,184982,190549,184931,190546,184925,184919,184916,184910}
    iTemp=4
    if id==2 then
      iTemp=1
    end
    for i=iTemp,9 do
      nSlot,nLoc,vItem=mg.GetSlotByItemId(vTry[i])
      if nSlot~=0 then
        if vItem.craftingSkillRequirement<=GameData.TradeSkillLevels[GameData.TradeSkills.CULTIVATION] then
          mg.AddCraftingItem(3,mg.iContextPlot,nSlot,nLoc) 
          break
        end
      end
    end
  end
  if (vPlot.StageNum<=2) and (vPlot.Additives[3].uniqueID==0) then
    local vTry={184955,184952,190547,184949,184946,184934}
    for i=1,6 do
      nSlot,nLoc,vItem=mg.GetSlotByItemId(vTry[i])
      if nSlot~=0 then
        if vItem.craftingSkillRequirement<=GameData.TradeSkillLevels[GameData.TradeSkills.CULTIVATION] then
          mg.AddCraftingItem(3,mg.iContextPlot,nSlot,nLoc) 
          break
        end
      end
    end
  end
  if (vPlot.StageNum<=3) and (vPlot.Additives[4].uniqueID==0) then
    local vTry={184981,184978,190548,184975,184966,184958}
    for i=1,6 do
      nSlot,nLoc,vItem=mg.GetSlotByItemId(vTry[i])
      if nSlot~=0 then
        if vItem.craftingSkillRequirement<=GameData.TradeSkillLevels[GameData.TradeSkills.CULTIVATION] then
          mg.AddCraftingItem(3,mg.iContextPlot,nSlot,nLoc) 
          break
        end
      end
    end
  end
end

--=============
-- List Stuff
--=============

local function ListSort(a,b)
  if a.item.craftingSkillRequirement<b.item.craftingSkillRequirement then
    return true
  elseif a.item.craftingSkillRequirement>b.item.craftingSkillRequirement then
    return false
  else
    if a.item.rarity<b.item.rarity then
      return true
    elseif a.item.rarity>b.item.rarity then
      return false
    else
      if a.effect<b.effect then
        return true
      elseif a.effect>b.effect then
        return false
      else
        return a.item.name<b.item.name
      end
    end
  end
end

function mg.GetList(iType)
  local vBagItems=DataUtils.GetItems();
  local vList={};
  local vOut={};
  local iMax=mg.vSettings.maxlvl;
  local vLang
  if mg.bCIT then
	  vLang=CraftValueTip.T[CraftValueTip.Language]
  end
  if iMax==0 then
    iMax=GameData.TradeSkillLevels[GameData.TradeSkills.CULTIVATION];
  end
  for k,v in pairs(vBagItems) do
    if (v.cultivationType==iType) or ((iType==GameData.CultivationTypes.SEED) and (v.cultivationType==GameData.CultivationTypes.SPORE)) then
      if (v.craftingSkillRequirement<=iMax) and (v.craftingSkillRequirement>=mg.vSettings.minlvl) then
        if vList[v.uniqueID] then
          vList[v.uniqueID].count=vList[v.uniqueID].count+v.stackCount
        else
          vList[v.uniqueID]={}
          vList[v.uniqueID].count=v.stackCount
          vList[v.uniqueID].item=v
          vList[v.uniqueID].effect=L""
          if mg.bCIT then
		        if(CraftValueTip.SeedList[v.uniqueID]) then
		          if(CraftValueTip.SeedList[v.uniqueID][2])then
			          vList[v.uniqueID].effect=vLang.ItemTypes["prof4"][CraftValueTip.SeedList[v.uniqueID][3]]
		          else
			          vList[v.uniqueID].effect=vLang.EffectNames[CraftValueTip.SeedList[v.uniqueID][3]]
		          end
		        end
          end
        end
      end
    end
  end
  if mg.TYPE_CRAFTING then
    vBagItems=DataUtils.GetCraftingItems()
    for k,v in pairs(vBagItems) do
      if (v.cultivationType==iType) or ((iType==GameData.CultivationTypes.SEED) and (v.cultivationType==GameData.CultivationTypes.SPORE)) then
        if (v.craftingSkillRequirement<=iMax) and (v.craftingSkillRequirement>=mg.vSettings.minlvl) then
          if vList[v.uniqueID] then
            vList[v.uniqueID].count=vList[v.uniqueID].count+v.stackCount
          else
            vList[v.uniqueID]={}
            vList[v.uniqueID].count=v.stackCount
            vList[v.uniqueID].item=v
            vList[v.uniqueID].effect=L""
            if mg.bCIT then
		          if(CraftValueTip.SeedList[v.uniqueID]) then
		            if(CraftValueTip.SeedList[v.uniqueID][2])then
			            vList[v.uniqueID].effect=vLang.ItemTypes["prof4"][CraftValueTip.SeedList[v.uniqueID][3]]
		            else
			            vList[v.uniqueID].effect=vLang.EffectNames[CraftValueTip.SeedList[v.uniqueID][3]]
		            end
		          end
            end
          end
        end
      end
    end
  end
  for k,v in pairs(vList) do
    table.insert(vOut,v)
  end
  table.sort(vOut,ListSort)
  return vOut;
end

--==============
-- Events
--==============

function mg.onRClick()
  EA_Window_ContextMenu.CreateContextMenu(mg.sWindowName)
  EA_Window_ContextMenu.AddMenuItem(mg.GetPhrase("cmenus","config"),mg.ToggleRClick,false,true);
  EA_Window_ContextMenu.Finalize();
end

function mg.onClickSeed()    
  local cul
  local id = WindowGetId(WindowGetParent(SystemData.ActiveWindow.name))
  if (id<1) or (id>4) then
    return
  end
  cul=GetCultivationInfo(id);
  if cul.StageNum==0 then
    BuildContextMenu(mg.GetList(GameData.CultivationTypes.SEED),id)
  elseif cul.StageNum<4 then
    mg.CreateFillAll(id)
  end
end

function mg.onClickSoil()    
  local cul
  local id = WindowGetId(WindowGetParent(SystemData.ActiveWindow.name))
  if (id<1) or (id>4) then
    return
  end
  cul=GetCultivationInfo(id);
  if (cul.StageNum>0) and (cul.StageNum<2) and (cul.Additives[2].uniqueID==0) then
    BuildContextMenu(mg.GetList(GameData.CultivationTypes.SOIL),id)
  end
end

function mg.onClickWater()    
  local cul
  local id = WindowGetId(WindowGetParent(SystemData.ActiveWindow.name))
  if (id<1) or (id>4) then
    return
  end
  cul=GetCultivationInfo(id);
  if (cul.StageNum>0) and (cul.StageNum<3) and (cul.Additives[3].uniqueID==0) then
    BuildContextMenu(mg.GetList(GameData.CultivationTypes.WATERCAN),id)
  end
end

function mg.onClickNutrient()    
  local cul
  local id = WindowGetId(WindowGetParent(SystemData.ActiveWindow.name))
  if (id<1) or (id>4) then
    return
  end
  cul=GetCultivationInfo(id);
  if (cul.StageNum>0) and (cul.StageNum<4) and (cul.Additives[4].uniqueID==0) then
    BuildContextMenu(mg.GetList(GameData.CultivationTypes.NUTRIENT),id)
  end
end



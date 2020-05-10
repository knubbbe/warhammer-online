--[[
  Crafting Info Tooltip v1.51

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.
]]--

--d("Main")

CraftValueTip={}

CraftValueTip.version=1.51

CraftValueTip.T={} --Phrases (T for text)

--CraftValueTip.settings
CraftValueTip.defaultSettings={
  enable=true,
  debug=false,
  language=0,
  seedplant=true,
  seeddye=true
}

--CraftValueTip.vLocal --The current language phrases
--CraftValueTip.Language --actual language in use

local function ShOut(sString)
  EA_ChatWindow.Print(towstring(sString))
end

function CraftValueTip.Initialize()
  if not CraftValueTip.settings then
    CraftValueTip.settings=CraftValueTip.defaultSettings
  end

  CraftValueTip.SetLanguage(CraftValueTip.settings.language)

  -- Load LibSlash and register commands	
	CraftValueTip.LoadAddon("LibSlash")
	if LibSlash then
		LibSlash.RegisterWSlashCmd("craftvaluetip", function(args) CraftValueTip.SlashCmd(args) end)
		EA_ChatWindow.Print(CraftValueTip.T[CraftValueTip.Language].Messages["Greeting"])
	end

	-- Load the crafting database
	--CraftValueTip.LoadAddon("Crafting DB")

  -- Hook the tooltip processing command
	CraftValueTip.OldFunc = Tooltips.SetItemTooltipData
	Tooltips.SetItemTooltipData = CraftValueTip.SetItemTooltipData

	CraftValueTip.InitConfig()

  -- Copy some phrases for compatibility with older addons dependant on CIT
  for k,v in pairs(CraftValueTip.T) do
    v.ItemTypes.prof3={}
    v.ItemTypes.prof4={}
    v.ItemTypes.prof5=v.ItemTypes.prof4
    for k2,v2 in pairs(v.ItemTypes) do
      if type(v2)=="wstring" then
        if string.sub(k2,1,4)=="cult" then
          v.ItemTypes.prof3["item"..string.sub(k2,5)]=v2
        else
          v.ItemTypes.prof4[k2]=v2
        end
      end
    end
    v.Prof.prof0=v.Prof.prof6
  end

--[[	
	-- If we have the crafting database, hook CreateItemTooltip to add comparison tips
	if CraftDB then
    CraftValueTip.OldCreateTT=Tooltips.CreateItemTooltip
    Tooltips.CreateItemTooltip=CraftValueTip.NewCreateTT
    -- Create comparison windows
    CreateWindow("CraftValueTipCompare",false)
  end
]]--
end

function CraftValueTip.SetLanguage(iLang)
  --0 means use default
  if iLang==0 then
    iLang=SystemData.Settings.Language.active
  end

  --First try specified language
  if CraftValueTip.T[iLang] then
    CraftValueTip.Language=iLang
    CraftValueTip.vLocal=CraftValueTip.T[CraftValueTip.Language]
    return true
  --Second try game language
  elseif CraftValueTip.T[SystemData.Settings.Language.active] then
    CraftValueTip.Language=SystemData.Settings.Language.active
    CraftValueTip.vLocal=CraftValueTip.T[CraftValueTip.Language]
    return false
  --Fall back to English
  else
    CraftValueTip.Language=1
    CraftValueTip.vLocal=CraftValueTip.T[CraftValueTip.Language]
    return false
  end
end

function CraftValueTip.GetPhrase(sType,sPhraseName,sSlot1,sSlot2,sSlot3,sSlot4,bIgnore)
  if (not CraftValueTip.vLocal[sType]) or (not CraftValueTip.vLocal[sType][sPhraseName]) then
    if bIgnore then
      return nil
    else
      d("CraftValueTip: Unknown phrase: "..sType.."."..sPhraseName)
      return L""
    end
  end
  local sResult=CraftValueTip.vLocal[sType][sPhraseName]
  if sSlot1 then
    sResult=wstring.gsub(sResult,L"{1}",towstring(sSlot1))
  end
  if sSlot2 then
    sResult=wstring.gsub(sResult,L"{2}",towstring(sSlot2))
  end
  if sSlot3 then
    sResult=wstring.gsub(sResult,L"{3}",towstring(sSlot3))
  end
  if sSlot4 then
    sResult=wstring.gsub(sResult,L"{4}",towstring(sSlot4))
  end
  
  return sResult
end

function CraftValueTip.LoadAddon(sModName)
	local _modules=ModulesGetData()
	for k,v in ipairs(_modules) do
		if v.name == sModName then
			if v.isEnabled and not v.isLoaded then
				ModuleInitialize(v.name)
			end
			return
		end
	end
end

function CraftValueTip.Shutdown ()
	Tooltips.SetItemTooltipData = CraftValueTip.OldFunc
end

function CraftValueTip.SlashCmd(args)
  if args==L"off" then
    ShOut(CraftValueTip.GetPhrase("Messages","TipOff"))
    CraftValueTip.settings.enable=false
  elseif args==L"on" then
    ShOut(CraftValueTip.GetPhrase("Messages","TipOn"))
    CraftValueTip.settings.enable=true
  elseif args==L"dev on" then
    ShOut(CraftValueTip.GetPhrase("Messages","DebugOn"))
    CraftValueTip.settings.debug=true
  elseif args==L"dev off" then
    ShOut(CraftValueTip.GetPhrase("Messages","DebugOff"))
    CraftValueTip.settings.debug=false
--[[
  elseif args==L"seed off" then
    ShOut(CraftValueTip.GetPhrase("Messages","SeedPlantOff"))
    ShOut(CraftValueTip.GetPhrase("Messages","SeedDyeOff"))
    CraftValueTip.settings.seedplant=false
    CraftValueTip.settings.seeddye=false
  elseif args==L"seed plant" then
    ShOut(CraftValueTip.GetPhrase("Messages","SeedPlantOn"))
    ShOut(CraftValueTip.GetPhrase("Messages","SeedDyeOff"))
    CraftValueTip.settings.seedplant=true
    CraftValueTip.settings.seeddye=false
  elseif args==L"seed pigment" then
    ShOut(CraftValueTip.GetPhrase("Messages","SeedPlantOff"))
    ShOut(CraftValueTip.GetPhrase("Messages","SeedDyeOn"))
    CraftValueTip.settings.seedplant=false
    CraftValueTip.settings.seeddye=true
  elseif args==L"seed both" then
    ShOut(CraftValueTip.GetPhrase("Messages","SeedPlantOn"))
    ShOut(CraftValueTip.GetPhrase("Messages","SeedDyeOn"))
    CraftValueTip.settings.seedplant=true
    CraftValueTip.settings.seeddye=true
]]--
  elseif args==L"dump" then
    if CraftValueTip.LastItem then
      CraftValueTip.CraftDump(CraftValueTip.LastItem)
    end
  elseif args==L"digest" then
    if CraftValueTip.LastItem then
      CraftValueTip.ItemDump(CraftValueTip.LastItem)
    end
   elseif args==L"lookup" then
    if CraftValueTip.LastItem then
      CraftValueTip.LookUpDump(CraftValueTip.LastItem)
   end
   elseif args==L"obj" then
     if CraftValueTip.LastItem then
       CraftValueTip.DumpObjInspector()
     end
   elseif (not args) or (args==L"") then
    CraftValueTip.DoConfig()
	
	
  else
    ShOut(CraftValueTip.GetPhrase("Messages","List0"))
    ShOut(CraftValueTip.GetPhrase("Messages","List1"))
    ShOut(CraftValueTip.GetPhrase("Messages","List2"))
    ShOut(CraftValueTip.GetPhrase("Messages","List3"))
    ShOut(CraftValueTip.GetPhrase("Messages","List4"))
    ShOut(CraftValueTip.GetPhrase("Messages","List5"))
    ShOut(CraftValueTip.GetPhrase("Messages","List6"))
--    ShOut(CraftValueTip.GetPhrase("Messages","List7"))
  end
end

--Compute data for tooltip
function CraftValueTip.SetItemTooltipData(sWindow,itemData, extraText, extraTextColor) 
  local vBonuses
  local vStats={}
  local vTemp
  local sType
  local nInfo
  
  --Save itemData for debug dump
  CraftValueTip.LastItem=itemData
  
  --Save the window in case we need to do a comparison tooltip
  --CraftValueTip.tooltipWindow=sWindow
  --CraftValueTip.ItemDump(itemData)
  --CraftValueTip.CraftDump(itemData)
  

  --Only proceed if this is a crafting item  
	if CraftValueTip.settings.enable and (itemData~=nil) and itemData.craftingBonus and itemData.craftingBonus[1] then
	  --Get the item bonuses
	
    vBonuses=CraftItemInfo.GetItemBonuses(itemData)

    --Get the type line
    sType=towstring(CraftItemInfo.GetItemLevelReq(itemData))..L" "..CraftItemInfo.GetItemFamily(itemData)
    vTemp=CraftItemInfo.GetItemType(itemData)
    if vTemp~=L"" then
      sType=sType..L" - "..vTemp
    end

    --Get the Effect
    vTemp=CraftItemInfo.GetItemEffect(itemData)
    if vTemp~=L"" then
      table.insert(vStats,vTemp)
    end

    --Get first instance of stats ordered by preference
    for k,v in ipairs(CraftValueTip.BonusPreference) do
      if(vBonuses[v])then
        vTemp,nInfo=CraftItemInfo.FormatBonus(v,vBonuses[v][1])
        if vTemp~=L"" then
          if ((nInfo==0) and (vBonuses[v][1]~=0))
              or ((nInfo<2) and CraftValueTip.settings.debug) then
            table.insert(vStats,vTemp)
          end
        end
        if nInfo~=2 then
          vBonuses[v][1]=nil
        end
      end
    end

    --Get first instance of remaining stats
    for k,v in pairs(vBonuses) do
      if v[1] then
        vTemp,nInfo=CraftItemInfo.FormatBonus(k,v[1])
        if vTemp~=L"" then
          if ((nInfo==0) and (v[1]~=0))
              or ((nInfo<2) and CraftValueTip.settings.debug) then
            table.insert(vStats,vTemp)
          end
        end
        if nInfo~=2 then
          v[1]=nil
        end
      end
    end

    --Get everything that's left
    for nBonus,v1 in pairs(vBonuses) do
      for k2,nValue in pairs(v1) do
        vTemp,nInfo=CraftItemInfo.FormatBonus(nBonus,nValue)
        if k2>1 then
          vTemp=L"#"..k2..L"> "..vTemp
        end
        if vTemp~=L"" then
          if ((nInfo==2)and(k2==1)) or CraftValueTip.settings.debug then
            table.insert(vStats,vTemp)
          end
        end
      end
    end

    --Create the tooltip
		vResult=CraftValueTip.OldFunc(sWindow,itemData,extraText,extraTextColor) 
		CraftValueTip.SetTooltipStats(sWindow,vStats)
		if(sType)then
      local x,y=WindowGetDimensions(sWindow.."Type")
      LabelSetText(sWindow.."Type",sType)
      local cx,cy=WindowGetDimensions(sWindow.."Type")
      y=cy-y
      cx,cy=WindowGetDimensions(sWindow)
      WindowSetDimensions(sWindow,cx,cy+y)
    end
    return vResult
    
  else
    return CraftValueTip.OldFunc(sWindow,itemData,extraText,extraTextColor)
	end

end

--Takes care of adding the stats to the tooltip after it's already been created
function CraftValueTip.SetTooltipStats(sWindow,vStatLines)
  local nCount=0
  local nHeight=5
  local nWidth=0;
  local x,y
  for k,v in ipairs(vStatLines) do
    nCount=nCount+1
    LabelSetText(sWindow.."StatBonus"..nCount.."Text",v)
--    if(wstring.byte(v)==wstring.byte(L"-"))then
--      LabelSetTextColor(sWindow.."StatBonus"..nCount.."Text",255,0,0)
--    end
    __,y=WindowGetDimensions(sWindow.."StatBonus"..nCount)
    nHeight=nHeight+y
    x,__=LabelGetTextDimensions(sWindow.."StatBonus"..nCount.."Text")
    if(x>nWidth)then
      nWidth=x
    end
  end
  WindowSetDimensions(sWindow.."StatBonus",nWidth,nHeight)
  x,y=WindowGetDimensions(sWindow)
  if(x<nWidth)then
    x=nWidth
  end
  WindowSetDimensions(sWindow,x,y+nHeight)
end

--Utillity function to create an itemlink tooltip without an itemlink
function CraftValueTip.ItemWindow(itemData)
  local itemId=itemData.uniqueID
  local windowName = "EA_ItemLinkWindow"..itemId

  -- Only allow one window per item
  if( DoesWindowExist( windowName ) )
  then
      -- Re-Showing the window will force it to the top of it's layer
      -- if it is behind annother window.
      WindowSetShowing( windowName, true )
      return
  end

  -- Cache a reference to the data
  EA_ChatWindow.HyperLinks.Items[ itemId ] = itemData

  -- Create the Window
  CreateWindowFromTemplate( windowName, "EA_Window_ItemLinkTemplate", "Root" )
  WindowSetId( windowName, itemId )

  -- Set the Data
  Tooltips.SetItemTooltipData( windowName.."Data", itemData, nil, nil )

  -- Size the Parent Window to the data's dimensions
  local x, y = WindowGetDimensions( windowName.."Data" )
  x = x + 12
  y = y + 12
  WindowSetDimensions( windowName, x, y )

  -- Position the window on the screen
  WindowAddAnchor( windowName, "center", "Root", "center", 0, 0 )
  WindowSetShowing( windowName, true )
end

--Utillity function to dump a table to the chat window
function CraftValueTip.CraftDump(thing, prefix)
	if not prefix then prefix = "" end
	for k,v in pairs(thing) do 
		local sLine
		sLine=towstring(prefix..k.." ["..type(v).."]")
		if(type(v)=="number") then
			sLine=sLine..v
		elseif(type(v)=="wstring") then
			sLine=sLine..v
		elseif(type(v)=="boolean") then
			if(v) then
				sLine=sLine..L"True"
			else
				sLine=sLine..L"False"
			end
		end
		ShOut(sLine)
		if type(v)=="table" then 
			CraftValueTip.CraftDump(v, "    "..prefix) 
		end 
	end 
end

function CraftValueTip.ItemDump(itemData)
  local sLine
  local vTable={}
  if(itemData==nil) then
    ShOut(L"<no item>")
    return
  end
  sLine=L"["..itemData.uniqueID..L"]"..itemData.name..L" lvl"..itemData.level..L"/"..itemData.iLevel

  if(itemData.craftingBonus and itemData.craftingBonus[1])then
    sLine=sLine..L" craftingBonus{"
    for k,v in pairs(itemData.craftingBonus) do
      if v.bonusValue>32767 then
        sLine=sLine..v.bonusReference..L"=-"..(65536-v.bonusValue)..L","
      else
        sLine=sLine..v.bonusReference..L"="..v.bonusValue..L","
      end
    end
    sLine=sLine..L"}"
  elseif(itemData.bonus and itemData.bonus[1])then
    sLine=sLine..L" bonus{"
    for k,v in pairs(itemData.bonus) do
      sLine=sLine..k..L"={t="..v.type..L",v="..v.value..L",cTL="..(v.cooldownTimeLeft or L"nil")..L",r="..v.reference..L",tCT="..(v.totalCooldownTime or L"nil")..L"},"
    end
    sLine=sLine..L"}"
  end
  
	ShOut(sLine)
end

function CraftValueTip.LookUpDump(itemData)
  local sLine
  local vTable={}
  if(itemData==nil) then
    ShOut(L"<no item>")
    return
  end
  sLine=L"["..itemData.uniqueID..L"]"..itemData.name..L" lvl"..itemData.level..L"/"..itemData.iLevel
  ShOut(sLine)
end


--These functions provide easier macro access to the slash commands
function CraftValueTip.Dump()
  CraftValueTip.CraftDump(CraftValueTip.LastItem)
end

function CraftValueTip.Digest()
  CraftValueTip.ItemDump(CraftValueTip.LastItem)
end

function CraftValueTip.LookUpDump()
  CraftValueTip.CraftLookUpDump(CraftValueTip.LastItem)
end



function CraftValueTip.DumpObjInspector()
    if(ObjectInspector)	then
		ObjectInspector.DisplayObject(CraftValueTip.LastItem,''..CraftValueTip.LastItem.uniqueID)
	end
end


--[[
local function CreateSeedComparisonTooltip(sAnchor,iPlantID,iPigmentID)
  local vPlant=CraftDB.GetItem(iPlantID)
  local vPigment=CraftDB.GetItem(iPigmentID)
  local sCompWin="CraftValueTipCompare1";
  local bShowTip=false
  WindowSetShowing("CraftValueTipCompare2",false)
  
  if vPlant and CraftValueTip.settings.seedplant then
    Tooltips.SetItemTooltipData(sCompWin,vPlant)
    sCompWin="CraftValueTipCompare2"
    bShowTip=true
  end
  if vPigment and CraftValueTip.settings.seeddye then
    Tooltips.SetItemTooltipData(sCompWin,vPigment)
    if sCompWin=="CraftValueTipCompare2" then
      WindowSetShowing("CraftValueTipCompare2",true)
    end
    bShowTip=true
  end
  if bShowTip then
    Tooltips.AddExtraWindow("CraftValueTipCompare",sAnchor,nil)
  end
end

--Create comparison tooltips for seeds
function CraftValueTip.NewCreateTT(itemData, mouseoverWindow, anchor, disableComparison, extraText, extraTextColor, ignoreBroken)
  CraftValueTip.tooltipWindow=nil
  CraftValueTip.OldCreateTT(itemData, mouseoverWindow, anchor, disableComparison, extraText, extraTextColor, ignoreBroken)
  if CraftValueTip.settings.enable and CraftDB and CraftValueTip.SeedList[itemData["uniqueID"] ] then
    CreateSeedComparisonTooltip(CraftValueTip.tooltipWindow,CraftValueTip.SeedList[itemData.uniqueID][4],CraftValueTip.SeedList[itemData.uniqueID][5])
  end
end

]]--
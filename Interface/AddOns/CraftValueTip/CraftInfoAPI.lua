--[[
  Crafting Info Tooltip v1.50

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.

  This file, CraftInfoAPI.lua, defines functions that any addon can use to get 
  information about crafting items
]]--

--This is the version number of the crafting API
local nAPIVersion=1.50
--This is the version number of the earliest version that this version is 100%
--  backwards compatable with.
local nAPIBackwards=1.40

CraftItemInfo={}

--This table maps bonuses from name to number, to enhance code readability
CraftItemInfo.bonus={
  STABILITY=1,
  POWER=2,
  DURATION=3,
  MULTIPLIER=4,
  CRAFTING_FAMILY=5,
  EFFECT=6,
  SLOTS=7,
  TYPE=8,
  CRAFTING_LEVEL=9,
  GROW_TIME=10,
  YIELD=11,
  CRITICAL_CHANCE=12,
  FAIL_CHANCE=13,
  SPECIAL_CHANCE=14,
  DESTROY_ON_FAIL=15
}

local function ShOut(sString)
  EA_ChatWindow.Print(towstring(sString))
end

--For readability of the API code, we create a local reference to the above
--  variable with a short name
local BONUS=CraftItemInfo.bonus

--We use this function a ton, give it a short name
local GetPhrase=CraftValueTip.GetPhrase

--[[---------------------------------------------------------------------------
Function:   
Parameters: 
Returns:    
Notes:      
---------------------------------------------------------------------------]]--

--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetVersion
Parameters: <none>
Returns:    Version number of this API, which may be different from the version
              number of Crafting Info Tooltip
Notes:      <none>
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetVersion()
  return nAPIVersion
end

--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.CheckVersion
Parameters: nMinAware - Minimum version that the calling mod is aware of and
              compatable with
            nMaxAware - Maximum version that the calling mod is aware of and
              compatable with
Returns:    True if this version is compatable considering the parameters.
            If the API version is less than nMinAware, this function will
              return false
            If the API has become incompatable in any way with a program
              designed to use version nMaxAware, this function will return
              false
Notes:      <none>
---------------------------------------------------------------------------]]--
function CraftItemInfo.CheckVersion(nMinAware,nMaxAware)
  if nAPIVersion<nMinAware then
    return false
  end
  
  if nAPIBackwards>nMaxAware then
    return false
  end
  
  return true
end

--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetItemBonuses
Parameters: itemData - an item data table, such as the items in the table 
              returned by DataUtils.GetItems
Returns:    Table of crafting bonuses by bonus.  The bonus number is the key,
              each item is an array of values found.
Notes:      For all items and bonuses that I am aware of, the first value in 
              each array is the one that the game uses.
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetItemBonuses(itemData)
  local vResult={}
  --Verify that there are item bonuses to be had
  if type(itemData)~="table" or type(itemData.craftingBonus)~="table" then
    return vResult
  end

  --If we have cached results, use them
  if itemData.CraftItemInfo then
    return DataUtils.CopyTable(itemData.CraftItemInfo)
  end

  --Itterate through the craftingBonus table and form our easier-to-use version
  for k,v in pairs(itemData.craftingBonus) do
    if not vResult[v.bonusReference] then
      vResult[v.bonusReference]={}
    end
    --Bonus values in the itemData table are unsigned 16 bit; convert to signed
    if v.bonusValue>32767 then
      table.insert(vResult[v.bonusReference],v.bonusValue-65536)
    else
      table.insert(vResult[v.bonusReference],v.bonusValue)
    end
  end
  
  brokenItem=CraftItemInfo.getBrokenItem(itemData)
  if brokenItem then 
  
	  if vResult[BONUS.EFFECT] then 
			ShOut(L"Broken item has been fixed and needs to be removed:"..itemData.uniqueID)
	  else
		  for k,v in pairs(brokenItem) do
			  vResult[k]={}
			  table.insert(vResult[k],v)
		  
		  end
	  end
  end
  --Cache the results on the itemData so we can skip making them in the future
  itemData.CraftItemInfo=DataUtils.CopyTable(vResult)
  
  return vResult
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetItemFamily
Parameters: itemData - an item data table, such as the items in the table 
              returned by DataUtils.GetItems
Returns:    Localized wstring specifying the crafting skill(s) that use this
              item
Notes:      Currently, there are no items used by multiple crafting skills
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetItemFamily(itemData)
  local vData
  local sTemp
  local bFoundCult=false
  
  --Get crafting skills from craftingBonuses
  vData=CraftItemInfo.GetItemBonuses(itemData)
  if vData[BONUS.CRAFTING_FAMILY] then
    for k,v in ipairs(vData[BONUS.CRAFTING_FAMILY]) do
      if v==GameData.TradeSkills.CULTIVATION then
        bFoundCult=true
      end
      if sTemp then
        sTemp=sTemp..GetString(StringTables.Default.SYMBOL_LIST_SEPARATOR)..GetPhrase("Prof","prof"..tostring(v))
      else
        sTemp=GetPhrase("Prof","prof"..tostring(v))
      end
    end
  end

  --Sometimes cultivation appears as a family in the bonuses.  Sometimes it does not.  If it did not, deal with it
  if itemData.cultivationType and (itemData.cultivationType>0) and not bFoundCult then
    if sTemp then
      sTemp=sTemp..GetString(StringTables.Default.SYMBOL_LIST_SEPARATOR)..GetPhrase("Prof","prof"..GameData.TradeSkills.CULTIVATION)
    else
      sTemp=GetPhrase("Prof","prof"..GameData.TradeSkills.CULTIVATION)
    end
  end

  --In case we didn't find any
  if not sTemp then
    sTemp=L""
  end
    
  return sTemp
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetItemLevelReq
Parameters: itemData - an item data table, such as the items in the table 
              returned by DataUtils.GetItems
Returns:    Required skill level to use item, as reported in craftingBonus or
              craftingSkillRequirement
Notes:      There are two crafting skill levels on items.  This function will
              prefer the information in craftingBonus over 
              craftingSkillRequirement
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetItemLevelReq(itemData)
  local vData

  vData=CraftItemInfo.GetItemBonuses(itemData)
  if vData[BONUS.CRAFTING_LEVEL] then
    return vData[BONUS.CRAFTING_LEVEL][1]
  else
    return itemData.craftingSkillRequirement
  end
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetItemType
Parameters: itemData - an item data table, such as the items in the table 
              returned by DataUtils.GetItems
Returns:    Localized wstring specifying the crafting type of the item
Notes:      Returns L"" if the item type is unknown
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetItemType(itemData)
  local sTemp
  local vData
  
  --See if there's a cultivation type that we know
  if itemData.cultivationType and (itemData.cultivationType>0) then
    sTemp=GetPhrase("ItemTypes","cult"..tostring(itemData.cultivationType),nil,nil,nil,nil,true)
  end
  
  --See if there's a type from craftingBonuses that we know
  if not sTemp then
    vData=CraftItemInfo.GetItemBonuses(itemData)
    if vData[BONUS.TYPE] then
      sTemp=GetPhrase("ItemTypes","item"..tostring(vData[BONUS.TYPE][1]),nil,nil,nil,nil,true)
    end
  end
  
  --If we don't know the type, return an empty string
  if not sTemp then
    sTemp=L""
  end
  
  return sTemp
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetItemEffect
Parameters: itemData - an item data table, such as the items in the table 
              returned by DataUtils.GetItems
            bNoGrowsPrefix - optional. If true, cultivation effects will not
              be returned in the form L"Grows Multiplier"
Returns:    Localized wstring specifying the effect of the main ingredient
Notes:      Returns L"" if the item does not have an effect or is an unknown
              seed.  Returns in the form L"Effect=7" if the effect is unknown
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetItemEffect(itemData,bNoGrowsPrefix)
  local sTemp
  local vData
  
  if itemData.cultivationType and (itemData.cultivationType>0) then

    --If this is a seed or spore, look it up for the result
    if CraftValueTip.SeedList[itemData.uniqueID] then
      vData=CraftValueTip.SeedList[itemData.uniqueID]

      --We know this seed.  Check to see if it grows a main ingredient
      if vData[2] then
        --Not a main ingredient, return item type
        sTemp=GetPhrase("ItemTypes",vData[3])
      else
        --Main ingredient, return effect
        sTemp=GetPhrase("EffectNames",vData[3])
      end

      --Apply "Grows" formatting, if not disabled
      if bNoGrowsPrefix then
        return sTemp
      else
        return GetPhrase("Format","grows",sTemp)
      end
            
    else
      --Not a known seed
      return L""
    end

  else

    --Normal crafting item, check the craftingBonus
    vData=CraftItemInfo.GetItemBonuses(itemData)
    
	
	if  vData[BONUS.EFFECT] and vData[BONUS.CRAFTING_FAMILY] then
    
	  --We have an effect, get the string
      if (vData[BONUS.CRAFTING_FAMILY][1]==GameData.TradeSkills.APOTHECARY)
		  and CraftValueTip.ApothEffectList[vData[BONUS.EFFECT][1]] then
    
        --Known Apothecary effect
        sTemp=GetPhrase("EffectNames",CraftValueTip.ApothEffectList[vData[BONUS.EFFECT][1]])
        
        --If the effect is tiered, indicate which tier
        if CraftValueTip.ApothEffectTier[vData[BONUS.EFFECT][1]] then
          sTemp=GetPhrase("EffectTiers","tier"..CraftValueTip.ApothEffectTier[vData[BONUS.EFFECT][1]],sTemp)
        end

      elseif (vData[BONUS.CRAFTING_FAMILY][1]==GameData.TradeSkills.TALISMAN)
          and CraftValueTip.TalEffectList[vData[BONUS.EFFECT][1]] then

        --Known Talisman Making effect
        sTemp=GetPhrase("EffectNames",CraftValueTip.TalEffectList[vData[BONUS.EFFECT][1]])

        --If the effect is tiered, indicate which tier
        if CraftValueTip.TalEffectTier[vData[BONUS.EFFECT][1]] then
          sTemp=GetPhrase("EffectTiers","tier"..CraftValueTip.TalEffectTier[vData[BONUS.EFFECT][1]],sTemp)
        end

      else

        --Unknown, so use "Effect="
        sTemp=GetPhrase("Format","effect",towstring(vData[BONUS.EFFECT][1]))

      end
      return sTemp
    else
      --No effect
      return L""
    end
  end
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetItemEffectOrType
Parameters: itemData - an item data table, such as the items in the table 
              returned by DataUtils.GetItems
            bNoGrowsPrefix - optional. If true, cultivation effects will not
              be returned in the form L"Grows Multiplier"
Returns:    Localized wstring specifying the effect of the main ingredient
Notes:      Returns item effect, if any, or item type otherwise
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetItemEffectOrType(itemData,bNoGrowsPrefix)
  local sTemp
  
  --Check for an effect
  sTemp=CraftItemInfo.GetItemEffect(itemData,bNoGrowsPrefix)
  
  --If no effect, get item type
  if sTemp==L"" then
    sTemp=CraftItemInfo.GetItemType(itemData)
  end
  
  return sTemp
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetBonusName
Parameters: nBonusNumber - the number of the bonus to identify
Returns:    Localized wstring for the specified bonus
Notes:      nBonusNumber will be the key from the table returned by
              CraftItemInfo.GetItemBonuses.  If the bonus is unknown, return
              will be in the form L"Bonus 6" (though this is localizable)
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetBonusName(nBonusNumber)
  local sTemp
  
  --See if we have a name for this bonus
  sTemp=GetPhrase("Bonuses","bonus"..tostring(nBonusNumber),nil,nil,nil,nil,true)
  
  --If we don't, use a generic form
  if not sTemp then
    sTemp=GetPhrase("Format","bonus",towstring(nBonusNumber))
  end

  return sTemp
end

--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.FormatBonus
Parameters: nBonusNumber - the number of the bonus (which bonus)
            nBonusValue - the value of the bonus
Returns:    1)Localized wstring for the specified bonus and value.
            2)Comment on nBonusNumber:
              0 - Normal bonus
              1 - Suggest you skip this one (less useful information)
              2 - Unknown bonus
              3 - Better retrieved with another function (Family, Type, Effect)
Notes:      The format depends on the bonus.  Effects will always be in the 
              form L"Effect 7" (because processing the effect requires extra
              information)
            Binary bonuses will return L"" if false
---------------------------------------------------------------------------]]--
function CraftItemInfo.FormatBonus(nBonusNumber,nBonusValue)
  local sTemp
  if nBonusNumber==BONUS.CRAFTING_FAMILY then
    sTemp=GetPhrase("Prof","prof"..tostring(nBonusValue),nil,nil,nil,nil,true)
    if sTemp then
      sTemp=CraftItemInfo.GetBonusName(nBonusNumber)..L" "..sTemp
    else
      sTemp=CraftItemInfo.GetBonusName(nBonusNumber)..L" "..towstring(nBonusValue)
    end
    return sTemp,3
  
  elseif nBonusNumber==BONUS.TYPE then
    sTemp=GetPhrase("ItemTypes","item"..tostring(nBonusValue),nil,nil,nil,nil,true)
    if sTemp then
      sTemp=CraftItemInfo.GetBonusName(nBonusNumber)..L" "..sTemp
    else
      sTemp=CraftItemInfo.GetBonusName(nBonusNumber)..L" "..towstring(nBonusValue)
    end
    return sTemp,3
  
  elseif nBonusNumber==BONUS.CRAFTING_LEVEL
      or nBonusNumber==BONUS.EFFECT then
    --These bonuses are "BonusName BonusValue"
    sTemp=CraftItemInfo.GetBonusName(nBonusNumber)..L" "..towstring(nBonusValue)
    return sTemp,3
    
  elseif nBonusNumber==BONUS.SLOTS then
    --These bonuses are "BonusValue BonusName"
    sTemp=L""..towstring(nBonusValue)..L" "..CraftItemInfo.GetBonusName(nBonusNumber)
    return sTemp,1
    
  elseif nBonusNumber==BONUS.DESTROY_ON_FAIL then
    --These bonuses are binary: "BonusValue"
    if nBonusValue==0 then
      sTemp=L""
    else
      sTemp=CraftItemInfo.GetBonusName(nBonusNumber)
    end
    return sTemp,1
    
  elseif nBonusNumber==BONUS.GROW_TIME then
    --These bonuses are inverted percentages: "-BonusValue% BonusName"  
    if nBonusValue<=0 then
      sTemp=L"+"..-towstring(nBonusValue)..L"% "..CraftItemInfo.GetBonusName(nBonusNumber)
    else
      sTemp=L""..-towstring(nBonusValue)..L"% "..CraftItemInfo.GetBonusName(nBonusNumber)
    end
    return sTemp,0
    
  elseif nBonusNumber==BONUS.CRITICAL_CHANCE
      or nBonusNumber==BONUS.SPECIAL_CHANCE
      or nBonusNumber==BONUS.FAIL_CHANCE then
    --These bonuses are percentages: "+BonusValue% BonusName"
    if nBonusValue<0 then
      sTemp=L""..towstring(nBonusValue)..L"% "..CraftItemInfo.GetBonusName(nBonusNumber)
    else
      sTemp=L"+"..towstring(nBonusValue)..L"% "..CraftItemInfo.GetBonusName(nBonusNumber)
    end
    return sTemp,0
    
  else
    --These are normal bonuses: "+BonusValue BonusName"
    if nBonusValue<0 then
      sTemp=L""..towstring(nBonusValue)..L" "..CraftItemInfo.GetBonusName(nBonusNumber)
    else
      sTemp=L"+"..towstring(nBonusValue)..L" "..CraftItemInfo.GetBonusName(nBonusNumber)
    end
    if GetPhrase("Bonuses","bonus"..tostring(nBonusNumber),nill,nill,nill,nill,true) then
      return sTemp,0
    else
      return sTemp,2
    end
    
  end
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetPlantFromSeed
Parameters: seedID - uniqueID of the seed or spore
Returns:    1) uniqueID of the plant it will grow, or 0 if unknown
            2) whether the plant will reap into this seed or spore
Notes:      
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetPlantFromSeed(seedID)
  if CraftValueTip.SeedList[seedID] then
    return CraftValueTip.SeedList[seedID][4],(CraftValueTip.SeedList[seedID][1]=="std")
  end
  return 0,false
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetPigmentFromSeed
Parameters: seedID - uniqueID of the seed or spore
Returns:    uniqueID of the pigment it will grow, or 0 if unknown
Notes:      
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetPigmentFromSeed(seedID)
  if CraftValueTip.SeedList[seedID] then
    return CraftValueTip.SeedList[seedID][5]
  end
  return 0
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetSeedFromPlant
Parameters: plantID - uniqueID of the plant
Returns:    uniqueID of the seed or spore that the plant will reap into, or
              0 if unreapable or unknown
Notes:      
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetSeedFromPlant(plantID)
  for k,v in pairs(CraftValueTip.SeedList) do
    if (v[4]==plantID) and (v[1]=="std") then
      return k
    end
  end
  return 0
end


--[[---------------------------------------------------------------------------
Function:   CraftItemInfo.GetSeedsToProduce
Parameters: uniqueID - uniqueID of the plant or pigment to check
Returns:    array of seed/spores that will produce the specified item, or an
              empty table if none known
Notes:      
---------------------------------------------------------------------------]]--
function CraftItemInfo.GetSeedsToProduce(uniqueID)
  local vResult={}
  for k,v in pairs(CraftValueTip.SeedList) do
    if (v[4]==uniqueID) or (v[5]==uniqueID) then
      table.insert(vResult,k)
    end
  end
  return vResult
end

function CraftItemInfo.getBrokenItem(itemData)
   return CraftValueTip.BrokenItems[itemData.uniqueID]
     
end


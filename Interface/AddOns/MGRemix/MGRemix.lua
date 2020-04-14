--[[
  MGRemix (Miracle Grow Remix) version 2.33
  by Irinia of Volkmar
  MGRemix puts all the functionality of the cultivation interface into a small
  window.  Also added are quick item selection and one-click repeat
--]]


--==================
-- Data
--==================

--Our global name is MiracleGrow2, but use mg internally to keep things short
MiracleGrow2 = {}
local mg=MiracleGrow2

mg.nVersion=2.33

--Localization stuff
mg.T={} --Phrases (T for text)
--mg.vLocal --The current language phrases
--mg.nLanguage --Actual language in use


mg.sWindowName = "MiracleGrow2";

--Do we have a valid Crafting Info Tooltip version?
mg.bCIT=false

--These are the default settings
function mg.DefaultSettings()
  return {
    version=mg.nVersion,--Version of settings
    reserve=false,  --Keep a reserve?
    seedreserve=4,  --Number of seeds to maintain as a safety stock
    sound=true,     --Play sounds
    minlvl=0,       --Minimum level items to show
    maxlvl=0,       --Maximum level items to show
    showing=true,   --Show window?
    soundnum=211,   --Stage sound
    soundnum2=215,  --Completion sound
    throb=true,     --Get attention when all plots are ready
    throbc={255,0,0},
    language=0,     --Language to use
    showtoggle=false,--whether to show toggle button for the main window
    boxlayout={     --The position of all the UI elements
      [1]={3,0},
      [2]={8,0},
      [3]={13,0},
      [4]={18,0},
      [5]={25,0},
      [6]={32,0},
      [7]={32,0},
      [8]={23,1},
      [9]={31,1},
      [10]={0,1}
    },
    layout={        --General UI sizes
      dimx=39,        --plot width
      dimy=5,         --plot height
      progdimx1=24,   --progress bar corner 1
      progdimy1=0,
      progdimx2=39,   --progress bar corner 2
      progdimy2=5,
      spacing=5,      --space between plots
      arrange=1,      --plot arrangement
      count=4,        --number of plots
      border=false,   --separate plots with line
    },
    progress={
      arrange=2,      --progress bar direction
      texture=1,      --progress bar texture set
      fill={          --foreground color
        ["r"]=192,
        ["g"]=192,
        ["b"]=192,
        ["a"]=255
      },
      back={          --background color
        ["r"]=64,
        ["g"]=48,
        ["b"]=32,
        ["a"]=255
      },
    },
    boxvis={
      [1]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [2]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [3]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [4]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [8]={[0]=false,[1]=true,[2]=true,[3]=false,[4]=false},
      [9]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [10]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
    },
  }
end
--We create this variable or it loads from saved settings
--mg.vSettings

--This is used to keep track of when to make noise
mg.aiSoundStage={255,255,255,255}

--This is used to determine if we need to redraw
mg.aiLastState={-1,-1,-1,-1}

mg.bThrobbing=false --Getting attention?
mg.nThrobState=0

mg.nMaxTime={-1,-1,-1,-1}

--==================
-- Util functions
--==================

--Shorthand to output stuff in the chatbox
local function ShOut(line)
  EA_ChatWindow.Print(towstring(line))
end

--The API requires slot numbers.  We work with uniqueIDs
function mg.GetSlotByItemId(uniqueID,aExclude)
  local vBagItems=DataUtils.GetItems()
  local iSmall=10000
  local iSlot=0
  local nLoc=0
  local vItem
  for k,v in pairs(vBagItems) do
    if (v.uniqueID==uniqueID) and (v.stackCount<iSmall) then
      if (not aExclude) or (not aExclude[mg.TYPE_INVENTORY][k]) then
        iSlot=k
        iSmall=v.stackCount
        nLoc=mg.TYPE_INVENTORY
        vItem=v
      end
    end
  end
  if mg.TYPE_CRAFTING then
    vBagItems=DataUtils.GetCraftingItems()
    for k,v in pairs(vBagItems) do
      if (v.uniqueID==uniqueID) and (v.stackCount<iSmall) then
        if (not aExclude) or (not aExclude[mg.TYPE_CRAFTING][k]) then
          iSlot=k
          iSmall=v.stackCount
          nLoc=mg.TYPE_CRAFTING
          vItem=v
        end
      end
    end
  end
  return iSlot,nLoc,vItem
end

function mg.RefineItem(uniqueID,nCount)
  local nSlot,nLoc,vItem
  local aExclude={
    [mg.TYPE_INVENTORY]={},
  }
  local nLeft=nCount
  if mg.TYPE_CRAFTING then
    aExclude[mg.TYPE_CRAFTING]={}
  end
  --d("refine "..uniqueID.." "..nCount)
  while nLeft>0 do
    nSlot,nLoc,vItem=mg.GetSlotByItemId(uniqueID,aExclude)
    --d("found "..nLoc.." "..nSlot)
--    d(nSlot)
--    d(aExclude)
    if nSlot~=0 then
      aExclude[nLoc][nSlot]=true
      local nGlobalLoc=mg.GetCursorForBackpack(nLoc)
      if vItem and vItem.isRefinable then
        if vItem.stackCount>nLeft then
          for i=1,nLeft do
            --d(" use "..nGlobalLoc.." "..nSlot)
            SendUseItem(nGlobalLoc,nSlot,0,0,0)
          end
          nLeft=0
        else
          nLeft=nLeft-vItem.stackCount
          for i=1,vItem.stackCount do
            --d(" use "..nGlobalLoc.." "..nSlot)
            SendUseItem(nGlobalLoc,nSlot,0,0,0)
          end
        end
      end
    else
      return
    end
  end
end

---------------------------
-- Init stuff
---------------------------
function mg.Initialize()
  if not mg.vSettings then
    mg.vSettings=mg.DefaultSettings()
  else
    mg.UpdateSettings()
  end

  if EA_Window_Backpack.POCKET_MAIN_INVENTORY_INDEX then
    mg.TYPE_INVENTORY=EA_Window_Backpack.POCKET_MAIN_INVENTORY_INDEX
  else
    mg.TYPE_INVENTORY=EA_Window_Backpack.TYPE_INVENTORY
  end
  mg.TYPE_CRAFTING=EA_Window_Backpack.TYPE_CRAFTING
  
  mg.SetLanguage(mg.vSettings.language)
    
  -- Load LibSlash and register commands	
	mg.LoadAddon("LibSlash")
	if LibSlash then
	  LibSlash.RegisterSlashCmd("mg",mg.DoCommand)
	  LibSlash.RegisterSlashCmd("mgremix",mg.DoCommand)
	  LibSlash.RegisterSlashCmd("MiracleGrow2",mg.DoCommand)
	end
	
	mg.LoadAddon("Crafting Info Tooltip")
	if CraftValueTip and CraftValueTip.version and (CraftValueTip.version>=1.23) then
	  mg.bCIT=true
	end
	
	LayoutEditor.RegisterWindow(mg.sWindowName,mg.GetPhrase("general","mgremix"),mg.GetPhrase("general","mgremixdesc"), false, false, true, nil)

  WindowSetShowing(mg.sWindowName.."Icon",mg.vSettings.showtoggle)
  if mg.vSettings.showtoggle then
	  LayoutEditor.RegisterWindow(mg.sWindowName.."Icon",L"MGRemix",mg.GetPhrase("tooltips","togglewindow"), false, false, true, nil)
	end

	--Make sure we update if the stage changes
  WindowRegisterEventHandler(mg.sWindowName,SystemData.Events.PLAYER_CULTIVATION_UPDATED,"MiracleGrow2.onCultUpdate");
  --Explicitly load the cultivation data on zone-in
	RegisterEventHandler(SystemData.Events.LOADING_END,"MiracleGrow2.onZone")
	--Make sure we update if there's new inventory
	RegisterEventHandler(SystemData.Events.PLAYER_INVENTORY_SLOT_UPDATED,"MiracleGrow2.onInvChange")
  if mg.TYPE_CRAFTING then
	  RegisterEventHandler(SystemData.Events.PLAYER_CRAFTING_SLOT_UPDATED,"MiracleGrow2.onInvChange")
	end

  mg.HRInit()

  mg.InitConfig()
  
  mg.LayoutMainWindow()
end

function mg.LoadAddon(sModName)
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

function mg.UpdateSettings()
  local vDefaults=mg.DefaultSettings()
  local vClassic=mg.DefaultClassic()
  --Force the complaint when the version changes and optional dependancies are missing
  if mg.vSettings.version~=mg.nVersion then
    mg.vSettings.bRunOnce=false
  end
  
  --Convert 2.14 to 2.15
  if not mg.vSettings.version then
    mg.vSettings.seedreserve=vDefaults.seedreserve
    mg.vSettings.version=2.15
  end
  --Convert 2.15 to 2.16
  if mg.vSettings.version<2.16 then
    mg.vSettings.language=0
    mg.vSettings.version=2.16
  end
  
  --Convert 2.16 to 2.18
  if mg.vSettings.version<2.18 then
    if mg.vSettings.seedreserve and (mg.vSettings.seedreserve>0) then
      mg.vSettings.reserve=true
    else
      mg.vSettings.reserve=false
      mg.vSettings.seedreserve=4
    end
    if not mg.vSettings.minlvl or (mg.vSettings.minlvl==1) then
      mg.vSettings.minlvl=0
    end
    mg.vSettings.throbc={255,0,0}
    mg.vSettings.version=2.18
  end
  
  --Convert 2.18 to 2.19
  if mg.vSettings.version<2.19 then
    mg.vSettings.showtoggle=false
    mg.vSettings.version=2.19
  end
  
  --Convert 2.19 to 2.20
  --  If we're upgrading, we use classic layout instead of default
  if mg.vSettings.version<2.20 then
    mg.vSettings.boxlayout=vClassic.boxlayout
    mg.vSettings.layout=vClassic.layout
    mg.vSettings.progress=vClassic.progress
    mg.vSettings.boxvis=vClassic.boxvis
    mg.vSettings.version=2.20
  end
  
  mg.vSettings.version=mg.nVersion
  if not mg.VerifySettings() then
    ShOut(L"MiracleGrow Remix has that its settings are corrupt. All settings have been reset to default.")
    mg.vSettings=mg.DefaultSettings()
  end
end

local function Check(vVar,sType,nMin,mMax)
  if vVar==nil or (type(vVar)~=sType) then
    return false
  end
  if nMin and (vVar<nMin) then
    return false
  end
  if nMax and (vVar>nMax) then
    return false
  end
  return true
end

function mg.VerifySettings()
  local vS=mg.vSettings
  --Verify all top-level settings
  if not (Check(vS.version,"number",2,3) 
     and Check(vS.reserve,"boolean") 
     and Check(vS.seedreserve,"number",0)
     and Check(vS.sound,"boolean")
     and Check(vS.minlvl,"number",0,200) 
     and Check(vS.maxlvl,"number",0,200) 
     and Check(vS.showing,"boolean") 
     and Check(vS.soundnum,"number")
     and Check(vS.soundnum2,"number") 
     and Check(vS.throb,"boolean") 
     and Check(vS.throbc,"table") 
     and Check(vS.language,"number",0)
     and Check(vS.showtoggle,"boolean") 
     and Check(vS.boxlayout,"table")
     and Check(vS.layout,"table")
     and Check(vS.progress,"table")
     and Check(vS.boxvis,"table")
     ) then
    return false
  end
  --Verify Throb color
  if not(Check(vS.throbc[1],"number",0,255)
     and Check(vS.throbc[2],"number",0,255)
     and Check(vS.throbc[3],"number",0,255)
     ) then
    return false
  end
  --Verify layout
  if not(Check(vS.layout.dimx,"number",0,50)
     and Check(vS.layout.dimy,"number",0,50)
     and Check(vS.layout.progdimx1,"number",0,50)
     and Check(vS.layout.progdimy1,"number",0,50)
     and Check(vS.layout.progdimx2,"number",0,50)
     and Check(vS.layout.progdimy2,"number",0,50)
     and Check(vS.layout.spacing,"number",0,1000)
     and Check(vS.layout.arrange,"number",1,3)
     and Check(vS.layout.count,"number",1,4)
     and Check(vS.layout.border,"boolean")
     ) then
    return false
  end
  --Verify progress main
  if not(Check(vS.progress.arrange,"number",1,5)
     and Check(vS.progress.texture,"number",0,#mg.vTexCombo)
     and Check(vS.progress.fill,"table")
     and Check(vS.progress.back,"table")
     ) then
    return false
  end
  --Verify progress tints
  if not(Check(vS.progress.fill.r,"number",0,255)
     and Check(vS.progress.fill.g,"number",0,255)
     and Check(vS.progress.fill.b,"number",0,255)
     and Check(vS.progress.fill.a,"number",0,255)
     and Check(vS.progress.back.r,"number",0,255)
     and Check(vS.progress.back.g,"number",0,255)
     and Check(vS.progress.back.b,"number",0,255)
     and Check(vS.progress.back.a,"number",0,255)
     ) then
    return false
  end
  return true
end

function mg.SetLanguage(nLang)
  --0 means use default
  if nLang==0 then
    nLang=SystemData.Settings.Language.active
  end

  --First try specified language
  if mg.T[nLang] then
    mg.nLanguage=nLang
    mg.vLocal=mg.T[mg.nLanguage]
    mg.HRSetLang()
    return true
  --Second try game language
  elseif mg.T[SystemData.Settings.Language.active] then
    mg.nLanguage=SystemData.Settings.Language.active
    mg.vLocal=mg.T[mg.nLanguage]
    mg.HRSetLang()
    return false
  --Fall back to English
  else
    mg.nLanguage=1
    mg.vLocal=mg.T[mg.nLanguage]
    mg.HRSetLang()
    return false
  end
end

function mg.GetPhrase(sType,sPhraseName,sSlot1,sSlot2,sSlot3,sSlot4)
  if (not mg.vLocal[sType]) or (not mg.vLocal[sType][sPhraseName]) then
    d("MGRemix: Unknown phrase: "..sType.."."..sPhraseName)
    return L""
  end
  local sResult=mg.vLocal[sType][sPhraseName]
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

---------------------------
-- Script Commands
---------------------------
function mg.show()
	WindowSetShowing(mg.sWindowName, true);
	mg.vSettings.showing=true;
  mg.ForceUpdate()
end

function mg.hide()
  WindowSetShowing(mg.sWindowName, false);
	mg.vSettings.showing=false;
end

function mg.toggle()
  if mg.vSettings.showing then
    mg.hide()
  else
    mg.show()
  end
end

function mg.reserve(nCount)
  if nCount ~= nil then
    if nCount>0 then
      mg.vSettings.reserve=true
      mg.vSettings.seedreserve=nCount;
      ShOut(mg.GetPhrase("messages","reserve",nCount))
    else
      mg.vSettings.reserve=false
      ShOut(mg.GetPhrase("messages","reserveoff"))
    end  
  end  
end

---------------------------
-- Dependancy notification
---------------------------
function mg.onMouseOver()
  if mg.vSettings.bRunOnce then
    return
  end
  mg.Complain()
  mg.vSettings.bRunOnce=true
end

function mg.Complain()
  local bComplain=false
  local bCIT=false
  local sComplaint=L""
  if not LibSlash then
    sComplaint=sComplaint..L"\n\n"..mg.GetPhrase("rant","libsnoinstall")..L"  "..mg.GetPhrase("rant","libs1")
    bComplain=true
  end
  if not CraftValueTip then
    sComplaint=sComplaint..L"\n\n"..mg.GetPhrase("rant","citnoinstall")..L"  "
    bCIT=true
    bComplain=true
  elseif (not CraftValueTip.version) or (CraftValueTip.version<1.23) then
    sComplaint=sComplaint..L"\n\n"..mg.GetPhrase("rant","citupdate")..L"  "..mg.GetPhrase("rant","version",1.23)..L"  "
    bCIT=true
    bComplain=true
  end
  if bCIT then
    sComplaint=sComplaint..mg.GetPhrase("rant","cit1")
  end
  if bComplain then
--    d(sComplaint)
    sComplaint=mg.GetPhrase("rant","rantprefix")..sComplaint..L"\n\n"..mg.GetPhrase("rant","rantpostfix")
    DialogManager.MakeOneButtonDialog(sComplaint,GetString(StringTables.Default.LABEL_OKAY))
  end
end

--------------------------
-- Command Stuff
--------------------------

function mg.DoCommand(input)
  local args=mg.explode(" ",input);
  if args[1] == "hide" then
    mg.hide()
  elseif args[1] == "show" then
    mg.show()
  elseif args[1] == "sound" then
    if args[2] == "on" then
      mg.vSettings.sound=true;
      ShOut(mg.GetPhrase("messages","soundon"))
    else
      mg.vSettings.sound=false;
      ShOut(mg.GetPhrase("messages","soundoff"))
    end
  elseif args[1] == "throb" then
    if args[2] == "on" then
      mg.vSettings.throb=true;
      ShOut(mg.GetPhrase("messages","throbon"))
    else
      mg.vSettings.throb=false;
      ShOut(mg.GetPhrase("messages","throboff"))
    end
  elseif args[1] == "minlvl" then
    local tmp = tonumber(args[2])
    if tmp ~=nil and tmp <= 200 and tmp >=0 then
      mg.vSettings.minlvl=tmp;
      ShOut(mg.GetPhrase("messages","minlvl",tmp))
    else
      ShOut(mg.GetPhrase("messages","minlvlerr"))
    end 
  elseif args[1] == "maxlvl" then
    local tmp = tonumber(args[2])
    if tmp ~=nil and tmp <= 200 and tmp > 0 then
      mg.vSettings.maxlvl=tmp;
      ShOut(mg.GetPhrase("messages","maxlvl",tmp))
    else
      if tmp ~=nil and tmp == 0 then
        mg.vSettings.maxlvl=tmp;
        ShOut(mg.GetPhrase("messages","maxlvldef"))
      else
        ShOut(mg.GetPhrase("messages","maxlvlerr"))
      end
    end 
  elseif args[1] == "soundnum" then
    local tmp = tonumber(args[2])
    if tmp ~= nil then
      mg.vSettings.soundnum=tmp
    end  
  elseif args[1] == "soundnum2" then
    local tmp = tonumber(args[2])
    if tmp ~= nil then
      mg.vSettings.soundnum2=tmp
    end  
  elseif args[1] == "playsound" then
    local tmp = tonumber(args[2])
    if tmp ~= nil then
      PlaySound(tmp);
    end  
  elseif args[1] == "reserve" then
    local tmp = tonumber(args[2])
    if tmp ~= nil then
      if tmp>0 then
        mg.vSettings.reserve=true
        mg.vSettings.seedreserve=tmp
        ShOut(mg.GetPhrase("messages","reserve",tmp))
      else
        mg.vSettings.reserve=false
        ShOut(mg.GetPhrase("messages","reserveoff"))
      end  
    end
  elseif args[1]=="" then
    IraConfig.Open(mg.nConfigTab)
  else
    ShOut(mg.GetPhrase("messages","help1",mg.nVersion))
    ShOut(mg.GetPhrase("messages","help2"))
    ShOut(mg.GetPhrase("messages","help0"))
    ShOut(mg.GetPhrase("messages","help3"))
    ShOut(mg.GetPhrase("messages","help4"))
    ShOut(mg.GetPhrase("messages","help5"))
    ShOut(mg.GetPhrase("messages","help6"))
    ShOut(mg.GetPhrase("messages","help7"))
    ShOut(mg.GetPhrase("messages","help8"))
    ShOut(mg.GetPhrase("messages","help9"))
    ShOut(mg.GetPhrase("messages","help10"))
    ShOut(mg.GetPhrase("messages","help11"))
    ShOut(mg.GetPhrase("messages","help12"))
    if mg.bCIT then
      ShOut(mg.GetPhrase("messages","help13"))
    end
  end  
end


function mg.explode(div,str)
  if (div=='') then return false end
  local pos,arr = 0,{}
  for st,sp in function() return string.find(str,div,pos,true) end do
    table.insert(arr,string.sub(str,pos,st-1)) 
    pos = sp + 1
  end
  table.insert(arr,string.sub(str,pos))
  return arr
end

--------------------------
-- Tooltips
--------------------------
function mg.onHoverSeed()
	local name = SystemData.MouseOverWindow.name
  local id = WindowGetId(WindowGetParent(name))
  local plotData=GetCultivationInfo(id)
  if plotData.Seed.uniqueID~=0 then
    Tooltips.CreateItemTooltip(plotData.Seed,name,Tooltips.ANCHOR_WINDOW_VARIABLE)
  else
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.GetPhrase("tooltips","addseed"))
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
	end
end

function mg.onHoverSoil()
	local name = SystemData.MouseOverWindow.name
  local id = WindowGetId(WindowGetParent(name))
  local plotData=GetCultivationInfo(id)
  if plotData.Additives[2].uniqueID~=0 then
    Tooltips.CreateItemTooltip(plotData.Additives[2],name,Tooltips.ANCHOR_WINDOW_VARIABLE)
  else
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.GetPhrase("tooltips","addsoil"))
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
	end
end

function mg.onHoverWater()
	local name = SystemData.MouseOverWindow.name
  local id = WindowGetId(WindowGetParent(name))
  local plotData=GetCultivationInfo(id)
  if plotData.Additives[3].uniqueID~=0 then
    Tooltips.CreateItemTooltip(plotData.Additives[3],name,Tooltips.ANCHOR_WINDOW_VARIABLE)
  else
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.GetPhrase("tooltips","addwater"))
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
	end
end

function mg.onHoverNutrient()
	local name = SystemData.MouseOverWindow.name
  local id = WindowGetId(WindowGetParent(name))
  local plotData=GetCultivationInfo(id)
  if plotData.Additives[4].uniqueID~=0 then
    Tooltips.CreateItemTooltip(plotData.Additives[4],name,Tooltips.ANCHOR_WINDOW_VARIABLE)
  else
    Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.GetPhrase("tooltips","addnut"))
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
	end
end

--------------------------
-- Events
--------------------------

--Called every tick
function mg.OnUpdate(nTimeElapsed)
  local bAllIdle=true
  local bHarvestReady=false
  --Let the harvest/repeat stuff do its stuff
  mg.HRUpdate(nTimeElapsed)
  --Update plot times and stuff
  for i=1,4 do
  	mg.UpdatePlot(i);
  end

  if mg.LayoutUpdate then
    mg.LayoutUpdate(nTimeElapsed)
  end

  --Below stuff is graphical, so if graphics aren't displayed...
  if not WindowGetShowing(mg.sWindowName) then
    return
  end
  --If we're configured to throb, process that   
  if mg.vSettings.throb then
    for i=1,4 do
      if mg.aiSoundStage[i]==4 then
        bHarvestReady=true
      elseif (mg.aiSoundStage[i]~=0) and (mg.aiSoundStage[i]~=5) then
        bAllIdle=false
      end
    end
  end
  if bAllIdle and bHarvestReady then
    local nColor
    local nCycleTime=3
    if not mg.bThrobbing then
      mg.bThrobbing=true
      mg.nThrobState=0
    end
    --figure out where in the cycle we are
    mg.nThrobState=mg.nThrobState+nTimeElapsed
    while mg.nThrobState>nCycleTime do
      mg.nThrobState=mg.nThrobState-nCycleTime
    end
    
    --figure out the color
    if mg.nThrobState>(nCycleTime/2) then
      nColor=(nCycleTime-mg.nThrobState)/nCycleTime*2
    else
      nColor=mg.nThrobState/nCycleTime*2
    end
    
	  WindowSetTintColor(mg.sWindowName.."BackgroundBackground",mg.vSettings.throbc[1]*nColor,mg.vSettings.throbc[2]*nColor,mg.vSettings.throbc[3]*nColor)
  elseif mg.bThrobbing then
    mg.bThrobbing=false
	  WindowSetTintColor(mg.sWindowName.."BackgroundBackground",0,0,0)
  end
  
end

--Set the window visibility, force cultivation information availablity
function mg.onZone()
--  d("Zone")
	if GameData.TradeSkillLevels[GameData.TradeSkills.CULTIVATION] == 0 then
		WindowSetShowing(mg.sWindowName, false);
	else
	  if mg.vSettings.showing then
  		WindowSetShowing(mg.sWindowName, true);
    else
  		WindowSetShowing(mg.sWindowName, false);
  	end
		CultivationWindow.InitAllPlots()  --This forces the cultivation data to load
    mg.ForceUpdate()
	end
end

--If we are explicity told the cultivation state has changed, be sure we reflect the change
function mg.onCultUpdate(culslot)
  mg.ForceUpdate()
	mg.UpdatePlot(culslot)
end

--Whether we can repeat is dependant on our inventory, so...
function mg.onInvChange(updatedSlots)
  mg.ForceUpdate()
end


------------------------
-- Update stuff
------------------------

--Make noise if it's time
local function Noise(iPlot,iStage)
  if mg.aiSoundStage[iPlot]==255 then
    mg.aiSoundStage[iPlot]=iStage;
    return
  end
  if mg.aiSoundStage[iPlot]~=iStage then
    mg.aiSoundStage[iPlot]=iStage;
    if mg.vSettings.sound then
      if (iStage==2) or (iStage==3) then
        PlaySound(mg.vSettings.soundnum);
      elseif (iStage==4) then
        PlaySound(mg.vSettings.soundnum2);
      end
    end  
  end
end

--Force a full update for all plots
function mg.ForceUpdate()
  for i=1,4 do
    mg.aiLastState[i]=-1
  end
end

--Update a plot
function mg.UpdatePlot(i)
	local vPlot=GetCultivationInfo(i);
  local sBaseName=mg.sWindowName.."Plant"..i
  local nType
  local iStageNum=vPlot.StageNum
  local iState

  if iStageNum>4 then
    iStageNum=5
  end
  if vPlot.Seed.cultivationType==5 then
    nType=2
  else
    nType=1
  end

  if iStageNum==0 then
    mg.nMaxTime[i]=-1
  elseif iStageNum>3 then
    --ignore in this stage
  else
    if mg.nMaxTime[i]==-1 then
      mg.nMaxTime[i]=vPlot.TotalTimer
    end
    if WindowGetShowing(mg.sWindowName) then
      LabelSetText(sBaseName.."Time",vPlot.TotalTimer..L"s");
	    LabelSetText(sBaseName.."Stage",vPlot.StageTimer..L"s");
	    if mg.vSettings.progress.arrange>1 then
	      local x,y=WindowGetDimensions(mg.sWindowName.."Plant"..i.."Bar")
	      x=x-(x*vPlot.TotalTimer/mg.nMaxTime[i])
	      y=y-(y*vPlot.TotalTimer/mg.nMaxTime[i])
	      WindowSetDimensions(mg.sWindowName.."Plant"..i.."BarFill",x,y)
	    end
	  end
  end

  ----------------------
  -- Guard the more CPU intensive stuff with a check for anything different
  
  iState=iStageNum
  if vPlot.Additives[2].uniqueID~=0 then
    iState=iState+16
  end
  if vPlot.Additives[3].uniqueID~=0 then
    iState=iState+32
  end
  if vPlot.Additives[4].uniqueID~=0 then
    iState=iState+64
  end
  if iState==mg.aiLastState[i] then
    return
  end
  mg.aiLastState[i]=iState

  --We do this here so it only happens when something changes
  mg.PioritizePlots()

  ----------------------
  -- Do harvest-related updating
  mg.HRUpdatePlot(i,vPlot)
  
  ----------------------
  -- If the window is showing, make noise and set icons
  if not WindowGetShowing(mg.sWindowName) then
    return
  end
  Noise(i,iStageNum)
  mg.SetVisibility(i,iStageNum)

  ---------------------
  -- Seed icon
	local vSeedSlices={
	  [1]={
	    [0]={813,200,1},
	    [1]={529,373,.45},
	    [2]={529,447,.45},
	    [3]={455,447,.45},
	    [4]={455,447,.45},
	    [5]={948,707,1},
	  },
	  [2]={
	    [0]={813,200,1},
	    [1]={432,817,.45},
	    [2]={506,817,.45},
	    [3]={580,817,.45},
	    [4]={580,817,.45},
	    [5]={948,707,1},
	  }
	}
  DynamicImageSetTexture(sBaseName.."ButtonSeedIcon","EA_Cultivating01_d5",vSeedSlices[nType][iStageNum][1],vSeedSlices[nType][iStageNum][2])
	DynamicImageSetTextureScale(sBaseName.."ButtonSeedIcon",vSeedSlices[nType][iStageNum][3])

  ---------------------
  -- Dirt icon	
  if iStageNum==5 then
    DynamicImageSetTextureSlice(sBaseName.."ButtonSoilIcon","Black-Slot");
	elseif vPlot.Additives[2].uniqueID==0 then
    DynamicImageSetTextureSlice(sBaseName.."ButtonSoilIcon","Dirt-Slot");
	else
	  DynamicImageSetTextureSlice(sBaseName.."ButtonSoilIcon","Dirt");
	end

  ---------------------
  -- Water icon	
  if iStageNum==5 then
    DynamicImageSetTextureSlice(sBaseName.."ButtonWaterIcon","Black-Slot");
  elseif vPlot.Additives[3].uniqueID==0 then
    DynamicImageSetTextureSlice(sBaseName.."ButtonWaterIcon","WaterDrop-Slot");
  else
    DynamicImageSetTextureSlice(sBaseName.."ButtonWaterIcon","WaterDrop");
  end

  ---------------------
  -- Nutrient icon	
  if iStageNum==5 then
    DynamicImageSetTextureSlice(sBaseName.."ButtonNutrientIcon","Black-Slot");
  elseif vPlot.Additives[4].uniqueID==0 then
	  DynamicImageSetTextureSlice(sBaseName.."ButtonNutrientIcon","GreenCross-Slot");
	else
	  DynamicImageSetTextureSlice(sBaseName.."ButtonNutrientIcon","GreenCross");
	end

  ---------------------
  -- The colors
  local vFrames={
    [0]="Seed",
    [1]="Soil",
    [2]="Water",
    [3]="Nutrient",
  }

  for k,v in pairs(vFrames) do
    if iStageNum==k then
	    WindowSetTintColor(sBaseName.."Button"..v,DefaultColor.GREEN.r,DefaultColor.GREEN.g,DefaultColor.GREEN.b)
    else
	    WindowSetTintColor(sBaseName.."Button"..v,DefaultColor.RED.r,DefaultColor.RED.g,DefaultColor.RED.b)
    end
  	WindowSetTintColor(sBaseName.."Button"..v.."Icon",DefaultColor.ZERO_TINT.r,DefaultColor.ZERO_TINT.g,DefaultColor.ZERO_TINT.b)
  end

  ---------------------
  -- Harvest icons

  if nType==2 then
    DynamicImageSetTexture(sBaseName.."HarvestIcon","EA_Cultivating01_d5",761,512);
    DynamicImageSetTexture(sBaseName.."HarvestRepeatIcon","EA_Cultivating01_d5",761,512);
  else
    DynamicImageSetTexture(sBaseName.."HarvestIcon","EA_Cultivating01_d5",829,0);
    DynamicImageSetTexture(sBaseName.."HarvestRepeatIcon","EA_Cultivating01_d5",829,0);
  end
	DynamicImageSetTextureScale(sBaseName.."HarvestIcon",.125)

end

function mg.ToggleClick()
  mg.toggle()
end

function mg.ToggleRClick()
  IraConfig.Open(mg.nConfigTab)
end

function mg.ToggleHover()
	WindowSetAlpha(mg.sWindowName.."IconLight",.1)
  Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name,mg.GetPhrase("tooltips","togglewindow"))
  Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_VARIABLE)
end

function mg.ToggleNoHover()
	WindowSetAlpha(mg.sWindowName.."IconLight",0)
end

function mg.SetVisibility(nPlot,nStageNum)
  for k,v in ipairs(mg.vBoxData) do
    --Only control windows that we control...
    if mg.vSettings.boxvis[k] then
      --If we control it, should it be visible?
      if mg.vSettings.boxlayout[k] and (mg.vSettings.boxvis[k][nStageNum] or (nStageNum>4)) then
        WindowSetShowing(mg.sWindowName.."Plant"..nPlot..v.win,true)
      else
        WindowSetShowing(mg.sWindowName.."Plant"..nPlot..v.win,false)
      end
    end
  end
  if (nStageNum>0) and (nStageNum<4) then
    WindowSetShowing(mg.sWindowName.."Plant"..nPlot.."Bar",true)
  else
    WindowSetShowing(mg.sWindowName.."Plant"..nPlot.."Bar",false)
  end
end

function mg.AddCraftingItem(nSkill,nData,nSlot,nBag)
  if mg.TYPE_CRAFTING then
    AddCraftingItem(nSkill,nData,nSlot,nBag)
  else
    AddCraftingItem(nSkill,nData,nSlot)
  end
end

function mg.GetCursorForBackpack(nBackpackType)
  if EA_Window_Backpack.GetCursorForBackpack then
    return EA_Window_Backpack.GetCursorForBackpack(nBackpackType)
  else
    return GameData.ItemLocs.INVENTORY
  end
end

--[[
  MGRemix (Miracle Grow Remix) version 2.30
  by Irinia of Volkmar
  MGRemix puts all the functionality of the cultivation interface into a small
  window.  Also added are quick item selection and one-click repeat
  
  This file contains stuff related to the presets config tab
--]]
local mg=MiracleGrow2

function mg.DefaultClassic()
  return {
    boxlayout={     --The position of all the UI elements
      [1]={0,0},
      [2]={5,0},
      [3]={10,0},
      [4]={15,0},
      [5]={22,0},
      [6]={29,0},
      [7]={29,0},
      [8]={20,1},
      [9]={28,1},
    },
    layout={        --General UI sizes
      dimx=36,        --plot width
      dimy=5,         --plot height
      progdimx1=21,   --progress bar corner 1
      progdimy1=0,
      progdimx2=36,   --progress bar corner 2
      progdimy2=5,
      spacing=5,      --space between plots
      arrange=1,      --plot arrangement
      count=4,        --number of plots
      border=false,   --separate plots with line
    },
    progress={
      arrange=1,      --progress bar direction
      texture=1,      --progress bar texture set
      fill={          --foreground color
        ["r"]=255,
        ["g"]=255,
        ["b"]=255,
        ["a"]=255
      },
      back={          --background color
        ["r"]=64,
        ["g"]=64,
        ["b"]=64,
        ["a"]=255
      },
    },
    boxvis={
      [1]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [2]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [3]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [4]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [8]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [9]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [10]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
    },
  }
end

local function PresetPlantMe()
  return {
    boxlayout={     --The position of all the UI elements
      [1]={19,0},
      [2]={19,0},
      [3]={19,0},
      [4]={19,0},
      [5]={19,0},
      [6]={1,0},
      [7]={1,0},
      [8]={9,1},
      [9]={0,1},
    },
    layout={        --General UI sizes
      dimx=27,        --plot width
      dimy=5,         --plot height
      progdimx1=0,   --progress bar corner 1
      progdimy1=0,
      progdimx2=17,   --progress bar corner 2
      progdimy2=5,
      spacing=8,      --space between plots
      arrange=1,      --plot arrangement
      count=4,        --number of plots
      border=false,   --separate plots with line
    },
    progress={
      arrange=1,      --progress bar direction
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
      [1]={[0]=true,[1]=false,[2]=false,[3]=false,[4]=false},
      [2]={[0]=false,[1]=true,[2]=false,[3]=false,[4]=false},
      [3]={[0]=false,[1]=false,[2]=true,[3]=false,[4]=false},
      [4]={[0]=false,[1]=false,[2]=false,[3]=true,[4]=false},
      [8]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [9]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [10]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
    },
  }
end

local function PresetCompact()
  return {
    boxlayout={     --The position of all the UI elements
      [1]={3,1},
      [5]={3,1},
      [6]={10,1},
      [7]={10,1},
      [9]={5,2},
      [10]={0,2},
    },
    layout={        --General UI sizes
      dimx=17,        --plot width
      dimy=7,         --plot height
      progdimx1=3,   --progress bar corner 1
      progdimy1=1,
      progdimx2=15,   --progress bar corner 2
      progdimy2=6,
      spacing=0,      --space between plots
      arrange=1,      --plot arrangement
      count=1,        --number of plots
      border=true,   --separate plots with line
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
      [1]={[0]=true,[1]=false,[2]=false,[3]=false,[4]=false},
      [2]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [3]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [4]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [8]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [9]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [10]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
    },
  }
end

local function PresetVert()
  return {
    boxlayout={     --The position of all the UI elements
      [1]={0,19},
      [2]={0,9},
      [3]={0,14},
      [4]={0,4},
      [5]={0,26},
      [6]={0,32},
      [7]={0,32},
      [10]={1,0},
    },
    layout={        --General UI sizes
      dimx=5,        --plot width
      dimy=37,         --plot height
      progdimx1=0,   --progress bar corner 1
      progdimy1=4,
      progdimx2=5,   --progress bar corner 2
      progdimy2=24,
      spacing=5,      --space between plots
      arrange=2,      --plot arrangement
      count=4,        --number of plots
      border=false,   --separate plots with line
    },
    progress={
      arrange=4,      --progress bar direction
      texture=0,      --progress bar texture set
      fill={          --foreground color
        ["r"]=0,
        ["g"]=255,
        ["b"]=0,
        ["a"]=128
      },
      back={          --background color
        ["r"]=64,
        ["g"]=48,
        ["b"]=32,
        ["a"]=128
      },
    },
    boxvis={
      [1]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [2]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [3]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [4]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [8]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [9]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [10]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
    },
  }
end

local function PresetLargeBar()
  return {
    boxlayout={     --The position of all the UI elements
      [1]={0,0},
      [2]={5,0},
      [3]={10,0},
      [4]={15,0},
      [5]={22,0},
      [6]={29,0},
      [7]={29,0},
      [8]={20,1},
      [9]={28,1},
    },
    layout={        --General UI sizes
      dimx=36,        --plot width
      dimy=5,         --plot height
      progdimx1=0,   --progress bar corner 1
      progdimy1=0,
      progdimx2=36,   --progress bar corner 2
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
        ["r"]=255,
        ["g"]=255,
        ["b"]=255,
        ["a"]=128
      },
      back={          --background color
        ["r"]=64,
        ["g"]=64,
        ["b"]=64,
        ["a"]=128
      },
    },
    boxvis={
      [1]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [2]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [3]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [4]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
      [8]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [9]={[0]=false,[1]=true,[2]=true,[3]=true,[4]=false},
      [10]={[0]=true,[1]=true,[2]=true,[3]=true,[4]=true},
    },
  }
end


function mg.InitPresets()
end

function mg.ConfigCallbackPresets(nMessage)
  local sWin=mg.sWindowName.."Preset"
  local nTemp
  if nMessage==IraConfig.CALLBACK_OPEN then
    LabelSetText(sWin.."SettingsSection",mg.GetPhrase("config","tabsettings"))
    LabelSetText(sWin.."SettingsLabel",mg.GetPhrase("config","presetdefault"))
    ButtonSetText(sWin.."SettingsButton",mg.GetPhrase("config","presetgo"))
    LabelSetText(sWin.."LayoutSection",mg.GetPhrase("config","tablayout"))
    ComboBoxClearMenuItems(sWin.."LayoutSelection")
    ComboBoxAddMenuItem(sWin.."LayoutSelection",mg.GetPhrase("config","presetdefault"))
    ComboBoxAddMenuItem(sWin.."LayoutSelection",mg.GetPhrase("config","presetlayclassic"))
    ComboBoxAddMenuItem(sWin.."LayoutSelection",mg.GetPhrase("config","presetlayplantme"))
    ComboBoxAddMenuItem(sWin.."LayoutSelection",mg.GetPhrase("config","presetlaycompact"))
    ComboBoxAddMenuItem(sWin.."LayoutSelection",mg.GetPhrase("config","presetlayvert"))
    ComboBoxAddMenuItem(sWin.."LayoutSelection",mg.GetPhrase("config","presetlaylargebar"))
    ButtonSetText(sWin.."LayoutButton",mg.GetPhrase("config","presetgo"))

  elseif nMessage==IraConfig.CALLBACK_RESET then
    ComboBoxSetSelectedMenuItem(sWin.."LayoutSelection",1)
  end
end

function mg.PresetSettings()
  local vDefaults=mg.DefaultSettings()
  if vDefaults.showtoggle~=mg.vSettings.showtoggle then
    if vDefaults.showtoggle then
      WindowSetShowing(mg.sWindowName.."Icon",true)
	    LayoutEditor.RegisterWindow(mg.sWindowName.."Icon",L"MGRemix",mg.GetPhrase("tooltips","togglewindow"),false,false,true,nil)
    else
      WindowSetShowing(mg.sWindowName.."Icon",false)
	    LayoutEditor.UnregisterWindow(mg.sWindowName.."Icon")
    end
  end
  mg.vSettings.reserve=vDefaults.reserve
  mg.vSettings.seedreserve=vDefaults.seedreserve
  mg.vSettings.sound=vDefaults.sound
  mg.vSettings.minlvl=vDefaults.minlvl
  mg.vSettings.showing=vDefaults.showing
  mg.vSettings.soundnum=vDefaults.soundnum
  mg.vSettings.soundnum2=vDefaults.soundnum2
  mg.vSettings.throb=vDefaults.throb
  mg.vSettings.throbc=vDefaults.throbc
  mg.vSettings.language=vDefaults.language
  mg.vSettings.showtoggle=vDefaults.showtoggle
  IraConfig.SetActiveTab(mg.sWindowName.."SettingsTabs",1)
  mg.SetLanguage(mg.vSettings.language)
  mg.ConfigCallback(IraConfig.CALLBACK_OPEN,nTab)
  mg.ConfigCallback(IraConfig.CALLBACK_RESET,nTab)
  mg.ConfigCallback(IraConfig.CALLBACK_SAVE,nTab)
end

function mg.PresetLayout()
  local vLayout
  local nPreset=ComboBoxGetSelectedMenuItem(mg.sWindowName.."PresetLayoutSelection")
  if nPreset==2 then
    --Remix classic
    vLayout=mg.DefaultClassic()
  elseif nPreset==3 then
    --plantme classic
    vLayout=PresetPlantMe()
  elseif nPreset==4 then
    --compact
    vLayout=PresetCompact()
  elseif nPreset==5 then
    --vertical
    vLayout=PresetVert()
  elseif nPreset==6 then
    --big progress bar
    vLayout=PresetLargeBar()
  else
    --default
    vLayout=mg.DefaultSettings()
  end
  mg.vSettings.boxlayout=vLayout.boxlayout
  mg.vSettings.layout=vLayout.layout
  mg.vSettings.progress=vLayout.progress
  mg.vSettings.boxvis=vLayout.boxvis
  IraConfig.SetActiveTab(mg.sWindowName.."SettingsTabs",2)
  mg.ConfigCallback(IraConfig.CALLBACK_RESET,nTab)
  mg.ConfigCallback(IraConfig.CALLBACK_SAVE,nTab)
end

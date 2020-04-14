--[[
  Crafting Info Tooltip v1.27

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.
  
  This file contains everything related to the config UI
--]]

function CraftValueTip.InitConfig()
  local x,y
  CreateWindow("CraftValueTipConfig",false)
  CraftValueTip.nConfigTab=IraConfig.RegisterAddon(L"CraftTip",CraftValueTip.GetPhrase("config","tabtip"),"CraftValueTipConfig",CraftValueTip.ConfigCallback)

  CraftValueTip.ConfigCallback(IraConfig.CALLBACK_OPEN,CraftValueTip.nConfigTab)
end

function CraftValueTip.DoConfig()
  IraConfig.Open(CraftValueTip.nConfigTab)
end

function CraftValueTip.ConfigCallback(nMessage,nTab)
  local x,y
  local sWin="CraftValueTipConfig"
  if nMessage==IraConfig.CALLBACK_OPEN then
    LabelSetText(sWin.."Version",CraftValueTip.GetPhrase("config","version",CraftValueTip.version))
    LabelSetText(sWin.."LanguageLabel",CraftValueTip.GetPhrase("config","language"))
    LabelSetText(sWin.."ShowLabel",CraftValueTip.GetPhrase("config","showinfo"))
    LabelSetText(sWin.."ShowDevLabel",CraftValueTip.GetPhrase("config","showdev"))
    ComboBoxClearMenuItems(sWin.."Language")
    ComboBoxAddMenuItem(sWin.."Language",CraftValueTip.GetPhrase("config","langdefault"))
    CraftValueTip.vLangMapFwd={[0]=1}
    CraftValueTip.vLangMapRev={[1]=0}
    local i=2
    for k,v in pairs(CraftValueTip.T) do
      CraftValueTip.vLangMapFwd[k]=i
      CraftValueTip.vLangMapRev[i]=k
      i=i+1
      ComboBoxAddMenuItem(sWin.."Language",v.config.langthis)
    end
  elseif nMessage==IraConfig.CALLBACK_RESET then
    ButtonSetPressedFlag(sWin.."ShowButton",CraftValueTip.settings.enable)
    ButtonSetPressedFlag(sWin.."ShowDevButton",CraftValueTip.settings.debug)
    if CraftValueTip.vLangMapFwd[CraftValueTip.settings.language] then
      ComboBoxSetSelectedMenuItem(sWin.."Language",CraftValueTip.vLangMapFwd[CraftValueTip.settings.language])
    else
      ComboBoxSetSelectedMenuItem(sWin.."Language",1)
    end
  elseif nMessage==IraConfig.CALLBACK_SAVE then
    CraftValueTip.settings.enable=ButtonGetPressedFlag(sWin.."ShowButton")
    CraftValueTip.settings.debug=ButtonGetPressedFlag(sWin.."ShowDevButton")
    --Language
    local nLangSel=tonumber(ComboBoxGetSelectedMenuItem(sWin.."Language"))
    if CraftValueTip.vLangMapRev[nLangSel]~=CraftValueTip.settings.language then
      if CraftValueTip.vLangMapRev[nLangSel] then
        CraftValueTip.settings.language=CraftValueTip.vLangMapRev[nLangSel]
      else
        CraftValueTip.settings.language=0
      end
      CraftValueTip.SetLanguage(CraftValueTip.settings.language)
      CraftValueTip.ConfigCallback(IraConfig.CALLBACK_OPEN,nTab)
      CraftValueTip.ConfigCallback(IraConfig.CALLBACK_RESET,nTab)
    end
  end
end

-- Make Squared table ref local for performance
local Squared = Squared

local WindowSetGameActionData = WindowSetGameActionData
local SetMacroData = SetMacroData

local unitframeMacroName = L"AssistUnitframe"
local unitframeMacroId = -1

local function GetMacroId(aWString)
	local macros = DataUtils.GetMacros()
	for slot = 1, EA_Window_Macro.NUM_MACROS do
		if macros[slot].name == aWString or macros[slot].text == aWString then return slot end
	end
	return nil
end

local function CreateMacro(name, text, iconId)
	local slot = GetMacroId (text)
	if (slot) then return slot end
	local macros = DataUtils.GetMacros ()
	for slot = 1, EA_Window_Macro.NUM_MACROS do
		if (macros[slot].text == L"") then
			SetMacroData (name, text, iconId, slot)
 			EA_Window_Macro.UpdateMacros ()
			return slot
		end
	end
	return nil
end

function Squared.InitializeClickAssist()
	if ( not GetMacroId(unitframeMacroName) ) then
		CreateMacro(unitframeMacroName, L"/assist ", 177)
	end
	unitframeMacroId = GetMacroId(unitframeMacroName)
end

function Squared.PotentialClickAssist(group, member, flags)
	local unit = Squared.GetUnit(group, member)
	if not unit then return end
	local unitname = unit.name
	if not unitname or unitname == L"" then return end
	local mouseWin = unit:GetName().."Action"
	local keyassist = Squared.GetSetting("key-assist")
	if (keyassist == "alt" and flags == SystemData.ButtonFlags.ALT)
	or (keyassist == "ctrl" and flags == SystemData.ButtonFlags.CONTROL)
	or (keyassist == "shift" and flags == SystemData.ButtonFlags.SHIFT) then
		--unitname = unitname:match(L"([^^]+)^?[^^]*")
		--WindowSetGameActionData(mouseWin,GameData.PlayerActions.ASSIST_PLAYER,0, unitname) -- or .rawname?
		
		SetMacroData (unitframeMacroName, L"/assist "..unitname, 177, unitframeMacroId)
		--EA_Window_Macro.UpdateDetails (unitframeMacroId)
		WindowSetGameActionData(mouseWin, GameData.PlayerActions.DO_MACRO, unitframeMacroId, L"")
		--DEBUG(L"ClickAssist: "..towstring(mouseWin))
	else	-- I don´t really like this -.-
		WindowSetGameActionData(mouseWin, GameData.PlayerActions.SET_TARGET, 0, unitname) -- or .rawname?
	end
    
    if Squared.GetSetting("key-assist-final") then return true else return false end
end

Squared.RegisterEventHandler("unitlclick", Squared.PotentialClickAssist)
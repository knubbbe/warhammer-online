RoR_SoR= {}
local version = "104"

function RoR_SoR.OnInitialize()
if not RoR_SoR.ShowTier then RoR_SoR.ShowTier = 1 end


RoR_SoR.Registerd = true
RoR_SoR.RegisterDelay = 0
--RoR_SoR.ShowTier = 1
RoR_SoR.UpdateVersion = 0
RoR_SoR.Style = 0
RoR_SoR.ShowT1 = true

CreateWindow("RoR_SoR_Window", true)
CreateWindow("RoR_SoR_Button", true)

RegisterEventHandler( SystemData.Events.ENTER_WORLD, "RoR_SoR.Register" )
RegisterEventHandler( SystemData.Events.INTERFACE_RELOADED, "RoR_SoR.Register" )	
RegisterEventHandler(TextLogGetUpdateEventId("System"), "RoR_SoR.OnChatLogUpdated")

LayoutEditor.RegisterWindow( "RoR_SoR_Window", L"RoR_SoR", L"RoR_SoR", true, true, true, nil )
LayoutEditor.RegisterWindow( "RoR_SoR_Button", L"RoR_SoR_Button", L"RoR_SoR_Button", false, false, false, nil )


ButtonSetText( "RoR_SoR_WindowT1Tab",  L"T1"	)
ButtonSetText( "RoR_SoR_WindowT2Tab",  L"T2"	)
ButtonSetText( "RoR_SoR_WindowT3Tab",  L"T3"	)
ButtonSetText( "RoR_SoR_WindowT4Tab",  L"T4"	)
ButtonSetText( "RoR_SoR_WindowT5Tab",  L"<icon49>"	)
--ButtonSetPressedFlag( "RoR_SoR_WindowT1Tab",true)
CreateWindow("RoR_SoR_T5Window", false)

LabelSetText("RoR_SoR_T5WindowTIER_NAME",L"Tier 2 Beta")

RoR_SoR.TextLock = towstring(GetStringFromTable("MapSystem", StringTables.MapSystem.TEXT_CAMPAIGN_PAIRING_LOCKED ) )
RoR_SoR.TextZoneLocked =	towstring(GetStringFromTable("Hardcoded", 1268))
RoR_SoR.TextTaken = towstring(GetStringFromTable("Hardcoded", 274))

RoR_SoR.TextNeutral = towstring(GetStringFromTable("Default", StringTables.Default.LABEL_UNCONTROLLED ) )
RoR_SoR.TextOrder = towstring(GetStringFromTable("Default", StringTables.Default.LABEL_UNCONTROLLED ) )
RoR_SoR.TextDestro = towstring(GetStringFromTable("Default", StringTables.Default.LABEL_ORDER_CONTROLLED ) )


RoR_SoR.HideChannel(65)

TextLogAddEntry("Chat", 0, L"<icon00057> RoR_SoR "..towstring(version)..L" Loaded.")


local siegeWindow = "SiegeWeaponGeneralFireWindowChatLogDisplay"
LogDisplaySetFilterState(siegeWindow, "Chat", 65, false)

--for k in pairs(EA_ChatWindowGroups[1].Tabs[1].Filters) do 
--LogDisplaySetFilterState(siegeWindow, "Chat", tonumber(k), tostring(EA_ChatWindowGroups[1].Tabs[1].Filters[k]))
--end


RoR_SoR.InvertRealmColors = {{r=255,g=255,b=255},{r=255,g=75,b=75},{r=25,g=168,b=255}}
RoR_SoR.RealmColors = {{r=255,g=255,b=255},{r=25,g=168,b=255},{r=255,g=75,b=75}}

--WindowSetTintColor( "RoR_SoR_Button", 50,50,50 )

local SoR_X,SoR_Y = WindowGetOffsetFromParent("RoR_SoR_Window")
		WindowClearAnchors("RoR_SoR_Window")
		WindowAddAnchor("RoR_SoR_Window", "top", "Root", "top",SoR_X,SoR_Y )

IsT1Realm1Visible = nil
IsT1Realm2Visible = nil
IsT1Realm3Visible = nil

IsT2Realm1Visible = nil
IsT2Realm2Visible = nil
IsT2Realm3Visible = nil

Can_Claim = GuildWindowTabAdmin.GetGuildCommandPermission( SystemData.GuildPermissons.CLAIM_KEEP, GuildWindowTabAdmin.GetLocalMemberTitleNumber() )

end

function RoR_SoR.OnChatLogUpdated(updateType, filterType) --premade chat checker for future chat updates
	if( updateType == SystemData.TextLogUpdate.ADDED ) then 

--					local _, filterId, text = TextLogGetEntry( "System", TextLogGetNumEntries("System") - 1 ) 
			
--			if text:find(L"State of the Realm") then RoR_SoR_T1.CheckVer(text) end
			
			
	
			local _, filterId, text = TextLogGetEntry( "System", TextLogGetNumEntries("System") - 1 ) 
				if text:find(L"State of the Realm") then 
				RoR_SoR.CheckVer(text)
			--	RoR_SoR_T1.ZoneUpdate()
--			RoR_SoR_T1.CheckVer(text)
			end

			
	end
end




function RoR_SoR.CheckVer(text)
d(text)
local num1,num2,num3 = text:match(L"[^%.]+: ([0-9]+).([0-9]+).([0-9]+)")
VersionNumber = tonumber(num1)..tonumber(num2)..tonumber(num3)

if tonumber(VersionNumber) > tonumber(version) and RoR_SoR.UpdateVersion == 0 then 
SystemData.AlertText.VecType = {4}
SystemData.AlertText.VecText = {L"Notice: Your State of Realm is Outdated, Please Update!"}
AlertTextWindow.AddAlert()
TextLogAddEntry("Chat", 0, L"Notice: Your State of Realm is Outdated, Please Update! (your ver: "..towstring(version)..L", Newest ver: "..towstring(VersionNumber)..L")")

RoR_SoR.UpdateVersion = 1
end

end




function RoR_SoR.SiegeChat()

local siegeWindow = "SiegeWeaponGeneralFireWindowChatLogDisplay"
LogDisplaySetFilterState(siegeWindow, "Chat", 65, false)

for k in pairs(EA_ChatWindowGroups[1].Tabs[1].Filters) do 
LogDisplaySetFilterState(siegeWindow, "Chat", tonumber(k), tostring(EA_ChatWindowGroups[1].Tabs[1].Filters[k]))
end

	for _, wndGroup in ipairs(EA_ChatWindowGroups) do 
		if wndGroup.used == true then
			for tabId, tab in ipairs(wndGroup.Tabs) do
				local tabName = EA_ChatTabManager.GetTabName( tab.tabManagerId )
		
				if tabName then
					if tab.tabText == L"Siege" then
					

							for k in pairs(tab.Filters) do 
							LogDisplaySetFilterState("SiegeWeaponGeneralFireWindowChatLogDisplay", "Chat", tonumber(k), tostring(tab.Filters[k]))
							LogDisplaySetFilterState("SiegeWeaponGeneralFireWindowChatLogDisplay", "Combat", tonumber(k), tostring(tab.Filters[k]))
							LogDisplaySetFilterState("SiegeWeaponGeneralFireWindowChatLogDisplay", "System", tonumber(k), tostring(tab.Filters[k]))
							--d(L"setting "..towstring(k)..L" to "..towstring(tostring(tab.Filters[k])))
							end

							LogDisplaySetFilterState("SiegeWeaponGeneralFireWindowChatLogDisplay", "Chat", 65, false)
					
					
					end
				end
				
			end
			
		end
		
	end	


end



function RoR_SoR.HideChannel(channelId)
	for _, wndGroup in ipairs(EA_ChatWindowGroups) do 
		if wndGroup.used == true then
			for tabId, tab in ipairs(wndGroup.Tabs) do
				local tabName = EA_ChatTabManager.GetTabName( tab.tabManagerId )
		
				if tabName then
					if tab.tabText ~= L"Debug" then
						LogDisplaySetFilterState(tabName.."TextLog", "Chat", channelId, false)
					else
						LogDisplaySetFilterState(tabName.."TextLog", "Chat", channelId, true)
						LogDisplaySetFilterColor(tabName.."TextLog", "Chat", channelId, 168, 187, 160 )
					end
				end
				
			end
			
		end
		
	end	
end


function RoR_SoR.OnTabLBU()
local tabNumber	= WindowGetId (SystemData.ActiveWindow.name)
if (tabNumber == 1) then 
ButtonSetPressedFlag( "RoR_SoR_WindowT1Tab",true)
ButtonSetPressedFlag( "RoR_SoR_WindowT2Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT3Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT4Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT5Tab",false)
RoR_SoR.ShowTier = 1
RoR_SoR.Style = 0
elseif (tabNumber == 2) then 
ButtonSetPressedFlag( "RoR_SoR_WindowT1Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT2Tab",true)
ButtonSetPressedFlag( "RoR_SoR_WindowT3Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT4Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT5Tab",false)
RoR_SoR.ShowTier = 2
RoR_SoR.Style = 0
elseif (tabNumber == 3) then 
ButtonSetPressedFlag( "RoR_SoR_WindowT1Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT2Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT3Tab",true)
ButtonSetPressedFlag( "RoR_SoR_WindowT4Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT5Tab",false)
RoR_SoR.ShowTier = 3
RoR_SoR.Style = 0
elseif (tabNumber == 4) then 
ButtonSetPressedFlag( "RoR_SoR_WindowT1Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT2Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT3Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT4Tab",true)
ButtonSetPressedFlag( "RoR_SoR_WindowT5Tab",false)
RoR_SoR.ShowTier = 4
RoR_SoR.Style = 0
elseif (tabNumber == 5) then 
ButtonSetPressedFlag( "RoR_SoR_WindowT1Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT2Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT3Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT4Tab",false)
ButtonSetPressedFlag( "RoR_SoR_WindowT5Tab",true)
RoR_SoR.Style = 1
RoR_SoR.ShowTier = 4
end

end

function RoR_SoR.OnTabRBU()
local tabNumber	= WindowGetId (SystemData.ActiveWindow.name)

if tabNumber == 5 then 
    EA_Window_ContextMenu.CreateContextMenu(SystemData.MouseOverWindow.name)   
  if RoR_SoR.ShowT1 == true then
  EA_Window_ContextMenu.AddMenuItem( L"Hide Tier 1" , RoR_SoR.ToggleShowT1, false, true )
  else
   EA_Window_ContextMenu.AddMenuItem( L"Show Tier 1" , RoR_SoR.ToggleShowT1, false, true )
 end
 EA_Window_ContextMenu.Finalize()	
	
end

end

function RoR_SoR.Update(timeElapsed)
--[[
	for _, wndGroup in ipairs(EA_ChatWindowGroups) do 
		if wndGroup.used == true then
			for tabId, tab in ipairs(wndGroup.Tabs) do
				local tabName = EA_ChatTabManager.GetTabName( tab.tabManagerId )
		
				if tabName then
					if GameData.Player.isInSiege == true then WindowSetShowing(tabName,false) else WindowSetShowing(tabName,true) end
				end
				
			end
			
		end
		
	end	
--]]
local uiScale = InterfaceCore.GetScale()
	if RoR_SoR.Style == 0 then
		if WindowGetShowing("RoR_SoR_Window") == true then


		WindowSetDimensions("RoR_SoR_Window",300,370)		
		
		
		WindowSetDimensions("RoR_SoR_T1Window",300,300)	
				
		WindowClearAnchors("RoR_SoR_T1Window")
		WindowAddAnchor("RoR_SoR_T1Window", "topleft", "RoR_SoR_Window", "topleft",0,(68/uiScale)*WindowGetScale("RoR_SoR_Window") )	
		
		WindowClearAnchors("RoR_SoR_T1WindowRealm1")
		WindowAddAnchor("RoR_SoR_T1WindowRealm1", "topleft", "RoR_SoR_T1Window", "topleft",38,-17 )
		WindowSetShowing("RoR_SoR_T1WindowRealm1",true)
		
		WindowClearAnchors("RoR_SoR_T1WindowRealm2")
		WindowAddAnchor("RoR_SoR_T1WindowRealm2", "topleft", "RoR_SoR_T1Window", "topleft",38,(-17)+(100) )
		WindowSetShowing("RoR_SoR_T1WindowRealm2",true)
		
		WindowClearAnchors("RoR_SoR_T1WindowRealm3")
		WindowAddAnchor("RoR_SoR_T1WindowRealm3", "topleft", "RoR_SoR_T1Window", "topleft",38,(-17)+(200) )
		WindowSetShowing("RoR_SoR_T1WindowRealm3",true)

		
		WindowSetDimensions("RoR_SoR_T2Window",300,300)	
				
		WindowClearAnchors("RoR_SoR_T2Window")
		WindowAddAnchor("RoR_SoR_T2Window", "topleft", "RoR_SoR_Window", "topleft",0,(68/uiScale)*WindowGetScale("RoR_SoR_Window") )	
		
		WindowClearAnchors("RoR_SoR_T2WindowRealm1")
		WindowAddAnchor("RoR_SoR_T2WindowRealm1", "topleft", "RoR_SoR_T2Window", "topleft",38,-17 )
		WindowSetShowing("RoR_SoR_T2WindowRealm1",true)
		
		WindowClearAnchors("RoR_SoR_T2WindowRealm2")
		WindowAddAnchor("RoR_SoR_T2WindowRealm2", "topleft", "RoR_SoR_T2Window", "topleft",38,(-17)+(100) )
		WindowSetShowing("RoR_SoR_T2WindowRealm2",true)
		
		WindowClearAnchors("RoR_SoR_T2WindowRealm3")
		WindowAddAnchor("RoR_SoR_T2WindowRealm3", "topleft", "RoR_SoR_T2Window", "topleft",38,(-17)+(200) )	
		WindowSetShowing("RoR_SoR_T2WindowRealm3",true)
		
	
		WindowSetDimensions("RoR_SoR_T3Window",300,300)	
				
		WindowClearAnchors("RoR_SoR_T3Window")
		WindowAddAnchor("RoR_SoR_T3Window", "topleft", "RoR_SoR_Window", "topleft",0,(68/uiScale)*WindowGetScale("RoR_SoR_Window") )	
		
		WindowClearAnchors("RoR_SoR_T3WindowRealm1")
		WindowAddAnchor("RoR_SoR_T3WindowRealm1", "topleft", "RoR_SoR_T3Window", "topleft",38,-17 )
		WindowSetShowing("RoR_SoR_T3WindowRealm1",true)
		
		WindowClearAnchors("RoR_SoR_T3WindowRealm2")
		WindowAddAnchor("RoR_SoR_T3WindowRealm2", "topleft", "RoR_SoR_T3Window", "topleft",38,(-17)+(100) )
		WindowSetShowing("RoR_SoR_T3WindowRealm2",true)
		
		WindowClearAnchors("RoR_SoR_T3WindowRealm3")
		WindowAddAnchor("RoR_SoR_T3WindowRealm3", "topleft", "RoR_SoR_T3Window", "topleft",38,(-17)+(200) )
		WindowSetShowing("RoR_SoR_T3WindowRealm3",true)
	
		WindowSetDimensions("RoR_SoR_T4Window",300,300)	
				
		WindowClearAnchors("RoR_SoR_T4Window")
		WindowAddAnchor("RoR_SoR_T4Window", "topleft", "RoR_SoR_Window", "topleft",0,(68/uiScale)*WindowGetScale("RoR_SoR_Window") )	
		
		WindowClearAnchors("RoR_SoR_T4WindowRealm1")
		WindowAddAnchor("RoR_SoR_T4WindowRealm1", "topleft", "RoR_SoR_T4Window", "topleft",38,-17 )
		WindowSetShowing("RoR_SoR_T4WindowRealm1",true)
		
		WindowClearAnchors("RoR_SoR_T4WindowRealm2")
		WindowAddAnchor("RoR_SoR_T4WindowRealm2", "topleft", "RoR_SoR_T4Window", "topleft",38,(-17)+(100) )
		WindowSetShowing("RoR_SoR_T4WindowRealm2",true)
		
		WindowClearAnchors("RoR_SoR_T4WindowRealm3")
		WindowAddAnchor("RoR_SoR_T4WindowRealm3", "topleft", "RoR_SoR_T4Window", "topleft",38,(-17)+(200) )
		WindowSetShowing("RoR_SoR_T4WindowRealm3",true)
	
		local WinSize = WindowGetScale("RoR_SoR_Window")
		WindowSetScale("RoR_SoR_T1Window",WinSize)
		WindowSetScale("RoR_SoR_T2Window",WinSize)
		WindowSetScale("RoR_SoR_T3Window",WinSize)
		WindowSetScale("RoR_SoR_T4Window",WinSize)
		WindowSetScale("RoR_SoR_T5Window",WinSize)	
	
	
	
		if RoR_SoR.ShowTier == 1 then
		ButtonSetPressedFlag( "RoR_SoR_WindowT1Tab",true)
		WindowSetShowing("RoR_SoR_T1Window",true)
		WindowSetShowing("RoR_SoR_T3Window",false)
		WindowSetShowing("RoR_SoR_T2Window",false)
		WindowSetShowing("RoR_SoR_T4Window",false)
	
		WindowSetShowing("RoR_SoR_T5Window",false)
		elseif RoR_SoR.ShowTier == 2 then
		ButtonSetPressedFlag( "RoR_SoR_WindowT2Tab",true)
		WindowSetShowing("RoR_SoR_T1Window",false)
		WindowSetShowing("RoR_SoR_T2Window",true)
		WindowSetShowing("RoR_SoR_T3Window",false)
		WindowSetShowing("RoR_SoR_T4Window",false)

		WindowSetShowing("RoR_SoR_T5Window",false)		
		elseif RoR_SoR.ShowTier == 3 then
		ButtonSetPressedFlag( "RoR_SoR_WindowT3Tab",true)
		WindowSetShowing("RoR_SoR_T1Window",false)
		WindowSetShowing("RoR_SoR_T3Window",true)
		WindowSetShowing("RoR_SoR_T2Window",false)
		WindowSetShowing("RoR_SoR_T4Window",false)

		WindowSetShowing("RoR_SoR_T5Window",false)		
		elseif RoR_SoR.ShowTier == 4 then
		ButtonSetPressedFlag( "RoR_SoR_WindowT4Tab",true)
		WindowSetShowing("RoR_SoR_T1Window",false)
		WindowSetShowing("RoR_SoR_T3Window",false)
		WindowSetShowing("RoR_SoR_T2Window",false)
		WindowSetShowing("RoR_SoR_T4Window",true)

		WindowSetShowing("RoR_SoR_T5Window",false)		
		end
		else
		WindowSetShowing("RoR_SoR_T1Window",false)
		WindowSetShowing("RoR_SoR_T3Window",false)
		WindowSetShowing("RoR_SoR_T2Window",false)
		WindowSetShowing("RoR_SoR_T4Window",false)
		
		WindowSetShowing("RoR_SoR_T5Window",false)		
	end
	
	
	
elseif RoR_SoR.Style == 1 then

		if WindowGetShowing("RoR_SoR_Window") == true then


	if RoR_SoR.ShowT1 == true then
	WindowSetShowing("RoR_SoR_T1Window",true) 	
		if RoR_SoR_T1.LockedState[1] == false then
			 IsT1Realm1Visible = true
			 T1Realm1Counter = 1
			 WindowSetShowing("RoR_SoR_T1WindowRealm1",true)
			 elseif RoR_SoR_T1.LockedState[1] == true then 
			 T1Realm1Counter = 0
			 IsT1Realm1Visible = false 
			 WindowSetShowing("RoR_SoR_T1WindowRealm1",false)
			 end	

			 if RoR_SoR_T1.LockedState[2] == false then
			  T1Realm2Counter = 1
			 IsT1Realm2Visible = true 
			 WindowSetShowing("RoR_SoR_T1WindowRealm2",true)
			 elseif RoR_SoR_T1.LockedState[2] == true then 
			 IsT1Realm2Visible = false 
			  T1Realm2Counter = 0
			 WindowSetShowing("RoR_SoR_T1WindowRealm2",false)
			 end	

			 if RoR_SoR_T1.LockedState[3] == false then
			 IsT1Realm3Visible = true 
			  T1Realm3Counter = 1
			 WindowSetShowing("RoR_SoR_T1WindowRealm3",true)
			 elseif RoR_SoR_T1.LockedState[3] == true then 
			 IsT1Realm3Visible = false 
			  T1Realm3Counter = 0
			 WindowSetShowing("RoR_SoR_T1WindowRealm3",false)
		end	
	else 
	WindowSetShowing("RoR_SoR_T1Window",false) 	
				T1Realm1Counter = 0
				T1Realm2Counter = 0
				T1Realm3Counter = 0					 
	end
		WindowSetShowing("RoR_SoR_T3Window",true)
		WindowSetShowing("RoR_SoR_T2Window",true)
		WindowSetShowing("RoR_SoR_T4Window",true)
--		WindowSetShowing("RoR_SoR_T5Window",true)		
	
	

	
--------------------------------------------------------

if RoR_SoR_T2.IsLocked[7] == false then 
IsT2Realm1Visible = true
 T2Realm1Counter = 1
 WindowSetShowing("RoR_SoR_T2WindowRealm1",true)
else
IsT2Realm1Visible = false
 T2Realm1Counter = 0
 WindowSetShowing("RoR_SoR_T2WindowRealm1",false)
end

if RoR_SoR_T2.IsLocked[107] == false then 
IsT2Realm2Visible = true
 T2Realm2Counter = 1
 WindowSetShowing("RoR_SoR_T2WindowRealm2",true)
else
 T2Realm2Counter = 0
IsT2Realm2Visible = false
 WindowSetShowing("RoR_SoR_T2WindowRealm2",false)
end

if RoR_SoR_T2.IsLocked[207] == false then 
IsT2Realm3Visible = true
 T2Realm3Counter = 1
 WindowSetShowing("RoR_SoR_T2WindowRealm3",true)
else
 T2Realm3Counter = 0
IsT2Realm3Visible = false
 WindowSetShowing("RoR_SoR_T2WindowRealm3",false)
end

-----------------------------------------	
if RoR_SoR_T3.IsLocked[8] == false then 
IsT3Realm1Visible = true
 T3Realm1Counter = 1
 WindowSetShowing("RoR_SoR_T3WindowRealm1",true)
else
IsT3Realm1Visible = false
 T3Realm1Counter = 0
 WindowSetShowing("RoR_SoR_T3WindowRealm1",false)
end

if RoR_SoR_T3.IsLocked[108] == false then 
IsT3Realm2Visible = true
 T3Realm2Counter = 1
 WindowSetShowing("RoR_SoR_T3WindowRealm2",true)
else
 T3Realm2Counter = 0
IsT3Realm2Visible = false
WindowSetShowing("RoR_SoR_T3WindowRealm2",false)
end

if RoR_SoR_T3.IsLocked[208] == false then 
IsT3Realm3Visible = true
 T3Realm3Counter = 1
 WindowSetShowing("RoR_SoR_T3WindowRealm3",true)
else
 T3Realm3Counter = 0
IsT3Realm3Visible = false
 WindowSetShowing("RoR_SoR_T3WindowRealm3",false)
end	
	
-----------------------------------------	
if RoR_SoR_T4.IsLocked[3] == false or RoR_SoR_T4.IsLocked[5] == false or RoR_SoR_T4.IsLocked[9] == false then 
IsT4Realm1Visible = true
 T4Realm1Counter = 1
 WindowSetShowing("RoR_SoR_T4WindowRealm1",true)
else
IsT4Realm1Visible = false
 T4Realm1Counter = 0
 WindowSetShowing("RoR_SoR_T4WindowRealm1",false)
end

if  RoR_SoR_T4.IsLocked[103] == false or RoR_SoR_T4.IsLocked[105] == false or RoR_SoR_T4.IsLocked[109] == false then 
IsT4Realm2Visible = true
 T4Realm2Counter = 1
 WindowSetShowing("RoR_SoR_T4WindowRealm2",true)
else
 T4Realm2Counter = 0
IsT4Realm2Visible = false
 WindowSetShowing("RoR_SoR_T4WindowRealm2",false)
end

if RoR_SoR_T4.IsLocked[203] == false or RoR_SoR_T4.IsLocked[205] == false or RoR_SoR_T4.IsLocked[209] == false then 
IsT4Realm3Visible = true
 T4Realm3Counter = 1
 WindowSetShowing("RoR_SoR_T4WindowRealm3",true)
else
 T4Realm3Counter = 0
IsT4Realm3Visible = false
 WindowSetShowing("RoR_SoR_T4WindowRealm3",false)
end		
		WindowSetDimensions("RoR_SoR_Window",300,70+(100*(T1Realm1Counter+T1Realm2Counter+T1Realm3Counter+T2Realm1Counter+T2Realm2Counter+T2Realm3Counter+T3Realm1Counter+T3Realm2Counter+T3Realm3Counter+T4Realm1Counter+T4Realm2Counter+T4Realm3Counter)))		
		
		
		WindowSetDimensions("RoR_SoR_T1Window",300,100*(T1Realm1Counter+T1Realm2Counter+T1Realm3Counter))	
				
		WindowClearAnchors("RoR_SoR_T1Window")
		WindowAddAnchor("RoR_SoR_T1Window", "topleft", "RoR_SoR_Window", "topleft",0,(68/uiScale)*WindowGetScale("RoR_SoR_Window") )	
		
		WindowClearAnchors("RoR_SoR_T1WindowRealm1")
		WindowAddAnchor("RoR_SoR_T1WindowRealm1", "topleft", "RoR_SoR_T1Window", "topleft",38,-17 )


		WindowClearAnchors("RoR_SoR_T1WindowRealm2")
		--WindowAddAnchor("RoR_SoR_T1WindowRealm2", "bottomleft", "RoR_SoR_T1WindowRealm1", "topleft",0,-17 )
		WindowAddAnchor("RoR_SoR_T1WindowRealm2", "topleft", "RoR_SoR_T1Window", "topleft",38,(-17)+(100*(T1Realm1Counter)) )

		WindowClearAnchors("RoR_SoR_T1WindowRealm3")
--		WindowAddAnchor("RoR_SoR_T1WindowRealm3", "bottomleft", "RoR_SoR_T1WindowRealm2", "topleft",0,-17 )
		WindowAddAnchor("RoR_SoR_T1WindowRealm3", "topleft", "RoR_SoR_T1Window", "topleft",38,(-17)+(100*(T1Realm1Counter+T1Realm2Counter)) )

		
		WindowSetDimensions("RoR_SoR_T2Window",300,100*(T2Realm1Counter+T2Realm2Counter+T2Realm3Counter))	
		
		WindowClearAnchors("RoR_SoR_T2Window")
		WindowAddAnchor("RoR_SoR_T2Window", "bottomleft", "RoR_SoR_T1Window", "topleft",0,0 )	

		WindowClearAnchors("RoR_SoR_T2WindowRealm1")
		WindowAddAnchor("RoR_SoR_T2WindowRealm1", "topleft", "RoR_SoR_T2Window", "topleft",38,-17 )

		WindowClearAnchors("RoR_SoR_T2WindowRealm2")
--		WindowAddAnchor("RoR_SoR_T2WindowRealm2", "bottomleft", "RoR_SoR_T2WindowRealm1", "topleft",0,-17 )
		WindowAddAnchor("RoR_SoR_T2WindowRealm2", "topleft", "RoR_SoR_T2Window", "topleft",38,(-17)+(100*(T2Realm1Counter)) )


		WindowClearAnchors("RoR_SoR_T2WindowRealm3")
--		WindowAddAnchor("RoR_SoR_T2WindowRealm3", "bottomleft", "RoR_SoR_T2WindowRealm2", "topleft",0,-17 )
		WindowAddAnchor("RoR_SoR_T2WindowRealm3", "topleft", "RoR_SoR_T2Window", "topleft",38,(-17)+(100*(T2Realm1Counter+T2Realm2Counter)) )	
	
	
		WindowSetDimensions("RoR_SoR_T3Window",300,100*(T3Realm1Counter+T3Realm2Counter+T3Realm3Counter))	
		
		WindowClearAnchors("RoR_SoR_T3Window")
		WindowAddAnchor("RoR_SoR_T3Window", "bottomleft", "RoR_SoR_T2Window", "topleft",0,0 )

		WindowClearAnchors("RoR_SoR_T3WindowRealm1")
		WindowAddAnchor("RoR_SoR_T3WindowRealm1", "topleft", "RoR_SoR_T3Window", "topleft",38,-17 )
	
	
		WindowClearAnchors("RoR_SoR_T3WindowRealm2")
--		WindowAddAnchor("RoR_SoR_T3WindowRealm2", "bottomleft", "RoR_SoR_T3WindowRealm1", "topleft",0,-17 )
		WindowAddAnchor("RoR_SoR_T3WindowRealm2", "topleft", "RoR_SoR_T3Window", "topleft",38,(-17)+(100*(T3Realm1Counter)) )	

		WindowClearAnchors("RoR_SoR_T3WindowRealm3")
--		WindowAddAnchor("RoR_SoR_T3WindowRealm3", "bottomleft", "RoR_SoR_T3WindowRealm2", "topleft",0,-17 )	
		WindowAddAnchor("RoR_SoR_T3WindowRealm3", "topleft", "RoR_SoR_T3Window", "topleft",38,(-17)+(100*(T3Realm1Counter+T3Realm2Counter)) )		

		WindowSetDimensions("RoR_SoR_T4Window",300,100*(T4Realm1Counter+T4Realm2Counter+T4Realm3Counter))	
		
		WindowClearAnchors("RoR_SoR_T4Window")
		WindowAddAnchor("RoR_SoR_T4Window", "bottomleft", "RoR_SoR_T3Window", "topleft",0,0 )			

		WindowClearAnchors("RoR_SoR_T4WindowRealm1")
		WindowAddAnchor("RoR_SoR_T4WindowRealm1", "topleft", "RoR_SoR_T4Window", "topleft",38,-17 )
		WindowClearAnchors("RoR_SoR_T4WindowRealm2")
--		WindowAddAnchor("RoR_SoR_T4WindowRealm2", "bottomleft", "RoR_SoR_T4WindowRealm1", "topleft",0,-17 )
		WindowAddAnchor("RoR_SoR_T4WindowRealm2", "topleft", "RoR_SoR_T4Window", "topleft",38,(-17)+(100*(T4Realm1Counter)) )	

		WindowClearAnchors("RoR_SoR_T4WindowRealm3")
--		WindowAddAnchor("RoR_SoR_T4WindowRealm3", "bottomleft", "RoR_SoR_T4WindowRealm2", "topleft",0,-17 )	
		WindowAddAnchor("RoR_SoR_T4WindowRealm3", "topleft", "RoR_SoR_T4Window", "topleft",38,(-17)+(100*(T4Realm1Counter+T4Realm2Counter)) )		

		local WinSize = WindowGetScale("RoR_SoR_Window")
		WindowSetScale("RoR_SoR_T1Window",WinSize)
		WindowSetScale("RoR_SoR_T2Window",WinSize)
		WindowSetScale("RoR_SoR_T3Window",WinSize)
		WindowSetScale("RoR_SoR_T4Window",WinSize)
		WindowSetScale("RoR_SoR_T5Window",WinSize)	
		
		
			else
		WindowSetShowing("RoR_SoR_T1Window",false)
		WindowSetShowing("RoR_SoR_T3Window",false)
		WindowSetShowing("RoR_SoR_T2Window",false)
		WindowSetShowing("RoR_SoR_T4Window",false)
		
		end

end




if RoR_SoR.Registerd == true then
if RoR_SoR.RegisterDelay < 20 then
RoR_SoR.RegisterDelay = RoR_SoR.RegisterDelay + timeElapsed
end
if RoR_SoR.RegisterDelay > 20 then
RoR_SoR.Enable()
RoR_SoR.Registerd = false

end
end


end


function RoR_SoR.Enable()
SendChatText(L".sorenable", L"")
RoR_SoR.Registerd = false
d("SoR Registered")
--WindowSetTintColor( "RoR_SoR_Button", 255,255,255 )
end



function RoR_SoR.GetTooltipIcon(BO_OWNER,BO_STATE)
local Owner = tonumber(BO_OWNER)
local State = tonumber(BO_STATE)

if State == 0 then
	if Owner == 0 then return L"<icon29982> "..towstring(RoR_SoR.TextNeutral) end --neutral
	if Owner == 1 then return L"<icon29990> "..towstring(RoR_SoR.TextDestro) end
	if Owner == 2 then return L"<icon29985> "..towstring(RoR_SoR.TextOrder) end
elseif State == 2 then
	if Owner == 0 then return L"<icon29982> Abandoned" end
	if Owner == 1 then return L"<icon29990> Order Abandoned" end
	if Owner == 2 then return L"<icon29985> Destro Abandoned" end		
elseif State == 4 then
	if Owner == 0 then return L"<icon29984> Capping" end
	if Owner == 1 then return L"<icon29992> Destro Capping" end
	if Owner == 2 then return L"<icon29987> Order Capping" end
elseif State == 8 then
	if Owner == 0 then return L"<icon29983> Unlocking" end
	if Owner == 1 then return L"<icon29991> Order "..towstring(RoR_SoR.TextLock) end
	if Owner == 2 then return L"<icon29986> Destro "..towstring(RoR_SoR.TextLock) end
elseif State == 9 then
	if Owner == 0 then return L"<icon29983> "..towstring(RoR_SoR.TextLock) end
	if Owner == 1 then return L"<icon29991> Order "..towstring(RoR_SoR.TextLock) end
	if Owner == 2 then return L"<icon29986> Destro "..towstring(RoR_SoR.TextLock) end	
elseif State == 10 then
	if Owner == 0 then return L"<icon29982> Neutral "..towstring(RoR_SoR.TextLock) end--neutral
	if Owner == 1 then return L"<icon29991> Order "..towstring(RoR_SoR.TextLock) end
	if Owner == 2 then return L"<icon29986> Destro "..towstring(RoR_SoR.TextLock) end		
elseif State == 16 then
	if Owner == 0 then return L"<icon29982> Securing" end
	if Owner == 1 then return L"<icon29993> Order securing" end -- securing / holding
	if Owner == 2 then return L"<icon29988> Destro securing" end
else
	if Owner == 0 then return L"<icon29982> Neutral" end--neutral
	if Owner == 1 then return L"<icon29990> Order" end
	if Owner == 2 then return L"<icon29985> Destro" end
end

end

function RoR_SoR.GetKeepIcon(KEEP_OWNER,KEEP_STATE)
local Owner = tonumber(KEEP_OWNER)
local State = tonumber(KEEP_STATE)

if State == 1 then
	if Owner == 0 then return L"<icon29995> Neutral Keep" end
	if Owner == 1 then return L"<icon29998> Order Keep" end
	if Owner == 2 then return L"<icon29996> Destro Keep" end
elseif State == 2 then
	if Owner == 0 then return L"<icon29995> Under Attack" end
	if Owner == 1 then return L"<icon29999> Under Attack" end
	if Owner == 2 then return L"<icon29997> Under Attack" end
elseif State == 3 then
	if Owner == 0 then return L"<icon29995> Under Attack" end
	if Owner == 1 then return L"<icon29999> Under Attack" end
	if Owner == 2 then return L"<icon29997> Under Attack" end	
elseif State == 4 then
	if Owner == 0 then return L"<icon29995> Under Attack" end
	if Owner == 1 then return L"<icon29999> Under Attack" end
	if Owner == 2 then return L"<icon29997> Under Attack" end
elseif State == 5 then
	if Owner == 0 then return L"<icon29995> Neutral Keep" end
	if Owner == 1 then return L"<icon29998> Order Keep" end
	if Owner == 2 then return L"<icon29996> Destro Keep" end
elseif State == 6 then
	if Owner == 0 then return L"<icon29995> Neutral Keep" end
	if Owner == 1 then return L"<icon29998> Order Keep" end
	if Owner == 2 then return L"<icon29996> Destro Keep" end
else
	if Owner == 0 then return L"<icon29995> Neutral Keep" end
	if Owner == 1 then return L"<icon29998> Order Keep" end
	if Owner == 2 then return L"<icon29996> Destro Keep" end
end

end

function RoR_SoR.GetKeepTexture(KEEP_OWNER,KEEP_STATE)
local Owner = tonumber(KEEP_OWNER)
local State = tonumber(KEEP_STATE)

if State == 1 then
	if Owner == 0 then return "SoR_Keep_Neutral" end
	if Owner == 1 then return "SoR_Keep_Order" end
	if Owner == 2 then return "SoR_Keep_Destro" end
elseif State == 2 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "SoR_Keep_Order-Attacked" end
	if Owner == 2 then return "SoR_Keep_Destro-Attacked" end
elseif State == 3 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "SoR_Keep_Order-Attacked" end
	if Owner == 2 then return "SoR_Keep_Destro-Attacked" end	
elseif State == 4 then
	if Owner == 0 then return "BombNeutral" end
	if Owner == 1 then return "SoR_Keep_Order-Attacked" end
	if Owner == 2 then return "SoR_Keep_Destro-Attacked" end
elseif State == 5 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "SoR_Keep_Order" end
	if Owner == 2 then return "SoR_Keep_Destro" end
elseif State == 6 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "SoR_Keep_Order" end
	if Owner == 2 then return "SoR_Keep_Destro" end
else
	if Owner == 0 then return "SoR_Keep_Neutral" end
	if Owner == 1 then return "SoR_Keep_Order" end
	if Owner == 2 then return "SoR_Keep_Destro" end
end

end

function RoR_SoR.GetKeepHeath(KEEP_OWNER,KEEP_STATE,KEEP_MESSAGE,KEEP_HP)
local Owner = tonumber(KEEP_OWNER)
local State = tonumber(KEEP_STATE)
local Message = tonumber(KEEP_MESSAGE)
local HP = tonumber(KEEP_HP) or 0
if State == 1 then 
return L""
elseif State == 2 then
	return towstring(HP)..L"%"
elseif State == 3 then
	return towstring(HP)..L"%"
elseif State == 4 then
	return towstring(HP)..L"%"
elseif State == 5 then
	return RoR_SoR.TextTaken
elseif State == 6 then
	return RoR_SoR.TextLock
end
return L""
end

function RoR_SoR.GetKeepRank(KeepRank)
local Rank = tonumber(KeepRank)

if Rank == 1 then return L"1 <icon43>"
elseif Rank == 2 then return L"2 <icon43><icon43>"
elseif Rank == 3 then return L"3 <icon43><icon43><icon43>"
elseif Rank == 4 then return L"4 <icon43><icon43><icon43><icon43>"
elseif Rank == 5 then return L"5 <icon43><icon43><icon43><icon43><icon43>"
else return L""

end
end

function RoR_SoR.OnMouseOverStart()


		Tooltips.CreateTextOnlyTooltip(SystemData.MouseOverWindow.name,nil)
		Tooltips.SetTooltipText( 1, 1, L"State Of Realm")
		Tooltips.SetTooltipColorDef( 1, 1, Tooltips.MAP_DESC_TEXT_COLOR )
		Tooltips.SetTooltipText( 1, 3, towstring(version))	
		Tooltips.SetTooltipText( 2, 1, L"LMB: Toggle Show/Hide<br>RMB: Force Update")
		Tooltips.Finalize()    
		Tooltips.AnchorTooltip( Tooltips.ANCHOR_WINDOW_TOP )


end

function RoR_SoR.ToggleShowT1()
if RoR_SoR.ShowT1 == true then RoR_SoR.ShowT1 = false else RoR_SoR.ShowT1 = true end
end

function RoR_SoR.Toggle()
if WindowGetShowing("RoR_SoR_Window") == false then
WindowSetShowing("RoR_SoR_Window", true)
else
WindowSetShowing("RoR_SoR_Window", false)
end

end

function RoR_SoR.Register()
RoR_SoR.RegisterDelay = 0
RoR_SoR.Registerd = true
end


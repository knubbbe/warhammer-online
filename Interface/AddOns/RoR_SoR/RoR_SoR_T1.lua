RoR_SoR_T1 = {}
local version = "104"

function RoR_SoR_T1.OnInitialize()
RegisterEventHandler(TextLogGetUpdateEventId("Chat"), "RoR_SoR_T1.OnChatLogUpdated")
RoR_SoR_T1.UpdateVersion = 0

CreateWindow("RoR_SoR_T1Window", true)

CreateWindowFromTemplate( "RoR_SoR_T1WindowRealm1", "T1TemplateRealm1", "RoR_SoR_T1Window" )
	WindowClearAnchors( "RoR_SoR_T1WindowRealm1" )
    WindowAddAnchor( "RoR_SoR_T1WindowRealm1", "topleft", "RoR_SoR_Window", "topleft",38, 40)


CreateWindowFromTemplate( "RoR_SoR_T1WindowRealm2", "T1TemplateRealm1", "RoR_SoR_T1Window" )
	WindowClearAnchors( "RoR_SoR_T1WindowRealm2" )
    WindowAddAnchor( "RoR_SoR_T1WindowRealm2", "bottomleft", "RoR_SoR_T1WindowRealm1", "topleft",0 , -24)

CreateWindowFromTemplate( "RoR_SoR_T1WindowRealm3", "T1TemplateRealm1", "RoR_SoR_T1Window" )
	WindowClearAnchors( "RoR_SoR_T1WindowRealm3" )
    WindowAddAnchor( "RoR_SoR_T1WindowRealm3", "bottomleft", "RoR_SoR_T1WindowRealm2", "topleft",0 , -24)	
	
	DynamicImageSetTexture ("RoR_SoR_T1WindowRealm2Banner", "Realm2", 256,128)
	DynamicImageSetTexture ("RoR_SoR_T1WindowRealm3Banner", "Realm3", 256,128)

	DynamicImageSetTextureSlice("RoR_SoR_T1WindowRealm1Menu01", "PairingGvDSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T1WindowRealm2Menu01", "PairingEvCSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T1WindowRealm3Menu01", "PairingElvesSelected")
	
--LayoutEditor.RegisterWindow( "RoR_SoR_T1Window", L"RoR_SoR_T1", L"RoR_SoR_T1", true, true, true, nil )


--LabelSetText("RoR_SoR_T1WindowTIER_NAME",L"Tier 1")

LabelSetText("RoR_SoR_T1WindowRealm1ZONE_TIER",L"T1")
LabelSetText("RoR_SoR_T1WindowRealm2ZONE_TIER",L"T1")
LabelSetText("RoR_SoR_T1WindowRealm3ZONE_TIER",L"T1")

LabelSetText("RoR_SoR_T1WindowRealm1ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN )))
LabelSetText("RoR_SoR_T1WindowRealm2ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS )))
LabelSetText("RoR_SoR_T1WindowRealm3ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF )))

local Zone1 = GetCampaignZoneData(6 )
local Zone2 = GetCampaignZoneData(106 )
local Zone3 = GetCampaignZoneData(200 ) 



--Update the "progressbars" in the zone pairings
local Width_Zone1_Order = ( ( Zone1.controlPoints[1] / 100 ) * 125 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm1VP_ORDER", Width_Zone1_Order+2, 4 )

local Width_Zone1_Destro = ( ( Zone1.controlPoints[2] / 100 ) * 120 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm1VP_DESTRO", Width_Zone1_Destro+2, 4 )

local Width_Zone2_Order = ( ( Zone2.controlPoints[1] / 100 ) * 125 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm2VP_ORDER", Width_Zone2_Order+2, 4 )

local Width_Zone2_Destro = ( ( Zone2.controlPoints[2] / 100 ) * 120 ) --152
WindowSetDimensions( "RoR_SoR_T1WindowRealm2VP_DESTRO", Width_Zone2_Destro+2, 4 )

local Width_Zone3_Order = ( ( Zone3.controlPoints[1] / 100 ) * 125 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm3VP_ORDER", Width_Zone3_Order+2, 4 )

local Width_Zone3_Destro = ( ( Zone3.controlPoints[2] / 100 ) * 120 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm3VP_DESTRO", Width_Zone3_Destro+2, 4 )



WindowSetShowing("RoR_SoR_T1WindowRealm1ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T1WindowRealm2ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T1WindowRealm3ZONE_NAME",false)


WindowSetShowing("RoR_SoR_T1WindowRealm1ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T1WindowRealm2ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T1WindowRealm3ZONE_TIER",false)

		

LabelSetText("RoR_SoR_T1WindowRealm1LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T1WindowRealm2LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T1WindowRealm3LOCKED_TEXT",RoR_SoR.TextZoneLocked)

WindowSetShowing("RoR_SoR_T1WindowRealm1ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T1WindowRealm2ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T1WindowRealm3ZONE_NAME",false)


WindowSetShowing("RoR_SoR_T1WindowRealm1ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T1WindowRealm2ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T1WindowRealm3ZONE_TIER",false)

WindowSetShowing("RoR_SoR_T1WindowRealm2BO4",false)

if Zone1.controllingRealm == 0 then
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",1)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_TIER",1)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_PARING",1)
else
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_PARING",0.4)
end

if Zone2.controllingRealm == 0 then
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",1)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_TIER",1)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_PARING",1)
else
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_PARING",0.4)
end

if Zone3.controllingRealm == 0 then
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",1)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_TIER",1)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_PARING",1)
else
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_PARING",0.4)
end











		WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_ORDERBAR",false)
		WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_DESTROBAR",false)
		
				WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_ORDERBAR",false)
		WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_DESTROBAR",false)
		
				WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_ORDERBAR",false)
		WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_DESTROBAR",false)
--tooltips
RoR_SoR_T1.LockedState = {}
RoR_SoR_T1.LockedState[1] = false
RoR_SoR_T1.LockedState[2] = false
RoR_SoR_T1.LockedState[3] = false

RoR_SoR_T1.LockedRealm = {}
RoR_SoR_T1.LockedRealm[1] = 0
RoR_SoR_T1.LockedRealm[2] = 0
RoR_SoR_T1.LockedRealm[3] = 0



RoR_SoR_T1.BoOwner = {}
RoR_SoR_T1.BoOwner[6] = {}
RoR_SoR_T1.BoOwner[106] = {}
RoR_SoR_T1.BoOwner[206] = {}

RoR_SoR_T1.BoOwner[6][5099] = 0
RoR_SoR_T1.BoOwner[6][1] = 0
RoR_SoR_T1.BoOwner[6][5098] = 0
RoR_SoR_T1.BoOwner[6][2] = 0

RoR_SoR_T1.BoOwner[106][228] = 0
RoR_SoR_T1.BoOwner[106][5097] = 0
RoR_SoR_T1.BoOwner[106][5096] = 0
RoR_SoR_T1.BoOwner[106][0] = 0

RoR_SoR_T1.BoOwner[206][5074] = 0
RoR_SoR_T1.BoOwner[206][5075] = 0
RoR_SoR_T1.BoOwner[206][5073] = 0
RoR_SoR_T1.BoOwner[206][5072] = 0

RoR_SoR_T1.BoState = {}
RoR_SoR_T1.BoState[6] = {}
RoR_SoR_T1.BoState[106] = {}
RoR_SoR_T1.BoState[206] = {}

RoR_SoR_T1.BoState[6][5099] = 0
RoR_SoR_T1.BoState[6][1] = 0
RoR_SoR_T1.BoState[6][5098] = 0
RoR_SoR_T1.BoState[6][2] = 0

RoR_SoR_T1.BoState[106][228] = 0
RoR_SoR_T1.BoState[106][5097] = 0
RoR_SoR_T1.BoState[106][5096] = 0
RoR_SoR_T1.BoState[106][0] = 0

RoR_SoR_T1.BoState[206][5074] = 0
RoR_SoR_T1.BoState[206][5075] = 0
RoR_SoR_T1.BoState[206][5073] = 0
RoR_SoR_T1.BoOwner[206][5072] = 0


--zone stuff
RoR_SoR_T1.Timer = 0

RoR_SoR_T1.T1Zones = {6,106,206}
T1PairedZone = {}
T1ComboZone = {}
T1ComboZone[6] = 6
T1ComboZone[11] = 6
T1PairedZone[6] = 11

T1NastyZone = {}
T1NastyZone[6] = 1
T1NastyZone[106] = 2
T1NastyZone[206] = 3


T1ComboZone[100] = 106
T1ComboZone[106] = 106
T1PairedZone[106] = 100

T1ComboZone[200] = 206
T1ComboZone[206] = 206
T1PairedZone[206] = 200

RoR_SoR_T1.ZoneNumber = {}
RoR_SoR_T1.ZoneNumber[6] = "RoR_SoR_T1WindowRealm1"
RoR_SoR_T1.ZoneNumber[106] = "RoR_SoR_T1WindowRealm2"
RoR_SoR_T1.ZoneNumber[206] = "RoR_SoR_T1WindowRealm3"


RoR_SoR_T1.BONumber = {}

RoR_SoR_T1.BONumber[6] = {}
RoR_SoR_T1.BONumber[6][5099] = "RoR_SoR_T1WindowRealm1BO1"
RoR_SoR_T1.BONumber[6][1] = "RoR_SoR_T1WindowRealm1BO2"
RoR_SoR_T1.BONumber[6][5098] = "RoR_SoR_T1WindowRealm1BO3"
RoR_SoR_T1.BONumber[6][2] = "RoR_SoR_T1WindowRealm1BO4"

RoR_SoR_T1.BONumber[11] = {}
RoR_SoR_T1.BONumber[11][5099] = "RoR_SoR_T1WindowRealm1BO1"
RoR_SoR_T1.BONumber[11][1] = "RoR_SoR_T1WindowRealm1BO2"
RoR_SoR_T1.BONumber[11][5098] = "RoR_SoR_T1WindowRealm1BO3"
RoR_SoR_T1.BONumber[11][2] = "RoR_SoR_T1WindowRealm1BO4"


RoR_SoR_T1.BONumber[100] = {}
RoR_SoR_T1.BONumber[100][228] = "RoR_SoR_T1WindowRealm2BO1"
RoR_SoR_T1.BONumber[100][5097] = "RoR_SoR_T1WindowRealm2BO2"
RoR_SoR_T1.BONumber[100][5096] = "RoR_SoR_T1WindowRealm2BO3"
RoR_SoR_T1.BONumber[100][0] = "RoR_SoR_T1WindowRealm2BO4"


RoR_SoR_T1.BONumber[106] = {}
RoR_SoR_T1.BONumber[106][228] = "RoR_SoR_T1WindowRealm2BO1"
RoR_SoR_T1.BONumber[106][5097] = "RoR_SoR_T1WindowRealm2BO2"
RoR_SoR_T1.BONumber[106][5096] = "RoR_SoR_T1WindowRealm2BO3"
RoR_SoR_T1.BONumber[106][0] = "RoR_SoR_T1WindowRealm2BO4"

RoR_SoR_T1.BONumber[200] = {}
RoR_SoR_T1.BONumber[200][5074] = "RoR_SoR_T1WindowRealm3BO1"
RoR_SoR_T1.BONumber[200][5075] = "RoR_SoR_T1WindowRealm3BO2"
RoR_SoR_T1.BONumber[200][5073] = "RoR_SoR_T1WindowRealm3BO3"
RoR_SoR_T1.BONumber[200][5072] = "RoR_SoR_T1WindowRealm3BO4"

RoR_SoR_T1.BONumber[206] = {}
RoR_SoR_T1.BONumber[206][5074] = "RoR_SoR_T1WindowRealm3BO1"
RoR_SoR_T1.BONumber[206][5075] = "RoR_SoR_T1WindowRealm3BO2"
RoR_SoR_T1.BONumber[206][5073] = "RoR_SoR_T1WindowRealm3BO3"
RoR_SoR_T1.BONumber[206][5072] = "RoR_SoR_T1WindowRealm3BO4"

RoR_SoR_T1.BOTimer = {}

RoR_SoR_T1.BOTimer[6] = {}
RoR_SoR_T1.BOTimer[6][5099] = 0
RoR_SoR_T1.BOTimer[6][1] = 0
RoR_SoR_T1.BOTimer[6][5098] = 0
RoR_SoR_T1.BOTimer[6][2] = 0

RoR_SoR_T1.BOTimer[11] = {}
RoR_SoR_T1.BOTimer[11][5099] = 0
RoR_SoR_T1.BOTimer[11][1] = 0
RoR_SoR_T1.BOTimer[11][5098] = 0
RoR_SoR_T1.BOTimer[11][2] = 0

RoR_SoR_T1.BOTimer[100] = {}
RoR_SoR_T1.BOTimer[100][228] = 0
RoR_SoR_T1.BOTimer[100][5097] = 0
RoR_SoR_T1.BOTimer[100][5096] = 0
RoR_SoR_T1.BOTimer[100][0] = 0


RoR_SoR_T1.BOTimer[106] = {}
RoR_SoR_T1.BOTimer[106][228] = 0
RoR_SoR_T1.BOTimer[106][5097] = 0
RoR_SoR_T1.BOTimer[106][5096] = 0
RoR_SoR_T1.BOTimer[106][0] = 0

RoR_SoR_T1.BOTimer[206] = {}
RoR_SoR_T1.BOTimer[206][5074] = 0
RoR_SoR_T1.BOTimer[206][5075] = 0
RoR_SoR_T1.BOTimer[206][5073] = 0
RoR_SoR_T1.BOTimer[206][5072] = 0

RoR_SoR_T1.BOTimer[200] = {}
RoR_SoR_T1.BOTimer[200][5074] = 0
RoR_SoR_T1.BOTimer[200][5075] = 0
RoR_SoR_T1.BOTimer[200][5073] = 0
RoR_SoR_T1.BOTimer[200][5072] = 0



--checks and sets locks for locked zones at start


	for i=1,3 do
		WindowSetTintColor( "RoR_SoR_T1WindowRealm"..i, 80,80,80 )

		end
		


LabelSetText("RoR_SoR_T1WindowRealm1ZONE_PARING",towstring(GetZoneName(6))..L" - "..towstring(GetZoneName(T1PairedZone[6])))

LabelSetText("RoR_SoR_T1WindowRealm2ZONE_PARING",towstring(GetZoneName(106))..L" - "..towstring(GetZoneName(T1PairedZone[106])))

LabelSetText("RoR_SoR_T1WindowRealm3ZONE_PARING",towstring(GetZoneName(206))..L" - "..towstring(GetZoneName(T1PairedZone[206])))
--[[

WindowSetShowing("RoR_SoR_T1WindowRealm1VP_ORDER",false)
WindowSetShowing("RoR_SoR_T1WindowRealm2VP_ORDER",false)
WindowSetShowing("RoR_SoR_T1WindowRealm3VP_ORDER",false)

WindowSetShowing("RoR_SoR_T1WindowRealm1VP_DESTRO",false)
WindowSetShowing("RoR_SoR_T1WindowRealm2VP_DESTRO",false)
WindowSetShowing("RoR_SoR_T1WindowRealm3VP_DESTRO",false)

--]]
--WindowSetOffsetFromParent("RoR_SoR_T1WindowRealm2BO1",45,58)
--WindowSetOffsetFromParent("RoR_SoR_T1WindowRealm2BO2",95,160)	
--WindowSetOffsetFromParent("RoR_SoR_T1WindowRealm2BO3",145,160)	



end
function RoR_SoR_T1.OnChatLogUpdated(updateType, filterType) --premade chat checker for future chat updates
	if( updateType == SystemData.TextLogUpdate.ADDED ) then 

			
		if filterType == SystemData.ChatLogFilters.CHANNEL_9 then	
			local _, filterId, text = TextLogGetEntry( "Chat", TextLogGetNumEntries("Chat") - 1 ) 
			--	if text:find(L"!update") then 
				--PlaySound(GameData.Sound.QUEST_ABANDONED)
			--	RoR_SoR_T1.ZoneUpdate()
			RoR_SoR_T1.BO(text)
			--end

			end
	end
end



function RoR_SoR_T1.BO(text)


	--d(linkData)
local baba = towstring(text)

if baba:match( L"SoR_T1_BO:([^%.]+).") then	
local Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY= baba:match( L"SoR_T1_BO:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
if RoR_SoR_T1.Debug == true then 
d(L"==========ZONE UPDATE===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"VPS: Order:"..towstring(tonumber(VP))..L" , Destro:"..towstring(100-(tonumber(VP))))
d(L"Supply: "..towstring(SUPPLY))
d(L"BO1 ID: "..towstring(BO1_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO1_ID)))..L") Owner: "..towstring(BO1_OWNER)..L" , State: "..towstring(BO1_STATE)..L" , Timer: "..towstring(BO1_TIMER))
d(L"BO2 ID: "..towstring(BO2_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO2_ID)))..L") Owner: "..towstring(BO2_OWNER)..L" , State: "..towstring(BO2_STATE)..L" , Timer: "..towstring(BO2_TIMER))
d(L"BO3 ID: "..towstring(BO3_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO3_ID)))..L") Owner: "..towstring(BO3_OWNER)..L" , State: "..towstring(BO3_STATE)..L" , Timer: "..towstring(BO3_TIMER))
d(L"BO4 ID: "..towstring(BO4_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO4_ID)))..L") Owner: "..towstring(BO4_OWNER)..L" , State: "..towstring(BO4_STATE)..L" , Timer: "..towstring(BO4_TIMER))
d(L"===============================")
end
RoR_SoR_T1.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)
--PlaySound(GameData.Sound.QUEST_ABANDONED)

elseif baba:match( L"SoR_T1_BO_Update:([^%.]+).") then	
local Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER= baba:match( L"SoR_T1_BO_Update:(%d+):(%d+):(%d+):(%d+):(%d+)")
RoR_SoR_T1_String = StringSplit(tostring(text), ":")
RoR_SoR_T1.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)
if RoR_SoR_T1.Debug == true then 
d(L"=========!SINGLE BO UPDATE!============")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"BO ID: "..towstring(BO_ID)..L" , BO Owner: "..towstring(BO_OWNER)..L" , State: "..towstring(BO_STATE)..L" , Timer: "..towstring(BO_TIMER))
d(L"===============================")
end

end


end





function RoR_SoR_T1.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)

d(towstring(BO1_TIMER)..L" , "..towstring(BO2_TIMER)..L" , "..towstring(BO3_TIMER)..L" , "..towstring(BO4_TIMER))

local Test_Zone = tonumber(Zone)

local Test_BO1_Owner = tonumber(BO1_OWNER)
local Test_BO2_Owner = tonumber(BO2_OWNER)
local Test_BO3_Owner = tonumber(BO3_OWNER)
local Test_BO4_Owner = tonumber(BO4_OWNER)

local Test_BO1_ID = tonumber(BO1_ID)
local Test_BO2_ID = tonumber(BO2_ID)
local Test_BO3_ID = tonumber(BO3_ID)
local Test_BO4_ID = tonumber(BO4_ID)


local Test_BO1_State = tonumber(BO1_STATE)
local Test_BO2_State = tonumber(BO2_STATE)
local Test_BO3_State = tonumber(BO3_STATE)
local Test_BO4_State = tonumber(BO4_STATE)

local Test_BO1_Timer = tonumber(BO1_TIMER)
local Test_BO2_Timer = tonumber(BO2_TIMER)
local Test_BO3_Timer = tonumber(BO3_TIMER)
local Test_BO4_Timer = tonumber(BO4_TIMER)

local Test_VP = tonumber(VP)
local Test_SUPPLY = tonumber(SUPPLY)

--set the bo owner for tooltip
RoR_SoR_T1.BoOwner[T1ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_Owner
RoR_SoR_T1.BoOwner[T1ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_Owner
RoR_SoR_T1.BoOwner[T1ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_Owner
RoR_SoR_T1.BoOwner[T1ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_Owner

RoR_SoR_T1.BoState[T1ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_State
RoR_SoR_T1.BoState[T1ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_State
RoR_SoR_T1.BoState[T1ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_State
RoR_SoR_T1.BoState[T1ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_State





RoR_SoR_T1.Update_ONE_BO(Test_Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER)
RoR_SoR_T1.Update_ONE_BO(Test_Zone,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER)
RoR_SoR_T1.Update_ONE_BO(Test_Zone,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER)
RoR_SoR_T1.Update_ONE_BO(Test_Zone,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER)


RoR_SoR_T1.Flag = {}

RoR_SoR_T1.Flag[1] = tostring(RoR_SoR_T1.GetFlag(Test_BO1_Owner,Test_BO1_State))
RoR_SoR_T1.Flag[2] = tostring(RoR_SoR_T1.GetFlag(Test_BO2_Owner,Test_BO2_State))
RoR_SoR_T1.Flag[3] = tostring(RoR_SoR_T1.GetFlag(Test_BO3_Owner,Test_BO3_State))
RoR_SoR_T1.Flag[4] = tostring(RoR_SoR_T1.GetFlag(Test_BO4_Owner,Test_BO4_State))


--check if zone lock and do stuff:
if Test_BO1_State == 9 then
--DynamicImageSetTextureSlice( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."LOCK", RoR_SoR_T1.Flag[1] )
DynamicImageSetTexture( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."LOCK", RoR_SoR_T1.Flag[1],31,31 )
		WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."LOCK",true)
		
		WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."LOCKED_TEXT",true)
		
				WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."VP_ORDERBAR",false)
		WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."VP_DESTROBAR",false)
		
		WindowSetTintColor( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]), 80,80,80 )
				LabelSetText(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."PERCENT_ORDER",L"")
LabelSetText(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."PERCENT_DESTRO",L"")
WindowSetFontAlpha(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."ZONE_NAME",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."ZONE_TIER",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."ZONE_PARING",0.4)

else
DynamicImageSetTexture( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."LOCK", "SoR_Neutral-Locked" )
		WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."LOCK",false)
		WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."LOCKED_TEXT",false)
	WindowSetTintColor( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]), 255,255,255 )
	WindowSetTintColor( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]].."VP_ORDERBAR"), 50,50,255 )
	WindowSetTintColor( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]].."VP_DESTROBAR"), 200,0,0 )

	WindowSetFontAlpha(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."ZONE_NAME",1)
WindowSetFontAlpha(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."ZONE_TIER",1)
WindowSetFontAlpha(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."ZONE_PARING",1)

	
					WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."VP_ORDERBAR",true)
		WindowSetShowing( tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."VP_DESTROBAR",true)
	
LabelSetText(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."PERCENT_ORDER",towstring(Test_VP)..L"%")
LabelSetText(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."PERCENT_DESTRO",towstring(100-Test_VP)..L"%")
	
	
end

--local DataZone = GetCampaignZoneData(Test_Zone)
--LabelSetText(tostring(RoR_SoR_T1.ZoneNumber[T1ComboZone[Test_Zone]]).."ZONE_TIER",L"T"..towstring(DataZone.tierId))



for i=1,4 do
DynamicImageSetTexture( tostring(RoR_SoR_T1.ZoneNumber[Test_Zone]).."BO"..i, RoR_SoR_T1.Flag[i],31,31 )
end


return
end

function RoR_SoR_T1.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)


local Test_Zone2 = tonumber(Zone)
local Test_BO_ID2 = tonumber(BO_ID)
local Test_BO_Owner2 = tonumber(BO_OWNER)
local Test_BO_State2 = tonumber(BO_STATE)
local Test_BO_Timer2 = tonumber(BO_TIMER)


RoR_SoR_T1.Flag = tostring(RoR_SoR_T1.GetFlag(Test_BO_Owner2,Test_BO_State2))
DynamicImageSetTexture( tostring(RoR_SoR_T1.BONumber[T1ComboZone[Test_Zone2]][Test_BO_ID2]), tostring(RoR_SoR_T1.Flag),31,31)



RoR_SoR_T1.BoOwner[T1ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_Owner2
RoR_SoR_T1.BoState[T1ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_State2


RoR_SoR_T1.BOTimer[T1ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_Timer2


return
end


function RoR_SoR_T1.GetFlag(BO_OWNER,BO_STATE)
local Owner = tonumber(BO_OWNER)
local State = tonumber(BO_STATE)

if State == 0 then
	if Owner == 0 then return "SoR_Neutral" end
	if Owner == 1 then return "SoR_Order" end
	if Owner == 2 then return "SoR_Destro" end
elseif State == 4 then
	if Owner == 0 then return "SoR_Neutral-Burning" end
	if Owner == 1 then return "SoR_Order-Burning" end
	if Owner == 2 then return "SoR_Destro-Burning" end
elseif State == 8 then
	if Owner == 0 then return "SoR_Neutral-Locked" end
	if Owner == 1 then return "SoR_Order-Locked" end
	if Owner == 2 then return "SoR_Destro-Locked" end
elseif State == 9 then
	if Owner == 0 then return "SoR_Neutral-Locked" end
	if Owner == 1 then return "SoR_Order-Locked" end
	if Owner == 2 then return "SoR_Destro-Locked" end	
elseif State == 10 then
	if Owner == 0 then return "SoR_Neutral" end
	if Owner == 1 then return "SoR_Order-Locked" end
	if Owner == 2 then return "SoR_Destro-Locked" end		
elseif State == 16 then
	if Owner == 0 then return "SoR_Neutral-Glowing" end
	if Owner == 1 then return "SoR_Order-Glowing" end
	if Owner == 2 then return "SoR_Destro-Glowing" end
else
	if Owner == 0 then return "SoR_Neutral" end
	if Owner == 1 then return "SoR_Order" end
	if Owner == 2 then return "SoR_Destro" end
end

end

function RoR_SoR_T1.ZoneUpdate()
local Zone1 = GetCampaignZoneData(6 )
local Zone2 = GetCampaignZoneData(106 )
local Zone3 = GetCampaignZoneData(200 ) 



RoR_SoR_T1.Flag = {}




--Update the "progressbars" in the zone pairings
local Width_Zone1_Order = ( ( Zone1.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm1VP_ORDER", Width_Zone1_Order+2, 4 )
if Zone1.controlPoints[1] > 0 then WindowSetShowing("RoR_SoR_T1WindowRealm1VP_ORDER",true) else WindowSetShowing("RoR_SoR_T1WindowRealm1VP_ORDER",false) end

local Width_Zone1_Destro = ( ( Zone1.controlPoints[2] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm1VP_DESTRO", Width_Zone1_Destro+2, 4 )
if Zone1.controlPoints[2] > 0 then WindowSetShowing("RoR_SoR_T1WindowRealm1VP_DESTRO",true) else WindowSetShowing("RoR_SoR_T1WindowRealm1VP_DESTRO",false) end

local Width_Zone2_Order = ( ( Zone2.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm2VP_ORDER", Width_Zone2_Order+2, 4 )
if Zone2.controlPoints[1] > 0 then WindowSetShowing("RoR_SoR_T1WindowRealm2VP_ORDER",true) else WindowSetShowing("RoR_SoR_T1WindowRealm2VP_ORDER",false) end

local Width_Zone2_Destro = ( ( Zone2.controlPoints[2] / 100 ) * 147 ) --152
WindowSetDimensions( "RoR_SoR_T1WindowRealm2VP_DESTRO", Width_Zone2_Destro+2, 4 )
if Zone2.controlPoints[2] > 0 then WindowSetShowing("RoR_SoR_T1WindowRealm2VP_DESTRO",true) else WindowSetShowing("RoR_SoR_T1WindowRealm2VP_DESTRO",false) end

local Width_Zone3_Order = ( ( Zone3.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm3VP_ORDER", Width_Zone3_Order+2, 4 )
if Zone3.controlPoints[1] > 0 then WindowSetShowing("RoR_SoR_T1WindowRealm3VP_ORDER",true) else WindowSetShowing("RoR_SoR_T1WindowRealm3VP_ORDER",false) end

local Width_Zone3_Destro = ( ( Zone3.controlPoints[2] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T1WindowRealm3VP_DESTRO", Width_Zone3_Destro+2, 4 )
if Zone3.controlPoints[2] > 0 then WindowSetShowing("RoR_SoR_T1WindowRealm3VP_DESTRO",true) else WindowSetShowing("RoR_SoR_T1WindowRealm3VP_DESTRO",false) end

LabelSetText("RoR_SoR_T1WindowRealm1PERCENT_ORDER",towstring(Zone1.controlPoints[1]*2)..L"%")
LabelSetText("RoR_SoR_T1WindowRealm1PERCENT_DESTRO",towstring(Zone1.controlPoints[2]*2)..L"%")		

LabelSetText("RoR_SoR_T1WindowRealm2PERCENT_ORDER",towstring(Zone2.controlPoints[1]*2)..L"%")
LabelSetText("RoR_SoR_T1WindowRealm2PERCENT_DESTRO",towstring(Zone2.controlPoints[2]*2)..L"%")

LabelSetText("RoR_SoR_T1WindowRealm3PERCENT_ORDER",towstring(Zone3.controlPoints[1]*2)..L"%")
LabelSetText("RoR_SoR_T1WindowRealm3PERCENT_DESTRO",towstring(Zone3.controlPoints[2]*2)..L"%")





-- unlock dwarf
if RoR_SoR_T1.LockedState[1] == true and (Zone1.controlPoints[1] < 90 and Zone1.controlPoints[2] < 90) then
RoR_SoR_T1.LockedState[1] = false
RoR_SoR_T1.LockedRealm[1] = 0
RoR_SoR_T1.BoOwner[6][5099] = 0
RoR_SoR_T1.BoOwner[6][1] = 0
RoR_SoR_T1.BoOwner[6][5098] = 0
RoR_SoR_T1.BoOwner[6][2] = 0

RoR_SoR_T1.BoState[6][5099] = 0
RoR_SoR_T1.BoState[6][1] = 0
RoR_SoR_T1.BoState[6][5098] = 0
RoR_SoR_T1.BoState[6][2] = 0

DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1LOCK", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO1", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO2", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO3", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO4", "SoR_Neutral",31,31 )
end

--Dwarf locks
if Zone1.controlPoints[1] == 100 then
RoR_SoR_T1.LockedState[1] = true
LabelSetText("RoR_SoR_T1WindowRealm1LOCKED_TEXT",RoR_SoR.TextZoneLocked)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",0.4)
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1LOCK", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO1", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO2", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO3", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO4", "SoR_Order-Locked",31,31 )
WindowSetShowing("RoR_SoR_T1WindowRealm1LOCK",true)		
WindowSetShowing( "RoR_SoR_T1WindowRealm1LOCKED_TEXT",true)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm1", 80,80,80 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",0.4)
WindowSetShowing("RoR_SoR_T1WindowRealm1PERCENT_ORDER",false)	
WindowSetShowing("RoR_SoR_T1WindowRealm1PERCENT_DESTRO",false)
WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_ORDERBAR",false)
WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_DESTROBAR",false)	
RoR_SoR_T1.LockedRealm[1] = 1

RoR_SoR_T1.BoOwner[6][5099] = 1
RoR_SoR_T1.BoOwner[6][1] = 1
RoR_SoR_T1.BoOwner[6][5098] = 1
RoR_SoR_T1.BoOwner[6][2] = 1

RoR_SoR_T1.BoState[6][5099] = 9
RoR_SoR_T1.BoState[6][1] = 9
RoR_SoR_T1.BoState[6][5098] = 9
RoR_SoR_T1.BoState[6][2] = 9

elseif Zone1.controlPoints[2] == 100 then
RoR_SoR_T1.LockedState[1] = true
LabelSetText("RoR_SoR_T1WindowRealm1LOCKED_TEXT",RoR_SoR.TextZoneLocked)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",0.4)
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1LOCK", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO1", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO2", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO3", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm1BO4", "SoR_Destro-Locked",31,31 )
WindowSetShowing("RoR_SoR_T1WindowRealm1LOCK",true)		
WindowSetShowing( "RoR_SoR_T1WindowRealm1LOCKED_TEXT",true)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm1", 80,80,80 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",0.4)
WindowSetShowing("RoR_SoR_T1WindowRealm1PERCENT_ORDER",false)	
WindowSetShowing("RoR_SoR_T1WindowRealm1PERCENT_DESTRO",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_ORDERBAR",false)
WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_DESTROBAR",false)
RoR_SoR_T1.LockedRealm[1] = 2

RoR_SoR_T1.BoOwner[6][5099] = 2
RoR_SoR_T1.BoOwner[6][1] = 2
RoR_SoR_T1.BoOwner[6][5098] = 2
RoR_SoR_T1.BoOwner[6][2] = 2

RoR_SoR_T1.BoState[6][5099] = 9
RoR_SoR_T1.BoState[6][1] = 9
RoR_SoR_T1.BoState[6][5098] = 9
RoR_SoR_T1.BoState[6][2] = 9
else
WindowSetTintColor("RoR_SoR_T1WindowRealm1VP_ORDERBAR",50,50,255)
WindowSetTintColor("RoR_SoR_T1WindowRealm1VP_DESTROBAR",255,0,0)
LabelSetText("RoR_SoR_T1WindowRealm1LOCKED_TEXT",L"")
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",1)
WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_ORDERBAR",true)
WindowSetShowing( "RoR_SoR_T1WindowRealm1VP_DESTROBAR",true)
WindowSetShowing("RoR_SoR_T1WindowRealm1LOCK",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm1LOCKED_TEXT",false)
WindowSetTintColor( "RoR_SoR_T1WindowRealm1", 255,255,255 )	
WindowSetTintColor( "RoR_SoR_T1WindowRealm1ZONE_NAME", 255,255,255 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm1ZONE_NAME",1)
WindowSetShowing("RoR_SoR_T1WindowRealm1PERCENT_ORDER",true)	
WindowSetShowing("RoR_SoR_T1WindowRealm1PERCENT_DESTRO",true)	
RoR_SoR_T1.LockedRealm[1] = 0
end

-- unlock empire
if RoR_SoR_T1.LockedState[2] == true and (Zone2.controlPoints[1] < 90 and Zone2.controlPoints[2] < 90) then
RoR_SoR_T1.LockedState[2] = false
RoR_SoR_T1.LockedRealm[2] = 0
RoR_SoR_T1.BoOwner[106][228] = 0
RoR_SoR_T1.BoOwner[106][5097] = 0
RoR_SoR_T1.BoOwner[106][5096] = 0
RoR_SoR_T1.BoOwner[106][0] = 0

RoR_SoR_T1.BoState[106][228] = 0
RoR_SoR_T1.BoState[106][5097] = 0
RoR_SoR_T1.BoState[106][5096] = 0
RoR_SoR_T1.BoState[106][0] = 0

DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2LOCK", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO1", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO2", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO3", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO4", "SoR_Neutral",31,31 )
end

-- lock empire

if Zone2.controlPoints[1] == 100 then
RoR_SoR_T1.LockedState[2] = true
LabelSetText("RoR_SoR_T1WindowRealm2LOCKED_TEXT",RoR_SoR.TextZoneLocked)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",0.4)
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2LOCK", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO1", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO2", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO3", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO4", "SoR_Order-Locked",31,31 )
WindowSetShowing("RoR_SoR_T1WindowRealm2LOCK",true)		
WindowSetShowing( "RoR_SoR_T1WindowRealm2LOCKED_TEXT",true)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm2", 80,80,80 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",0.4)
WindowSetShowing("RoR_SoR_T1WindowRealm2PERCENT_ORDER",false)	
WindowSetShowing("RoR_SoR_T1WindowRealm2PERCENT_DESTRO",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_ORDERBAR",false)
WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_DESTROBAR",false)
RoR_SoR_T1.LockedRealm[2] = 1

RoR_SoR_T1.BoOwner[106][228] = 1
RoR_SoR_T1.BoOwner[106][5097] = 1
RoR_SoR_T1.BoOwner[106][5096] = 1
RoR_SoR_T1.BoOwner[106][0] = 1

RoR_SoR_T1.BoState[106][228] = 9
RoR_SoR_T1.BoState[106][5097] = 9
RoR_SoR_T1.BoState[106][5096] = 9
RoR_SoR_T1.BoState[106][0] = 9

elseif Zone2.controlPoints[2] == 100 then
RoR_SoR_T1.LockedState[2] = true
LabelSetText("RoR_SoR_T1WindowRealm2LOCKED_TEXT",RoR_SoR.TextZoneLocked)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",0.4)
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2LOCK", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO1", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO2", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO3", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm2BO4", "SoR_Destro-Locked",31,31 )
WindowSetShowing("RoR_SoR_T1WindowRealm2LOCK",true)		
WindowSetShowing( "RoR_SoR_T1WindowRealm2LOCKED_TEXT",true)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm2", 80,80,80 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",0.4)
WindowSetShowing("RoR_SoR_T1WindowRealm2PERCENT_ORDER",false)	
WindowSetShowing("RoR_SoR_T1WindowRealm2PERCENT_DESTRO",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_ORDERBAR",false)
WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_DESTROBAR",false)
RoR_SoR_T1.LockedRealm[2] = 2

RoR_SoR_T1.BoOwner[106][228] = 2
RoR_SoR_T1.BoOwner[106][5097] = 2
RoR_SoR_T1.BoOwner[106][5096] = 2
RoR_SoR_T1.BoOwner[106][0] = 2

RoR_SoR_T1.BoState[106][228] = 9
RoR_SoR_T1.BoState[106][5097] = 9
RoR_SoR_T1.BoState[106][5096] = 9
RoR_SoR_T1.BoState[106][0] = 9

else
WindowSetTintColor("RoR_SoR_T1WindowRealm2VP_ORDERBAR",50,50,255)
WindowSetTintColor("RoR_SoR_T1WindowRealm2VP_DESTROBAR",255,0,0)
WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_ORDERBAR",true)
WindowSetShowing( "RoR_SoR_T1WindowRealm2VP_DESTROBAR",true)

LabelSetText("RoR_SoR_T1WindowRealm2LOCKED_TEXT",L"")
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",1)
WindowSetShowing("RoR_SoR_T1WindowRealm2LOCK",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm2LOCKED_TEXT",false)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm2", 255,255,255 )
WindowSetTintColor( "RoR_SoR_T1WindowRealm2ZONE_NAME", 255,255,255 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm2ZONE_NAME",1)
WindowSetShowing("RoR_SoR_T1WindowRealm2PERCENT_ORDER",true)	
WindowSetShowing("RoR_SoR_T1WindowRealm2PERCENT_DESTRO",true)	
RoR_SoR_T1.LockedRealm[2] = 0
end

-- unlock Elf
if RoR_SoR_T1.LockedState[3] == true and (Zone3.controlPoints[1] < 90 and Zone3.controlPoints[2] < 90) then
RoR_SoR_T1.LockedState[3] = false
RoR_SoR_T1.LockedRealm[3] = 0
RoR_SoR_T1.BoOwner[206][5074] = 0
RoR_SoR_T1.BoOwner[206][5075] = 0
RoR_SoR_T1.BoOwner[206][5073] = 0
RoR_SoR_T1.BoOwner[206][5072] = 0

RoR_SoR_T1.BoState[206][5074] = 0
RoR_SoR_T1.BoState[206][5075] = 0
RoR_SoR_T1.BoState[206][5073] = 0
RoR_SoR_T1.BoState[206][5072] = 0

DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3LOCK", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO1", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO2", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO3", "SoR_Neutral",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO4", "SoR_Neutral",31,31 )
end
--lock elf

if Zone3.controlPoints[1] == 100 then
RoR_SoR_T1.LockedState[3] = true
LabelSetText("RoR_SoR_T1WindowRealm3LOCKED_TEXT",RoR_SoR.TextZoneLocked)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",0.4)
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3LOCK", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO1", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO2", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO3", "SoR_Order-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO4", "SoR_Order-Locked",31,31 )
WindowSetShowing("RoR_SoR_T1WindowRealm3LOCK",true)		
WindowSetShowing( "RoR_SoR_T1WindowRealm3LOCKED_TEXT",true)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm3", 80,80,80 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",0.4)
WindowSetShowing("RoR_SoR_T1WindowRealm3PERCENT_ORDER",false)	
WindowSetShowing("RoR_SoR_T1WindowRealm3PERCENT_DESTRO",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_ORDERBAR",false)
WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_DESTROBAR",false)
RoR_SoR_T1.LockedRealm[3] = 1
RoR_SoR_T1.BoOwner[206][5074] = 1
RoR_SoR_T1.BoOwner[206][5075] = 1
RoR_SoR_T1.BoOwner[206][5073] = 1
RoR_SoR_T1.BoOwner[206][5072] = 1

RoR_SoR_T1.BoState[206][5074] = 9
RoR_SoR_T1.BoState[206][5075] = 9
RoR_SoR_T1.BoState[206][5073] = 9
RoR_SoR_T1.BoState[206][5072] = 9

elseif Zone3.controlPoints[2] == 100 then
RoR_SoR_T1.LockedState[3] = true
LabelSetText("RoR_SoR_T1WindowRealm3LOCKED_TEXT",RoR_SoR.TextZoneLocked)
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",0.4)
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3LOCK", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO1", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO2", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO3", "SoR_Destro-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T1WindowRealm3BO4", "SoR_Destro-Locked",31,31 )
WindowSetShowing("RoR_SoR_T1WindowRealm3LOCK",true)		
WindowSetShowing( "RoR_SoR_T1WindowRealm3LOCKED_TEXT",true)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm3", 80,80,80 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",0.4)
WindowSetShowing("RoR_SoR_T1WindowRealm3PERCENT_ORDER",false)	
WindowSetShowing("RoR_SoR_T1WindowRealm3PERCENT_DESTRO",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_ORDERBAR",false)
WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_DESTROBAR",false)
RoR_SoR_T1.LockedRealm[3] = 2

RoR_SoR_T1.BoOwner[206][5074] = 2
RoR_SoR_T1.BoOwner[206][5075] = 2
RoR_SoR_T1.BoOwner[206][5073] = 2
RoR_SoR_T1.BoOwner[206][5072] = 2

RoR_SoR_T1.BoState[206][5074] = 9
RoR_SoR_T1.BoState[206][5075] = 9
RoR_SoR_T1.BoState[206][5073] = 9
RoR_SoR_T1.BoState[206][5072] = 9

else
WindowSetTintColor("RoR_SoR_T1WindowRealm3VP_ORDERBAR",50,50,255)
WindowSetTintColor("RoR_SoR_T1WindowRealm3VP_DESTROBAR",255,0,0)
LabelSetText("RoR_SoR_T1WindowRealm3LOCKED_TEXT",L"")
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",1)
WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_ORDERBAR",true)
WindowSetShowing( "RoR_SoR_T1WindowRealm3VP_DESTROBAR",true)
WindowSetShowing("RoR_SoR_T1WindowRealm3LOCK",false)	
WindowSetShowing( "RoR_SoR_T1WindowRealm3LOCKED_TEXT",false)	
WindowSetTintColor( "RoR_SoR_T1WindowRealm3", 255,255,255 )
WindowSetTintColor( "RoR_SoR_T1WindowRealm3ZONE_NAME", 255,255,255 )
WindowSetFontAlpha("RoR_SoR_T1WindowRealm3ZONE_NAME",1)
WindowSetShowing("RoR_SoR_T1WindowRealm3PERCENT_ORDER",true)	
WindowSetShowing("RoR_SoR_T1WindowRealm3PERCENT_DESTRO",true)	
RoR_SoR_T1.LockedRealm[3] = 0
end

--------------------------------------------------------------------------------------------------





end



function RoR_SoR_T1.TimeUpdate(timeElapsed)
for i = 1,3 do

for k, v in pairs(RoR_SoR_T1.BOTimer[RoR_SoR_T1.T1Zones[i]]) do
if v > 0 then 
RoR_SoR_T1.BOTimer[RoR_SoR_T1.T1Zones[i]][k] = RoR_SoR_T1.BOTimer[RoR_SoR_T1.T1Zones[i]][k] - timeElapsed
LabelSetText(tostring(RoR_SoR_T1.BONumber[RoR_SoR_T1.T1Zones[i]][k]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[RoR_SoR_T1.T1Zones[i]][k])))


	if RoR_SoR_T1.BoState[RoR_SoR_T1.T1Zones[i]][k] == 16 then
		local GetRealmColor = RoR_SoR_T1.BoOwner[RoR_SoR_T1.T1Zones[i]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.RealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T1.BONumber[RoR_SoR_T1.T1Zones[i]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 
	elseif 	RoR_SoR_T1.BoState[RoR_SoR_T1.T1Zones[i]][k] == 4 then
		local GetRealmColor = RoR_SoR_T1.BoOwner[RoR_SoR_T1.T1Zones[i]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.InvertRealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T1.BONumber[RoR_SoR_T1.T1Zones[i]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 	
	end


else
LabelSetText(tostring(RoR_SoR_T1.BONumber[RoR_SoR_T1.T1Zones[i]][k]).."_TIMER",L"")
--d(L"k= "..towstring(k)) --k is ID
--d(L"v= "..towstring(v)) -- v is value
end
end


end


RoR_SoR_T1.Timer = RoR_SoR_T1.Timer + timeElapsed
if RoR_SoR_T1.Timer > 1 then 
RoR_SoR_T1.Timer = 0
RoR_SoR_T1.ZoneUpdate()
end

end

function RoR_SoR_T1.OnMouseOverStart()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local WindowName = towstring(SystemData.MouseOverWindow.name)
local FinalName = WindowName:match(L"RoR_SoR_T1Window([^%.]+)")
local Line1 = L""
local Line2 = L""
local Line3 = L""
if FinalName ~= nil or FinalName ~= "" then
--d(L"Tooltip "..towstring(FinalName))
--	d(L"Tooltip "..towstring(WindowName))
--Dwarf 


if FinalName == L"Realm1BO1" then
Line1 = towstring(GetObjectiveName(5099))
if RoR_SoR_T1.BOTimer[6][5099] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[6][5099])) else Line2 = L"" end
Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[6]][5099],RoR_SoR_T1.BoState[T1ComboZone[6]][5099])
elseif FinalName == L"Realm1BO2" then
Line1 = towstring(GetObjectiveName(1))
if RoR_SoR_T1.BOTimer[6][1] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[6][1])) else Line2 = L"" end
Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[6]][1],RoR_SoR_T1.BoState[T1ComboZone[6]][1])
elseif FinalName == L"Realm1BO3" then
Line1 = towstring(GetObjectiveName(5098))
if RoR_SoR_T1.BOTimer[6][5098] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[6][5098])) else Line2 = L"" end
Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[6]][5098],RoR_SoR_T1.BoState[T1ComboZone[6]][5098])
elseif FinalName == L"Realm1BO4" then
Line1 = towstring(GetObjectiveName(2))
if RoR_SoR_T1.BOTimer[6][2] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[6][2])) else Line2 = L"" end
Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[6]][2],RoR_SoR_T1.BoState[T1ComboZone[6]][2])

	elseif FinalName == L"Realm1LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.LockedRealm[1],9)	

--empire
elseif FinalName == L"Realm2BO1" then
Line1 = towstring(GetObjectiveName(228))
if RoR_SoR_T1.BOTimer[106][228] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[106][228])) else Line2 = L"" end
Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[106]][228],RoR_SoR_T1.BoState[T1ComboZone[106]][228])
elseif FinalName == L"Realm2BO2" then
Line1 = towstring(GetObjectiveName(5097))
if RoR_SoR_T1.BOTimer[106][5097] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[106][5097])) else Line2 = L"" end
Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[106]][5097],RoR_SoR_T1.BoState[T1ComboZone[106]][5097])
elseif FinalName == L"Realm2BO3" then
Line1 = towstring(GetObjectiveName(5096))
if RoR_SoR_T1.BOTimer[106][5096] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[106][5096])) else Line2 = L"" end
Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[106]][5096],RoR_SoR_T1.BoState[T1ComboZone[106]][5096])

	elseif FinalName == L"Realm2LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.LockedRealm[2],9)	

--Elf
elseif FinalName == L"Realm3BO1" then
	Line1 = towstring(GetObjectiveName(5074))
	if RoR_SoR_T1.BOTimer[206][5074] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[206][5074])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[206]][5074],RoR_SoR_T1.BoState[T1ComboZone[206]][5074])
elseif FinalName == L"Realm3BO2" then
	Line1 = towstring(GetObjectiveName(5075))
	if RoR_SoR_T1.BOTimer[206][5075] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[206][5075])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[206]][5075],RoR_SoR_T1.BoState[T1ComboZone[206]][5075])
elseif FinalName == L"Realm3BO3" then
	Line1 = towstring(GetObjectiveName(5073))
	if RoR_SoR_T1.BOTimer[206][5073] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[206][5073])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[206]][5073],RoR_SoR_T1.BoState[T1ComboZone[206]][5073])
elseif FinalName == L"Realm3BO4" then
--	Line1 = towstring(GetObjectiveName(5072))
--	if RoR_SoR_T1.BOTimer[206][5072] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[206][5072])) else Line2 = L"" end
--	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[206]][5072],RoR_SoR_T1.BoState[T1ComboZone[206]][5072])
	Line1 = towstring(GetObjectiveName(5072))	
	if RoR_SoR_T1.BOTimer[206][5072] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T1.BOTimer[206][5072])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.BoOwner[T1ComboZone[206]][5072],RoR_SoR_T1.BoState[T1ComboZone[206]][5072])	

	elseif FinalName == L"Realm3LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T1.LockedRealm[3],9)	

	
end	






		Tooltips.CreateTextOnlyTooltip(SystemData.MouseOverWindow.name,nil)
		Tooltips.SetTooltipText( 1, 1, Line1)
		Tooltips.SetTooltipColorDef( 1, 1, Tooltips.MAP_DESC_TEXT_COLOR )
	--	Tooltips.SetTooltipText( 2, 1, towstring(Line3))	
if Line2 ~= L""	then Tooltips.SetTooltipText( 2, 1,towstring(Line3)..L" <icon29979>"..towstring(Line2)) else Tooltips.SetTooltipText( 2, 1,towstring(Line3)) end
		Tooltips.Finalize()    
		Tooltips.AnchorTooltip( Tooltips.ANCHOR_WINDOW_TOP )
--Tooltips.CreateTextOnlyTooltip(SystemData.MouseOverWindow.name,towstring(Line1))
--Tooltips.AnchorTooltip (Tooltips.ANCHOR_WINDOW_TOP)
end
end

function RoR_SoR_T1.Close()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local MouseOverWindowName = SystemData.MouseOverWindow.name
	WindowSetShowing(WinParent,false)
	
end


function RoR_SoR_T1.Update(timeElapsed)

end


RoR_SoR_T3 = {}
local version = "104"

function RoR_SoR_T3.OnInitialize()
RegisterEventHandler(TextLogGetUpdateEventId("Chat"), "RoR_SoR_T3.OnChatLogUpdated")

CreateWindow("RoR_SoR_T3Window", true)

CreateWindowFromTemplate( "RoR_SoR_T3WindowRealm1", "T3TemplateRealm1", "RoR_SoR_T3Window" )
	WindowClearAnchors( "RoR_SoR_T3WindowRealm1" )
    WindowAddAnchor( "RoR_SoR_T3WindowRealm1", "topleft", "RoR_SoR_Window", "topleft",38, 40)


CreateWindowFromTemplate( "RoR_SoR_T3WindowRealm2", "T3TemplateRealm1", "RoR_SoR_T3Window" )
	WindowClearAnchors( "RoR_SoR_T3WindowRealm2" )
    WindowAddAnchor( "RoR_SoR_T3WindowRealm2", "bottomleft", "RoR_SoR_T3WindowRealm1", "topleft",0 , -24)

CreateWindowFromTemplate( "RoR_SoR_T3WindowRealm3", "T3TemplateRealm1", "RoR_SoR_T3Window" )
	WindowClearAnchors( "RoR_SoR_T3WindowRealm3" )
    WindowAddAnchor( "RoR_SoR_T3WindowRealm3", "bottomleft", "RoR_SoR_T3WindowRealm2", "topleft",0 , -24)	
	
--	DynamicImageSetTexture ("RoR_SoR_T3WindowRealm2Banner", "Realm2", 256,128)
--	DynamicImageSetTexture ("RoR_SoR_T3WindowRealm3Banner", "Realm3", 256,128)

	DynamicImageSetTextureSlice("RoR_SoR_T3WindowRealm1Menu01", "PairingGvDSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T3WindowRealm2Menu01", "PairingEvCSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T3WindowRealm3Menu01", "PairingElvesSelected")
--LayoutEditor.RegisterWindow( "RoR_SoR_T3Window", L"RoR_SoR_T3", L"RoR_SoR_T3", true, true, true, nil )
--RegisterEventHandler(SystemData.Events.ALL_MODULES_INITIALIZED, "RoR_SoR_T3.ZoneUpdate")

--LabelSetText("RoR_SoR_T3WindowTIER_NAME",L"Tier 2 Beta")

RoR_SoR_T3.IsLocked = {}

LabelSetText("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_HEALTH",0.4)
LabelSetText("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_HEALTH",0.4)
LabelSetText("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_HEALTH",0.4)

LabelSetText("RoR_SoR_T3WindowRealm1LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T3WindowRealm2LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T3WindowRealm3LOCKED_TEXT",RoR_SoR.TextZoneLocked)

LabelSetText("RoR_SoR_T3WindowRealm1ZONE_TIER",L"T3")
LabelSetText("RoR_SoR_T3WindowRealm2ZONE_TIER",L"T3")
LabelSetText("RoR_SoR_T3WindowRealm3ZONE_TIER",L"T3")

LabelSetText("RoR_SoR_T3WindowRealm1ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN )))
LabelSetText("RoR_SoR_T3WindowRealm2ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS )))
LabelSetText("RoR_SoR_T3WindowRealm3ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF )))

--hides the race name, on Hargrims request ;(
WindowSetShowing("RoR_SoR_T3WindowRealm1ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3ZONE_NAME",false)

--WindowSetShowing("RoR_SoR_T3WindowRealm1VP_ORDER",false)
--WindowSetShowing("RoR_SoR_T3WindowRealm2VP_ORDER",false)
--WindowSetShowing("RoR_SoR_T3WindowRealm3VP_ORDER",false)

--WindowSetShowing("RoR_SoR_T3WindowRealm1VP_DESTRO",false)
--WindowSetShowing("RoR_SoR_T3WindowRealm2VP_DESTRO",false)
--WindowSetShowing("RoR_SoR_T3WindowRealm3VP_DESTRO",false)

WindowSetShowing("RoR_SoR_T3WindowRealm1ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3ZONE_TIER",false)

WindowSetFontAlpha("RoR_SoR_T3WindowRealm1ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm2ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm3ZONE_NAME",0.4)

WindowSetFontAlpha("RoR_SoR_T3WindowRealm1ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm2ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm3ZONE_TIER",0.4)


WindowSetFontAlpha("RoR_SoR_T3WindowRealm1ZONE_PARING",0.4)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm2ZONE_PARING",0.4)
WindowSetFontAlpha("RoR_SoR_T3WindowRealm3ZONE_PARING",0.4)

RoR_SoR_T3.LockedRealm = {}
RoR_SoR_T3.LockedRealm[8] = 0
RoR_SoR_T3.LockedRealm[108] = 0
RoR_SoR_T3.LockedRealm[208] = 0



RoR_SoR_T3.T2Zones = {8,108,208}


RoR_SoR_T3.KeepClaim = {}
RoR_SoR_T3.KeepClaim[8] = {}
RoR_SoR_T3.KeepClaim[8][3] = 0
RoR_SoR_T3.KeepClaim[8][4] = 0
RoR_SoR_T3.KeepClaim[108] = {}
RoR_SoR_T3.KeepClaim[108][13] = 0
RoR_SoR_T3.KeepClaim[108][14] = 0
RoR_SoR_T3.KeepClaim[208] = {}
RoR_SoR_T3.KeepClaim[208][23] = 0
RoR_SoR_T3.KeepClaim[208][24] = 0

RoR_SoR_T3.KeepHP = {}
RoR_SoR_T3.KeepHP[8] = {}
RoR_SoR_T3.KeepHP[8][3] = 100
RoR_SoR_T3.KeepHP[8][4] = 100
RoR_SoR_T3.KeepHP[108] = {}
RoR_SoR_T3.KeepHP[108][13] = 100
RoR_SoR_T3.KeepHP[108][14] = 100
RoR_SoR_T3.KeepHP[208] = {}
RoR_SoR_T3.KeepHP[208][23] = 100
RoR_SoR_T3.KeepHP[208][24] = 100



T3ComboZone = {}
T3PairedZone = {}
T3ComboZone[8] = 8 
T3ComboZone[2] = 8
T3PairedZone[8] = 2

T3ComboZone[102] = 108 
T3ComboZone[108] = 108
T3PairedZone[108] = 102


T3ComboZone[202] = 208
T3ComboZone[208] = 208
T3PairedZone[208] = 202

T3KeepToNumber = {}
T3KeepToNumber[3] = 1
T3KeepToNumber[4] = 2
T3KeepToNumber[13] = 1
T3KeepToNumber[14] = 2

T3KeepToNumber[23] = 1
T3KeepToNumber[24] = 2


RoR_SoR_T3.ZoneNumber = {}
RoR_SoR_T3.ZoneNumber[8] = "RoR_SoR_T3WindowRealm1"
RoR_SoR_T3.ZoneNumber[108] = "RoR_SoR_T3WindowRealm2"
RoR_SoR_T3.ZoneNumber[208] = "RoR_SoR_T3WindowRealm3"



RoR_SoR_T3.KeepLord = {}
RoR_SoR_T3.KeepLord[1] = "MurderballOrder"
RoR_SoR_T3.KeepLord[2] = "MurderballDestruction"


RoR_SoR_T3.BONumber = {}

--?
RoR_SoR_T3.BONumber[8] = {}
RoR_SoR_T3.BONumber[8][76] = "RoR_SoR_T3WindowRealm1BO1"
RoR_SoR_T3.BONumber[8][90] = "RoR_SoR_T3WindowRealm1BO2"
RoR_SoR_T3.BONumber[8][100] = "RoR_SoR_T3WindowRealm1BO3"
RoR_SoR_T3.BONumber[8][101] = "RoR_SoR_T3WindowRealm1BO4"
--?
RoR_SoR_T3.BONumber[102] = {}
RoR_SoR_T3.BONumber[102][5090] = "RoR_SoR_T3WindowRealm2BO1"
RoR_SoR_T3.BONumber[102][5091] = "RoR_SoR_T3WindowRealm2BO2"
RoR_SoR_T3.BONumber[102][5092] = "RoR_SoR_T3WindowRealm2BO3"
RoR_SoR_T3.BONumber[102][5094] = "RoR_SoR_T3WindowRealm2BO4"

RoR_SoR_T3.BONumber[108] = {}
RoR_SoR_T3.BONumber[108][5090] = "RoR_SoR_T3WindowRealm2BO1"
RoR_SoR_T3.BONumber[108][5091] = "RoR_SoR_T3WindowRealm2BO2"
RoR_SoR_T3.BONumber[108][5092] = "RoR_SoR_T3WindowRealm2BO3"
RoR_SoR_T3.BONumber[108][5094] = "RoR_SoR_T3WindowRealm2BO4"

--?
RoR_SoR_T3.BONumber[101] = {}
RoR_SoR_T3.BONumber[101][239] = "RoR_SoR_T3WindowRealm2BO1"
RoR_SoR_T3.BONumber[101][240] = "RoR_SoR_T3WindowRealm2BO2"
RoR_SoR_T3.BONumber[101][241] = "RoR_SoR_T3WindowRealm2BO3"
RoR_SoR_T3.BONumber[101][242] = "RoR_SoR_T3WindowRealm2BO4"

RoR_SoR_T3.BONumber[208] = {}
RoR_SoR_T3.BONumber[208][5063] = "RoR_SoR_T3WindowRealm3BO1"
RoR_SoR_T3.BONumber[208][5064] = "RoR_SoR_T3WindowRealm3BO2"
RoR_SoR_T3.BONumber[208][5065] = "RoR_SoR_T3WindowRealm3BO3"
RoR_SoR_T3.BONumber[208][5066] = "RoR_SoR_T3WindowRealm3BO4"

RoR_SoR_T3.BOTimer = {}

RoR_SoR_T3.BOTimer[8] = {}
RoR_SoR_T3.BOTimer[8][76] = 0
RoR_SoR_T3.BOTimer[8][90] = 0
RoR_SoR_T3.BOTimer[8][100] = 0
RoR_SoR_T3.BOTimer[8][101] = 0

RoR_SoR_T3.BOTimer[101] = {}
RoR_SoR_T3.BOTimer[101][239] = 0
RoR_SoR_T3.BOTimer[101][240] = 0
RoR_SoR_T3.BOTimer[101][241] = 0
RoR_SoR_T3.BOTimer[101][242] = 0

RoR_SoR_T3.BOTimer[102] = {}
RoR_SoR_T3.BOTimer[102][5090] = 0
RoR_SoR_T3.BOTimer[102][5091] = 0
RoR_SoR_T3.BOTimer[102][5092] = 0
RoR_SoR_T3.BOTimer[102][5094] = 0

RoR_SoR_T3.BOTimer[108] = {}
RoR_SoR_T3.BOTimer[108][5090] = 0
RoR_SoR_T3.BOTimer[108][5091] = 0
RoR_SoR_T3.BOTimer[108][5092] = 0
RoR_SoR_T3.BOTimer[108][5094] = 0

RoR_SoR_T3.BOTimer[208] = {}
RoR_SoR_T3.BOTimer[208][5063] = 0
RoR_SoR_T3.BOTimer[208][5064] = 0
RoR_SoR_T3.BOTimer[208][5065] = 0
RoR_SoR_T3.BOTimer[208][5066] = 0


RoR_SoR_T3.KeepStatus = {}
RoR_SoR_T3.KeepStatus[8] = {}
RoR_SoR_T3.KeepStatus[8][3] = 0
RoR_SoR_T3.KeepStatus[8][4] = 0
RoR_SoR_T3.KeepStatus[108] = {}
RoR_SoR_T3.KeepStatus[108][13] = 0
RoR_SoR_T3.KeepStatus[108][14] = 0
RoR_SoR_T3.KeepStatus[208] = {}
RoR_SoR_T3.KeepStatus[208][23] = 0
RoR_SoR_T3.KeepStatus[208][24] = 0

RoR_SoR_T3.KeepOwner = {}
RoR_SoR_T3.KeepOwner[8] = {}
RoR_SoR_T3.KeepOwner[8][3] = 0
RoR_SoR_T3.KeepOwner[8][4] = 0
RoR_SoR_T3.KeepOwner[108] = {}
RoR_SoR_T3.KeepOwner[108][13] = 0
RoR_SoR_T3.KeepOwner[108][14] = 0
RoR_SoR_T3.KeepOwner[208] = {}
RoR_SoR_T3.KeepOwner[208][23] = 0
RoR_SoR_T3.KeepOwner[208][24] = 0

RoR_SoR_T3.KeepRank = {}
RoR_SoR_T3.KeepRank[8] = {}
RoR_SoR_T3.KeepRank[8][3] = 0
RoR_SoR_T3.KeepRank[8][4] = 0
RoR_SoR_T3.KeepRank[108] = {}
RoR_SoR_T3.KeepRank[108][13] = 0
RoR_SoR_T3.KeepRank[108][14] = 0
RoR_SoR_T3.KeepRank[208] = {}
RoR_SoR_T3.KeepRank[208][23] = 0
RoR_SoR_T3.KeepRank[208][24] = 0

RoR_SoR_T3.KeepMessage = {}
RoR_SoR_T3.KeepMessage[8] = {}
RoR_SoR_T3.KeepMessage[8][3] = 0
RoR_SoR_T3.KeepMessage[8][4] = 0
RoR_SoR_T3.KeepMessage[108] = {}
RoR_SoR_T3.KeepMessage[108][13] = 0
RoR_SoR_T3.KeepMessage[108][14] = 0
RoR_SoR_T3.KeepMessage[208] = {}
RoR_SoR_T3.KeepMessage[208][23] = 0
RoR_SoR_T3.KeepMessage[208][24] = 0


--checks and sets locks for locked zones at start


	for i=1,3 do
		WindowSetTintColor( "RoR_SoR_T3WindowRealm"..i, 80,80,80 )

		end
		


WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_KEEPRANK",false)

WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_LORD_ICON",false)

WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_KEEPFLAG",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_KEEPFLAG",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_KEEPFLAG",false)

RoR_SoR_T3.IsLocked[8] = true
RoR_SoR_T3.IsLocked[108] = true
RoR_SoR_T3.IsLocked[208] = true

local VPZone1 = GetCampaignZoneData(8 )
local VPZone2 = GetCampaignZoneData(108 )
local VPZone3 = GetCampaignZoneData(208 ) 

RoR_SoR_T3.VPs = {}
RoR_SoR_T3.VPs[8] = 50
RoR_SoR_T3.VPs[108] = 50
RoR_SoR_T3.VPs[208] = 50

LabelSetText("RoR_SoR_T3WindowRealm1ZONE_PARING",towstring(GetZoneName(8))..L" - "..towstring(GetZoneName(T3PairedZone[8])))

LabelSetText("RoR_SoR_T3WindowRealm2ZONE_PARING",towstring(GetZoneName(108))..L" - "..towstring(GetZoneName(T3PairedZone[108])))

LabelSetText("RoR_SoR_T3WindowRealm3ZONE_PARING",towstring(GetZoneName(208))..L" - "..towstring(GetZoneName(T3PairedZone[208])))


--tooltips
RoR_SoR_T3.BoOwner = {}
RoR_SoR_T3.BoOwner[8] = {}
RoR_SoR_T3.BoOwner[108] = {}
RoR_SoR_T3.BoOwner[208] = {}

RoR_SoR_T3.BoState = {}
RoR_SoR_T3.BoState[8] = {}
RoR_SoR_T3.BoState[108] = {}
RoR_SoR_T3.BoState[208] = {}


--[[	
local Width_Zone1_Order = ( ( VPZone1.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T3WindowRealm1VP_ORDER", Width_Zone1_Order+2, 4 )
local Width_Zone1_Destro = ( ( VPZone1.controlPoints[2]/ 100 ) * 142 )
WindowSetDimensions( "RoR_SoR_T3WindowRealm1VP_DESTRO", Width_Zone1_Destro+2, 4 )

local Width_Zone2_Order = ( ( VPZone2.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T3WindowRealm2VP_ORDER", Width_Zone2_Order+2, 4 )
local Width_Zone2_Destro = ( ( VPZone2.controlPoints[2]/ 100 ) * 142 )
WindowSetDimensions( "RoR_SoR_T3WindowRealm2VP_DESTRO", Width_Zone2_Destro+2, 4 )	

local Width_Zone3_Order = ( ( VPZone3.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T3WindowRealm3VP_ORDER", Width_Zone3_Order+2, 4 )
local Width_Zone3_Destro = ( ( VPZone3.controlPoints[2]/ 100 ) * 142 )
WindowSetDimensions( "RoR_SoR_T3WindowRealm3VP_DESTRO", Width_Zone3_Destro+2, 4 )
--]]

if VPZone1.controllingRealm == 0 then
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO4", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(0,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(0,9)),42,42 )


RoR_SoR_T3.LockedRealm[8] = 0

RoR_SoR_T3.BoOwner[8][76] = 0
RoR_SoR_T3.BoOwner[8][90] = 0
RoR_SoR_T3.BoOwner[8][100] = 0
RoR_SoR_T3.BoOwner[8][101] = 0
RoR_SoR_T3.KeepOwner[8][3] = 0
RoR_SoR_T3.KeepOwner[8][4] = 0

else

RoR_SoR_T3.LockedRealm[8] = VPZone1.controllingRealm

RoR_SoR_T3.BoOwner[8][76] = VPZone1.controllingRealm
RoR_SoR_T3.BoOwner[8][90] = VPZone1.controllingRealm
RoR_SoR_T3.BoOwner[8][100] = VPZone1.controllingRealm
RoR_SoR_T3.BoOwner[8][101] = VPZone1.controllingRealm

RoR_SoR_T3.KeepOwner[8][3] = VPZone1.controllingRealm
RoR_SoR_T3.KeepOwner[8][4] = VPZone1.controllingRealm

DynamicImageSetTexture("RoR_SoR_T3WindowRealm1_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone1.controllingRealm,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T3WindowRealm1_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone1.controllingRealm,9)),42,42 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1LOCK", RoR_SoR_T3.GetFlag(VPZone1.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1LOCK" ,RoR_SoR_T3.GetFlag(VPZone1.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO1", RoR_SoR_T3.GetFlag(VPZone1.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO2", RoR_SoR_T3.GetFlag(VPZone1.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO3", RoR_SoR_T3.GetFlag(VPZone1.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm1BO4", RoR_SoR_T3.GetFlag(VPZone1.controllingRealm ,9),31,31 ) 

end

RoR_SoR_T3.BoState[8][76] = 9
RoR_SoR_T3.BoState[8][90] = 9
RoR_SoR_T3.BoState[8][100] = 9
RoR_SoR_T3.BoState[8][101] = 9
RoR_SoR_T3.KeepStatus[8][3] = 9
RoR_SoR_T3.KeepStatus[8][4] = 9


if VPZone2.controllingRealm == 0 then

DynamicImageSetTexture("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(0,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(0,9)),42,42 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO4", "SoR_Neutral-Locked",31,31 )

RoR_SoR_T3.KeepOwner[108][13] = 0
RoR_SoR_T3.KeepOwner[108][14] = 0
RoR_SoR_T3.BoOwner[108][5090] = 0
RoR_SoR_T3.BoOwner[108][5091] = 0
RoR_SoR_T3.BoOwner[108][5092] = 0
RoR_SoR_T3.BoOwner[108][5094] = 0
RoR_SoR_T3.LockedRealm[108] = 0

else

RoR_SoR_T3.KeepOwner[108][13] = VPZone2.controllingRealm
RoR_SoR_T3.KeepOwner[108][14] = VPZone2.controllingRealm
RoR_SoR_T3.BoOwner[108][5090] = VPZone2.controllingRealm
RoR_SoR_T3.BoOwner[108][5091] = VPZone2.controllingRealm
RoR_SoR_T3.BoOwner[108][5092] = VPZone2.controllingRealm
RoR_SoR_T3.BoOwner[108][5094] = VPZone2.controllingRealm
RoR_SoR_T3.LockedRealm[108] = VPZone2.controllingRealm


DynamicImageSetTexture("RoR_SoR_T3WindowRealm2_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone2.controllingRealm,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T3WindowRealm2_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone2.controllingRealm,9)),42,42 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2LOCK", RoR_SoR_T3.GetFlag(VPZone2.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2LOCK" ,RoR_SoR_T3.GetFlag(VPZone2.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO1", RoR_SoR_T3.GetFlag(VPZone2.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO2", RoR_SoR_T3.GetFlag(VPZone2.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO3", RoR_SoR_T3.GetFlag(VPZone2.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm2BO4", RoR_SoR_T3.GetFlag(VPZone2.controllingRealm ,9),31,31 ) 

end

RoR_SoR_T3.BoState[108][5090] = 9
RoR_SoR_T3.BoState[108][5091] = 9
RoR_SoR_T3.BoState[108][5092] = 9
RoR_SoR_T3.BoState[108][5094] = 9
RoR_SoR_T3.KeepStatus[108][13] = 9
RoR_SoR_T3.KeepStatus[108][14] = 9

if VPZone3.controllingRealm == 0 then

RoR_SoR_T3.LockedRealm[208] = 0
RoR_SoR_T3.BoOwner[208][5063] = 0
RoR_SoR_T3.BoOwner[208][5064] = 0
RoR_SoR_T3.BoOwner[208][5065] = 0
RoR_SoR_T3.BoOwner[208][5066] = 0
RoR_SoR_T3.KeepOwner[208][23] = 0
RoR_SoR_T3.KeepOwner[208][24] = 0

DynamicImageSetTexture("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm,9)),42,42 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO4", "SoR_Neutral-Locked",31,31 )
else

RoR_SoR_T3.LockedRealm[208] = VPZone3.controllingRealm
RoR_SoR_T3.BoOwner[208][5063] = VPZone3.controllingRealm
RoR_SoR_T3.BoOwner[208][5064] = VPZone3.controllingRealm
RoR_SoR_T3.BoOwner[208][5065] = VPZone3.controllingRealm
RoR_SoR_T3.BoOwner[208][5066] = VPZone3.controllingRealm
RoR_SoR_T3.KeepOwner[208][23] = VPZone3.controllingRealm
RoR_SoR_T3.KeepOwner[208][24] = VPZone3.controllingRealm

DynamicImageSetTexture("RoR_SoR_T3WindowRealm3_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T3WindowRealm3_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm,9)),42,42 )
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3LOCK", RoR_SoR_T3.GetFlag(VPZone3.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3LOCK" ,RoR_SoR_T3.GetFlag(VPZone3.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO1", RoR_SoR_T3.GetFlag(VPZone3.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO2", RoR_SoR_T3.GetFlag(VPZone3.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO3", RoR_SoR_T3.GetFlag(VPZone3.controllingRealm ,9),31,31 ) 
DynamicImageSetTexture( "RoR_SoR_T3WindowRealm3BO4", RoR_SoR_T3.GetFlag(VPZone3.controllingRealm ,9),31,31 ) 

end

RoR_SoR_T3.BoState[208][5063] = 9
RoR_SoR_T3.BoState[208][5064] = 9
RoR_SoR_T3.BoState[208][5065] = 9
RoR_SoR_T3.BoState[208][5066] = 9
RoR_SoR_T3.KeepStatus[208][23] = 9
RoR_SoR_T3.KeepStatus[208][24] = 9

end
function RoR_SoR_T3.OnChatLogUpdated(updateType, filterType) --premade chat checker for future chat updates
	if( updateType == SystemData.TextLogUpdate.ADDED ) then 
		if filterType == SystemData.ChatLogFilters.CHANNEL_9 then	
			local _, filterId, text = TextLogGetEntry( "Chat", TextLogGetNumEntries("Chat") - 1 ) 
			--	if text:find(L"!update") then 
				--PlaySound(GameData.Sound.QUEST_ABANDONED)
			--	RoR_SoR_T3.ZoneUpdate()
			RoR_SoR_T3.BO(text)
			--end		
		end
	end
end

function RoR_SoR_T3.BO(text)


	--d(linkData)
local baba = towstring(text)




--===============================TIER 3!=============================


if baba:match( L"SoR_T3_BO:([^%.]+).") then	

--Checking Warbuilder version of the hyperlink and alert if outdated

local Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY= baba:match( L"SoR_T3_BO:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
if RoR_SoR_T3.Debug == true then 
d(L"==========T3 ZONE UPDATE===========")
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

RoR_SoR_T3.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)
--PlaySound(GameData.Sound.QUEST_ABANDONED)

elseif baba:match( L"SoR_T3_BO_Update:([^%.]+).") then	
local Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER= baba:match( L"SoR_T3_BO_Update:(%d+):(%d+):(%d+):(%d+):(%d+)")

RoR_SoR_T3.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)

if RoR_SoR_T3.Debug == true then 
d(L"=========!SINGLE BO UPDATE!============")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"BO ID: "..towstring(BO_ID)..L" , BO Owner: "..towstring(BO_OWNER)..L" , State: "..towstring(BO_STATE)..L" , Timer: "..towstring(BO_TIMER))
d(L"===============================")
end



elseif baba:match( L"SoR_T3_Keep:([^%.]+).") then	
local Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2= baba:match( L"SoR_T3_Keep:(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+)")
if RoR_SoR_T3.Debug == true then 
d(L"========== T3 ALL KEEPS UPDATE ===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Keep1: "..towstring(KEEP1_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP1_ID)))..L"), Owner: "..towstring(KEEP1_OWNER)..L" , Rank: "..towstring(KEEP1_RANK)..L" , Status: "..towstring(KEEP1_STATUS)..L" , Message: "..towstring(KEEP1_MESSAGE)..L" , Claimed: "..towstring(CLAIM_1)..L" , Outer: "..towstring(OUTER_1)..L" , Inner: "..towstring(INNER_1)..L" , Lord: "..towstring(LORD_1))
d(L"Keep2: "..towstring(KEEP2_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP2_ID)))..L"), Owner: "..towstring(KEEP2_OWNER)..L" , Rank: "..towstring(KEEP2_RANK)..L" , Status: "..towstring(KEEP2_STATUS)..L" , Message: "..towstring(KEEP2_MESSAGE)..L" , Claimed: "..towstring(CLAIM_2)..L" , Outer: "..towstring(OUTER_2)..L" , Inner: "..towstring(INNER_2)..L" , Lord: "..towstring(LORD_2))
d(L"===============================")
end
RoR_SoR_T3.Update_ALL_KEEPS(Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2)

elseif baba:match( L"SoR_T3_Keep_Update:([^%.]+).") then	
local Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE= baba:match( L"SoR_T3_Keep_Update:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
if RoR_SoR_T3.Debug == true then 
d(L"==========!Single KEEP UPDATE!===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Keep: "..towstring(KEEP_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP_ID)))..L"), Owner: "..towstring(KEEP_OWNER)..L" , Rank: "..towstring(KEEP_RANK)..L" , Status: "..towstring(KEEP_STATUS)..L" , Message: "..towstring(KEEP_MESSAGE))
d(L"===============================")
end
RoR_SoR_T3.Update_ONE_KEEP(Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE)


end





end

function RoR_SoR_T3.Update_ONE_KEEP(Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE)
local Test_Zone = tonumber(Zone)
local Test_KEEP_ID = tonumber(KEEP_ID)
local Test_KEEP_OWNER = tonumber(KEEP_OWNER)
local Test_KEEP_RANK = tonumber(KEEP_RANK)
local Test_KEEP_STATUS = tonumber(KEEP_STATUS)
local Test_KEEP_MESSAGE = tonumber(KEEP_MESSAGE)

RoR_SoR_T3.KeepStatus[T3ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_STATUS
RoR_SoR_T3.KeepOwner[T3ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_OWNER
RoR_SoR_T3.KeepRank[T3ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_RANK
RoR_SoR_T3.KeepMessage[T3ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_MESSAGE

-- Keep image updates
local T2SOLOKEEP = tostring(RoR_SoR.GetKeepTexture(Test_KEEP_OWNER,Test_KEEP_STATUS))
DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPICON", T2SOLOKEEP,42,42 )

--Keep Rank
if Test_KEEP_RANK > 0 then
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPRANK",true)
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPRANK", "KeepDifficulty-"..Test_KEEP_RANK.."-star" )
else
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPRANK",false)
end

DynamicImageSetTextureSlice(  tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_LORD_ICON", RoR_SoR_T3.KeepLord[Test_KEEP_OWNER] )

 -- Keep health label updates
local  T2SOLOKEEPHEALTH = RoR_SoR.GetKeepHeath(Test_KEEP_OWNER,Test_KEEP_STATUS,Test_KEEP_MESSAGE,RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP_ID])

 --Hiding the Keep hp update for now --------------------------
-- LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_HEALTH",towstring(T2SOLOKEEPHEALTH))
--WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_HEALTH",1)

 -- Door hide
 if Test_KEEP_MESSAGE >= 4 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",false)
elseif Test_KEEP_MESSAGE == 8 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",false)
elseif Test_KEEP_MESSAGE >= 9 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_LORD_ICON",true)
else
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_"..T3KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",true)
end

return
end



function RoR_SoR_T3.Update_ALL_KEEPS(Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2)
local Test_Zone = tonumber(Zone)
local Test_KEEP1_ID = tonumber(KEEP1_ID)
local Test_KEEP2_ID = tonumber(KEEP2_ID)

local Test_KEEP1_OWNER = tonumber(KEEP1_OWNER)
local Test_KEEP2_OWNER = tonumber(KEEP2_OWNER)

local Test_KEEP1_RANK = tonumber(KEEP1_RANK)
local Test_KEEP2_RANK = tonumber(KEEP2_RANK)

local Test_KEEP1_STATUS = tonumber(KEEP1_STATUS)
local Test_KEEP2_STATUS = tonumber(KEEP2_STATUS)

local Test_KEEP1_MESSAGE = tonumber(KEEP1_MESSAGE)
local Test_KEEP2_MESSAGE = tonumber(KEEP2_MESSAGE)

local Test_KEEP1_CLAIM = tonumber(CLAIM_1)
local Test_KEEP2_CLAIM = tonumber(CLAIM_2)

local KEEP_OUTER_1 = tonumber(OUTER_1)
local KEEP_INNER_1 = tonumber(INNER_1)
local KEEP_LORD_1 = tonumber(LORD_1)

local KEEP_OUTER_2 = tonumber(OUTER_2)
local KEEP_INNER_2 = tonumber(INNER_2)
local KEEP_LORD_2 = tonumber(LORD_2)


RoR_SoR_T3.KeepStatus[T3ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_STATUS
RoR_SoR_T3.KeepStatus[T3ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_STATUS

RoR_SoR_T3.KeepOwner[T3ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_OWNER
RoR_SoR_T3.KeepOwner[T3ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_OWNER

RoR_SoR_T3.KeepRank[T3ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_RANK
RoR_SoR_T3.KeepRank[T3ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_RANK

RoR_SoR_T3.KeepMessage[T3ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_MESSAGE
RoR_SoR_T3.KeepMessage[T3ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_MESSAGE



-- Keep image updates
RoR_SoR_T3.T2Keeps = {}

RoR_SoR_T3.T2Keeps[1] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP1_OWNER,KEEP1_STATUS))
RoR_SoR_T3.T2Keeps[2] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP2_OWNER,KEEP2_STATUS))

DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPICON", RoR_SoR_T3.T2Keeps[1],42,42 )
DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPICON", RoR_SoR_T3.T2Keeps[2],42,42 )

--Keep Rank
if Test_KEEP1_RANK > 0 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK",true)
DynamicImageSetTextureSlice( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK", "KeepDifficulty-"..Test_KEEP1_RANK.."-star" )
else
DynamicImageSetTextureSlice( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK",false)
end

if Test_KEEP2_RANK > 0 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK",true)
DynamicImageSetTextureSlice( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK", "KeepDifficulty-"..Test_KEEP2_RANK.."-star" )
else
DynamicImageSetTextureSlice( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK",false)
end

DynamicImageSetTextureSlice(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON", RoR_SoR_T3.KeepLord[Test_KEEP1_OWNER] )
DynamicImageSetTextureSlice(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON", RoR_SoR_T3.KeepLord[Test_KEEP2_OWNER] )
 -- Keep health label updates

 -- Door hide
 
 --[[
if Test_KEEP1_MESSAGE == 0 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false) 
 elseif Test_KEEP1_MESSAGE == 1 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)  
 elseif Test_KEEP1_MESSAGE == 2 then
  WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false) 
 elseif Test_KEEP1_MESSAGE == 3 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)   
elseif Test_KEEP1_MESSAGE == 4 and Test_KEEP1_STATUS == 2 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",true)
 elseif Test_KEEP1_MESSAGE == 4 and Test_KEEP1_STATUS == 3 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE == 5 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE == 6 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false) 
elseif Test_KEEP1_MESSAGE == 7 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false) 
elseif Test_KEEP1_MESSAGE == 8 and Test_KEEP1_STATUS == 3 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE == 8 and Test_KEEP1_STATUS == 4 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE ==9 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==10 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==11 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==12 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)

else
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
end

if Test_KEEP1_STATUS == 5 or Test_KEEP1_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
end


if Test_KEEP2_MESSAGE == 0 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false) 
 elseif Test_KEEP2_MESSAGE == 1 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)  
 elseif Test_KEEP2_MESSAGE == 2 then
  WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false) 
 elseif Test_KEEP2_MESSAGE == 3 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)   
elseif Test_KEEP2_MESSAGE == 4 and Test_KEEP1_STATUS == 2 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",true)
 elseif Test_KEEP2_MESSAGE == 4 and Test_KEEP1_STATUS == 3 then
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE == 5 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE == 6 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false) 
elseif Test_KEEP2_MESSAGE == 7 then 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false) 
elseif Test_KEEP2_MESSAGE == 8 and Test_KEEP1_STATUS == 3 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE == 8 and Test_KEEP1_STATUS == 4 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE ==9 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==10 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==11 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==12 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
else
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
end

if Test_KEEP2_STATUS == 5 or Test_KEEP2_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
end

--]]

		if KEEP_OUTER_1 > 0 then 
		 RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP1_ID] = KEEP_OUTER_1
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false) 		 
		elseif (KEEP_OUTER_1 == 0) and (KEEP_INNER_1 > 0) then 
			 RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP1_ID] = KEEP_INNER_1
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false) 			 

 
		else
			 RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP1_ID] = KEEP_LORD_1
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR2",false)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true) 			 


 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HP_ICON_BAR",true) 
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HP_ICON_BG",true) 
 end

		if KEEP_OUTER_2 > 0 then 
		 RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP2_ID] = KEEP_OUTER_2
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false) 		 
		elseif (KEEP_OUTER_2 == 0) and (KEEP_INNER_2 > 0) then 
			 RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP2_ID] = KEEP_INNER_2
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false) 			 
			 
		else
			 RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP2_ID] = KEEP_LORD_2
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR2",false)
 WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true) 			 
		end

		
		
if Test_KEEP1_STATUS == 5 or Test_KEEP1_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
end
		
if Test_KEEP2_STATUS == 5 or Test_KEEP2_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
end

 RoR_SoR_T3.T2KeepHeath = {}
 RoR_SoR_T3.T2KeepHeath[1] = RoR_SoR.GetKeepHeath(Test_KEEP1_OWNER,Test_KEEP1_STATUS,Test_KEEP1_MESSAGE,RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP1_ID])
 RoR_SoR_T3.T2KeepHeath[2] = RoR_SoR.GetKeepHeath(Test_KEEP2_OWNER,Test_KEEP2_STATUS,Test_KEEP2_MESSAGE,RoR_SoR_T3.KeepHP[T3ComboZone[Test_Zone]][Test_KEEP2_ID])
 
 LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",towstring(RoR_SoR_T3.T2KeepHeath[1]))
 --WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",1)
 
  LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",towstring(RoR_SoR_T3.T2KeepHeath[2]))
 -- WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",1)

--==================Keep HP Bar test==============================================
--WindowSetDimensions( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HP_ICON_BAR",41* (RoR_SoR_T3.T2KeepHeath[1]/100),7 )
--WindowSetTintColor( tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HP_ICON_BAR", 255,30,30 )

return
end


function RoR_SoR_T3.GetKeepHeath(KEEP_OWNER,KEEP_STATE,KEEP_MESSAGE,KEEP_HP)
local Owner = tonumber(KEEP_OWNER)
local State = tonumber(KEEP_STATE)
local Message = tonumber(KEEP_MESSAGE)
local HP = tonumber(KEEP_HP) or 0

if State == 1 then 
return L""
elseif State == 2 then
	if Message == 0 then return L"100%" 	
	elseif Message == 1 then return L"75%" 
	elseif Message == 2 then return L"50%" 
	elseif Message == 3 then return L"20%" 
	elseif Message == 4 then return L"0%" 
	else
	return L"0%"
	end
elseif State == 3 then
	if Message == 4 then return L"100%" 
	elseif Message == 5 then return L"75%" 
	elseif Message == 6 then return L"50%" 	
	elseif Message == 7 then return L"20%" 
	elseif Message == 8 then return L"0%" 
	else	
	return L"0%" 
	end
elseif State == 4 then
   	if Message == 9 then return L"  100%" --lord
	elseif Message == 10 then return L"  50%" 
	elseif Message == 11 then return L"  20%" 
	elseif Message == 12 then return L"  0%" 
	else 
	return L" 0%"	
	end
elseif State == 5 then
	return RoR_SoR.TextTaken
elseif State == 6 then
	return RoR_SoR.TextLock
end
return L""
end


function RoR_SoR_T3.GetKeepOwner(KEEP_OWNER,KEEP_STATE)
local Owner = tonumber(KEEP_OWNER)
local State = tonumber(KEEP_STATE)

if State == 1 then
	if Owner == 0 then return "Keep-Grayed" end
	if Owner == 1 then return "OrderKeep" end
	if Owner == 2 then return "DestructionKeep" end
elseif State == 2 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "OrderKeep-UnderAttack" end
	if Owner == 2 then return "DestructionKeep-UnderAttack" end
elseif State == 3 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "OrderKeep-UnderAttack" end
	if Owner == 2 then return "DestructionKeep-UnderAttack" end	
elseif State == 4 then
	if Owner == 0 then return "BombNeutral" end
	if Owner == 1 then return "OrderKeep-UnderAttack" end
	if Owner == 2 then return "DestructionKeep-UnderAttack" end
elseif State == 5 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "OrderKeep" end
	if Owner == 2 then return "DestructionKeep" end
elseif State == 6 then
	if Owner == 0 then return "FlagNeutral-Burning" end
	if Owner == 1 then return "OrderKeep" end
	if Owner == 2 then return "DestructionKeep" end
else
	if Owner == 0 then return "Keep-Grayed" end
	if Owner == 1 then return "OrderKeep" end
	if Owner == 2 then return "DestructionKeep" end
end
--[[
        KEEPSTATUS_SAFE = 1,
        KEEPSTATUS_OUTER_WALLS_UNDER_ATTACK = 2,
        KEEPSTATUS_INNER_SANCTUM_UNDER_ATTACK = 3,
        KEEPSTATUS_KEEP_LORD_UNDER_ATTACK = 4,
        KEEPSTATUS_SEIZED = 5,
        KEEPSTATUS_LOCKED = 6
		]]--
end


function RoR_SoR_T3.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)

--d(towstring(BO1_TIMER)..L" , "..towstring(BO2_TIMER)..L" , "..towstring(BO3_TIMER)..L" , "..towstring(BO4_TIMER))

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

-- local Test_VP = tonumber(VP)
local Test_SUPPLY = tonumber(SUPPLY)

RoR_SoR_T3.VPs[Test_Zone] = tonumber(VP)

local Test_State = {}
 Test_State[1] = Test_BO1_State
 Test_State[2] = Test_BO2_State
 Test_State[3] = Test_BO3_State
 Test_State[4] = Test_BO4_State

local Test_Owner = {}
 Test_Owner[1] = Test_BO1_Owner
Test_Owner[2] = Test_BO2_Owner
 Test_Owner[3] = Test_BO3_Owner
 Test_Owner[4] = Test_BO4_Owner

 RoR_SoR_T3.BoOwner[T3ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_Owner
RoR_SoR_T3.BoOwner[T3ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_Owner
RoR_SoR_T3.BoOwner[T3ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_Owner
RoR_SoR_T3.BoOwner[T3ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_Owner

RoR_SoR_T3.BoState[T3ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_State
RoR_SoR_T3.BoState[T3ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_State
RoR_SoR_T3.BoState[T3ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_State
RoR_SoR_T3.BoState[T3ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_State
 
RoR_SoR_T3.Update_ONE_BO(Test_Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER)
RoR_SoR_T3.Update_ONE_BO(Test_Zone,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER)
RoR_SoR_T3.Update_ONE_BO(Test_Zone,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER)
RoR_SoR_T3.Update_ONE_BO(Test_Zone,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER)



--RoR_SoR_T3.BOTimer[T3ComboZone[208]][5063] = Test_BO1_Timer
--RoR_SoR_T3.BOTimer[T3ComboZone[208]][5064] = Test_BO2_Timer
--RoR_SoR_T3.BOTimer[T3ComboZone[208]][5065] = Test_BO3_Timer
--RoR_SoR_T3.BOTimer[T3ComboZone[208]][5066] = Test_BO4_Timer
--RoR_SoR_T3.BOTimer[T3ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_Timer
--RoR_SoR_T3.BOTimer[T3ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_Timer
--RoR_SoR_T3.BOTimer[T3ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_Timer
--RoR_SoR_T3.BOTimer[T3ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_Timer

--RoR_SoR_T3.BOTimer[Test_Zone][Test_BO1_ID] =Test3_BO1_Timer
--RoR_SoR_T3.BOTimer[Test_Zone][Test_BO2_ID] =Test3_BO2_Timer
--RoR_SoR_T3.BOTimer[Test_Zone][Test_BO3_ID] =Test3_BO3_Timer
--RoR_SoR_T3.BOTimer[Test_Zone][Test_BO4_ID] =Test3_BO4_Timer


--d(L"Timers: "..towstring(Test_Zone)..L" , "..towstring(Test3_BO1_ID))
--d(L"Timers: "..towstring(RoR_SoR_T3.BOTimer[Test_Zone][Test3_BO1_ID]))


RoR_SoR_T3.Flag = {}

RoR_SoR_T3.Flag[1] = tostring(RoR_SoR_T3.GetFlag(Test_BO1_Owner,Test_BO1_State))
RoR_SoR_T3.Flag[2] = tostring(RoR_SoR_T3.GetFlag(Test_BO2_Owner,Test_BO2_State))
RoR_SoR_T3.Flag[3] = tostring(RoR_SoR_T3.GetFlag(Test_BO3_Owner,Test_BO3_State))
RoR_SoR_T3.Flag[4] = tostring(RoR_SoR_T3.GetFlag(Test_BO4_Owner,Test_BO4_State))

if Test_SUPPLY == 1 then

WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPSUPPLY",true)
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPFLAG",true)

WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPSUPPLY",true)
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPFLAG",true)

else
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPFLAG",false)
end


-- VP update	


--local Width_Zone_Order = ( ( Test_VP / 100 ) * 147 )
--WindowSetDimensions( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_ORDER", Width_Zone_Order+2, 4 )
--local Width_Zone_Destro = ( ( (100-Test_VP) / 100 ) * 142 )
--WindowSetDimensions( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_DESTRO", Width_Zone_Destro+2, 4 )

--LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_PARING",towstring(GetZoneName(Test_Zone))..L" - "..towstring(GetZoneName(T3PairedZone[Test_Zone])))

--WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_ORDER",true)

--WindowSetShowing(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_DESTRO",true)



--check if zone lock and do stuff:
if Test_BO1_State == 9 then
RoR_SoR_T3.IsLocked[T3ComboZone[Test_Zone]] = true
if Test_BO1_Owner == 0 then DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCK",  "SoR_Neutral-Locked",31,31 )
 RoR_SoR_T3.LockedRealm[T3ComboZone[Test_Zone]] = 0

else
--DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCK", "map_markers01" ,28,33)
DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCK", RoR_SoR_T3.Flag[1],31,31 ) 
end

 RoR_SoR_T3.LockedRealm[T3ComboZone[Test_Zone]] = Test_BO1_Owner
		WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCK",true)
		
		WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCKED_TEXT",true)
		
		WindowSetTintColor( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]), 80,80,80 )
--				LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."PERCENT_ORDER",L"")
--LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."PERCENT_DESTRO",L"")
WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_NAME",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_TIER",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_PARING",0.4)

--		WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_ORDERBAR",false)
--		WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_DESTROBAR",false)

WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",0.4)
 WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",0.4) 

WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPFLAG",false)
		
else

if Test_BO1_State ~= 8  then DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCK", "SoR_Neutral-Locked",31,31 ) end
RoR_SoR_T3.IsLocked[T3ComboZone[Test_Zone]] = false
		WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCK",false)
		WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."LOCKED_TEXT",false)
	WindowSetTintColor( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]), 255,255,255 )
--	WindowSetTintColor( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]].."VP_ORDERBAR"), 50,50,255 )
--	WindowSetTintColor( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]].."VP_DESTROBAR"), 200,0,0 )

--			WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_ORDERBAR",true)
--		WindowSetShowing( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."VP_DESTROBAR",true)
	
--LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."PERCENT_ORDER",towstring(Test_VP)..L"%")
--LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."PERCENT_DESTRO",towstring(100-Test_VP)..L"%")
	WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_NAME",1)
	WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_TIER",1)	
	WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_PARING",1)		
 WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",1)
 WindowSetFontAlpha(tostring(RoR_SoR_T3.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",1) 
	
	
end
--Sets the Tier name
--local DataZone = GetCampaignZoneData(Test_Zone)
--LabelSetText(tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_TIER",L"T"..towstring(DataZone.tierId))



for i=1,4 do

	 
if  (Test_State[i]  == 8 or Test_State[i]  == 9) and  Test_Owner[i] == 0 then
DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."BO"..i, "SoR_Neutral-Locked",31,31 )
else
--DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."BO"..i, "map_markers01" ,28,33)
DynamicImageSetTexture( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone]]).."BO"..i, RoR_SoR_T3.Flag[i],31,31 )
end

end


return
end

function RoR_SoR_T3.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)


local Test_Zone2 = tonumber(Zone)
local Test_BO_ID2 = tonumber(BO_ID)
local Test_BO_Owner2 = tonumber(BO_OWNER)
local Test_BO_State2 = tonumber(BO_STATE)
local Test_BO_Timer2 = tonumber(BO_TIMER)

RoR_SoR_T3.Flag = tostring(RoR_SoR_T3.GetFlag(Test_BO_Owner2,Test_BO_State2))


if Test_BO_Owner2 == 0 and (Test_BO_State2 == 9 or Test_BO_State2 == 8) then
DynamicImageSetTexture( tostring(RoR_SoR_T3.BONumber[T3ComboZone[Test_Zone2]][Test_BO_ID2]), "SoR_Neutral-Locked",31,31 )
else
--DynamicImageSetTexture( tostring(RoR_SoR_T3.BONumber[T3ComboZone[Test_Zone2]][Test_BO_ID2]), "map_markers01" ,31,31 )
DynamicImageSetTexture( tostring(RoR_SoR_T3.BONumber[T3ComboZone[Test_Zone2]][Test_BO_ID2]), tostring(RoR_SoR_T3.Flag),31,31 )
end

RoR_SoR_T3.BoOwner[T3ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_Owner2
RoR_SoR_T3.BoState[T3ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_State2

RoR_SoR_T3.BOTimer[T3ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_Timer2

--local VPZone = GetCampaignZoneData(Test_Zone2) 
	
--local Width_Zone_Order = ( ( RoR_SoR_T3.VPs[T3ComboZone[Test_Zone2]] / 100 ) * 147 )
--WindowSetDimensions( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone2]]).."VP_ORDER", Width_Zone_Order+2, 4 )
--local Width_Zone_Destro = ( ( (100-RoR_SoR_T3.VPs[T3ComboZone[Test_Zone2]])/ 100 ) * 142 )
--WindowSetDimensions( tostring(RoR_SoR_T3.ZoneNumber[T3ComboZone[Test_Zone2]]).."VP_DESTRO", Width_Zone_Destro+2, 4 )


return
end


function RoR_SoR_T3.GetFlag(BO_OWNER,BO_STATE)
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

function RoR_SoR_T3.TimeUpdate(timeElapsed)
for i = 1,3 do

for k, v in pairs(RoR_SoR_T3.BOTimer[RoR_SoR_T3.T2Zones[i]]) do
if v > 0 then 
RoR_SoR_T3.BOTimer[RoR_SoR_T3.T2Zones[i]][k] = RoR_SoR_T3.BOTimer[RoR_SoR_T3.T2Zones[i]][k] - timeElapsed
LabelSetText(tostring(RoR_SoR_T3.BONumber[RoR_SoR_T3.T2Zones[i]][k]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[RoR_SoR_T3.T2Zones[i]][k])))

	if RoR_SoR_T3.BoState[RoR_SoR_T3.T2Zones[i]][k] == 16 then
		local GetRealmColor = RoR_SoR_T3.BoOwner[RoR_SoR_T3.T2Zones[i]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.RealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T3.BONumber[RoR_SoR_T3.T2Zones[i]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 
	elseif 	RoR_SoR_T3.BoState[RoR_SoR_T3.T2Zones[i]][k] == 4 then
		local GetRealmColor = RoR_SoR_T3.BoOwner[RoR_SoR_T3.T2Zones[i]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.InvertRealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T3.BONumber[RoR_SoR_T3.T2Zones[i]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 	
	end

else
LabelSetText(tostring(RoR_SoR_T3.BONumber[RoR_SoR_T3.T2Zones[i]][k]).."_TIMER",L"")
--d(L"k= "..towstring(k)) --k is ID
--d(L"v= "..towstring(v)) -- v is value
end
end


end
end



function RoR_SoR_T3.OnMouseOverStart()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local WindowName = towstring(SystemData.MouseOverWindow.name)
local FinalName = WindowName:match(L"RoR_SoR_T3Window([^%.]+)")

local Line1 = L""
local Line2 = L""
local Line3 = L""
if FinalName ~= nil or FinalName ~= "" then
--d(L"Tooltip "..towstring(FinalName))
--	d(L"Tooltip "..towstring(WindowName))
--Dwarf 

if FinalName == L"Realm1BO1" then
	Line1 = towstring(GetObjectiveName(76))
	if RoR_SoR_T3.BOTimer[8][76] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[8][76])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[8]][76],RoR_SoR_T3.BoState[T3ComboZone[8]][76])
elseif FinalName == L"Realm1BO2" then
	Line1 = towstring(GetObjectiveName(90))
	if RoR_SoR_T3.BOTimer[8][90] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[8][90])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[8]][90],RoR_SoR_T3.BoState[T3ComboZone[8]][90])
elseif FinalName == L"Realm1BO3" then
	Line1 = towstring(GetObjectiveName(100))
	if RoR_SoR_T3.BOTimer[8][100] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[8][100])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[8]][100],RoR_SoR_T3.BoState[T3ComboZone[8]][100])
elseif FinalName == L"Realm1BO4" then
	Line1 = towstring(GetObjectiveName(101))
	if RoR_SoR_T3.BOTimer[8][101] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[8][101])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[8]][101],RoR_SoR_T3.BoState[T3ComboZone[8]][101])

	elseif FinalName == L"Realm1LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.LockedRealm[8],9)	
		
	elseif FinalName == L"Realm1_KEEP_WIN_1_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(3)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[207][21], RoR_SoR_T3.KeepStatus[207][21])	
	if RoR_SoR_T3.KeepRank[8][3] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T3.KeepRank[8][3])) end
	if RoR_SoR_T3.KeepStatus[8][3] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T3.KeepOwner[8][3],RoR_SoR_T3.KeepStatus[8][3],RoR_SoR_T3.KeepMessage[8][3],RoR_SoR_T3.KeepHP[8][3])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[8][3], RoR_SoR_T3.KeepStatus[8][3]))..towstring(temp_Rank)..towstring(temp_Health)
	
	elseif FinalName == L"Realm1_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(4)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[207][21], RoR_SoR_T3.KeepStatus[207][21])	
	if RoR_SoR_T3.KeepRank[8][4] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T3.KeepRank[8][4])) end
	if RoR_SoR_T3.KeepStatus[8][4] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T3.KeepOwner[8][4],RoR_SoR_T3.KeepStatus[8][4],RoR_SoR_T3.KeepMessage[8][4],RoR_SoR_T3.KeepHP[8][4])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[8][4], RoR_SoR_T3.KeepStatus[8][4]))..towstring(temp_Rank)..towstring(temp_Health)
	

		
--empire

elseif FinalName == L"Realm2BO1" then
	Line1 = towstring(GetObjectiveName(5090))
	if RoR_SoR_T3.BOTimer[108][5090] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[108][5090])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[108]][5090],RoR_SoR_T3.BoState[T3ComboZone[108]][5090])
elseif FinalName == L"Realm2BO2" then
	Line1 = towstring(GetObjectiveName(5091))
	if RoR_SoR_T3.BOTimer[108][5091] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[108][5091])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[108]][5091],RoR_SoR_T3.BoState[T3ComboZone[108]][5091])
elseif FinalName == L"Realm2BO3" then
	Line1 = towstring(GetObjectiveName(5092))
	if RoR_SoR_T3.BOTimer[108][5092] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[108][5092])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[108]][5092],RoR_SoR_T3.BoState[T3ComboZone[108]][5092])
	
elseif FinalName == L"Realm2BO4" then
	Line1 = towstring(GetObjectiveName(5094))
	if RoR_SoR_T3.BOTimer[108][5094] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[108][5094])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[108]][5094],RoR_SoR_T3.BoState[T3ComboZone[108]][5094])	
	
	elseif FinalName == L"Realm2LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.LockedRealm[108],9)	
	

	elseif FinalName == L"Realm2_KEEP_WIN_1_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(13)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[207][21], RoR_SoR_T3.KeepStatus[207][21])	
	if RoR_SoR_T3.KeepRank[108][13] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T3.KeepRank[108][13])) end
	if RoR_SoR_T3.KeepStatus[108][13] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T3.KeepOwner[108][13],RoR_SoR_T3.KeepStatus[108][13],RoR_SoR_T3.KeepMessage[108][13],RoR_SoR_T3.KeepHP[108][13])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[108][13], RoR_SoR_T3.KeepStatus[108][13]))..towstring(temp_Rank)..towstring(temp_Health)
	
	elseif FinalName == L"Realm2_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(14)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[207][21], RoR_SoR_T3.KeepStatus[207][21])	
	if RoR_SoR_T3.KeepRank[108][14] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T3.KeepRank[108][14])) end
	if RoR_SoR_T3.KeepStatus[108][14] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T3.KeepOwner[108][14],RoR_SoR_T3.KeepStatus[108][14],RoR_SoR_T3.KeepMessage[108][14],RoR_SoR_T3.KeepHP[108][14])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[108][14], RoR_SoR_T3.KeepStatus[108][14]))..towstring(temp_Rank)..towstring(temp_Health)
	

	
	
--Elf

elseif FinalName == L"Realm3BO1" then
	Line1 = towstring(GetObjectiveName(5063))
	if RoR_SoR_T3.BOTimer[208][5063] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[208][5063])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[208]][5063],RoR_SoR_T3.BoState[T3ComboZone[208]][5063])
elseif FinalName == L"Realm3BO2" then
	Line1 = towstring(GetObjectiveName(5064))
	if RoR_SoR_T3.BOTimer[208][5064] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[208][5064])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[208]][5064],RoR_SoR_T3.BoState[T3ComboZone[208]][5064])
elseif FinalName == L"Realm3BO3" then
	Line1 = towstring(GetObjectiveName(5065))
	if RoR_SoR_T3.BOTimer[208][5065] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[208][5065])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[208]][5065],RoR_SoR_T3.BoState[T3ComboZone[208]][5065])
elseif FinalName == L"Realm3BO4" then
--	Line1 = towstring(GetObjectiveName(5072))
--	if RoR_SoR_T3.BOTimer[208][5072] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[208][5072])) else Line2 = L"" end
--	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[208]][5072],RoR_SoR_T3.BoState[T3ComboZone[208]][5072])
	Line1 = towstring(GetObjectiveName(5066))	
	if RoR_SoR_T3.BOTimer[208][5066] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T3.BOTimer[208][5066])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.BoOwner[T3ComboZone[208]][5066],RoR_SoR_T3.BoState[T3ComboZone[208]][5066])	

	elseif FinalName == L"Realm3LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T3.LockedRealm[208],9)	
	
	elseif FinalName == L"Realm3_KEEP_WIN_1_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(23)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[208][23], RoR_SoR_T3.KeepStatus[208][23])	
	if RoR_SoR_T3.KeepRank[208][23] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T3.KeepRank[208][23])) end
	if RoR_SoR_T3.KeepStatus[208][23] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T3.KeepOwner[208][23],RoR_SoR_T3.KeepStatus[208][23],RoR_SoR_T3.KeepMessage[208][23],RoR_SoR_T3.KeepHP[208][23])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[208][23], RoR_SoR_T3.KeepStatus[208][23]))..towstring(temp_Rank)..towstring(temp_Health)
	
	elseif FinalName == L"Realm3_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(24)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[208][21], RoR_SoR_T3.KeepStatus[208][21])	
	if RoR_SoR_T3.KeepRank[208][24] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T3.KeepRank[208][24])) end
	if RoR_SoR_T3.KeepStatus[208][24] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T3.KeepOwner[208][24],RoR_SoR_T3.KeepStatus[208][24],RoR_SoR_T3.KeepMessage[208][24],RoR_SoR_T3.KeepHP[208][24])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T3.KeepOwner[208][24], RoR_SoR_T3.KeepStatus[208][24]))..towstring(temp_Rank)..towstring(temp_Health)
	
	
	

	
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

function RoR_SoR_T3.Close()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local MouseOverWindowName = SystemData.MouseOverWindow.name
	WindowSetShowing(WinParent,false)
	
end


function RoR_SoR_T3.Update(timeElapsed)

RoR_SoR_T3.Timer = RoR_SoR_T3.Timer + timeElapsed
if RoR_SoR_T3.Timer > 1 then 
RoR_SoR_T3.Timer = 0
RoR_SoR_T3.ZoneUpdate()
end
end


RoR_SoR_T2 = {}
local version = "104"

function RoR_SoR_T2.OnInitialize()
RegisterEventHandler(TextLogGetUpdateEventId("Chat"), "RoR_SoR_T2.OnChatLogUpdated")

CreateWindow("RoR_SoR_T2Window", true)

CreateWindowFromTemplate( "RoR_SoR_T2WindowRealm1", "T2TemplateRealm1", "RoR_SoR_T2Window" )
	WindowClearAnchors( "RoR_SoR_T2WindowRealm1" )
    WindowAddAnchor( "RoR_SoR_T2WindowRealm1", "topleft", "RoR_SoR_Window", "topleft",38, 40)


CreateWindowFromTemplate( "RoR_SoR_T2WindowRealm2", "T2TemplateRealm1", "RoR_SoR_T2Window" )
	WindowClearAnchors( "RoR_SoR_T2WindowRealm2" )
    WindowAddAnchor( "RoR_SoR_T2WindowRealm2", "bottomleft", "RoR_SoR_T2WindowRealm1", "topleft",0 , -24)

CreateWindowFromTemplate( "RoR_SoR_T2WindowRealm3", "T2TemplateRealm1", "RoR_SoR_T2Window" )
	WindowClearAnchors( "RoR_SoR_T2WindowRealm3" )
    WindowAddAnchor( "RoR_SoR_T2WindowRealm3", "bottomleft", "RoR_SoR_T2WindowRealm2", "topleft",0 , -24)	
	
--	DynamicImageSetTexture ("RoR_SoR_T2WindowRealm2Banner", "Realm2", 256,128)
--	DynamicImageSetTexture ("RoR_SoR_T2WindowRealm3Banner", "Realm3", 256,128)

	DynamicImageSetTextureSlice("RoR_SoR_T2WindowRealm1Menu01", "PairingGvDSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T2WindowRealm2Menu01", "PairingEvCSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T2WindowRealm3Menu01", "PairingElvesSelected")
	
	
RoR_SoR_T2.IsLocked = {}
--LayoutEditor.RegisterWindow( "RoR_SoR_T2Window", L"RoR_SoR_T2", L"RoR_SoR_T2", true, true, true, nil )
--RegisterEventHandler(SystemData.Events.ALL_MODULES_INITIALIZED, "RoR_SoR_T2.ZoneUpdate")

--LabelSetText("RoR_SoR_T2WindowTIER_NAME",L"Tier 2 Beta")

LabelSetText("RoR_SoR_T2WindowRealm1_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm1_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T2WindowRealm2_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm2_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T2WindowRealm3_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm3_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T2WindowRealm1_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm1_KEEP_WIN_2_HEALTH",0.4)
LabelSetText("RoR_SoR_T2WindowRealm2_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm2_KEEP_WIN_2_HEALTH",0.4)
LabelSetText("RoR_SoR_T2WindowRealm3_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm3_KEEP_WIN_2_HEALTH",0.4)

LabelSetText("RoR_SoR_T2WindowRealm1LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T2WindowRealm2LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T2WindowRealm3LOCKED_TEXT",RoR_SoR.TextZoneLocked)

LabelSetText("RoR_SoR_T2WindowRealm1ZONE_TIER",L"T2")
LabelSetText("RoR_SoR_T2WindowRealm2ZONE_TIER",L"T2")
LabelSetText("RoR_SoR_T2WindowRealm3ZONE_TIER",L"T2")

LabelSetText("RoR_SoR_T2WindowRealm1ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN )))
LabelSetText("RoR_SoR_T2WindowRealm2ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS )))
LabelSetText("RoR_SoR_T2WindowRealm3ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF )))

WindowSetShowing("RoR_SoR_T2WindowRealm1ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3ZONE_NAME",false)


WindowSetShowing("RoR_SoR_T2WindowRealm1ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3ZONE_TIER",false)


WindowSetFontAlpha("RoR_SoR_T2WindowRealm1ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm2ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm3ZONE_NAME",0.4)

WindowSetFontAlpha("RoR_SoR_T2WindowRealm1ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm2ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm3ZONE_TIER",0.4)


WindowSetFontAlpha("RoR_SoR_T2WindowRealm1ZONE_PARING",0.4)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm2ZONE_PARING",0.4)
WindowSetFontAlpha("RoR_SoR_T2WindowRealm3ZONE_PARING",0.4)

RoR_SoR_T2.LockedRealm = {}
RoR_SoR_T2.LockedRealm[7] = 0
RoR_SoR_T2.LockedRealm[107] = 0
RoR_SoR_T2.LockedRealm[207] = 0


RoR_SoR_T2.T2Zones = {7,107,207}

RoR_SoR_T2.KeepClaim = {}
RoR_SoR_T2.KeepClaim[7] = {}
RoR_SoR_T2.KeepClaim[7][1] = 0
RoR_SoR_T2.KeepClaim[7][2] = 0
RoR_SoR_T2.KeepClaim[107] = {}
RoR_SoR_T2.KeepClaim[107][11] = 0
RoR_SoR_T2.KeepClaim[107][12] = 0
RoR_SoR_T2.KeepClaim[207] = {}
RoR_SoR_T2.KeepClaim[207][21] = 0
RoR_SoR_T2.KeepClaim[207][22] = 0

RoR_SoR_T2.KeepHP = {}
RoR_SoR_T2.KeepHP[7] = {}
RoR_SoR_T2.KeepHP[7][1] = 100
RoR_SoR_T2.KeepHP[7][2] = 100
RoR_SoR_T2.KeepHP[107] = {}
RoR_SoR_T2.KeepHP[107][11] = 100
RoR_SoR_T2.KeepHP[107][12] = 100
RoR_SoR_T2.KeepHP[207] = {}
RoR_SoR_T2.KeepHP[207][21] = 100
RoR_SoR_T2.KeepHP[207][22] = 100

RoR_SoR_T2.KeepLord = {}
RoR_SoR_T2.KeepLord[1] = "MurderballOrder"
RoR_SoR_T2.KeepLord[2] = "MurderballDestruction"


T2PairedZone = {}
T2ComboZone = {}
T2ComboZone[1] = 7
T2ComboZone[7] = 7
T2PairedZone[7] = 1

T2ComboZone[101] = 107
T2ComboZone[107] = 107
T2PairedZone[107] = 101

T2ComboZone[201] = 207
T2ComboZone[207] = 207
T2PairedZone[207] = 201

T2KeepToNumber = {}
T2KeepToNumber[21] = 1
T2KeepToNumber[22] = 2
T2KeepToNumber[11] = 1
T2KeepToNumber[12] = 2
T2KeepToNumber[1] = 1
T2KeepToNumber[2] = 2


RoR_SoR_T2.ZoneNumber = {}
RoR_SoR_T2.ZoneNumber[7] = "RoR_SoR_T2WindowRealm1"
RoR_SoR_T2.ZoneNumber[107] = "RoR_SoR_T2WindowRealm2"
RoR_SoR_T2.ZoneNumber[207] = "RoR_SoR_T2WindowRealm3"


RoR_SoR_T2.BONumber = {}

RoR_SoR_T2.BONumber[7] = {}
RoR_SoR_T2.BONumber[7][57] = "RoR_SoR_T2WindowRealm1BO1"
RoR_SoR_T2.BONumber[7][61] = "RoR_SoR_T2WindowRealm1BO2"
RoR_SoR_T2.BONumber[7][62] = "RoR_SoR_T2WindowRealm1BO3"
RoR_SoR_T2.BONumber[7][135] = "RoR_SoR_T2WindowRealm1BO4"

RoR_SoR_T2.BONumber[107] = {}
RoR_SoR_T2.BONumber[107][239] = "RoR_SoR_T2WindowRealm2BO1"
RoR_SoR_T2.BONumber[107][240] = "RoR_SoR_T2WindowRealm2BO2"
RoR_SoR_T2.BONumber[107][241] = "RoR_SoR_T2WindowRealm2BO3"
RoR_SoR_T2.BONumber[107][242] = "RoR_SoR_T2WindowRealm2BO4"


RoR_SoR_T2.BONumber[101] = {}
RoR_SoR_T2.BONumber[101][239] = "RoR_SoR_T2WindowRealm2BO1"
RoR_SoR_T2.BONumber[101][240] = "RoR_SoR_T2WindowRealm2BO2"
RoR_SoR_T2.BONumber[101][241] = "RoR_SoR_T2WindowRealm2BO3"
RoR_SoR_T2.BONumber[101][242] = "RoR_SoR_T2WindowRealm2BO4"

RoR_SoR_T2.BONumber[207] = {}
RoR_SoR_T2.BONumber[207][5068] = "RoR_SoR_T2WindowRealm3BO1"
RoR_SoR_T2.BONumber[207][5069] = "RoR_SoR_T2WindowRealm3BO2"
RoR_SoR_T2.BONumber[207][5070] = "RoR_SoR_T2WindowRealm3BO3"
RoR_SoR_T2.BONumber[207][5071] = "RoR_SoR_T2WindowRealm3BO4"

RoR_SoR_T2.BOTimer = {}

RoR_SoR_T2.BOTimer[7] = {}
RoR_SoR_T2.BOTimer[7][57] = 0
RoR_SoR_T2.BOTimer[7][61] = 0
RoR_SoR_T2.BOTimer[7][62] = 0
RoR_SoR_T2.BOTimer[7][135] = 0

RoR_SoR_T2.BOTimer[101] = {}
RoR_SoR_T2.BOTimer[101][239] = 0
RoR_SoR_T2.BOTimer[101][240] = 0
RoR_SoR_T2.BOTimer[101][241] = 0
RoR_SoR_T2.BOTimer[101][242] = 0

RoR_SoR_T2.BOTimer[107] = {}
RoR_SoR_T2.BOTimer[107][239] = 0
RoR_SoR_T2.BOTimer[107][240] = 0
RoR_SoR_T2.BOTimer[107][241] = 0
RoR_SoR_T2.BOTimer[107][242] = 0

RoR_SoR_T2.BOTimer[207] = {}
RoR_SoR_T2.BOTimer[207][5068] = 0
RoR_SoR_T2.BOTimer[207][5069] = 0
RoR_SoR_T2.BOTimer[207][5070] = 0
RoR_SoR_T2.BOTimer[207][5071] = 0



RoR_SoR_T2.LockedRealm = {}
RoR_SoR_T2.LockedRealm[7] = 0
RoR_SoR_T2.LockedRealm[107] = 0
RoR_SoR_T2.LockedRealm[207]= 0

RoR_SoR_T2.KeepStatus = {}
RoR_SoR_T2.KeepStatus[7] = {}
RoR_SoR_T2.KeepStatus[7][1] = 0
RoR_SoR_T2.KeepStatus[7][2] = 0
RoR_SoR_T2.KeepStatus[107] = {}
RoR_SoR_T2.KeepStatus[107][11] = 0
RoR_SoR_T2.KeepStatus[107][12] = 0
RoR_SoR_T2.KeepStatus[207] = {}
RoR_SoR_T2.KeepStatus[207][21] = 0
RoR_SoR_T2.KeepStatus[207][22] = 0

RoR_SoR_T2.KeepOwner = {}
RoR_SoR_T2.KeepOwner[7] = {}
RoR_SoR_T2.KeepOwner[7][1] = 0
RoR_SoR_T2.KeepOwner[7][2] = 0
RoR_SoR_T2.KeepOwner[107] = {}
RoR_SoR_T2.KeepOwner[107][11] = 0
RoR_SoR_T2.KeepOwner[107][12] = 0
RoR_SoR_T2.KeepOwner[207] = {}
RoR_SoR_T2.KeepOwner[207][21] = 0
RoR_SoR_T2.KeepOwner[207][22] = 0

RoR_SoR_T2.KeepRank = {}
RoR_SoR_T2.KeepRank[7] = {}
RoR_SoR_T2.KeepRank[7][1] = 0
RoR_SoR_T2.KeepRank[7][2] = 0
RoR_SoR_T2.KeepRank[107] = {}
RoR_SoR_T2.KeepRank[107][11] = 0
RoR_SoR_T2.KeepRank[107][12] = 0
RoR_SoR_T2.KeepRank[207] = {}
RoR_SoR_T2.KeepRank[207][21] = 0
RoR_SoR_T2.KeepRank[207][22] = 0

RoR_SoR_T2.KeepMessage = {}
RoR_SoR_T2.KeepMessage[7] = {}
RoR_SoR_T2.KeepMessage[7][1] = 0
RoR_SoR_T2.KeepMessage[7][2] = 0
RoR_SoR_T2.KeepMessage[107] = {}
RoR_SoR_T2.KeepMessage[107][11] = 0
RoR_SoR_T2.KeepMessage[107][12] = 0
RoR_SoR_T2.KeepMessage[207] = {}
RoR_SoR_T2.KeepMessage[207][21] = 0
RoR_SoR_T2.KeepMessage[207][22] = 0



--checks and sets locks for locked zones at start


	for i=1,3 do
		WindowSetTintColor( "RoR_SoR_T2WindowRealm"..i, 80,80,80 )

		end
		


WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_2_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_2_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_2_KEEPRANK",false)

WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_2_LORD_ICON",false)

WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T2WindowRealm1_KEEP_WIN_2_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_1_KEEPFLAG",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T2WindowRealm2_KEEP_WIN_2_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_1_KEEPFLAG",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T2WindowRealm3_KEEP_WIN_2_KEEPFLAG",false)

RoR_SoR_T2.IsLocked[7] = true
RoR_SoR_T2.IsLocked[107] = true
RoR_SoR_T2.IsLocked[207] = true

local VPZone1 = GetCampaignZoneData(7 )
local VPZone2 = GetCampaignZoneData(101 )
local VPZone3 = GetCampaignZoneData(201 ) 



LabelSetText("RoR_SoR_T2WindowRealm1ZONE_PARING",towstring(GetZoneName(7))..L" - "..towstring(GetZoneName(T2PairedZone[7])))

LabelSetText("RoR_SoR_T2WindowRealm2ZONE_PARING",towstring(GetZoneName(107))..L" - "..towstring(GetZoneName(T2PairedZone[107])))

LabelSetText("RoR_SoR_T2WindowRealm3ZONE_PARING",towstring(GetZoneName(207))..L" - "..towstring(GetZoneName(T2PairedZone[207])))


--WindowSetShowing("RoR_SoR_T2WindowRealm1VP_ORDER",false)
--WindowSetShowing("RoR_SoR_T2WindowRealm2VP_ORDER",false)
--WindowSetShowing("RoR_SoR_T2WindowRealm3VP_ORDER",false)

--WindowSetShowing("RoR_SoR_T2WindowRealm1VP_DESTRO",false)
--WindowSetShowing("RoR_SoR_T2WindowRealm2VP_DESTRO",false)
--WindowSetShowing("RoR_SoR_T2WindowRealm3VP_DESTRO",false)


--tooltips
RoR_SoR_T2.BoOwner = {}
RoR_SoR_T2.BoOwner[7] = {}
RoR_SoR_T2.BoOwner[107] = {}
RoR_SoR_T2.BoOwner[207] = {}

RoR_SoR_T2.BoState = {}
RoR_SoR_T2.BoState[7] = {}
RoR_SoR_T2.BoState[107] = {}
RoR_SoR_T2.BoState[207] = {}



RoR_SoR_T2.VPs = {}
RoR_SoR_T2.VPs[7] = 50
RoR_SoR_T2.VPs[107] = 50
RoR_SoR_T2.VPs[207] = 50

	
local Width_Zone1_Order = ( ( VPZone1.controlPoints[1] / 100 ) * 147 )
--WindowSetDimensions( "RoR_SoR_T2WindowRealm1VP_ORDER", Width_Zone1_Order+2, 4 )
local Width_Zone1_Destro = ( ( VPZone1.controlPoints[2]/ 100 ) * 142 )
--WindowSetDimensions( "RoR_SoR_T2WindowRealm1VP_DESTRO", Width_Zone1_Destro+2, 4 )

local Width_Zone2_Order = ( ( VPZone2.controlPoints[1] / 100 ) * 147 )
--WindowSetDimensions( "RoR_SoR_T2WindowRealm2VP_ORDER", Width_Zone2_Order+2, 4 )
local Width_Zone2_Destro = ( ( VPZone2.controlPoints[2]/ 100 ) * 142 )
--WindowSetDimensions( "RoR_SoR_T2WindowRealm2VP_DESTRO", Width_Zone2_Destro+2, 4 )	

local Width_Zone3_Order = ( ( VPZone3.controlPoints[1] / 100 ) * 147 )
--WindowSetDimensions( "RoR_SoR_T2WindowRealm3VP_ORDER", Width_Zone3_Order+2, 4 )
local Width_Zone3_Destro = ( ( VPZone3.controlPoints[2]/ 100 ) * 142 )
--WindowSetDimensions( "RoR_SoR_T2WindowRealm3VP_DESTRO", Width_Zone3_Destro+2, 4 )
	
	
	
if VPZone1.controllingRealm == 0 then
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1LOCK", "Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO1", "Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO2", "Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO3", "Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO4", "Neutral-Locked",31,31 )
RoR_SoR_T2.LockedRealm[7] = 0

RoR_SoR_T2.BoOwner[7][57] = 0
RoR_SoR_T2.BoOwner[7][61] = 0
RoR_SoR_T2.BoOwner[7][62] = 0
RoR_SoR_T2.BoOwner[7][135] = 0
RoR_SoR_T2.KeepOwner[7][1] = 0
RoR_SoR_T2.KeepOwner[7][2] = 0


else
RoR_SoR_T2.LockedRealm[7] = VPZone1.controllingRealm

RoR_SoR_T2.BoOwner[7][57] = VPZone1.controllingRealm
RoR_SoR_T2.BoOwner[7][61] = VPZone1.controllingRealm
RoR_SoR_T2.BoOwner[7][62] = VPZone1.controllingRealm
RoR_SoR_T2.BoOwner[7][135] = VPZone1.controllingRealm

RoR_SoR_T2.KeepOwner[7][1] = VPZone1.controllingRealm
RoR_SoR_T2.KeepOwner[7][2] = VPZone1.controllingRealm


DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1LOCK", RoR_SoR_T2.GetFlag(VPZone1.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1LOCK" ,RoR_SoR_T2.GetFlag(VPZone1.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO1", RoR_SoR_T2.GetFlag(VPZone1.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO2", RoR_SoR_T2.GetFlag(VPZone1.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO3", RoR_SoR_T2.GetFlag(VPZone1.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm1BO4", RoR_SoR_T2.GetFlag(VPZone1.controllingRealm ,9) ,31,31 )

end

DynamicImageSetTexture("RoR_SoR_T2WindowRealm1_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone1.controllingRealm,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T2WindowRealm1_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone1.controllingRealm,9)),42,42 )
RoR_SoR_T2.BoState[7][57] = 9
RoR_SoR_T2.BoState[7][61] = 9
RoR_SoR_T2.BoState[7][62] = 9
RoR_SoR_T2.BoState[7][135] = 9
RoR_SoR_T2.KeepStatus[7][1] = 9
RoR_SoR_T2.KeepStatus[7][2] = 9

if VPZone2.controllingRealm == 0 then
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO4", "SoR_Neutral-Locked",31,31 )

RoR_SoR_T2.BoOwner[107][239] = 0
RoR_SoR_T2.BoOwner[107][240] = 0
RoR_SoR_T2.BoOwner[107][241] = 0
RoR_SoR_T2.BoOwner[107][242] = 0
RoR_SoR_T2.LockedRealm[107] = 0
RoR_SoR_T2.KeepOwner[107][11] = 0
RoR_SoR_T2.KeepOwner[107][12] = 0

else

RoR_SoR_T2.LockedRealm[107] = VPZone2.controllingRealm
RoR_SoR_T2.BoOwner[107][239] = VPZone2.controllingRealm
RoR_SoR_T2.BoOwner[107][240] = VPZone2.controllingRealm
RoR_SoR_T2.BoOwner[107][241] = VPZone2.controllingRealm
RoR_SoR_T2.BoOwner[107][242] = VPZone2.controllingRealm
RoR_SoR_T2.KeepOwner[107][11] = VPZone2.controllingRealm
RoR_SoR_T2.KeepOwner[107][12] = VPZone2.controllingRealm



DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2LOCK", RoR_SoR_T2.GetFlag(VPZone2.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2LOCK" ,RoR_SoR_T2.GetFlag(VPZone2.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO1", RoR_SoR_T2.GetFlag(VPZone2.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO2", RoR_SoR_T2.GetFlag(VPZone2.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO3", RoR_SoR_T2.GetFlag(VPZone2.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm2BO4", RoR_SoR_T2.GetFlag(VPZone2.controllingRealm ,9) ,31,31 )

end

RoR_SoR_T2.BoState[107][239] = 9
RoR_SoR_T2.BoState[107][240] = 9
RoR_SoR_T2.BoState[107][241] = 9
RoR_SoR_T2.BoState[107][242] = 9
RoR_SoR_T2.KeepStatus[107][11] = 9
RoR_SoR_T2.KeepStatus[107][12] = 9
DynamicImageSetTexture("RoR_SoR_T2WindowRealm2_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone2.controllingRealm,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T2WindowRealm2_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone2.controllingRealm,9)),42,42 )

if VPZone3.controllingRealm == 0 then
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO4", "SoR_Neutral-Locked",31,31 )


RoR_SoR_T2.BoOwner[207][5068] = 0
RoR_SoR_T2.BoOwner[207][5069] = 0
RoR_SoR_T2.BoOwner[207][5070] = 0
RoR_SoR_T2.BoOwner[207][5071] = 0

RoR_SoR_T2.LockedRealm[207] = 0
RoR_SoR_T2.KeepOwner[207][21] = 0
RoR_SoR_T2.KeepOwner[207][22] = 0
else
RoR_SoR_T2.LockedRealm[207] = VPZone3.controllingRealm

RoR_SoR_T2.BoOwner[207][5068] = VPZone3.controllingRealm
RoR_SoR_T2.BoOwner[207][5069] = VPZone3.controllingRealm
RoR_SoR_T2.BoOwner[207][5070] = VPZone3.controllingRealm
RoR_SoR_T2.BoOwner[207][5071] = VPZone3.controllingRealm
RoR_SoR_T2.KeepOwner[207][21] = VPZone3.controllingRealm
RoR_SoR_T2.KeepOwner[207][22] = VPZone3.controllingRealm


DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3LOCK", RoR_SoR_T2.GetFlag(VPZone3.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3LOCK" ,RoR_SoR_T2.GetFlag(VPZone3.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO1", RoR_SoR_T2.GetFlag(VPZone3.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO2", RoR_SoR_T2.GetFlag(VPZone3.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO3", RoR_SoR_T2.GetFlag(VPZone3.controllingRealm ,9) ,31,31 )
DynamicImageSetTexture( "RoR_SoR_T2WindowRealm3BO4", RoR_SoR_T2.GetFlag(VPZone3.controllingRealm ,9) ,31,31 )

end

DynamicImageSetTexture("RoR_SoR_T2WindowRealm3_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm,9)),42,42 )
DynamicImageSetTexture("RoR_SoR_T2WindowRealm3_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm,9)),42,42 )
RoR_SoR_T2.BoState[207][5068] = 9
RoR_SoR_T2.BoState[207][5069] = 9
RoR_SoR_T2.BoState[207][5070] = 9
RoR_SoR_T2.BoState[207][5071] = 9
RoR_SoR_T2.KeepStatus[207][21] = 9
RoR_SoR_T2.KeepStatus[207][22] = 9
	
end
function RoR_SoR_T2.OnChatLogUpdated(updateType, filterType) --premade chat checker for future chat updates
	if( updateType == SystemData.TextLogUpdate.ADDED ) then 
		if filterType == SystemData.ChatLogFilters.CHANNEL_9 then	
			local _, filterId, text = TextLogGetEntry( "Chat", TextLogGetNumEntries("Chat") - 1 ) 
			--	if text:find(L"!update") then 
				--PlaySound(GameData.Sound.QUEST_ABANDONED)
			--	RoR_SoR_T2.ZoneUpdate()
			RoR_SoR_T2.BO(text)
			--end		
		end
	end
end

function RoR_SoR_T2.BO(text)


	--d(linkData)
local baba = towstring(text)



if baba:match( L"SoR_T2_BO:([^%.]+).") then	
--Checking Warbuilder version of the hyperlink and alert if outdated
local Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY= baba:match( L"SoR_T2_BO:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
if RoR_SoR_T2.Debug == true then 
d(L"========== T2 FULL ZONE UPDATE ===========")
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
RoR_SoR_T2.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)
--PlaySound(GameData.Sound.QUEST_ABANDONED)

elseif baba:match( L"SoR_T2_BO_Update:([^%.]+).") then	
local Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER= baba:match( L"SoR_T2_BO_Update:(%d+):(%d+):(%d+):(%d+):(%d+)")

RoR_SoR_T2.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)

if RoR_SoR_T2.Debug == true then 
d(L"=========! T2 SINGLE BO UPDATE !============")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"BO ID: "..towstring(BO_ID)..L" , BO Owner: "..towstring(BO_OWNER)..L" , State: "..towstring(BO_STATE)..L" , Timer: "..towstring(BO_TIMER))
d(L"===============================")
end

elseif baba:match( L"SoR_T2_Keep:([^%.]+).") then	
local Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2= baba:match( L"SoR_T2_Keep:(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+):(.+)")
if RoR_SoR_T2.Debug == true then 
d(L"========== T2 ALL KEEPS UPDATE ===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Keep1: "..towstring(KEEP1_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP1_ID)))..L"), Owner: "..towstring(KEEP1_OWNER)..L" , Rank: "..towstring(KEEP1_RANK)..L" , Status: "..towstring(KEEP1_STATUS)..L" , Message: "..towstring(KEEP1_MESSAGE)..L" , Claimed: "..towstring(CLAIM_1)..L" , Outer: "..towstring(OUTER_1)..L" , Inner: "..towstring(INNER_1)..L" , Lord: "..towstring(LORD_1))
d(L"Keep2: "..towstring(KEEP2_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP2_ID)))..L"), Owner: "..towstring(KEEP2_OWNER)..L" , Rank: "..towstring(KEEP2_RANK)..L" , Status: "..towstring(KEEP2_STATUS)..L" , Message: "..towstring(KEEP2_MESSAGE)..L" , Claimed: "..towstring(CLAIM_2)..L" , Outer: "..towstring(OUTER_2)..L" , Inner: "..towstring(INNER_2)..L" , Lord: "..towstring(LORD_2))
d(L"===============================")
end

RoR_SoR_T2.Update_ALL_KEEPS(Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2)

elseif baba:match( L"SoR_T2_Keep_Update:([^%.]+).") then	
local Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE= baba:match( L"SoR_T2_Keep_Update:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
if RoR_SoR_T2.Debug == true then 
d(L"==========! T2 Single KEEP UPDATE! ===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Keep: "..towstring(KEEP_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP_ID)))..L"), Owner: "..towstring(KEEP_OWNER)..L" , Rank: "..towstring(KEEP_RANK)..L" , Status: "..towstring(KEEP_STATUS)..L" , Message: "..towstring(KEEP_MESSAGE))
d(L"===============================")
end
RoR_SoR_T2.Update_ONE_KEEP(Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE)



end





end

function RoR_SoR_T2.Update_ONE_KEEP(Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE)
local Test_Zone = tonumber(Zone)
local Test_KEEP_ID = tonumber(KEEP_ID)
local Test_KEEP_OWNER = tonumber(KEEP_OWNER)
local Test_KEEP_RANK = tonumber(KEEP_RANK)
local Test_KEEP_STATUS = tonumber(KEEP_STATUS)
local Test_KEEP_MESSAGE = tonumber(KEEP_MESSAGE)



RoR_SoR_T2.KeepStatus[T2ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_STATUS
RoR_SoR_T2.KeepOwner[T2ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_OWNER
RoR_SoR_T2.KeepRank[T2ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_RANK
RoR_SoR_T2.KeepMessage[T2ComboZone[Test_Zone]][KEEP_ID] = Test_KEEP_MESSAGE

-- Keep image updates
local T2SOLOKEEP = tostring(RoR_SoR.GetKeepTexture(Test_KEEP_OWNER,Test_KEEP_STATUS))
DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPICON", T2SOLOKEEP,42,42 )

--Keep Rank
if Test_KEEP_RANK > 0 then
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPRANK",true)
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPRANK", "KeepDifficulty-"..Test_KEEP_RANK.."-star" )
else
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPRANK",false)
end

 -- Keep health label updates
local  T2SOLOKEEPHEALTH = RoR_SoR_T2.GetKeepHeath(Test_KEEP_OWNER,Test_KEEP_STATUS,Test_KEEP_MESSAGE,RoR_SoR_T2.KeepHP[T2ComboZone[Test_Zone]][Test_KEEP_ID])
 
 DynamicImageSetTextureSlice(  tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_LORD_ICON", RoR_SoR_T2.KeepLord[Test_KEEP_OWNER] )
-- LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_HEALTH",towstring(T2SOLOKEEPHEALTH))
--WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_HEALTH",1)

 -- Door hide
if Test_KEEP_MESSAGE == 8 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",false)
elseif Test_KEEP_MESSAGE >= 9 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_LORD_ICON",true)
else
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_"..T2KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",true)
end

return
end



function RoR_SoR_T2.Update_ALL_KEEPS(Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2)
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

local KEEP_INNER_1 = tonumber(INNER_1)
local KEEP_LORD_1 = tonumber(LORD_1)

local KEEP_INNER_2 = tonumber(INNER_2)
local KEEP_LORD_2 = tonumber(LORD_2)

RoR_SoR_T2.KeepClaim[T2ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_CLAIM
RoR_SoR_T2.KeepClaim[T2ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_CLAIM

RoR_SoR_T2.KeepStatus[T2ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_STATUS
RoR_SoR_T2.KeepStatus[T2ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_STATUS

RoR_SoR_T2.KeepOwner[T2ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_OWNER
RoR_SoR_T2.KeepOwner[T2ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_OWNER

RoR_SoR_T2.KeepRank[T2ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_RANK
RoR_SoR_T2.KeepRank[T2ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_RANK

RoR_SoR_T2.KeepMessage[T2ComboZone[Test_Zone]][Test_KEEP1_ID] = Test_KEEP1_MESSAGE
RoR_SoR_T2.KeepMessage[T2ComboZone[Test_Zone]][Test_KEEP2_ID] = Test_KEEP2_MESSAGE



-- Keep image updates
RoR_SoR_T2.T2Keeps = {}

RoR_SoR_T2.T2Keeps[1] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP1_OWNER,KEEP1_STATUS))
RoR_SoR_T2.T2Keeps[2] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP2_OWNER,KEEP2_STATUS))

DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPICON", RoR_SoR_T2.T2Keeps[1],42,42 )
DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPICON", RoR_SoR_T2.T2Keeps[2],42,42 )

--Keep Rank
if Test_KEEP1_RANK > 0 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK",true)
DynamicImageSetTextureSlice( tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK", "KeepDifficulty-"..Test_KEEP1_RANK.."-star" )
else
DynamicImageSetTextureSlice( tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPRANK",false)
end

if Test_KEEP2_RANK > 0 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK",true)
DynamicImageSetTextureSlice( tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK", "KeepDifficulty-"..Test_KEEP2_RANK.."-star" )
else
DynamicImageSetTextureSlice( tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPRANK",false)
end

DynamicImageSetTextureSlice(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON", RoR_SoR_T2.KeepLord[Test_KEEP1_OWNER] )
DynamicImageSetTextureSlice(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON", RoR_SoR_T2.KeepLord[Test_KEEP2_OWNER] )

 -- Keep health label updates

 -- Door hide
 
 --[[
if Test_KEEP1_MESSAGE == 0 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false) 
 elseif Test_KEEP1_MESSAGE == 1 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)  
 elseif Test_KEEP1_MESSAGE == 2 then
  WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false) 
 elseif Test_KEEP1_MESSAGE == 3 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)   
elseif Test_KEEP1_MESSAGE == 4 and Test_KEEP1_STATUS == 2 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
 elseif Test_KEEP1_MESSAGE == 4 and Test_KEEP1_STATUS == 3 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
elseif Test_KEEP1_MESSAGE == 5 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
elseif Test_KEEP1_MESSAGE == 6 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
elseif Test_KEEP1_MESSAGE == 7 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
elseif Test_KEEP1_MESSAGE == 8 and Test_KEEP1_STATUS == 3 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE == 8 and Test_KEEP1_STATUS == 4 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==9 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==10 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==11 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==12 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
else
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
end

if Test_KEEP1_STATUS == 5 or Test_KEEP1_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
end

if Test_KEEP2_MESSAGE == 0 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false) 
 elseif Test_KEEP2_MESSAGE == 1 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)  
 elseif Test_KEEP2_MESSAGE == 2 then
  WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false) 
 elseif Test_KEEP2_MESSAGE == 3 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)   
elseif Test_KEEP2_MESSAGE == 4 and Test_KEEP1_STATUS == 2 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 elseif Test_KEEP2_MESSAGE == 4 and Test_KEEP1_STATUS == 3 then
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
elseif Test_KEEP2_MESSAGE == 5 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
elseif Test_KEEP2_MESSAGE == 6 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
elseif Test_KEEP2_MESSAGE == 7 then 
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
elseif Test_KEEP2_MESSAGE == 8 and Test_KEEP1_STATUS == 3 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE == 8 and Test_KEEP1_STATUS == 4 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==9 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==10 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==11 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==12 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
else
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
end

if Test_KEEP2_STATUS == 5 or Test_KEEP2_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
end
--]]

		if KEEP_INNER_1 > 0 then 
			 RoR_SoR_T2.KeepHP[T2ComboZone[Test_Zone]][Test_KEEP1_ID] = KEEP_INNER_1
			WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",true)
			WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false) 			 
		else
			 RoR_SoR_T2.KeepHP[T2ComboZone[Test_Zone]][Test_KEEP1_ID] = KEEP_LORD_1
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPDOOR",false)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",true) 			 
		end

		if KEEP_INNER_2 > 0 then 
			 RoR_SoR_T2.KeepHP[T2ComboZone[Test_Zone]][Test_KEEP2_ID] = KEEP_INNER_2
			WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)  
		else
			 RoR_SoR_T2.KeepHP[T2ComboZone[Test_Zone]][Test_KEEP2_ID] = KEEP_LORD_2
			WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPDOOR",false)
 WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",true)  
		end

if Test_KEEP1_STATUS == 5 or Test_KEEP1_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
end
		
	if Test_KEEP2_STATUS == 5 or Test_KEEP2_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON",false)
end	

 RoR_SoR_T2.T2KeepHeath = {}
 RoR_SoR_T2.T2KeepHeath[1] = RoR_SoR_T2.GetKeepHeath(Test_KEEP1_OWNER,Test_KEEP1_STATUS,Test_KEEP1_MESSAGE,RoR_SoR_T2.KeepHP[T2ComboZone[Test_Zone]][Test_KEEP1_ID])
 RoR_SoR_T2.T2KeepHeath[2] = RoR_SoR_T2.GetKeepHeath(Test_KEEP2_OWNER,Test_KEEP2_STATUS,Test_KEEP2_MESSAGE,RoR_SoR_T2.KeepHP[T2ComboZone[Test_Zone]][Test_KEEP2_ID])
-- RoR_SoR_T2.T2KeepHeath[1] = towstring(KEEP1_HP)..L"%"
-- RoR_SoR_T2.T2KeepHeath[2] = towstring(KEEP2_HP)..L"%"
 
 
 
 LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",towstring(RoR_SoR_T2.T2KeepHeath[1]))
 --WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",1)
 
  LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",towstring(RoR_SoR_T2.T2KeepHeath[2]))
 -- WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",1)


return
end


function RoR_SoR_T2.GetKeepHeath(KEEP_OWNER,KEEP_STATE,KEEP_MESSAGE,KEEP_HP)
local Owner = tonumber(KEEP_OWNER)
local State = tonumber(KEEP_STATE)
local Message = tonumber(KEEP_MESSAGE)
local HP = tonumber(KEEP_HP) or 0
if State == 1 then 
return L""
elseif State == 2 then
	--if Message == 0 then return L"100%" 	
	--elseif Message == 1 then return L"75%" 
	--elseif Message == 2 then return L"50%" 
	--elseif Message == 3 then return L"20%" 
	--elseif Message == 4 then return L"0%" 
	--else
	--return L"0%"
	--end
	return towstring(HP)..L"%"
elseif State == 3 then
--	if Message == 4 then return L"100%" 
--	elseif Message == 5 then return L"75%" 
--	elseif Message == 6 then return L"50%" 	
--	elseif Message == 7 then return L"20%" 
--	elseif Message == 8 then return L"0%" 
--	else	
--	return L"0%" 
--	end
	return towstring(HP)..L"%"
elseif State == 4 then
 --  	if Message == 9 then return L"  100%" --lord <icon29981>
--	elseif Message == 10 then return L"  50%" 
--	elseif Message == 11 then return L"  20%" 
--	elseif Message == 12 then return L"  0%" 
	return towstring(HP)..L"%"
	--else 
	--return L" 0%"	
	--end
elseif State == 5 then
	return RoR_SoR.TextTaken
elseif State == 6 then
	return RoR_SoR.TextLock
end
return L""
end


function RoR_SoR_T2.GetKeepOwner(KEEP_OWNER,KEEP_STATE)
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




function RoR_SoR_T2.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)

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

--local Test_VP = tonumber(VP)
local Test_SUPPLY = tonumber(SUPPLY)

RoR_SoR_T2.VPs[Test_Zone] = tonumber(VP)

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


RoR_SoR_T2.BoOwner[T2ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_Owner
RoR_SoR_T2.BoOwner[T2ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_Owner
RoR_SoR_T2.BoOwner[T2ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_Owner
RoR_SoR_T2.BoOwner[T2ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_Owner

RoR_SoR_T2.BoState[T2ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_State
RoR_SoR_T2.BoState[T2ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_State
RoR_SoR_T2.BoState[T2ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_State
RoR_SoR_T2.BoState[T2ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_State
 
 
RoR_SoR_T2.Update_ONE_BO(Test_Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER)
RoR_SoR_T2.Update_ONE_BO(Test_Zone,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER)
RoR_SoR_T2.Update_ONE_BO(Test_Zone,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER)
RoR_SoR_T2.Update_ONE_BO(Test_Zone,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER)

--RoR_SoR_T2.BOTimer[T2ComboZone[208]][5063] = Test_BO1_Timer
--RoR_SoR_T2.BOTimer[T2ComboZone[208]][5064] = Test_BO2_Timer
--RoR_SoR_T2.BOTimer[T2ComboZone[208]][5065] = Test_BO3_Timer
--RoR_SoR_T2.BOTimer[T2ComboZone[208]][5066] = Test_BO4_Timer
--RoR_SoR_T2.BOTimer[T2ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_Timer
--RoR_SoR_T2.BOTimer[T2ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_Timer
--RoR_SoR_T2.BOTimer[T2ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_Timer
--RoR_SoR_T2.BOTimer[T2ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_Timer

--RoR_SoR_T2.BOTimer[Test_Zone][Test_BO1_ID] =Test3_BO1_Timer
--RoR_SoR_T2.BOTimer[Test_Zone][Test_BO2_ID] =Test3_BO2_Timer
--RoR_SoR_T2.BOTimer[Test_Zone][Test_BO3_ID] =Test3_BO3_Timer
--RoR_SoR_T2.BOTimer[Test_Zone][Test_BO4_ID] =Test3_BO4_Timer


--d(L"Timers: "..towstring(Test_Zone)..L" , "..towstring(Test3_BO1_ID))
--d(L"Timers: "..towstring(RoR_SoR_T2.BOTimer[Test_Zone][Test3_BO1_ID]))


RoR_SoR_T2.Flag = {}

RoR_SoR_T2.Flag[1] = tostring(RoR_SoR_T2.GetFlag(Test_BO1_Owner,Test_BO1_State))
RoR_SoR_T2.Flag[2] = tostring(RoR_SoR_T2.GetFlag(Test_BO2_Owner,Test_BO2_State))
RoR_SoR_T2.Flag[3] = tostring(RoR_SoR_T2.GetFlag(Test_BO3_Owner,Test_BO3_State))
RoR_SoR_T2.Flag[4] = tostring(RoR_SoR_T2.GetFlag(Test_BO4_Owner,Test_BO4_State))

if Test_SUPPLY == 1 then

WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPSUPPLY",true)
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPFLAG",true)

WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPSUPPLY",true)
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPFLAG",true)

else
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPFLAG",false)
end


-- VP update	
--local Width_Zone_Order = ( ( Test_VP / 100 ) * 147 )
--WindowSetDimensions( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_ORDER", Width_Zone_Order+2, 4 )
--local Width_Zone_Destro = ( ( (100-Test_VP) / 100 ) * 142 )
--WindowSetDimensions( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_DESTRO", Width_Zone_Destro+2, 4 )

LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_PARING",towstring(GetZoneName(Test_Zone))..L" - "..towstring(GetZoneName(T2PairedZone[Test_Zone])))


--check if zone lock and do stuff:
if Test_BO1_State == 9 then
RoR_SoR_T2.IsLocked[T2ComboZone[Test_Zone]] = true

if Test_BO1_Owner == 0 then DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCK",  "SoR_Neutral-Locked",31,31  )
 RoR_SoR_T2.LockedRealm[T2ComboZone[Test_Zone]] = 0

else
--DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCK", "map_markers01" ,31,31)
DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCK", RoR_SoR_T2.Flag[1] ,31,31 )
end

 RoR_SoR_T2.LockedRealm[T2ComboZone[Test_Zone]] = Test_BO1_Owner

		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCK",true)
		
		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCKED_TEXT",true)
		
		WindowSetTintColor( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]), 80,80,80 )
--				LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."PERCENT_ORDER",L"")
--LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."PERCENT_DESTRO",L"")
WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_NAME",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_TIER",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_PARING",0.4)

--		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_ORDERBAR",false)
--		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_DESTROBAR",false)

WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",0.4)
 WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",0.4) 

WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."_KEEP_WIN_2_KEEPFLAG",false)
		
else

if Test_BO1_State ~= 8  then DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCK", "SoR_Neutral-Locked" ,31,31 ) end
RoR_SoR_T2.IsLocked[T2ComboZone[Test_Zone]] = false
		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCK",false)
		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."LOCKED_TEXT",false)
	WindowSetTintColor( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]), 255,255,255 )
--	WindowSetTintColor( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]].."VP_ORDERBAR"), 50,50,255 )
--	WindowSetTintColor( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]].."VP_DESTROBAR"), 200,0,0 )

--			WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_ORDERBAR",true)
--		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_DESTROBAR",true)
	
--		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_ORDER",true)
--		WindowSetShowing( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."VP_DESTRO",true)
	
--LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."PERCENT_ORDER",towstring(Test_VP)..L"%")
--LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."PERCENT_DESTRO",towstring(100-Test_VP)..L"%")
	WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_NAME",1)
	WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_TIER",1)	
	WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_PARING",1)		
 WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",1)
 WindowSetFontAlpha(tostring(RoR_SoR_T2.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",1) 
	
end

--local DataZone = GetCampaignZoneData(Test_Zone)
--LabelSetText(tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."ZONE_TIER",L"T"..towstring(DataZone.tierId))



for i=1,4 do

	 
if  (Test_State[i]  == 8 or Test_State[i]  == 9) and  Test_Owner[i] == 0 then
DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."BO"..i, "SoR_Neutral-Locked",31,31 )
else
--DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."BO"..i, "SoR_Neutral-Locked" ,31,31)
DynamicImageSetTexture( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone]]).."BO"..i, RoR_SoR_T2.Flag[i] ,31,31 )
end

end


return
end

function RoR_SoR_T2.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)


local Test_Zone2 = tonumber(Zone)
local Test_BO_ID2 = tonumber(BO_ID)
local Test_BO_Owner2 = tonumber(BO_OWNER)
local Test_BO_State2 = tonumber(BO_STATE)
local Test_BO_Timer2 = tonumber(BO_TIMER)

RoR_SoR_T2.Flag = tostring(RoR_SoR_T2.GetFlag(Test_BO_Owner2,Test_BO_State2))

if Test_BO_Owner2 == 0 and (Test_BO_State2 == 9 or Test_BO_State2 == 8) then
DynamicImageSetTexture( tostring(RoR_SoR_T2.BONumber[T2ComboZone[Test_Zone2]][Test_BO_ID2]), "SoR_Neutral-Locked",31,31 )
else
--DynamicImageSetTexture( tostring(RoR_SoR_T2.BONumber[T2ComboZone[Test_Zone2]][Test_BO_ID2]), "map_markers01" ,28,33)
DynamicImageSetTexture( tostring(RoR_SoR_T2.BONumber[T2ComboZone[Test_Zone2]][Test_BO_ID2]), tostring(RoR_SoR_T2.Flag) ,31,31)
end


RoR_SoR_T2.BoOwner[T2ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_Owner2
RoR_SoR_T2.BoState[T2ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_State2

RoR_SoR_T2.BOTimer[T2ComboZone[Test_Zone2]][Test_BO_ID2] = Test_BO_Timer2

--local VPZone = GetCampaignZoneData(Test_Zone2) 
	
--local Width_Zone_Order = ( ( RoR_SoR_T2.VPs[T2ComboZone[Test_Zone2]] / 100 ) * 147 )
--WindowSetDimensions( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone2]]).."VP_ORDER", Width_Zone_Order+2, 4 )
--local Width_Zone_Destro = ( ( (100-RoR_SoR_T2.VPs[T2ComboZone[Test_Zone2]])/ 100 ) * 142 )
--WindowSetDimensions( tostring(RoR_SoR_T2.ZoneNumber[T2ComboZone[Test_Zone2]]).."VP_DESTRO", Width_Zone_Destro+2, 4 )


return
end


function RoR_SoR_T2.GetFlag(BO_OWNER,BO_STATE)
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

function RoR_SoR_T2.TimeUpdate(timeElapsed)
for i = 1,3 do

for k, v in pairs(RoR_SoR_T2.BOTimer[RoR_SoR_T2.T2Zones[i]]) do
if v > 0 then 
RoR_SoR_T2.BOTimer[RoR_SoR_T2.T2Zones[i]][k] = RoR_SoR_T2.BOTimer[RoR_SoR_T2.T2Zones[i]][k] - timeElapsed
LabelSetText(tostring(RoR_SoR_T2.BONumber[RoR_SoR_T2.T2Zones[i]][k]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[RoR_SoR_T2.T2Zones[i]][k])))


	if RoR_SoR_T2.BoState[RoR_SoR_T2.T2Zones[i]][k] == 16 then
		local GetRealmColor = RoR_SoR_T2.BoOwner[RoR_SoR_T2.T2Zones[i]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.RealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T2.BONumber[RoR_SoR_T2.T2Zones[i]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 
	elseif 	RoR_SoR_T2.BoState[RoR_SoR_T2.T2Zones[i]][k] == 4 then
		local GetRealmColor = RoR_SoR_T2.BoOwner[RoR_SoR_T2.T2Zones[i]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.InvertRealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T2.BONumber[RoR_SoR_T2.T2Zones[i]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 	
	end



else
LabelSetText(tostring(RoR_SoR_T2.BONumber[RoR_SoR_T2.T2Zones[i]][k]).."_TIMER",L"")
--d(L"k= "..towstring(k)) --k is ID
--d(L"v= "..towstring(v)) -- v is value
end
end


end
end



function RoR_SoR_T2.OnMouseOverStart()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local WindowName = towstring(SystemData.MouseOverWindow.name)
local FinalName = WindowName:match(L"RoR_SoR_T2Window([^%.]+)")

local Line1 = L""
local Line2 = L""
local Line3 = L""
if FinalName ~= nil or FinalName ~= "" then
--d(L"Tooltip "..towstring(FinalName))
--	d(L"Tooltip "..towstring(WindowName))
--Dwarf 

if FinalName == L"Realm1BO1" then
	Line1 = towstring(GetObjectiveName(57))
	if RoR_SoR_T2.BOTimer[7][57] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[7][57])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[7]][57],RoR_SoR_T2.BoState[T2ComboZone[7]][57])
elseif FinalName == L"Realm1BO2" then
	Line1 = towstring(GetObjectiveName(61))
	if RoR_SoR_T2.BOTimer[7][61] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[7][61])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[7]][61],RoR_SoR_T2.BoState[T2ComboZone[7]][61])
elseif FinalName == L"Realm1BO3" then
	Line1 = towstring(GetObjectiveName(62))
	if RoR_SoR_T2.BOTimer[7][62] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[7][62])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[7]][62],RoR_SoR_T2.BoState[T2ComboZone[7]][62])
elseif FinalName == L"Realm1BO4" then
	Line1 = towstring(GetObjectiveName(135))
	if RoR_SoR_T2.BOTimer[7][135] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[7][135])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[7]][135],RoR_SoR_T2.BoState[T2ComboZone[7]][135])

	elseif FinalName == L"Realm1LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.LockedRealm[7],9)	
		
	elseif FinalName == L"Realm1_KEEP_WIN_1_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(1)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][21], RoR_SoR_T2.KeepStatus[207][21])	
	if RoR_SoR_T2.KeepRank[7][1] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T2.KeepRank[7][1])) end
	if RoR_SoR_T2.KeepStatus[7][1] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR_T2.GetKeepHeath(RoR_SoR_T2.KeepOwner[7][1],RoR_SoR_T2.KeepStatus[7][1],RoR_SoR_T2.KeepMessage[7][1],RoR_SoR_T2.KeepHP[7][1])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[7][1], RoR_SoR_T2.KeepStatus[7][1]))..towstring(temp_Rank)..towstring(temp_Health)
	
	elseif FinalName == L"Realm1_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(2)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][21], RoR_SoR_T2.KeepStatus[207][21])	
	if RoR_SoR_T2.KeepRank[7][2] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T2.KeepRank[7][2])) end
	if RoR_SoR_T2.KeepStatus[7][2] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR_T2.GetKeepHeath(RoR_SoR_T2.KeepOwner[7][2],RoR_SoR_T2.KeepStatus[7][2],RoR_SoR_T2.KeepMessage[7][2],RoR_SoR_T2.KeepHP[7][2])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[7][2], RoR_SoR_T2.KeepStatus[7][2]))..towstring(temp_Rank)..towstring(temp_Health)
	

		
--empire

elseif FinalName == L"Realm2BO1" then
	Line1 = towstring(GetObjectiveName(239))
	if RoR_SoR_T2.BOTimer[107][239] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[107][239])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[107]][239],RoR_SoR_T2.BoState[T2ComboZone[107]][239])
elseif FinalName == L"Realm2BO2" then
	Line1 = towstring(GetObjectiveName(240))
	if RoR_SoR_T2.BOTimer[107][240] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[107][240])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[107]][240],RoR_SoR_T2.BoState[T2ComboZone[107]][240])
elseif FinalName == L"Realm2BO3" then
	Line1 = towstring(GetObjectiveName(241))
	if RoR_SoR_T2.BOTimer[107][241] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[107][241])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[107]][241],RoR_SoR_T2.BoState[T2ComboZone[107]][241])
	
elseif FinalName == L"Realm2BO4" then
	Line1 = towstring(GetObjectiveName(242))
	if RoR_SoR_T2.BOTimer[107][242] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[107][242])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[107]][242],RoR_SoR_T2.BoState[T2ComboZone[107]][242])	
	
	elseif FinalName == L"Realm2LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.LockedRealm[107],9)	
	

	elseif FinalName == L"Realm2_KEEP_WIN_1_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(11)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][21], RoR_SoR_T2.KeepStatus[207][21])	
	if RoR_SoR_T2.KeepRank[107][11] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T2.KeepRank[107][11])) end
	if RoR_SoR_T2.KeepStatus[107][11] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR_T2.GetKeepHeath(RoR_SoR_T2.KeepOwner[107][11],RoR_SoR_T2.KeepStatus[107][11],RoR_SoR_T2.KeepMessage[107][11],RoR_SoR_T2.KeepHP[107][11])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[107][11], RoR_SoR_T2.KeepStatus[107][11]))..towstring(temp_Rank)..towstring(temp_Health)
	
	elseif FinalName == L"Realm2_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(12)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][21], RoR_SoR_T2.KeepStatus[207][21])	
	if RoR_SoR_T2.KeepRank[107][12] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T2.KeepRank[107][12])) end
	if RoR_SoR_T2.KeepStatus[107][12] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR_T2.GetKeepHeath(RoR_SoR_T2.KeepOwner[107][12],RoR_SoR_T2.KeepStatus[107][12],RoR_SoR_T2.KeepMessage[107][12],RoR_SoR_T2.KeepHP[107][12])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[107][12], RoR_SoR_T2.KeepStatus[107][12]))..towstring(temp_Rank)..towstring(temp_Health)
	

	
	
--Elf

elseif FinalName == L"Realm3BO1" then
	Line1 = towstring(GetObjectiveName(5068))
	if RoR_SoR_T2.BOTimer[207][5068] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[207][5068])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[207]][5068],RoR_SoR_T2.BoState[T2ComboZone[207]][5068])
elseif FinalName == L"Realm3BO2" then
	Line1 = towstring(GetObjectiveName(5069))
	if RoR_SoR_T2.BOTimer[207][5069] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[207][5069])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[207]][5069],RoR_SoR_T2.BoState[T2ComboZone[207]][5069])
elseif FinalName == L"Realm3BO3" then
	Line1 = towstring(GetObjectiveName(5070))
	if RoR_SoR_T2.BOTimer[207][5070] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[207][5070])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[207]][5070],RoR_SoR_T2.BoState[T2ComboZone[207]][5070])
elseif FinalName == L"Realm3BO4" then
--	Line1 = towstring(GetObjectiveName(5072))
--	if RoR_SoR_T2.BOTimer[207][5072] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[207][5072])) else Line2 = L"" end
--	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[207]][5072],RoR_SoR_T2.BoState[T2ComboZone[207]][5072])
	Line1 = towstring(GetObjectiveName(5071))	
	if RoR_SoR_T2.BOTimer[207][5071] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T2.BOTimer[207][5071])) else Line2 = L"" end
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.BoOwner[T2ComboZone[207]][5071],RoR_SoR_T2.BoState[T2ComboZone[207]][5071])	

	elseif FinalName == L"Realm3LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T2.LockedRealm[207],9)	
	
	elseif FinalName == L"Realm3_KEEP_WIN_1_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(21)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][21], RoR_SoR_T2.KeepStatus[207][21])	
	if RoR_SoR_T2.KeepRank[207][21] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T2.KeepRank[207][21])) end
	if RoR_SoR_T2.KeepStatus[207][21] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR_T2.GetKeepHeath(RoR_SoR_T2.KeepOwner[207][21],RoR_SoR_T2.KeepStatus[207][21],RoR_SoR_T2.KeepMessage[207][21],RoR_SoR_T2.KeepHP[207][21])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][21], RoR_SoR_T2.KeepStatus[207][21]))..towstring(temp_Rank)..towstring(temp_Health)
	
	elseif FinalName == L"Realm3_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(tonumber(22)))
--	Line2 = RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][21], RoR_SoR_T2.KeepStatus[207][21])	
	if RoR_SoR_T2.KeepRank[207][22] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T2.KeepRank[207][22])) end
	if RoR_SoR_T2.KeepStatus[207][22] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR_T2.GetKeepHeath(RoR_SoR_T2.KeepOwner[207][22],RoR_SoR_T2.KeepStatus[207][22],RoR_SoR_T2.KeepMessage[207][22],RoR_SoR_T2.KeepHP[207][22])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T2.KeepOwner[207][22], RoR_SoR_T2.KeepStatus[207][22]))..towstring(temp_Rank)..towstring(temp_Health)
	
	
	

	
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

function RoR_SoR_T2.Close()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local MouseOverWindowName = SystemData.MouseOverWindow.name
	WindowSetShowing(WinParent,false)
	
end


function RoR_SoR_T2.Update(timeElapsed)

RoR_SoR_T2.Timer = RoR_SoR_T2.Timer + timeElapsed
if RoR_SoR_T2.Timer > 1 then 
RoR_SoR_T2.Timer = 0
RoR_SoR_T2.ZoneUpdate()
end
end


RoR_SoR_T4 = {}
local version = "104"

function RoR_SoR_T4.OnInitialize()
RegisterEventHandler(TextLogGetUpdateEventId("Chat"), "RoR_SoR_T4.OnChatLogUpdated")

CreateWindow("RoR_SoR_T4Window", true)

CreateWindowFromTemplate( "RoR_SoR_T4WindowRealm1", "T4TemplateRealm1", "RoR_SoR_T4Window" )
	WindowClearAnchors( "RoR_SoR_T4WindowRealm1" )
    WindowAddAnchor( "RoR_SoR_T4WindowRealm1", "topleft", "RoR_SoR_Window", "topleft",38, 40)


CreateWindowFromTemplate( "RoR_SoR_T4WindowRealm2", "T4TemplateRealm1", "RoR_SoR_T4Window" )
	WindowClearAnchors( "RoR_SoR_T4WindowRealm2" )
    WindowAddAnchor( "RoR_SoR_T4WindowRealm2", "bottomleft", "RoR_SoR_T4WindowRealm1", "topleft",0 , -24)

CreateWindowFromTemplate( "RoR_SoR_T4WindowRealm3", "T4TemplateRealm1", "RoR_SoR_T4Window" )
	WindowClearAnchors( "RoR_SoR_T4WindowRealm3" )
    WindowAddAnchor( "RoR_SoR_T4WindowRealm3", "bottomleft", "RoR_SoR_T4WindowRealm2", "topleft",0 , -24)	
	
--	DynamicImageSetTexture ("RoR_SoR_T4WindowRealm2Banner", "Realm2", 256,128)
--	DynamicImageSetTexture ("RoR_SoR_T4WindowRealm3Banner", "Realm3", 256,128)

		DynamicImageSetTextureSlice("RoR_SoR_T4WindowRealm1Menu01", "PairingGvDSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T4WindowRealm2Menu01", "PairingEvCSelected" )
	DynamicImageSetTextureSlice("RoR_SoR_T4WindowRealm3Menu01", "PairingElvesSelected")
	
--RoR_SoR_T4.Debug = true
	
	
RoR_SoR_T4.Active_Zone = 0	
--LayoutEditor.RegisterWindow( "RoR_SoR_T4Window", L"RoR_SoR_T4", L"RoR_SoR_T4", true, true, true, nil )
--RegisterEventHandler(SystemData.Events.ALL_MODULES_INITIALIZED, "RoR_SoR_T4.ZoneUpdate")

--LabelSetText("RoR_SoR_T4WindowTIER_NAME",L"Tier 2 Beta")

LabelSetText("RoR_SoR_T4WindowRealm1_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm1_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T4WindowRealm2_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm2_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T4WindowRealm3_KEEP_WIN_1_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm3_KEEP_WIN_1_HEALTH",0.4)
LabelSetText("RoR_SoR_T4WindowRealm1_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm1_KEEP_WIN_2_HEALTH",0.4)
LabelSetText("RoR_SoR_T4WindowRealm2_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm2_KEEP_WIN_2_HEALTH",0.4)
LabelSetText("RoR_SoR_T4WindowRealm3_KEEP_WIN_2_HEALTH",RoR_SoR.TextLock)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm3_KEEP_WIN_2_HEALTH",0.4)

LabelSetText("RoR_SoR_T4WindowRealm1LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T4WindowRealm2LOCKED_TEXT",RoR_SoR.TextZoneLocked)
LabelSetText("RoR_SoR_T4WindowRealm3LOCKED_TEXT",RoR_SoR.TextZoneLocked)

LabelSetText("RoR_SoR_T4WindowRealm1ZONE_TIER",L"T3")
LabelSetText("RoR_SoR_T4WindowRealm2ZONE_TIER",L"T3")
LabelSetText("RoR_SoR_T4WindowRealm3ZONE_TIER",L"T3")

LabelSetText("RoR_SoR_T4WindowRealm1ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN )))
LabelSetText("RoR_SoR_T4WindowRealm2ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS )))
LabelSetText("RoR_SoR_T4WindowRealm3ZONE_NAME",towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF )))

--hides the race name, on Hargrims request ;(
WindowSetShowing("RoR_SoR_T4WindowRealm1ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2ZONE_NAME",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3ZONE_NAME",false)

--WindowSetShowing("RoR_SoR_T4WindowRealm1VP_ORDER",false)
--WindowSetShowing("RoR_SoR_T4WindowRealm2VP_ORDER",false)
--WindowSetShowing("RoR_SoR_T4WindowRealm3VP_ORDER",false)

--WindowSetShowing("RoR_SoR_T4WindowRealm1VP_DESTRO",false)
--WindowSetShowing("RoR_SoR_T4WindowRealm2VP_DESTRO",false)
--WindowSetShowing("RoR_SoR_T4WindowRealm3VP_DESTRO",false)

WindowSetShowing("RoR_SoR_T4WindowRealm1ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2ZONE_TIER",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3ZONE_TIER",false)

WindowSetFontAlpha("RoR_SoR_T4WindowRealm1ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm2ZONE_NAME",0.4)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm3ZONE_NAME",0.4)

WindowSetFontAlpha("RoR_SoR_T4WindowRealm1ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm2ZONE_TIER",0.4)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm3ZONE_TIER",0.4)


WindowSetFontAlpha("RoR_SoR_T4WindowRealm1ZONE_PARING",0.4)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm2ZONE_PARING",0.4)
WindowSetFontAlpha("RoR_SoR_T4WindowRealm3ZONE_PARING",0.4)


RoR_SoR_T4.Realm1BONumber = {}
RoR_SoR_T4.Realm2BONumber = {}
RoR_SoR_T4.Realm3BONumber = {}

RoR_SoR_T4.IsLocked = {}

RoR_SoR_T4.KeepLord = {}
RoR_SoR_T4.KeepLord[1] = "MurderballOrder"
RoR_SoR_T4.KeepLord[2] = "MurderballDestruction"


RoR_SoR_T4.KeepClaim = {}
RoR_SoR_T4.KeepClaim[3] = {}
RoR_SoR_T4.KeepClaim[3][5] = 0
RoR_SoR_T4.KeepClaim[3][6] = 0
RoR_SoR_T4.KeepClaim[5] = {}
RoR_SoR_T4.KeepClaim[5][7] = 0
RoR_SoR_T4.KeepClaim[5][8] = 0
RoR_SoR_T4.KeepClaim[9] = {}
RoR_SoR_T4.KeepClaim[9][9] = 0
RoR_SoR_T4.KeepClaim[9][10] = 0

RoR_SoR_T4.KeepClaim[103] = {}
RoR_SoR_T4.KeepClaim[103][19] = 0
RoR_SoR_T4.KeepClaim[103][20] = 0
RoR_SoR_T4.KeepClaim[105] = {}
RoR_SoR_T4.KeepClaim[105][17] = 0
RoR_SoR_T4.KeepClaim[105][18] = 0
RoR_SoR_T4.KeepClaim[109] = {}
RoR_SoR_T4.KeepClaim[109][15] = 0
RoR_SoR_T4.KeepClaim[109][16] = 0

RoR_SoR_T4.KeepClaim[203] = {}
RoR_SoR_T4.KeepClaim[203][29] = 0
RoR_SoR_T4.KeepClaim[203][30] = 0
RoR_SoR_T4.KeepClaim[205] = {}
RoR_SoR_T4.KeepClaim[205][27] = 0
RoR_SoR_T4.KeepClaim[205][28] = 0
RoR_SoR_T4.KeepClaim[209] = {}
RoR_SoR_T4.KeepClaim[209][25] = 0
RoR_SoR_T4.KeepClaim[209][26] = 0

RoR_SoR_T4.KeepHP = {}
RoR_SoR_T4.KeepHP[3] = {}
RoR_SoR_T4.KeepHP[3][5] = 100
RoR_SoR_T4.KeepHP[3][6] = 100
RoR_SoR_T4.KeepHP[5] = {}
RoR_SoR_T4.KeepHP[5][7] = 100
RoR_SoR_T4.KeepHP[5][8] = 100
RoR_SoR_T4.KeepHP[9] = {}
RoR_SoR_T4.KeepHP[9][9] = 100
RoR_SoR_T4.KeepHP[9][10] = 100

RoR_SoR_T4.KeepHP[103] = {}
RoR_SoR_T4.KeepHP[103][19] = 100
RoR_SoR_T4.KeepHP[103][20] = 100
RoR_SoR_T4.KeepHP[105] = {}
RoR_SoR_T4.KeepHP[105][17] = 100
RoR_SoR_T4.KeepHP[105][18] = 100
RoR_SoR_T4.KeepHP[109] = {}
RoR_SoR_T4.KeepHP[109][15] = 100
RoR_SoR_T4.KeepHP[109][16] = 100

RoR_SoR_T4.KeepHP[203] = {}
RoR_SoR_T4.KeepHP[203][29] = 100
RoR_SoR_T4.KeepHP[203][30] = 100
RoR_SoR_T4.KeepHP[205] = {}
RoR_SoR_T4.KeepHP[205][27] = 100
RoR_SoR_T4.KeepHP[205][28] = 100
RoR_SoR_T4.KeepHP[209] = {}
RoR_SoR_T4.KeepHP[209][25] = 100
RoR_SoR_T4.KeepHP[209][26] = 100












---------------------------

RoR_SoR_T4.BoIdToNumber = {}
RoR_SoR_T4.BoIdToNumber[637] = 1
RoR_SoR_T4.BoIdToNumber[636] = 2
RoR_SoR_T4.BoIdToNumber[638] = 3
RoR_SoR_T4.BoIdToNumber[639] = 4

-----------------------BO IDS

RoR_SoR_T4.BOID = {}
RoR_SoR_T4.BOID[3] = {}
RoR_SoR_T4.BOID[3][1] = 159
RoR_SoR_T4.BOID[3][2] = 160
RoR_SoR_T4.BOID[3][3] = 161
RoR_SoR_T4.BOID[3][4] = 162

RoR_SoR_T4.BOID[5] = {}
RoR_SoR_T4.BOID[5][1] = 147
RoR_SoR_T4.BOID[5][2] = 150
RoR_SoR_T4.BOID[5][3] = 151
RoR_SoR_T4.BOID[5][4] = 182

RoR_SoR_T4.BOID[9] = {}
RoR_SoR_T4.BOID[9][1] = 153
RoR_SoR_T4.BOID[9][2] = 156
RoR_SoR_T4.BOID[9][3] = 157
RoR_SoR_T4.BOID[9][4] = 158

RoR_SoR_T4.BOID[103] = {}
RoR_SoR_T4.BOID[103][1] = 5076
RoR_SoR_T4.BOID[103][2] = 5077
RoR_SoR_T4.BOID[103][3] = 5078
RoR_SoR_T4.BOID[103][4] = 5079

RoR_SoR_T4.BOID[105] = {}
RoR_SoR_T4.BOID[105][1] = 5080
RoR_SoR_T4.BOID[105][2] = 5081
RoR_SoR_T4.BOID[105][3] = 5083
RoR_SoR_T4.BOID[105][4] = 5084

RoR_SoR_T4.BOID[109] = {}
RoR_SoR_T4.BOID[109][1] = 5085
RoR_SoR_T4.BOID[109][2] = 5086
RoR_SoR_T4.BOID[109][3] = 5087
RoR_SoR_T4.BOID[109][4] = 5088

RoR_SoR_T4.BOID[203] = {}
RoR_SoR_T4.BOID[203][1] = 636
RoR_SoR_T4.BOID[203][2] = 637
RoR_SoR_T4.BOID[203][3] = 638
RoR_SoR_T4.BOID[203][4] = 639

RoR_SoR_T4.BOID[205] = {}
RoR_SoR_T4.BOID[205][1] = 612
RoR_SoR_T4.BOID[205][2] = 613
RoR_SoR_T4.BOID[205][3] = 614
RoR_SoR_T4.BOID[205][4] = 615

RoR_SoR_T4.BOID[209] = {}
RoR_SoR_T4.BOID[209][1] = 632
RoR_SoR_T4.BOID[209][2] = 633
RoR_SoR_T4.BOID[209][3] = 634
RoR_SoR_T4.BOID[209][4] = 635
--:B:B:B:B:B------------
--dorf
RoR_SoR_T4.KEEPID = {}
RoR_SoR_T4.KEEPID[3] = {}
RoR_SoR_T4.KEEPID[3][1] = 9
RoR_SoR_T4.KEEPID[3][2] = 10
RoR_SoR_T4.KEEPID[5] = {}
RoR_SoR_T4.KEEPID[5][1] = 8
RoR_SoR_T4.KEEPID[5][2] = 7
RoR_SoR_T4.KEEPID[9] = {}
RoR_SoR_T4.KEEPID[9][1] = 5
RoR_SoR_T4.KEEPID[9][2] = 6


RoR_SoR_T4.KEEPID[103] = {}
RoR_SoR_T4.KEEPID[103][1] = 19
RoR_SoR_T4.KEEPID[103][2] = 20
RoR_SoR_T4.KEEPID[105] = {}
RoR_SoR_T4.KEEPID[105][1] = 17
RoR_SoR_T4.KEEPID[105][2] = 18
RoR_SoR_T4.KEEPID[109] = {}
RoR_SoR_T4.KEEPID[109][1] = 16
RoR_SoR_T4.KEEPID[109][2] = 15


RoR_SoR_T4.KEEPID[203] = {}
RoR_SoR_T4.KEEPID[203][1] = 29
RoR_SoR_T4.KEEPID[203][2] = 30
RoR_SoR_T4.KEEPID[205] = {}
RoR_SoR_T4.KEEPID[205][1] = 27
RoR_SoR_T4.KEEPID[205][2] = 28
RoR_SoR_T4.KEEPID[209] = {}
RoR_SoR_T4.KEEPID[209][1] = 25
RoR_SoR_T4.KEEPID[209][2] = 26
--------------------------------------------------

RoR_SoR_T4.LockedRealm = {}
RoR_SoR_T4.LockedRealm[3] = 0
RoR_SoR_T4.LockedRealm[103] = 0
RoR_SoR_T4.LockedRealm[203] = 0

RoR_SoR_T4.LockedRealm[5] = 0
RoR_SoR_T4.LockedRealm[105] = 0
RoR_SoR_T4.LockedRealm[205] = 0

RoR_SoR_T4.LockedRealm[9] = 0
RoR_SoR_T4.LockedRealm[109] = 0
RoR_SoR_T4.LockedRealm[209] = 0


RoR_SoR_T4.ActiveTierZone = {}
RoR_SoR_T4.ActiveTierZone[1] = 1
RoR_SoR_T4.ActiveTierZone[2] = 1
RoR_SoR_T4.ActiveTierZone[3] = 1


RoR_SoR_T4.T2Zones = {5,105,205}

T4ComboZone = {}
T4PairedZone = {}
T4ComboZone[8] = 8 
T4ComboZone[2] = 8
T4PairedZone[8] = 2

T4ComboZone[102] = 108 
T4ComboZone[108] = 108
T4PairedZone[108] = 102


T4ComboZone[202] = 208
T4ComboZone[208] = 208
T4PairedZone[208] = 202

T4KeepToNumber = {}
T4KeepToNumber[3] = 1
T4KeepToNumber[4] = 2
T4KeepToNumber[5] = 1
T4KeepToNumber[6] = 2
T4KeepToNumber[13] = 1
T4KeepToNumber[14] = 2
T4KeepToNumber[15] = 2
T4KeepToNumber[16] = 1




T4KeepToNumber[7] = 2
T4KeepToNumber[8] = 1

T4KeepToNumber[9] = 1
T4KeepToNumber[10] = 2

T4KeepToNumber[23] = 1
T4KeepToNumber[24] = 2

T4KeepToNumber[27] = 1 --dw
T4KeepToNumber[28] = 2 --dw

T4KeepToNumber[29] = 1 --cal
T4KeepToNumber[30] = 2 --cal

T4KeepToNumber[25] = 1 --eat
T4KeepToNumber[26] = 2 --eat


T4KeepToNumber[19] = 1
T4KeepToNumber[20] = 2

RoR_SoR_T4.ZoneNumber = {}
RoR_SoR_T4.ZoneNumber[5] = "RoR_SoR_T4WindowRealm1"
RoR_SoR_T4.ZoneNumber[105] = "RoR_SoR_T4WindowRealm2"
RoR_SoR_T4.ZoneNumber[205] = "RoR_SoR_T4WindowRealm3"


RoR_SoR_T4.BONumber = {}

--?
RoR_SoR_T4.BONumber[3] = {}
RoR_SoR_T4.BONumber[3][159] = "RoR_SoR_T4WindowRealm1BO1"
RoR_SoR_T4.BONumber[3][160] = "RoR_SoR_T4WindowRealm1BO2"
RoR_SoR_T4.BONumber[3][161] = "RoR_SoR_T4WindowRealm1BO3"
RoR_SoR_T4.BONumber[3][162] = "RoR_SoR_T4WindowRealm1BO4"

RoR_SoR_T4.BONumber[5] = {}
RoR_SoR_T4.BONumber[5][147] = "RoR_SoR_T4WindowRealm1BO1"
RoR_SoR_T4.BONumber[5][150] = "RoR_SoR_T4WindowRealm1BO2"
RoR_SoR_T4.BONumber[5][151] = "RoR_SoR_T4WindowRealm1BO3"
RoR_SoR_T4.BONumber[5][182] = "RoR_SoR_T4WindowRealm1BO4"


RoR_SoR_T4.BONumber[9] = {}
RoR_SoR_T4.BONumber[9][153] = "RoR_SoR_T4WindowRealm1BO1"
RoR_SoR_T4.BONumber[9][156] = "RoR_SoR_T4WindowRealm1BO2"
RoR_SoR_T4.BONumber[9][157] = "RoR_SoR_T4WindowRealm1BO3"
RoR_SoR_T4.BONumber[9][158] = "RoR_SoR_T4WindowRealm1BO4"

--?
RoR_SoR_T4.BONumber[105] = {}
RoR_SoR_T4.BONumber[105][5080] = "RoR_SoR_T4WindowRealm2BO1"
RoR_SoR_T4.BONumber[105][5081] = "RoR_SoR_T4WindowRealm2BO2"
RoR_SoR_T4.BONumber[105][5083] = "RoR_SoR_T4WindowRealm2BO3"
RoR_SoR_T4.BONumber[105][5084] = "RoR_SoR_T4WindowRealm2BO4"

T4KeepToNumber[17] = 1
T4KeepToNumber[18] = 2


RoR_SoR_T4.BONumber[203] = {}
RoR_SoR_T4.BONumber[203][636] = "RoR_SoR_T4WindowRealm3BO1"
RoR_SoR_T4.BONumber[203][637] = "RoR_SoR_T4WindowRealm3BO2"
RoR_SoR_T4.BONumber[203][638] = "RoR_SoR_T4WindowRealm3BO3"
RoR_SoR_T4.BONumber[203][639] = "RoR_SoR_T4WindowRealm3BO4"

RoR_SoR_T4.BONumber[205] = {}
RoR_SoR_T4.BONumber[205][612] = "RoR_SoR_T4WindowRealm3BO1"
RoR_SoR_T4.BONumber[205][613] = "RoR_SoR_T4WindowRealm3BO2"
RoR_SoR_T4.BONumber[205][614] = "RoR_SoR_T4WindowRealm3BO3"
RoR_SoR_T4.BONumber[205][615] = "RoR_SoR_T4WindowRealm3BO4"

RoR_SoR_T4.BONumber[209] = {}
RoR_SoR_T4.BONumber[209][632] = "RoR_SoR_T4WindowRealm3BO1"
RoR_SoR_T4.BONumber[209][633] = "RoR_SoR_T4WindowRealm3BO2"
RoR_SoR_T4.BONumber[209][634] = "RoR_SoR_T4WindowRealm3BO3"
RoR_SoR_T4.BONumber[209][635] = "RoR_SoR_T4WindowRealm3BO4"


RoR_SoR_T4.BOTimer = {}

RoR_SoR_T4.BOTimer[3] = {}
RoR_SoR_T4.BOTimer[3][159] = 0
RoR_SoR_T4.BOTimer[3][160] = 0
RoR_SoR_T4.BOTimer[3][161] = 0
RoR_SoR_T4.BOTimer[3][162] = 0

RoR_SoR_T4.BOTimer[5] = {}
RoR_SoR_T4.BOTimer[5][147] = 0
RoR_SoR_T4.BOTimer[5][150] = 0
RoR_SoR_T4.BOTimer[5][151] = 0
RoR_SoR_T4.BOTimer[5][182] = 0

RoR_SoR_T4.BOTimer[9] = {}
RoR_SoR_T4.BOTimer[9][153] = 0
RoR_SoR_T4.BOTimer[9][156] = 0
RoR_SoR_T4.BOTimer[9][157] = 0
RoR_SoR_T4.BOTimer[9][158] = 0

RoR_SoR_T4.BOTimer[103] = {}
RoR_SoR_T4.BOTimer[103][5076] = 0
RoR_SoR_T4.BOTimer[103][5077] = 0
RoR_SoR_T4.BOTimer[103][5078] = 0
RoR_SoR_T4.BOTimer[103][5079] = 0


RoR_SoR_T4.BOTimer[105] = {}
RoR_SoR_T4.BOTimer[105][5080] = 0
RoR_SoR_T4.BOTimer[105][5081] = 0
RoR_SoR_T4.BOTimer[105][5083] = 0
RoR_SoR_T4.BOTimer[105][5084] = 0

RoR_SoR_T4.BOTimer[109] = {}
RoR_SoR_T4.BOTimer[109][5085] = 0
RoR_SoR_T4.BOTimer[109][5086] = 0
RoR_SoR_T4.BOTimer[109][5087] = 0
RoR_SoR_T4.BOTimer[109][5088] = 0



RoR_SoR_T4.BOTimer[203] = {}
RoR_SoR_T4.BOTimer[203][636] = 0
RoR_SoR_T4.BOTimer[203][637] = 0
RoR_SoR_T4.BOTimer[203][638] = 0
RoR_SoR_T4.BOTimer[203][639] = 0

RoR_SoR_T4.BOTimer[205] = {}
RoR_SoR_T4.BOTimer[205][612] = 0
RoR_SoR_T4.BOTimer[205][613] = 0
RoR_SoR_T4.BOTimer[205][614] = 0
RoR_SoR_T4.BOTimer[205][615] = 0

RoR_SoR_T4.BOTimer[209] = {}
RoR_SoR_T4.BOTimer[209][632] = 0
RoR_SoR_T4.BOTimer[209][633] = 0
RoR_SoR_T4.BOTimer[209][634] = 0
RoR_SoR_T4.BOTimer[209][635] = 0

--dorf
RoR_SoR_T4.KeepStatus = {}
RoR_SoR_T4.KeepStatus[3] = {}
RoR_SoR_T4.KeepStatus[3][5] = 0
RoR_SoR_T4.KeepStatus[3][6] = 0
RoR_SoR_T4.KeepStatus[5] = {}
RoR_SoR_T4.KeepStatus[5][7] = 0
RoR_SoR_T4.KeepStatus[5][8] = 0
RoR_SoR_T4.KeepStatus[9] = {}
RoR_SoR_T4.KeepStatus[9][9] = 0
RoR_SoR_T4.KeepStatus[9][10] = 0

RoR_SoR_T4.KeepRank = {}
RoR_SoR_T4.KeepRank[3] = {}
RoR_SoR_T4.KeepRank[3][5] = 0
RoR_SoR_T4.KeepRank[3][6] = 0
RoR_SoR_T4.KeepRank[5] = {}
RoR_SoR_T4.KeepRank[5][7] = 0
RoR_SoR_T4.KeepRank[5][8] = 0
RoR_SoR_T4.KeepRank[9] = {}
RoR_SoR_T4.KeepRank[9][9] = 0
RoR_SoR_T4.KeepRank[9][10] = 0

RoR_SoR_T4.KeepMessage = {}
RoR_SoR_T4.KeepMessage[3] = {}
RoR_SoR_T4.KeepMessage[3][5] = 0
RoR_SoR_T4.KeepMessage[3][6] = 0
RoR_SoR_T4.KeepMessage[5] = {}
RoR_SoR_T4.KeepMessage[5][7] = 0
RoR_SoR_T4.KeepMessage[5][8] = 0
RoR_SoR_T4.KeepMessage[9] = {}
RoR_SoR_T4.KeepMessage[9][9] = 0
RoR_SoR_T4.KeepMessage[9][10] = 0

RoR_SoR_T4.KeepOwner = {}
RoR_SoR_T4.KeepOwner[3] = {}
RoR_SoR_T4.KeepOwner[3][5] = 0
RoR_SoR_T4.KeepOwner[3][6] = 0
RoR_SoR_T4.KeepOwner[5] = {}
RoR_SoR_T4.KeepOwner[5][7] = 0
RoR_SoR_T4.KeepOwner[5][8] = 0
RoR_SoR_T4.KeepOwner[9] = {}
RoR_SoR_T4.KeepOwner[9][9] = 0
RoR_SoR_T4.KeepOwner[9][10] = 0



--emp

RoR_SoR_T4.KeepMessage[103] = {}
RoR_SoR_T4.KeepMessage[103][19] = 0
RoR_SoR_T4.KeepMessage[103][20] = 0
RoR_SoR_T4.KeepMessage[105] = {}
RoR_SoR_T4.KeepMessage[105][17] = 0
RoR_SoR_T4.KeepMessage[105][18] = 0
RoR_SoR_T4.KeepMessage[109] = {}
RoR_SoR_T4.KeepMessage[109][15] = 0
RoR_SoR_T4.KeepMessage[109][16] = 0


RoR_SoR_T4.KeepOwner[103] = {}
RoR_SoR_T4.KeepOwner[103][19] = 0
RoR_SoR_T4.KeepOwner[103][20] = 0
RoR_SoR_T4.KeepOwner[105] = {}
RoR_SoR_T4.KeepOwner[105][17] = 0
RoR_SoR_T4.KeepOwner[105][18] = 0
RoR_SoR_T4.KeepOwner[109] = {}
RoR_SoR_T4.KeepOwner[109][15] = 0
RoR_SoR_T4.KeepOwner[109][16] = 0


RoR_SoR_T4.KeepStatus[103] = {}
RoR_SoR_T4.KeepStatus[103][19] = 0
RoR_SoR_T4.KeepStatus[103][20] = 0
RoR_SoR_T4.KeepStatus[105] = {}
RoR_SoR_T4.KeepStatus[105][17] = 0
RoR_SoR_T4.KeepStatus[105][18] = 0
RoR_SoR_T4.KeepStatus[109] = {}
RoR_SoR_T4.KeepStatus[109][15] = 0
RoR_SoR_T4.KeepStatus[109][16] = 0


RoR_SoR_T4.KeepRank[103] = {}
RoR_SoR_T4.KeepRank[103][19] = 0
RoR_SoR_T4.KeepRank[103][20] = 0
RoR_SoR_T4.KeepRank[105] = {}
RoR_SoR_T4.KeepRank[105][17] = 0
RoR_SoR_T4.KeepRank[105][18] = 0
RoR_SoR_T4.KeepRank[109] = {}
RoR_SoR_T4.KeepRank[109][15] = 0
RoR_SoR_T4.KeepRank[109][16] = 0



RoR_SoR_T4.KeepOwner[203] = {}
RoR_SoR_T4.KeepOwner[203][29] = 0
RoR_SoR_T4.KeepOwner[203][30] = 0
RoR_SoR_T4.KeepOwner[205] = {}
RoR_SoR_T4.KeepOwner[205][27] = 0
RoR_SoR_T4.KeepOwner[205][28] = 0
RoR_SoR_T4.KeepOwner[209] = {}
RoR_SoR_T4.KeepOwner[209][25] = 0
RoR_SoR_T4.KeepOwner[209][26] = 0

RoR_SoR_T4.KeepStatus[203] = {}
RoR_SoR_T4.KeepStatus[203][29] = 0
RoR_SoR_T4.KeepStatus[203][30] = 0
RoR_SoR_T4.KeepStatus[205] = {}
RoR_SoR_T4.KeepStatus[205][27] = 0
RoR_SoR_T4.KeepStatus[205][28] = 0
RoR_SoR_T4.KeepStatus[209] = {}
RoR_SoR_T4.KeepStatus[209][25] = 0
RoR_SoR_T4.KeepStatus[209][26] = 0

RoR_SoR_T4.KeepRank[203] = {}
RoR_SoR_T4.KeepRank[203][29] = 0
RoR_SoR_T4.KeepRank[203][30] = 0
RoR_SoR_T4.KeepRank[205] = {}
RoR_SoR_T4.KeepRank[205][27] = 0
RoR_SoR_T4.KeepRank[205][28] = 0
RoR_SoR_T4.KeepRank[209] = {}
RoR_SoR_T4.KeepRank[209][25] = 0
RoR_SoR_T4.KeepRank[209][26] = 0

RoR_SoR_T4.KeepMessage[203] = {}
RoR_SoR_T4.KeepMessage[203][29] = 0
RoR_SoR_T4.KeepMessage[203][30] = 0
RoR_SoR_T4.KeepMessage[205] = {}
RoR_SoR_T4.KeepMessage[205][27] = 0
RoR_SoR_T4.KeepMessage[205][28] = 0
RoR_SoR_T4.KeepMessage[209] = {}
RoR_SoR_T4.KeepMessage[209][25] = 0
RoR_SoR_T4.KeepMessage[209][26] = 0
--checks and sets locks for locked zones at start


	for i=1,3 do
		WindowSetTintColor( "RoR_SoR_T4WindowRealm"..i, 80,80,80 )

		end
		


WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_2_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_2_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_1_KEEPRANK",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_2_KEEPRANK",false)

WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_2_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_1_LORD_ICON",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_2_LORD_ICON",false)

WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T4WindowRealm1_KEEP_WIN_2_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_1_KEEPFLAG",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T4WindowRealm2_KEEP_WIN_2_KEEPFLAG",false)

WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_1_KEEPFLAG",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing("RoR_SoR_T4WindowRealm3_KEEP_WIN_2_KEEPFLAG",false)

RoR_SoR_T4.IsLocked[3] = true
RoR_SoR_T4.IsLocked[103] = true
RoR_SoR_T4.IsLocked[203] = true

RoR_SoR_T4.IsLocked[5] = true
RoR_SoR_T4.IsLocked[105] = true
RoR_SoR_T4.IsLocked[205] = true

RoR_SoR_T4.IsLocked[9] = true
RoR_SoR_T4.IsLocked[109] = true
RoR_SoR_T4.IsLocked[209] = true

local VPZone1 = GetCampaignZoneData(5 )
local VPZone2 = GetCampaignZoneData(105 )
local VPZone3 = GetCampaignZoneData(205 ) 

RoR_SoR_T4.BoOwner = {}
RoR_SoR_T4.BoOwner[3] = {}
RoR_SoR_T4.BoOwner[103] = {}
RoR_SoR_T4.BoOwner[203] = {}

RoR_SoR_T4.BoOwner[5] = {}
RoR_SoR_T4.BoOwner[105] = {}
RoR_SoR_T4.BoOwner[205] = {}

RoR_SoR_T4.BoOwner[9] = {}
RoR_SoR_T4.BoOwner[109] = {}
RoR_SoR_T4.BoOwner[209] = {}


RoR_SoR_T4.BoState = {}
RoR_SoR_T4.BoState[3] = {}
RoR_SoR_T4.BoState[103] = {}
RoR_SoR_T4.BoState[203] = {}

RoR_SoR_T4.BoState[5] = {}
RoR_SoR_T4.BoState[105] = {}
RoR_SoR_T4.BoState[205] = {}

RoR_SoR_T4.BoState[9] = {}
RoR_SoR_T4.BoState[109] = {}
RoR_SoR_T4.BoState[209] = {}

LabelSetText("RoR_SoR_T4WindowRealm1ZONE_PARING",towstring(GetZoneName(5)))

LabelSetText("RoR_SoR_T4WindowRealm2ZONE_PARING",towstring(GetZoneName(105)))

LabelSetText("RoR_SoR_T4WindowRealm3ZONE_PARING",towstring(GetZoneName(205)))



--[[
	
local Width_Zone1_Order = ( ( VPZone1.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T4WindowRealm1VP_ORDER", Width_Zone1_Order+2, 4 )
local Width_Zone1_Destro = ( ( VPZone1.controlPoints[2]/ 100 ) * 142 )
WindowSetDimensions( "RoR_SoR_T4WindowRealm1VP_DESTRO", Width_Zone1_Destro+2, 4 )

local Width_Zone2_Order = ( ( VPZone2.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T4WindowRealm2VP_ORDER", Width_Zone2_Order+2, 4 )
local Width_Zone2_Destro = ( ( VPZone2.controlPoints[2]/ 100 ) * 142 )
WindowSetDimensions( "RoR_SoR_T4WindowRealm2VP_DESTRO", Width_Zone2_Destro+2, 4 )	

local Width_Zone3_Order = ( ( VPZone3.controlPoints[1] / 100 ) * 147 )
WindowSetDimensions( "RoR_SoR_T4WindowRealm3VP_ORDER", Width_Zone3_Order+2, 4 )
local Width_Zone3_Destro = ( ( VPZone3.controlPoints[2]/ 100 ) * 142 )
WindowSetDimensions( "RoR_SoR_T4WindowRealm3VP_DESTRO", Width_Zone3_Destro+2, 4 )
--]]

RoR_SoR_T4.T2Zones[1] = 5	
RoR_SoR_T4.T2Zones[2] = 105
RoR_SoR_T4.T2Zones[3] = 205



if VPZone1.controllingRealm == 0 then


DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO4", "SoR_Neutral-Locked",31,31 )


RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[1]] = 0

RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]] = 0



else

DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1LOCK" ,RoR_SoR_T4.GetFlag(VPZone1.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO1", RoR_SoR_T4.GetFlag(VPZone1.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO2", RoR_SoR_T4.GetFlag(VPZone1.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO3", RoR_SoR_T4.GetFlag(VPZone1.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm1BO4", RoR_SoR_T4.GetFlag(VPZone1.controllingRealm ,9),31,31 )

DynamicImageSetTexture("RoR_SoR_T4WindowRealm1_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone1.controllingRealm ,6)),42,42 )
DynamicImageSetTexture("RoR_SoR_T4WindowRealm1_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone1.controllingRealm ,6)),42,42 )

RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[1]] = VPZone1.controllingRealm

RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]] = VPZone1.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]] = VPZone1.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]] = VPZone1.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]] = VPZone1.controllingRealm

RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]] = VPZone1.controllingRealm
RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]] = VPZone1.controllingRealm


end


RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]] = 9



if VPZone2.controllingRealm == 0 then
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO4", "SoR_Neutral-Locked",31,31 )

RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]] = 0

RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[2]] = 0

else

DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2LOCK", RoR_SoR_T4.GetFlag(VPZone2.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2LOCK" ,RoR_SoR_T4.GetFlag(VPZone2.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO1", RoR_SoR_T4.GetFlag(VPZone2.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO2", RoR_SoR_T4.GetFlag(VPZone2.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO3", RoR_SoR_T4.GetFlag(VPZone2.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm2BO4", RoR_SoR_T4.GetFlag(VPZone2.controllingRealm ,9),31,31 )
DynamicImageSetTexture("RoR_SoR_T4WindowRealm2_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone2.controllingRealm ,6)),42,42 )
DynamicImageSetTexture("RoR_SoR_T4WindowRealm2_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone2.controllingRealm ,6)),42,42 )

RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[2]] = VPZone2.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]] = VPZone2.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]] = VPZone2.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]] = VPZone2.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]] = VPZone2.controllingRealm

RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]] = VPZone1.controllingRealm
RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]] = VPZone1.controllingRealm
end

RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]] = 9


if VPZone3.controllingRealm == 0 then
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO1", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO2", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO3", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO4", "SoR_Neutral-Locked",31,31 )

RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[2]] =0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]] = 0
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]] = 0

else

DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3LOCK", RoR_SoR_T4.GetFlag(VPZone3.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3LOCK" ,RoR_SoR_T4.GetFlag(VPZone3.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO1", RoR_SoR_T4.GetFlag(VPZone3.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO2", RoR_SoR_T4.GetFlag(VPZone3.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO3", RoR_SoR_T4.GetFlag(VPZone3.controllingRealm ,9),31,31 )
DynamicImageSetTexture( "RoR_SoR_T4WindowRealm3BO4", RoR_SoR_T4.GetFlag(VPZone3.controllingRealm ,9),31,31 )
DynamicImageSetTexture("RoR_SoR_T4WindowRealm3_KEEP_WIN_1_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm ,6)),42,42 )
DynamicImageSetTexture("RoR_SoR_T4WindowRealm3_KEEP_WIN_2_KEEPICON", tostring(RoR_SoR.GetKeepTexture(VPZone3.controllingRealm ,6)),42,42 )

RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[3]] = VPZone3.controllingRealm

RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]] = VPZone3.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]] = VPZone3.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]] = VPZone3.controllingRealm
RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]] = VPZone3.controllingRealm

RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]] = VPZone3.controllingRealm
RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]] = VPZone3.controllingRealm
end

RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]] = 9
RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]] = 9



end
function RoR_SoR_T4.OnChatLogUpdated(updateType, filterType) --premade chat checker for future chat updates
	if( updateType == SystemData.TextLogUpdate.ADDED ) then 
		if filterType == SystemData.ChatLogFilters.CHANNEL_9 then	
			local _, filterId, text = TextLogGetEntry( "Chat", TextLogGetNumEntries("Chat") - 1 ) 
			--	if text:find(L"!update") then 
				--PlaySound(GameData.Sound.QUEST_ABANDONED)
			--	RoR_SoR_T4.ZoneUpdate()
			RoR_SoR_T4.BO(text)
			--end		
		end
	end
end

function RoR_SoR_T4.BO(text)


	--d(linkData)
local baba = towstring(text)




--===============================TIER 3!=============================


if baba:match( L"SoR_T4_BO:([^%.]+).") then	

--Checking Warbuilder version of the hyperlink and alert if outdated
--SoR_T4_BO:203:636:2:9:0:637:2:9:0:638:2:9:0:639:2:9:0:50:1:[-1]:1		21
local Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY,GUILDS,ACTIVE_ZONE= baba:match( L"SoR_T4_BO:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(.+):(%d+)")
ProxyActiveZoneT3 = tonumber(ACTIVE_ZONE)
if RoR_SoR_T4.Debug == true then 
d(L"==========T4 ZONE UPDATE===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Active Zone: "..towstring(ACTIVE_ZONE))
d(L"VPS: Order:"..towstring(tonumber(VP))..L" , Destro:"..towstring(100-(tonumber(VP))))
d(L"Supply: "..towstring(SUPPLY))
d(L"BO1 ID: "..towstring(BO1_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO1_ID)))..L") Owner: "..towstring(BO1_OWNER)..L" , State: "..towstring(BO1_STATE)..L" , Timer: "..towstring(BO1_TIMER))
d(L"BO2 ID: "..towstring(BO2_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO2_ID)))..L") Owner: "..towstring(BO2_OWNER)..L" , State: "..towstring(BO2_STATE)..L" , Timer: "..towstring(BO2_TIMER))
d(L"BO3 ID: "..towstring(BO3_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO3_ID)))..L") Owner: "..towstring(BO3_OWNER)..L" , State: "..towstring(BO3_STATE)..L" , Timer: "..towstring(BO3_TIMER))
d(L"BO4 ID: "..towstring(BO4_ID)..L" ("..towstring(GetObjectiveName(tonumber(BO4_ID)))..L") Owner: "..towstring(BO4_OWNER)..L" , State: "..towstring(BO4_STATE)..L" , Timer: "..towstring(BO4_TIMER))
d(L"===============================")
end

if tonumber(Zone) == 3 or tonumber(Zone) == 5 or tonumber(Zone) == 9 then
RoR_SoR_T4.ActiveTierZone[1] = tonumber(ACTIVE_ZONE)
elseif tonumber(Zone) == 103 or tonumber(Zone) == 105 or tonumber(Zone) == 109 then
RoR_SoR_T4.ActiveTierZone[2] = tonumber(ACTIVE_ZONE)
elseif tonumber(Zone) == 203 or tonumber(Zone) == 205 or tonumber(Zone) == 209 then
RoR_SoR_T4.ActiveTierZone[3] = tonumber(ACTIVE_ZONE)
end


if RoR_SoR_T4.SetZoneIDs(Zone,ACTIVE_ZONE) == true then 
RoR_SoR_T4.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)
--PlaySound(GameData.Sound.QUEST_ABANDONED)
else
return
end


elseif baba:match( L"SoR_T4_BO_Update:([^%.]+).") then	
local Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER,ACTIVE_ZONE= baba:match( L"SoR_T4_BO_Update:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
local TempActive = ACTIVE_ZONE or nil
if TempActive == nil then  TempActive = ProxyActiveZoneT3 end

	if RoR_SoR_T4.SetZoneIDs(Zone,TempActive) == true then 
	RoR_SoR_T4.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)
	else
	return
	end


if RoR_SoR_T4.Debug == true then 
d(L"=========!SINGLE BO UPDATE!============")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Active Zone: "..towstring(ACTIVE_ZONE))
d(L"BO ID: "..towstring(BO_ID)..L" , BO Owner: "..towstring(BO_OWNER)..L" , State: "..towstring(BO_STATE)..L" , Timer: "..towstring(BO_TIMER))
d(L"===============================")
end



elseif baba:match( L"SoR_T4_Keep:([^%.]+).") then	
local Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2,ACTIVE_ZONE= baba:match( L"SoR_T4_Keep:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(.+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(.+):(%d+)")
if RoR_SoR_T4.Debug == true then 
d(L"==========KEEPS UPDATE===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Active Zone: "..towstring(ACTIVE_ZONE))
d(L"Keep1: "..towstring(KEEP1_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP1_ID)))..L"), Owner: "..towstring(KEEP1_OWNER)..L" , Rank: "..towstring(KEEP1_RANK)..L" , Status: "..towstring(KEEP1_STATUS)..L" , Message: "..towstring(KEEP1_MESSAGE)..L" |"..towstring(RoR_SoR.GetKeepIcon(KEEP1_OWNER,KEEP1_STATUS))..L" "..towstring(RoR_SoR_T4.GetKeepHeath(KEEP1_OWNER,KEEP1_STATUS,KEEP1_MESSAGE))..L" , Claimed: "..towstring(CLAIM_1)..L" , Outer: "..towstring(OUTER_1)..L" , Inner: "..towstring(INNER_1)..L" , Lord: "..towstring(LORD_1))
d(L"Keep2: "..towstring(KEEP2_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP2_ID)))..L"), Owner: "..towstring(KEEP2_OWNER)..L" , Rank: "..towstring(KEEP2_RANK)..L" , Status: "..towstring(KEEP2_STATUS)..L" , Message: "..towstring(KEEP2_MESSAGE)..L" |"..towstring(RoR_SoR.GetKeepIcon(KEEP2_OWNER,KEEP2_STATUS))..L" "..towstring(RoR_SoR_T4.GetKeepHeath(KEEP2_OWNER,KEEP2_STATUS,KEEP2_MESSAGE))..L" , Claimed: "..towstring(CLAIM_2)..L" , Outer: "..towstring(OUTER_2)..L" , Inner: "..towstring(INNER_2)..L" , Lord: "..towstring(LORD_2))
d(L"===============================")
end

if RoR_SoR_T4.SetZoneIDs(Zone,ACTIVE_ZONE) == true then
RoR_SoR_T4.Update_ALL_KEEPS(Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2,ACTIVE_ZONE)
else
return
end


elseif baba:match( L"SoR_T4_Keep_Update:([^%.]+).") then
local Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE,ACTIVE_ZONE= baba:match( L"SoR_T4_Keep_Update:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
if RoR_SoR_T4.Debug == true then 
d(L"==========!Single KEEP UPDATE!===========")
d(L"Text: "..towstring(text))
d(L"Zone: "..towstring(Zone)..L" ("..towstring(GetZoneName(tonumber(Zone)))..L")")
d(L"Active Zone: "..towstring(ACTIVE_ZONE))
d(L"Keep: "..towstring(KEEP_ID)..L" ("..towstring(GetKeepName(tonumber(KEEP_ID)))..L"), Owner: "..towstring(KEEP_OWNER)..L" , Rank: "..towstring(KEEP_RANK)..L" , Status: "..towstring(KEEP_STATUS)..L" , Message: "..towstring(KEEP_MESSAGE))
d(L"===============================")
end
	
if RoR_SoR_T4.SetZoneIDs(Zone,ACTIVE_ZONE) == true then
RoR_SoR_T4.Update_ONE_KEEP(Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE)
else
return
end




end





end

function RoR_SoR_T4.Update_ONE_KEEP(Zone,KEEP_ID,KEEP_OWNER,KEEP_RANK,KEEP_STATUS,KEEP_MESSAGE)
local Test_Zone = tonumber(Zone)
local Test_KEEP_ID = tonumber(KEEP_ID)
local Test_KEEP_OWNER = tonumber(KEEP_OWNER)
local Test_KEEP_RANK = tonumber(KEEP_RANK)
local Test_KEEP_STATUS = tonumber(KEEP_STATUS)
local Test_KEEP_MESSAGE = tonumber(KEEP_MESSAGE)

RoR_SoR_T4.KeepOwner[Test_Zone][KEEP_ID] = Test_KEEP_OWNER
RoR_SoR_T4.KeepStatus[Test_Zone][KEEP_ID] = Test_KEEP_STATUS
RoR_SoR_T4.KeepMessage[Test_Zone][KEEP_ID] = Test_KEEP_MESSAGE
RoR_SoR_T4.KeepRank[Test_Zone][KEEP_ID] = Test_KEEP_RANK

-- Keep image updates

--local T2SOLOKEEP = tostring(RoR_SoR_T4.GetKeepOwner(Test_KEEP_OWNER,Test_KEEP_STATUS))
--DynamicImageSetTextureSlice( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPICON", T2SOLOKEEP )

local T2SOLOKEEP = tostring(RoR_SoR.GetKeepTexture(Test_KEEP_OWNER,Test_KEEP_STATUS))
DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPICON", T2SOLOKEEP,42,42 )

DynamicImageSetTextureSlice( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_LORD_ICON", RoR_SoR_T4.KeepLord[Test_KEEP_OWNER] )


--Keep Rank
if Test_KEEP_RANK > 0 then
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPRANK",true)
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPRANK", "KeepDifficulty-"..Test_KEEP_RANK.."-star" )
else
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPRANK",false)
end

 -- Keep health label updates
local  T2SOLOKEEPHEALTH = RoR_SoR_T4.GetKeepHeath(Test_KEEP_OWNER,Test_KEEP_STATUS,Test_KEEP_MESSAGE,RoR_SoR_T4.KeepHP[Test_Zone][KEEP_ID])
 
 --LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_HEALTH",towstring(T2SOLOKEEPHEALTH))
--WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_HEALTH",1)

 -- Door hide
 if Test_KEEP_MESSAGE >= 4 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",false)
elseif Test_KEEP_MESSAGE == 8 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",false)
elseif Test_KEEP_MESSAGE >= 9 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_LORD_ICON",true)
else
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP_ID].."_KEEPDOOR2",true)
end

return
end



function RoR_SoR_T4.Update_ALL_KEEPS(Zone,KEEP1_ID,KEEP1_OWNER,KEEP1_RANK,KEEP1_STATUS,KEEP1_MESSAGE,OUTER_1,INNER_1,LORD_1,CLAIM_1,KEEP2_ID,KEEP2_OWNER,KEEP2_RANK,KEEP2_STATUS,KEEP2_MESSAGE,OUTER_2,INNER_2,LORD_2,CLAIM_2,ACTIVE_ZONE)
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

RoR_SoR_T4.KeepStatus[Test_Zone][Test_KEEP1_ID] = Test_KEEP1_STATUS
RoR_SoR_T4.KeepStatus[Test_Zone][Test_KEEP2_ID] = Test_KEEP2_STATUS
RoR_SoR_T4.KeepOwner[Test_Zone][Test_KEEP1_ID] = Test_KEEP1_OWNER
RoR_SoR_T4.KeepOwner[Test_Zone][Test_KEEP2_ID] = Test_KEEP2_OWNER

RoR_SoR_T4.KeepRank[Test_Zone][Test_KEEP1_ID] = Test_KEEP1_RANK
RoR_SoR_T4.KeepRank[Test_Zone][Test_KEEP2_ID] = Test_KEEP2_RANK

RoR_SoR_T4.KeepMessage[Test_Zone][Test_KEEP1_ID] = Test_KEEP1_MESSAGE
RoR_SoR_T4.KeepMessage[Test_Zone][Test_KEEP2_ID] = Test_KEEP2_MESSAGE




-- Keep image updates
RoR_SoR_T4.T2Keeps = {}

if Test_Zone == 109 or Test_Zone == 5 then
RoR_SoR_T4.T2Keeps[2] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP1_OWNER,KEEP1_STATUS))
RoR_SoR_T4.T2Keeps[1] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP2_OWNER,KEEP2_STATUS))
else

RoR_SoR_T4.T2Keeps[1] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP1_OWNER,KEEP1_STATUS))
RoR_SoR_T4.T2Keeps[2] = tostring(RoR_SoR.GetKeepTexture(Test_KEEP2_OWNER,KEEP2_STATUS))
end


DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPICON", RoR_SoR_T4.T2Keeps[1],42,42 )
DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPICON", RoR_SoR_T4.T2Keeps[2],42,42 )

--Keep Rank
if Test_KEEP1_RANK > 0 then
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPRANK",true)
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPRANK", "KeepDifficulty-"..Test_KEEP1_RANK.."-star" )

else
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPRANK",false)
end

if Test_KEEP2_RANK > 0 then
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPRANK",true)
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPRANK", "KeepDifficulty-"..Test_KEEP2_RANK.."-star" )
else
DynamicImageSetTextureSlice(  tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPRANK", "KeepDifficulty-1-star" )
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPRANK",false)
end


 -- Keep health label updates
--DynamicImageSetTextureSlice(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON", RoR_SoR_T4.KeepLord[RoR_SoR_T4.KeepOwner[Test_Zone][Test_KEEP1_ID]] )
--DynamicImageSetTextureSlice(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_LORD_ICON", RoR_SoR_T4.KeepLord[RoR_SoR_T4.KeepOwner[Test_Zone][Test_KEEP2_ID]] )



DynamicImageSetTextureSlice( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON", RoR_SoR_T4.KeepLord[RoR_SoR_T4.KeepOwner[Test_Zone][Test_KEEP1_ID]] )
DynamicImageSetTextureSlice( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON", RoR_SoR_T4.KeepLord[RoR_SoR_T4.KeepOwner[Test_Zone][Test_KEEP2_ID]] )
 -- Door hide
 
 --[[
 
if Test_KEEP1_MESSAGE == 0 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false) 
 elseif Test_KEEP1_MESSAGE == 1 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false)  
 elseif Test_KEEP1_MESSAGE == 2 then
  WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false) 
 elseif Test_KEEP1_MESSAGE == 3 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false)   
elseif Test_KEEP1_MESSAGE == 4 and Test_KEEP1_STATUS <= 2 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",true)
 elseif Test_KEEP1_MESSAGE == 4 and Test_KEEP1_STATUS >= 3 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE == 5 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE == 6 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false) 
elseif Test_KEEP1_MESSAGE == 7 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false) 
elseif Test_KEEP1_MESSAGE == 8 and Test_KEEP1_STATUS <= 3 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE == 8 and Test_KEEP1_STATUS >= 4 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
elseif Test_KEEP1_MESSAGE ==9 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==10 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==11 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",false)
elseif Test_KEEP1_MESSAGE ==12 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",false)

else
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false)
end

if Test_KEEP1_STATUS == 5 or Test_KEEP1_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
end


if Test_KEEP2_MESSAGE == 0 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false) 
 elseif Test_KEEP2_MESSAGE == 1 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false)  
 elseif Test_KEEP2_MESSAGE == 2 then
  WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false) 
 elseif Test_KEEP2_MESSAGE == 3 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false)   
elseif Test_KEEP2_MESSAGE == 4 and Test_KEEP1_STATUS <= 2 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",true)
 elseif Test_KEEP2_MESSAGE == 4 and Test_KEEP1_STATUS >= 3 then
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE == 5 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE == 6 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false) 
elseif Test_KEEP2_MESSAGE == 7 then 
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
 WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false) 
elseif Test_KEEP2_MESSAGE == 8 and Test_KEEP1_STATUS <= 3 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE == 8 and Test_KEEP1_STATUS >= 4 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
elseif Test_KEEP2_MESSAGE ==9 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==10 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==11 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",false)
elseif Test_KEEP2_MESSAGE ==12 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",false)

else
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false)
end

if Test_KEEP2_STATUS == 5 or Test_KEEP2_STATUS == 6 then
WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false)
end
--]]


		if KEEP_OUTER_1 > 0 then 
		 RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP1_ID] = KEEP_OUTER_1
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",true)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false) 
			
		elseif (KEEP_OUTER_1 == 0) and (KEEP_INNER_1 > 0) then 
			 RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP1_ID] = KEEP_INNER_1
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",true)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",false) 
						 
		else
			 RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP1_ID] = KEEP_LORD_1
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR",false)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_KEEPDOOR2",false)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_LORD_ICON",true) 
						 
		end

		if KEEP_OUTER_2 > 0 then 
		 RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP2_ID] = KEEP_OUTER_2
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",true)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false) 
					 
		elseif (KEEP_OUTER_2 == 0) and (KEEP_INNER_2 > 0) then 
			 RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP2_ID] = KEEP_INNER_2
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",true)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false) 
						 
		else
			 RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP2_ID] = KEEP_LORD_2
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR",false)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_KEEPDOOR2",false)
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",true) 
						 
		end
		
		if Test_KEEP1_STATUS == 5 or Test_KEEP1_STATUS == 6 then
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_LORD_ICON",false)
		end
		if Test_KEEP2_STATUS == 5 or Test_KEEP2_STATUS == 6 then
			WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_LORD_ICON",false)
		end		
		
		 RoR_SoR_T4.T2KeepHeath = {}
 
 RoR_SoR_T4.T2KeepHeath[1] = RoR_SoR.GetKeepHeath(Test_KEEP1_OWNER,Test_KEEP1_STATUS,Test_KEEP1_MESSAGE,RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP1_ID])
 RoR_SoR_T4.T2KeepHeath[2] = RoR_SoR.GetKeepHeath(Test_KEEP2_OWNER,Test_KEEP2_STATUS,Test_KEEP2_MESSAGE,RoR_SoR_T4.KeepHP[Test_Zone][Test_KEEP2_ID])
 
 
 
 LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP1_ID].."_HEALTH",towstring(RoR_SoR_T4.T2KeepHeath[1]))
 --WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",1)
 
 LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_"..T4KeepToNumber[Test_KEEP2_ID].."_HEALTH",towstring(RoR_SoR_T4.T2KeepHeath[2]))

 -- WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",1)
	

	
return
end


function RoR_SoR_T4.GetKeepHeath(KEEP_OWNER,KEEP_STATE,KEEP_MESSAGE)
local Owner = tonumber(KEEP_OWNER)
local State = tonumber(KEEP_STATE)
local Message = tonumber(KEEP_MESSAGE)
if State == 1 then 
return L""
elseif State == 2 then
	if Message == 0 then return L"100%" 	
	elseif Message == 1 then return L"75%" 
	elseif Message == 2 then return L"50%" 
	elseif Message == 3 then return L"20%" 
	elseif Message == 4 then return L"0%" 
	else
	return L"0%" --outer
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
   	if Message == 9 then return L" 100%"
	elseif Message == 10 then return L"  50%" 
	elseif Message == 11 then return L"  20%" 
	elseif Message == 12 then return L"  0%" 
	else 
	return L"   0%"	
	end
elseif State == 5 then
	return RoR_SoR.TextTaken	
elseif State == 6 then
	return RoR_SoR.TextLock
end
return L""
end


function RoR_SoR_T4.GetKeepOwner(KEEP_OWNER,KEEP_STATE)
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




function RoR_SoR_T4.Update_ALL_BO(Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER,VP,SUPPLY)

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

local Test_VP = tonumber(VP)
local Test_SUPPLY = tonumber(SUPPLY)

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


  RoR_SoR_T4.BoOwner[Test_Zone][Test_BO1_ID] = Test_BO1_Owner
RoR_SoR_T4.BoOwner[Test_Zone][Test_BO2_ID] = Test_BO2_Owner
RoR_SoR_T4.BoOwner[Test_Zone][Test_BO3_ID] = Test_BO3_Owner
RoR_SoR_T4.BoOwner[Test_Zone][Test_BO4_ID] = Test_BO4_Owner

RoR_SoR_T4.BoState[Test_Zone][Test_BO1_ID] = Test_BO1_State
RoR_SoR_T4.BoState[Test_Zone][Test_BO2_ID] = Test_BO2_State
RoR_SoR_T4.BoState[Test_Zone][Test_BO3_ID] = Test_BO3_State
RoR_SoR_T4.BoState[Test_Zone][Test_BO4_ID] = Test_BO4_State
 
 
RoR_SoR_T4.Update_ONE_BO(Test_Zone,BO1_ID,BO1_OWNER,BO1_STATE,BO1_TIMER)
RoR_SoR_T4.Update_ONE_BO(Test_Zone,BO2_ID,BO2_OWNER,BO2_STATE,BO2_TIMER)
RoR_SoR_T4.Update_ONE_BO(Test_Zone,BO3_ID,BO3_OWNER,BO3_STATE,BO3_TIMER)
RoR_SoR_T4.Update_ONE_BO(Test_Zone,BO4_ID,BO4_OWNER,BO4_STATE,BO4_TIMER)

--RoR_SoR_T4.BOTimer[T3ComboZone[208]][5063] = Test_BO1_Timer
--RoR_SoR_T4.BOTimer[T3ComboZone[208]][5064] = Test_BO2_Timer
--RoR_SoR_T4.BOTimer[T3ComboZone[208]][5065] = Test_BO3_Timer
--RoR_SoR_T4.BOTimer[T3ComboZone[208]][5066] = Test_BO4_Timer
--RoR_SoR_T4.BOTimer[T3ComboZone[Test_Zone]][Test_BO1_ID] = Test_BO1_Timer
--RoR_SoR_T4.BOTimer[T3ComboZone[Test_Zone]][Test_BO2_ID] = Test_BO2_Timer
--RoR_SoR_T4.BOTimer[T3ComboZone[Test_Zone]][Test_BO3_ID] = Test_BO3_Timer
--RoR_SoR_T4.BOTimer[T3ComboZone[Test_Zone]][Test_BO4_ID] = Test_BO4_Timer

--RoR_SoR_T4.BOTimer[Test_Zone][Test_BO1_ID] =Test3_BO1_Timer
--RoR_SoR_T4.BOTimer[Test_Zone][Test_BO2_ID] =Test3_BO2_Timer
--RoR_SoR_T4.BOTimer[Test_Zone][Test_BO3_ID] =Test3_BO3_Timer
--RoR_SoR_T4.BOTimer[Test_Zone][Test_BO4_ID] =Test3_BO4_Timer


--d(L"Timers: "..towstring(Test_Zone)..L" , "..towstring(Test3_BO1_ID))
--d(L"Timers: "..towstring(RoR_SoR_T4.BOTimer[Test_Zone][Test3_BO1_ID]))


RoR_SoR_T4.Flag = {}

RoR_SoR_T4.Flag[1] = tostring(RoR_SoR_T4.GetFlag(Test_BO1_Owner,Test_BO1_State))
RoR_SoR_T4.Flag[2] = tostring(RoR_SoR_T4.GetFlag(Test_BO2_Owner,Test_BO2_State))
RoR_SoR_T4.Flag[3] = tostring(RoR_SoR_T4.GetFlag(Test_BO3_Owner,Test_BO3_State))
RoR_SoR_T4.Flag[4] = tostring(RoR_SoR_T4.GetFlag(Test_BO4_Owner,Test_BO4_State))

if Test_SUPPLY == 1 then

WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPSUPPLY",true)
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPFLAG",true)

WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPSUPPLY",true)
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPFLAG",true)

else
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPFLAG",false)
end


-- VP update	
--local Width_Zone_Order = ( ( Test_VP / 100 ) * 147 )
--WindowSetDimensions( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_ORDER", Width_Zone_Order+2, 4 )
--local Width_Zone_Destro = ( ( (100-Test_VP) / 100 ) * 142 )
--WindowSetDimensions( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_DESTRO", Width_Zone_Destro+2, 4 )

LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."ZONE_PARING",towstring(GetZoneName(Test_Zone)))

--WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_ORDER",true)

--WindowSetShowing(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_DESTRO",true)



--check if zone lock and do stuff:
if Test_BO1_State == 9 then
RoR_SoR_T4.IsLocked[Test_Zone] = true
if Test_BO1_Owner == 0 then DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCK",  "SoR_Neutral-Locked",31,31 ) 
 RoR_SoR_T4.LockedRealm[Test_Zone] = 0 
else
--DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCK", "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCK", RoR_SoR_T4.Flag[1],31,31 )
end

 RoR_SoR_T4.LockedRealm[Test_Zone] = Test_BO1_Owner

		WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCK",true)
		
		WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCKED_TEXT",true)
		
		WindowSetTintColor( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]), 80,80,80 )
--				LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."PERCENT_ORDER",L"")
--LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."PERCENT_DESTRO",L"")
WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."ZONE_NAME",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."ZONE_TIER",0.4)
WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."ZONE_PARING",0.4)

--		WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_ORDERBAR",false)
--		WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_DESTROBAR",false)

WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",0.4)
 WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",0.4) 

WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_KEEPFLAG",false)

WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPSUPPLY",false)
WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_KEEPFLAG",false)
		
else
if Test_BO1_State ~= 8  then DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCK", "SoR_Neutral-Locked",31,31 )   end
RoR_SoR_T4.IsLocked[Test_Zone] = false
		WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCK",false)
		WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."LOCKED_TEXT",false)
	WindowSetTintColor( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]), 255,255,255 )
--	WindowSetTintColor( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone].."VP_ORDERBAR"), 50,50,255 )
--	WindowSetTintColor( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone].."VP_DESTROBAR"), 200,0,0 )

	
--			WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_ORDERBAR",true)
--		WindowSetShowing( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."VP_DESTROBAR",true)
	
--LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."PERCENT_ORDER",towstring(Test_VP)..L"%")
--LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."PERCENT_DESTRO",towstring(100-Test_VP)..L"%")
	WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."ZONE_NAME",1)
	WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."ZONE_TIER",1)	
	WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."ZONE_PARING",1)		
 WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_1_HEALTH",1)
 WindowSetFontAlpha(tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."_KEEP_WIN_2_HEALTH",1) 
	
	
end
--Sets the Tier name
--local DataZone = GetCampaignZoneData(Test_Zone)
--LabelSetText(tostring(RoR_SoR_T4.ZoneNumber[T3ComboZone[Test_Zone]]).."ZONE_TIER",L"T"..towstring(DataZone.tierId))




for i=1,4 do
 
if  (Test_State[i]  == 8 or Test_State[i]  == 9) and  Test_Owner[i] == 0 then
DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."BO"..i, "SoR_Neutral-Locked",31,31 )
else
--DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."BO"..i, "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone]).."BO"..i, RoR_SoR_T4.Flag[i] ,31,31)
end

end



return
end

function RoR_SoR_T4.Update_ONE_BO(Zone,BO_ID,BO_OWNER,BO_STATE,BO_TIMER)


local Test_Zone2 = tonumber(Zone)
local Test_BO_ID2 = tonumber(BO_ID)
local Test_BO_Owner2 = tonumber(BO_OWNER)
local Test_BO_State2 = tonumber(BO_STATE)
local Test_BO_Timer2 = tonumber(BO_TIMER)
RoR_SoR_T4.Flag = tostring(RoR_SoR_T4.GetFlag(Test_BO_Owner2,Test_BO_State2))


--if Test_BO_Owner2 == 0 and (Test_BO_State2 == 9 or Test_BO_State2 == 8) then
--DynamicImageSetTexture( tostring(RoR_SoR_T4.BONumber[Test_Zone2][Test_BO_ID2]), "SoR_Neutral-Locked",31,31 )
--else
--DynamicImageSetTexture( tostring(RoR_SoR_T4.BONumber[Test_Zone2][Test_BO_ID2]), "SoR_Neutral-Locked",31,31 )
DynamicImageSetTexture( tostring(RoR_SoR_T4.BONumber[Test_Zone2][Test_BO_ID2]), tostring(RoR_SoR_T4.Flag),31,31 )
--end

RoR_SoR_T4.BoOwner[Test_Zone2][Test_BO_ID2] = Test_BO_Owner2
RoR_SoR_T4.BoState[Test_Zone2][Test_BO_ID2] = Test_BO_State2

RoR_SoR_T4.BOTimer[Test_Zone2][Test_BO_ID2] = Test_BO_Timer2

--local VPZone = GetCampaignZoneData(Test_Zone2) 
	
--local Width_Zone_Order = ( ( VPZone.controlPoints[1] / 100 ) * 147 )
--WindowSetDimensions( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone2]).."VP_ORDER", Width_Zone_Order+2, 4 )
--local Width_Zone_Destro = ( ( VPZone.controlPoints[2]/ 100 ) * 142 )
--WindowSetDimensions( tostring(RoR_SoR_T4.ZoneNumber[Test_Zone2]).."VP_DESTRO", Width_Zone_Destro+2, 4 )


return
end


function RoR_SoR_T4.GetFlag(BO_OWNER,BO_STATE)
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

function RoR_SoR_T4.TimeUpdate(timeElapsed)
--[[
for k, v in pairs(RoR_SoR_T4.BOTimer) do
--d(L"-----------------")
--d(L"Key: "..towstring(k))
--d(L"Value: "..towstring(b))
if RoR_SoR_T4.BONumber[k] ~= nil and RoR_SoR_T4.BOTimer[k] ~= nil then

	for a, b in pairs(RoR_SoR_T4.BOTimer[k]) do
	if b > 0 then 

	
	--	LabelSetText(tostring(RoR_SoR_T4.BONumber[k][a]).."_TIMER",L"")
d(L"-----------------")
d(L"BO: "..towstring(RoR_SoR_T4.BONumber[k][a])..L"_TIMER")
d(L"Key: "..towstring(a))
d(L"Value: "..towstring(b))
	
	
--	RoR_SoR_T4.BOTimer[k][a] =  b - timeElapsed
--	LabelSetText(tostring(RoR_SoR_T4.BONumber[k][a]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[k][b])))
else	


end

	end

end
end
--]]

for k, v in pairs(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]]) do
if RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][k] ~= nil then
if v > 0 then
RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][k] = RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][k] - timeElapsed
LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][k]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][k])))
	if RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][k] == 16 then
		local GetRealmColor = RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][k]
		local barColor = RoR_SoR.RealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 
	elseif 	RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][k] == 4 then
		local GetRealmColor = RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][k]
		local barColor = RoR_SoR.InvertRealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 	
	end
elseif v <= 0 then

LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][k]).."_TIMER",L"")


--d(L"k= "..towstring(k)) --k is ID
--d(L"v= "..towstring(v)) -- v is value

end
--local realm = RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][k]]
--local barColor = DefaultColor.RealmColors[realm]
 --LabelSetTextColor(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 
end


end

--if RoR_SoR_T4.Active_Zone == 3 then
for k, v in pairs(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]]) do
if RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][k] ~= nil then

if v > 0 then 
RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][k] = RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][k] - timeElapsed
LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][k]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][k])))

	if RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][k] == 16 then
		local GetRealmColor = RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.RealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 
	elseif 	RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][k] == 4 then
		local GetRealmColor = RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][k]
		--d(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][k]])
		local barColor = RoR_SoR.InvertRealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 	
	end

elseif v <= 0 then

LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][k]).."_TIMER",L"")
end
--d(L"k= "..towstring(k)) --k is ID
--d(L"v= "..towstring(v)) -- v is value
--end


end
end


-- if RoR_SoR_T4.Active_Zone == 2 then


for k, v in pairs(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]]) do
if RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][k] ~= nil then
if v > 0 then 
RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][k] = RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][k] - timeElapsed
LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][k]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][k])))
	if RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][k] == 16 then
		local GetRealmColor = RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][k]
		local barColor = RoR_SoR.RealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 
	elseif 	RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][k] == 4 then
		local GetRealmColor = RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][k]
		local barColor = RoR_SoR.InvertRealmColors[(GetRealmColor)+1]
		LabelSetTextColor(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][k]).."_TIMER", barColor.r, barColor.g, barColor.b ) 	
	end
elseif v <= 0 then

LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][k]).."_TIMER",L"")

end
--LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][k]).."_TIMER",L"")
--d(L"k= "..towstring(k)) --k is ID
--d(L"v= "..towstring(v)) -- v is value
end
end


--if RoR_SoR_T4.Active_Zone == 1 then



end
--function RoR_SoR_T4.TimeUpdate(timeElapsed)
--for i = 1,3 do

--for k, v in pairs(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[i]]) do
--if v > 0 then 
--RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[i]][k] = RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[i]][k] - timeElapsed
--LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[i]][k]).."_TIMER",towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[i]][k])))
--else
--LabelSetText(tostring(RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[i]][k]).."_TIMER",L"")
--d(L"k= "..towstring(k)) --k is ID
--d(L"v= "..towstring(v)) -- v is value
--end
--end

--end
--end

function RoR_SoR_T4.SetZoneIDs(Zone,ACTIVE_ZONE)
local Zone = tonumber(Zone)
local ActiveZone = tonumber(ACTIVE_ZONE)

if tonumber(Zone) == 3 or tonumber(Zone) == 5 or tonumber(Zone) == 9 then
RoR_SoR_T4.ActiveTierZone[1] = tonumber(ActiveZone)
elseif tonumber(Zone) == 103 or tonumber(Zone) == 105 or tonumber(Zone) == 109 then
RoR_SoR_T4.ActiveTierZone[2] = tonumber(ActiveZone)
elseif tonumber(Zone) == 203 or tonumber(Zone) == 205 or tonumber(Zone) == 209 then
RoR_SoR_T4.ActiveTierZone[3] = tonumber(ActiveZone)
end




--Dwarf
if Zone == 3 and ActiveZone == 0 then

RoR_SoR_T4.T2Zones[1] = 3

RoR_SoR_T4.Realm1BONumber[1] = 159
RoR_SoR_T4.Realm1BONumber[2] = 160
RoR_SoR_T4.Realm1BONumber[3] = 161
RoR_SoR_T4.Realm1BONumber[4] = 162


RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[1]] = "RoR_SoR_T4WindowRealm1"

RoR_SoR_T4.Active_Zone = 1



RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[1]] = "RoR_SoR_T4WindowRealm1BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[2]] = "RoR_SoR_T4WindowRealm1BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[3]] = "RoR_SoR_T4WindowRealm1BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[4]] = "RoR_SoR_T4WindowRealm1BO4"
return true
elseif Zone == 5 and ActiveZone == 1 then

RoR_SoR_T4.T2Zones[1] = 5

RoR_SoR_T4.Realm1BONumber[1] = 147
RoR_SoR_T4.Realm1BONumber[2] = 150
RoR_SoR_T4.Realm1BONumber[3] = 151
RoR_SoR_T4.Realm1BONumber[4] = 182


RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[1]] = "RoR_SoR_T4WindowRealm1"

RoR_SoR_T4.Active_Zone = 1



RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[1]] = "RoR_SoR_T4WindowRealm1BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[2]] = "RoR_SoR_T4WindowRealm1BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[3]] = "RoR_SoR_T4WindowRealm1BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[4]] = "RoR_SoR_T4WindowRealm1BO4"
return true
elseif Zone == 9 and ActiveZone == 2 then

RoR_SoR_T4.T2Zones[1] = 9

RoR_SoR_T4.Realm1BONumber[1] = 153
RoR_SoR_T4.Realm1BONumber[2] = 156
RoR_SoR_T4.Realm1BONumber[3] = 157
RoR_SoR_T4.Realm1BONumber[4] = 158


RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[1]] = "RoR_SoR_T4WindowRealm1"

RoR_SoR_T4.Active_Zone = 1



RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[1]] = "RoR_SoR_T4WindowRealm1BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[2]] = "RoR_SoR_T4WindowRealm1BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[3]] = "RoR_SoR_T4WindowRealm1BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.Realm1BONumber[4]] = "RoR_SoR_T4WindowRealm1BO4"
return true


----------------------------------------------------------------------

--empire
elseif Zone == 105 and ActiveZone == 1 then

--praag
RoR_SoR_T4.T2Zones[2] = 105

RoR_SoR_T4.Realm2BONumber[1] = 5080
RoR_SoR_T4.Realm2BONumber[2] = 5081
RoR_SoR_T4.Realm2BONumber[3] = 5083
RoR_SoR_T4.Realm2BONumber[4] = 5084


RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[2]] = "RoR_SoR_T4WindowRealm2"

RoR_SoR_T4.Active_Zone = 2

RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[1]] = "RoR_SoR_T4WindowRealm2BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[2]] = "RoR_SoR_T4WindowRealm2BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[3]] = "RoR_SoR_T4WindowRealm2BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[4]] = "RoR_SoR_T4WindowRealm2BO4"
return true

elseif Zone == 103 and ActiveZone == 0 then

--CW 
RoR_SoR_T4.T2Zones[2] = 103 


RoR_SoR_T4.Realm2BONumber[1] = 5076
RoR_SoR_T4.Realm2BONumber[2] = 5077
RoR_SoR_T4.Realm2BONumber[3] = 5078
RoR_SoR_T4.Realm2BONumber[4] = 5079


RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[2]] = "RoR_SoR_T4WindowRealm2"

RoR_SoR_T4.Active_Zone = 2

RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[1]] = "RoR_SoR_T4WindowRealm2BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[2]] = "RoR_SoR_T4WindowRealm2BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[3]] = "RoR_SoR_T4WindowRealm2BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[4]] = "RoR_SoR_T4WindowRealm2BO4"
return true
elseif Zone == 109  and ActiveZone == 2 then 

-- Reik
RoR_SoR_T4.T2Zones[2] = 109 


RoR_SoR_T4.Realm2BONumber[1] = 5085
RoR_SoR_T4.Realm2BONumber[2] = 5086
RoR_SoR_T4.Realm2BONumber[3] = 5087
RoR_SoR_T4.Realm2BONumber[4] = 5088


RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[2]] = "RoR_SoR_T4WindowRealm2"

RoR_SoR_T4.Active_Zone = 2

RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[1]] = "RoR_SoR_T4WindowRealm2BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[2]] = "RoR_SoR_T4WindowRealm2BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[3]] = "RoR_SoR_T4WindowRealm2BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.Realm2BONumber[4]] = "RoR_SoR_T4WindowRealm2BO4"
return true

----------------------------------------------------------------------
elseif Zone == 203 and ActiveZone == 0 then
--cal

RoR_SoR_T4.T2Zones[3] = 203

RoR_SoR_T4.Realm3BONumber[1] = 636
RoR_SoR_T4.Realm3BONumber[2] = 637
RoR_SoR_T4.Realm3BONumber[3] = 638
RoR_SoR_T4.Realm3BONumber[4] = 639

RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[3]] = "RoR_SoR_T4WindowRealm3"

RoR_SoR_T4.Active_Zone = 3

RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[1]] = "RoR_SoR_T4WindowRealm3BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[2]] = "RoR_SoR_T4WindowRealm3BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[3]] = "RoR_SoR_T4WindowRealm3BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[4]] = "RoR_SoR_T4WindowRealm3BO4"
return true

elseif Zone == 205 and ActiveZone == 1 then
--dw
RoR_SoR_T4.T2Zones[3] = 205

RoR_SoR_T4.Realm3BONumber[1] = 612
RoR_SoR_T4.Realm3BONumber[2] = 613
RoR_SoR_T4.Realm3BONumber[3] = 614
RoR_SoR_T4.Realm3BONumber[4] = 615

RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[3]] = "RoR_SoR_T4WindowRealm3"

RoR_SoR_T4.Active_Zone = 3

RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[1]] = "RoR_SoR_T4WindowRealm3BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[2]] = "RoR_SoR_T4WindowRealm3BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[3]] = "RoR_SoR_T4WindowRealm3BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[4]] = "RoR_SoR_T4WindowRealm3BO4"
return true

elseif Zone == 209 and ActiveZone == 2 then
--eat
RoR_SoR_T4.T2Zones[3] = 209

RoR_SoR_T4.Realm3BONumber[1] = 632
RoR_SoR_T4.Realm3BONumber[2] = 633
RoR_SoR_T4.Realm3BONumber[3] = 634
RoR_SoR_T4.Realm3BONumber[4] = 635

RoR_SoR_T4.ZoneNumber[RoR_SoR_T4.T2Zones[3]] = "RoR_SoR_T4WindowRealm3"

RoR_SoR_T4.Active_Zone = 3

RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]] = {}
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[1]] = "RoR_SoR_T4WindowRealm3BO1"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[2]] = "RoR_SoR_T4WindowRealm3BO2"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[3]] = "RoR_SoR_T4WindowRealm3BO3"
RoR_SoR_T4.BONumber[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.Realm3BONumber[4]] = "RoR_SoR_T4WindowRealm3BO4"
return true

else
return false
end






T4ComboZone = {}
T4PairedZone = {}

T4ComboZone[RoR_SoR_T4.T2Zones[1]] = RoR_SoR_T4.T2Zones[1]
T4PairedZone[RoR_SoR_T4.T2Zones[1]] = RoR_SoR_T4.T2Zones[1]

T4ComboZone[RoR_SoR_T4.T2Zones[2]] = RoR_SoR_T4.T2Zones[2]
T4PairedZone[RoR_SoR_T4.T2Zones[2]] = RoR_SoR_T4.T2Zones[2]

T4ComboZone[RoR_SoR_T4.T2Zones[3]] = RoR_SoR_T4.T2Zones[3]
T4PairedZone[RoR_SoR_T4.T2Zones[3]] = RoR_SoR_T4.T2Zones[3]

--RoR_SoR_T4.ZoneNumber[208] = "RoR_SoR_T4WindowRealm3"


return true
end


function RoR_SoR_T4.OnMouseOverStart()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local WindowName = towstring(SystemData.MouseOverWindow.name)
local FinalName = WindowName:match(L"RoR_SoR_T4Window([^%.]+)")
--d(L"t4 Tooltip "..towstring(FinalName))
--d(L"t4 Tooltip "..towstring(WindowName))

local Line1 = L""
local Line2 = L""
local Line3 = L""

if FinalName ~= nil or FinalName ~= "" then

--Dwarf
	if FinalName == L"Realm1BO1" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][1]]))
	
	elseif FinalName == L"Realm1BO2" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][2]]))
	
	
	elseif FinalName == L"Realm1BO3" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][3]]))
	
	
	elseif FinalName == L"Realm1BO4" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[1]][4]]))

	
	elseif FinalName == L"Realm1LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_DWARF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_GREENSKIN ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[1]],9)	

	elseif FinalName == L"Realm1_KEEP_WIN_1_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]))

   if RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]])) end
	if RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]],RoR_SoR_T4.KeepMessage[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]],RoR_SoR_T4.KeepHP[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]]))..towstring(temp_Rank)..towstring(temp_Health)

--RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]]	

	elseif FinalName == L"Realm1_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]))

   if RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]])) end
	if RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]],RoR_SoR_T4.KeepMessage[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]],RoR_SoR_T4.KeepHP[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][2]]))..towstring(temp_Rank)..towstring(temp_Health)



--empire	
	
		elseif FinalName == L"Realm2BO1" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][1]]))
	
	elseif FinalName == L"Realm2BO2" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][2]]))
	
	
	elseif FinalName == L"Realm2BO3" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][3]]))
	
	
	elseif FinalName == L"Realm2BO4" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[2]][4]]))
	
	
	elseif FinalName == L"Realm2LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_EMPIRE ))..L" - "..towstring(GetString( StringTables.Default.LABEL_CHAOS ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[2]],9)	

	elseif FinalName == L"Realm2_KEEP_WIN_1_KEEPICON" then

	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]))

   if RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]])) end
	if RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]],RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]],RoR_SoR_T4.KeepMessage[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]],RoR_SoR_T4.KeepHP[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][1]]))..towstring(temp_Rank)..towstring(temp_Health)

--RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]]	

	elseif FinalName == L"Realm2_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]))

   if RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]])) end
	if RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]],RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]],RoR_SoR_T4.KeepMessage[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]],RoR_SoR_T4.KeepHP[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[2]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[2]][2]]))..towstring(temp_Rank)..towstring(temp_Health)


--Elf	

	elseif FinalName == L"Realm3BO1" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][1]]))
	
	elseif FinalName == L"Realm3BO2" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][2]]))
	
	
	elseif FinalName == L"Realm3BO3" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][3]]))
	
	
	elseif FinalName == L"Realm3BO4" then
	Line1 = towstring(GetObjectiveName(RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]))
	if RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]] > 0 then Line2 = towstring(TimeUtils.FormatClock(RoR_SoR_T4.BOTimer[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]])) else Line2 = L"" end
	Line3 = towstring(RoR_SoR.GetTooltipIcon(RoR_SoR_T4.BoOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]],RoR_SoR_T4.BoState[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.BOID[RoR_SoR_T4.T2Zones[3]][4]]))
	
	
	elseif FinalName == L"Realm3LOCK" then
	Line1 = towstring(GetString( StringTables.Default.LABEL_HIGH_ELF ))..L" - "..towstring(GetString( StringTables.Default.LABEL_DARK_ELF ))
	Line2 = L""
	Line3 = RoR_SoR.GetTooltipIcon(RoR_SoR_T4.LockedRealm[RoR_SoR_T4.T2Zones[3]],9)	
	
	elseif FinalName == L"Realm3_KEEP_WIN_1_KEEPICON" then

	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]))

   if RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]])) end
	if RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]],RoR_SoR_T4.KeepMessage[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]],RoR_SoR_T4.KeepHP[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][1]]))..towstring(temp_Rank)..towstring(temp_Health)

--RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[1]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[1]][1]]	

	elseif FinalName == L"Realm3_KEEP_WIN_2_KEEPICON" then
	local temp_Rank = L""
	local temp_Health = L""
	Line1 = towstring(GetKeepName(RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]))

   if RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]] > 0 then temp_Rank = L"<br>"..towstring(RoR_SoR.GetKeepRank(RoR_SoR_T4.KeepRank[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]])) end
	if RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]] > 0 then temp_Health = L"<br>"..towstring(RoR_SoR.GetKeepHeath(RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]],RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]],RoR_SoR_T4.KeepMessage[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]],RoR_SoR_T4.KeepHP[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]])) end
	Line3 = towstring(RoR_SoR.GetKeepIcon( RoR_SoR_T4.KeepOwner[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]], RoR_SoR_T4.KeepStatus[RoR_SoR_T4.T2Zones[3]][RoR_SoR_T4.KEEPID[RoR_SoR_T4.T2Zones[3]][2]]))..towstring(temp_Rank)..towstring(temp_Health)

	
	
	
	
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

function RoR_SoR_T4.Close()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)
	local MouseOverWindowName = SystemData.MouseOverWindow.name
	WindowSetShowing(WinParent,false)
	
end


function RoR_SoR_T4.Update(timeElapsed)

RoR_SoR_T4.Timer = RoR_SoR_T4.Timer + timeElapsed
if RoR_SoR_T4.Timer > 1 then 
RoR_SoR_T4.Timer = 0
RoR_SoR_T4.ZoneUpdate()
end
end


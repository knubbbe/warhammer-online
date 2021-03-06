if not Warbuilder then Warbuilder = {} end

local Version = 204
local Buildver = 1
local MAX_MASTERY_POINTS = 29
local TOTAL_POINTS_USED = 0

local MasteryToLevel ={10,11,12,13,14,15,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24,24,25,25,25,25,25,30,31,25}
local LevelToMastery = {0,0,0,0,0,0,0,0,0,0,1,1,2,2,3,3,4,4,5,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25}
local CareerToLevel = {11,13,15,17,19,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,40,40,40,40}
local CareerToRank = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,40,50,60,70}
local RankToMorale = {}	

pathName = "EA_InteractionWindow/Textures/"

local careerImageNameLookUp = 
{
    [1] =   "EA_Mastery_Ironbreaker1_d1.dds",
    [2] =   "EA_Mastery_Ironbreaker2_d1.dds",
    [3] =   "EA_Mastery_Ironbreaker3_d1.dds",
    [4] =   "EA_Mastery_Slayer1_d1.dds",
    [5] =   "EA_Mastery_Slayer2_d1.dds",
    [6] =   "EA_Mastery_Slayer3_d1.dds",
    [7] =   "EA_Mastery_RunePriest1_d1.dds",
    [8] =   "EA_Mastery_RunePriest2_d1.dds",
    [9] =   "EA_Mastery_RunePriest3_d1.dds",
    [10] =  "EA_Mastery_Engineer1_d1.dds",
    [11] =  "EA_Mastery_Engineer2_d1.dds",
    [12] =  "EA_Mastery_Engineer3_d1.dds",
    [13] =  "EA_Mastery_BlackOrc1_d1.dds",
    [14] =  "EA_Mastery_BlackOrc2_d1.dds",
    [15] =  "EA_Mastery_BlackOrc3_d1.dds",
    [16] =  "EA_Mastery_Choppa1_d1.dds",
    [17] =  "EA_Mastery_Choppa2_d1.dds",
    [18] =  "EA_Mastery_Choppa3_d1.dds",
    [19] =  "EA_Mastery_Shaman1_d1.dds",
    [20] =  "EA_Mastery_Shaman2_d1.dds",
    [21] =  "EA_Mastery_Shaman3_d1.dds",
    [22] =  "EA_Mastery_SquigHerder1_d1.dds",
    [23] =  "EA_Mastery_SquigHerder2_d1.dds",
    [24] =  "EA_Mastery_SquigHerder3_d1.dds",
    [25] =  "EA_Mastery_WitchHunter1_d1.dds",
    [26] =  "EA_Mastery_WitchHunter2_d1.dds",
    [27] =  "EA_Mastery_WitchHunter3_d1.dds",
    [28] =  "EA_Mastery_Knight1_d1.dds",
    [29] =  "EA_Mastery_Knight2_d1.dds",
    [30] =  "EA_Mastery_Knight3_d1.dds",
    [31] =  "EA_Mastery_BrightWiz1_d1.dds",
    [32] =  "EA_Mastery_BrightWiz2_d1.dds",
    [33] =  "EA_Mastery_BrightWiz3_d1.dds",
    [34] =  "EA_Mastery_WarriorPriest1_d1.dds",
    [35] =  "EA_Mastery_WarriorPriest2_d1.dds",
    [36] =  "EA_Mastery_WarriorPriest3_d1.dds",
    [37] =  "EA_Mastery_Chosen1_d1.dds",
    [38] =  "EA_Mastery_Chosen2_d1.dds",
    [39] =  "EA_Mastery_Chosen3_d1.dds",
    [40] =  "EA_Mastery_Marauder1_d1.dds",
    [41] =  "EA_Mastery_Marauder2_d1.dds",
    [42] =  "EA_Mastery_Marauder3_d1.dds",
    [43] =  "EA_Mastery_Zealot1_d1.dds",
    [44] =  "EA_Mastery_Zealot2_d1.dds",
    [45] =  "EA_Mastery_Zealot3_d1.dds",
    [46] =  "EA_Mastery_Magus1_d1.dds",
    [47] =  "EA_Mastery_Magus2_d1.dds",
    [48] =  "EA_Mastery_Magus3_d1.dds",
    [49] =  "EA_Mastery_Swordmaster1_d1.dds",
    [50] =  "EA_Mastery_Swordmaster2_d1.dds",
    [51] =  "EA_Mastery_Swordmaster3_d1.dds",
    [52] =  "EA_Mastery_ShadowWarrior1_d1.dds",
    [53] =  "EA_Mastery_ShadowWarrior2_d1.dds",
    [54] =  "EA_Mastery_ShadowWarrior3_d1.dds",
    [55] =  "EA_Mastery_WhiteLion1_d1.dds",
    [56] =  "EA_Mastery_WhiteLion2_d1.dds",
    [57] =  "EA_Mastery_WhiteLion3_d1.dds",
    [58] =  "EA_Mastery_Archmage1_d1.dds",
    [59] =  "EA_Mastery_Archmage2_d1.dds",
    [60] =  "EA_Mastery_Archmage3_d1.dds",
    [61] =  "EA_Mastery_BlackGuard1_d1.dds",
    [62] =  "EA_Mastery_BlackGuard2_d1.dds",
    [63] =  "EA_Mastery_BlackGuard3_d1.dds",
    [64] =  "EA_Mastery_WitchElf1_d1.dds",
    [65] =  "EA_Mastery_WitchElf2_d1.dds",
    [66] =  "EA_Mastery_WitchElf3_d1.dds",
    [67] =  "EA_Mastery_Disciple1_d1.dds",
    [68] =  "EA_Mastery_Disciple2_d1.dds",
    [69] =  "EA_Mastery_Disciple3_d1.dds",
    [70] =  "EA_Mastery_Sorceress1_d1.dds",
    [71] =  "EA_Mastery_Sorceress2_d1.dds",
    [72] =  "EA_Mastery_Sorceress3_d1.dds"
}

Warbuilder.Career = {}
--Fix for knight and BlackGuard, because Mythic forgot to add them
AbilitiesWindow.FilterTabCareerTextures[GameData.CareerLine.KNIGHT] = {[1]="Tab-Swordmaster1-Khaine",[2]="Tab-PassiveAbilities",[3]="Tab-WitchHunter3-Judgement"}
AbilitiesWindow.FilterTabCareerTextures[GameData.CareerLine.BLACKGUARD] = {[1]="Tab-Disciple1-Dark-Rites",[2]="Tab-Disciple2-Torture",[3]="Tab-Disciple3-Sacrifice"}

local _hookOnHyperLinkLButtonUp

local function OnHyperLinkLButtonUp( linkData, flags, x, y )
_hookOnHyperLinkLButtonUp( linkData, flags, x, y )
local DataGrab = towstring(linkData)

	if DataGrab:match( L"WarBuilder:.") then
		DataGrab = DataGrab:match( L"WarBuilder: (.+)")
		--Split up the grabbed string
		SplitList = WStringSplit (DataGrab, L";")
	
			--Split the Info Header
			local InfoSplit = WStringSplit(SplitList[1]:match( L"Info{(.+)}"),L",")
			local InfoVersion = tonumber(InfoSplit[1])
			local InfoBuild = tonumber(InfoSplit[2])
			local InfoCareer = tonumber(InfoSplit[3])
			local InfoLevel = tonumber(InfoSplit[4])
			local InfoRenown = tonumber(InfoSplit[5])

			local PathSplit = WStringSplit(SplitList[2]:match( L"Path{(.+)}"),L",")
			local PathCounter1 = tonumber(PathSplit[1])
			local PathCounter2 =tonumber(PathSplit[3])
			local PathCounter3 = tonumber(PathSplit[5])
			local GearCounter1 = tonumber(PathSplit[2])
			local GearCounter2 = tonumber(PathSplit[4])
			local GearCounter3 = tonumber(PathSplit[6])

			local Tree1Split = WStringSplit(SplitList[3]:match( L"Tree1{(.+)}"),L",")
			local Tree2Split = WStringSplit(SplitList[4]:match( L"Tree2{(.+)}"),L",")
			local Tree3Split = WStringSplit(SplitList[5]:match( L"Tree3{(.+)}"),L",")

			local TacticSplit = WStringSplit(SplitList[6]:match( L"Tactic{(.+)}"),L",")
			local MoraleSplit = WStringSplit(SplitList[7]:match( L"Morale{(.+)}"),L",")

			
			if tonumber(InfoVersion) > tonumber(Version) then
				SystemData.AlertText.VecType = {4}
				SystemData.AlertText.VecText = {L"Notice: This Link was made with a newer version of WarBuilder, Please update Warbuilder ASAP!"}
				AlertTextWindow.AddAlert()
				TextLogAddEntry("Chat", 0, L"Notice: This Link was made with a newer version of WarBuilder, Please update Warbuilder ASAP! (your build ver: "..towstring(Version)..L", Linked ver: "..towstring(InfoVersion)..L")")
			elseif tonumber(InfoVersion) < tonumber(Version) then
				SystemData.AlertText.VecType = {4}
				SystemData.AlertText.VecText = {L"Notice: This Link was made with a Older version of WarBuilder, It might not show right!"}
				AlertTextWindow.AddAlert()
				TextLogAddEntry("Chat", 0, L"Notice: This Link was made with a Older version of WarBuilder, It might not show right! (your build ver: "..towstring(Version)..L", Linked ver: "..towstring(InfoVersion)..L")")
			end			
						
--Warbuilder.SelectedTactics
	Warbuilder.Reset()
	Warbuilder.OnUpdate()		

	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowComboLevelSelect",InfoLevel+1)
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowComboRenownSelect",InfoRenown+1)	
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowCombo",InfoCareer)
	Warbuilder.SelectedCareer = InfoCareer
	Warbuilder.SelectedLevel = InfoLevel
	Warbuilder.SelectedRenown = InfoRenown

Warbuilder.PathCounter[1] = PathCounter1
Warbuilder.PathCounter[2] = PathCounter2
Warbuilder.PathCounter[3] = PathCounter3

Warbuilder.GearPoint[1] = GearCounter1
Warbuilder.GearPoint[2] = GearCounter2
Warbuilder.GearPoint[3] = GearCounter3


			if (Tree1Split ~= nil) and (#Tree1Split > 0) then
				for TreeTempCount1=1 , #Tree1Split do
				Warbuilder.BoughtAbilitys[1][tonumber(Tree1Split[TreeTempCount1])] = true	
				d(Tree1Split[TreeTempCount1])
				end			
			end
			
			if (Tree2Split ~= nil) and (#Tree2Split > 0) then
				for TreeTempCount2=1 , #Tree2Split do
				Warbuilder.BoughtAbilitys[2][tonumber(Tree2Split[TreeTempCount2])] = true	
				end			
			end		
			
			if (Tree3Split ~= nil) and (#Tree3Split > 0) then
				for TreeTempCount3=1 , #Tree3Split do
				Warbuilder.BoughtAbilitys[3][tonumber(Tree3Split[TreeTempCount3])] = true	
				end			
			end			
	
	
			if (TacticSplit ~= nil) and (#TacticSplit > 0) then
				for TacticTempCount=1 , #TacticSplit do
				if tonumber(TacticSplit[TacticTempCount]) > 0 then	Warbuilder.SelectedTactics[tonumber(TacticSplit[TacticTempCount])] = true end
				end			
			end

			
	for MoraleTempCount=1,#Warbuilder.Career[Warbuilder.SelectedCareer].Core.Morale do		
		RankToMorale[MoraleTempCount] = Warbuilder.Career[Warbuilder.SelectedCareer].Core.Morale[MoraleTempCount].Rank		
	end			
			
			if (MoraleSplit ~= nil) and (#MoraleSplit > 0) then
				for i=1 , #MoraleSplit do
					if RankToMorale[tonumber(MoraleSplit[i])] ~= nil then Warbuilder.SelectedMorales[RankToMorale[tonumber(MoraleSplit[i])]] = tonumber(MoraleSplit[i]) end
				end			
			end
			PlaySound(500)
			Warbuilder.Command("")
			Warbuilder.OnUpdate()	
			
			
	elseif 	DataGrab:match( L"ABILITY:.") then
		DataGrab = DataGrab:match( L"ABILITY: (.+)")
		--Split up the grabbed string
			AbilitySplitList = WStringSplit (DataGrab, L";")	
		Warbuilder.AbilityLink(AbilitySplitList[1],AbilitySplitList[2],AbilitySplitList[3],AbilitySplitList[4],AbilitySplitList[5],AbilitySplitList[6],AbilitySplitList[7],AbilitySplitList[8],AbilitySplitList[9],AbilitySplitList[10])	
			
			--Warbuilder.AbilityLink(AbilityID,AbilityLvl,AbilityType,AbilityCareer,AbilityPath,AbilityType2,AbilityMinLevel,AbilityIcon,AbilityRank,NickName)				
	end
end



function Warbuilder.Initilize()

	--RegisterEventHandler( SystemData.Events.ENTER_WORLD, "AfterLoad" )
	--RegisterEventHandler( SystemData.Events.INTERFACE_RELOADED, "AfterLoad" )	

	Warbuilder.CareerLine = tonumber(GameData.Player.career.line)
	Warbuilder.CareerID = tonumber(GameData.Player.career.id)

	Warbuilder.SelectedCareer = 1
	Warbuilder.SelectedLevel = 0
	Warbuilder.SelectedRenown = 0
	
	TextLogAddEntry("Chat", 0, L"<icon00057> Warbuilder "..towstring(Version)..L" Loaded")
	LibSlash.RegisterSlashCmd("Warbuilder", function(input) Warbuilder.Command(input) end)
	LibSlash.RegisterSlashCmd("Warbuild", function(input) Warbuilder.Command(input) end)	
	LibSlash.RegisterSlashCmd("Wbuild", function(input) Warbuilder.Command(input) end)
	LibSlash.RegisterSlashCmd("Warb", function(input) Warbuilder.Command(input) end)	
	
	CreateWindow("WarbuilderMainWindow", false)
	LayoutEditor.RegisterWindow( "WarbuilderMainWindow", L"Warbuilder", L"Warbuilder", false, false, true, nil )	
	
	_hookOnHyperLinkLButtonUp = EA_ChatWindow.OnHyperLinkLButtonUp
	EA_ChatWindow.OnHyperLinkLButtonUp = OnHyperLinkLButtonUp
	
	
	Warbuilder.Colors = {}
	Warbuilder.Colors.Selected = {r=220,g=85,b=0}
	Warbuilder.Colors.Unmarked = {r=220,g=85,b=0}
	
	Warbuilder.SelectedTactics = {}
	Warbuilder.SelectedMorales = {}	
	Warbuilder.PointsInTree = {[1]=0,[2]=0,[3]=0}
	Warbuilder.GearPoint = {[1]=0,[2]=0,[3]=0}
	Warbuilder.PathCounter = {[1]=0,[2]=0,[3]=0}
	Warbuilder.PathBuyConvert = {[1]=3,[2]=5,[3]=7,[4]=9,[5]=11,[6]=13,[7]=15}
	Warbuilder.BoughtAbilitys = {
		[1]={[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false},
		[2]={[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false},
		[3]={[1]=false,[2]=false,[3]=false,[4]=false,[5]=false,[6]=false,[7]=false}
		}
	Warbuilder.ParentOffsets = {}	
	
	for i=1,3 do
	Warbuilder.ParentOffsets[i] = {}
	local texture, x, y, disabledTexture = GetIconData(4671)
		DynamicImageSetTexture("WarbuilderMainWindow_SpecTree"..i.."_Clear_ButtonIcon",texture, 64, 64)	
		ButtonSetDisabledFlag( "WarbuilderMainWindow_SpecTree"..i.."_Clear", true)		
	end	
	
	ComboBoxAddMenuItem("WarbuilderMainWindowComboLevelSelect",L"<icon52>--")
	for lvl=1,40 do
		ComboBoxAddMenuItem("WarbuilderMainWindowComboLevelSelect",L"<icon52>"..towstring(lvl))
	end
	
	ComboBoxAddMenuItem("WarbuilderMainWindowComboRenownSelect",L"<icon45>--")
	for RR=4,7 do
		ComboBoxAddMenuItem("WarbuilderMainWindowComboRenownSelect",L"<icon45>"..towstring(RR*10)..L"+")
	end
	
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowComboLevelSelect",1)
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowComboRenownSelect",1)	
	--Populate The Listbox with Careers
	for k,v in pairs(Warbuilder.Career) do
		ComboBoxAddMenuItem("WarbuilderMainWindowCombo",L"<icon"..towstring(Icons.GetCareerIconIDFromCareerLine(Warbuilder.Career[k].Line))..L"> "..towstring(GetCareerLine(Warbuilder.Career[k].Line)))
	end
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowCombo",Warbuilder.SelectedCareer)
	
			ButtonSetText("WarbuilderMainWindowLinkButton", L"[Link Build]" )
			ButtonSetText("WarbuilderMainWindowImportButton", L"[Import Current]" )	
			ButtonSetText("WarbuilderMainWindowClearAllButton", L"[Clear All]" )				
			LabelSetText("WarbuilderMainWindowCoreLabel",L"Core Abilities")
			LabelSetText("WarbuilderMainWindowMoraleLabel",L"Morales")			
			LabelSetText("WarbuilderMainWindowTacticLabel",L"Tactics")					
			
			LabelSetText("WarbuilderMainWindowComboLabel",L"Selected Career")	
			LabelSetText("WarbuilderMainWindowLevelLabel",L"Level")
			LabelSetText("WarbuilderMainWindowRenownLabel",L"Renown")				
			LabelSetText("WarbuilderMainWindowCareerPointLabel",L"Mastery Points")			
			LabelSetText("WarbuilderMainWindowTitleBarText",L"WARBUILDER" )
				
	
	Warbuilder.OnUpdate()	
end


function Warbuilder.Shutdown()

--RegisterEventHandler( SystemData.Events.ENTER_WORLD, "AfterLoad" )
--RegisterEventHandler( SystemData.Events.INTERFACE_RELOADED, "AfterLoad" )	

end


function Warbuilder.OnUpdate()
	SetCareerMasteryImages( pathName..careerImageNameLookUp[(3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-2], pathName..careerImageNameLookUp[(3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-1], pathName..careerImageNameLookUp[(3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)])	

	DynamicImageSetTexture( "WarbuilderMainWindowBgPicture1", "career_mastery_image1", 0, 0 )	
	DynamicImageSetTexture( "WarbuilderMainWindowBgPicture2", "career_mastery_image2", 0, 0 )
	DynamicImageSetTexture( "WarbuilderMainWindowBgPicture3", "career_mastery_image3", 0, 0 )	

	if Warbuilder.SelectedLevel == 0 then
		MAX_MASTERY_POINTS = 29
	else
		MAX_MASTERY_POINTS=LevelToMastery[Warbuilder.SelectedLevel]+Warbuilder.SelectedRenown
	end	

	TOTAL_POINTS_USED = Warbuilder.CheckPointsUsed()
	
if TOTAL_POINTS_USED > MAX_MASTERY_POINTS then LabelSetTextColor("WarbuilderMainWindowTotalPointsUsedValue", 255, 25,25) else LabelSetTextColor("WarbuilderMainWindowTotalPointsUsedValue", 255, 255,255) end
	
	LabelSetText("WarbuilderMainWindowTotalPointsUsedValue", towstring(TOTAL_POINTS_USED)..L"/"..towstring(MAX_MASTERY_POINTS))	
	LabelSetText("WarbuilderMainWindowAbouttext", L"Version: "..towstring(Version)..L" <icon"..towstring(Icons.GetCareerIconIDFromCareerLine(Warbuilder.Career[Warbuilder.SelectedCareer].Line))..L">Build: "..towstring(Warbuilder.Career[Warbuilder.SelectedCareer].Build))	
	
	--Calculate and show "Required" label
	if TOTAL_POINTS_USED > 0 then 
	local CalcRenown = 0
	if (Warbuilder.SelectedRenown > 0) and (TOTAL_POINTS_USED <= 24+Warbuilder.SelectedRenown) then CalcRenown = (Warbuilder.SelectedRenown+3)*10 else CalcRenown = CareerToRank[TOTAL_POINTS_USED] end	
		if TOTAL_POINTS_USED > Warbuilder.SelectedRenown then
			LabelSetText("WarbuilderMainWindowLevelNeededValue",  L"Min.Req <icon52>"..towstring(CareerToLevel[TOTAL_POINTS_USED-(Warbuilder.SelectedRenown)])..L"/<icon45>"..towstring(CalcRenown))
		else
			LabelSetText("WarbuilderMainWindowLevelNeededValue",  L"Min.Req <icon52>"..towstring(CareerToLevel[TOTAL_POINTS_USED]-(TOTAL_POINTS_USED+(Warbuilder.SelectedRenown-1)))..L"/<icon45>"..towstring(CalcRenown))
		end
	else 	
		LabelSetText("WarbuilderMainWindowLevelNeededValue",L"") 
	end

	for Tree=1, 3 do		-- make the side bar counters
		for i=1, 15 do 	
			LabelSetText("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..i.."Number", towstring(i))
			LabelSetTextColor("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..i.."Number", 125, 125, 125)		
			DynamicImageSetTextureSlice( "WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..i.."Empty", "bar-empty" )	
			WindowSetTintColor("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..i.."Empty",255,255, 255)		
		end
					--Set the Specc Collums
		for StackFill=0 ,Warbuilder.PathCounter[Tree] + Warbuilder.GearPoint[Tree] do
			if DoesWindowExist("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..StackFill.."Empty") then
				DynamicImageSetTextureSlice( "WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..StackFill.."Empty", "bar-fill" )		
				WindowSetTintColor("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..StackFill.."Empty",255, 255,0)					
				LabelSetTextColor("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..StackFill.."Number", Warbuilder.Colors.Selected.r, Warbuilder.Colors.Selected.g, Warbuilder.Colors.Selected.b)		
			end
		end
		
		for index=1, 7 do  	 		--Populate Tree ability/tactic/morale icons
			local CareerInfo = Warbuilder.Career[Warbuilder.SelectedCareer].Path[Tree][index]
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_1",false)
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_2",false)
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_3",false)
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type,true)
			--Unset Ability if not enough points
			if ((Warbuilder.PathCounter[Tree]+Warbuilder.GearPoint[Tree]) < Warbuilder.PathBuyConvert[index])then
				Warbuilder.BoughtAbilitys[Tree][index] = false
			end			
			ButtonSetDisabledFlag( "WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type, not ((Warbuilder.PathCounter[Tree]+Warbuilder.GearPoint[Tree]) >= Warbuilder.PathBuyConvert[index]))					
			local texture, x, y, disabledTexture = GetIconData( CareerInfo.Icon )
			
			if CareerInfo.Type ~= 3 then	--Check if it is an morale or abillity and set the texture accordingly
				DynamicImageSetTexture("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type.."Icon",texture, 64, 64)				
			else
				CircleImageSetTexture("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type.."Icon",texture, 32, 32)
			end					
			ButtonSetPressedFlag("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type,Warbuilder.BoughtAbilitys[Tree][index])
			if Warbuilder.BoughtAbilitys[Tree][index] then	--Set Selected / Bought stuff
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type, false)
				WindowSetTintColor("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type, 255, 250, 250)
				WindowSetTintColor("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..Warbuilder.PathBuyConvert[index].."Empty",  215, 215,0)	
				LabelSetTextColor("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep"..Warbuilder.PathBuyConvert[index].."Number", 215, 215, 0)
			else			
				WindowSetTintColor("WarbuilderMainWindow_Tree"..Tree.."_SpecButton"..index.."_"..CareerInfo.Type, 255, 50, 50)
			end
			LabelSetText("WarbuilderMainWindow_PathLabel"..Tree,L"Path of <br>"..GetSpecializationPathName((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-Tree))..L" ("..towstring(Warbuilder.PathCounter[Tree]+Warbuilder.PointsInTree[Tree])..L")")				
		end	

		DynamicImageSetTextureSlice( "WarbuilderMainWindow_PathFrame"..Tree.."_ButtonIcon",AbilitiesWindow.FilterTabCareerTextures[Warbuilder.Career[Warbuilder.SelectedCareer].Line][Tree])
		
		
		--Populate Mastery Abilitys
		for u=1, #Warbuilder.Career[Warbuilder.SelectedCareer].Path[Tree].Core do
			
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."Glow",false)		
			local MasteryInfo = Warbuilder.Career[Warbuilder.SelectedCareer].Path[Tree].Core[u]
			local texture, x, y, disabledTexture = GetIconData( MasteryInfo.Icon )
			local Select_Or_Career = (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) == MasteryInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) == MasteryInfo.MinLevel)
			
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u,true)			
			DynamicImageSetTexture("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_ButtonIcon",texture, 64, 64)
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."Glow",Select_Or_Career)
			if Select_Or_Career == true then 
				WindowSetLayer("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u,8) 
				LabelSetTextColor("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_LevelLabel", 255, 255, 25)
			else 
				WindowSetLayer("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u,4) 
				LabelSetTextColor("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_LevelLabel", 255, 255, 255)
			end
		
			LabelSetText("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_LevelLabel",towstring(MasteryInfo.MinLevel))	
			WindowSetLayer("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_LevelLabel",WindowGetLayer("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u)+1)		
			--AnimatedImageStartAnimation ("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."Glow", 0, true, true, 0)
			--WindowSetTintColor("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."Glow", 255, 255, 255 )				
			WindowStartAlphaAnimation( "WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."Glow", Window.AnimationType.LOOP, 1.0, 0.0, 0.4, true, 0.0, 0 ) --start the pulse

			local FrameColor = Warbuilder.GetColorFromType(MasteryInfo.Type)		
			WindowSetTintColor("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u, FrameColor.r, FrameColor.g, FrameColor.b )		
			if  (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) >= MasteryInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) >= MasteryInfo.MinLevel) then			
		

			WindowSetTintColor("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_ButtonIcon",255, 255,255 )
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u, false)	
			
			else
				WindowSetTintColor("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_ButtonIcon",255, 75,75 )	
				LabelSetTextColor("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u.."_LevelLabel", 155, 155, 155)
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Tree"..Tree.."_Mastery"..u, true)			
			end
		
		end

		local NumberOfMasteryAbilities = #Warbuilder.Career[Warbuilder.SelectedCareer].Path[Tree].Core

		for MasterRemover = NumberOfMasteryAbilities+1 , 14 do
			WindowSetShowing("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..MasterRemover,false)
			LabelSetText("WarbuilderMainWindow_Tree"..Tree.."_Mastery"..MasterRemover.."_LevelLabel",L"")	
		end
		
		ButtonSetText("WarbuilderMainWindow_SpecTree"..Tree.."Increment", L"+" )
		ButtonSetText("WarbuilderMainWindow_SpecTree"..Tree.."Decrement", L"-" )
			
				ButtonSetDisabledFlag("WarbuilderMainWindow_SpecTree"..Tree.."Increment",not((TOTAL_POINTS_USED < MAX_MASTERY_POINTS) and ((Warbuilder.PathCounter[Tree]+Warbuilder.GearPoint[Tree])<15)))
				ButtonSetDisabledFlag("WarbuilderMainWindow_SpecTree"..Tree.."Decrement",not(Warbuilder.PathCounter[Tree]>0))	

		ButtonSetPressedFlag( "WarbuilderMainWindow_CheckBox"..Tree.."_Button", Warbuilder.GearPoint[Tree] >= 1 )		
				
		if Warbuilder.GearPoint[Tree] > 0 then	--Color for GearPoints
			WindowSetTintColor( "WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep1Empty", 20, 255, 20 )  
			LabelSetTextColor("WarbuilderMainWindow_SpecTree"..Tree.."SpecializationStep1Number", 20, 255, 20)		
		end
	--squigherder master reposition
		if Warbuilder.ParentOffsets[Tree].x == 0 or Warbuilder.ParentOffsets[Tree].x == nil then
			Warbuilder.ParentOffsets[Tree].x,Warbuilder.ParentOffsets[Tree].y = WindowGetOffsetFromParent("WarbuilderMainWindow_Tree"..Tree.."_Mastery1")
		else
				if #Warbuilder.Career[Warbuilder.SelectedCareer].Path[Tree].Core > 11 then
					WindowClearAnchors("WarbuilderMainWindow_Tree"..Tree.."_Mastery1")
					WindowAddAnchor("WarbuilderMainWindow_Tree"..Tree.."_Mastery1", "topleft","WarbuilderMainWindow", "topleft",Warbuilder.ParentOffsets[Tree].x-25,Warbuilder.ParentOffsets[Tree].y )		
				else
					WindowClearAnchors("WarbuilderMainWindow_Tree"..Tree.."_Mastery1")
					WindowAddAnchor("WarbuilderMainWindow_Tree"..Tree.."_Mastery1", "topleft","WarbuilderMainWindow", "topleft",Warbuilder.ParentOffsets[Tree].x,Warbuilder.ParentOffsets[Tree].y )		
				end
		end	
	
		
	end

	--Populate Core Abilitys
	for v=1, #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Ability do
		local CoreInfo = Warbuilder.Career[Warbuilder.SelectedCareer].Core.Ability[v]
		local texture, x, y, disabledTexture = GetIconData( CoreInfo.Icon )
		WindowSetShowing("WarbuilderMainWindow_Core"..v,true)		
		WindowSetShowing("WarbuilderMainWindow_Core"..v.."Glow",false)		
		DynamicImageSetTexture("WarbuilderMainWindow_Core"..v.."_ButtonIcon",texture, 64, 64)
		local FrameColor = Warbuilder.GetColorFromType(CoreInfo.Type)
		--WindowSetTintColor("WarbuilderMainWindow_Core"..v.."_ButtonFrame", FrameColor.r, FrameColor.g, FrameColor.b )
			WindowSetTintColor("WarbuilderMainWindow_Core"..v, FrameColor.r, FrameColor.g, FrameColor.b )
	
				WindowStartAlphaAnimation( "WarbuilderMainWindow_Core"..v.."Glow", Window.AnimationType.LOOP, 1.0, 0.0, 0.4, true, 0.0, 0 ) --start the pulse
				--WindowSetTintColor("WarbuilderMainWindow_Core"..v.."Glow", 255, 255, 255 )				
			--AnimatedImageStartAnimation ("WarbuilderMainWindow_Core"..v.."Glow", 0, true, true, 0)
			local Select_Or_Career = (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) == CoreInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) == CoreInfo.MinLevel)
			
		
			if Select_Or_Career == true then 
				WindowSetLayer("WarbuilderMainWindow_Core"..v,8) 
				LabelSetTextColor("WarbuilderMainWindow_Core"..v.."_LevelLabel", 255, 255, 25)
			else 
				WindowSetLayer("WarbuilderMainWindow_Core"..v,4) 
				LabelSetTextColor("WarbuilderMainWindow_Core"..v.."_LevelLabel", 255, 255, 255)				
			end
			
			LabelSetText("WarbuilderMainWindow_Core"..v.."_LevelLabel",towstring(CoreInfo.MinLevel))	
			WindowSetLayer("WarbuilderMainWindow_Core"..v.."_LevelLabel",WindowGetLayer("WarbuilderMainWindow_Core"..v)+1)
			
			WindowSetShowing("WarbuilderMainWindow_Core"..v.."Glow",Select_Or_Career)				
			if  (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) >= CoreInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) >= CoreInfo.MinLevel) then		
				WindowSetTintColor("WarbuilderMainWindow_Core"..v.."_ButtonIcon",255, 255,255 )		
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Core"..v, false)	
			else
				WindowSetTintColor("WarbuilderMainWindow_Core"..v.."_ButtonIcon",255, 75,75 )
				LabelSetTextColor("WarbuilderMainWindow_Core"..v.."_LevelLabel", 155, 155, 155)				
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Core"..v, true)	
			end
		
	end

	local NumberOfCoreAbilities = #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Ability
	for CoreRemover = NumberOfCoreAbilities+1 , 16 do
		WindowSetShowing("WarbuilderMainWindow_Core"..CoreRemover,false)
		LabelSetText("WarbuilderMainWindow_Core"..CoreRemover.."_LevelLabel",L"")
	end		

	--Populate Core Tactics	
	for TacticRemover = 2,30 do
		local TempTac1,TempTac2,TempTacParent,TempTacX,TempTacY = WindowGetAnchor("WarbuilderMainWindow_Tactic"..TacticRemover.."Button",1)
		WindowClearAnchors("WarbuilderMainWindow_Tactic"..TacticRemover.."Button")	
		WindowAddAnchor("WarbuilderMainWindow_Tactic"..TacticRemover.."Button",TempTac1, TempTacParent, TempTac2,-30, TempTacY )			
		WindowSetShowing("WarbuilderMainWindow_Tactic"..TacticRemover.."Button",false)
		ButtonSetPressedFlag("WarbuilderMainWindow_Tactic"..TacticRemover.."Button",false)	
		LabelSetText("WarbuilderMainWindow_Tactic"..TacticRemover.."Button_LevelLabel",L"")		
	end	

Total_Tactics = {}
	for Tacs=1, #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic do
		local CoreInfo = Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic[Tacs]
		local texture, x, y, disabledTexture = GetIconData( CoreInfo.Icon )
		Total_Tactics[Tacs] = CoreInfo
		--WindowSetShowing("WarbuilderMainWindow_Core"..Tacs,true)		
		DynamicImageSetTexture("WarbuilderMainWindow_Tactic"..Tacs.."ButtonIcon",texture, 64, 64)
		--ButtonSetDisabledFlag( "WarbuilderMainWindow_Tactic"..Tacs.."Button", true)		
		local FrameColor = Warbuilder.GetColorFromType(CoreInfo.Type)
		WindowSetShowing("WarbuilderMainWindow_Tactic"..Tacs.."Button",true)
		WindowSetShowing("WarbuilderMainWindow_Tactic"..Tacs.."ButtonGlow",false)		
					WindowSetTintColor("WarbuilderMainWindow_Tactic"..Tacs.."Button", FrameColor.r, FrameColor.g, FrameColor.b )
			
			local Select_Or_Career = (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) == CoreInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) == CoreInfo.MinLevel)
			WindowSetShowing("WarbuilderMainWindow_Tactic"..Tacs.."ButtonGlow",Select_Or_Career)
			if Select_Or_Career == true then 
				WindowSetLayer("WarbuilderMainWindow_Tactic"..Tacs.."Button",8)
				LabelSetTextColor("WarbuilderMainWindow_Tactic"..Tacs.."Button_LevelLabel", 255, 255, 25)	
			else 
				WindowSetLayer("WarbuilderMainWindow_Tactic"..Tacs.."Button",4) 
				LabelSetTextColor("WarbuilderMainWindow_Tactic"..Tacs.."Button_LevelLabel", 255, 255, 255)				
			end
			
			LabelSetText("WarbuilderMainWindow_Tactic"..Tacs.."Button_LevelLabel",towstring(CoreInfo.MinLevel))	
			WindowSetLayer("WarbuilderMainWindow_Tactic"..Tacs.."Button_LevelLabel",WindowGetLayer("WarbuilderMainWindow_Tactic"..Tacs.."Button")+1)
			
			--AnimatedImageStartAnimation ("WarbuilderMainWindow_Tactic"..Tacs.."ButtonGlow", 0, true, true, 0)
			WindowStartAlphaAnimation( "WarbuilderMainWindow_Tactic"..Tacs.."ButtonGlow", Window.AnimationType.LOOP, 1.0, 0.0, 0.4, true, 0.0, 0 ) --start the pulse				
				
	--	if ((CareerToLevel[TOTAL_POINTS_USED] or 1) >= CoreInfo.MinLevel) or TOTAL_POINTS_USED == 0 then	
		if   (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) >= CoreInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) >= CoreInfo.MinLevel) then					
			WindowSetTintColor("WarbuilderMainWindow_Tactic"..Tacs.."ButtonIcon",255, 255,255 )
			ButtonSetDisabledFlag( "WarbuilderMainWindow_Tactic"..Tacs.."Button", false)
			
		else
			WindowSetTintColor("WarbuilderMainWindow_Tactic"..Tacs.."ButtonIcon",255, 75,75 )
			ButtonSetDisabledFlag( "WarbuilderMainWindow_Tactic"..Tacs.."Button", true)	
				LabelSetTextColor("WarbuilderMainWindow_Tactic"..Tacs.."Button_LevelLabel", 155, 155, 155)				
			Warbuilder.SelectedTactics[Tacs] = false
		end
		WindowSetTintColor("WarbuilderMainWindow_Tactic"..Tacs.."ButtonGlow", FrameColor.r, FrameColor.g, FrameColor.b )	

	end		
	
	--Populate Core Morale	
Total_Morales = {}	
	for MoraleRemover = 1,14 do
		WindowSetShowing("WarbuilderMainWindow_Morale"..MoraleRemover.."Button",false)
		LabelSetText("WarbuilderMainWindow_Morale"..MoraleRemover.."Button_LevelLabel",L"")	
		if DoesWindowExist("WarbuilderMainWindow_Morale"..(MoraleRemover-1).."Button") then
			WindowClearAnchors( "WarbuilderMainWindow_Morale"..(MoraleRemover).."Button")
			WindowAddAnchor( "WarbuilderMainWindow_Morale"..(MoraleRemover).."Button", "right", "WarbuilderMainWindow_Morale"..(MoraleRemover-1).."Button", "left", -12, 0 )			
		end
		
	end	

	local FirstM2,FirstM3,FirstM4 = false,false,false
	for Moral=1, #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Morale do
		local MoraleInfo = Warbuilder.Career[Warbuilder.SelectedCareer].Core.Morale[Moral]
		local texture, x, y, disabledTexture = GetIconData( MoraleInfo.Icon )
		
		Total_Morales[Moral] = MoraleInfo
		--WindowSetShowing("WarbuilderMainWindow_Core"..Tacs,true)		
		CircleImageSetTexture("WarbuilderMainWindow_Morale"..Moral.."ButtonIcon",texture, 32, 32)
		--ButtonSetDisabledFlag( "WarbuilderMainWindow_Tactic"..Tacs.."Button", true)

		local Select_Or_Career = (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) == MoraleInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) == MoraleInfo.MinLevel)
			WindowSetShowing("WarbuilderMainWindow_Morale"..Moral.."ButtonGlow",Select_Or_Career)
		--	AnimatedImageStartAnimation ("WarbuilderMainWindow_Morale"..Moral.."ButtonGlow", 0, true, true, 0)
			WindowStartAlphaAnimation( "WarbuilderMainWindow_Morale"..Moral.."ButtonGlow", Window.AnimationType.LOOP, 1.0, 0.0, 0.4, true, 0.0, 0 ) --start the pulse
		if Select_Or_Career == true then 
			WindowSetLayer("WarbuilderMainWindow_Morale"..Moral.."Button",8) 
			LabelSetTextColor("WarbuilderMainWindow_Morale"..Moral.."Button_LevelLabel", 255, 255, 25)				
		else 
			WindowSetLayer("WarbuilderMainWindow_Morale"..Moral.."Button",4) 
			LabelSetTextColor("WarbuilderMainWindow_Morale"..Moral.."Button_LevelLabel", 255, 255, 255)				
		end	
				--WindowSetTintColor("WarbuilderMainWindow_Morale"..Moral.."ButtonGlow", 255, 255, 255 )				
			LabelSetText("WarbuilderMainWindow_Morale"..Moral.."Button_LevelLabel",towstring(MoraleInfo.MinLevel))	
			WindowSetLayer("WarbuilderMainWindow_Morale"..Moral.."Button_LevelLabel",WindowGetLayer("WarbuilderMainWindow_Morale"..Moral.."Button")+1)
		
		local FrameColor = Warbuilder.GetColorFromType(MoraleInfo.Type)
		WindowSetShowing("WarbuilderMainWindow_Morale"..Moral.."Button",true)
			WindowSetTintColor("WarbuilderMainWindow_Morale"..Moral.."Button", FrameColor.r, FrameColor.g, FrameColor.b )			
			--if ((CareerToLevel[TOTAL_POINTS_USED] or 1) >= MoraleInfo.MinLevel) or TOTAL_POINTS_USED == 0 then			
		if (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) >= MoraleInfo.MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) >= MoraleInfo.MinLevel) then		

			WindowSetTintColor("WarbuilderMainWindow_Morale"..Moral.."ButtonIcon",255, 255,255 )
			ButtonSetDisabledFlag( "WarbuilderMainWindow_Morale"..Moral.."Button", false)		
			else
				WindowSetTintColor("WarbuilderMainWindow_Morale"..Moral.."ButtonIcon",255, 75,75 )
				LabelSetTextColor("WarbuilderMainWindow_Morale"..Moral.."Button_LevelLabel", 155, 155, 155)					
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Morale"..Moral.."Button", true)	
				ButtonSetPressedFlag("WarbuilderMainWindow_Morale"..Moral.."Button",false)		
				if Warbuilder.SelectedMorales[MoraleInfo.Rank] == Moral then Warbuilder.SelectedMorales[MoraleInfo.Rank] = nil end				
			--	Warbuilder.SelectedMorales[Moral] = false
			end
		if MoraleInfo.Rank == 2 and (FirstM2 == false) then
			WindowClearAnchors( "WarbuilderMainWindow_Morale"..Moral.."Button")
			WindowAddAnchor( "WarbuilderMainWindow_Morale"..Moral.."Button", "right", "WarbuilderMainWindow_Morale"..(Moral-1).."Button", "left", 5, 0 )			
			FirstM2 = true
		end
		if MoraleInfo.Rank == 3 and (FirstM3 == false) then
			WindowClearAnchors( "WarbuilderMainWindow_Morale"..Moral.."Button")
			WindowAddAnchor( "WarbuilderMainWindow_Morale"..Moral.."Button", "right", "WarbuilderMainWindow_Morale"..(Moral-1).."Button", "left", 5, 0 )			
			FirstM3 = true
		end
		if MoraleInfo.Rank == 4 and (FirstM4 == false) then
			WindowClearAnchors( "WarbuilderMainWindow_Morale"..Moral.."Button")
			WindowAddAnchor( "WarbuilderMainWindow_Morale"..Moral.."Button", "right", "WarbuilderMainWindow_Morale"..(Moral-1).."Button", "left", 5, 0 )			
			FirstM4 = true
		end
		WindowSetTintColor("WarbuilderMainWindow_Morale"..Moral.."ButtonGlow", 229, 77,255 )	
	end		
		
		--Populate Specc Tactics/Morales	
	local NumberOfCoreTactics = #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic +1	
	local NumberOfCoreMorales = #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Morale +1		
	
	Warbuilder.TempSpecTacticsSlots = {}
	Warbuilder.TempSpecTactics = {}
	Warbuilder.TempSpecMorales = {}
	
	local TempTac1,TempTac2,TempTacParent,TempTacX,TempTacY = WindowGetAnchor("WarbuilderMainWindow_Tactic"..NumberOfCoreTactics.."Button",1)
	WindowClearAnchors("WarbuilderMainWindow_Tactic"..NumberOfCoreTactics.."Button")	
	WindowAddAnchor("WarbuilderMainWindow_Tactic"..NumberOfCoreTactics.."Button",TempTac1, TempTacParent, TempTac2,-8, TempTacY )			
			
	for Q=1,3 do	
		Warbuilder.TempSpecTacticsSlots[Q]={}	
		for Z=1,7 do
			local TacticInfo = Warbuilder.Career[Warbuilder.SelectedCareer].Path[Q][Z]
			local MoraleInfo = Warbuilder.Career[Warbuilder.SelectedCareer].Path[Q][Z]			
			if TacticInfo.Type == 1 then
				local texture, x, y, disabledTexture = GetIconData( TacticInfo.Icon )
				Warbuilder.TempSpecTactics[NumberOfCoreTactics] = TacticInfo
				Warbuilder.TempSpecTactics[NumberOfCoreTactics].Path = Q
	
				Total_Tactics[NumberOfCoreTactics] = TacticInfo
	
				Warbuilder.TempSpecTacticsSlots[Q][Z] = NumberOfCoreTactics
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Tactic"..NumberOfCoreTactics.."Button", true)	
				ButtonSetPressedFlag("WarbuilderMainWindow_Tactic"..NumberOfCoreTactics.."Button",false)		
				WindowSetShowing("WarbuilderMainWindow_Tactic"..NumberOfCoreTactics.."Button",true)
				DynamicImageSetTexture("WarbuilderMainWindow_Tactic"..(NumberOfCoreTactics).."ButtonIcon",texture, 64, 64)
				WindowSetTintColor("WarbuilderMainWindow_Tactic"..(NumberOfCoreTactics).."Button", 255, 0,0 )
				WindowSetTintColor("WarbuilderMainWindow_Tactic"..(NumberOfCoreTactics).."ButtonIcon",255, 75,75 )		
				WindowSetShowing("WarbuilderMainWindow_Tactic"..(NumberOfCoreTactics).."ButtonGlow",false)
				if Warbuilder.BoughtAbilitys[Q][Z] == true then 							
					ButtonSetDisabledFlag( "WarbuilderMainWindow_Tactic"..NumberOfCoreTactics.."Button", false)	
					WindowSetTintColor("WarbuilderMainWindow_Tactic"..(NumberOfCoreTactics).."ButtonIcon",255, 255,255 )
				else
					Warbuilder.SelectedTactics[NumberOfCoreTactics] = false
				end				
				NumberOfCoreTactics = NumberOfCoreTactics +1
											
			end			
			if MoraleInfo.Type == 3 then
				local texture, x, y, disabledTexture = GetIconData( MoraleInfo.Icon )
				Total_Morales[NumberOfCoreMorales] = MoraleInfo		
				Warbuilder.TempSpecMorales[NumberOfCoreMorales] = MoraleInfo
				Warbuilder.TempSpecMorales[NumberOfCoreMorales].Path = Q
				WindowSetShowing("WarbuilderMainWindow_Morale"..NumberOfCoreMorales.."Button",true)
				CircleImageSetTexture("WarbuilderMainWindow_Morale"..(NumberOfCoreMorales).."ButtonIcon",texture, 32, 32)
				WindowSetTintColor("WarbuilderMainWindow_Morale"..(NumberOfCoreMorales).."Button", 255, 0,0 )
				ButtonSetDisabledFlag( "WarbuilderMainWindow_Morale"..(NumberOfCoreMorales).."Button", true)
				ButtonSetPressedFlag("WarbuilderMainWindow_Morale"..NumberOfCoreMorales.."Button",false)					
				WindowSetTintColor("WarbuilderMainWindow_Morale"..(NumberOfCoreMorales).."ButtonIcon",255, 75,75 )
				WindowSetShowing("WarbuilderMainWindow_Morale"..(NumberOfCoreMorales).."ButtonGlow",false)				
				if Warbuilder.BoughtAbilitys[Q][Z] == true then 
					ButtonSetDisabledFlag( "WarbuilderMainWindow_Morale"..(NumberOfCoreMorales).."Button", false)	
					WindowSetTintColor("WarbuilderMainWindow_Morale"..(NumberOfCoreMorales).."ButtonIcon",255, 255,255 )
				else	--Check and set/reset Selected Morales
				if Warbuilder.SelectedMorales[MoraleInfo.Rank] == NumberOfCoreMorales then Warbuilder.SelectedMorales[MoraleInfo.Rank] = nil end
				end		
				WindowSetTintColor("WarbuilderMainWindow_Morale"..NumberOfCoreMorales.."ButtonGlow", 229, 77,255 )	
				NumberOfCoreMorales = NumberOfCoreMorales +1
			end
		end				
	end
Warbuilder.CheckSelectedTactics()
Warbuilder.CheckSelectedMorales()
WindowSetLayer("WarbuilderMainWindowCombo",9) 

local CurrentLevelThreshold = 0 

	if CareerToLevel[TOTAL_POINTS_USED] == nil then CareerToLevel[TOTAL_POINTS_USED] = 0 end

	if Warbuilder.SelectedLevel ~= 0 then
		if Warbuilder.SelectedLevel/10 >= 1 then CurrentLevelThreshold = 1 end
		if Warbuilder.SelectedLevel/20 >= 1 then CurrentLevelThreshold = 2 end
		if Warbuilder.SelectedLevel/30 >= 1 then CurrentLevelThreshold = 3 end
		if Warbuilder.SelectedLevel/40 >= 1 then CurrentLevelThreshold = 4 end
		
		
		
	elseif Warbuilder.SelectedLevel == 0 and (CareerToLevel[TOTAL_POINTS_USED-(Warbuilder.SelectedRenown)] or 0) > 10 then
		if CareerToLevel[TOTAL_POINTS_USED-(Warbuilder.SelectedRenown)] >= 10 then CurrentLevelThreshold = 1 end
		if CareerToLevel[TOTAL_POINTS_USED-(Warbuilder.SelectedRenown)] >= 20 then CurrentLevelThreshold = 2 end
		if CareerToLevel[TOTAL_POINTS_USED-(Warbuilder.SelectedRenown)] >= 30 then CurrentLevelThreshold = 3 end
		if CareerToLevel[TOTAL_POINTS_USED-(Warbuilder.SelectedRenown)] >= 40 then CurrentLevelThreshold = 4 end	
	end

	for i=1,4 do
		local texture, x, y, disabledTexture = GetIconData(152)
		LabelSetText("TestTactic"..i.."Name",L"Empty")
		DynamicImageSetTexture("TestTactic"..i.."Icon",texture, 64, 64)
		WindowSetAlpha("TestTactic"..i,0.5)
		WindowSetShowing("TestTactic"..i,false)
		if CurrentLevelThreshold >= i then WindowSetShowing("TestTactic"..i,true)	end
		if Warbuilder.SelectedMorales[i] then
			local textureX, x, y, disabledTexture = GetIconData( Total_Morales[Warbuilder.SelectedMorales[i]].Icon )
			CircleImageSetTexture("TestMorale"..i.."Icon",textureX, 32, 32)
			LabelSetText("TestMorale"..i.."Name",towstring(GetAbilityName(Total_Morales[Warbuilder.SelectedMorales[i]].ID)))
			WindowSetAlpha("TestMorale"..i,1)
		else
			local textureX, x, y, disabledTexture = GetIconData( 20 )
			CircleImageSetTexture("TestMorale"..i.."Icon",textureX, 32, 32)
			LabelSetText("TestMorale"..i.."Name",L"Empty")
			WindowSetAlpha("TestMorale"..i,0.5)		
		end
	end
	--Total_Morales
	--Warbuilder.SelectedMorales

local TacNum = 1
	for k,v in pairs(Warbuilder.SelectedTactics) do
	local texture, x, y, disabledTexture = GetIconData( Total_Tactics[k].Icon )
	--Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic[k].ID
	LabelSetText("TestTactic"..TacNum.."Name",towstring(GetAbilityName(Total_Tactics[k].ID)))
	DynamicImageSetTexture("TestTactic"..TacNum.."Icon",texture, 64, 64)
	WindowSetAlpha("TestTactic"..TacNum,1)
	TacNum = TacNum+1
	end
return
end

-- Function for getting the amount of ability points spent
function Warbuilder.CheckPointsUsed()
	local BOUGHT_ABILITIES = 0
		for Tree=1, 3 do
		Warbuilder.PointsInTree[Tree] = 0
			for index=1, 7 do  	
				if Warbuilder.BoughtAbilitys[Tree][index] then	--Set Selected / Bought stuff
					BOUGHT_ABILITIES = BOUGHT_ABILITIES+1
					Warbuilder.PointsInTree[Tree] = Warbuilder.PointsInTree[Tree]+1
				end
			end
		end
	local POINTS_USED = Warbuilder.PathCounter[1] + Warbuilder.PathCounter[2] + Warbuilder.PathCounter[3] + BOUGHT_ABILITIES
	return POINTS_USED
end

--Tooltip stuff
function Warbuilder.overtooltip()
	local WinParent = WindowGetParent(SystemData.MouseOverWindow.name)	
	local WindowName = SystemData.MouseOverWindow.name
	local ToolTipSelect = nil
	local ToolTipAbilityPath = nil
	local ToolTipAbilityLevel = nil
	
	if not string.find(tostring(WindowName),"_PathFrame") and not string.find(tostring(WindowName),"_Clear_") and not string.find(tostring(WindowName),"_CheckBox") then	
		
		if string.find(tostring(WindowName),"_SpecButton") then	
			local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]Tree(%d+)."))
			local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]SpecButton(%d+)."))

			ToolTipSelect = Warbuilder.Career[Warbuilder.SelectedCareer].Path[TreeNumber][ButtonNumber]
			ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_SPECIALIZATION_TITLE, { GetSpecializationPathName((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-TreeNumber))})		
			ToolTipAbilityLevel = Warbuilder.PathCounter[TreeNumber] + Warbuilder.GearPoint[TreeNumber] + (MasteryToLevel[TOTAL_POINTS_USED] or 1)	
				--mastery abilitys	tooltips
		elseif string.find(tostring(WindowName),"_Mastery") then	
			local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]Tree(%d+)."))
			local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]Mastery(%d+)."))

			ToolTipSelect = Warbuilder.Career[Warbuilder.SelectedCareer].Path[TreeNumber].Core[ButtonNumber]
			ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_SPECIALIZATION_TITLE, { GetSpecializationPathName((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-TreeNumber))})
			ToolTipAbilityLevel = Warbuilder.PathCounter[TreeNumber] + Warbuilder.GearPoint[TreeNumber] + (MasteryToLevel[TOTAL_POINTS_USED] or 1)				
				--core abilitys tooltips
		elseif string.find(tostring(WindowName),"_Core") then		
			local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]_Core(%d+)."))
			ToolTipSelect = Warbuilder.Career[Warbuilder.SelectedCareer].Core.Ability[ButtonNumber] or 1
			ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_NO_SPECIALIZATION_PATH,{})
			if Warbuilder.SelectedLevel > 0 then ToolTipAbilityLevel = Warbuilder.SelectedLevel else ToolTipAbilityLevel =(CareerToLevel[TOTAL_POINTS_USED] or 1) end
				--Tactics tooltips
		elseif string.find(tostring(WindowName),"_Tactic") then	
			local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]_Tactic(%d+)."))		
			if ButtonNumber <= #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic then	
				ToolTipSelect = Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic[ButtonNumber]
				ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_NO_SPECIALIZATION_PATH,{})
				if Warbuilder.SelectedLevel > 0 then ToolTipAbilityLevel = Warbuilder.SelectedLevel else ToolTipAbilityLevel =(CareerToLevel[TOTAL_POINTS_USED] or 1) end
			else
				ToolTipSelect = Warbuilder.TempSpecTactics[ButtonNumber]
				ToolTipAbilityLevel = (Warbuilder.PathCounter[Warbuilder.TempSpecTactics[ButtonNumber].Path] or 0) + (MasteryToLevel[TOTAL_POINTS_USED] or 1)
				ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_SPECIALIZATION_TITLE, { GetSpecializationPathName((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-Warbuilder.TempSpecTactics[ButtonNumber].Path))})				
			end
				--Morales Tooltip
		elseif string.find(tostring(WindowName),"_Morale") then	
			local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]_Morale(%d+)."))

			if ButtonNumber <= #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Morale then	
				if Total_Morales[ButtonNumber].Path~= nil then
				ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_SPECIALIZATION_TITLE, { GetSpecializationPathName((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-Total_Morales[ButtonNumber].Path))})				
				else
				ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_NO_SPECIALIZATION_PATH,{})
				end
				
				if Warbuilder.SelectedLevel > 0 then ToolTipAbilityLevel = Warbuilder.SelectedLevel else ToolTipAbilityLevel =(CareerToLevel[TOTAL_POINTS_USED] or 1) end
			else				
				ToolTipAbilityLevel = (Warbuilder.PathCounter[Warbuilder.TempSpecMorales[ButtonNumber].Path] or 0) + (MasteryToLevel[TOTAL_POINTS_USED] or 1)
				ToolTipAbilityPath = GetStringFormat(StringTables.Default.LABEL_SPECIALIZATION_TITLE, { GetSpecializationPathName((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-Total_Morales[ButtonNumber].Path))})				
			end
			ToolTipSelect = Total_Morales[ButtonNumber]
			ToolTipCost =  GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_MORALE_COST,{Total_Morales[ButtonNumber].Rank})
		end
			--make the tooltip from above info	
			ToolTipAbilityName = towstring(GetAbilityName(ToolTipSelect.ID))
			ToolTipAbilityDesc = towstring(GetAbilityDesc(ToolTipSelect.ID,ToolTipAbilityLevel))
			ToolTipMinAbilityLevel = towstring(ToolTipSelect.MinLevel)
			ToolTipAbilityType2 = Warbuilder.GetType(ToolTipSelect.Type)

			ToolTipReq =  GetAbilityRequirements(ToolTipSelect.ID )
			ToolTipCD = CooldownText(GetAbilityCooldown( ToolTipSelect.ID ) / 1000)
			ToolTipRange = RangeText(ToolTipSelect.ID)
			ToolTipType = Warbuilder.GetBuffType(ToolTipSelect.BuffType)
			
				if ToolTipSelect.Type == 1 then
					ToolTipCast = GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_PASSIVE_CAST,{})
					ToolTipCost = GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_TACTIC_COST,{1,towstring(GetStringFormat(StringTables.Default.LABEL_GUILD_SORT_CAREER_BUTTON,{}))})
				elseif ToolTipSelect.Type == 3 then
					ToolTipCast = CastTimeText(ToolTipSelect.ID)  
					ToolTipCost = GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_MORALE_COST,{ToolTipSelect.Rank})
				else
					ToolTipCast = CastTimeText(ToolTipSelect.ID)  
					ToolTipCost = CostText (ToolTipSelect.ID )
				end

		ToolTipColor = Warbuilder.GetColorFromType(ToolTipSelect.Type)

				
		Tooltips.CreateTextOnlyTooltip( SystemData.ActiveWindow.name, nil)	
		Tooltips.SetTooltipColor(1, 1, ToolTipColor.r, ToolTipColor.g, ToolTipColor.b)
		Tooltips.SetTooltipText (1, 1, ToolTipAbilityName)	--Topleft name
		
		Tooltips.SetTooltipColor(1, 2, ToolTipColor.r, ToolTipColor.g, ToolTipColor.b)	
		Tooltips.SetTooltipText (1, 2,towstring(ToolTipAbilityType2)..L" ("..towstring(ToolTipType)..L")")	--topright Ability Family
		
		Tooltips.SetTooltipText (2, 1,ToolTipAbilityPath)
		Tooltips.SetTooltipText (2, 3, L"Level "..towstring(ToolTipAbilityLevel)..L" ("..towstring(ToolTipMinAbilityLevel)..L")")
		
		Tooltips.SetTooltipText (3, 1,towstring(ToolTipCost))
		Tooltips.SetTooltipText (3, 3, towstring(ToolTipRange))
		
		Tooltips.SetTooltipText (4, 1,towstring(ToolTipCast))
		Tooltips.SetTooltipText (4, 3, towstring(ToolTipCD))
		
	   local reqs = ToolTipReq    
		for i = 1, 5
		do      
			if ((ToolTipReq[i] ~= nil) )
			then
			Tooltips.SetTooltipColor (4+i, 1, 145,145,255)	
			Tooltips.SetTooltipText (4+i, 1, towstring(reqs[i]))	
			else
			Tooltips.SetTooltipText (4+i, 1, L" ")  
		   end
		end
		
		Tooltips.SetTooltipColor (10, 1, 255,200,100)	
		Tooltips.SetTooltipText (10, 1, towstring(ToolTipAbilityDesc)..L"")	
		Tooltips.SetTooltipColor (11, 1, 225,50,50)	
			if Warbuilder.Debug == true then	
				Tooltips.SetTooltipText (11, 1, L"ID:"..towstring(ToolTipSelect.ID)..L" ,Icon:"..towstring(ToolTipSelect.Icon))	
			else
				Tooltips.SetTooltipText (11, 1,L"")	
			end
		Tooltips.SetTooltipColor (12, 1, 0,200,0)	
		Tooltips.SetTooltipText (12, 1, L"Shift+<icon00092>LMB to Link, Alt+<icon00092>LMB to Popup<br>Ctrl+<icon00092>LMB to Drag & Drop on Hotbar<br> <br> <br>")
		Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_RIGHT)
		Tooltips.Finalize()	
	end		
	--special button tooltips
	
	if string.find(tostring(WindowName),"_PathFrame") then
		local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]_PathFrame(%d+)."))
		Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name, nil)
		Tooltips.SetTooltipColor (1, 1, 255,209,77)	
		Tooltips.SetTooltipText (1, 1, 	GetStringFormat(StringTables.Default.LABEL_SPECIALIZATION_TITLE, { GetSpecializationPathName((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-ButtonNumber))}))
		TooltipFormatedText = GetSpecializationPathDescription((3*Warbuilder.Career[Warbuilder.SelectedCareer].Line)-(3-ButtonNumber))
		TooltipFormatedText = string.match(tostring(TooltipFormatedText),"(.+)%.+.")
		Tooltips.SetTooltipColor (2, 1, 255,200,100)	
		Tooltips.SetTooltipText (2, 1,towstring(TooltipFormatedText))	
		Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_RIGHT)
		Tooltips.Finalize()	
	end
	--The clear button tooltip
	if string.find(tostring(WindowName),"_Clear") then
		Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name, nil)
		Tooltips.SetTooltipColor (1, 1, 255,209,77)	
		Tooltips.SetTooltipText (1, 1, L"Clear")
		Tooltips.SetTooltipColor (2, 1, 255,200,100)	
		Tooltips.SetTooltipText (2, 1,L"Clears the current Path")	
		Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_RIGHT)
		Tooltips.Finalize()	
	end
	--The Checkbox tooltip
	if string.find(tostring(WindowName),"_CheckBox") then
		Tooltips.CreateTextOnlyTooltip(SystemData.ActiveWindow.name, nil)
		Tooltips.SetTooltipColor (1, 1, 255,209,77)	
		Tooltips.SetTooltipText (1, 1, L"Gear Point")
		Tooltips.SetTooltipColor (2, 1, 255,200,100)	
		Tooltips.SetTooltipText (2, 1,L"Adds a point that would be granted from gear set bonus")	
		Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_RIGHT)
		Tooltips.Finalize()	
	end
	
end	

function Warbuilder.OnTabLBU(flags)
				local ClickedAbility = nil
				local LinkLevel = nil
	local WindowName = SystemData.MouseOverWindow.name
		--Ability Purchase
		if string.find(tostring(WindowName),"_SpecButton") then	
			local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]Tree(%d+)."))
			local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]SpecButton(%d+)."))
			
			if flags == 0 then
			
			if ((Warbuilder.PathCounter[TreeNumber]+Warbuilder.GearPoint[TreeNumber]) >= Warbuilder.PathBuyConvert[ButtonNumber]) then
				if (MAX_MASTERY_POINTS > TOTAL_POINTS_USED) then
					Warbuilder.BoughtAbilitys[TreeNumber][ButtonNumber] = not Warbuilder.BoughtAbilitys[TreeNumber][ButtonNumber]
				else	
				Warbuilder.BoughtAbilitys[TreeNumber][ButtonNumber] = false
				end
			else	--Quick Click Populate
				while ((MAX_MASTERY_POINTS-TOTAL_POINTS_USED) > 0) and(Warbuilder.PathCounter[TreeNumber]+Warbuilder.GearPoint[TreeNumber]) < Warbuilder.PathBuyConvert[ButtonNumber] do 
					Warbuilder.PathCounter[TreeNumber] = Warbuilder.PathCounter[TreeNumber]+1
					TOTAL_POINTS_USED = Warbuilder.CheckPointsUsed() 
				end		
				if (MAX_MASTERY_POINTS > TOTAL_POINTS_USED) then
					Warbuilder.BoughtAbilitys[TreeNumber][ButtonNumber] = not Warbuilder.BoughtAbilitys[TreeNumber][ButtonNumber]
				end
			end	
			
		end

				ClickedAbility = Warbuilder.Career[Warbuilder.SelectedCareer].Path[TreeNumber][ButtonNumber]
				LinkLevel = Warbuilder.PathCounter[TreeNumber] + Warbuilder.GearPoint[TreeNumber] + (MasteryToLevel[TOTAL_POINTS_USED] or 1)	

			Warbuilder.OnUpdate()	
		elseif string.find(tostring(WindowName),"_Clear_") then	
			local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]Tree(%d+)."))
			Warbuilder.PathCounter[TreeNumber] = 0
			for i=1, 7 do 	
				Warbuilder.BoughtAbilitys[TreeNumber][i] = false
			end	
			Warbuilder.OnUpdate()		
		end
			
	if string.find(tostring(WindowName),"_CheckBox") then
			local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]_CheckBox(%d+)."))		
				if Warbuilder.GearPoint[TreeNumber] >= 1 then Warbuilder.GearPoint[TreeNumber] = 0 else Warbuilder.GearPoint[TreeNumber] = 1	end
				Warbuilder.OnUpdate()
	end	
	
	--Mastery Linking
	if string.find(tostring(WindowName),"_Mastery") then	
			local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]Tree(%d+)."))
			local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]_Mastery(%d+)."))
		
				ClickedAbility = Warbuilder.Career[Warbuilder.SelectedCareer].Path[TreeNumber].Core[ButtonNumber]
				LinkLevel = Warbuilder.PathCounter[TreeNumber] + Warbuilder.GearPoint[TreeNumber] + (MasteryToLevel[TOTAL_POINTS_USED] or 1)				
	end
	
	--Core Linking
	if string.find(tostring(WindowName),"_Core") then	
				local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]_Core(%d+)."))	
				
			if Warbuilder.SelectedLevel > 0 then LinkLevel = Warbuilder.SelectedLevel else LinkLevel =(CareerToLevel[TOTAL_POINTS_USED] or 1) end
			ClickedAbility = Warbuilder.Career[Warbuilder.SelectedCareer].Core.Ability[ButtonNumber]
	end
	
--Select Tactics
	if string.find(tostring(WindowName),"_Tactic") then
		local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]_Tactic(%d+)."))						
		
			if TreeNumber <= #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic then	
				if Warbuilder.SelectedLevel > 0 then LinkLevel = Warbuilder.SelectedLevel else LinkLevel =(CareerToLevel[TOTAL_POINTS_USED] or 1) end
			else
				LinkLevel = (Warbuilder.PathCounter[Warbuilder.TempSpecTactics[TreeNumber].Path] or 0) + (MasteryToLevel[TOTAL_POINTS_USED] or 1)
			end
				ClickedAbility = Total_Tactics[TreeNumber]
		
		local Total_Selected_Tactics = 0
		for k,v in pairs(Warbuilder.SelectedTactics) do
			Total_Selected_Tactics = Total_Selected_Tactics + 1
		--	if (Warbuilder.SelectedLevel ~= 0 and (Warbuilder.SelectedLevel) >= Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic[TreeNumber].MinLevel) or Warbuilder.SelectedLevel == 0 and ((CareerToLevel[TOTAL_POINTS_USED] or 0) >= Warbuilder.Career[Warbuilder.SelectedCareer].Core.Tactic[TreeNumber].MinLevel) then						
		end		
		
		if flags == 0 then
			if Total_Selected_Tactics < 4 then
				Warbuilder.SelectedTactics[TreeNumber] = not Warbuilder.SelectedTactics[TreeNumber]
			else
				Warbuilder.SelectedTactics[TreeNumber] = false
			end
		end
	end			
--Select Morales	
	if string.find(tostring(WindowName),"_Morale") then	
	
		local TreeNumber = tonumber(string.match(tostring(WindowName),"[^%.]_Morale(%d+)."))
		local ClickedMorale = Total_Morales[TreeNumber].Rank
			--Linking Test
			if TreeNumber <= #Warbuilder.Career[Warbuilder.SelectedCareer].Core.Morale then	
				if Warbuilder.SelectedLevel > 0 then LinkLevel = Warbuilder.SelectedLevel else LinkLevel =(CareerToLevel[TOTAL_POINTS_USED] or 1) end
			else				
				LinkLevel = (Warbuilder.PathCounter[Warbuilder.TempSpecMorales[TreeNumber].Path] or 0) + (MasteryToLevel[TOTAL_POINTS_USED] or 1)
			end		
			ClickedAbility = Total_Morales[TreeNumber]	
			
			if flags == 0 then
				if Warbuilder.SelectedMorales[ClickedMorale] ~= TreeNumber and ButtonGetDisabledFlag( "WarbuilderMainWindow_Morale"..TreeNumber.."Button" ) == false then Warbuilder.SelectedMorales[ClickedMorale] = TreeNumber else Warbuilder.SelectedMorales[ClickedMorale] = nil end
			end
			
			end			
	--Ability Linking
	if ClickedAbility ~= nil then
		local LinkData = "ABILITY: "..tonumber(ClickedAbility.ID)..";"..tonumber(LinkLevel)..";"..tonumber(ClickedAbility.Type)..";"..tonumber(Warbuilder.SelectedCareer)..";"..tonumber(ClickedAbility.Path or 0)..";"..tonumber(ClickedAbility.BuffType)..";"..tonumber(ClickedAbility.MinLevel)..";"..tostring(ClickedAbility.Icon)..";"..tostring(ClickedAbility.Rank or 0)..";"..tostring(GameData.Player.name)
		local LinkName = L"["..towstring(Warbuilder.GetType(ClickedAbility.Type))..L": "..towstring(GetAbilityName(ClickedAbility.ID))..L"]"
		local FrameColor = Warbuilder.GetColorFromType(ClickedAbility.Type)	
		local DoneLink = CreateHyperLink(towstring(LinkData),LinkName, {FrameColor.r,FrameColor.g,FrameColor.b}, {} )	
			if (flags == SystemData.ButtonFlags.ALT) then 	
				OnHyperLinkLButtonUp(towstring(LinkData))
				elseif (flags == SystemData.ButtonFlags.SHIFT) then 
			EA_ChatWindow.InsertText(towstring(DoneLink))
			elseif (flags == SystemData.ButtonFlags.CONTROL) then 
			Cursor.PickUp( Cursor.SOURCE_ACTION_LIST, index, tonumber(ClickedAbility.ID), tonumber(ClickedAbility.Icon), false )
			end		
	end
	
	Warbuilder.OnUpdate()
end

function Warbuilder.CheckSelectedTactics()
	for k,v in pairs(Warbuilder.SelectedTactics) do
		ButtonSetPressedFlag("WarbuilderMainWindow_Tactic"..k.."Button",v)
		if v == true then
			WindowSetTintColor("WarbuilderMainWindow_Tactic"..k.."Button", 255,255,0 )
			WindowSetTintColor("WarbuilderMainWindow_Tactic"..k.."ButtonIcon",255, 255,255 )
			WindowSetTintColor("WarbuilderMainWindow_Tactic"..k.."ButtonGlow", 0, 0,255 )		
		else
			Warbuilder.SelectedTactics[k] = nil
		end
	end
end

function Warbuilder.CheckSelectedMorales()
	for k,v in pairs(Warbuilder.SelectedMorales) do
		ButtonSetPressedFlag("WarbuilderMainWindow_Morale"..v.."Button",true)
		WindowSetTintColor("WarbuilderMainWindow_Morale"..v.."Button", 255,255,0 )
		WindowSetTintColor("WarbuilderMainWindow_Morale"..v.."ButtonIcon",255, 255,255 )
		WindowSetTintColor("WarbuilderMainWindow_Morale"..v.."ButtonGlow", 229, 77,255 )		
	end
end

function Warbuilder.GetBuffType(BuffType)
	local ToolTipType = nil
	if BuffType == 0 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_BUFF)
		elseif BuffType == 1 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_DEBUFF)
		elseif BuffType == 2 then ToolTipType = GetString (StringTables.Default.LABEL_FILTER_DAMAGE)
		elseif BuffType == 3 then ToolTipType = GetString (StringTables.Default.LABEL_FILTER_HEALING)
		elseif BuffType == 4 then ToolTipType = GetString (StringTables.Default.LABEL_FILTER_DEFENSE)
		elseif BuffType == 5 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_HEX)
		elseif BuffType == 6 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_CURSE)
		elseif BuffType == 7 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_AILMENT)
		elseif BuffType == 8 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_BLESSING)
		elseif BuffType == 9 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_ENCHANTMENT)
		elseif BuffType == 10 then ToolTipType = GetString (StringTables.Default.LABEL_FILTER_OFFENSE)
		elseif BuffType == 11 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_CRIPPLE)
		elseif BuffType == 12 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_AUGMENTATION) --Aura
		elseif BuffType == 13 then ToolTipType = L""
		elseif BuffType == 14 then ToolTipType = GetString (StringTables.Default.LABEL_FILTER_DAMAGE)
		elseif BuffType == 15 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_DEBUFF)
		elseif BuffType == 16 then ToolTipType = GetString (StringTables.Default.LABEL_ABILITY_TYPE_CURSE)
	end
	return ToolTipType
end


function Warbuilder.GetType(Type)
	local ToolTipType = nil
	if Type == 0 then ToolTipType = L""
		elseif Type == 1 then ToolTipType = GetString (StringTables.Default.LABEL_TACTICS)
		elseif Type == 2 then ToolTipType = L"Ability"
		elseif Type == 3 then ToolTipType = GetString (StringTables.Default.LABEL_MORALE)
		elseif Type == 4 then ToolTipType = L"Pet"
	end
	return ToolTipType
end

function Warbuilder.GetColorFromType(Type)
	local ToolTipColor = nil
	if Type == 0 then ToolTipColor = {r=255,g=255,b=255}
		elseif Type == 1 then ToolTipColor = {r=77,g=188,b=255}
		elseif Type == 2 then ToolTipColor = {r=0,g=255,b=0}
		elseif Type == 3 then ToolTipColor = {r=229,g=77,b=255}
		elseif Type == 4 then ToolTipColor = {r=255,g=255,b=0}
	end
	return ToolTipColor
end

function Warbuilder.Command(input)
	if (input == "") then
		WindowSetShowing("WarbuilderMainWindow",true)
	 elseif (input ~= "") and (input ~= "0") then
		ComboBoxSetSelectedMenuItem("WarbuilderMainWindowCombo",tonumber(input) or 1)
		Warbuilder.SelectedCareer = tonumber(input) or 1
		WindowSetShowing("WarbuilderMainWindow",true)
		Warbuilder.Reset()	
	else
		Warbuilder.ImportCurrent()
		WindowSetShowing("WarbuilderMainWindow",true)
	end		
end

function Warbuilder.ShowCareer()
	local WindowName = WindowGetParent(SystemData.ActiveWindow.name)
	local CareerNumber = LabelGetText(WindowName.."HiddenCareer")
	Warbuilder.Command(CareerNumber)
end

function Warbuilder.Close()
	local WindowName = SystemData.MouseOverWindow.name
	local ButtonNumber = tonumber(string.match(tostring(WindowName),"(^%.+)Close"))
	WindowSetShowing("WarbuilderMainWindow",false)
end

function Warbuilder.AbilityLinkClose()
	local WindowName = SystemData.MouseOverWindow.name
	local ButtonNumber = string.match(tostring(WindowName),"(.+)Close")
	DestroyWindow(ButtonNumber)
end

function Warbuilder.Reset()
			--reset all counters
		for Tree=1, 3 do
			Warbuilder.PathCounter[Tree] = 0
			for i=1, 7 do 	
				Warbuilder.BoughtAbilitys[Tree][i] = false
			end
		end	
		
	Warbuilder.PointsInTree = {[1]=0,[2]=0,[3]=0}
	Warbuilder.GearPoint = {[1]=0,[2]=0,[3]=0}
	Warbuilder.PathCounter = {[1]=0,[2]=0,[3]=0}
		
	Warbuilder.SelectedMorales	= {}	
	Warbuilder.SelectedTactics = {}
	Warbuilder.OnUpdate()	
return
end


function Warbuilder.MenuSelect(idx)
	Warbuilder.SelectedCareer = idx
	PlaySound(313)
	
	Warbuilder.Reset()
	Warbuilder.OnUpdate()
end

function Warbuilder.ComboBoxUpdate(idx)
local BoxNumber	= WindowGetId (SystemData.ActiveWindow.name)
	if BoxNumber == 1 then
		Warbuilder.SelectedLevel = idx-1
	elseif BoxNumber == 2 then
		Warbuilder.SelectedRenown = idx-1	
	end	

	Warbuilder.OnUpdate()
end

function Warbuilder.ChangeLvl()
local WindowName = SystemData.ActiveWindow.name
local BoxNumber	= WindowGetId (SystemData.ActiveWindow.name)
if BoxNumber == 1 or BoxNumber == 2 then

	if BoxNumber == 1 and Warbuilder.SelectedLevel < 40 then
		Warbuilder.SelectedLevel = Warbuilder.SelectedLevel+1
	elseif BoxNumber == 2 and Warbuilder.SelectedLevel > 0 then
		Warbuilder.SelectedLevel = Warbuilder.SelectedLevel-1
	end	
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowComboLevelSelect",Warbuilder.SelectedLevel+1)	
	Warbuilder.OnUpdate()
	
	elseif BoxNumber == 3 or BoxNumber == 4 then
	local windowName = WindowGetParent(WindowName)
	if BoxNumber == 3 and ComboBoxGetSelectedMenuItem(windowName.."ComboLevelSelect") < 40 then
		Warbuilder.LinkLevel(ComboBoxGetSelectedMenuItem(windowName.."ComboLevelSelect") + 1)	
	elseif BoxNumber == 4 and ComboBoxGetSelectedMenuItem(windowName.."ComboLevelSelect") > 0 then
		Warbuilder.LinkLevel(ComboBoxGetSelectedMenuItem(windowName.."ComboLevelSelect") - 1)
	end




-- local AbilityDesc = towstring(GetAbilityDesc(tonumber(SplitTable[1]),tonumber(idx))) ComboBoxGetSelectedMenuItem(WindowName.."ComboLevelSelect"
--		ComboBoxSetSelectedMenuItem(windowName.."ComboLevelSelect",tonumber(AbilityLvl))
end
	
	
end




function Warbuilder.Increment()
	local WindowName = SystemData.MouseOverWindow.name
	local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]Tree(%d+)."))	
	if (Warbuilder.PathCounter[ButtonNumber]+Warbuilder.GearPoint[ButtonNumber] < 15) and (MAX_MASTERY_POINTS > TOTAL_POINTS_USED) then
		Warbuilder.PathCounter[ButtonNumber] = Warbuilder.PathCounter[ButtonNumber]+1
	end
	Warbuilder.OnUpdate()	
end

function Warbuilder.Decrement()
	local WindowName = SystemData.MouseOverWindow.name
	local ButtonNumber = tonumber(string.match(tostring(WindowName),"[^%.]Tree(%d+)."))
	
	if (Warbuilder.PathCounter[ButtonNumber] > 0) then
		Warbuilder.PathCounter[ButtonNumber] = Warbuilder.PathCounter[ButtonNumber]-1
	end
	Warbuilder.OnUpdate()	
end

function CastTimeText (abilityData)  
    local castTime = GetAbilityCastTime (abilityData)   
    if (castTime > 0) 
    then
        local _, castTimeFraction = math.modf (castTime)
        local params = nil       
        if (castTimeFraction ~= 0)
        then
            params = { wstring.format( L"%.1f", castTime) }
        else
            params = { wstring.format( L"%d", castTime) }
        end
        return (GetStringFormat (StringTables.Default.LABEL_ABILITY_TOOLTIP_CAST_TIME, params))
    end        
    return (GetString (StringTables.Default.LABEL_ABILITY_TOOLTIP_INSTANT_CAST))
end

function CostText (abilityData)
     local apCost = GetAbilityActionPointCost (abilityData)
       if (apCost > 0)
        then
            local params = { apCost }
            return (GetStringFormat (StringTables.Default.LABEL_ABILITY_TOOLTIP_ACTION_POINT_COST, params))
        end
     return (GetString (StringTables.Default.LABEL_ABILITY_TOOLTIP_NO_COST))
end

function RangeText (abilityData)
    local labelText = GetString (StringTables.Default.LABEL_ABILITY_TOOLTIP_NO_RANGE)
    local minRange, maxRange = GetAbilityRanges (abilityData)
    
    local fConstFootToMeter = 0.3048
    local bUseInternationalSystemUnit = SystemData.Territory.KOREA    
    
    if ((minRange > 0) and (maxRange > 0))
    then
        local stringID = StringTables.Default.LABEL_ABILITY_TOOLTIP_MIN_RANGE_TO_MAX_RANGE
        if bUseInternationalSystemUnit
        then
            minRange = string.format( "%d", minRange * fConstFootToMeter + 0.5 )
            maxRange = string.format( "%d", maxRange * fConstFootToMeter + 0.5 )
            stringID = StringTables.Default.LABEL_ABILITY_TOOLTIP_MIN_TO_MAX_RANGE_METERS
        end
        local params = { minRange, maxRange }
        labelText = GetStringFormat (stringID, params)  
    elseif (maxRange > 0) 
    then
        local stringID = StringTables.Default.LABEL_ABILITY_TOOLTIP_MAX_RANGE
        if bUseInternationalSystemUnit
        then
            maxRange = string.format( "%d", maxRange * fConstFootToMeter + 0.5 )
            stringID = StringTables.Default.LABEL_ABILITY_TOOLTIP_MAX_RANGE_METERS
        end
        local params = { maxRange }
        labelText = GetStringFormat (stringID, params)
    end  
    return (labelText)
end

function CooldownText( cooldown )
    if ( cooldown > 0 ) 
    then
        local timeText
        if( cooldown < 60 )
        then
            timeText = TimeUtils.FormatRoundedSeconds( cooldown, 0.1, true, false )
        else
            timeText = TimeUtils.FormatSeconds( cooldown, true )
        end
        return ( GetStringFormat( StringTables.Default.LABEL_ABILITY_TOOLTIP_COOLDOWN, { timeText } ) )
    end   
    return (GetString (StringTables.Default.LABEL_ABILITY_TOOLTIP_NO_COOLDOWN))
end


function Warbuilder.ShareLink()

	local PathCounter1 = Warbuilder.PathCounter[1]
	local PathCounter2 = Warbuilder.PathCounter[2]
	local PathCounter3 = Warbuilder.PathCounter[3]

	local GearCounter1 = Warbuilder.GearPoint[1]
	local GearCounter2 = Warbuilder.GearPoint[2]
	local GearCounter3 = Warbuilder.GearPoint[3]

	SpecAbilitys = "WarBuilder: Info{ "..Version..","..Warbuilder.Career[Warbuilder.SelectedCareer].Build..","..Warbuilder.SelectedCareer..","..Warbuilder.SelectedLevel..","..Warbuilder.SelectedRenown.." };Path{ "..PathCounter1..","..GearCounter1..","..PathCounter2..","..GearCounter2..","..PathCounter3..","..GearCounter3.." };"

--Tree specc
	local SpecTree1 = ""
	for i=1,3 do
	SpecTree1 = SpecTree1.."Tree"..i.."{ "
		for k,v in ipairs(Warbuilder.BoughtAbilitys[i]) do
				if v == true then
					SpecTree1 = SpecTree1..k..","
				end					
		end
		SpecTree1 = string.sub (SpecTree1, 0,string.len(SpecTree1)-1)
		SpecTree1 = SpecTree1.." };"
	end
	SpecAbilitys = SpecAbilitys..SpecTree1

	--tactics
	local SelectedTactics = "Tactic{ "
		for k,v in pairs(Warbuilder.SelectedTactics) do	
			SelectedTactics = SelectedTactics..k..","
		end
		
		SelectedTactics = string.sub (SelectedTactics, 0,string.len(SelectedTactics)-1)
		SelectedTactics = SelectedTactics.." };"

	 --morales
	local SelectedMorales = "Morale{ "
		for k,v in pairs(Warbuilder.SelectedMorales) do	
			SelectedMorales = SelectedMorales..v..","
		end
		
		SelectedMorales = string.sub (SelectedMorales, 0,string.len(SelectedMorales)-1)
		SelectedMorales = SelectedMorales.." }"
	 
	local LinkData = SpecAbilitys..SelectedTactics..SelectedMorales
	local LinkText = L"[Warbuilder: "..towstring(GetCareerLine(Warbuilder.Career[Warbuilder.SelectedCareer].Line))..L" ["..towstring(PathCounter1+Warbuilder.PointsInTree[1])..L":"..towstring(PathCounter2+Warbuilder.PointsInTree[2])..L":"..towstring(PathCounter3+Warbuilder.PointsInTree[3])..L"]"
	local DoneLink = CreateHyperLink(towstring(LinkData),towstring(LinkText), {255,68,44}, {} )	
	d(LinkData)
	d(towstring(DoneLink))
	EA_ChatWindow.InsertText(DoneLink)
end


function Warbuilder.AbilityLink(AbilityID,AbilityLvl,AbilityType,AbilityCareer,AbilityPath,AbilityType2,AbilityMinLevel,AbilityIcon,AbilityRank,NickName)
--Warbuilder.AbilityLink(AbilityID,AbilityLvl,AbilityType,AbilityCareer,AbilityPath,AbilityType2,AbilityMinLevel,AbilityIcon,AbilityRank,NickName)

	local AbilityID = tonumber(AbilityID)
	local Sender = NickName
    local AbilityName = GetAbilityName(AbilityID)
	local AbilityLvl = tonumber(AbilityLvl)
	local AbilityDesc = towstring(GetAbilityDesc(AbilityID,tonumber(AbilityLvl)))
	local AbilityCD = CooldownText(GetAbilityCooldown(AbilityID) / 1000)
	local AbilityCast = CastTimeText(AbilityID)  
	local AbilityCost = CostText(AbilityID)
	local AbilityRange = RangeText(AbilityID)  
	local AbilityPath = tonumber(AbilityPath)  	
	local AbilityType =	tonumber(AbilityType)
	local AbilityBuffType =	tonumber(AbilityType2)
	local AbilityMinLevel =	tonumber(AbilityMinLevel)	
	local AbilityCareer =	tonumber(AbilityCareer)	
	local itemData = GetAbilityName(AbilityID)
	local AbilityRank =	tonumber(AbilityRank)	
    local windowName = "AbilityLink"..AbilityID  


	if( DoesWindowExist( windowName ) ) then
		WindowSetShowing( windowName, true )
		return
    end    
 
	CreateWindowFromTemplate( windowName, "AbilityLinkTemplate", "Root" )
    WindowAddAnchor( windowName, "center", "Root", "center", 0, 0 )
    WindowSetShowing( windowName, true )  
	
	WindowSetShowing(windowName.."_Icon_1",false)
	WindowSetShowing(windowName.."_Icon_2",false)
	WindowSetShowing(windowName.."_Icon_3",false)
	WindowSetShowing(windowName.."_Icon_4",false)
	
	WindowSetShowing(windowName.."_Icon_"..AbilityType,true)


	for lvl=1,40 do
		ComboBoxAddMenuItem(windowName.."ComboLevelSelect",L"<icon52>"..towstring(lvl))
	end
	ComboBoxSetSelectedMenuItem(windowName.."ComboLevelSelect",tonumber(AbilityLvl))
	
 	
local ReLinkText = "ABILITY: "..tonumber(AbilityID)..";"..tonumber(ComboBoxGetSelectedMenuItem(windowName.."ComboLevelSelect") or 1)..";"..tonumber(AbilityType)..";"..tonumber(AbilityCareer)..";"..tonumber(AbilityPath)..";"..tonumber(AbilityType2)..";"..tonumber(AbilityMinLevel or 0)..";"..tostring(AbilityIcon)..";"..tostring(AbilityRank or 0)..";"..tostring(GameData.Player.name)

			local texture, x, y, disabledTexture = GetIconData(tonumber(AbilityIcon))
			if AbilityType ~= 3 then	--Check if it is an morale or abillity and set the texture accordingly
				DynamicImageSetTexture(windowName.."_Icon_"..AbilityType.."Icon",texture, 64, 64)				
			else
				CircleImageSetTexture(windowName.."_Icon_"..AbilityType.."Icon",texture, 32, 32)
			end	
			local FrameColor = Warbuilder.GetColorFromType(AbilityType)		
			WindowSetTintColor(windowName.."_Icon_"..AbilityType, FrameColor.r, FrameColor.g, FrameColor.b )			
			WindowSetTintColor(windowName.."_Icon_"..AbilityType.."Icon",255, 255,255 )	
			--Ability Name
			LabelSetText(windowName.."AbilityName", towstring(AbilityName))
			LabelSetTextColor(windowName.."AbilityName", FrameColor.r, FrameColor.g, FrameColor.b)	
			--Ability Type
			
--			LabelSetText(windowName.."AbilityType", towstring(Warbuilder.GetType(AbilityType))..L"("..towstring(Warbuilder.GetBuffType(AbilityBuffType))..L")")
			LabelSetText(windowName.."AbilityType", towstring(Warbuilder.GetType(AbilityType)))
			LabelSetText(windowName.."AbilityBuffType", towstring(Warbuilder.GetBuffType(AbilityBuffType)))
			LabelSetTextColor(windowName.."AbilityBuffType", FrameColor.r, FrameColor.g, FrameColor.b)
			LabelSetText(windowName.."HiddenCareer", towstring(AbilityCareer))
		
			--Ability Level
			--LabelSetText(windowName.."Abilitylvl", L"Level "..towstring(AbilityLvl)..L"("..towstring(AbilityMinLevel)..L")")
			LabelSetText(windowName.."Abilitylvl", L"Level ")
					
			--Ability Path
			if AbilityPath > 0 then ToolTipAbilityPath2 = GetStringFormat(StringTables.Default.LABEL_SPECIALIZATION_TITLE, { GetSpecializationPathName((3*AbilityCareer)-(3-AbilityPath))}) else ToolTipAbilityPath2 = GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_NO_SPECIALIZATION_PATH,{})end					


				if AbilityType == 1 then
					LabelSetText(windowName.."AbilityCast",GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_PASSIVE_CAST,{}))
					LabelSetText(windowName.."AbilityCost",GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_TACTIC_COST,{1,towstring(GetStringFormat(StringTables.Default.LABEL_GUILD_SORT_CAREER_BUTTON,{}))}))
				elseif AbilityType == 3 then
					LabelSetText(windowName.."AbilityCost",GetStringFormat(StringTables.Default.LABEL_ABILITY_TOOLTIP_MORALE_COST,{AbilityRank}))	
					LabelSetText(windowName.."AbilityCast",AbilityCast)						
				else
					LabelSetText(windowName.."AbilityCost",AbilityCost)
					LabelSetText(windowName.."AbilityCast",AbilityCast)
				end

	LabelSetText(windowName.."AbilityRange",AbilityRange) 
	LabelSetText(windowName.."AbilityCD",AbilityCD)
	LabelSetText(windowName.."AbilityPath",ToolTipAbilityPath2)

	LabelSetTextColor(windowName.."AbilityDesc", 255,200,100)		
	--ButtonSetText(windowName.."CareerName",L""..towstring(Career[AbilityCareerNumber].CareerIcon)..towstring(GetStringFromTable("CareerNamesMale", Career[AbilityCareerNumber].CareerName)))
	LabelSetText(windowName.."AbilityDesc",Warbuilder.FormatDesc(AbilityDesc))
	LabelSetText(windowName.."NickName",towstring(NickName))	
	LabelSetText(windowName.."ReLinkLabel",towstring(ReLinkText))
	LabelSetText(windowName.."LinkLabel",L"Shift+<icon00092>LMB To Link, <icon00092>LMB on ICON for DnD")	
	LabelSetTextColor(windowName.."LinkLabel", 0,255,0)			

	ButtonSetText(windowName.."CareerName",L" <icon"..towstring(Icons.GetCareerIconIDFromCareerLine(AbilityCareer))..L">"..towstring(GetCareerLine(AbilityCareer)))

	LabelSetText("WarbuilderMainWindowAbouttext", L"Version: "..towstring(Version)..L" <icon"..towstring(Icons.GetCareerIconIDFromCareerLine(Warbuilder.Career[Warbuilder.SelectedCareer].Line))..L">Build: "..towstring(Warbuilder.Career[Warbuilder.SelectedCareer].Build))				
			
	local reqs = GetAbilityRequirements( AbilityID )
    for reqsIndex = 1, 5 do             
        if ((reqs[reqsIndex] ~= nil))
        then
			LabelSetTextColor(windowName.."AbilityReq"..reqsIndex, 145,145,255)	
            LabelSetText (windowName.."AbilityReq"..reqsIndex, reqs[reqsIndex])
        else
            LabelSetText (windowName.."AbilityReq"..reqsIndex, L"")
        end
    end 
 	 
	local _, textHeight0 = LabelGetTextDimensions(windowName.."AbilityDesc")
	local _, textHeight1 = LabelGetTextDimensions(windowName.."AbilityReq1")
	local _, textHeight2 = LabelGetTextDimensions(windowName.."AbilityReq2")
	local _, textHeight3 = LabelGetTextDimensions(windowName.."AbilityReq3")
	local _, textHeight4 = LabelGetTextDimensions(windowName.."AbilityReq4")
	local _, textHeight5 = LabelGetTextDimensions(windowName.."AbilityReq5")

	WindowSetDimensions( windowName, 475, (textHeight0+textHeight1+textHeight2+textHeight3+textHeight4+textHeight5+210) )
	
end

function Warbuilder.FormatDesc(AbilityDesc)
local Desc = wstring.gsub(AbilityDesc,L"Elemental",towstring(CreateHyperLink(L"",L"Elemental", {255,25,25}, {} )))
Desc = wstring.gsub(Desc,L"Corporeal",towstring(CreateHyperLink(L"",L"Corporeal", {175,100,50}, {} )))
Desc = wstring.gsub(Desc,L"Spirit",towstring(CreateHyperLink(L"",L"Spirit", {230,230,230}, {} )))
Desc = wstring.gsub(Desc,L"health",towstring(CreateHyperLink(L"",L"health", {50,255,50}, {} )))
Desc = wstring.gsub(Desc,L"Action Points",towstring(CreateHyperLink(L"",L"Action Points", {255,245,0}, {} )))
Desc = wstring.gsub(Desc,L"AP",towstring(CreateHyperLink(L"",L"Action Points", {255,245,0}, {} )))
Desc = wstring.gsub(Desc,L"absorb",towstring(CreateHyperLink(L"",L"absorb", {112,180,210}, {} )))
return (Desc)
end


function Warbuilder.DnD(flags)
	local WindowName = WindowGetParent(SystemData.MouseOverWindow.name)	
	local LinkString = LabelGetText(WindowName.."ReLinkLabel")
	if LinkString:match( L"ABILITY: ([^%.]+).") then
		LinkString = wstring.gsub(LinkString,L"ABILITY: ", L"")
		local SplitTable = StringSplit(tostring(LinkString), ";")		
		Cursor.PickUp( Cursor.SOURCE_ACTION_LIST, index, tonumber(SplitTable[1]), tonumber(SplitTable[8]), false )	
	end	
end

function Warbuilder.LinkLevel(idx)
	local BoxNumber	= WindowGetId (SystemData.ActiveWindow.name)
	local windowNumber = wstring.match(towstring(SystemData.MouseOverWindow.name),L"AbilityLink(%d+).")
	WindowName = "AbilityLink"..tostring(windowNumber)

	local LinkString = LabelGetText(WindowName.."ReLinkLabel")
	if LinkString:match( L"ABILITY: ([^%.]+).") then
		LinkString = wstring.gsub(LinkString,L"ABILITY: ", L"")
		local SplitTable = StringSplit(tostring(LinkString), ";")
		local AbilityDesc = towstring(GetAbilityDesc(tonumber(SplitTable[1]),tonumber(idx)))
		LabelSetText(WindowName.."AbilityDesc",Warbuilder.FormatDesc(AbilityDesc))
		ComboBoxSetSelectedMenuItem(WindowName.."ComboLevelSelect",tonumber(idx))
	end	
end

function Warbuilder.ReLink(flags)
	local WindowName = SystemData.ActiveWindow.name
	if (flags == SystemData.ButtonFlags.SHIFT) then
		local LinkString = LabelGetText(WindowName.."ReLinkLabel")
		if LinkString:match( L"ABILITY: ([^%.]+).") then
			local SplitTable = StringSplit(tostring(LinkString), ";")
			local ReLinkText = tostring(SplitTable[1])..";"..tonumber(ComboBoxGetSelectedMenuItem(WindowName.."ComboLevelSelect") or 1)..";"..tonumber(SplitTable[3])..";"..tonumber(SplitTable[4])..";"..tonumber(SplitTable[5])..";"..tonumber(SplitTable[6])..";"..tonumber(SplitTable[7] or 0)..";"..tostring(SplitTable[8])..";"..tostring(SplitTable[9] or 0)..";"..tostring(GameData.Player.name)				
			local LinkData = towstring(ReLinkText)
			local LabelColor = {}	
			LabelColor.r,LabelColor.g,LabelColor.b = LabelGetTextColor(WindowName.."AbilityBuffType") 
			local LinkName = L"["..towstring(LabelGetText(WindowName.."AbilityType"))..L": "..towstring(LabelGetText(WindowName.."AbilityName"))..L"]"
			local DoneLink = CreateHyperLink(LinkData,LinkName, {LabelColor.r, LabelColor.g,LabelColor.b}, {} )				
			EA_ChatWindow.InsertText(towstring(DoneLink))
		end
	end
end



function Warbuilder.TestImp()

end

		

--Imports the players current build
function Warbuilder.ImportCurrent()
WindowSetShowing("EA_Window_InteractionSpecialtyTraining",not WindowGetShowing("EA_Window_InteractionSpecialtyTraining"))
  
EA_Window_InteractionSpecialtyTraining.Refresh()

local FetchBuild = EA_Window_InteractionSpecialtyTraining.initialSpecializationLevels

--the complex search for wich abilities has been purchased...
local TempSpeccs = {[1]={},[2]={},[3]={}} 
local BoughtSpeccs = {[1]={[3]=0,[5]=0,[7]=0,[9]=0,[11]=0,[13]=0,[15]=0},[2]={[3]=0,[5]=0,[7]=0,[9]=0,[11]=0,[13]=0,[15]=0},[3]={[3]=0,[5]=0,[7]=0,[9]=0,[11]=0,[13]=0,[15]=0}} 
	
	for i=1,3 do
			local counter = 1
	   for index, advanceData in pairs(EA_Window_InteractionSpecialtyTraining.advanceData) do
			if InteractionUtils.IsAbility(advanceData) then		
			if (advanceData.dependencies ~= nil) and (advanceData.dependencies[i] ~= nil) then
			
			
			if (advanceData.abilityInfo.specialization == i) then
					TempSpeccs[i][counter] = advanceData
					counter = counter +1
				end
			end
			end
		end
		
		for k,v in pairs(TempSpeccs[i]) do
			if v.abilityInfo.isPurchased == true then
				BoughtSpeccs[i][v.dependencies[i]] = 1
			end
		end			
	end
		
	WindowSetShowing("EA_Window_InteractionSpecialtyTraining",not WindowGetShowing("EA_Window_InteractionSpecialtyTraining"))

	Warbuilder.SelectedCareer = tonumber(GameData.Player.career.line)
	Warbuilder.SelectedLevel = tonumber(GameData.Player.level)
	
	local PlayerRenown = GameData.Player.Renown.curRank
	local InfoRenown = 0
	if PlayerRenown >= 40 then InfoRenown = 1 end
	if PlayerRenown >= 50 then InfoRenown = 2 end
	if PlayerRenown >= 60 then InfoRenown = 3 end
	if PlayerRenown >= 70 then InfoRenown = 4 end	
		
	Warbuilder.SelectedRenown = InfoRenown
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowComboRenownSelect",InfoRenown+1)
	
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowComboLevelSelect",Warbuilder.SelectedLevel+1)
	ComboBoxSetSelectedMenuItem("WarbuilderMainWindowCombo",Warbuilder.SelectedCareer)

local GetGearPoint = Warbuilder.CheckGear()

Warbuilder.GearPoint[1] = GetGearPoint[1]
Warbuilder.GearPoint[2] = GetGearPoint[2]
Warbuilder.GearPoint[3] = GetGearPoint[3]	
	
Warbuilder.PathCounter[1] = FetchBuild[1] -GetGearPoint[1]
Warbuilder.PathCounter[2] = FetchBuild[2] -GetGearPoint[2]
Warbuilder.PathCounter[3] = FetchBuild[3] -GetGearPoint[3]

	Warbuilder.BoughtAbilitys = {
		[1]={[1]=BoughtSpeccs[1][3]>0,[2]=BoughtSpeccs[1][5]>0,[3]=BoughtSpeccs[1][7]>0,[4]=BoughtSpeccs[1][9]>0,[5]=BoughtSpeccs[1][11]>0,[6]=BoughtSpeccs[1][13]>0,[7]=BoughtSpeccs[1][15]>0},
		[2]={[1]=BoughtSpeccs[2][3]>0,[2]=BoughtSpeccs[2][5]>0,[3]=BoughtSpeccs[2][7]>0,[4]=BoughtSpeccs[2][9]>0,[5]=BoughtSpeccs[2][11]>0,[6]=BoughtSpeccs[2][13]>0,[7]=BoughtSpeccs[2][15]>0},
		[3]={[1]=BoughtSpeccs[3][3]>0,[2]=BoughtSpeccs[3][5]>0,[3]=BoughtSpeccs[3][7]>0,[4]=BoughtSpeccs[3][9]>0,[5]=BoughtSpeccs[3][11]>0,[6]=BoughtSpeccs[3][13]>0,[7]=BoughtSpeccs[3][15]>0}
		}
	
Warbuilder.SelectedMorales = {}	
Warbuilder.SelectedTactics = {}	


if Warbuilder.SelectedLevel == 0 then
		MAX_MASTERY_POINTS = 29
	else
		MAX_MASTERY_POINTS=LevelToMastery[Warbuilder.SelectedLevel]+Warbuilder.SelectedRenown
end	


Warbuilder.OnUpdate()
--the search for morales!		
local _,Morale1 = GetMoraleBarData(1)
local _,Morale2 = GetMoraleBarData(2)
local _,Morale3 = GetMoraleBarData(3)
local _,Morale4 = GetMoraleBarData(4)
	for k,v in ipairs(Total_Morales) do
		if v.ID == Morale1 then Warbuilder.SelectedMorales[1] = k end
		if v.ID == Morale2 then Warbuilder.SelectedMorales[2] = k end
		if v.ID == Morale3 then Warbuilder.SelectedMorales[3] = k end
		if v.ID == Morale4 then Warbuilder.SelectedMorales[4] = k end		
	end
--Tactics
local activeTactics = GetTacticsSet(tonumber(ButtonGetText("EA_TacticsEditorContentsSetMenuSelectedButton"))-1)
	for k,v in ipairs(Total_Tactics) do
		if v.ID == activeTactics[1] then Warbuilder.SelectedTactics[k] = true end
		if v.ID == activeTactics[2] then Warbuilder.SelectedTactics[k] = true end
		if v.ID == activeTactics[3] then Warbuilder.SelectedTactics[k] = true end
		if v.ID == activeTactics[4] then Warbuilder.SelectedTactics[k] = true end
	end

Warbuilder.OnUpdate()
end

--Check For gear that adds an extra gear point
function Warbuilder.CheckGear()

Warbuilder.Gears = {}

local GearPoints = {[1]=0,[2]=0,[3]=0}
local equipment = DataUtils.GetEquipmentData()
--Go throu the equipment one by one
	for k,v in pairs(equipment) do
--Only continue if the gear has a set piece bonus
		if v.itemSet ~= 0 then
			local SetItem = DataUtils.GetItemSetData (v.itemSet)
			if SetItem ~= nil then
--Check throu the bonuses in search of Stat Points
				for num,key in pairs(SetItem.bonuses) do
					if key.statType == GameData.BonusTypes.EBONUS_SPEC_1 or key.statType == GameData.BonusTypes.EBONUS_SPEC_2 or key.statType == GameData.BonusTypes.EBONUS_SPEC_3 then 								
--If statpoints are found in the bonuses , set a table with the item bonus data, how manny of the items is needed and wich tree the point is in
						Warbuilder.Gears[v.itemSet] = {}						
						Warbuilder.Gears[v.itemSet].Type = key.statType
						Warbuilder.Gears[v.itemSet].Need = num
						Warbuilder.Gears[v.itemSet].SetId = SetItem
					end
				end				
			end
		end
	end
--After all the gear has been checked go throu the table that was created with the stat bonus additions	
	if Warbuilder.Gears then
		for k,v in pairs(Warbuilder.Gears) do
			local SetData,OwnPieces = DataUtils.GetPlayerOwnedSetPieces(v.SetId)
			if OwnPieces >= v.Need then	
				if v.Type == GameData.BonusTypes.EBONUS_SPEC_1 then GearPoints[1] = 1 end
				if v.Type == GameData.BonusTypes.EBONUS_SPEC_2 then GearPoints[2] = 1 end
				if v.Type == GameData.BonusTypes.EBONUS_SPEC_3 then GearPoints[3] = 1 end
			end
		end
	end
return(GearPoints)
end
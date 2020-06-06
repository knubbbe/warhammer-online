<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
    <UiMod name="HealGrid" version="2.1.01" date="2011/03/12" >
		<VersionSettings gameVersion="1.4.1" windowsVersion="1.4.1" savedVariablesVersion="1.4.1" />
        <Author name="rmet0815" email="" />
        <Description text="A grid showing yourself and the group in little frames, with vital healing information." />
        <Dependencies>        
            <Dependency name="EASystem_LayoutEditor" />					<!-- required -->
            <Dependency name="EASystem_TargetInfo" />					<!-- required -->
            <Dependency name="EASystem_Tooltips" />						<!-- required -->
            <Dependency name="EASystem_Utils" />						<!-- reauired -->
            <Dependency name="EATemplate_DefaultWindowSkin" />			<!-- required -->
            <Dependency name="EA_CareerResourcesWindow" />				<!-- required (to hide cp bar) -->
            <Dependency name="EA_CastTimerWindow" />					<!-- required (to hide castbar) -->
            <Dependency name="EA_UiDebugTools" />						<!-- required -->
            <Dependency name="LibSlash" optional="true" />				<!-- optional -->
            <Dependency name="RMetLib" />								<!-- required -->
        </Dependencies>
        <SavedVariables>
            <SavedVariable name="HealGridSettings" global="true" />
			<SavedVariable name="HealGridSkinModification" />
        </SavedVariables>
        <Files>
			<!-- skinning -->
            <File name="Skinning/HealGridSkinDefinition.lua" />
            <File name="Skinning/HealGridSkinModification.lua" />
            <File name="Skinning/HealGridSkin.lua" />
            <File name="Skinning/textures/textures.xml" />
            <File name="Skinning/textures/textures.lua" />
            <File name="Skinning/skins/HealGridBase.lua" />

			<!-- default skins -->
            <File name="Skinning/skins/SharpSmall.lua" />
            <File name="Skinning/skins/SharpMedium.lua" />
            <File name="Skinning/skins/SharpLarge.lua" />
            <File name="Skinning/skins/SharpXL.lua" />
            <File name="Skinning/skins/MelliSmall.lua" />
            <File name="Skinning/skins/MelliMedium.lua" />
            <File name="Skinning/skins/MelliLarge.lua" />
            <File name="Skinning/skins/MellibaSmall.lua" />
            <File name="Skinning/skins/MellibaMedium.lua" />
            <File name="Skinning/skins/MellibaLarge.lua" />
            <File name="Skinning/skins/SplendorSmall.lua" />
            <File name="Skinning/skins/SplendorMedium.lua" />
            <File name="Skinning/skins/SplendorLarge.lua" />
            <File name="Skinning/skins/LucidMedium.lua" />
            <File name="Skinning/skins/WideMedium.lua" />

			<!-- HealGrid -->
            <File name="PhantomLib/LibStub.lua" />
            <File name="PhantomLib/PhantomLib.lua" />
            <File name="HealGrid.xml" />
            <File name="Icon/HealGridIcon.xml" />
            <File name="Modules/HealGridColoredLabel.xml" />
            <File name="Modules/HealGridBuffTracker.xml" />
            <File name="Bars/HealGridProgressBar.xml" />
            <File name="Bars/HealGridActionPointBar.xml" />
            <File name="Bars/HealGridCareerBar.xml" />
            <File name="Bars/HealGridMoraleBar.xml" />
            <File name="Bars/HealGridCastBar.xml" />
            <File name="Units/HealGridUnit.xml" />
            <File name="GridFactories/HealGridGridFactory.xml" />
            <File name="GridFactories/HealGridHUD.xml" />
            <File name="GridFactories/HealGridGroup.xml" />
            <File name="GridFactories/HealGridBattlegroup.xml" />
            <File name="GridFactories/HealGridScenariogroup.xml" />
            <File name="UnitTooltips/HealGridUnitTooltip.xml" />
            <File name="HealGridGlobals.lua" />
            <File name="HealGridDummyData.lua" />
            <File name="HealGridUtility.lua" />
            <File name="HealGridSettings.lua" />
            <File name="HealGridTags.lua" />
            <File name="Icon/HealGridIcon.lua" />
            <File name="Bars/HealGridProgressBar.lua" />
            <File name="Bars/HealGridActionPointBar.lua" />
            <File name="Bars/HealGridCareerBar.lua" />
            <File name="Bars/HealGridMoraleBar.lua" />
            <File name="Bars/HealGridCastBar.lua" />
            <File name="Units/HealGridUnit.lua" />
            <File name="Units/HealGridUnitHUD.lua" />
            <File name="Units/HealGridUnitPlayer.lua" />
            <File name="Units/HealGridUnitPet.lua" />
            <File name="Units/HealGridUnitFriendlyTarget.lua" />
            <File name="Units/HealGridUnitHostileTarget.lua" />
            <File name="Units/HealGridUnitPetTarget.lua" />
            <File name="Units/HealGridUnitGroupMember.lua" />
            <File name="Units/HealGridUnitGroupMemberAvatar.lua" />
            <File name="Units/HealGridUnitBattlegroupMember.lua" />
            <File name="Units/HealGridUnitScenariogroupMember.lua" />
            <File name="HealGrid.lua" />
            <File name="Modules/HealGridColoredLabel.lua" />
            <File name="Modules/HealGridBuffTrack.lua" />
            <File name="Modules/HealGridBuffTracker.lua" />
            <File name="Modules/HealGridMouseClick.lua" />
            <File name="GridFactories/HealGridGridFactory.lua" />
            <File name="GridFactories/HealGridHUD.lua" />
            <File name="GridFactories/HealGridHUDMain.lua" />
            <File name="GridFactories/HealGridGroup.lua" />
            <File name="GridFactories/HealGridBattlegroup.lua" />
            <File name="GridFactories/HealGridScenariogroup.lua" />
            <File name="UnitTooltips/HealGridUnitTooltip.lua" />

			<!-- GUI -->
            <File name="Gui/HealGridGuiTemplates.xml" />
            <File name="Gui/HealGridGuiColorSelect.xml" />
            <File name="Gui/HealGridGuiSpellList.xml" />
            <File name="Gui/HealGridGuiTabGeneral.xml" />
            <File name="Gui/HealGridGuiTabHUD.xml" />
            <File name="Gui/HealGridGuiTabHUDBuffs.xml" />
            <File name="Gui/HealGridGuiTabGroup.xml" />
            <File name="Gui/HealGridGuiTabBattlegroup.xml" />
            <File name="Gui/HealGridGuiTabScenariogroup.xml" />
            <File name="Gui/HealGridGuiTabRangeScan.xml" />
            <File name="Gui/HealGridGuiTabSpellTrack.xml" />
            <File name="Gui/HealGridGuiTabMouseClick.xml" />
            <File name="Gui/HealGridGuiTabTooltip.xml" />
            <File name="Gui/HealGridGui.xml" />
            <File name="Gui/HealGridGuiUtility.lua" />
            <File name="Gui/HealGridGuiColorSelect.lua" />
            <File name="Gui/HealGridGuiSpellList.lua" />
            <File name="Gui/HealGridGuiTabGeneral.lua" />
            <File name="Gui/HealGridGuiTabHUD.lua" />
            <File name="Gui/HealGridGuiTabHUDBuffs.lua" />
            <File name="Gui/HealGridGuiTabGroup.lua" />
            <File name="Gui/HealGridGuiTabBattlegroup.lua" />
            <File name="Gui/HealGridGuiTabScenariogroup.lua" />
            <File name="Gui/HealGridGuiTabRangeScan.lua" />
            <File name="Gui/HealGridGuiTabSpellTrack.lua" />
            <File name="Gui/HealGridGuiTabMouseClick.lua" />
            <File name="Gui/HealGridGuiTabTooltip.lua" />
            <File name="Gui/HealGridGui.lua" />
        </Files>
        <OnInitialize>
			<CreateWindow name="HGG_HealGrid" show="false" />
			<CallFunction name="HealGridSkin.Initialize" />
            <CallFunction name="HealGrid.Initialize" />
            <CallFunction name="HealGridUnitTooltip.Initialize" />
            <CallFunction name="HealGridGui.Initialize" />
        </OnInitialize>
        <OnUpdate>
            <CallFunction name="HealGrid.OnUpdate" />
            <CallFunction name="HealGridUnitTooltip.OnUpdate" />
        </OnUpdate>
        <OnShutdown>
			<CallFunction name="HealGridSkin.Shutdown" />
            <CallFunction name="HealGrid.Shutdown" />
            <CallFunction name="HealGridUnitTooltip.Shutdown" />
            <CallFunction name="HealGridGui.Shutdown" />
        </OnShutdown>
    </UiMod>
</ModuleFile>    

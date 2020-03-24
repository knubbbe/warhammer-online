<? version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
  <UiMod name="Pure" version="1.2.5" date="2010/12">
    <Author name="Wikki" email="wikkifizzle@gmail.com" />
    <Description text="Pure - A unit frame addon." />
    <VersionSettings gameVersion="1.9.9" windowsVersion="1.0" savedVariablesVersion="1.0" />
    <Dependencies>
      <Dependency name="EA_PlayerMenu" />
      <Dependency name="EASystem_Strings" />
      <Dependency name="EASystem_Utils" />
      <Dependency name="EASystem_TargetInfo" />
      <Dependency name="EASystem_WindowUtils" />
      <Dependency name="EASystem_Tooltips" />
      <Dependency name="EATemplate_DefaultWindowSkin" />
      <Dependency name="EATemplate_UnitFrames" />
      <Dependency name="SharedAssetsPure" />
      <Dependency name="LibSlash" />
    </Dependencies>
    <SavedVariables>
      <SavedVariable name="PureDB" global="true" />
    </SavedVariables>
    <Files>
      <File name="Source/PureDefaultSettings.lua" />
      <File name="Source/PureUIElementTemplates.xml" />
      <File name="Source/PureUnitFrame.xml" />
      <File name="Source/PureUnitFrameHUD.xml" />
      <File name="Source/TargetInfoFix.lua" />
      <File name="Libraries/LibStub.lua" />
      <File name="Libraries/LibGUI.lua" />
      <File name="Libraries/CallbackHandler-1.0.lua" />
      <File name="Libraries/AceLocale-3.0.lua" />
      <File name="Libraries/AceDB-3.0.lua" />
      <File name="Libraries/AceDBOptions-3.0.lua" />
      <File name="Libraries/LibSharedAssets.lua" />
      <File name="Localization/deDE.lua" />
      <File name="Localization/enUS.lua" />
      <File name="Localization/esES.lua" />
      <File name="Localization/frFR.lua" />
      <File name="Localization/itIT.lua" />
      <File name="Localization/jaJP.lua" />
      <File name="Localization/koKR.lua" />
      <File name="Localization/ruRU.lua" />
      <File name="Localization/zhCN.lua" />
      <File name="Localization/zhTW.lua" />
      <File name="Source/PureConstants.lua" />
      <!-- Start Configuration Windows -->
        <File name="Configuration/PureConfig.xml" />
        <File name="Configuration/PureConfig.lua" />
        <File name="Configuration/PureConfig_General.lua" />
        <File name="Configuration/PureConfig_Player.lua" />
        <File name="Configuration/PureConfig_PlayerPet.lua" />
        <File name="Configuration/PureConfig_PlayerPetTarget.lua" />
        <File name="Configuration/PureConfig_TargetFriendly.lua" />
        <File name="Configuration/PureConfig_TargetFriendlyHUD.lua" />
        <File name="Configuration/PureConfig_TargetHostile.lua" />
        <File name="Configuration/PureConfig_TargetHostileHUD.lua" />
        <File name="Configuration/PureConfig_Group.lua" />
        <File name="Configuration/PureConfig_GroupPet.lua" />
        <File name="Configuration/PureConfig_Templates.lua" />
        <File name="Configuration/PureConfig_Profiles.lua" />
        <File name="Configuration/PureConfig_About.lua" />
        <!-- Stop Configuration Windows -->
          <File name="Source/PureTemplates.lua" />
          <File name="Source/PureEffect.lua" />
          <File name="Source/PureEffectTracker.lua" />
          <File name="Source/PurePlayer_UnitFrame.lua" />
          <File name="Source/PurePlayerPet_UnitFrame.lua" />
          <File name="Source/PurePlayerPetTarget_UnitFrame.lua" />
          <File name="Source/PureGroup_UnitFrame.lua" />
          <File name="Source/PureGroupPet_UnitFrame.lua" />
          <File name="Source/PureTarget_UnitFrame.lua" />
          <File name="Source/PureTargetHUD_UnitFrame.lua" />
          <File name="Source/PurePlayer.lua" />
          <File name="Source/PureGroup.lua" />
          <File name="Source/PurePlayerPet.lua" />
          <File name="Source/PureGroupPet.lua" />
          <File name="Source/PureTargetHUD.lua" />
          <File name="Source/PureTarget.lua" />
          <File name="Source/PurePlayerPetTarget.lua" />
          <File name="Source/Pure.lua" />
        </Files>
        <OnInitialize>
          <CreateWindow name="PureConfig" show="false" />
          <CallFunction name="Pure.OnInitialize" />
        </OnInitialize>
        <OnUpdate>
          <CallFunction name="PureConfig_Player_OnUpdate" />
          <CallFunction name="PureConfig_PlayerPet_OnUpdate" />
          <CallFunction name="PureConfig_PlayerPetTarget_OnUpdate" />
          <CallFunction name="PureConfig_Group_OnUpdate" />
          <CallFunction name="PureConfig_GroupPet_OnUpdate" />
          <CallFunction name="PureConfig_TargetFriendly_OnUpdate" />
          <CallFunction name="PureConfig_TargetFriendlyHUD_OnUpdate" />
          <CallFunction name="PureConfig_TargetHostile_OnUpdate" />
          <CallFunction name="PureConfig_TargetHostileHUD_OnUpdate" />
        </OnUpdate>
        <OnShutdown>
          <CallFunction name="AceDBLogoutHandler" />
        </OnShutdown>
        <WARInfo>
          <Categories>
            <Category name="BUFFS_DEBUFFS" />
            <Category name="RVR" />
            <Category name="GROUPING" />
          </Categories>
          <Careers>
            <Career name="BLACKGUARD" />
            <Career name="WITCH_ELF" />
            <Career name="DISCIPLE" />
            <Career name="SORCERER" />
            <Career name="IRON_BREAKER" />
            <Career name="SLAYER" />
            <Career name="RUNE_PRIEST" />
            <Career name="ENGINEER" />
            <Career name="BLACK_ORC" />
            <Career name="CHOPPA" />
            <Career name="SHAMAN" />
            <Career name="SQUIG_HERDER" />
            <Career name="WITCH_HUNTER" />
            <Career name="KNIGHT" />
            <Career name="BRIGHT_WIZARD" />
            <Career name="WARRIOR_PRIEST" />
            <Career name="CHOSEN" />
            <Career name= "MARAUDER" />
            <Career name="ZEALOT" />
            <Career name="MAGUS" />
            <Career name="SWORDMASTER" />
            <Career name="SHADOW_WARRIOR" />
            <Career name="WHITE_LION" />
            <Career name="ARCHMAGE" />
          </Careers>
        </WARInfo>
      </UiMod>
    </ModuleFile>
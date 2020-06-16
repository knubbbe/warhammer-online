<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="Squared" version="3.8.10" date="01/03/2011" >

		<Author name="Aiiane" email="aiiane@aiiane.net" />
		<Description text="Concise unit status indicators." />
        
        <VersionSettings gameVersion="1.4.1" windowsVersion="1.0" savedVariablesVersion="1.0" />
        
        <Dependencies>
			<Dependency name="EASystem_Utils" />
            <Dependency name="EASystem_LayoutEditor" />
            <Dependency name="EASystem_WindowUtils" />
            <Dependency name="EA_ActionBars" />
            <Dependency name="EA_TargetWindow" />
			<Dependency name="EA_MacroWindow" />
			<Dependency name="SharedAssetsSquared" />
        </Dependencies>
        
		<Files>
            <File name="TargetInfoFix.lua" />
			<File name="LibStub.lua" />
			<File name="LibSharedAssets.lua" />
			<File name="SquaredIcon.xml" />
            <File name="Squared.xml" />
            <File name="SquaredDefaultSettings.lua" />
            <File name="Squared.lua" />
            <File name="SquaredUnitFrame.lua" />
            <File name="SquaredPlayer.lua" />
            <File name="SquaredGroup.lua" />
            <File name="SquaredScenario.lua" />
            <File name="SquaredWarband.lua" />
            <File name="SquaredTestmode.lua" />
            <File name="SquaredSlashConfig.lua" />
            <File name="SquaredRangeFading.lua" />
            <File name="SquaredClickAssist.lua" />
			<File name="SquaredProfiles.lua" />
		</Files>
		
		<OnInitialize>
            <CreateWindow name="SquaredAnchor" />
			<CreateWindow name="SquaredIcon" />
            <CallFunction name="Squared.Initialize" />
            <CallFunction name="SquaredPlayer.Initialize" />
            <CallFunction name="SquaredGroup.Initialize" />
            <CallFunction name="SquaredScenario.Initialize" />
            <CallFunction name="SquaredWarband.Initialize" />
            <CallFunction name="SquaredTestmode.Initialize" />
            <CallFunction name="SquaredRangeFading.Initialize" />
		</OnInitialize>
		<OnUpdate>
            <CallFunction name="Squared.OnUpdate" />
        </OnUpdate>
		<OnShutdown/>
        
        <WARInfo>
    <Categories>
        <Category name="BUFFS_DEBUFFS" />
        <Category name="RVR" />
        <Category name="GROUPING" />
        <Category name="COMBAT" />
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

<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
    <UiMod name="CleanUnitFrames" version="1.0" date="18/09/2008" >
        <Author name="Aiiane" email="aiiane@aiiane.net" />
        <Description text="A replacement for the EA unit frames that strips out unnecessary fluff. Based on the code for the default frames by EAMythic. Build: 1.0.25-ror (20170713). ror mod by anon" />
        <Dependencies>        
            <Dependency name="EASystem_Utils" />
            <Dependency name="EASystem_WindowUtils" />
            <Dependency name="EATemplate_DefaultWindowSkin" />
            <Dependency name="EATemplate_UnitFrames" />
            <Dependency name="EA_LegacyTemplates" />
            <Dependency name="EASystem_Tooltips" />
            <Dependency name="EASystem_LayoutEditor" />
            <Dependency name="EA_TacticsWindow" />
            <Dependency name="EA_PlayerStatusWindow" />
            <Dependency name="EA_CareerResourcesWindow" />
            <Dependency name="EA_OpenPartyWindow" />
            <Dependency name="EA_TargetWindow" />
            <Dependency name="LibSlash" />
        </Dependencies>
        <SavedVariables>
            <SavedVariable name="CleanSettings" />
        </SavedVariables>
        <Files>
            <File name="CleanSettings.lua" />
            <File name="CleanPlayerWindow.xml" />
            <File name="CleanGroupMemberUnitFrame.lua" />
            <File name="CleanGroupWindow.xml" />
            <File name="CleanTargetUnitFrame.lua" />
            <File name="CleanTargetWindow.xml" />
            <File name="CleanTargetWindow.lua" />
        </Files>
        <OnInitialize>
            <CallFunction name="CleanSettingsInitialize" />
            <CreateWindow name="CleanOPBAnchor" show="true" />
            <CreateWindow name="CleanPetAnchor" show="true" />
            <CreateWindow name="CleanPlayerWindow" show="true" />
            <CreateWindow name="CleanGroupWindow" show="true" />
            <CallFunction name="CleanGroupWindow.Initialize" />
            <CallFunction name="CleanTargetWindow.Initialize" />
        </OnInitialize>
        <OnUpdate>
            <CallFunction name="CleanTargetWindow.OnUpdate" />
        </OnUpdate>
        <OnShutdown>
            <CallFunction name="CleanPlayerWindow.Shutdown" />
            <CallFunction name="CleanGroupWindow.Shutdown" />
            <CallFunction name="CleanTargetWindow.Shutdown" />
        </OnShutdown>
    </UiMod>
    
</ModuleFile>    

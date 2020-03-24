<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
    <UiMod name="ClosetGoblin" version="2.5.6" date="28/12/2018" >
        <VersionSettings gameVersion="1.4.2" windowsVersion="1.1" savedVariablesVersion="1.1" />
		<Author name="Philosound aka Wothor" email="philosound@CurseForge" />
        <Description text="A gear switching mod. The name pays homage to the WoW AddOn ClosetGnome. RoR fix by Sullemunk" />
        <Dependencies>
			<Dependency name="EASystem_DialogManager" optional="false" forceEnable="true" />
			<Dependency name="EASystem_WindowUtils" optional="false" forceEnable="true" />
			<Dependency name="EASystem_Utils" optional="false" forceEnable="true" />
            <Dependency name="EASystem_Tooltips" optional="false" forceEnable="true" />
            <Dependency name="EA_Cursor" optional="false" forceEnable="true" />
			<Dependency name="EA_ChatWindow" optional="false" forceEnable="true" />
			<Dependency name="EA_CharacterWindow" optional="false" forceEnable="true" />
			<Dependency name="EA_ContextMenu" optional="false" forceEnable="true" />
			<Dependency name="LibSlash" optional="true" forceEnable="true" />
        </Dependencies>
        <Files>        

			
			<File name="ClosetGoblin.lua" />
			<File name="ClosetGoblinCharacterWindow.lua" />
			<File name="ClosetGoblinZoneWindow.lua" />
			<File name="ClosetGoblinOptionWindow.lua" />
			<File name="Libs\LibToolkit.lua" />
			
            <File name="languages\english.lua" />
            <File name="languages\russian.lua" />
            <File name="languages\italian.lua" />
            <File name="languages\french.lua" />
            <File name="languages\s_chinese.lua" />
            <File name="languages\german.lua" />
            <File name="languages\japanese.lua" />
            <File name="languages\t_chinese.lua" />
            <File name="languages\spanish.lua" />
            <File name="languages\korean.lua" />
			<File name="ClosetGoblinItemRack.xml" />
            <File name="ClosetGoblin.xml" />
			</Files>
		<SavedVariables>
			<SavedVariable name="ClosetGoblin.setData" />
			<SavedVariable name="ClosetGoblin.settings" />
		</SavedVariables>
        <OnInitialize>
			<CreateWindow name="ClosetGoblinCharacterWindow" show="false" />
			<CreateWindow name="ClosetGoblinZoneWindow" show="false" />
			<CreateWindow name="ClosetGoblinOptionWindow" show="true" />
			<CreateWindow name="ClosetGoblinLoadWindow" show="false" />		
			
			
			<CallFunction name="CG_ItemRack.Initialize" />
			<CallFunction name="ClosetGoblin.OnInitialize" />
		</OnInitialize>
				<OnUpdate>
			<CallFunction name="ClosetGoblin.OnUpdate" />
		</OnUpdate>
		
		<OnShutdown>
			<CallFunction name="ClosetGoblin.OnShutdown" />
		</OnShutdown>
    </UiMod>    
</ModuleFile>
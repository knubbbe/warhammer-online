<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="SquaredConfigurator" version="1.0" date="28/10/2008" >

		<Author name="Aiiane" email="aiiane@aiiane.net" />
		<Description text="Graphical configuration interface for Squared." />
        
        <VersionSettings gameVersion="1.4.1" windowsVersion="1.0" />
        
        <Dependencies>
            <Dependency name="Squared" />
        </Dependencies>
        
		<Files>
            <File name="LibStub.lua" />
            <File name="LibGUI.lua" />
			<File name="LibSharedAssets.lua" />
            <File name="SquaredConfigurator.lua" />
            <File name="SettingValues.lua" />
            
            <!-- Panels -->
            <File name="ModesPanel.lua" />
            <File name="SizingPanel.lua" />
            <File name="LayoutPanel.lua" />
            <File name="BarsAndIconsPanel.lua" />
            <File name="TextPanel.lua" />
            <File name="MiscColorPanel.lua" />
            <File name="ClassColorPanel.lua" />
            <File name="ColorGroupPanel.lua" />
            <File name="DynamicColorPanel.lua" />
            <File name="StatusPanel.lua" />
            <File name="PerformancePanel.lua" />
            <File name="MiscPanel.lua" />
            <File name="ResetPanel.lua" />
			<File name="ProfilePanel.lua" />
            <File name="ImportExportPanel.lua" />
		</Files>
		
		<OnInitialize>
            <CallFunction name="SquaredConfigurator.Initialize" />
		</OnInitialize>
		<OnUpdate>
            <CallFunction name="SquaredConfiguratorClassTypeUpdate" />
            <CallFunction name="SquaredConfiguratorUpdateColorgroupPanelColorUP" />
            <CallFunction name="SquaredConfiguratorUpdateMiscColorPanel" />
        </OnUpdate>
		<OnShutdown/>
		
	</UiMod>
</ModuleFile>

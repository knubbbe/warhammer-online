<?xml version="1.0" encoding="UTF-8"?>

<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >

	<UiMod name="WSCT" version="1.37" date="3/11/2011" >

		<Author name="Grayhoof" email="" />
		
		<VersionSettings gameVersion="1.4.1" windowsVersion="1.0" savedVariablesVersion="1.0" />

		<Description text="Warhammer Scrolling Combat Text" />

		<Dependencies>
			<Dependency name="EASystem_Utils" />
			<Dependency name="EASystem_EventText" />
			<Dependency name="EA_SiegeWeaponWindow" />
			<Dependency name="EA_ChatWindow" />
			<Dependency name="EA_CareerResourcesWindow" />
		</Dependencies>

		<Files>
			<File name="wsct.xml" />
			<File name="wsct.lua" />
			<File name="wsct_config.lua" />
			<File name="locals/localization.lua" />
			<File name="wsct_animation.lua" />
			<File name="wsct_options/wsct_options.xml" />
			<File name="wsct_options/locals/localization.lua" />
			<File name="wsct_options/wsct_options_setup.lua" />
			<File name="wsct_options/wsct_options.lua" />
		</Files>

		<OnInitialize>
		  <CreateWindow name="WSCTContainer" show="true" />
			<CallFunction name="WSCT.OnInitialize" />
		</OnInitialize>

		<OnUpdate>
			<CallFunction name="WSCT.UpdateAnimation" />
		</OnUpdate>

		<OnShutdown>
			<CallFunction name="WSCT.OnShutdown" />
		</OnShutdown>

		<SavedVariables>
			<SavedVariable name="WSCT_CONFIG" />
		</SavedVariables>

	</UiMod>

</ModuleFile>
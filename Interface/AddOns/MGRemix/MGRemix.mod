<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="Miracle Grow Remix" version="2.33" date="29/11/2009" >
    <VersionSettings gameVersion="1.3.1" windowsVersion="2.13" savedVariablesVersion="2.13" />

		<Author name="Irinia of Volkmar" />
		<Description text="Secondary Cultivation UI to make things faster" />
		<Dependencies>
		  <Dependency name="EA_BackpackWindow" />
			<Dependency name="EA_BankWindow" />
			<Dependency name="EA_GuildWindow" />
			<Dependency name="EA_CultivationWindow" /> 
			<Dependency name="(Lib) Ira Config" /> 
		</Dependencies>

		<Files>
			<File name="MGRemix.lua" />
			<File name="config.lua" />
			<File name="layout.lua" />
			<File name="preset.lua" />
			<File name="context.lua" />
			<File name="harvrepeat.lua" />
			<File name="Localization.lua" />
			<File name="Localization-deDE.lua" />
			<File name="Localization-ruRU.lua" />
			<File name="Localization-frFR.lua" />
			<File name="MGRemix.xml" />
			<File name="layout.xml" />
			<File name="preset.xml" />
			<File name="config.xml" />
		</Files>
		
		<SavedVariables>
			<SavedVariable name="MiracleGrow2.vSettings" />
		</SavedVariables>

		<OnInitialize>
			<CreateWindow name="MiracleGrow2Icon" show="false" />
			<CreateWindow name="MiracleGrow2" show="true" />
		</OnInitialize>
		<OnUpdate>
		  <CallFunction name="MiracleGrow2.OnUpdate" />
		</OnUpdate>
		<OnShutdown/>
		
    <WARInfo>
      <Categories>
        <Category name="CRAFTING" />
      </Categories>
    </WARInfo>
	</UiMod>
</ModuleFile>

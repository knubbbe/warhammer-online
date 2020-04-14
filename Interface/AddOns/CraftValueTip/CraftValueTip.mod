<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="Crafting Info Tooltip" version="1.5.3" date="29/11/2009" >
    <VersionSettings gameVersion="1.3.1" windowsVersion="1.24" savedVariablesVersion="1.24" />

		<Author name="Irinia of Volkmar" />
		<Description text="Adds crafting values to item tooltips.  Provides crafting data to other add-ons." />

    <Dependencies>
      <Dependency name="EA_ChatWindow" />
    	<Dependency name="EASystem_Tooltips" />
			<Dependency name="(Lib) Ira Config" /> 
    </Dependencies>
        
		<Files>
			<File name="CraftValueTip.lua" />
			<File name="config.xml" />
			<File name="config.lua" />
			<File name="Localization.lua" />
			<File name="Localization-deDE.lua" />
			<File name="Localization-frFR.lua" />
			<File name="Localization-ruRU.lua" />
			<File name="Localization-zhTW.lua" />
			<File name="Localization-itIT.lua" />
			<File name="CraftData.lua" />
			<File name="CraftInfoAPI.lua" />
		</Files>

		<SavedVariables>
			<SavedVariable name="CraftValueTip.settings" global="true" />
		</SavedVariables>

		<OnInitialize>
			<CallFunction name="CraftValueTip.Initialize" />
		</OnInitialize>
		
		<OnShutdown>
			<CallFunction name="CraftValueTip.ShutDown" />
		</OnShutdown>

    <WARInfo>
      <Categories>
        <Category name="CRAFTING" />
      </Categories>
    </WARInfo>
	</UiMod>
</ModuleFile>

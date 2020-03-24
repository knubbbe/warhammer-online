<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="RoR_SoR" version="1.0.4" date="22/3/2018" >
		<VersionSettings gameVersion="1.4.8" windowsVersion="1.0" savedVariablesVersion="1.0" />
		<Author name="Sullemunk, Hargrim"/>
		<Description text="Return of Realm" />
		 <Dependencies>                
            <Dependency name="EATemplate_DefaultWindowSkin" />
            <Dependency name="EASystem_Utils" />
            <Dependency name="EASystem_WindowUtils" />
            <Dependency name="EASystem_Tooltips" />
            <Dependency name="EA_ChatWindow" />
          <Dependency name="EA_SiegeWeaponWindow" />			
        </Dependencies>	
		<Files>
		<File name="RoR_SoR.lua" />		
	    <File name="RoR_SoR.xml" />		
		<File name="RoR_SoR_T4.lua" />
	    <File name="RoR_SoR_T4.xml" />	
	    <File name="RoR_SoR_T5.xml" />			
		<File name="RoR_SoR_T3.lua" />
	    <File name="RoR_SoR_T3.xml" />	
		<File name="RoR_SoR_T2.lua" />
	    <File name="RoR_SoR_T2.xml" />	
		<File name="RoR_SoR_T1.lua" />	
	    <File name="RoR_SoR_T1.xml" />			
		</Files>
		<OnInitialize>
		<CallFunction name="RoR_SoR.OnInitialize" /> 	
		<CallFunction name="RoR_SoR_T1.OnInitialize" /> 		
		<CallFunction name="RoR_SoR_T2.OnInitialize" /> 		
		<CallFunction name="RoR_SoR_T3.OnInitialize" /> 
		<CallFunction name="RoR_SoR_T4.OnInitialize" /> 		
		</OnInitialize>
			<SavedVariables>
			<SavedVariable name="RoR_SoR.ShowTier" global="false"/>
			</SavedVariables>
		<OnUpdate>
		<CallFunction name="RoR_SoR.Update" />	
		<CallFunction name="RoR_SoR_T1.TimeUpdate" />				
		<CallFunction name="RoR_SoR_T2.TimeUpdate" />		
		<CallFunction name="RoR_SoR_T3.TimeUpdate" />
		<CallFunction name="RoR_SoR_T4.TimeUpdate" />		
    	</OnUpdate>
        <OnShutdown>
        </OnShutdown>
		
		
	</UiMod>
</ModuleFile>
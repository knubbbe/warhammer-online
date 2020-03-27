<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="Warbuilder" version="2.0.4" date="18/13/2019">
		<VersionSettings gameVersion="1.4.8" windowsVersion="1.0" savedVariablesVersion="1.0" /> 
		<Author name="Sullemunk" />
        <Description text=" Plan, Build and Share Speccs addon made by Sullemunk for RoR" />
         <Dependencies>  
      <Dependency name="EA_AbilitiesWindow" />    		 
      <Dependency name="EA_ChatWindow" />         
      <Dependency name="LibSlash" />       
    </Dependencies>             
        <Files>
		
          <File name="Source/Warbuilder.lua" />
		  <File name="Source/Warbuilder.xml" />
		            
		<File name="Definitions/IronBreaker.lua" />
		<File name="Definitions/Slayer.lua" />
		<File name="Definitions/RunePriest.lua" />
		<File name="Definitions/Engineer.lua" />		
		<File name="Definitions/BlackOrc.lua" />	
		<File name="Definitions/Choppa.lua" />		
		<File name="Definitions/Shaman.lua" />		
        <File name="Definitions/SquigHerder.lua" />	
		<File name="Definitions/WichHunter.lua" />
		<File name="Definitions/Knight.lua" />		
		<File name="Definitions/BrightWizzard.lua" />
		<File name="Definitions/WarriorPriest.lua" />	
        <File name="Definitions/Chosen.lua" />	
        <File name="Definitions/Marauder.lua" />					
        <File name="Definitions/Zealot.lua" />
        <File name="Definitions/Magus.lua" />		  
        <File name="Definitions/SwordMaster.lua" />	
        <File name="Definitions/ShadowWarrior.lua" />	
        <File name="Definitions/WhiteLion.lua" />	
        <File name="Definitions/ArchMage.lua" />
        <File name="Definitions/BlackGuard.lua" />
        <File name="Definitions/WichElf.lua" />		
        <File name="Definitions/DoK.lua" />		
        <File name="Definitions/Sorcerer.lua" />				
		
		
        </Files>          
	<OnInitialize>
             <CallFunction name="Warbuilder.Initilize" />
        </OnInitialize>
		<SavedVariables>
			<SavedVariable name="Warbuilder.Debug" global="true"/>
		</SavedVariables>		
        <OnUpdate/>
        <OnShutdown>
		 <CallFunction name="Warbuilder.Shutdown" />
		</OnShutdown> 
    </UiMod>
</ModuleFile>
<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">  
  <UiMod name="TargetRing" version="1.3.2" date="10/25/2008" >    
    <VersionSettings gameVersion="1.9.9" windowsVersion="1.0" savedVariablesVersion="1.0" />    
    <Author name="Talvinen" email="redefiance@gmx.de" />    
    <Description text="" />         
    <Dependencies>      
      <Dependency name="LibSlash" />    
    </Dependencies>    
    <Files>      
      <File name="libs\LibStub.lua" />      
      <File name="libs\LibGUI.lua" />      
      <File name="libs\LibConfig.lua" />      
      <File name="TargetRing.xml" />      
      <File name="TargetRing.lua" />    
    </Files>    
    <SavedVariables>      
      <SavedVariable name="TargetRing.Settings" />    
    </SavedVariables>    
    <OnInitialize>      
      <CallFunction name="TargetRing.Initialize" />    
    </OnInitialize>  
  </UiMod>
</ModuleFile>
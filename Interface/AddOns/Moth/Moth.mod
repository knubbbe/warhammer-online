<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >	
  <UiMod name="Moth" version="1.2.1" date="2009-05-03T21:39:12Z" >		
    <Author name="tronned" email="tronned@verizon.net" />		
    <Description text="Mouse Over Target Hover ~>
      <<br>
      <br>Version: 1.21 Revision: 48 Date: 20090503213912" />         
      <VersionSettings gameVersion="1.9.9" windowsVersion="1.0" savedVariablesVersion="1.0" />		
      <Dependencies>			
        <Dependency name="EA_MouseOverTargetWindow" /> 
        <!-- Coutersy of Aiiane and beatrix_kiddo <3 -->			
        <Dependency name="EASystem_Tooltips" />			
        <!--
        			<Dependency name="LibSlash" />
        			-->		
      </Dependencies>		
      <Files>			
        <File name="MothHelpers.lua" />			
        <File name="MothProfiles.lua" />			
        <File name="MothSettings.lua" />			
        <File name="MothPlugins.lua" />			
        <File name="Moth.lua" />			
        <File name="GuidanceCounselor.lua" />			
        <File name="Moth.xml" />		
      </Files>		
      <OnInitialize>			
        <CallFunction name="Moth.Initialize" />		
      </OnInitialize>		
      <OnUpdate>			
        <CallFunction name="Moth.Update" />		
      </OnUpdate>  		
      <OnShutdown />	
  </UiMod>
</ModuleFile>
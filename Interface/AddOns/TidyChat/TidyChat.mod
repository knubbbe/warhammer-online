<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">  
  <UiMod name="TidyChat" version="2.2.6" date="2011/06/08" >    
    <Author name="Raidez" email="raidez@mail.ru" />    
    <Description text="Adds more options to change chat windows.<br>Slash command: /tchat" />     
      <VersionSettings gameVersion="1.9.9" windowsVersion="2.0" savedVariablesVersion="2.0" />    
      <Dependencies>      
        <Dependency name="EA_ChatWindow" />    
      </Dependencies>    
      <Files>      
        <File name="TidyChatTemplates.xml" />      
        <File name="TidyChatTabWindows.xml" />      
        <File name="TidyChatTabTextEntry.xml" />      
        <File name="TidyChatTabLogs.xml" />      
        <File name="TidyChatTabMisc.xml" />      
        <File name="TidyChat.xml" />      
        <File name="TidyChatCopy.xml" />      
        <File name="TidyChatLootRoll.xml" />      
        <File name="TidyChat.lua" />    
      </Files>    
      <OnInitialize>      
        <CreateWindow name="TidyChatOptions" show="false" />      
        <CreateWindow name="TidyChatCopy" show="false" />      
        <CreateWindow name="TidyChatLootRoll" show="false" />      
        <CallFunction name="TidyChat.Initialize" />    
      </OnInitialize>    
      <OnShutdown>      
        <CallFunction name="TidyChat.OnShutdown" />    
      </OnShutdown>    
      <SavedVariables>      
        <SavedVariable name="TidyChat.Settings" />    
      </SavedVariables>    
      <OnUpdate/>    
      <WARInfo>      
        <Categories>        
          <Category name="CHAT" />      
        </Categories>      
        <Careers>        
          <Career name="BLACKGUARD" />        
          <Career name="WITCH_ELF" />        
          <Career name="DISCIPLE" />        
          <Career name="SORCERER" />        
          <Career name="IRON_BREAKER" />        
          <Career name="SLAYER" />        
          <Career name="RUNE_PRIEST" />        
          <Career name="ENGINEER" />        
          <Career name="BLACK_ORC" />        
          <Career name="CHOPPA" />        
          <Career name="SHAMAN" />        
          <Career name="SQUIG_HERDER" />        
          <Career name="WITCH_HUNTER" />        
          <Career name="KNIGHT" />        
          <Career name="BRIGHT_WIZARD" />        
          <Career name="WARRIOR_PRIEST" />        
          <Career name="CHOSEN" />        
          <Career name="MARAUDER" />        
          <Career name="ZEALOT" />        
          <Career name="MAGUS" />        
          <Career name="SWORDMASTER" />        
          <Career name="SHADOW_WARRIOR" />        
          <Career name="WHITE_LION" />        
          <Career name="ARCHMAGE" />      
        </Careers>    
      </WARInfo>       
  </UiMod>
</ModuleFile>
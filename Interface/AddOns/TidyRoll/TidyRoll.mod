<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<UiMod name="TidyRoll" version="1.3.2" date="2010/05/24" >
  
  <Author name="Raidez" email="raidez@mail.ru" />
  <Description text="A compact replacement for default Roll Window.<br>Slash command: /troll" />

  <VersionSettings gameVersion="1.3.6" windowsVersion="1.0" savedVariablesVersion="1.0" />
  
  <Files>
    <File name="textures/textures.xml" />
    <File name="TidyRoll.xml" />
    <File name="CustomAutoRoll.xml" />
    <File name="TidyRollFrame.lua" />
    <File name="TidyRollOptions.lua" />
    <File name="CustomAutoRoll.lua" />
    <File name="TidyRoll.lua" />
  </Files>

  <Dependencies>
    <Dependency name="EATemplate_DefaultWindowSkin" />
    <Dependency name="EASystem_WindowUtils" />
    <Dependency name="EASystem_Utils" />
    <Dependency name="EASystem_LayoutEditor" />
    <Dependency name="EA_ActionBars" />
    <Dependency name="EA_BackpackWindow" />
    <Dependency name="EA_Cursor" />
    <Dependency name="EA_LootWindow" optional="true" />
  </Dependencies>
  
  <OnInitialize>
    <CallFunction name="TidyRoll.Initialize" />
  </OnInitialize>
  
  <OnUpdate/>
  
  <OnShutdown>
    <CallFunction name="TidyRoll.Shutdown" />
  </OnShutdown>

  <WARInfo>
    <Categories>
      <Category name="ITEMS_INVENTORY" />
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
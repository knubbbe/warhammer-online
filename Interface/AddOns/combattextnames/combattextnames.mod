<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="CombatTextNames" version="1.5" date="2020-04-27">
        <VersionSettings gameVersion="1.4.8" windowsVersion="1.0"/>

        <Author name="cupnoodles" email="cupn8dles@gmail.com"/>
        <Description text="Large bold font and ability names (or icons) for 
combat text. To change settings, edit the .lua file.

Ability icons based on implementation by Fox."/>

        <Dependencies>
            <Dependency name="EASystem_EventText"/>
        </Dependencies>

        <Files>
            <File name="templates_eventtext.xml" />
            <File name="combattextnames.lua" />
            <File name="config.lua" />
            <File name="cmd.lua" />
        </Files>

        <SavedVariables>
            <!-- <SavedVariable name="CombatTextNames.Settings" /> -->
        </SavedVariables>

        <OnInitialize>
            <CallFunction name="CombatTextNames.Initialize" />
        </OnInitialize>

        <WARInfo>
            <Categories>
                <Category name="COMBAT" />
            </Categories>
        </WARInfo>

    </UiMod>
</ModuleFile>

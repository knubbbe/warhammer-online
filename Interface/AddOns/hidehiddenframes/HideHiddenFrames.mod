<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="HideHiddenFrames" version="1.0.1" date="2019-11-14">
        <VersionSettings gameVersion="1.4.8" windowsVersion="1.0" savedVariablesVersion="1.0"/>

        <Author name="cupnoodles" email="cupn8dles@gmail.com"/>
        <Description text="Hide gray frames in layout editor completely. You can make windows visible again using the 'Windows' window anyway."/>

        <Dependencies>
            <Dependency name="EASystem_LayoutEditor"/>
        </Dependencies>

        <Files>
            <File name="HideHiddenFrames.lua" />
        </Files>

        <OnInitialize>
            <CallFunction name="HideHiddenFrames.Initialize" />
        </OnInitialize>

        <WARInfo>
            <Categories>
                <Category name="INTERFACE" />
            </Categories>
        </WARInfo>

    </UiMod>
</ModuleFile>

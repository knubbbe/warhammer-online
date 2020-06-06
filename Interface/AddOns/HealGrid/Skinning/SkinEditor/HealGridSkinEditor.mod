<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
    <UiMod name="HealGridSkinEditor" version="1.0" date="2009/05/16" >
		<VersionSettings gameVersion="1.3.0" windowsVersion="1.0" savedVariablesVersion="1.0" />
        <Author name="rmet0815" email="" />
        <Description text="Skin Editor for HealGrid. For exact version information please refer to HealGrid." />
        <Dependencies>        
            <Dependency name="HealGrid" />
        </Dependencies>
        <SavedVariables>
        </SavedVariables>
        <Files>
            <File name="HGSELabelHelp.xml" />
            <File name="HGSESkinTree.xml" />
            <File name="HGSESkinNode.xml" />
            <File name="Attributes/HGSESkinAttribute.xml" />
            <File name="Attributes/HGSESkinAttributeEmpty.xml" />
            <File name="Attributes/HGSESkinAttributeInt.xml" />
            <File name="Attributes/HGSESkinAttributeUInt.xml" />
            <File name="Attributes/HGSESkinAttributeFont.xml" />
            <File name="Attributes/HGSESkinAttributeDropDownList.xml" />
            <File name="Attributes/HGSESkinAttributeAnchor.xml" />
            <File name="Attributes/HGSESkinAttributeAnchorPoint.xml" />
            <File name="Attributes/HGSESkinAttributeString.xml" />
            <File name="Attributes/HGSESkinAttributeWString.xml" />
            <File name="Attributes/HGSESkinAttributeColor.xml" />
            <File name="Attributes/HGSESkinAttributeColorPlus.xml" />
            <File name="Attributes/HGSESkinAttributeLabel.xml" />
            <File name="Attributes/HGSESkinAttributeBoolean.xml" />
            <File name="Attributes/HGSESkinAttributeSlider.xml" />
            <File name="Attributes/HGSESkinAttributeTexture.xml" />
            <File name="Attributes/HGSESkinAttributeOffset.xml" />
            <File name="Actions/HGSESkinLoad.xml" />
            <File name="Actions/HGSESkinSave.xml" />
            <File name="Actions/HGSESkinReset.xml" />
            <File name="HealGridSkinEditor.xml" />
            <File name="HGSELabelHelp.lua" />
            <File name="Attributes/HGSESkinAttribute.lua" />
            <File name="Attributes/HGSESkinAttributeEmpty.lua" />
            <File name="Attributes/HGSESkinAttributeInt.lua" />
            <File name="Attributes/HGSESkinAttributeUInt.lua" />
            <File name="Attributes/HGSESkinAttributeFont.lua" />
            <File name="Attributes/HGSESkinAttributeDropDownList.lua" />
            <File name="Attributes/HGSESkinAttributeAnchor.lua" />
            <File name="Attributes/HGSESkinAttributeAnchorPoint.lua" />
            <File name="Attributes/HGSESkinAttributeString.lua" />
            <File name="Attributes/HGSESkinAttributeWString.lua" />
            <File name="Attributes/HGSESkinAttributeColor.lua" />
            <File name="Attributes/HGSESkinAttributeColorPlus.lua" />
            <File name="Attributes/HGSESkinAttributeLabel.lua" />
            <File name="Attributes/HGSESkinAttributeBoolean.lua" />
            <File name="Attributes/HGSESkinAttributeSlider.lua" />
            <File name="Attributes/HGSESkinAttributeTexture.lua" />
            <File name="Attributes/HGSESkinAttributeOffset.lua" />
            <File name="Actions/HGSESkinLoad.lua" />
            <File name="Actions/HGSESkinSave.lua" />
            <File name="Actions/HGSESkinReset.lua" />
            <File name="HealGridSkinEditor.lua" />
        </Files>
        <OnInitialize>
            <CallFunction name="HealGridSkinEditor.Initialize" />
        </OnInitialize>
        <OnUpdate>
        </OnUpdate>
        <OnShutdown>
            <CallFunction name="HealGridSkinEditor.Shutdown" />
        </OnShutdown>
    </UiMod>
</ModuleFile>    

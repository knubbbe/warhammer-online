<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" >
    <UiMod name="RMetLib" version="2.0.0" date="2008/12/04" >
		<VersionSettings gameVersion="1.2.1" windowsVersion="1.0" savedVariablesVersion="1.0" />	
        <Author name="rmet0815" email="" />
        <Description text="RMetLib is a collection of functions and modules to be used for addon development." />
        <Dependencies>        
            <Dependency name="EASystem_ResourceFrames" />
        </Dependencies>
        <SavedVariables>
        </SavedVariables>
        <Files>
            <File name="Gui/RMetGuiTemplates.xml" />
            <File name="ColorPicker/RMetColorPicker.xml" />
            <File name="RMetUtility.lua" />
            <File name="RMetColors.lua" />
            <File name="Gui/RMetGuiUtility.lua" />
            <File name="Gui/RMetGuiObject.lua" />
            <File name="Gui/RMetGuiComboBox.lua" />
            <File name="Gui/RMetGuiCheckButton.lua" />
            <File name="Gui/RMetGuiRadioButton.lua" />
            <File name="Gui/RMetGuiSliderBar.lua" />
            <File name="Gui/RMetGuiColorPickerButton.lua" />
            <File name="Gui/RMetGuiBroker.lua" />
            <File name="ColorPicker/RMetColorPicker.lua" />
			<File name="assets.xml" />
        </Files>
        <OnInitialize>
			 <CallFunction name="RMetColorPicker.Initialize" />
        </OnInitialize>
        <OnUpdate>
        </OnUpdate>
        <OnShutdown>
        </OnShutdown>
    </UiMod>
</ModuleFile>    

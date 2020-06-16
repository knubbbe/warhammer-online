<?xml version="1.0" encoding="UTF-8"?>

<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="RangeFadingSquared" version="1.3.2" date="12/12/2010" >
	    <VersionSettings gameVersion="1.4.0" windowsVersion="1.0" savedVariablesVersion="1.0" />
		<Author name="Wothor aka philosound" email="philosound@gmail.com" />
		<Description text="Alternative Rangefading for Squared. Uses and demonstrates LibRange." />
        
        <Dependencies>
            <Dependency name="EASystem_TargetInfo"/>
            <Dependency name="EASystem_Utils"/>  
            <Dependency name="EA_ChatWindow"/>
            <Dependency name="Squared" />
			<Dependency name="SquaredSettings" />
            <Dependency name="SquaredConfigurator"/>
			<Dependency name="LibRange" optional="false" forceEnable="true" />
        </Dependencies>
        
		<Files>
			<File name="RangeFadingSquared.lua" />
		</Files>
		
		<SavedVariables>
            <!--<SavedVariable name="RangeFadingSquared.Settings" />-->
        </SavedVariables>
		
		<OnInitialize>
      		<CallFunction name="RangeFadingSquared.Initialize" />
		</OnInitialize>
		
		<OnUpdate/>
		
		<OnShutdown>
			<CallFunction name="RangeFadingSquared.Shutdown" />
		</OnShutdown>
		
	</UiMod>
</ModuleFile>
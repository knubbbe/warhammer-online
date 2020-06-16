<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="SquaredBuffIndicators" version="1.2" date="9/12/2008" >

		<Author name="Aiiane" email="aiiane@aiiane.net" />
		<Description text="Buff/debuff indicator plugin for Squared." />
        
        <VersionSettings gameVersion="1.4.1" />

        
        <Dependencies>
            <Dependency name="Squared" />
        </Dependencies>
        
		<Files>
            <File name="SquaredBuffIndicators2.lua" />
		</Files>
		
		<OnInitialize>
            <CallFunction name="SquaredBuffIndicators.Initialize" />
		</OnInitialize>
		<OnUpdate>
            <CallFunction name="SquaredBuffIndicators.OnUpdate" />
        </OnUpdate>
		<OnShutdown/>
		
	</UiMod>
</ModuleFile>

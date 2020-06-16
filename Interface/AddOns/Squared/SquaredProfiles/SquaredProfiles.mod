<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="SquaredProfiles" version="1.0" date="02/1/2009" >

		<Author name="Aiiane" email="aiiane@aiiane.net" />
		<Description text="Stores saved profiles for Squared settings." />
        
        <VersionSettings gameVersion="1.4.1" savedVariablesVersion="1.0" />
        
		<Dependencies>
            <Dependency name="Squared" />
			<Dependency name="SquaredSettings" />
        </Dependencies>
        
        <SavedVariables>
            <SavedVariable name="Squared.Profiles" global="true" />
        </SavedVariables>
        
        <Files/>
		
		<OnInitialize/>
		<OnUpdate/>
		<OnShutdown/>
		
	</UiMod>
</ModuleFile>

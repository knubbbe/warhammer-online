<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="ThankTheResser" version="1.2" date="12/10/2016">
        <Author name="Sullemunk" email="" />
        <Description text="Written with insperation from ThankTheHealer, for RoR by Sullemunk" />
       
		<Dependencies>
	    	<Dependency name="EA_ChatWindow" />
	    	<Dependency name="LibSlash" />
        </Dependencies>
 
		<Files>
            <File name="ThankTheResser.lua" />           
        </Files>
        
		<OnInitialize>
            <CallFunction name="ThankTheResser.Initialize" />
        </OnInitialize>
       
		<SavedVariables>
        	<SavedVariable name="ThankTheResser.Settings" />
        </SavedVariables> 

		<OnUpdate/>
 
		<OnShutdown>
            <CallFunction name="ThankTheResser.Shutdown" />
        </OnShutdown>
        
    </UiMod>
</ModuleFile>
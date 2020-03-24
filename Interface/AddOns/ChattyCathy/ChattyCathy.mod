<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <UiMod name="ChattyCathy" version="1.0" date="10/29/2008">
        <Author name="NigelTufnel" email="adam.dew@gmail.com" />
        <Description text="Optimizes chat windows to be more space efficient and clutter free. Allows moving of text entry box, moving/hiding scrollbars, and hides unneeded clutter. /cc brings up the option window and /cc s or /cc show will show hidden clutter." />
        <Dependencies>
		<Dependency name="LibSlash" />
	</Dependencies>
        <Files>
            <File name="ChattyCathy.lua" />
            <File name="ChattyCathy.xml" />
        </Files>
        <OnInitialize>
            <CallFunction name="ChattyCathy.Init" />
        </OnInitialize>
		<SavedVariables>
			<SavedVariable name="ChattyCathyVars"/>
			<SavedVariable name="ChattyCathyTabs"/>
		</SavedVariables>
        <OnUpdate />
        <OnShutdown />
    </UiMod>
</ModuleFile>

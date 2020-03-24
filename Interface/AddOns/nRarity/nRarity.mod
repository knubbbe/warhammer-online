<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="nRarity" version="1.3.6-r149-release">

		<Author name="nemes" />

		<Description text="Displays a border with the colour of the rarity around item icons" />

		<VersionSettings gameVersion="1.3.6" windowsVersion="1.0" savedVariablesVersion="1.0" />

		<Dependencies>
		  <Dependency name="EA_BackpackWindow" />
		</Dependencies>

		<Files>
			<!-- default UI bits -->
			<File name="source/nRarity.lua" />
			<File name="source/Border.lua" />
			<File name="source/Container.lua" />
			<File name="source/containers/AuctionHouse.lua" />
			<File name="source/containers/AuctionHouseItem.lua" />
			<File name="source/containers/BackpackIconCrafting.lua" />
			<File name="source/containers/BackpackIconCurrency.lua" />
			<File name="source/containers/BackpackIconInventory.lua" />
			<File name="source/containers/BackpackList.lua" />
			<File name="source/containers/Bank.lua" />
			<File name="source/containers/Character.lua" />
			<File name="source/containers/ChooseOneLootWindow.lua" />
			<File name="source/containers/GuildVault.lua" />
			<File name="source/containers/Inspection.lua" />
			<File name="source/containers/InteractionInfluenceRewards.lua" />
			<File name="source/containers/InteractionQuest.lua" />
			<File name="source/containers/InteractionStore.lua" />
			<File name="source/containers/LootWindow.lua" />
			<File name="source/containers/LootRollWindow.lua" />
			<File name="source/containers/MailMessage.lua" />
			<File name="source/containers/MailSend.lua" />
			<File name="source/containers/TomeQuest.lua" />
			<File name="source/containers/TomeWarJournal.lua" />
			<File name="source/containers/TradeOther.lua" />
			<File name="source/containers/TradeSelf.lua" />
			<File name="source/nRarity.xml" />

			<!-- other addons -->
			<File name="source/containers/ClosetGob.lua" />
			<File name="source/containers/CvCharacter.lua" />
			<File name="source/containers/CvBackpackIcon.lua" />
			<File name="source/containers/CvBackpackList.lua" />
			<File name="source/containers/CvBank.lua" />
			<File name="source/containers/nLL.lua" />
			<File name="source/containers/zMailModMassMail.lua" />
		</Files>

		<OnInitialize>
			<CallFunction name="nRarity.init" />
		</OnInitialize>

		<OnUpdate/>

		<OnShutdown/>

		<SavedVariables/>
	</UiMod>
</ModuleFile>

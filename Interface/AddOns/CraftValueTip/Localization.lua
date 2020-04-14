--[[
  Crafting Info Tooltip v1.51

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.

  This file, Localization.lua, contains all of the text so that it can be
  translated and replaced easily.
]]--

--d("Local")

CraftValueTip.T[SystemData.Settings.Language.ENGLISH]={
	Bonuses = {
		bonus1 = L"Stability",
		bonus10 = L"Stage Grow Time",
		bonus11 = L"Herb",
		bonus12 = L"Critical Chance",
		bonus13 = L"Fail Chance",
		bonus14 = L"Super-Critical Chance",
		bonus15 = L"Breakable",
		bonus2 = L"Power",
		bonus3 = L"Duration",
		bonus4 = L"Multiplier",
		bonus5 = L"Tradeskill",
		bonus6 = L"Effect",
		bonus7 = L"Slots",
		bonus8 = L"Item Type",
		bonus9 = L"Requires Level",
	},
	EffectNames = {
		acc = L"Accuracy",
		ap = L"Energy",
		apdrain = L"AP Drain on Your Damage",
		arm = L"Armor",
		autoheal = L"Reactive Heal",
		crit = L"Melee Crit",
		dmg = L"Molotov",
		dmgaoe = L"Napalm",
		dmgcone = L"Flaming Breath",
		dyeblue = L"Seaguard Blue",
		dyebrown = L"Scorched Brown",
		dyedarkblue = L"Dark Sea Blue",
		dyedarkivory = L"Dark Ivory",
		dyedarkpeach = L"Dark Peach",
		dyedarkpurple = L"Dark Purple",
		dyedarkred = L"Dark Red",
		dyegreen = L"Goblin Green",
		dyepurple = L"Liche Purple",
		dyered = L"Red Gore",
		dyeyellow = L"Golden Yellow",
		freecast = L"Free Cast Chance",
		hcrit = L"Healing Crit",
		heal = L"Healing",
		hpower = L"Healing Power",
		hyaccrcrit = L"Ballistics+Ranged Crit",
		hyhpregencritdmg = L"Healthregen+Reduced Crit Dmg",
		hyintmcrit = L"Intelligence+Magic Crit",
		hyresist = L"All resists +45",
		hystrheal = L"Strength+Healing",
		hystrmelee = L"Strength+Melee",
		hytoucrit = L"Toughness+Melee Crit",
		hytounocrit = L"Toughness+Reduced chance to be Crit",
		hywillheal = L"Willpower+Healing",
		hywouarmpen = L"Wounds+Reduced armor pen.",
		hywoucrit = L"Wounds+Melee Crit",
		hywouheal = L"Wounds+Healing",
		hywouinit = L"Wounds+Initiative",
		hywoumcrit = L"Wounds+Magic Crit",
		hywoumelee = L"Wounds+Melee",
		hywourcrit = L"Wounds+Ranged Crit",
		hywoustr = L"Wounds+Strength",
		ini = L"Initiative",
		int = L"Intelligence",
		mgcrit = L"Magic Crit",
		mgpower = L"Magic Power",
		morale = L"Morale Gain",
		movespeed = L"Move Speed",
		mpower = L"Melee Power",
		mskill = L"Weapon Skill",
		pet = L"Summon Pet",
		rcorp = L"Corporeal Resist",
		rcrit = L"Ranged Crit",
		reactspd = L"Move Speed on Enemy Damage",
		regen = L"Restoration",
		rele = L"Elemental Resist",
		rez = L"Resurrection",
		rpower = L"Ranged Power",
		rskill = L"Ballistics",
		rspi = L"Spirit Resist",
		shabs = L"Absorb Shield",
		shdmg = L"Thorn Shield",
		snare = L"Snare",
		str = L"Strength",
		tou = L"Toughness",
		trapoth = L"Apothecary Skill",
		trcult = L"Cultivation Skill",
		trsalv = L"Magical Salvaging Skill",
		trtal = L"Talisman Making Skill",
		wil = L"Willpower",
		wou = L"Wounds",
	},
	EffectTiers = {
		tier0 = L"{1} (Tier 0)",
		tier1 = L"{1} (Tier 1)",
		tier2 = L"{1} (Tier 2)",
		tier3 = L"{1} (Tier 3)",
		tier4 = L"{1} (Tier 4)",
		tier5 = L"{1} (Tier 5)",
	},
	Format = {
		bonus = L"Bonus {1}",
		effect = L"Effect={1}",
		grows = L"Grows {1}",
	},
	ItemTypes = {
		cult1 = L"Seed",
		cult2 = L"Soil",
		cult3 = L"Watering Can",
		cult4 = L"Nutrient",
		cult5 = L"Spore",
		item1 = L"Stabilizer",
		item13 = L"Container",
		item14 = L"Fragment",
		item15 = L"Gold",
		item16 = L"Curio",
		item17 = L"Magic Essence",
		item18 = L"Stimulant",
		item2 = L"Main Ingredient",
		item3 = L"Extender",
		item4 = L"Multiplier",
		item5 = L"Container",
		item6 = L"Dye Container",
		item8 = L"Pigment",
		item9 = L"Fixer",
	},
	Messages = {
		DebugOff = L"CraftValueTip: Dev mode off",
		DebugOn = L"CraftValueTip: Dev mode on",
		Greeting = L"Crafting Info Tooltip by Irinia of Volkmar loaded.  Use /craftvaluetip help for command list",
		List0 = L"/craftvaluetip -- Open configuration window",
		List1 = L"/craftvaluetip off -- Disable tooltip display",
		List2 = L"/craftvaluetip on -- Enable tooltip display",
		List3 = L"/craftvaluetip dev off -- Disable extended developer display",
		List4 = L"/craftvaluetip dev on -- Enable extended developer display",
		List5 = L"/craftvaluetip dump -- Display the complete item data of the last tooltip displayed",
		List6 = L"/craftvaluetip digest -- Display partial information for the last tooltip displayed",
		List7 = L"/craftvaluetip seed {off|plant|pigment|both} -- Sets what seed result tooltips to show",
		SeedDyeOff = L"CraftValueTip: Not displaying tooltips for pigment results from seeds",
		SeedDyeOn = L"CraftValueTip: Displaying tooltips for pigment results from seeds",
		SeedPlantOff = L"CraftValueTip: Not displaying tooltips for plant results from seeds",
		SeedPlantOn = L"CraftValueTip: Displaying tooltips for plant results from seeds",
		TipOff = L"CraftValueTip: Tooltip stats off",
		TipOn = L"CraftValueTip: Tooltip stats on",
	},
	Prof = {
		prof3 = L"Cultivation",
		prof4 = L"Apothecary",
		prof5 = L"Talisman Making",
		prof6 = L"Salvaging",
	},
	SeedClasses = {
		purch = L"Purchased",
		quest = L"Quest",
		rare = L"Rare",
		std = L"Standard",
	},
	config = {
		langdefault = L"Use default",
		langthis = L"English",
		language = L"Language",
		showdev = L"Show developer info",
		showinfo = L"Show crafting stats",
		tabtip = L"Crafting Info Tooltip",
		version = L"Crafting Info Tooltip by Irinia of Volkmar v{1}",
	},
}

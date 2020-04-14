--[[
  Crafting Info Tooltip v1.51

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.

  This file, Localization.lua, contains all of the text so that it can be
  translated and replaced easily.
]]--

--d("Local")

CraftValueTip.T[SystemData.Settings.Language.FRENCH]={
	Bonuses = {
		bonus1 = L"Stabilité",
		bonus10 = L"Durée pousse",
		bonus11 = L"Herbe",
		bonus12 = L"Chance critique",
		bonus13 = L"Risque d'échec",
		bonus14 = L"Chance spéciale", -- Needs review
		bonus15 = L"Cassable",
		bonus2 = L"Puissance",
		bonus3 = L"Durée",
		bonus4 = L"Multiplicateur",
		bonus5 = L"Tradeskill", -- Requires localization
		bonus6 = L"Effet",
		bonus7 = L"Emplacement",
		bonus8 = L"Item Type", -- Requires localization
		bonus9 = L"Requires Level", -- Requires localization
	},
	EffectNames = {
		acc = L"Précision",
		ap = L"Energie",
		apdrain = L"AP Drain on Your Damage", -- Requires localization
		arm = L"Armure",
		autoheal = L"Reactive Heal", -- Requires localization
		crit = L"Melee Crit", -- Requires localization
		dmg = L"Feu",
		dmgaoe = L"Explosion de feu",
		dmgcone = L"Souffle de feu",
		dyeblue = L"Bleu mer",
		dyebrown = L"Marron roussi",
		dyedarkblue = L"Dark Sea Blue", -- Requires localization
		dyedarkivory = L"Dark Ivory", -- Requires localization
		dyedarkpeach = L"Dark Peach", -- Requires localization
		dyedarkpurple = L"Dark Purple", -- Requires localization
		dyedarkred = L"Dark Red", -- Requires localization
		dyegreen = L"Vert goblin",
		dyepurple = L"Liche violette",
		dyered = L"Rouge sang",
		dyeyellow = L"Jaune or",
		freecast = L"Free Cast Chance", -- Requires localization
		hcrit = L"Healing Crit", -- Requires localization
		heal = L"Soin",
		hpower = L"Healing Power", -- Requires localization
		hyaccrcrit = L"Capacité de tir+Critique de tirs à distance",
		hyhpregencritdmg = L"Healthregen+Reduced Crit Dmg", -- Requires localization
		hyintmcrit = L"Intelligence+Critique de magie",
		hyresist = L"All resists +45", -- Requires localization
		hystrheal = L"Force+Puissance de soin",
		hystrmelee = L"Force+mélée",
		hytoucrit = L"Endurance+Critiques de mêlée",
		hytounocrit = L"Toughness+Reduced chance to be Crit", -- Requires localization
		hywillheal = L"Volonté+Puissance de soin",
		hywouarmpen = L"Wounds+Reduced armor pen.", -- Requires localization
		hywoucrit = L"Santé+Critique de mêlée",
		hywouheal = L"Santé+Puissance de soins",
		hywouinit = L"Wounds+Initiative", -- Requires localization
		hywoumcrit = L"Santé+Critiques de magie",
		hywoumelee = L"Santé+Mêlée",
		hywourcrit = L"Santé+Critiques de tirs à distance",
		hywoustr = L"Santé+Force",
		ini = L"Initiative",
		int = L"Intelligence",
		mgcrit = L"Magic Crit", -- Requires localization
		mgpower = L"Magic Power", -- Requires localization
		morale = L"Gain en moral",
		movespeed = L"Move Speed", -- Requires localization
		mpower = L"Melee Power", -- Requires localization
		mskill = L"Capacité de combat",
		pet = L"Summon Pet", -- Requires localization
		rcorp = L"Résistance corporelle",
		rcrit = L"Ranged Crit", -- Requires localization
		reactspd = L"Move Speed on Enemy Damage", -- Requires localization
		regen = L"Régénération",
		rele = L"Résistance élémentaire",
		rez = L"Résurrection",
		rpower = L"Ranged Power", -- Requires localization
		rskill = L"Ballistique",
		rspi = L"Résistance spirituelle",
		shabs = L"Bouclier d'absorption",
		shdmg = L"Bouclier de dégats",
		snare = L"Ralentissement",
		str = L"Force",
		tou = L"Endurance",
		trapoth = L"Compétence Apothicaire",
		trcult = L"Compétence Culture",
		trsalv = L"Compétence Récupération magique",
		trtal = L"Compétence Fabricant de talismans",
		wil = L"Volonté",
		wou = L"Points de Vie",
	},
	EffectTiers = {
		tier0 = L"{1} (Tier 0)", -- Requires localization
		tier1 = L"{1} (Tier 1)", -- Requires localization
		tier2 = L"{1} (Tier 2)", -- Requires localization
		tier3 = L"{1} (Tier 3)", -- Requires localization
		tier4 = L"{1} (Tier 4)", -- Requires localization
		tier5 = L"{1} (Tier 5)", -- Requires localization
	},
	Format = {
		bonus = L"Bonus {1}", -- Requires localization
		effect = L"Effect={1}", -- Requires localization
		grows = L"Grows {1}", -- Requires localization
	},
	ItemTypes = {
		cult1 = L"Graine", -- Needs review
		cult2 = L"Terreau", -- Needs review
		cult3 = L"Arrosoir", -- Needs review
		cult4 = L"Nutriment", -- Needs review
		cult5 = L"Spore", -- Needs review
		item1 = L"Stabilisateur", -- Needs review
		item13 = L"Contenant", -- Needs review
		item14 = L"Fragment", -- Needs review
		item15 = L"Essence d'or", -- Needs review
		item16 = L"Babioles", -- Needs review
		item17 = L"Essence magique", -- Needs review
		item18 = L"Stimulant", -- Needs review
		item2 = L"Ingrédient principal", -- Needs review
		item3 = L"RallongeurdeDurée", -- Needs review
		item4 = L"Multiplicateur", -- Needs review
		item5 = L"Récipient", -- Needs review
		item6 = L"Récipient à teinture", -- Needs review
		item8 = L"Pigment", -- Needs review
		item9 = L"Fixateur", -- Needs review
	},
	Messages = {
		DebugOff = L"CraftValueTip: mode Dev désactivé",
		DebugOn = L"CraftValueTip: mode développeur activé",
		Greeting = L"Infobulles d'artisanat crée par Irinia de Volkmar chargé.",
		List0 = L"/craftvaluetip -- Open configuration window", -- Requires localization
		List1 = L"/craftvaluetip off -- Désactive infobulle des stats",
		List2 = L"/craftvaluetip on -- Active infobulle des stats",
		List3 = L"/craftvaluetip dev off -- Désactive les affichages pour développeur",
		List4 = L"/craftvaluetip dev on -- Active les affichages pour développeur",
		List5 = L"/craftvaluetip dump -- Affiche toutes les données de la dernière infobulle",
		List6 = L"/craftvaluetip digest -- Affiche une partie des données de la dernière infobulle",
		List7 = L"List7",
		SeedDyeOff = L"GrainedeTeintureOff",
		SeedDyeOn = L"GrainedeTeintureOn",
		SeedPlantOff = L"SemenceOff",
		SeedPlantOn = L"SemenceOn",
		TipOff = L"CraftValueTip: Infobulle des stats désactivée",
		TipOn = L"CraftValueTip: Infobulle des stats activée",
	},
	Prof = {
		prof3 = L"Cultivateur",
		prof4 = L"Apothicaire",
		prof5 = L"Création de talisman",
		prof6 = L"Récupérateur", -- Needs review
	},
	SeedClasses = {
		purch = L"Achat",
		quest = L"De quête",
		rare = L"Rare",
		std = L"Standard",
	},
	config = {
		langdefault = L"Use default", -- Requires localization
		langthis = L"Français",
		language = L"Language", -- Requires localization
		showdev = L"Show developer info", -- Requires localization
		showinfo = L"Show crafting stats", -- Requires localization
		tabtip = L"Crafting Info Tooltip", -- Requires localization
		version = L"Crafting Info Tooltip by Irinia of Volkmar v{1}", -- Requires localization
	},
}

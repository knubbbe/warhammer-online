--[[
  Crafting Info Tooltip v1.51

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.

  This file, Localization.lua, contains all of the text so that it can be
  translated and replaced easily.
]]--

--d("Local")

CraftValueTip.T[SystemData.Settings.Language.ITALIAN]={
	Bonuses = {
		bonus1 = L"Stabilità",
		bonus10 = L"Processo di Crescita",
		bonus11 = L"Numero di Piante",
		bonus12 = L"Possibilità di Critico",
		bonus13 = L"Possibilità di Fallimento",
		bonus14 = L"Possibilità Speciale", -- Needs review
		bonus15 = L"Fragile",
		bonus2 = L"Potenza",
		bonus3 = L"Durata",
		bonus4 = L"Moltiplicatore",
		bonus5 = L"Tradeskill", -- Requires localization
		bonus6 = L"Effetto",
		bonus7 = L"Spazi",
		bonus8 = L"Item Type", -- Requires localization
		bonus9 = L"Requires Level", -- Requires localization
	},
	EffectNames = {
		acc = L"Precisione",
		ap = L"Rinvigorente",
		apdrain = L"AP Drain on Your Damage", -- Requires localization
		arm = L"Armatura",
		autoheal = L"Reactive Heal", -- Requires localization
		crit = L"Melee Crit", -- Requires localization
		dmg = L"Molotov",
		dmgaoe = L"Napalm",
		dmgcone = L"Soffio di Fiamma",
		dyeblue = L"Blu Guardia del Mare",
		dyebrown = L"Marrone Bruciato",
		dyedarkblue = L"Dark Sea Blue", -- Requires localization
		dyedarkivory = L"Dark Ivory", -- Requires localization
		dyedarkpeach = L"Dark Peach", -- Requires localization
		dyedarkpurple = L"Dark Purple", -- Requires localization
		dyedarkred = L"Dark Red", -- Requires localization
		dyegreen = L"Verde Goblin",
		dyepurple = L"Porpora Liche",
		dyered = L"Sangue Denso Rosso",
		dyeyellow = L"Giallo Dorato",
		freecast = L"Free Cast Chance", -- Requires localization
		hcrit = L"Healing Crit", -- Requires localization
		heal = L"Cura",
		hpower = L"Healing Power", -- Requires localization
		hyaccrcrit = L"Balistica+Critico Distanza",
		hyhpregencritdmg = L"Healthregen+Reduced Crit Dmg", -- Requires localization
		hyintmcrit = L"Acume+Critico Magico",
		hyresist = L"All resists", -- Requires localization
		hystrheal = L"Forza+Potenza Cura",
		hystrmelee = L"Forza+Potenza Fisica",
		hytoucrit = L"Resistenza+Critico Mischia",
		hytounocrit = L"Toughness+Reduced chance to be Crit", -- Requires localization
		hywillheal = L"Volontà+Potenza Cura",
		hywouarmpen = L"Wounds+Reduced armor pen.", -- Requires localization
		hywsarmpen = L"Weapon Skill+Reduced armor pen.",
		hywoucrit = L"Ferite+Critico Mischia",
		hywouheal = L"Ferite+Potenza Cura",
		hywouinit = L"Wounds+Initiative", -- Requires localization
		hywoumcrit = L"Ferite+Critico Magico",
		hywoumelee = L"Ferite+Potenza Fisica",
		hywourcrit = L"Ferite+Critico Distanza",
		hywoustr = L"Ferite+Forza",
		ini = L"Iniziativa",
		int = L"Acume",
		mgcrit = L"Magic Crit", -- Requires localization
		mgpower = L"Magic Power", -- Requires localization
		morale = L"Recupero Morale",
		movespeed = L"Move Speed", -- Requires localization
		mpower = L"Melee Power", -- Requires localization
		mskill = L"Armi",
		pet = L"Summon Pet", -- Requires localization
		rcorp = L"Resistenza Corporea",
		rcrit = L"Ranged Crit", -- Requires localization
		reactspd = L"Move Speed on Enemy Damage", -- Requires localization
		regen = L"Ristoro",
		rele = L"Resistenza Elementale",
		rez = L"Resurrezione",
		rpower = L"Ranged Power", -- Requires localization
		rskill = L"Balistica",
		rspi = L"Resistenza Spirituale",
		shabs = L"Scudo di Assorbimento",
		shdmg = L"Scudo di Spine",
		snare = L"Rallentamento",
		str = L"Forza",
		tou = L"Resistenza",
		trapoth = L"Abilità Speziale",
		trcult = L"Abilità Coltivare",
		trsalv = L"Abilità Riciclare",
		trtal = L"Abilità Creazione Talismani",
		wil = L"Volontà",
		wou = L"Ferite",
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
		cult1 = L"Seme", -- Needs review
		cult2 = L"Terra", -- Needs review
		cult3 = L"Annaffiatoio", -- Needs review
		cult4 = L"Nutriente", -- Needs review
		cult5 = L"Spora", -- Needs review
		item1 = L"Stabilizzante", -- Needs review
		item13 = L"Contenitore", -- Needs review
		item14 = L"Frammento", -- Needs review
		item15 = L"Essenza d'Oro", -- Needs review
		item16 = L"Rarità", -- Needs review
		item17 = L"Essenza Magica", -- Needs review
		item18 = L"Stimolante", -- Needs review
		item2 = L"Ingrediente Principale", -- Needs review
		item3 = L"Estensore", -- Needs review
		item4 = L"Moltiplicatore", -- Needs review
		item5 = L"Contenitore", -- Needs review
		item6 = L"Contenitore delle Tinte", -- Needs review
		item8 = L"Pigmento", -- Needs review
		item9 = L"Fissante", -- Needs review
	},
	Messages = {
		DebugOff = L"CraftValueTip: Modalità sviluppo off",
		DebugOn = L"CraftValueTip: Modalità sviluppo on",
		Greeting = L"Crafting Info Tooltip da Irinia di Volkmar caricato. Usa /craftvaluetip help per la lista dei comandi",
		List0 = L"/craftvaluetip -- Apre il pannello di configurazione",
		List1 = L"/craftvaluetip off -- Disabilita informazioni",
		List2 = L"/craftvaluetip on -- Abilita informazioni",
		List3 = L"/craftvaluetip dev off -- Disabilita modalità sviluppo",
		List4 = L"/craftvaluetip dev on -- Abilita modalità sviluppo",
		List5 = L"/craftvaluetip dump -- Mostra statistiche dell'oggetto complete per le ultime informazioni visualizzate",
		List6 = L"/craftvaluetip digest -- Mostra statistiche dell'oggetto parziali per le ultime informazioni visualizzate",
		List7 = L"/craftvaluetip seed {off|plant|pigment|both} -- Imposta quali informazioni vengono visualizzate",
		SeedDyeOff = L"CraftValueTip: Non visualizza informazioni dei risultati dei pigmenti",
		SeedDyeOn = L"CraftValueTip: Visualizza informazioni dei risultati dei pigmenti",
		SeedPlantOff = L"CraftValueTip: Non visualizza informazioni dei risultati dei semi",
		SeedPlantOn = L"CraftValueTip: Visualizza informazioni dei risultati dei semi",
		TipOff = L"CraftValueTip: Informazioni off",
		TipOn = L"CraftValueTip: Informazioni on",
	},
	Prof = {
		prof3 = L"Coltivare",
		prof4 = L"Speziale",
		prof5 = L"Creazione Talismani",
		prof6 = L"Riciclare", -- Needs review
	},
	SeedClasses = {
		purch = L"Acquistato",
		quest = L"Missione",
		rare = L"Raro",
		std = L"Normale",
	},
	config = {
		langdefault = L"Usa di default",
		langthis = L"Italiano",
		language = L"Lingua",
		showdev = L"Visualizza informazioni sviluppatore",
		showinfo = L"Visualizza statistiche della lavorazione",
		tabtip = L"Crafting Info Tooltip",
		version = L"Crafting Info Tooltip da Irinia di Volkmar v{1}",
	},
}

--[[
  Crafting Info Tooltip v1.51

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.

  This file, Localization.lua, contains all of the text so that it can be
  translated and replaced easily.
]]--

--d("Local")

CraftValueTip.T[SystemData.Settings.Language.GERMAN]={
	Bonuses = {
		bonus1 = L"Stabilit�t",
		bonus10 = L"Wachstumszeit (Abschnitt)",
		bonus11 = L"Pflanzenanzahl",
		bonus12 = L"Kritischer Erfolg",
		bonus13 = L"Kritischer Fehlschlag",
		bonus14 = L"Spezieller Moment", -- Needs review
		bonus15 = L"Zerbrechlich",
		bonus2 = L"Kraft",
		bonus3 = L"Dauer",
		bonus4 = L"Multiplikator",
		bonus5 = L"Handelsskill", -- Needs review
		bonus6 = L"Effekt",
		bonus7 = L"Pl�tze",
		bonus8 = L"Gegenstandstyp", -- Needs review
		bonus9 = L"Ben�tigter Rang", -- Needs review
	},
	EffectNames = {
		acc = L"Genauigkeit",
		ap = L"Ausdauerpunkte",
		apdrain = L"AP saugen durch verursachter Schaden", -- Needs review
		arm = L"R�stung",
		autoheal = L"Automatische Heilung", -- Needs review
		crit = L"kritische Nahkampftreffer", -- Needs review
		dmg = L"Feurig",
		dmgaoe = L"Feurige Explosion",
		dmgcone = L"Feueratem",
		dyeblue = L"Seegardisten-Blau",
		dyebrown = L"Branntbraun",
		dyedarkblue = L"Dunkles Seeblau", -- Needs review
		dyedarkivory = L"Dunkles Elfenbein", -- Needs review
		dyedarkpeach = L"Dunkel Orange", -- Needs review
		dyedarkpurple = L"Dunkellila", -- Needs review
		dyedarkred = L"Dunkelrot", -- Needs review
		dyegreen = L"Goblingr�n",
		dyepurple = L"Lichlila",
		dyered = L"Wundrot",
		dyeyellow = L"Goldgelb",
		freecast = L"Kostenloser Spruch chance", -- Needs review
		hcrit = L"kritische Heilung", -- Needs review
		heal = L"Heilung",
		hpower = L"Heilungsbonus", -- Needs review
		hyaccrcrit = L"Ballistik und kritische Fernkampftreffer",
		hyhpregencritdmg = L"Lebens regen und verringerter kritischer Schaden", -- Needs review
		hyintmcrit = L"Intelligenz und kritische Magietreffer",
		hyresist = L"Alle Resistenzen", -- Needs review
		hystrheal = L"St�rke und Heilungsbonus",
		hystrmelee = L"St�rke und Nahkampfbonus",
		hytoucrit = L"Widerstand und kritische Nahkampftreffer",
		hytounocrit = L"Wiederstand und verringerte kritische Trefferchance", -- Needs review
		hywillheal = L"Willenskraft und Heilungsbonus",
		hywouarmpen = L"Leben und verringerte R�stungsdurchdringen", -- Needs review
		hywsarmpen = L"Weapon Skill+Reduced armor pen.",
		hywoucrit = L"Leben und kritische Nahkampftreffer",
		hywouheal = L"Leben und Heilung",
		hywouinit = L"Leben und Initiative", -- Needs review
		hywoumcrit = L"Leben und kritische Magietreffer",
		hywoumelee = L"Leben und Nahkampfbonus",
		hywourcrit = L"Leben und kritische Fernkampftreffer",
		hywoustr = L"Leben und St�rke",
		ini = L"Initiative",
		int = L"Intelligenz",
		mgcrit = L"kritische Magietreffer", -- Needs review
		mgpower = L"Magiebonus", -- Needs review
		morale = L"Moralgewinn",
		movespeed = L"Laufgeschwindigkeit", -- Needs review
		mpower = L"Nahkampfbonus", -- Needs review
		mskill = L"Kampfgeschick",
		pet = L"Beschw�hrt Begleiter", -- Needs review
		rcorp = L"K�rperresistenz",
		rcrit = L"kritische Fernkampftreffer", -- Needs review
		reactspd = L"Laufgeschwindgkeit bei erhaltenem Schaden", -- Needs review
		regen = L"Regeneration",
		rele = L"Elementarresistenz",
		rez = L"Wiederbelebung",
		rpower = L"Fernkampfbonus", -- Needs review
		rskill = L"Ballistik",
		rspi = L"Geistresistenz",
		shabs = L"Absorbtion",
		shdmg = L"Dornenschild",
		snare = L"Verlangsamung",
		str = L"St�rke",
		tou = L"Widerstand",
		trapoth = L"Pharmazie",
		trcult = L"Anpflanzen",
		trsalv = L"Magisches Verwerten",
		trtal = L"Talismanherstellung",
		wil = L"Willenskraft",
		wou = L"Leben",
	},
	EffectTiers = {
		tier0 = L"{1} (Teil 0)", -- Needs review
		tier1 = L"{1} (Teil 1)", -- Needs review
		tier2 = L"{1} (Teil 2)", -- Needs review
		tier3 = L"{1} (Teil 3)", -- Needs review
		tier4 = L"{1} (Teil 4)", -- Needs review
		tier5 = L"{1} (Teil 5)", -- Needs review
	},
	Format = {
		bonus = L"Bonus {1}", -- Needs review
		effect = L"Effekt={1}", -- Needs review
		grows = L"Z�chtet {1}", -- Needs review
	},
	ItemTypes = {
		cult1 = L"Samen", -- Needs review
		cult2 = L"Erde", -- Needs review
		cult3 = L"Gie�kanne", -- Needs review
		cult4 = L"N�hrstoff", -- Needs review
		cult5 = L"Spore", -- Needs review
		item1 = L"Stabilisierer", -- Needs review
		item13 = L"Beh�ltnis", -- Needs review
		item14 = L"Fragment", -- Needs review
		item15 = L"Gold", -- Needs review
		item16 = L"Kuriosit�t", -- Needs review
		item17 = L"Magieessenz", -- Needs review
		item18 = L"Anreger", -- Needs review
		item2 = L"Hauptzutat", -- Needs review
		item3 = L"Verl�ngerer", -- Needs review
		item4 = L"Multiplikator", -- Needs review
		item5 = L"Beh�ltnis", -- Needs review
		item6 = L"Farbenbeh�ltnis", -- Needs review
		item8 = L"Pigment", -- Needs review
		item9 = L"Fixierer", -- Needs review
	},
	Messages = {
		DebugOff = L"CraftValueTip: Entwickler-Modus deaktiviert",
		DebugOn = L"CraftValueTip: Entwickler-Modus aktiviert",
		Greeting = L"Crafting Info Tooltip von Irinia of Volkmar geladen.  Benutze /craftvaluetip help f�r die Befehlsliste",
		List0 = L"/craftvaluetip -- �ffnet das Konfigurations-Fenster",
		List1 = L"/craftvaluetip off -- Zeigt nur normale Kurzinfos an",
		List2 = L"/craftvaluetip on -- Zeigt die erweiterten Kurzinfos an",
		List3 = L"/craftvaluetip dev off -- Verbirgt f�r Entwickler interessante Werte",
		List4 = L"/craftvaluetip dev on -- Zeigt f�r Entwickler interessante Werte an",
		List5 = L"/craftvaluetip dump -- Zeigt die gesamten Objektdaten der zuletzt gesehenen Kurzinfo an",
		List6 = L"/craftvaluetip digest -- Zeigt die wichtigsten Objektdaten der zuletzt gesehenen Kurzinfo an",
		List7 = L"/craftvaluetip seed {off|plant|pigment|both} -- Bestimmt die gew�nschten Informationen in Kurzinfos f�r Samen und Sporen",
		SeedDyeOff = L"CraftValueTip: Kurzinfos von Samen und Sporen zeigen keine m�glichen Pigmentfarben",
		SeedDyeOn = L"Kurzinfos von Samen und Sporen zeigen die m�glichen Pigmentfarben",
		SeedPlantOff = L"CraftValueTip: Kurzinfos von Samen und Sporen zeigen keine Boni daraus wachsender Pflanzen",
		SeedPlantOn = L"CraftValueTip: Kurzinfos von Samen und Sporen zeigen die Boni daraus wachsender Pflanzen",
		TipOff = L"CraftValueTip: Normale Kurzinfos werden angezeigt",
		TipOn = L"CraftValueTip: Erweiterte Kurzinfos werden angezeigt",
	},
	Prof = {
		prof3 = L"Anpflanzen",
		prof4 = L"Pharmazie",
		prof5 = L"Talisman-Herstellung",
		prof6 = L"Verwerten", -- Needs review
	},
	SeedClasses = {
		purch = L"Gekauft",
		quest = L"Quest",
		rare = L"Selten",
		std = L"Standard",
	},
	config = {
		langdefault = L"Benutze standardm��ige Sprache",
		langthis = L"Deutsch",
		language = L"Sprache",
		showdev = L"Zeige Entwicklungs-Infos",
		showinfo = L"Zeige handwerkliche Stats",
		tabtip = L"Crafting Info Tooltip",
		version = L"Crafting Info Tooltip von Irinia of Volkmar v{1}",
	},
}

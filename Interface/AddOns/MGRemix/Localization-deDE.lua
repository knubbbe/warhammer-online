--[[
  MGRemix (Miracle Grow Remix) version 2.33
  by Irinia of Volkmar
  MGRemix puts all the functionality of the cultivation interface into a small
  window.  Also added are quick item selection and one-click repeat

  This file, Localization.lua, contains all of the text so that it can be
  translated and replaced easily.
]]--


MiracleGrow2.T[SystemData.Settings.Language.GERMAN]={
	cmenus = {
		config = L"Konfiguration",
		count = L"{1}x",
		fillallrhya = L"Bester Rhyas Lehm",
		fillalltitle = L"Alle Wachstumshilfen ergänzen",
		fillallvendor = L"Beste Händlerware",
		level = L"Stf{1}",
		lvlandrarity = L"Stufe {1} ({2})",
	},
	config = {
		enabletoggle = L"Umschaltknopf anzeigen", -- Needs review
		langdefault = L"Standard benutzen",
		layoutinstructions = L"Drag\
and\
drop",
		maxlvl = L"lvl{1} oder kleiner",
		maxlvl0 = L"Maximales Level",
		minlvl = L"mindestens lvl{1}",
		minlvl0 = L"Kein minimales Level",
		plotcountlabel = L"Anpflanzbereiche",
		plothorizontal = L"Anpflanzbereiche von links nach rechts ausrichten",
		plotlines = L"Trenner anzeigen",
		plotsize = L"Größe des Pflanzbereichs", -- Needs review
		plotspacing = L"Abstand",
		plotsquare = L"Als Quadrat ausrichten",
		plotvertical = L"Anpflanzbereiche von oben nach unten ausrichten",
		presetdefault = L"Standardeinstellungen",
		presetgo = L"Übernehmen",
		presetlayclassic = L"Klassische (Remix)",
		presetlaycompact = L"Kompakt",
		presetlaylargebar = L"Grosser Fortschrittsbalken",
		presetlayplantme = L"Klassisch (PlantMe)",
		presetlayvert = L"Vertikal",
		progback = L"Hintergrundfarbe",
		progbottomtotop = L"Von unten nach oben auffüllen",
		progfill = L"Füllfarbe",
		proghide = L"Fortschrittsbalken verbergen",
		proglefttoright = L"Von links nach rechts auffüllen",
		progrighttoleft = L"Von rechts nach links auffüllen",
		progtoptobottom = L"Von oben nach unten auffüllen",
		reserveenable = L"Samenreserve zurückbehalten", -- Needs review
		reserveunits = L"Samen",
		sectionautoreap = L"automatische Umwandlung", -- Needs review
		sectioningredient = L"Zutaten anzeigen",
		sectionlanguage = L"Sprache",
		sectionplots = L"Ausrichtung der Pflanzbereiche", -- Needs review
		sectionprog = L"Fortschrittsbalken",
		sectionsound = L"Geräusch für Fortschritt", -- Needs review
		sectionwindow = L"Hauptfenster",
		show = L"Fenster anzeigen",
		sound1label = L"Abschnitt abgeschlossen",
		sound2label = L"Erntebereit",
		soundenable = L"Geräusche verwenden",
		soundtest = L"testen",
		soundtip1 = L"Das naheliegendste Geräusch ist {1}", -- Needs review
		soundtip2 = L"Die naheliegendsten Geräusche sind {1} und {2}", -- Needs review
		soundtipfail = L"Kein bekanntes Geräusche im Bereich {1}", -- Needs review
		tablayout = L"Darstellung", -- Needs review
		tablayoutdesc = L"Darstellung im Hauptfenster", -- Needs review
		tabpreset = L"Voreinstellungen",
		tabpresetdesc = L"Set groups of settings to presets", -- Requires localization
		tabsettings = L"Einstellungen",
		tabsettingsdesc = L"Allgemeine Einstellungen",
		throb = L"Pulsierende Anzeige einschalten", -- Needs review
		throbcolor = L"Farbe",
		visibility = L"Anzeige/Sichtbarkeit", -- Needs review
		["x"] = L"x",
		["y"] = L"y",
	},
	general = {
		mgremix = L"Miracle Grow Remix",
		mgremixdesc = L"Ein Fenster für das einfache und schnelle Anpflanzen",
		thislanguage = L"Deutsch",
	},
	help = {
		layarrange = L"Here you can control how the plots are put together to form the main window.\
*You can stack the plots on top of each other, next to each other, or in two rows\
*If you don't stack the plots as two rows, you can show fewer than four.  Only the plots most needing attention will be displayed\
*You can elect to draw lines separating the plots so its easier to see where one plot ends and the next begins.\
*You can control how much space is placed between each plot and between the plots and the window border.", -- Requires localization
		laydraganddrop = L"This area shows where the components of each plot will be.  You can drag and drop each component where you want it to be. If you drag a component out of the plot, it will move to the unused components bin to the right.  The size of the plot is controlled by the Plot size control to the right.  If you make the plot too small to contain components, they will turn red and will not appear in the actual plot.  You can also preview the progress bar here.", -- Requires localization
		layplotsize = L"These controls set the size of the plot as shown on the left.  You can expand the plot size to add more components or more space between components, or you can shrink the plot after you've removed components so it takes up less space.", -- Requires localization
		layprog = L"Mit diesen Bedienelementen können sie Ihren Fortschrittsbalken einstellen. Eine Vorschau auf Ihre Einstellungen wird oben eingeblendet.", -- Needs review
		layprogdim = L"Here you can set where in the plot the progress bar will appear as well as what size it will be.  Each x,y pair controls where one corner is.", -- Requires localization
		layprogfill = L"Hier können Sie einstellungen in welcher Richtung der Fortschritsbalken gefüllt wird, oder ob er garnicht angezeigt werden soll.",
		layprogtex = L"Here you can select what textures to use for the progress bar.  Use the spinner to progress forward and backward through the available selections.  The texture on the left is the fill; the texture on the right is the background.", -- Requires localization
		layprogtint = L"Here you can tint the progress bar to tweak its color.  You can also control its transparency.  You can preview these settings to the left, or in the drag-and-drop area at the top.", -- Requires localization
		layunusedbin = L"This area holds components that are not currently part of the plot.  You can drag any of them to the plot area to include them.  Tooltips will identify each component.", -- Requires localization
		layvis = L"Here you can set when most components are visible.\
*Use the spinner control to select the component to change\
*Use the checkboxes to set whether the component should be shown for each stage", -- Requires localization
		setautoreap = L"Wenn Sie eine aktuelle Version von Crafting Info Tooltip haben, können Sie automatische Umwandlung in Samen nutzen. Wenn diese Option eingeschaltet ist, wird MGRemix automatisch Pflanzen in Samen umwandeln solange Sie weniger als die hier angegebene Anzahl im Rucksack haben.", -- Needs review
		setingred = L"Hier setzt man das Level für Zutaten, damit sie im Kontextmenü auftauchen",
		setlang = L"Hier kann man die Sprache für das Addon auswählen. Falls möglich wird die im Spiel verwendete Sprache als Standard verwendet, Englisch andernfalls.", -- Needs review
		setmainwin = L"*Show Window controls whether the main window is displayed.\
*Show Toggle Button controls whether a button to show and hide the main window is displayed.\
*Enable Throbbing controls whether the main window background will change color to get your attention and below it you can set what color is used.", -- Requires localization
		setsound = L"Geräusche können vollkommen abgeschaltet werden. Ausserdem kann ausgewählt werden, welche Geräusche benutzt werden. Drücken Sie \"testen\", um den gewählten Ton abzuspielen. Nicht alle Geräusche sind hörbar.", -- Needs review
	},
	messages = {
		help0 = L"/mg - Einstellungsfenster anzeigen",
		help1 = L"Miracle Grow Remix v{1} von Irinia, Volkmar (US)",
		help10 = L"/mg soundnum # - Setzt den Hinweiston für einzelne Anpflanzphasen",
		help11 = L"/mg soundnum2 # - Setzt den Hinweiston für ausgewachsene Pflanzen",
		help12 = L"/mg playsound # - Versucht, den angegebenen Klang abzuspielen (als Test)",
		help13 = L"/mg reserve # - Versucht, die angegebene Menge an Saatgut zu erhalten, indem Pflanzen automatisch verwertet werden",
		help2 = L"Chatbefehle (verwendet /mg, /mgremix, oder /MiracleGrow2)",
		help3 = L"/mg help - Zeigt diese Befehlsliste an",
		help4 = L"/mg sound [on/off] - Schaltet den Hinweiston ein oder aus",
		help5 = L"/mg throb [on/off] - Schaltet das Pulsieren des Fensters ein oder aus",
		help6 = L"/mg minlvl # - Setzt die Minimalstufe für anzuzeigende Gegenstände",
		help7 = L"/mg maxlvl # - Setzt die Maximalstufe für anzuzeigende Gegenstände (verwendet Eure Handwerksstufe bei einem Wert von 0)",
		help8 = L"/mg show - Zeigt das MGRemix-Fenster",
		help9 = L"/mg hide - Verbirgt das MGRemix-Fenster",
		maxlvl = L"MGRemix zeigt nur noch Gegenstände mit höchstens Stufe {1}.",
		maxlvldef = L"MGRemix zeigt nur noch Gegenstände, die Ihr verarbeiten könnt.",
		maxlvlerr = L"Die Maximalstufe muss zwischen 1 und 200 liegen.",
		minlvl = L"MGRemix zeigt nur noch Gegenstände mit mindestens Stufe {1}.",
		minlvlerr = L"Die Minimalstufe muss zwischen 1 und 200 liegen.",
		reserve = L"MGRemix wird versuchen, {1} exemplare jedes Saatguts aufzubewahren.",
		reserveoff = L"MGRemix wird nicht eigenständig Pflanzen verwerten.",
		soundoff = L"Der Hinweiston für MGRemix ist nun ausgeschaltet.",
		soundon = L"Der Hinweiston für MGRemix ist nun eingeschaltet.",
		throboff = L"Der pulsierende Fensterhintergrund für MGRemix ist nun ausgeschaltet.",
		throbon = L"Der pulsierende Fensterhintergrund für MGRemix ist nun eingeschaltet.",
	},
	rant = {
		cit1 = L"Ohne Crafting Info Tooltip kann Miracle Grow Remix nicht anzeigen, welche Pflanzen sich aus welchem Saatgut entwickeln. Zusätzlich können ohne die Erweiterung keine Saatgutmengen automatisch erhalten werden.",
		citnoinstall = L"Crafting Info Tooltip ist nicht vorhanden.",
		citupdate = L"Crafting Info Tooltip ist nicht aktuell.",
		libs1 = L"Ohne LibSlash können die zu MGRemix gehörigen Chatbefehle nicht verwendet werden.",
		libsnoinstall = L"LibSlash ist nicht vorhanden.",
		namecit = L"Crafting Info Tooltip",
		namelibslash = L"LibSlash",
		needupdate = L"{1} ist nicht aktuell.", -- Needs review
		noinstall = L"{1} ist nicht vorhanden.", -- Needs review
		rantpostfix = L"Dieser Hinweis wird Euch erst wieder in der nächsten Version angezeigt.",
		rantprefix = L"Miracle Grow Remix hat festgestellt, dass eine oder mehrere optionale Abhängigkeiten nicht verfügbar oder veraltet sind:",
		uptodate = L"Version{2} von {1} erkannt und in Benutzung",
		version = L"Version {1} oder höher ist erforderlich.",
	},
	tooltips = {
		addnut = L"Nährstoff hinzufügen",
		addseed = L"Saatgut hinzufügen",
		addsoil = L"Erdreich hinzufügen",
		addwater = L"Wasser hinzufügen",
		harvest = L"Ernten",
		hrepeat = L"Ernten und Anpflanzen wiederholen",
		nothing = L"<nichts>",
		plotnum = L"Nummer des Anpflanzbereichs",
		Repeat = L"Wiederholen",
		repeatnut = L"Nährstoff",
		repeatseed = L"Saatgut",
		repeatsoil = L"Erdreich",
		repeattitle = L"Letzte Kultivierung wiederholen",
		repeatwater = L"Wasser",
		timeplot = L"Anpflanzungsrestzeit",
		timestage = L"Verbleiben Zeit für diesen Anbauabschnitt",
		togglewindow = L"Miracle Grow Remix anzeigen/verbergen",
	},
}

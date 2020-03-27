

--==Engineer==--
Warbuilder.Career[4] = { CareerIcon=20187, ID=23, Line=4, Build=190813.1}
Warbuilder.Career[4].Path = {
{Core={ Icon=004527,				--Path of The Rifleman
		{Path=1,Type=2,ID=1508,Icon=004460,BuffType=2,MinLevel=1},		--Gun Blast
		{Path=1,Type=4,ID=420,Icon=004506,BuffType=14,MinLevel=3},		--Penetrating Round
		{Path=1,Type=2,ID=1515,Icon=004457,BuffType=5,MinLevel=9},		--Incendiary Rounds
		{Path=1,Type=2,ID=1520,Icon=004608,BuffType=2,MinLevel=10},		--Hop Shot
		{Path=1,Type=4,ID=421,Icon=004477,BuffType=14,MinLevel=17},		--Machine Gun
		{Path=1,Type=2,ID=1521,Icon=004609,BuffType=5,MinLevel=30},		--Signal Flare
		{Path=1,Type=2,ID=1528,Icon=004527,BuffType=2,MinLevel=40}		--Focused Fire
		},
	{Path=1,Type=1,ID=1561,Icon=022708,BuffType=0,MinLevel=0},		--Stopping Power		
	{Path=1,Type=2,ID=1536,Icon=004614,BuffType=2,MinLevel=0},		--Crack Shot
	{Path=1,Type=1,ID=1560,Icon=022697,BuffType=0,MinLevel=0},		--Hollow-Points
	{Path=1,Type=2,ID=1538,Icon=004615,BuffType=2,MinLevel=0},		--Snipe
	{Path=1,Type=1,ID=1559,Icon=022704,BuffType=0,MinLevel=0},		--Quick Reloader
	{Path=1,Type=2,ID=2870,Icon=004528,BuffType=0,MinLevel=0},		--Armor-Piercing Rounds
	{Path=1,Type=3,ID=1580,Icon=004622,BuffType=2,Rank=4,MinLevel=0}		--Scattershot
	},	
{Core={ Icon=004610,				--Path of The Grenadier
		{Path=2,Type=2,ID=1523,Icon=004468,BuffType=2,MinLevel=2},		--Firebomb
		{Path=2,Type=2,ID=1514,Icon=004604,BuffType=5,MinLevel=5},		--Acid Bomb
		{Path=2,Type=4,ID=422,Icon=004650,BuffType=14,MinLevel=8},		--Shock Grenade
		{Path=2,Type=4,ID=423,Icon=004569,BuffType=14,MinLevel=13},		--High-Explosive Grenade
		{Path=2,Type=2,ID=1522,Icon=004610,BuffType=2,MinLevel=14},		--Flashbang Grenade
		{Path=2,Type=2,ID=1510,Icon=004477,BuffType=5,MinLevel=16},		--Fragmentation Grenade
		{Path=2,Type=2,ID=1531,Icon=004616,BuffType=2,MinLevel=20}		--Concussion Grenade
		},
	{Path=2,Type=1,ID=1563,Icon=022694,BuffType=0,MinLevel=0},		--Extra Powder
	{Path=2,Type=2,ID=1539,Icon=004476,BuffType=5,MinLevel=0},		--Sticky Bomb
	{Path=2,Type=1,ID=1564,Icon=022697,BuffType=0,MinLevel=0},		--Throwing Arm
	{Path=2,Type=2,ID=1541,Icon=004422,BuffType=5,MinLevel=0},		--Phosphorous Shells
	{Path=2,Type=1,ID=1562,Icon=022706,BuffType=0,MinLevel=0},		--Bandoiler
	{Path=2,Type=2,ID=1537,Icon=004653,BuffType=2,MinLevel=0},		--Napalm Grenade
	{Path=2,Type=3,ID=1581,Icon=004456,BuffType=2,Rank=4,MinLevel=0}		--Artillery Barrage
	},
{Core={ Icon=004466,				--Path of The Tinkerer
		{Path=3,Type=2,ID=1513,Icon=004656,BuffType=5,MinLevel=4},		--Friction Burn
		{Path=3,Type=2,ID=1517,Icon=004606,BuffType=2,MinLevel=6},		--Blunderbuss Blast
		{Path=3,Type=4,ID=424,Icon=004455,BuffType=14,MinLevel=6},		--Flamethrower
		{Path=3,Type=4,ID=425,Icon=004618,BuffType=14,MinLevel=15},		--Steam Vent
		{Path=3,Type=2,ID=1524,Icon=004611,BuffType=2,MinLevel=18},		--Land Mine
		{Path=3,Type=2,ID=1529,Icon=004649,BuffType=9,MinLevel=28},		--Burn Salve
		{Path=3,Type=2,ID=1530,Icon=004651,BuffType=2,MinLevel=35},		--Static Discharge
		{Path=3,Type=2,ID=1540,Icon=004531,BuffType=2,MinLevel=40}		--Strafing Run		
	},
	{Path=3,Type=1,ID=1551,Icon=022698,BuffType=0,MinLevel=0},		--Extra Ammo
	{Path=3,Type=2,ID=1543,Icon=004655,BuffType=2,MinLevel=0},		--Lightning Rod
	{Path=3,Type=1,ID=1567,Icon=022698,BuffType=0,MinLevel=0},		--Trench Fighting
	{Path=3,Type=2,ID=1544,Icon=004568,BuffType=3,MinLevel=0},		--Bugman's Best
	{Path=3,Type=1,ID=1566,Icon=022697,BuffType=0,MinLevel=0},		--Tracer Rounds
	{Path=3,Type=2,ID=1542,Icon=004654,BuffType=1,MinLevel=0},		--Electromagnet
	{Path=3,Type=3,ID=1582,Icon=004623,BuffType=2,Rank=4,MinLevel=0}		--Fling Explosives
	}
}

Warbuilder.Career[4].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=1509,Icon=004466,BuffType=5,MinLevel=1},		--Spanner Swipe
				{Type=2,ID=1511,Icon=004602,BuffType=0,MinLevel=3},		--Gun Turret
				{Type=2,ID=1532,Icon=004652,BuffType=0,MinLevel=3},		--Redeploy		
				{Type=2,ID=1526,Icon=004613,BuffType=0,MinLevel=6},		--Flame Turret
				{Type=2,ID=1516,Icon=004605,BuffType=1,MinLevel=7},		--Addling Shot
				{Type=2,ID=1518,Icon=004607,BuffType=0,MinLevel=8},		--Bombardment Turret
--				{Type=2,ID=14406,Icon=023411,BuffType=0,MinLevel=10},	--Bolster War Engine
				{Type=2,ID=1527,Icon=004620,BuffType=9,MinLevel=11},	--Flak Jacket
				{Type=2,ID=1519,Icon=004566,BuffType=5,MinLevel=12},	--Barbed Wire
				{Type=2,ID=1512,Icon=004603,BuffType=3,MinLevel=22},	--Shock Grenade
				{Type=2,ID=1525,Icon=004612,BuffType=2,MinLevel=25}	--Self-Destruct
--				{Type=2,ID=14407,Icon=023409,BuffType=1,MinLevel=30},	--Hamper War Engine
--				{Type=2,ID=14408,Icon=023406,BuffType=1,MinLevel=40}	--Diminish War Engine
				},
	Tactic = {
				{Type=1,ID=713,Icon=022711,BuffType=0,MinLevel=11},		--Stoutness of Stone
				{Type=1,ID=544,Icon=022694,BuffType=0,MinLevel=13},		--Expert Skirmisher
				{Type=1,ID=1548,Icon=022694,BuffType=0,MinLevel=15},	--Reinforced Casing
				{Type=1,ID=714,Icon=022711,BuffType=0,MinLevel=17},		--Stubbornness
				{Type=1,ID=542,Icon=022697,BuffType=0,MinLevel=19},		--Masterful Aim
				{Type=1,ID=1550,Icon=022697,BuffType=0,MinLevel=21},	--Hand-Crafted Scope
				{Type=1,ID=716,Icon=022711,BuffType=0,MinLevel=23},		--Ancestral Inheritance
				{Type=1,ID=549,Icon=022698,BuffType=0,MinLevel=25},		--Clever Recovery
				{Type=1,ID=1549,Icon=022708,BuffType=0,MinLevel=27},	--Concussive Mine
				{Type=1,ID=550,Icon=022709,BuffType=0,MinLevel=29},	--Pierce Defenses
				{Type=1,ID=1565,Icon=022709,BuffType=0,MinLevel=31},	--Well-Oiled Machine
				{Type=1,ID=1552,Icon=022704,BuffType=0,MinLevel=33},	--Fightin' Chance
				{Type=1,ID=1553,Icon=022694,BuffType=0,MinLevel=35},	--Proximity Alarm
				{Type=1,ID=1554,Icon=022697,BuffType=0,MinLevel=37},	--Tangling Wire
				{Type=1,ID=1555,Icon=022709,BuffType=0,MinLevel=39}	--Cordinated Fire
				},
	Morale = {
				{Type=3,ID=648,Icon=023165,BuffType=1,Rank=1,MinLevel=8},	--Point Blank
				{Type=3,ID=652,Icon=023162,BuffType=0,Rank=1,MinLevel=16},	--Concealment
				{Type=3,ID=1574,Icon=004619,BuffType=0,Rank=1,MinLevel=28},	--Autoloader
				--{Type=3,ID=2862,Icon=023166,BuffType=0,Rank=2,MinLevel=12},	--Unshackable Focus  IS REMOVED	
				{Type=3,ID=653,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=2712,Icon=004657,BuffType=0,Rank=2,MinLevel=32},	--Mortar Round 				
				{Type=3,ID=1575,Icon=004620,BuffType=0,Rank=2,MinLevel=32},	--Armored Plating
				{Type=3,ID=650,Icon=023163,BuffType=0,Rank=3,MinLevel=24},	--Explosive Shots
				{Type=3,ID=1576,Icon=004621,BuffType=2,Rank=3,MinLevel=36},	--Cannon Smash
				{Type=3,ID=651,Icon=023164,BuffType=0,Rank=4,MinLevel=40}	--Hail of Doom
				}
}


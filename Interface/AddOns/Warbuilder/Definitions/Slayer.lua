
--==Slayer==--
Warbuilder.Career[2] = { CareerIcon=20188, ID=20, Line=2, Build=190813.1}
Warbuilder.Career[2].Path = {
{Core={ Icon=004691,				--Path of The Trollslayer
			{Path=2,Type=2,ID=1449,Icon=004677,BuffType=2,MinLevel=2},		--Precarious Assault	
			{Path=1,Type=2,ID=1432,Icon=004660,BuffType=7,MinLevel=3},		--Slow Down			
			{Path=1,Type=2,ID=1431,Icon=004659,BuffType=7,MinLevel=5},		--Relentless Strike			
			{Path=1,Type=2,ID=1458,Icon=004680,BuffType=9,MinLevel=8},		--Fierceness
			{Path=1,Type=2,ID=1438,Icon=004666,BuffType=7,MinLevel=35}		--Enervating Blow
			},
	{Path=1,Type=1,ID=1482,Icon=022711,BuffType=4,MinLevel=0},		--Power Through
	{Path=1,Type=2,ID=1459,Icon=004681,BuffType=9,MinLevel=0},		--Rampage
	{Path=1,Type=1,ID=1483,Icon=022704,BuffType=4,MinLevel=0},		--Fierce Might
	{Path=1,Type=2,ID=1434,Icon=004662,BuffType=7,MinLevel=0},		--Deep Wound
	{Path=1,Type=1,ID=1484,Icon=022708,BuffType=3,MinLevel=0},		--Short Temper
	{Path=1,Type=2,ID=1457,Icon=004679,BuffType=4,MinLevel=0},		--Rune of Absorption
	{Path=1,Type=3,ID=1499,Icon=004691,BuffType=4,Rank=4,MinLevel=0}		--Unleashed Power
	},	
{Core={ Icon=004693,				--Path of The Giantslayer
			{Path=2,Type=2,ID=1433,Icon=004661,BuffType=7,MinLevel=1},		--Pulverizing Strike
			{Path=1,Type=2,ID=1437,Icon=004665,BuffType=2,MinLevel=7},		--Spine Crusher
			{Path=2,Type=2,ID=1439,Icon=004667,BuffType=2,MinLevel=9},		--DeathBlow
			{Path=2,Type=2,ID=1448,Icon=004676,BuffType=2,MinLevel=14},		--Reckless Gamble
			{Path=2,Type=2,ID=1443,Icon=004671,BuffType=2,MinLevel=30}		--Incapacitate
			},
	{Path=2,Type=1,ID=1485,Icon=022709,BuffType=4,MinLevel=0},		--Determination
	{Path=2,Type=2,ID=1460,Icon=004682,BuffType=7,MinLevel=0},		--Cleft In Twain
	{Path=2,Type=1,ID=1486,Icon=022711,BuffType=4,MinLevel=0},		--Violent Impacts
	{Path=2,Type=2,ID=1461,Icon=004683,BuffType=7,MinLevel=0},		--Devastate
	{Path=2,Type=1,ID=1487,Icon=022702,BuffType=4,MinLevel=0},		--Breaking Point
	{Path=2,Type=2,ID=1462,Icon=004684,BuffType=2,MinLevel=0},		--Spellbreaker
	{Path=2,Type=3,ID=1501,Icon=004693,BuffType=4,Rank=4,MinLevel=0}		--Looks Like a Challenge
	},
{Core={ Icon=004689,				--Path of The Skavenslayer
			{Path=3,Type=2,ID=1435,Icon=004663,BuffType=2,MinLevel=4},		--Flurry
			{Path=3,Type=2,ID=1447,Icon=004675,BuffType=2,MinLevel=6},		--Wild Swing		
			{Path=3,Type=2,ID=1446,Icon=004674,BuffType=9,MinLevel=20},		--Even the Odds
			{Path=3,Type=2,ID=1436,Icon=004664,BuffType=7,MinLevel=25},		--Onslaught
			{Path=3,Type=2,ID=1450,Icon=004678,BuffType=2,MinLevel=40}		--Retribution
		},
	{Path=3,Type=1,ID=1488,Icon=022704,BuffType=4,MinLevel=0},		--Takin' Chances
	{Path=3,Type=2,ID=1463,Icon=004685,BuffType=7,MinLevel=0},		--No Escape
	{Path=3,Type=1,ID=1490,Icon=022702,BuffType=4,MinLevel=0},		--Accuracy
	{Path=3,Type=2,ID=1464,Icon=004686,BuffType=7,MinLevel=0},		--Shatter Limbs
	{Path=3,Type=1,ID=1489,Icon=022694,BuffType=4,MinLevel=0},		--Runic Blessings
	{Path=3,Type=2,ID=1465,Icon=004687,BuffType=8,MinLevel=0},		--Inevitable Doom
	{Path=3,Type=3,ID=1494,Icon=004689,BuffType=7,Rank=4,MinLevel=0}		--Doom Seeker
	}
}

Warbuilder.Career[2].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=1430,Icon=004658,BuffType=2,MinLevel=1},		--Throw Axe
				{Type=2,ID=1440,Icon=004668,BuffType=4,MinLevel=10},	--Charge!
				{Type=2,ID=1441,Icon=004669,BuffType=7,MinLevel=10},	--Distracting Roar
				{Type=2,ID=14423,Icon=023403,BuffType=0,MinLevel=10},	--Bypass Defences
				{Type=2,ID=1442,Icon=004670,BuffType=9,MinLevel=12},	--Gudrun's Warcry
				{Type=2,ID=1444,Icon=004672,BuffType=7,MinLevel=16},	--Nimbing Strike
				{Type=2,ID=1445,Icon=004673,BuffType=4,MinLevel=18}		--Break Loose
--				{Type=2,ID=14422,Icon=023416,BuffType=1,MinLevel=30},	--Siege Wrecker
--				{Type=2,ID=14424,Icon=023408,BuffType=0,MinLevel=40}	--Faultfinder					
				},
	Tactic = {
				{Type=1,ID=713,Icon=022711,BuffType=0,MinLevel=11},		--Stoutness of Stone
				{Type=1,ID=526,Icon=022694,BuffType=0,MinLevel=13},		--Jagged Edge
				{Type=1,ID=1472,Icon=022702,BuffType=4,MinLevel=15},	--Wild Gambit
				{Type=1,ID=714,Icon=022711,BuffType=0,MinLevel=17},		--Stubbornness
				{Type=1,ID=521,Icon=022701,BuffType=0,MinLevel=19},		--Brute Force
				{Type=1,ID=1473,Icon=022702,BuffType=4,MinLevel=21},	--Hastened Punishment
				{Type=1,ID=716,Icon=022711,BuffType=0,MinLevel=23},		--Ancestral Inheritance
				{Type=1,ID=523,Icon=022704,BuffType=0,MinLevel=25},		--Flanking
				{Type=1,ID=1474,Icon=022706,BuffType=4,MinLevel=27},	--Honor Restored
				{Type=1,ID=528,Icon=022702,BuffType=0,MinLevel=29},		--Riposte
				{Type=1,ID=1475,Icon=022704,BuffType=4,MinLevel=31},	--Slaughter
				{Type=1,ID=522,Icon=022702,BuffType=0,MinLevel=32},		--Close Combat				
				{Type=1,ID=1476,Icon=022709,BuffType=4,MinLevel=33},	--Got No Time For You
				{Type=1,ID=1477,Icon=022696,BuffType=4,MinLevel=35},	--Push For More
				{Type=1,ID=1478,Icon=022694,BuffType=4,MinLevel=37},	--The Bigger They Are...
				{Type=1,ID=1479,Icon=022711,BuffType=4,MinLevel=39}		--Embrace the Pain
				},
	Morale = { 
				{Type=3,ID=627,Icon=023161,BuffType=2,Rank=1,MinLevel=8},	--Severe Nerve
				{Type=3,ID=631,Icon=023157,BuffType=0,Rank=1,MinLevel=16},	--Confusing Movements		
				{Type=3,ID=1493,Icon=004688,BuffType=4,Rank=1,MinLevel=28},	--Untouchable		
				{Type=3,ID=628,Icon=023158,BuffType=0,Rank=2,MinLevel=12},	--Force of Will
				{Type=3,ID=633,Icon=023160,BuffType=0,Rank=2,MinLevel=20},	--Relentless Assault
				{Type=3,ID=2861,Icon=004692,BuffType=4,Rank=2,MinLevel=32},	--Deadly Determination
				{Type=3,ID=629,Icon=023156,BuffType=0,Rank=3,MinLevel=24},	--Broad Swings
				{Type=3,ID=1495,Icon=004690,BuffType=4,Rank=3,MinLevel=36},	--Grievous Harm
				{Type=3,ID=630,Icon=023159,BuffType=0,Rank=4,MinLevel=40}	--Frenzied Slaughter							
			}
}

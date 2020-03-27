

--==Sorcerer==--
Warbuilder.Career[24] = { CareerIcon=20196, ID=107, Line=24, Build=190813.1}
Warbuilder.Career[24].Path = {
{Core={ Icon=004527,				--Path of Agony

		{Path=1,Type=2,ID=9470,Icon=010995,BuffType=2,MinLevel=1},		--Doombolt
		{Path=1,Type=2,ID=9472,Icon=010907,BuffType=2,MinLevel=2},		--Gloomburst
		{Path=1,Type=2,ID=9476,Icon=010909,BuffType=9,MinLevel=6},		--Frozen Touch
		{Path=1,Type=2,ID=9479,Icon=010924,BuffType=2,MinLevel=10},		--Arctic Blast
		{Path=1,Type=2,ID=9482,Icon=010915,BuffType=6,MinLevel=20}		--Frostbite
		},
	{Path=1,Type=1,ID=9521,Icon=022708,BuffType=0,MinLevel=0},		--Recover Energy
	{Path=1,Type=2,ID=9498,Icon=010923,BuffType=2,MinLevel=0},		--Echo of Power
	{Path=1,Type=1,ID=9522,Icon=022702,BuffType=0,MinLevel=0},		--Tapping The Dark
	{Path=1,Type=2,ID=9499,Icon=010912,BuffType=2,MinLevel=0},		--Impending Doom
	{Path=1,Type=1,ID=9527,Icon=022704,BuffType=0,MinLevel=0},		--Swell of Gloom
	{Path=1,Type=2,ID=9504,Icon=010999,BuffType=6,MinLevel=0},		--Shades of Death
	{Path=1,Type=3,ID=9542,Icon=010932,BuffType=2,Rank=4,MinLevel=0}		--Soul Stealer
	},	
{Core={ Icon=004610,				--Path of Calamity
		{Path=2,Type=2,ID=9471,Icon=010996,BuffType=6,MinLevel=1},		--Chillwind
		{Path=2,Type=2,ID=9475,Icon=010908,BuffType=6,MinLevel=7},		--Word of Pain
		{Path=2,Type=2,ID=9486,Icon=010919,BuffType=6,MinLevel=14},		--Ice Spikes
		{Path=2,Type=2,ID=9473,Icon=011005,BuffType=9,MinLevel=18},		--Daemonic Chill
		{Path=2,Type=2,ID=9478,Icon=010911,BuffType=6,MinLevel=35}		--Vision of Torment
		},
	{Path=2,Type=1,ID=9523,Icon=022706,BuffType=0,MinLevel=0},		--Vision of Domination
	{Path=2,Type=2,ID=9500,Icon=010925,BuffType=6,MinLevel=0},		--Gloom of Night
	{Path=2,Type=1,ID=9524,Icon=022697,BuffType=0,MinLevel=0},		--Shadow of Disaster
	{Path=2,Type=2,ID=9505,Icon=011000,BuffType=2,MinLevel=0},		--Hand of Ruin
	{Path=2,Type=1,ID=9528,Icon=022704,BuffType=0,MinLevel=0},		--Chilling Gusts
	{Path=2,Type=2,ID=9501,Icon=010926,BuffType=6,MinLevel=0},		--Absorb Vitality
	{Path=2,Type=3,ID=9543,Icon=010933,BuffType=1,Rank=4,MinLevel=0}		--Crippling Terror
	},
{Core={ Icon=004466,				--Path of Destruction
		{Path=3,Type=2,ID=9483,Icon=010916,BuffType=2,MinLevel=5},		--Surging Pain
		{Path=3,Type=2,ID=9480,Icon=010913,BuffType=2,MinLevel=8},		--Shattered Shadows
		{Path=3,Type=2,ID=9488,Icon=010921,BuffType=2,MinLevel=16},		--Infernal Wave
		{Path=3,Type=2,ID=9485,Icon=010927,BuffType=2,MinLevel=25},		--Pit of Shades
		{Path=3,Type=2,ID=9489,Icon=010922,BuffType=6,MinLevel=40}		--Stricken Voices

	},
	{Path=3,Type=1,ID=9525,Icon=022696,BuffType=0,MinLevel=0},		--Piercing Shadows
	{Path=3,Type=2,ID=9506,Icon=011001,BuffType=6,MinLevel=0},		--Black Horror
	{Path=3,Type=1,ID=9526,Icon=022694,BuffType=0,MinLevel=0},		--Lengthening Shadows
	{Path=3,Type=2,ID=9503,Icon=010928,BuffType=2,MinLevel=0},		--Disastrous Cascade
	{Path=3,Type=1,ID=9529,Icon=022704,BuffType=0,MinLevel=0},		--Neverending Agony
	{Path=3,Type=2,ID=9502,Icon=010918,BuffType=2,MinLevel=0},		--Shadow Knives
	{Path=3,Type=3,ID=9544,Icon=010934,BuffType=2,Rank=4,MinLevel=0}		--Paralyzing Nightmares
	}
}

Warbuilder.Career[24].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=9490,Icon=010962,BuffType=2,MinLevel=1},		--Dhar Wind
				{Type=2,ID=9484,Icon=010917,BuffType=9,MinLevel=3},		--Shroud of Darkness
				{Type=2,ID=9474,Icon=010998,BuffType=1,MinLevel=4},		--Dread Aspect
				{Type=2,ID=9481,Icon=010914,BuffType=0,MinLevel=9},		--Obsessive Focus
--				{Type=2,ID=14410,Icon=023407,BuffType=0,MinLevel=10},	--Enhance War Engine
				{Type=2,ID=9477,Icon=010910,BuffType=1,MinLevel=12},	--Grip of Fear
				{Type=2,ID=9487,Icon=010920,BuffType=0,MinLevel=30}		--Reckless Gathering
--				{Type=2,ID=14411,Icon=023410,BuffType=1,MinLevel=30},	--Hex War Engine
--				{Type=2,ID=14412,Icon=023400,BuffType=1,MinLevel=40}	--Abate War Engine
				},
	Tactic = {
				{Type=1,ID=841,Icon=022712,BuffType=0,MinLevel=11},		--Dark Blessings
				{Type=1,ID=568,Icon=022704,BuffType=0,MinLevel=13},		--Devour Energy
				{Type=1,ID=839,Icon=022712,BuffType=0,MinLevel=17},		--Alignment of Naggaroth
				{Type=1,ID=563,Icon=022695,BuffType=0,MinLevel=19},		--Endless Knowledge
				{Type=1,ID=9511,Icon=022708,BuffType=0,MinLevel=21},	--Infernal Gift
				{Type=1,ID=840,Icon=022712,BuffType=9,MinLevel=23},		--Bathing In Blood
				{Type=1,ID=567,Icon=022708,BuffType=0,MinLevel=25},		--Sleight of Hand
				{Type=1,ID=9510,Icon=022712,BuffType=0,MinLevel=27},	--Empowered Dhar
				{Type=1,ID=9512,Icon=022704,BuffType=0,MinLevel=28},	--Grasping Darkness				
				{Type=1,ID=569,Icon=022694,BuffType=0,MinLevel=29},	--Close Quarters
				{Type=1,ID=9513,Icon=022694,BuffType=0,MinLevel=31},	--Manic Obsession
				{Type=1,ID=9514,Icon=022708,BuffType=0,MinLevel=33},	--Triumphant Blasting
				{Type=1,ID=9515,Icon=022696,BuffType=0,MinLevel=35},	--Hastened Fear
				{Type=1,ID=9516,Icon=022704,BuffType=0,MinLevel=37},	--Glorious Carnage
				{Type=1,ID=9517,Icon=022709,BuffType=0,MinLevel=39}	--Frozen Fury
				},
	Morale = {
				{Type=3,ID=670,Icon=023167,BuffType=2,Rank=1,MinLevel=8},	--Mage Bolt
				{Type=3,ID=673,Icon=023168,BuffType=0,Rank=1,MinLevel=16},	--Misdirection
				{Type=3,ID=9536,Icon=010937,BuffType=2,Rank=1,MinLevel=28},	--Dire Blast
				{Type=3,ID=669,Icon=023170,BuffType=0,Rank=2,MinLevel=12},	--Siphon Power
				{Type=3,ID=674,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=9537,Icon=010930,BuffType=0,Rank=2,MinLevel=32},	--Wind-Woven Shell
				{Type=3,ID=2710,Icon=010993,BuffType=2,Rank=2,MinLevel=32},	--Shatter			
				{Type=3,ID=671,Icon=023169,BuffType=2,Rank=3,MinLevel=24},	--Scintillating Energy
				{Type=3,ID=9538,Icon=010931,BuffType=0,Rank=3,MinLevel=36},	--Darkstar Cloak
				{Type=3,ID=672,Icon=023171,BuffType=1,Rank=4,MinLevel=40}	--Unleash the Winds
				}
}


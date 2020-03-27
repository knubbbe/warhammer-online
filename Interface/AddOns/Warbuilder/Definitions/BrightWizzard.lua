

--==BrightWizzard==--
Warbuilder.Career[11] = { CareerIcon=20183, ID=62, Line=11, Build=190813.1}
Warbuilder.Career[11].Path = {
{Core={ Icon=004527,				--Path of Incineration

		{Path=1,Type=2,ID=8159,Icon=007933,BuffType=2,MinLevel=1},		--Burning Iron
		{Path=1,Type=2,ID=8160,Icon=007955,BuffType=2,MinLevel=2},		--Fireball
		{Path=1,Type=2,ID=8164,Icon=007910,BuffType=9,MinLevel=6},		--Flames of Rhuin
		{Path=1,Type=2,ID=8169,Icon=008017,BuffType=2,MinLevel=10},		--Pyroclastic Surge
		{Path=1,Type=2,ID=8173,Icon=008019,BuffType=2,MinLevel=20}		--Sear
		},
	{Path=1,Type=1,ID=8205,Icon=022706,BuffType=0,MinLevel=0},		--Searing Vitality
	{Path=1,Type=2,ID=8181,Icon=007919,BuffType=2,MinLevel=0},		--Funnel Power
	{Path=1,Type=1,ID=8204,Icon=022708,BuffType=0,MinLevel=0},		--Draining Burn
	{Path=1,Type=2,ID=8182,Icon=007936,BuffType=2,MinLevel=0},		--Nova
	{Path=1,Type=1,ID=8206,Icon=022703,BuffType=0,MinLevel=0},		--Burn Through
	{Path=1,Type=2,ID=8183,Icon=008021,BuffType=2,MinLevel=0},		--Fireball Barrage
	{Path=1,Type=3,ID=8220,Icon=007937,BuffType=2,Rank=4,MinLevel=0}		--The Burning Head
	},	
{Core={ Icon=004610,				--Path of Immolation
		{Path=2,Type=2,ID=8158,Icon=007913,BuffType=5,MinLevel=1},		--Ignite
		{Path=2,Type=2,ID=8165,Icon=008015,BuffType=5,MinLevel=7},		--Boiling Blood
		{Path=2,Type=2,ID=8170,Icon=007902,BuffType=5,MinLevel=14},		--Detonate
		{Path=2,Type=2,ID=8161,Icon=007911,BuffType=9,MinLevel=18},		--Flame Shield
		{Path=2,Type=2,ID=8176,Icon=007940,BuffType=5,MinLevel=35}		--Slow Boil
		},
	{Path=2,Type=1,ID=8207,Icon=022694,BuffType=0,MinLevel=0},		--Fuel To The Fire
	{Path=2,Type=2,ID=8184,Icon=008022,BuffType=5,MinLevel=0},		--Playing With Fire
	{Path=2,Type=1,ID=8209,Icon=022704,BuffType=0,MinLevel=0},		--Ignition
	{Path=2,Type=2,ID=8185,Icon=008023,BuffType=2,MinLevel=0},		--Withering Heat
	{Path=2,Type=1,ID=8208,Icon=022704,BuffType=0,MinLevel=0},		--Smoldering Embers
	{Path=2,Type=2,ID=8186,Icon=008024,BuffType=2,MinLevel=0},		--Stop, Drop, And Roll
	{Path=2,Type=3,ID=8221,Icon=007941,BuffType=2,Rank=4,MinLevel=0}		--Wall of Fire
	},
{Core={ Icon=004466,				--Path of Conflagration
		{Path=3,Type=2,ID=8163,Icon=008014,BuffType=2,MinLevel=5},		--Scorched Earth
		{Path=3,Type=2,ID=8166,Icon=007934,BuffType=2,MinLevel=8},		--Fiery Blast
		{Path=3,Type=2,ID=8171,Icon=008018,BuffType=2,MinLevel=16},		--Flame Breath
		{Path=3,Type=2,ID=8177,Icon=007939,BuffType=2,MinLevel=25},		--Rain of Fire
		{Path=3,Type=2,ID=8174,Icon=008020,BuffType=5,MinLevel=40}		--Chocking Smoke
	},
	{Path=3,Type=1,ID=8210,Icon=022696,BuffType=0,MinLevel=0},		--Explosive Force
	{Path=3,Type=2,ID=8187,Icon=007958,BuffType=2,MinLevel=0},		--Annihilate
	{Path=3,Type=1,ID=8212,Icon=022709,BuffType=0,MinLevel=0},		--Fiery Reserves
	{Path=3,Type=2,ID=8188,Icon=007956,BuffType=5,MinLevel=0},		--Spreading Flames
	{Path=3,Type=1,ID=8211,Icon=022703,BuffType=0,MinLevel=0},		--Wildfire
	{Path=3,Type=2,ID=8189,Icon=007936,BuffType=5,MinLevel=0},		--Backdraft
	{Path=3,Type=3,ID=8222,Icon=007942,BuffType=2,Rank=4,MinLevel=0}		--Conflagration of Doom
	}
}

Warbuilder.Career[11].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8179,Icon=004630,BuffType=2,MinLevel=1},		--Meltdown
				{Type=2,ID=8172,Icon=008012,BuffType=9,MinLevel=3},		--Shield of Aqshy
				{Type=2,ID=8162,Icon=008013,BuffType=1,MinLevel=4},		--Smoke Screen
				{Type=2,ID=8167,Icon=008016,BuffType=3,MinLevel=9},		--Cauterize
				{Type=2,ID=8168,Icon=007924,BuffType=5,MinLevel=12},	--Fire Cage
--				{Type=2,ID=14410,Icon=023407,BuffType=0,MinLevel=10},	--Enhance War Engine
				{Type=2,ID=8175,Icon=007957,BuffType=0,MinLevel=30}		--Burnout
--				{Type=2,ID=14411,Icon=023410,BuffType=1,MinLevel=30},	--Hex War Engine
--				{Type=2,ID=14412,Icon=023400,BuffType=1,MinLevel=40}	--Abate War Engine
				},
	Tactic = {
				{Type=1,ID=779,Icon=022710,BuffType=0,MinLevel=11},		--Emperor's Ward
				{Type=1,ID=568,Icon=022704,BuffType=0,MinLevel=13},		--Devour Energy
				{Type=1,ID=8195,Icon=022703,BuffType=0,MinLevel=15},	--Lingering Fires
				{Type=1,ID=777,Icon=022710,BuffType=0,MinLevel=17},		--Unwavering Faith
				{Type=1,ID=563,Icon=022695,BuffType=0,MinLevel=19},		--Endless Knowledge
				{Type=1,ID=8201,Icon=022704,BuffType=0,MinLevel=21},	--Fueled From Within
				{Type=1,ID=776,Icon=022710,BuffType=0,MinLevel=23},		--Sigmar's Favor
				{Type=1,ID=567,Icon=022708,BuffType=0,MinLevel=25},		--Sleight of Hand
				{Type=1,ID=8194,Icon=022708,BuffType=0,MinLevel=27},	--Power From The Ashes
				{Type=1,ID=569,Icon=022694,BuffType=0,MinLevel=29},	--Close Quarters
				{Type=1,ID=8196,Icon=022694,BuffType=0,MinLevel=31},	--Flashfire
				{Type=1,ID=8198,Icon=022709,BuffType=0,MinLevel=33},	--Fan The Flames
				{Type=1,ID=8199,Icon=022704,BuffType=0,MinLevel=35},	--Distracting Fires
				{Type=1,ID=8200,Icon=022703,BuffType=0,MinLevel=37},	--Embrace The Flames
				{Type=1,ID=8197,Icon=022713,BuffType=0,MinLevel=39}	--Crown of Fire
				},
	Morale = {
				{Type=3,ID=670,Icon=023167,BuffType=2,Rank=1,MinLevel=8},	--Mage Bolt
				{Type=3,ID=673,Icon=023168,BuffType=0,Rank=1,MinLevel=16},	--Misdirection
				{Type=3,ID=8215,Icon=008026,BuffType=2,Rank=1,MinLevel=28},	--Magic Dart
				{Type=3,ID=669,Icon=023170,BuffType=0,Rank=2,MinLevel=12},	--Siphon Power
				{Type=3,ID=674,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=8216,Icon=008027,BuffType=2,Rank=2,MinLevel=32},	--Ruin And Destruction
				{Type=3,ID=671,Icon=023169,BuffType=2,Rank=3,MinLevel=24},	--Scintillating Energy
				{Type=3,ID=8217,Icon=008028,BuffType=0,Rank=3,MinLevel=36},	--Heart of Fire
				{Type=3,ID=672,Icon=023171,BuffType=1,Rank=4,MinLevel=40}	--Unleash the Winds
				}
}


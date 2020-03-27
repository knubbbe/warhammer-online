
--==ArchMage==--
Warbuilder.Career[20] = { CareerIcon=20180, ID=95, Line=20, Build=190813.1}
Warbuilder.Career[20].Path = {
{Core={ Icon=005113,				--Path of Isha
		{Path=1,Type=2,ID=9236,Icon=013340,BuffType=9,MinLevel=1},		--Healing Energy
		{Path=1,Type=2,ID=9248,Icon=013312,BuffType=9,MinLevel=7},		--Prismatic Shield
		{Path=1,Type=2,ID=9242,Icon=013346,BuffType=3,MinLevel=8},		--Boon of Hysh
		{Path=1,Type=2,ID=9244,Icon=013348,BuffType=3,MinLevel=16},		--Cleansing Light
		{Path=1,Type=2,ID=9245,Icon=013349,BuffType=3,MinLevel=20}		--Blessing of Isha
		},
	{Path=1,Type=1,ID=9288,Icon=022708,BuffType=0,MinLevel=0},		--Bolstering Boon
	{Path=1,Type=2,ID=9272,Icon=013413,BuffType=3,MinLevel=0},		--Magical Infusion
	{Path=1,Type=1,ID=9293,Icon=022706,BuffType=0,MinLevel=0},		--Wild Healing
	{Path=1,Type=2,ID=9251,Icon=013355,BuffType=5,MinLevel=0},		--Mistress of The Marsh	
	{Path=1,Type=1,ID=9297,Icon=022706,BuffType=0,MinLevel=0},		--Apotheosis
	{Path=1,Type=2,ID=9258,Icon=013347,BuffType=3,MinLevel=0},		--Funnel Essence
	{Path=1,Type=3,ID=9308,Icon=013414,BuffType=3,Rank=4,MinLevel=0}		--Wind's Protection
	},	
{Core={ Icon=005237,				--Path of Asuryan
		{Path=2,Type=2,ID=9237,Icon=013341,BuffType=2,MinLevel=1},		--Radiant Lance
		{Path=2,Type=2,ID=9239,Icon=013343,BuffType=5,MinLevel=2},		--Law of Conductivity
		{Path=2,Type=2,ID=9250,Icon=013354,BuffType=2,MinLevel=6},		--Searing Touch
		{Path=2,Type=2,ID=9264,Icon=013360,BuffType=5,MinLevel=12},		--Radiating Gaze
		{Path=2,Type=2,ID=9267,Icon=013363,BuffType=2,MinLevel=35}		--Fury of Asuryan
		},
	{Path=2,Type=1,ID=9289,Icon=022703,BuffType=0,MinLevel=0},		--Forked Lancing
	{Path=2,Type=2,ID=9266,Icon=013362,BuffType=2,MinLevel=0},		--Cleansing Flare		
	{Path=2,Type=1,ID=9290,Icon=022704,BuffType=2,MinLevel=0},		--Dispel Magic
	{Path=2,Type=2,ID=9247,Icon=013351,BuffType=5,MinLevel=0},		--Scatter The Winds
	{Path=2,Type=1,ID=2748,Icon=022696,BuffType=0,MinLevel=0},		--Khain's Touch
	{Path=2,Type=2,ID=9271,Icon=013336,BuffType=9,MinLevel=0},		--Dissipating Energies
	{Path=2,Type=3,ID=9309,Icon=013415,BuffType=2,Rank=4,MinLevel=0}		--Flames of the Pheonix
	},
{Core={ Icon=005236,				--Path of Vaul
		{Path=3,Type=2,ID=2300,Icon=013463,BuffType=2,MinLevel=4},		--Balance Essence
		{Path=3,Type=2,ID=9268,Icon=013364,BuffType=9,MinLevel=5},		--Shield of Saphery
		{Path=3,Type=2,ID=9241,Icon=013345,BuffType=5,MinLevel=9},		--Transfer Force
		{Path=3,Type=2,ID=9240,Icon=013344,BuffType=5,MinLevel=30},		--Rain Lord
		{Path=3,Type=2,ID=9252,Icon=013356,BuffType=5,MinLevel=40}		--Law of Ages
	},
	{Path=3,Type=1,ID=9295,Icon=022706,BuffType=0,MinLevel=0},		--Arching Power
	{Path=3,Type=2,ID=9269,Icon=013365,BuffType=5,MinLevel=0},		--Storm of Cronos	
	{Path=3,Type=1,ID=9292,Icon=022713,BuffType=0,MinLevel=0},		--Golden Aura
	{Path=3,Type=2,ID=9253,Icon=013357,BuffType=5,MinLevel=0},		--Law of Gold
	{Path=3,Type=1,ID=2305,Icon=022705,BuffType=0,MinLevel=0},		--Penetrating Siphon
	{Path=3,Type=2,ID=9274,Icon=013333,BuffType=2,MinLevel=0},		--Energy of Vaul
	{Path=3,Type=3,ID=9310,Icon=013459,BuffType=0,Rank=4,MinLevel=0}		--Funnel Energy
	}
}

Warbuilder.Career[20].Core = {
	Ability = {--Check BuffTypes
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=9238,Icon=013342,BuffType=9,MinLevel=3},		--Lambent Aura
				{Type=2,ID=9256,Icon=013358,BuffType=1,MinLevel=7},		--Dissipating Hatred
				{Type=2,ID=9246,Icon=013350,BuffType=3,MinLevel=10},	--Gift of Life
--				{Type=2,ID=14414,Icon=023414,BuffType=0,MinLevel=10},	--Reinforce War Engine
				{Type=2,ID=9265,Icon=013361,BuffType=1,MinLevel=14},	--Walk Between Worlds
				{Type=2,ID=9249,Icon=013353,BuffType=5,MinLevel=18},	--Drain Magic				
				{Type=2,ID=9255,Icon=013359,BuffType=5,MinLevel=25}		--Wind Blast
--				{Type=2,ID=14415,Icon=023404,BuffType=0,MinLevel=30},	--Cleanse War Engine
--				{Type=2,ID=14416,Icon=023415,BuffType=0,MinLevel=40}	--Shield the Skies
				},
	Tactic = {
				{Type=1,ID=818,Icon=022705,BuffType=0,MinLevel=11},		--Centuries of Training
				{Type=1,ID=585,Icon=022703,BuffType=0,MinLevel=13},		--Divine Fury
				{Type=1,ID=9276,Icon=022703,BuffType=0,MinLevel=15},	--Empowered Lores
				{Type=1,ID=819,Icon=022705,BuffType=0,MinLevel=17},		--Bend the Winds
				{Type=1,ID=592,Icon=022706,BuffType=0,MinLevel=19},		--Discipline
				{Type=1,ID=9277,Icon=022705,BuffType=0,MinLevel=21},	--Isha's Encouragement
				{Type=1,ID=823,Icon=022705,BuffType=0,MinLevel=23},		--Discerning Offense
				{Type=1,ID=588,Icon=022709,BuffType=0,MinLevel=25},		--Subtlety
				{Type=1,ID=9278,Icon=022706,BuffType=0,MinLevel=27},	--Master of Tranquility
				{Type=1,ID=589,Icon=022694,BuffType=0,MinLevel=29},		--Restorative Burst
				{Type=1,ID=9279,Icon=022703,BuffType=0,MinLevel=31},	--Hurried Restore
				{Type=1,ID=9280,Icon=022704,BuffType=0,MinLevel=33},	--Master of Force
				{Type=1,ID=9281,Icon=022708,BuffType=0,MinLevel=35},	--Transfer Magic
				{Type=1,ID=9282,Icon=022694,BuffType=0,MinLevel=37},	--Run Between Worlds
				{Type=1,ID=9283,Icon=022706,BuffType=0,MinLevel=39}		--Desperation
				},
	Morale = { 
				{Type=3,ID=694,Icon=023151,BuffType=3,Rank=1,MinLevel=8},	--Divine Favor
				{Type=3,ID=690,Icon=023155,BuffType=0,Rank=1,MinLevel=16},	--Steal Life
				{Type=3,ID=2858,Icon=013366,BuffType=0,Rank=1,MinLevel=28},	--Isha's Ward
				{Type=3,ID=692,Icon=023154,BuffType=0,Rank=2,MinLevel=12},	--Rampaging Siphon
				{Type=3,ID=695,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=9303,Icon=013367,BuffType=1,Rank=2,MinLevel=32},	--Blinding Light
				{Type=3,ID=696,Icon=023152,BuffType=0,Rank=3,MinLevel=24},	--Divine Protection
				{Type=3,ID=9304,Icon=013368,BuffType=1,Rank=3,MinLevel=36},	--Arcane Suppression
				{Type=3,ID=697,Icon=023150,BuffType=0,Rank=4,MinLevel=40}	--Alter Fate
			}
}

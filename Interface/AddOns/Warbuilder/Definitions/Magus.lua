

--==Magus==--
Warbuilder.Career[16] = { CareerIcon=20191, ID=67, Line=16, Build=190813.1}
Warbuilder.Career[16].Path = {
{Core={ Icon=004527,				--Path of Havoc
		{Path=1,Type=2,ID=8470,Icon=005106,BuffType=2,MinLevel=1},		--Flickering Red Fire
		{Path=1,Type=4,ID=443,Icon=005273,BuffType=14,MinLevel=3},		--Daemonic Fire
		{Path=1,Type=2,ID=8488,Icon=005307,BuffType=5,MinLevel=9},		--Baleful Transmogrification
		{Path=1,Type=2,ID=8479,Icon=005283,BuffType=2,MinLevel=10},		--Surging Violet Fire
		{Path=1,Type=4,ID=444,Icon=005274,BuffType=14,MinLevel=17},		--Daemonic Consumption
		{Path=1,Type=2,ID=8491,Icon=005308,BuffType=5,MinLevel=30},		--Withered Soul
		{Path=1,Type=2,ID=8486,Icon=005149,BuffType=5,MinLevel=35}		--Mutating Blue Fire
		},
	{Path=1,Type=1,ID=8517,Icon=022704,BuffType=2,MinLevel=0},		--Fiery Winds
	{Path=1,Type=2,ID=8495,Icon=005293,BuffType=5,MinLevel=0},		--Perils of The Warp
	{Path=1,Type=1,ID=8516,Icon=022706,BuffType=3,MinLevel=0},		--Changer's Blessing
	{Path=1,Type=2,ID=8496,Icon=005294,BuffType=2,MinLevel=0},		--Bolt of Change
	{Path=1,Type=1,ID=8518,Icon=022704,BuffType=0,MinLevel=0},		--Chaos Unleashed
	{Path=1,Type=2,ID=8502,Icon=005300,BuffType=2,MinLevel=0},		--Indigo Fire of Change	
	{Path=1,Type=3,ID=8533,Icon=005151,BuffType=2,Rank=4,MinLevel=0}		--Soul Leak
	},	
{Core={ Icon=004610,				--Path of Changing
		{Path=2,Type=2,ID=8471,Icon=005112,BuffType=2,MinLevel=2},		--Rend Winds
		{Path=2,Type=2,ID=8482,Icon=005286,BuffType=5,MinLevel=5},		--Glean Magic
		{Path=2,Type=4,ID=447,Icon=005281,BuffType=14,MinLevel=8},		--Flame of Tzeentch
		{Path=2,Type=4,ID=448,Icon=005282,BuffType=14,MinLevel=13},		--Flames of Change
		{Path=2,Type=2,ID=8475,Icon=005275,BuffType=2,MinLevel=14},		--Surge of Insanity
		{Path=2,Type=2,ID=8489,Icon=005312,BuffType=5,MinLevel=16},		--Pandemonium
		{Path=2,Type=2,ID=8483,Icon=005153,BuffType=2,MinLevel=20}		--Warping Blast
		},
	{Path=2,Type=1,ID=8519,Icon=022694,BuffType=0,MinLevel=0},		--Endless Pandemonium
	{Path=2,Type=2,ID=8497,Icon=005295,BuffType=5,MinLevel=0},		--Seed of Chaos
	{Path=2,Type=1,ID=8520,Icon=022697,BuffType=0,MinLevel=0},		--Daemonic Reach
	{Path=2,Type=2,ID=8498,Icon=005296,BuffType=2,MinLevel=0},		--Tzeentch's Firestorm
	{Path=2,Type=1,ID=8521,Icon=022708,BuffType=0,MinLevel=0},		--Wild Changing
	{Path=2,Type=2,ID=8494,Icon=005287,BuffType=2,MinLevel=0},		--Dissolving Mist
	{Path=2,Type=3,ID=8534,Icon=005302,BuffType=2,Rank=4,MinLevel=0}		--Daemonic Scream
	},
{Core={ Icon=004466,				--Path of Daemonology
		{Path=3,Type=2,ID=8487,Icon=005290,BuffType=2,MinLevel=4},		--Infernal Blast
		{Path=3,Type=2,ID=8472,Icon=005270,BuffType=2,MinLevel=6},		--Daemonic Lash
		{Path=3,Type=4,ID=445,Icon=005277,BuffType=14,MinLevel=6},		--Warping Energy
		{Path=3,Type=4,ID=446,Icon=005278,BuffType=14,MinLevel=15},		--Coruscating Energy
		{Path=3,Type=2,ID=8541,Icon=005310,BuffType=2,MinLevel=18},		--Daemonic Infestation
		{Path=3,Type=2,ID=8490,Icon=005142,BuffType=9,MinLevel=28},		--Daemonic Resistance
		{Path=3,Type=2,ID=8485,Icon=005305,BuffType=2,MinLevel=40}		--Warpfire
	},
	{Path=3,Type=1,ID=8509,Icon=022694,BuffType=0,MinLevel=0},		--Lasting Chaos
	{Path=3,Type=2,ID=8500,Icon=005289,BuffType=0,MinLevel=0},		--Agonizing Torrent
	{Path=3,Type=1,ID=8524,Icon=022709,BuffType=0,MinLevel=0},		--Daemonic Contract
	{Path=3,Type=2,ID=8501,Icon=005285,BuffType=9,MinLevel=0},		--Aegis of Orange Fire
	{Path=3,Type=1,ID=8523,Icon=022702,BuffType=0,MinLevel=0},		--Daemonic Pact
	{Path=3,Type=2,ID=8499,Icon=005297,BuffType=1,MinLevel=0},		--Chaotic Rift
	{Path=3,Type=3,ID=8535,Icon=005303,BuffType=0,Rank=4,MinLevel=0}		--Firewyrm of Tzeentch
	}
}

Warbuilder.Career[16].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8484,Icon=005304,BuffType=4,MinLevel=1},		--Daemonic Maw
				{Type=2,ID=8474,Icon=005272,BuffType=0,MinLevel=3},		--Summon Pink Horror
				{Type=2,ID=8542,Icon=005311,BuffType=0,MinLevel=3},		--Resummon
				{Type=2,ID=8476,Icon=005276,BuffType=0,MinLevel=6},		--Summon Blue Horror
				{Type=2,ID=8477,Icon=005279,BuffType=1,MinLevel=7},		--Horrifying Vision
				{Type=2,ID=8478,Icon=005280,BuffType=0,MinLevel=8},		--Summon Flamer
--				{Type=2,ID=14410,Icon=023407,BuffType=0,MinLevel=10},	--Enhance War Engine
				{Type=2,ID=8492,Icon=005309,BuffType=9,MinLevel=11},	--Daemonic Armor
				{Type=2,ID=8480,Icon=005284,BuffType=5,MinLevel=12},	--Tzeentch's Grasp
				{Type=2,ID=8473,Icon=005271,BuffType=3,MinLevel=22},	--Shocking Jolt
				{Type=2,ID=8481,Icon=005299,BuffType=2,MinLevel=25}		--Instability
--				{Type=2,ID=14411,Icon=023410,BuffType=1,MinLevel=30},	--Hex War Engine
--				{Type=2,ID=14412,Icon=023400,BuffType=1,MinLevel=40}	--Abate War Engine
				},
	Tactic = {
				{Type=1,ID=797,Icon=022714,BuffType=0,MinLevel=11},		--Warped Flesh
				{Type=1,ID=568,Icon=022704,BuffType=0,MinLevel=13},		--Devour Energy
				{Type=1,ID=8512,Icon=022702,BuffType=0,MinLevel=15},	--Infernal Flesh
				{Type=1,ID=798,Icon=022714,BuffType=0,MinLevel=17},		--Tzeentch's Warding
				{Type=1,ID=563,Icon=022695,BuffType=0,MinLevel=19},		--Endless Knowledge
				{Type=1,ID=8506,Icon=022709,BuffType=0,MinLevel=21},	--Unearthly Shriek
				{Type=1,ID=800,Icon=022714,BuffType=0,MinLevel=23},		--Backlash
				{Type=1,ID=567,Icon=022708,BuffType=0,MinLevel=25},		--Sleight of Hand
				{Type=1,ID=8507,Icon=022704,BuffType=2,MinLevel=27},	--Flame's Kiss
				{Type=1,ID=569,Icon=022694,BuffType=0,MinLevel=29},		--Close Quarters
				{Type=1,ID=8522,Icon=022713,BuffType=0,MinLevel=31},	--Chaotic Attunement
				{Type=1,ID=8510,Icon=022708,BuffType=0,MinLevel=33},	--Infernal Pain
				{Type=1,ID=8511,Icon=022709,BuffType=2,MinLevel=35},	--Surging Power
				{Type=1,ID=8508,Icon=022703,BuffType=0,MinLevel=37},	--Swift Flames
				{Type=1,ID=8513,Icon=022706,BuffType=3,MinLevel=39}		--Daemonic Withering
				},
	Morale = {
				{Type=3,ID=670,Icon=023167,BuffType=2,Rank=1,MinLevel=8},	--Mage Bolt
				{Type=3,ID=673,Icon=023168,BuffType=0,Rank=1,MinLevel=16},	--Misdirection
				{Type=3,ID=8527,Icon=005301,BuffType=2,Rank=1,MinLevel=28},	--Grasping Darkness
				{Type=3,ID=669,Icon=023170,BuffType=0,Rank=2,MinLevel=12},	--Siphon Power
				{Type=3,ID=674,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=8528,Icon=005114,BuffType=2,Rank=2,MinLevel=32},	--Roiling Winds
				{Type=3,ID=671,Icon=023169,BuffType=2,Rank=3,MinLevel=24},	--Scintillanting Energy
				{Type=3,ID=8529,Icon=005102,BuffType=0,Rank=3,MinLevel=36},	--Conduit of Chaos
				{Type=3,ID=672,Icon=023171,BuffType=1,Rank=4,MinLevel=40}	--Unleash the Winds
				}
}


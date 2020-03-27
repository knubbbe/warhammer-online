
--==Chosen==--
Warbuilder.Career[13] = { CareerIcon=20185, ID=64, Line=13, Build=190813.1}
Warbuilder.Career[13].Path = {
{Core={ Icon=004579,				--Path of Dread
		{Path=1,Type=2,ID=8316,Icon=005167,BuffType=12,MinLevel=2},		--Dreadful Fear
		{Path=1,Type=2,ID=8317,Icon=005175,BuffType=2,MinLevel=6},		--Tooth of Tzeentch
		{Path=1,Type=2,ID=8319,Icon=005252,BuffType=2,MinLevel=8},		--Cleave
		{Path=1,Type=2,ID=8328,Icon=005255,BuffType=2,MinLevel=14},		--Withering Blow
		{Path=1,Type=2,ID=8334,Icon=005212,BuffType=12,MinLevel=25},	--Dreadful Agony
		{Path=1,Type=2,ID=8335,Icon=005183,BuffType=9,MinLevel=25}		--Suppression
		},
	{Path=1,Type=1,ID=8361,Icon=022708,BuffType=0,MinLevel=0},		--Feed on the Weary
	{Path=1,Type=2,ID=8342,Icon=005263,BuffType=12,MinLevel=0},		--Dreadful Terror
	{Path=1,Type=1,ID=8363,Icon=022701,BuffType=0,MinLevel=0},		--Oppressing Blows
	{Path=1,Type=2,ID=8343,Icon=005264,BuffType=2,MinLevel=0},		--Relentless
	{Path=1,Type=1,ID=2832,Icon=022696,BuffType=0,MinLevel=0},		--Deamonclaw
	{Path=1,Type=2,ID=8344,Icon=005186,BuffType=2,MinLevel=0},		--Rending Blade
	{Path=1,Type=3,ID=8377,Icon=005260,BuffType=0,Rank=4,MinLevel=0}		--Warping Embrace
	},	
{Core={ Icon=004515,				--Path of Corruption
		{Path=2,Type=2,ID=8315,Icon=005168,BuffType=2,MinLevel=1},		--Enraged Blow
		{Path=2,Type=2,ID=8318,Icon=005179,BuffType=12,MinLevel=4},		--Corrupting Wrath
		{Path=2,Type=2,ID=8324,Icon=005184,BuffType=6,MinLevel=9},		--Dizzying Blow
		{Path=2,Type=2,ID=8329,Icon=005256,BuffType=2,MinLevel=16},		--Repel
		{Path=2,Type=2,ID=8332,Icon=005178,BuffType=12,MinLevel=20},	--Corrupting Retribution
		{Path=2,Type=2,ID=8337,Icon=005174,BuffType=9,MinLevel=35}		--Bane Shield
		},
	{Path=2,Type=1,ID=8364,Icon=022694,BuffType=0,MinLevel=0},		--Dire Shielding
	{Path=2,Type=2,ID=8345,Icon=005265,BuffType=12,MinLevel=0},		--Corrupting Horror
	{Path=2,Type=1,ID=8365,Icon=022702,BuffType=0,MinLevel=0},		--Mixed Defenses
	{Path=2,Type=2,ID=8346,Icon=005177,BuffType=2,MinLevel=0},		--Downfall
	{Path=2,Type=1,ID=8357,Icon=022702,BuffType=0,MinLevel=0},		--Corruptive Power
	{Path=2,Type=2,ID=8347,Icon=005168,BuffType=9,MinLevel=0},		--Oppression
	{Path=2,Type=3,ID=8373,Icon=005211,BuffType=0,Rank=4,MinLevel=0}		--Sprout Carapace
	},
{Core={ Icon=004482,				--Path of Discord
		{Path=3,Type=2,ID=8320,Icon=005254,BuffType=6,MinLevel=3},		--Seeping Wound
		{Path=3,Type=2,ID=8323,Icon=005173,BuffType=2,MinLevel=5},		--Ravage
		{Path=3,Type=2,ID=8321,Icon=005253,BuffType=12,MinLevel=6},		--Discordant Instability
		{Path=3,Type=2,ID=8327,Icon=005152,BuffType=12,MinLevel=12},	--Discordant Fluctuation
		{Path=3,Type=2,ID=8331,Icon=005266,BuffType=6,MinLevel=18},		--Blast Wave
		{Path=3,Type=2,ID=8338,Icon=005217,BuffType=6,MinLevel=40}		--Touch of Palsy
		},
	{Path=3,Type=1,ID=8367,Icon=022706,BuffType=0,MinLevel=0},		--Siphoned Energy
	{Path=3,Type=2,ID=8348,Icon=005258,BuffType=12,MinLevel=0},		--Discordant Turbulence
	{Path=3,Type=1,ID=8368,Icon=022704,BuffType=0,MinLevel=0},		--Tainted Wound
	{Path=3,Type=2,ID=8349,Icon=005181,BuffType=2,MinLevel=0},		--Quake
	{Path=3,Type=1,ID=8369,Icon=022706,BuffType=0,MinLevel=0},		--Embrace the Winds
	{Path=3,Type=2,ID=8350,Icon=005269,BuffType=9,MinLevel=0},		--Tzeentch's Reflection
	{Path=3,Type=3,ID=8379,Icon=005262,BuffType=0,Rank=4,MinLevel=0}		--Shatter Faith
	}
}

Warbuilder.Career[13].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8314,Icon=005251,BuffType=2,MinLevel=1},		--Throwing Axe
				{Type=2,ID=8322,Icon=005169,BuffType=1,MinLevel=7},		--Taunt
				{Type=2,ID=8325,Icon=005172,BuffType=0,MinLevel=10},	--Guard
				{Type=2,ID=8326,Icon=005309,BuffType=0,MinLevel=10},	--Hold The Line!
--				{Type=2,ID=14418,Icon=023405,BuffType=0,MinLevel=10},	--Deflect Oil
				{Type=2,ID=8330,Icon=005176,BuffType=0,MinLevel=12},	--Juggernaut
				{Type=2,ID=8333,Icon=005257,BuffType=1,MinLevel=20},	--Challenge
				{Type=2,ID=8339,Icon=002497,BuffType=2,MinLevel=22},	--Server Blessing
				{Type=2,ID=8336,Icon=005182,BuffType=1,MinLevel=30}		--Petrify
--				{Type=2,ID=14419,Icon=023413,BuffType=0,MinLevel=30},	--Modify War Engine
--				{Type=2,ID=14420,Icon=023402,BuffType=3,MinLevel=40}	--Bulwark
				},
	Tactic = {
				{Type=1,ID=797,Icon=022714,BuffType=0,MinLevel=11},		--Warped Flesh
				{Type=1,ID=500,Icon=022701,BuffType=0,MinLevel=13},		--Focused Offense
				{Type=1,ID=8352,Icon=022708,BuffType=0,MinLevel=15},	--Chaotic Advantage
				{Type=1,ID=798,Icon=022714,BuffType=0,MinLevel=17},		--Tzeentch's Warding
				{Type=1,ID=503,Icon=022702,BuffType=0,MinLevel=19},		--Rugged
				{Type=1,ID=8353,Icon=022702,BuffType=0,MinLevel=21},	--Flawless Armor
				{Type=1,ID=800,Icon=022714,BuffType=0,MinLevel=23},		--Backlash
				{Type=1,ID=504,Icon=022709,BuffType=0,MinLevel=25},		--Menace
				{Type=1,ID=8354,Icon=022694,BuffType=0,MinLevel=27},	--Quickened Discord
				{Type=1,ID=505,Icon=022694,BuffType=0,MinLevel=29},		--Unstoppable Juggernaut
				{Type=1,ID=8355,Icon=022709,BuffType=0,MinLevel=31},	--Critical Suppression
				{Type=1,ID=8359,Icon=022702,BuffType=0,MinLevel=33},		--Destined For Victory				
				{Type=1,ID=8356,Icon=022708,BuffType=0,MinLevel=33},	--Piercing Repel
				{Type=1,ID=8366,Icon=022709,BuffType=0,MinLevel=35},	--Hastened Dismissal
				{Type=1,ID=8358,Icon=022704,BuffType=0,MinLevel=37}	--Power from the Gods				
				},
	Morale = {
				{Type=3,ID=606,Icon=023172,BuffType=0,Rank=1,MinLevel=8},	--Demolishing Strike
				{Type=3,ID=608,Icon=023174,BuffType=0,Rank=1,MinLevel=16},	--Champion's Challenge
				{Type=3,ID=8371,Icon=005210,BuffType=0,Rank=1,MinLevel=28},	--Inevitable Changing
				{Type=3,ID=611,Icon=023177,BuffType=0,Rank=2,MinLevel=12},	--Shield Wall
				{Type=3,ID=607,Icon=023176,BuffType=0,Rank=2,MinLevel=20},	--Raze
				{Type=3,ID=8372,Icon=005213,BuffType=0,Rank=2,MinLevel=32},	--Tzeentch's Amplification
				{Type=3,ID=610,Icon=023173,BuffType=0,Rank=3,MinLevel=24},	--Distracting Bellow
				{Type=3,ID=8378,Icon=005261,BuffType=0,Rank=3,MinLevel=36},	--Impenetrable Armor
				{Type=3,ID=613,Icon=023175,BuffType=0,Rank=4,MinLevel=40}	--Immaculate Defence				
				}
}


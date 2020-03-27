

--==BlackGuard==--
Warbuilder.Career[21] = { CareerIcon=20181, ID=104, Line=21,  Build=190813.1}
Warbuilder.Career[21].Path = {
{Core={ Icon=004579,				--Path of Malice
		{Path=1,Type=2,ID=9335,Icon=011028,BuffType=5,MinLevel=2},		--Pitiless Strike
		{Path=1,Type=2,ID=9318,Icon=011011,BuffType=5,MinLevel=4},		--Crippling Anger
		{Path=1,Type=2,ID=9320,Icon=011013,BuffType=2,MinLevel=8},		--Murderous Wrath
		{Path=1,Type=2,ID=9329,Icon=011022,BuffType=5,MinLevel=12},		--Horrific Wound
		{Path=1,Type=2,ID=9323,Icon=011016,BuffType=2,MinLevel=14}		--Monstrous Rending
		},
	{Path=1,Type=1,ID=9365,Icon=022694,BuffType=4,MinLevel=0},		--Monstrous Ruin
	{Path=1,Type=2,ID=9343,Icon=011032,BuffType=2,MinLevel=0},		--Enraged Beating
	{Path=1,Type=1,ID=9366,Icon=022702,BuffType=4,MinLevel=0},		--Filled With Fury
	{Path=1,Type=2,ID=2888,Icon=010964,BuffType=5,MinLevel=0},		--Malignant Strike!
	{Path=1,Type=1,ID=9367,Icon=022702,BuffType=4,MinLevel=0},		--Hastened Doom
	{Path=1,Type=2,ID=9344,Icon=011033,BuffType=2,MinLevel=0},		--Crimson Death
	{Path=1,Type=3,ID=9387,Icon=011044,BuffType=2,Rank=4,MinLevel=0}	--Blast of Hatred	
	},	
{Core={ Icon=004515,				--Path of Loathing
		{Path=2,Type=2,ID=9315,Icon=011008,BuffType=0,MinLevel=1},		--Hateful Strike
		{Path=2,Type=2,ID=9316,Icon=011009,BuffType=0,MinLevel=5},		--Feeding On Weakness
		{Path=2,Type=2,ID=9321,Icon=011014,BuffType=1,MinLevel=16},		--Spiteful Slam
		{Path=2,Type=2,ID=9328,Icon=011021,BuffType=2,MinLevel=25},		--Exile
		{Path=2,Type=2,ID=9333,Icon=011026,BuffType=5,MinLevel=35}		--Crush The Weak
		},
	{Path=2,Type=1,ID=9354,Icon=022694,BuffType=4,MinLevel=0},		--Terrifying Foe
	{Path=2,Type=2,ID=9345,Icon=011034,BuffType=0,MinLevel=0},		--None Shall Pass
	{Path=2,Type=1,ID=9369,Icon=022704,BuffType=4,MinLevel=0},		--Anger Drives Me
	{Path=2,Type=2,ID=9348,Icon=011029,BuffType=5,MinLevel=0},		--Wave of Scorn			
	{Path=2,Type=1,ID=2745,Icon=022704,BuffType=4,MinLevel=0},		--Shielded by Hate
	{Path=2,Type=2,ID=9346,Icon=011035,BuffType=9,MinLevel=0},		--Force of Fury
	{Path=2,Type=3,ID=9386,Icon=011043,BuffType=0,Rank=4,MinLevel=0}	--Khaine's Warding
	},

{Core={ Icon=004482,				--Path of Anguish
		{Path=3,Type=2,ID=9317,Icon=011010,BuffType=5,MinLevel=3},		--Brutal Smash
		{Path=3,Type=2,ID=9336,Icon=011037,BuffType=8,MinLevel=6},		--Crushing Anger
		{Path=3,Type=2,ID=9324,Icon=011017,BuffType=2,MinLevel=9},		--Furious Howl
		{Path=3,Type=2,ID=9327,Icon=011020,BuffType=2,MinLevel=18},		--Mind Killer
		{Path=3,Type=2,ID=9331,Icon=011024,BuffType=5,MinLevel=40}		--Shield of Rage
	},
	{Path=3,Type=1,ID=9371,Icon=022704,BuffType=4,MinLevel=0},		--Unstoppable Fury
	{Path=3,Type=2,ID=9349,Icon=011038,BuffType=5,MinLevel=0},		--Choking Fury
	{Path=3,Type=1,ID=9373,Icon=022701,BuffType=4,MinLevel=0},		--Soul Killer
	{Path=3,Type=2,ID=9347,Icon=011036,BuffType=8,MinLevel=0},		--Elite Training
	{Path=3,Type=1,ID=9372,Icon=022694,BuffType=4,MinLevel=0},		--Shielding Anger
	{Path=3,Type=2,ID=9350,Icon=011039,BuffType=3,MinLevel=0},		--Bolstering Anger
	{Path=3,Type=3,ID=9388,Icon=011045,BuffType=2,Rank=4,MinLevel=0}		--In Malekith's Name!
	}
}

Warbuilder.Career[21].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=9314,Icon=011007,BuffType=2,MinLevel=1},		--Throw Dagger
				{Type=2,ID=9338,Icon=011501,BuffType=0,MinLevel=1},		--Dark Protector
				{Type=2,ID=9319,Icon=011012,BuffType=0,MinLevel=5},		--Driven By Hate
				{Type=2,ID=9322,Icon=011015,BuffType=1,MinLevel=7},		--Taunt
				{Type=2,ID=9325,Icon=011018,BuffType=0,MinLevel=10},	--Guard
				{Type=2,ID=9326,Icon=011019,BuffType=0,MinLevel=10},	--Hold The Line!
--				{Type=2,ID=14418,Icon=023405,BuffType=0,MinLevel=10},	--Deflect Oil
				{Type=2,ID=9330,Icon=011023,BuffType=0,MinLevel=12},	--Juggernaut
				{Type=2,ID=9332,Icon=011025,BuffType=1,MinLevel=20},	--Challenge
				{Type=2,ID=9337,Icon=011030,BuffType=2,MinLevel=22},	--Shatter Enchantment
				{Type=2,ID=9334,Icon=011027,BuffType=1,MinLevel=30}		--Chains of Hatred
--				{Type=2,ID=14419,Icon=023413,BuffType=0,MinLevel=30},	--Modify War Engine
--				{Type=2,ID=14420,Icon=023402,BuffType=3,MinLevel=40}	--Bulwark
				},
	Tactic = {
				{Type=1,ID=841,Icon=022712,BuffType=0,MinLevel=11},		--Dark Blessings
				{Type=1,ID=500,Icon=022701,BuffType=0,MinLevel=13},		--Focus Offense
				{Type=1,ID=9355,Icon=022709,BuffType=4,MinLevel=15},	--Thirst For Death
				{Type=1,ID=839,Icon=022712,BuffType=0,MinLevel=17},		--Alignment of Naggaroth
				{Type=1,ID=503,Icon=022702,BuffType=0,MinLevel=19},		--Rugged
				{Type=1,ID=9370,Icon=022702,BuffType=4,MinLevel=21},	--Crush Vitality
				{Type=1,ID=840,Icon=022712,BuffType=9,MinLevel=23},		--Bathing In Blood
				{Type=1,ID=504,Icon=022709,BuffType=0,MinLevel=25},		--Menace
				{Type=1,ID=9356,Icon=022701,BuffType=4,MinLevel=27},	--Pitiless Feeding
				{Type=1,ID=505,Icon=022694,BuffType=0,MinLevel=29},		--Unstoppable Juggernaut
				{Type=1,ID=9357,Icon=022702,BuffType=4,MinLevel=31},	--Efficient Slaughter
				{Type=1,ID=9358,Icon=022702,BuffType=4,MinLevel=33},	--Malekith's Bulwark
				{Type=1,ID=9359,Icon=022702,BuffType=4,MinLevel=35},	--Endless Pursuit
				{Type=1,ID=9360,Icon=022694,BuffType=4,MinLevel=37},	--Swift Fury
				{Type=1,ID=9361,Icon=022704,BuffType=4,MinLevel=39}		--Simmering Anger
				},
	Morale = {
				{Type=3,ID=606,Icon=023172,BuffType=0,Rank=1,MinLevel=8},	--Demolishing Strike
				{Type=3,ID=608,Icon=023174,BuffType=0,Rank=1,MinLevel=16},	--Champion's Challenge
				{Type=3,ID=9380,Icon=011040,BuffType=0,Rank=1,MinLevel=28},	--Banish Weakness
				{Type=3,ID=611,Icon=023177,BuffType=0,Rank=2,MinLevel=12},	--Shield Wall
				{Type=3,ID=607,Icon=023176,BuffType=0,Rank=2,MinLevel=20},	--Raze
				{Type=3,ID=9381,Icon=011041,BuffType=2,Rank=2,MinLevel=32},	--Away, Cretins!
				{Type=3,ID=610,Icon=023173,BuffType=0,Rank=3,MinLevel=24},	--Distracting Bellow
				{Type=3,ID=9382,Icon=011042,BuffType=0,Rank=3,MinLevel=36},	--Armor of Eternal Servitude
				{Type=3,ID=613,Icon=023175,BuffType=0,Rank=4,MinLevel=40}	--Immaculate Defence			
				}
}


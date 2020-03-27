
--==Marauder==--
Warbuilder.Career[14] = { CareerIcon=20192, ID=65, Line=14, Build=190813.1}
Warbuilder.Career[14].Path = {
{Core={ Icon=004691,				--Path of Savagery
			{Path=1,Type=2,ID=8395,Icon=005190,BuffType=7,MinLevel=2},		--Rend
			{Path=1,Type=2,ID=8400,Icon=005209,BuffType=7,MinLevel=4},		--Corruption
			{Path=1,Type=2,ID=8404,Icon=005195,BuffType=7,MinLevel=9},		--Touch of Rot
			{Path=1,Type=2,ID=8401,Icon=005216,BuffType=7,MinLevel=12},		--Tainted Claw
			{Path=1,Type=2,ID=8414,Icon=005219,BuffType=2,MinLevel=30}		--Gut Ripper
			},
	{Path=1,Type=1,ID=8438,Icon=022701,BuffType=0,MinLevel=0},		--Scything Talons
	{Path=1,Type=2,ID=8419,Icon=005222,BuffType=7,MinLevel=0},		--Draining Swipe
	{Path=1,Type=1,ID=8439,Icon=022708,BuffType=0,MinLevel=0},		--Exhaustive Strikes
	{Path=1,Type=2,ID=8418,Icon=005196,BuffType=7,MinLevel=0},		--Cutting Claw
	{Path=1,Type=1,ID=8440,Icon=022706,BuffType=0,MinLevel=0},		--Deadly Clutch
	{Path=1,Type=2,ID=8424,Icon=005226,BuffType=7,MinLevel=0},		--Thunderous Blow	
	{Path=1,Type=3,ID=8454,Icon=005229,BuffType=0,Rank=4,MinLevel=0}		--Lashing Power
	},	
{Core={ Icon=004693,				--Path of Brutality
			{Path=2,Type=2,ID=8396,Icon=005191,BuffType=2,MinLevel=3},		--Debilitate
			{Path=2,Type=2,ID=8399,Icon=005194,BuffType=2,MinLevel=5},		--Impale
			{Path=2,Type=2,ID=8406,Icon=005201,BuffType=2,MinLevel=6},		--Convulsive Slashing
			{Path=2,Type=2,ID=8407,Icon=005202,BuffType=7,MinLevel=14},		--Touch of Instability
			{Path=2,Type=2,ID=8413,Icon=005218,BuffType=7,MinLevel=25}		--Pulverize
			},
	{Path=2,Type=1,ID=8441,Icon=022701,BuffType=0,MinLevel=0},		--Corrupted Edge
	{Path=2,Type=2,ID=8420,Icon=005223,BuffType=2,MinLevel=0},		--Guillotine
	{Path=2,Type=1,ID=8442,Icon=022709,BuffType=0,MinLevel=0},		--Growing Instability
	{Path=2,Type=2,ID=8421,Icon=005224,BuffType=8,MinLevel=0},		--Mutated Aggressor
	{Path=2,Type=1,ID=8443,Icon=022704,BuffType=0,MinLevel=0},		--Unstable Convulsions
	{Path=2,Type=2,ID=8422,Icon=005225,BuffType=2,MinLevel=0},		--Wave of Terror
	{Path=2,Type=3,ID=8455,Icon=005230,BuffType=0,Rank=4,MinLevel=0}		--Forked Aggression
	},
{Core={ Icon=004689,				--Path of Monstrosity
			{Path=3,Type=2,ID=8392,Icon=005187,BuffType=2,MinLevel=1},		--Flail
			{Path=3,Type=2,ID=8409,Icon=005199,BuffType=2,MinLevel=7},		--Demolition
			{Path=3,Type=2,ID=8397,Icon=005192,BuffType=2,MinLevel=8},		--Mouth of Tzeentch
			{Path=3,Type=2,ID=8411,Icon=005171,BuffType=8,MinLevel=20},		--Ferocious Assault
			{Path=3,Type=2,ID=8412,Icon=005220,BuffType=2,MinLevel=35}		--Mutated Energy
		},
	{Path=3,Type=1,ID=8444,Icon=022702,BuffType=0,MinLevel=0},		--Hulking Brute
	{Path=3,Type=2,ID=8417,Icon=005221,BuffType=7,MinLevel=0},		--Wave of Mutilation
	{Path=3,Type=1,ID=8445,Icon=022704,BuffType=0,MinLevel=0},		--Insane Whispers
	{Path=3,Type=2,ID=8423,Icon=005204,BuffType=2,MinLevel=0},		--Concussive Jolt
	{Path=3,Type=1,ID=8446,Icon=022696,BuffType=0,MinLevel=0},		--Crushing Blows
	{Path=3,Type=2,ID=8425,Icon=005227,BuffType=2,MinLevel=0},		--Wrecking Ball
	{Path=3,Type=3,ID=8456,Icon=005208,BuffType=2,Rank=4,MinLevel=0}		--Energy Ripple
	}
}

Warbuilder.Career[14].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8415,Icon=005215,BuffType=1,MinLevel=1},		--Gift of Release
				{Type=2,ID=8394,Icon=005189,BuffType=0,MinLevel=1},		--Gift of Savagery
				{Type=2,ID=8393,Icon=005214,BuffType=2,MinLevel=1},		--Throw Axe	
				{Type=2,ID=8398,Icon=005193,BuffType=0,MinLevel=3},		--Gift of Brutality
				{Type=2,ID=8403,Icon=005198,BuffType=0,MinLevel=7},		--Gift of Monstrosity
				{Type=2,ID=240,Icon=005313,BuffType=0,MinLevel=10},		--Charge!
				{Type=2,ID=8402,Icon=005197,BuffType=1,MinLevel=10},	--Wave of Horror
				{Type=2,ID=14423,Icon=023403,BuffType=0,MinLevel=10},	--Bypass Defenses
				{Type=2,ID=8405,Icon=005200,BuffType=7,MinLevel=16},	--Death Grip
				{Type=2,ID=8408,Icon=005267,BuffType=3,MinLevel=18},	--Mutating Release
--				{Type=2,ID=14422,Icon=023416,BuffType=1,MinLevel=30},	--Siege Wrecker
				{Type=2,ID=8410,Icon=005205,BuffType=4,MinLevel=40}	--Terrible Embrace
--				{Type=2,ID=14424,Icon=023408,BuffType=0,MinLevel=40}	--Faultfinder
				},
	Tactic = {
				{Type=1,ID=797,Icon=022714,BuffType=0,MinLevel=11},		--Warped Flesh
				{Type=1,ID=526,Icon=022694,BuffType=0,MinLevel=13},		--Jagged Edge
				{Type=1,ID=8428,Icon=022708,BuffType=0,MinLevel=15},	--Subvert Strength
				{Type=1,ID=798,Icon=022714,BuffType=0,MinLevel=17},		--Tzeentch's Warding
				{Type=1,ID=521,Icon=022701,BuffType=0,MinLevel=19},		--Brute Force
				{Type=1,ID=8429,Icon=022702,BuffType=0,MinLevel=21},	--Brush Off
				{Type=1,ID=800,Icon=022714,BuffType=0,MinLevel=23},		--Backlash
				{Type=1,ID=523,Icon=022704,BuffType=0,MinLevel=25},		--Flanking
				{Type=1,ID=8430,Icon=022694,BuffType=0,MinLevel=27},	--Rend Asunder
				{Type=1,ID=528,Icon=022702,BuffType=0,MinLevel=29},	--Riposte
				{Type=1,ID=8431,Icon=022701,BuffType=0,MinLevel=31},	--Deeply Impaled
				{Type=1,ID=522,Icon=022707,BuffType=10,MinLevel=32},	--Close Combat					
				{Type=1,ID=8432,Icon=022696,BuffType=0,MinLevel=33},	--Feeding On Fear
				{Type=1,ID=8433,Icon=022694,BuffType=0,MinLevel=35},	--Unending Horror
				{Type=1,ID=8434,Icon=022704,BuffType=0,MinLevel=37},	--Widespread Demolition
				{Type=1,ID=8435,Icon=022698,BuffType=0,MinLevel=39}	--Piercing Bite
				},
	Morale = { 
				{Type=3,ID=627,Icon=023161,BuffType=2,Rank=1,MinLevel=8},	--Severe Nerve
				{Type=3,ID=631,Icon=023157,BuffType=0,Rank=1,MinLevel=16},	--Confusing Movements		
				{Type=3,ID=8449,Icon=005206,BuffType=2,Rank=1,MinLevel=28},	--Flames of Fate
				{Type=3,ID=628,Icon=023158,BuffType=0,Rank=2,MinLevel=12},	--Force of Will
				{Type=3,ID=633,Icon=023160,BuffType=0,Rank=2,MinLevel=20},	--Relentless Assault
				{Type=3,ID=8450,Icon=005207,BuffType=2,Rank=2,MinLevel=32},	--Great Fang
				{Type=3,ID=629,Icon=023156,BuffType=0,Rank=3,MinLevel=24},	--Broad Swings
				{Type=3,ID=8451,Icon=005228,BuffType=2,Rank=3,MinLevel=36},	--Tzeentch's Reversal
				{Type=3,ID=630,Icon=023159,BuffType=0,Rank=4,MinLevel=40}	--Frenzied Slaughter							
			}
}

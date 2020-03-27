
--==WhiteLion==--
Warbuilder.Career[19] = { CareerIcon=20200, ID=94, Line=19, Build=190813.1}
Warbuilder.Career[19].Path = {
{Core={ Icon=004691,				--Path of The Hunter
			{Path=1,Type=2,ID=9160,Icon=013419,BuffType=2,MinLevel=1},		--Hacked
			{Path=1,Type=2,ID=9163,Icon=013422,BuffType=2,MinLevel=4},		--Coordinated Strike
			{Path=1,Type=2,ID=9167,Icon=013426,BuffType=2,MinLevel=8},		--Lion's Fury
			{Path=1,Type=2,ID=9172,Icon=013432,BuffType=0,MinLevel=16},		--Trained To Hunt
			{Path=1,Type=4,ID=428,Icon=013450,BuffType=16,MinLevel=16},		--Terrifying Roar
			{Path=1,Type=4,ID=427,Icon=013449,BuffType=14,MinLevel=16},		--Claw Sweep
			{Path=1,Type=4,ID=426,Icon=013448,BuffType=14,MinLevel=16},		--Bite
			{Path=1,Type=2,ID=9176,Icon=013436,BuffType=2,MinLevel=30}		--Slashing Blade
			},
	{Path=1,Type=1,ID=9209,Icon=022694,BuffType=0,MinLevel=0},		--Lionheart
	{Path=1,Type=2,ID=9186,Icon=013439,BuffType=2,MinLevel=0},		--Pounce
	{Path=1,Type=1,ID=9210,Icon=022701,BuffType=0,MinLevel=0},		--Pack Hunting
	{Path=1,Type=2,ID=9192,Icon=013445,BuffType=6,MinLevel=0},		--Force Opportunity
	{Path=1,Type=1,ID=9211,Icon=022708,BuffType=0,MinLevel=0},		--Hack And Slash
	{Path=1,Type=2,ID=9188,Icon=013441,BuffType=2,MinLevel=0},		--Whirling Axe
	{Path=1,Type=3,ID=9230,Icon=013460,BuffType=2,Rank=4,MinLevel=0}		--Blade And Claw
	},	
{Core={ Icon=004693,				--Path of The Axeman
			{Path=2,Type=2,ID=9161,Icon=013420,BuffType=6,MinLevel=2},		--Blindside
			{Path=2,Type=2,ID=9168,Icon=013427,BuffType=0,MinLevel=3},		--Trained To Threaten
			{Path=2,Type=4,ID=430,Icon=013452,BuffType=16,MinLevel=3},		--Shred
			{Path=2,Type=4,ID=431,Icon=013453,BuffType=16,MinLevel=3},		--Leg Tear
			{Path=2,Type=4,ID=429,Icon=013451,BuffType=16,MinLevel=3},		--Lion's Roar
			{Path=2,Type=2,ID=9165,Icon=013424,BuffType=2,MinLevel=6},		--Sundering Chop
			{Path=2,Type=2,ID=9171,Icon=013431,BuffType=6,MinLevel=14},		--Shattering Blow
			{Path=2,Type=2,ID=9175,Icon=013435,BuffType=2,MinLevel=25}		--Fey Illusion
			},
	{Path=2,Type=1,ID=9212,Icon=022703,BuffType=0,MinLevel=0},		--Blindsided!
	{Path=2,Type=2,ID=9189,Icon=013442,BuffType=8,MinLevel=0},		--Primal Fury
	{Path=2,Type=1,ID=9213,Icon=022709,BuffType=0,MinLevel=0},		--Threatening Distraction
	{Path=2,Type=2,ID=9190,Icon=013443,BuffType=2,MinLevel=0},		--Cull The Weak
	{Path=2,Type=1,ID=9214,Icon=022702,BuffType=0,MinLevel=0},		--Full-Grown
	{Path=2,Type=2,ID=9191,Icon=013444,BuffType=6,MinLevel=0},		--Thin The Herd
	{Path=2,Type=3,ID=9231,Icon=013461,BuffType=3,Rank=4,MinLevel=0}		--Joy of the Hunt
	},
{Core={ Icon=004689,				--Path of The Guardian
			{Path=3,Type=2,ID=9166,Icon=013425,BuffType=8,MinLevel=7},		--Baiting Strike
			{Path=3,Type=2,ID=9162,Icon=013421,BuffType=0,MinLevel=9},		--Trained To kill
			{Path=3,Type=4,ID=434,Icon=013456,BuffType=16,MinLevel=9},		--Gut Ripper
			{Path=3,Type=4,ID=433,Icon=013455,BuffType=14,MinLevel=9},		--Maul
			{Path=3,Type=4,ID=432,Icon=013454,BuffType=14,MinLevel=9},		--Fang And Claw
			{Path=3,Type=2,ID=9170,Icon=013430,BuffType=6,MinLevel=12},		--Cleave Limb
			{Path=3,Type=2,ID=9174,Icon=013434,BuffType=8,MinLevel=20},		--Pack Assault
			{Path=3,Type=2,ID=9177,Icon=013437,BuffType=2,MinLevel=35}		--Throat Bite
		},
	{Path=3,Type=1,ID=9215,Icon=022709,BuffType=0,MinLevel=0},		--Stalker
	{Path=3,Type=2,ID=9187,Icon=013440,BuffType=6,MinLevel=0},		--Echoing Roar
	{Path=3,Type=1,ID=9216,Icon=022706,BuffType=3,MinLevel=0},		--Furious Mending
	{Path=3,Type=2,ID=9193,Icon=013446,BuffType=2,MinLevel=0},		--Brutal Pounce
	{Path=3,Type=1,ID=9217,Icon=022694,BuffType=0,MinLevel=0},		--Baited Trap
	{Path=3,Type=2,ID=9194,Icon=013447,BuffType=8,MinLevel=0},		--Leonine Frenzy
	{Path=3,Type=3,ID=9232,Icon=013462,BuffType=0,Rank=4,MinLevel=0}		--Rampage
	}
}

Warbuilder.Career[19].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=9158,Icon=013417,BuffType=2,MinLevel=1},		--Axe Toss
				{Type=2,ID=9159,Icon=013418,BuffType=0,MinLevel=1},		--Call War Lion
				{Type=2,ID=9164,Icon=013423,BuffType=8,MinLevel=5},		--Natures Bond
				{Type=2,ID=9169,Icon=013428,BuffType=6,MinLevel=10},	--Submission
				{Type=2,ID=9184,Icon=013429,BuffType=0,MinLevel=10},	--Charge!
				{Type=2,ID=14423,Icon=023403,BuffType=0,MinLevel=10},	--Bypass Defenses
				{Type=2,ID=9173,Icon=013433,BuffType=0,MinLevel=18},	--Feline Grace
--				{Type=2,ID=14422,Icon=023416,BuffType=1,MinLevel=30},	--Siege Wrecker
				{Type=2,ID=9178,Icon=013438,BuffType=1,MinLevel=40}		--Fetch!
--				{Type=2,ID=14424,Icon=023408,BuffType=0,MinLevel=40}	--Faultfinder
				},
	Tactic = {
				{Type=1,ID=818,Icon=022705,BuffType=0,MinLevel=11},		--Centuries of Training
				{Type=1,ID=526,Icon=022694,BuffType=0,MinLevel=13},		--Jagged Edge
				{Type=1,ID=9198,Icon=022701,BuffType=0,MinLevel=15},	--Pack Synergy
				{Type=1,ID=819,Icon=022705,BuffType=0,MinLevel=17},		--Bend the Winds
				{Type=1,ID=521,Icon=022701,BuffType=0,MinLevel=19},		--Brute Force
				{Type=1,ID=9199,Icon=022703,BuffType=0,MinLevel=21},	--Speed Training
				{Type=1,ID=823,Icon=022705,BuffType=0,MinLevel=23},		--Discerning Offense
				{Type=1,ID=523,Icon=022704,BuffType=0,MinLevel=25},		--Flanking
				{Type=1,ID=9200,Icon=022702,BuffType=0,MinLevel=27},	--Flashing Claws
				{Type=1,ID=528,Icon=022702,BuffType=0,MinLevel=29},		--Riposte
				{Type=1,ID=9201,Icon=022696,BuffType=0,MinLevel=31},	--Revenge!
				{Type=1,ID=522,Icon=022707,BuffType=10,MinLevel=32},	--Close Combat					
				{Type=1,ID=9202,Icon=022709,BuffType=0,MinLevel=33},	--Loner
				{Type=1,ID=9204,Icon=022701,BuffType=2,MinLevel=37},	--Tearing Blade
				{Type=1,ID=9205,Icon=022705,BuffType=0,MinLevel=39}		--Close Bond
				},
	Morale = { 
				{Type=3,ID=627,Icon=023161,BuffType=2,Rank=1,MinLevel=8},	--Severe Nerve
				{Type=3,ID=631,Icon=023157,BuffType=0,Rank=1,MinLevel=16},	--Confusing Movements		
				{Type=3,ID=9224,Icon=013457,BuffType=2,Rank=1,MinLevel=28},	--Ensnare
				{Type=3,ID=628,Icon=023158,BuffType=0,Rank=2,MinLevel=12},	--Force of Will
				{Type=3,ID=633,Icon=023160,BuffType=0,Rank=2,MinLevel=20},	--Relentless Assault
				{Type=3,ID=9225,Icon=013458,BuffType=2,Rank=2,MinLevel=32},	--Flying Axe
				{Type=3,ID=629,Icon=023156,BuffType=0,Rank=3,MinLevel=24},	--Broad Swings
				{Type=3,ID=9226,Icon=013459,BuffType=0,Rank=3,MinLevel=36},	--Dominance
				{Type=3,ID=630,Icon=023159,BuffType=0,Rank=4,MinLevel=40}	--Frenzied Slaughter							
			}
}

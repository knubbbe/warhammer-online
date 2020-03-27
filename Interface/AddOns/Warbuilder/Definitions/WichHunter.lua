
--==WichHunter==--
Warbuilder.Career[9] = { CareerIcon=20202, ID=60, Line=9, Build=190813.1}
Warbuilder.Career[9].Path = {
{Core={ Icon=004691,				--Path of Confession
			{Path=1,Type=2,ID=8081,Icon=007965,BuffType=2,MinLevel=1},		--Razor Strike
			{Path=1,Type=2,ID=8084,Icon=008045,BuffType=0,MinLevel=4},		--Blessed Bullets of Purity
			{Path=1,Type=2,ID=8091,Icon=007971,BuffType=7,MinLevel=10},		--Burn Armor
			{Path=1,Type=2,ID=8087,Icon=007967,BuffType=2,MinLevel=12},		--Trial By Pain
			{Path=1,Type=2,ID=8097,Icon=008053,BuffType=7,MinLevel=25}		--Seeker's Blade
			},
	{Path=1,Type=1,ID=8131,Icon=022701,BuffType=0,MinLevel=0},		--Seeker's Triumph
	{Path=1,Type=2,ID=8108,Icon=007973,BuffType=0,MinLevel=0},		--Shroud of Magus
	{Path=1,Type=1,ID=8132,Icon=022706,BuffType=0,MinLevel=0},		--Sanctified Bullets
	{Path=1,Type=2,ID=8109,Icon=008050,BuffType=8,MinLevel=0},		--Repel Blasphemy
	{Path=1,Type=1,ID=2993,Icon=022708,BuffType=0,MinLevel=0},		--Blessed Blade
	{Path=1,Type=2,ID=8110,Icon=008047,BuffType=2,MinLevel=0},		--Dragon Gun
	{Path=1,Type=3,ID=8152,Icon=007980,BuffType=2,Rank=4,MinLevel=0}		--Divine Blast
	},	
{Core={ Icon=004693,				--Path of Inquisition
			{Path=2,Type=2,ID=8083,Icon=008052,BuffType=7,MinLevel=3},		--Ferver
			{Path=2,Type=2,ID=8093,Icon=008046,BuffType=7,MinLevel=6},		--Burn, Heretic!
			{Path=2,Type=2,ID=8099,Icon=007970,BuffType=0,MinLevel=9},		--Blessed Bullets of Confession
			{Path=2,Type=2,ID=8086,Icon=007976,BuffType=7,MinLevel=14},		--Confess!
			{Path=2,Type=2,ID=8096,Icon=007969,BuffType=7,MinLevel=20}		--Sudden Accusation
			},
	{Path=2,Type=1,ID=8134,Icon=022701,BuffType=0,MinLevel=0},		--Full Confession
	{Path=2,Type=2,ID=8111,Icon=008056,BuffType=0,MinLevel=0},		--Seal of Destruction
	{Path=2,Type=1,ID=8135,Icon=022694,BuffType=0,MinLevel=0},		--Prolonged Confession
	{Path=2,Type=2,ID=8112,Icon=007977,BuffType=7,MinLevel=0},		--Punish The False
	{Path=2,Type=1,ID=8127,Icon=022709,BuffType=0,MinLevel=0},		--Protection from Heresy
	{Path=2,Type=2,ID=8113,Icon=007982,BuffType=4,MinLevel=0},		--Exit Wound
	{Path=2,Type=3,ID=8153,Icon=007978,BuffType=2,Rank=4,MinLevel=0}		--Excommunicate
	},
{Core={ Icon=004689,				--Path of Judgement
			{Path=3,Type=2,ID=8082,Icon=008051,BuffType=2,MinLevel=2},		--Absolution
			{Path=3,Type=2,ID=8085,Icon=007975,BuffType=2,MinLevel=5},		--Torment
			{Path=3,Type=2,ID=8100,Icon=007979,BuffType=7,MinLevel=16},		--Silence The Heretic
			{Path=3,Type=2,ID=8098,Icon=007983,BuffType=7,MinLevel=30},		--Fanatic Zeal
			{Path=3,Type=2,ID=8089,Icon=007974,BuffType=0,MinLevel=35}		--Blessed Bullets of Cleansing
			},
	{Path=3,Type=1,ID=8138,Icon=022708,BuffType=0,MinLevel=0},		--Atonement
	{Path=3,Type=2,ID=2997,Icon=007935,BuffType=0,MinLevel=0},		--Sanctified Oil
	{Path=3,Type=1,ID=8137,Icon=022709,BuffType=0,MinLevel=0},		--Fanatic Cleansing
	{Path=3,Type=2,ID=8115,Icon=007984,BuffType=7,MinLevel=0},		--Pistol Whip
	{Path=3,Type=1,ID=8139,Icon=022704,BuffType=0,MinLevel=0},		--Vitriolic Judgement
	{Path=3,Type=2,ID=8116,Icon=008049,BuffType=7,MinLevel=0},		--Burn Away Lies
	{Path=3,Type=3,ID=8154,Icon=007989,BuffType=2,Rank=4,MinLevel=0}		--Expurgation
	}
}

Warbuilder.Career[9].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8080,Icon=007966,BuffType=7,MinLevel=1},		--Snap SHot
				{Type=2,ID=8092,Icon=007972,BuffType=0,MinLevel=7},		--Feinted Positioning	
				{Type=2,ID=8088,Icon=007968,BuffType=1,MinLevel=8},		--Get Thee Behind Me!
				{Type=2,ID=8090,Icon=007985,BuffType=0,MinLevel=10},	--Incognito					
				{Type=2,ID=14427,Icon=023412,BuffType=0,MinLevel=10},	--Pick Lock
				{Type=2,ID=8095,Icon=008011,BuffType=0,MinLevel=18},	--Sigil of Sigmar
				{Type=2,ID=8101,Icon=002497,BuffType=2,MinLevel=22},	--Sever Blessing		
--				{Type=2,ID=14426,Icon=023401,BuffType=1,MinLevel=30},	--Boobly Trap
				{Type=2,ID=8102,Icon=008025,BuffType=0,MinLevel=40},	--Hastened Expurgation	
				{Type=2,ID=8094,Icon=007981,BuffType=1,MinLevel=40}		--Declare Anathema				
--				{Type=2,ID=14424,Icon=023408,BuffType=0,MinLevel=40}	--Faultfinder							
				},
	Tactic = {
				{Type=1,ID=779,Icon=022710,BuffType=0,MinLevel=11},		--Emperor's Ward
				{Type=1,ID=526,Icon=022694,BuffType=0,MinLevel=13},		--Jagged Edge
				{Type=1,ID=8120,Icon=022708,BuffType=0,MinLevel=15},	--Inquisitor's Fury
				{Type=1,ID=777,Icon=022710,BuffType=0,MinLevel=17},		--Unwavering Faith
				{Type=1,ID=8133,Icon=022694,BuffType=0,MinLevel=17},	--Sweeping Razor
				{Type=1,ID=521,Icon=022701,BuffType=0,MinLevel=19},		--Brute Force
				{Type=1,ID=8121,Icon=022710,BuffType=0,MinLevel=21},	--Flowing Accusations
				{Type=1,ID=776,Icon=022710,BuffType=0,MinLevel=23},		--Sigmar's Favor
				{Type=1,ID=523,Icon=022704,BuffType=0,MinLevel=25},		--Flanking
				{Type=1,ID=8122,Icon=022702,BuffType=0,MinLevel=27},	--Righteous Steel
				{Type=1,ID=528,Icon=022702,BuffType=0,MinLevel=29},		--Riposte
				{Type=1,ID=8123,Icon=022694,BuffType=0,MinLevel=31},	--Penetrating Barbs
				{Type=1,ID=522,Icon=022707,BuffType=0,MinLevel=32},		--Close Combat					
				{Type=1,ID=8124,Icon=022706,BuffType=0,MinLevel=33},	--Last Rites
				{Type=1,ID=8125,Icon=022703,BuffType=0,MinLevel=35},	--Vindication
				{Type=1,ID=8136,Icon=022704,BuffType=0,MinLevel=37},	--Encourage Confession				
				{Type=1,ID=8126,Icon=022696,BuffType=0,MinLevel=39}		--Blood, Faith, And Fire
				},
	Morale = { 
				{Type=3,ID=627,Icon=023161,BuffType=2,Rank=1,MinLevel=8},	--Severe Nerve
				{Type=3,ID=631,Icon=023157,BuffType=0,Rank=1,MinLevel=16},	--Confusing Movements		
				{Type=3,ID=8146,Icon=007988,BuffType=3,Rank=1,MinLevel=28},	--Exoneration
				{Type=3,ID=628,Icon=023158,BuffType=0,Rank=2,MinLevel=12},	--Force of Will
				{Type=3,ID=633,Icon=023160,BuffType=0,Rank=2,MinLevel=20},	--Relentless Assault
				{Type=3,ID=2714,Icon=007914,BuffType=0,Rank=2,MinLevel=21},	--Witchfinder's Judgement				
				{Type=3,ID=8147,Icon=007987,BuffType=2,Rank=2,MinLevel=32},	--Reversal of Fortune
				{Type=3,ID=629,Icon=023156,BuffType=0,Rank=3,MinLevel=24},	--Broad Swings
				{Type=3,ID=8148,Icon=007986,BuffType=0,Rank=3,MinLevel=36},	--Witchfinder's Protection
				{Type=3,ID=630,Icon=023159,BuffType=0,Rank=4,MinLevel=40}	--Frenzied Slaughter							
			}
}

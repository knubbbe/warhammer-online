

--==IronBreaker==--
Warbuilder.Career[1] = { CareerIcon=20189, ID=20, Line=1, Build=190813.1}
Warbuilder.Career[1].Path = {
{Core={ Icon=004579,				--Path of Vengance
		{Path=1,Type=2,ID=1358,Icon=004409,BuffType=6,MinLevel=4},		--Binding Grudge	
		{Path=1,Type=2,ID=1354,Icon=004577,BuffType=2,MinLevel=5},		--Heavy Blow
		{Path=1,Type=2,ID=1371,Icon=004589,BuffType=6,MinLevel=12},		--Stone Breaker
		{Path=1,Type=2,ID=1366,Icon=004585,BuffType=2,MinLevel=16},		--Rune Etched Axe
		{Path=1,Type=2,ID=1362,Icon=004582,BuffType=6,MinLevel=35}		--Kneecapper
		},
	{Path=1,Type=1,ID=1406,Icon=022701,BuffType=2,MinLevel=0},		--Overprotective
	{Path=1,Type=2,ID=1383,Icon=004516,BuffType=0,MinLevel=0},		--Ancestor's Fury
	{Path=1,Type=1,ID=1407,Icon=022704,BuffType=0,MinLevel=0},		--Power Etchings
	{Path=1,Type=2,ID=1384,Icon=004593,BuffType=6,MinLevel=0},		--Cave-In
	{Path=1,Type=1,ID=1408,Icon=022702,BuffType=0,MinLevel=0},		--Greataxe Mastery
	{Path=1,Type=2,ID=1385,Icon=004594,BuffType=2,MinLevel=0},		--Grudge-born Fury
	{Path=1,Type=3,ID=1425,Icon=004579,BuffType=2,Rank=4,MinLevel=0}		--Axe Slam
	},	
{Core={ Icon=004515,				--Path of Stone
		{Path=2,Type=2,ID=1355,Icon=002414,BuffType=2,MinLevel=1},		--Grudging Blow
		{Path=2,Type=2,ID=1357,Icon=004579,BuffType=2,MinLevel=2},		--Vengeful Strike
		{Path=2,Type=2,ID=1369,Icon=004587,BuffType=2,MinLevel=6},		--Shield of Reprisal
		{Path=2,Type=2,ID=1361,Icon=004581,BuffType=2,MinLevel=8},		--Shield Sweep
		{Path=2,Type=2,ID=1365,Icon=004584,BuffType=2,MinLevel=14}		--Away With Ye
		},
	{Path=2,Type=1,ID=1403,Icon=022694,BuffType=1,MinLevel=0},		--Furious Reprisal
	{Path=2,Type=2,ID=1380,Icon=004590,BuffType=8,MinLevel=0},		--Oathbound
	{Path=2,Type=1,ID=1404,Icon=022702,BuffType=0,MinLevel=0},		--Oath of Vengence
	{Path=2,Type=2,ID=1381,Icon=004591,BuffType=2,MinLevel=0},		--Avenging the Debt
	{Path=2,Type=1,ID=1405,Icon=022702,BuffType=0,MinLevel=0},		--Shield Mastery
	{Path=2,Type=2,ID=1382,Icon=004592,BuffType=2,MinLevel=0},		--Oathstone
	{Path=2,Type=3,ID=1424,Icon=004600,BuffType=0,Rank=4,MinLevel=0}		--Strength In Numbers
	},
{Core={ Icon=004482,				--Path of Brootherhood
		{Path=3,Type=2,ID=1356,Icon=004578,BuffType=2,MinLevel=3},		--Guarded Attack
		{Path=3,Type=2,ID=1364,Icon=004583,BuffType=2,MinLevel=9},		--Inspiring Attack		
		{Path=3,Type=2,ID=1367,Icon=004405,BuffType=8,MinLevel=18},		--Stubbborn as Stone
		{Path=3,Type=2,ID=1372,Icon=004517,BuffType=0,MinLevel=25},		--Watch An' Learn
		{Path=3,Type=2,ID=1359,Icon=004479,BuffType=2,MinLevel=40}		--Punishing Blow		
	},
	{Path=3,Type=1,ID=1409,Icon=022704,BuffType=0,MinLevel=0},		--Avalance
	{Path=3,Type=2,ID=1386,Icon=004595,BuffType=8,MinLevel=0},		--Runic Shield
	{Path=3,Type=1,ID=1410,Icon=022694,BuffType=0,MinLevel=0},		--Punishing Knock
	{Path=3,Type=2,ID=1387,Icon=004596,BuffType=6,MinLevel=0},		--Earthshatter
	{Path=3,Type=1,ID=1411,Icon=022701,BuffType=0,MinLevel=0},		--Told Ya So!
	{Path=3,Type=2,ID=1388,Icon=004432,BuffType=3,MinLevel=0},		--Grumble An' Mutter
	{Path=3,Type=3,ID=1426,Icon=004601,BuffType=3,Rank=4,MinLevel=0}		--Earthen Renewal
	}
}

Warbuilder.Career[1].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=1352,Icon=004575,BuffType=2,MinLevel=1},		--Axe Toss
				{Type=2,ID=1353,Icon=004576,BuffType=0,MinLevel=1},		--Oat Friend				
				{Type=2,ID=1373,Icon=004462,BuffType=0,MinLevel=5},		--Grudge Unleashed				
				{Type=2,ID=1360,Icon=004580,BuffType=1,MinLevel=7},		--Taunt			
				{Type=2,ID=1363,Icon=004515,BuffType=0,MinLevel=10},	--Guard
				{Type=2,ID=1378,Icon=004421,BuffType=0,MinLevel=10},	--Hold The Line!				
--				{Type=2,ID=14418,Icon=023405,BuffType=0,MinLevel=10},	--Deflect Oil
				{Type=2,ID=1377,Icon=004101,BuffType=0,MinLevel=12},	--Juggernaut				
				{Type=2,ID=1368,Icon=004586,BuffType=1,MinLevel=20},	--Challenge
				{Type=2,ID=1374,Icon=002497,BuffType=2,MinLevel=22},	--Sever Blessing
				{Type=2,ID=1370,Icon=004588,BuffType=1,MinLevel=30}		--Grip of Stone
--				{Type=2,ID=14419,Icon=023413,BuffType=0,MinLevel=30},	--Modify War Engine						
--				{Type=2,ID=14420,Icon=023402,BuffType=3,MinLevel=40}	--BulWark				
				},
	Tactic = {
				{Type=1,ID=713,Icon=022711,BuffType=0,MinLevel=11},		--Stoutness of Stone
				{Type=1,ID=500,Icon=022701,BuffType=0,MinLevel=13},		--Focused Offense
				{Type=1,ID=1392,Icon=022694,BuffType=0,MinLevel=15},	--Rinig Anger
				{Type=1,ID=714,Icon=022711,BuffType=0,MinLevel=17},		--Stubbornness
				{Type=1,ID=503,Icon=022702,BuffType=0,MinLevel=19},		--Rugged
				{Type=1,ID=1393,Icon=022709,BuffType=0,MinLevel=21},	--Long-Held Grudge				
				{Type=1,ID=716,Icon=022711,BuffType=0,MinLevel=23},		--Ancestral Enheritance
				{Type=1,ID=504,Icon=022709,BuffType=0,MinLevel=25},		--Menace				
				{Type=1,ID=1394,Icon=022701,BuffType=0,MinLevel=27},	--Sweet Revenge
				{Type=1,ID=505,Icon=022694,BuffType=0,MinLevel=29},		--Unstoppable Juggernaught							
				{Type=1,ID=1395,Icon=022702,BuffType=0,MinLevel=31},	--Seasoned Veteran			
				{Type=1,ID=1396,Icon=022702,BuffType=0,MinLevel=33},	--Seen It All Before											
				{Type=1,ID=1397,Icon=022702,BuffType=0,MinLevel=35},	--Dwarven Riposte							
				{Type=1,ID=1398,Icon=022694,BuffType=0,MinLevel=37},	--Relentless Training				
				{Type=1,ID=1399,Icon=022704,BuffType=0,MinLevel=39}		--Long Reach
				},
	Morale = {
				{Type=3,ID=606,Icon=023172,BuffType=0,Rank=1,MinLevel=8},	--Demolishing Strike
				{Type=3,ID=608,Icon=023174,BuffType=0,Rank=1,MinLevel=16},	--Champion's Challenge
				{Type=3,ID=1418,Icon=004597,BuffType=1,Rank=1,MinLevel=28},	--Rock Clutch			
				{Type=3,ID=611,Icon=023177,BuffType=0,Rank=2,MinLevel=12},	--Shield Wall
				{Type=3,ID=607,Icon=023176,BuffType=0,Rank=2,MinLevel=20},	--Raze
				{Type=3,ID=1419,Icon=004598,BuffType=0,Rank=2,MinLevel=32},	--Skin of Iron
				{Type=3,ID=610,Icon=023173,BuffType=0,Rank=3,MinLevel=24},	--Distracting Bellow
				{Type=3,ID=1420,Icon=004599,BuffType=0,Rank=3,MinLevel=36},	--Gromril Plating
				{Type=3,ID=613,Icon=023175,BuffType=0,Rank=4,MinLevel=40}	--Immaculate Defence				
				}
}


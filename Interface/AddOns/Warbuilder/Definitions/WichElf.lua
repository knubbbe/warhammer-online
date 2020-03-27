
--==WichElf==--
Warbuilder.Career[22] = { CareerIcon=20201, ID=105, Line=22, Build=190813.1}
Warbuilder.Career[22].Path = {
{Core={ Icon=004691,				--Path of Carnage
			{Path=1,Type=2,ID=9398,Icon=010902,BuffType=2,MinLevel=1},		--Slice
			{Path=1,Type=2,ID=9402,Icon=010974,BuffType=0,MinLevel=4},		--Kiss of Agony
			{Path=1,Type=2,ID=9406,Icon=010978,BuffType=7,MinLevel=10},		--Vehement Blades
			{Path=1,Type=2,ID=9399,Icon=010904,BuffType=2,MinLevel=12},		--Ruthless Assault
			{Path=1,Type=2,ID=9400,Icon=010972,BuffType=7,MinLevel=14}		--Sever Limb
			},
	{Path=1,Type=1,ID=9443,Icon=022698,BuffType=0,MinLevel=0},		--Sharpened Edge
	{Path=1,Type=2,ID=9420,Icon=010901,BuffType=0,MinLevel=0},		--Elixir of Insane Power
	{Path=1,Type=1,ID=9445,Icon=022702,BuffType=0,MinLevel=0},		--Swift Blade
	{Path=1,Type=2,ID=9421,Icon=010983,BuffType=9,MinLevel=0},		--Pierce Armor
	{Path=1,Type=1,ID=2991,Icon=022708,BuffType=0,MinLevel=0},		--Bleeding Edge
	{Path=1,Type=2,ID=9422,Icon=010984,BuffType=2,MinLevel=0},		--On Your Knees!
	{Path=1,Type=3,ID=9464,Icon=010991,BuffType=2,Rank=4,MinLevel=0}		--Blade Spin
	},	
{Core={ Icon=004693,				--Path of Suffering
			{Path=2,Type=2,ID=9403,Icon=010975,BuffType=7,MinLevel=3},		--Envenomed Blade
			{Path=2,Type=2,ID=9404,Icon=010976,BuffType=7,MinLevel=6},		--Heart Render Toxin
			{Path=2,Type=2,ID=9407,Icon=011006,BuffType=0,MinLevel=9},		--Kiss of Death
			{Path=2,Type=2,ID=9401,Icon=010973,BuffType=7,MinLevel=20},		--Enfeebling Strike
			{Path=2,Type=2,ID=9405,Icon=010977,BuffType=7,MinLevel=25}		--Wracking Pains
			},
	{Path=2,Type=1,ID=9447,Icon=022701,BuffType=0,MinLevel=0},		--Septic Blade
	{Path=2,Type=2,ID=2999,Icon=011001,BuffType=2,MinLevel=0},		--Elixir of Shadows
	{Path=2,Type=1,ID=9446,Icon=022694,BuffType=0,MinLevel=0},		--Kiss of Doom
	{Path=2,Type=2,ID=9424,Icon=010986,BuffType=7,MinLevel=0},		--Black Lotus Blade
	{Path=2,Type=1,ID=9448,Icon=022706,BuffType=0,MinLevel=0},		--Enveloping Shadows
	{Path=2,Type=2,ID=9425,Icon=010900,BuffType=1,MinLevel=0},		--Witchbrew
	{Path=2,Type=3,ID=9465,Icon=010992,BuffType=2,Rank=4,MinLevel=0}		--Fling Poison
	},
{Core={ Icon=004689,				--Path of Treashery
			{Path=3,Type=2,ID=9410,Icon=010980,BuffType=2,MinLevel=2},		--Agonizing Wound
			{Path=3,Type=2,ID=9408,Icon=010979,BuffType=2,MinLevel=5},		--Kiss of Betrayal
			{Path=3,Type=2,ID=9409,Icon=005166,BuffType=7,MinLevel=16},		--Puncture
			{Path=3,Type=2,ID=9411,Icon=010981,BuffType=7,MinLevel=30},		--Throat Slitter
			{Path=3,Type=2,ID=9412,Icon=010982,BuffType=0,MinLevel=35}		--Treacherous Assault
			},
	{Path=3,Type=1,ID=9449,Icon=022709,BuffType=0,MinLevel=0},		--Swift Movements
	{Path=3,Type=2,ID=9426,Icon=010987,BuffType=0,MinLevel=0},		--Elixir of the Cauldron
	{Path=3,Type=1,ID=9450,Icon=022701,BuffType=0,MinLevel=0},		--Increased Pain
	{Path=3,Type=2,ID=9427,Icon=005203,BuffType=2,MinLevel=0},		--Heart Seeker
	{Path=3,Type=1,ID=9451,Icon=022701,BuffType=0,MinLevel=0},		--Masterful Treachery
	{Path=3,Type=2,ID=9428,Icon=010994,BuffType=2,MinLevel=0},		--Sacrificial Stab
	{Path=3,Type=3,ID=9466,Icon=010993,BuffType=1,Rank=4,MinLevel=0}		--Overwhelming Dread
	}
}

Warbuilder.Career[22].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=1,MinLevel=1},		--Flee
				{Type=2,ID=9394,Icon=010903,BuffType=2,MinLevel=1},		--Throwing Dagger
				{Type=2,ID=9397,Icon=005170,BuffType=1,MinLevel=7},		--Feinted Positioning
				{Type=2,ID=9392,Icon=010968,BuffType=1,MinLevel=8},		--Enchanting Beauty
				{Type=2,ID=9393,Icon=010969,BuffType=0,MinLevel=10},	--Shadow Prowler
				{Type=2,ID=14427,Icon=023412,BuffType=0,MinLevel=10},	--Pick Lock
				{Type=2,ID=9395,Icon=010970,BuffType=0,MinLevel=18},	--Fleet-Footed
				{Type=2,ID=9413,Icon=002497,BuffType=2,MinLevel=22},	--Sever Blessing
				{Type=2,ID=9396,Icon=010905,BuffType=1,MinLevel=40},	--Agile Escape
				{Type=2,ID=9415,Icon=010997,BuffType=0,MinLevel=40}		--Shadow Runner			
--				{Type=2,ID=14426,Icon=023401,BuffType=0,MinLevel=30},	--Booby Trap
--				{Type=2,ID=14424,Icon=023408,BuffType=0,MinLevel=40}	--Faultfinder
				},
	Tactic = {
				{Type=1,ID=841,Icon=022712,BuffType=0,MinLevel=11},		--Dark Blessings
				{Type=1,ID=526,Icon=022694,BuffType=0,MinLevel=13},		--Jagged Edge
				{Type=1,ID=9432,Icon=022712,BuffType=0,MinLevel=15},	--Whirling Blades
				{Type=1,ID=839,Icon=022712,BuffType=0,MinLevel=17},		--Alignment of Naggaroth
				{Type=1,ID=521,Icon=022701,BuffType=0,MinLevel=19},		--Brute Force
				{Type=1,ID=9433,Icon=022708,BuffType=2,MinLevel=21},	--Baneful Touch
				{Type=1,ID=6050,Icon=022696,BuffType=0,MinLevel=23},	--Mark of Morathi				
				{Type=1,ID=840,Icon=022712,BuffType=0,MinLevel=23},		--Bathing In Blood
				{Type=1,ID=523,Icon=022704,BuffType=0,MinLevel=25},		--Flanking
				{Type=1,ID=9434,Icon=022704,BuffType=0,MinLevel=27},	--Frenzied Mayhem
				{Type=1,ID=528,Icon=022702,BuffType=0,MinLevel=29},		--Riposte
				{Type=1,ID=9436,Icon=022709,BuffType=0,MinLevel=31},	--Exotic Venom
				{Type=1,ID=522,Icon=022707,BuffType=10,MinLevel=32},	--Close Combat					
				{Type=1,ID=9435,Icon=022708,BuffType=0,MinLevel=33},	--For the Hag Queen!
				{Type=1,ID=9437,Icon=022701,BuffType=0,MinLevel=35},	--Taste of Blood
				{Type=1,ID=9438,Icon=022708,BuffType=0,MinLevel=37},	--Swift Pursuit
				{Type=1,ID=9439,Icon=022702,BuffType=0,MinLevel=39}		--Sacrifices Rewarded
				},
	Morale = { 
				{Type=3,ID=627,Icon=023161,BuffType=2,Rank=1,MinLevel=8},	--Severe Nerve
				{Type=3,ID=631,Icon=023157,BuffType=0,Rank=1,MinLevel=16},	--Confusing Movements		
				{Type=3,ID=9458,Icon=010988,BuffType=2,Rank=1,MinLevel=28},	--Dance of Doom
				{Type=3,ID=628,Icon=023158,BuffType=0,Rank=2,MinLevel=12},	--Force of Will
				{Type=3,ID=633,Icon=023160,BuffType=0,Rank=2,MinLevel=20},	--Relentless Assault
				{Type=3,ID=9460,Icon=010990,BuffType=0,Rank=2,MinLevel=32},	--Web of Shadows
				{Type=3,ID=629,Icon=023156,BuffType=0,Rank=3,MinLevel=24},	--Broad Swings
				{Type=3,ID=9459,Icon=010963,BuffType=2,Rank=3,MinLevel=36},	--Death Reaper
				{Type=3,ID=630,Icon=023159,BuffType=0,Rank=4,MinLevel=40}	--Frenzied Slaughter							
			}
}

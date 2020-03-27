
--==Knight==--
Warbuilder.Career[10] = { CareerIcon=20190, ID=61, Line=10, Build=190813.1}
Warbuilder.Career[10].Path = {
{Core={ Icon=004579,				--Path of Conquest
		{Path=1,Type=2,ID=8004,Icon=007995,BuffType=12,MinLevel=2},		--Press The Attack!
		{Path=1,Type=2,ID=8005,Icon=008068,BuffType=2,MinLevel=3},		--Precision Strike
		{Path=1,Type=2,ID=8012,Icon=007945,BuffType=6,MinLevel=9},		--Crippling Blow
		{Path=1,Type=2,ID=8035,Icon=008071,BuffType=8,MinLevel=18},		--Shining Blade
		{Path=1,Type=2,ID=8022,Icon=007996,BuffType=12,MinLevel=25},	--All Out Assault!
		{Path=1,Type=2,ID=8026,Icon=008057,BuffType=6,MinLevel=40}		--Arcing Swing
		},
	{Path=1,Type=1,ID=8055,Icon=022709,BuffType=0,MinLevel=0},		--Slice Through
	{Path=1,Type=2,ID=8030,Icon=008076,BuffType=12,MinLevel=0},		--To Glory!
	{Path=1,Type=1,ID=8054,Icon=022701,BuffType=0,MinLevel=0},		--Encouraged Aim
	{Path=1,Type=2,ID=8031,Icon=008063,BuffType=2,MinLevel=0},		--Myrmidia's Fury
	{Path=1,Type=1,ID=8053,Icon=022694,BuffType=0,MinLevel=0},		--Efficient Swings
	{Path=1,Type=2,ID=8032,Icon=008074,BuffType=6,MinLevel=0},		--Staggering Impact
	{Path=1,Type=3,ID=8074,Icon=008065,BuffType=4,Rank=4,MinLevel=0}		--Nova Strike
	},	
{Core={ Icon=004515,				--Path of Vigilace
		{Path=2,Type=2,ID=8002,Icon=007990,BuffType=2,MinLevel=1},		--Sunder
		{Path=2,Type=2,ID=8006,Icon=008075,BuffType=12,MinLevel=4},		--Stand Strong
		{Path=2,Type=2,ID=8011,Icon=008009,BuffType=8,MinLevel=8},		--Shield Rush
		{Path=2,Type=2,ID=8015,Icon=007991,BuffType=12,MinLevel=12},	--On Your Guard!
		{Path=2,Type=2,ID=8016,Icon=008067,BuffType=0,MinLevel=14},		--Perseverance
		{Path=2,Type=2,ID=8017,Icon=007961,BuffType=2,MinLevel=16}		--Repel Darkness
		},
	{Path=2,Type=1,ID=8056,Icon=022706,BuffType=0,MinLevel=0},		--Coordination
	{Path=2,Type=2,ID=8033,Icon=008007,BuffType=12,MinLevel=0},		--To Victory
	{Path=2,Type=1,ID=8057,Icon=022704,BuffType=0,MinLevel=0},		--Dirty Tricks
	{Path=2,Type=2,ID=8018,Icon=008072,BuffType=2,MinLevel=0},		--Smashing Counter
	{Path=2,Type=1,ID=8058,Icon=022713,BuffType=4,MinLevel=0},		--Laurels of Victory
	{Path=2,Type=2,ID=8034,Icon=008078,BuffType=8,MinLevel=0},		--Vigilance
	{Path=2,Type=3,ID=8075,Icon=008059,BuffType=4,Rank=4,MinLevel=0}		--Flawless Defense
	},
{Core={ Icon=004482,				--Path of Glory
		{Path=3,Type=2,ID=8007,Icon=008006,BuffType=6,MinLevel=5},		--Blazing Blade
		{Path=3,Type=2,ID=8009,Icon=007999,BuffType=2,MinLevel=6},		--Vicious Slash
		{Path=3,Type=2,ID=8008,Icon=008002,BuffType=12,MinLevel=6},		--Gather Your Resolve!
		{Path=3,Type=2,ID=8020,Icon=008003,BuffType=12,MinLevel=20},	--Stay Focused!
		{Path=3,Type=2,ID=8023,Icon=008010,BuffType=2,MinLevel=25},		--Shatter Confidence
		{Path=3,Type=2,ID=8025,Icon=008070,BuffType=8,MinLevel=35}		--Shield of the Sun
		},
	{Path=3,Type=1,ID=8059,Icon=022702,BuffType=4,MinLevel=0},		--Sunfury
	{Path=3,Type=2,ID=8036,Icon=008066,BuffType=12,MinLevel=0},		--Now's Our Chance!
	{Path=3,Type=1,ID=8060,Icon=022706,BuffType=4,MinLevel=0},		--Focus Mending
	{Path=3,Type=2,ID=8038,Icon=008061,BuffType=2,MinLevel=0},		--Heaven's Fury
	{Path=3,Type=1,ID=8061,Icon=022715,BuffType=4,MinLevel=0},		--Mighty Soul
	{Path=3,Type=2,ID=8037,Icon=008077,BuffType=2,MinLevel=0},		--Unbalancing Attck
	{Path=3,Type=3,ID=8076,Icon=008073,BuffType=4,Rank=4,MinLevel=0}		--Solar Flare
	}
}

Warbuilder.Career[10].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8003,Icon=007992,BuffType=2,MinLevel=1},		--Throw Blade
				{Type=2,ID=8010,Icon=007994,BuffType=1,MinLevel=7},		--Taunt
				{Type=2,ID=8013,Icon=008078,BuffType=4,MinLevel=10},	--Guard
				{Type=2,ID=8014,Icon=007997,BuffType=4,MinLevel=10},	--Hold The Line!
--				{Type=2,ID=14418,Icon=023405,BuffType=0,MinLevel=10},	--Deflect Oil
				{Type=2,ID=8019,Icon=008062,BuffType=4,MinLevel=12},	--Juggernaut
				{Type=2,ID=8021,Icon=008058,BuffType=1,MinLevel=20},	--Challenge
				{Type=2,ID=8024,Icon=008005,BuffType=1,MinLevel=30}		--Shackle
--				{Type=2,ID=14419,Icon=023413,BuffType=0,MinLevel=30},	--Modify War Engine
--				{Type=2,ID=14420,Icon=023402,BuffType=3,MinLevel=40}	--Bulwark
				},
	Tactic = {
				{Type=1,ID=779,Icon=022710,BuffType=0,MinLevel=11},		--Eperor's Ward
				{Type=1,ID=500,Icon=022701,BuffType=0,MinLevel=13},		--Focused Offence
				{Type=1,ID=8043,Icon=022708,BuffType=0,MinLevel=15},	--Runefgang
				{Type=1,ID=777,Icon=022710,BuffType=0,MinLevel=17},		--Unwavering Faith
				{Type=1,ID=503,Icon=022702,BuffType=0,MinLevel=19},		--Rugged
				{Type=1,ID=8042,Icon=022702,BuffType=0,MinLevel=21},	--Gilded Shield
				{Type=1,ID=776,Icon=022710,BuffType=0,MinLevel=23},		--Sigmar's Favor
				{Type=1,ID=504,Icon=022709,BuffType=0,MinLevel=25},		--Menace
				{Type=1,ID=8044,Icon=022701,BuffType=6,MinLevel=27},	--Biting Blade
				{Type=1,ID=505,Icon=022694,BuffType=0,MinLevel=29},	--Unstoppable Juggernaut
				{Type=1,ID=8045,Icon=022709,BuffType=0,MinLevel=31},	--Sun's Blessing
				{Type=1,ID=8046,Icon=022704,BuffType=0,MinLevel=33},	--Well-Trained
				{Type=1,ID=8047,Icon=022703,BuffType=0,MinLevel=35},	--Banish Darkness
				{Type=1,ID=8048,Icon=022715,BuffType=0,MinLevel=37}	--Bellow Commands
--				{Type=1,ID=8049,Icon=022698,BuffType=0,MinLevel=39}	--Destroy Confidence 	IS REMOVED
				},
	Morale = {
				{Type=3,ID=606,Icon=023172,BuffType=0,Rank=1,MinLevel=8},	--Demolishing Strike
				{Type=3,ID=608,Icon=023174,BuffType=0,Rank=1,MinLevel=16},	--Champion's Challenge
				{Type=3,ID=8068,Icon=008060,BuffType=4,Rank=1,MinLevel=28},	--Guardian of Light
				{Type=3,ID=611,Icon=023177,BuffType=0,Rank=2,MinLevel=12},	--Shield Wall
				{Type=3,ID=607,Icon=023176,BuffType=0,Rank=2,MinLevel=20},	--Raze
				{Type=3,ID=8070,Icon=008011,BuffType=4,Rank=2,MinLevel=32},	--Emperor's Champion
				{Type=3,ID=610,Icon=023173,BuffType=0,Rank=3,MinLevel=24},	--Distracting Bellow
				{Type=3,ID=8069,Icon=008064,BuffType=1,Rank=3,MinLevel=36},	--No Escape
				{Type=3,ID=613,Icon=023175,BuffType=0,Rank=4,MinLevel=40}	--Immaculate Defence				
				}
}


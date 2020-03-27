

--==SwordMaster==--
Warbuilder.Career[17] = { CareerIcon=20198, ID=92, Line=17, Build=190813.1}
Warbuilder.Career[17].Path = {
{Core={ Icon=004579,				--Path of Khaine
		{Path=1,Type=2,ID=9004,Icon=013370,BuffType=0,MinLevel=2},		--Quick Incision
		{Path=1,Type=2,ID=9022,Icon=013386,BuffType=2,MinLevel=3},		--Blurring Shock		
		{Path=1,Type=2,ID=9031,Icon=013389,BuffType=2,MinLevel=8},		--Gryphon's Lash
		{Path=1,Type=2,ID=9009,Icon=013374,BuffType=5,MinLevel=9},		--Nature's Blade
		{Path=1,Type=2,ID=9021,Icon=013305,BuffType=2,MinLevel=40}		--Wall of Darting Steel
		},
	{Path=1,Type=1,ID=9068,Icon=022701,BuffType=0,MinLevel=0},		--Deep Incision
	{Path=1,Type=2,ID=9014,Icon=013300,BuffType=5,MinLevel=0},		--Sapping Strike
	{Path=1,Type=1,ID=9062,Icon=022709,BuffType=0,MinLevel=0},		--Balanced Accuracy	
	{Path=1,Type=2,ID=9025,Icon=013303,BuffType=2,MinLevel=0},		--Pheonix's Wing
	{Path=1,Type=1,ID=9063,Icon=022709,BuffType=0,MinLevel=0},		--Great Weapon Mastery
	{Path=1,Type=2,ID=9026,Icon=013384,BuffType=2,MinLevel=0},		--Ether Dance
	{Path=1,Type=3,ID=9074,Icon=013395,BuffType=2,Rank=4,MinLevel=0}		--Whirling Geyser
	},	
{Core={ Icon=004515,				--Path of Vaul
		{Path=2,Type=2,ID=9007,Icon=013372,BuffType=9,MinLevel=4},		--Eagle's Flight
		{Path=2,Type=2,ID=9020,Icon=013382,BuffType=0,MinLevel=5},		--Phantom's Blade
		{Path=2,Type=2,ID=9002,Icon=013302,BuffType=5,MinLevel=6},		--Graceful Strike
		{Path=2,Type=2,ID=9006,Icon=013301,BuffType=5,MinLevel=18},		--Dragon's Talon
		{Path=2,Type=2,ID=9011,Icon=013376,BuffType=5,MinLevel=35}		--Intimidating Blow
		},
	{Path=2,Type=1,ID=9064,Icon=022702,BuffType=0,MinLevel=0},		--Perfect Defenses
	{Path=2,Type=2,ID=9032,Icon=013394,BuffType=2,MinLevel=0},		--Redirected Force
	{Path=2,Type=1,ID=9069,Icon=022706,BuffType=0,MinLevel=0},		--Vaul's Buffer
	{Path=2,Type=2,ID=9027,Icon=013385,BuffType=2,MinLevel=0},		--Crashing Advance
	{Path=2,Type=1,ID=9049,Icon=022708,BuffType=0,MinLevel=0},		--Forceful Shock
	{Path=2,Type=2,ID=9033,Icon=013390,BuffType=9,MinLevel=0},		--Vaul's Tempering	
	{Path=2,Type=3,ID=9075,Icon=013396,BuffType=0,Rank=4,MinLevel=0}		--Shield of Valor
	},
{Core={ Icon=004482,				--Path of Hoeth
		{Path=3,Type=2,ID=9010,Icon=013330,BuffType=5,MinLevel=1},		--Dazzling Strike
		{Path=3,Type=2,ID=9019,Icon=013304,BuffType=5,MinLevel=12},		--Ensorcelled Blow
		{Path=3,Type=2,ID=9017,Icon=013388,BuffType=2,MinLevel=14},		--Gusting Wind
		{Path=3,Type=2,ID=9012,Icon=013377,BuffType=2,MinLevel=16},		--Heaven's Blade
		{Path=3,Type=2,ID=9015,Icon=013379,BuffType=0,MinLevel=25}		--Whrath of Hoet
	},

	{Path=3,Type=1,ID=9070,Icon=022694,BuffType=0,MinLevel=0},		--Calming Winds
	{Path=3,Type=2,ID=9029,Icon=013387,BuffType=9,MinLevel=0},		--Protection of Hoe	
	{Path=3,Type=1,ID=9044,Icon=022709,BuffType=0,MinLevel=0},		--Blinding Strike	
	{Path=3,Type=2,ID=9028,Icon=013383,BuffType=9,MinLevel=0},		--Crashing Wave		
	{Path=3,Type=1,ID=2884,Icon=022706,BuffType=0,MinLevel=0},		--Blessing of Heaven
	{Path=3,Type=2,ID=9030,Icon=013380,BuffType=5,MinLevel=0},		--Whispering Wind
	{Path=3,Type=3,ID=9076,Icon=013397,BuffType=2,Rank=4,MinLevel=0}		--Shadow Blades
	}
}

Warbuilder.Career[17].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=9003,Icon=013369,BuffType=2,MinLevel=1},		--Throw
				{Type=2,ID=9035,Icon=013330,BuffType=4,MinLevel=3},		--Sudden Shift
				{Type=2,ID=9005,Icon=013371,BuffType=1,MinLevel=7},		--Taunt
				{Type=2,ID=9008,Icon=013373,BuffType=0,MinLevel=10},	--Guard
				{Type=2,ID=9023,Icon=013334,BuffType=0,MinLevel=10},	--Hold The Line!
--				{Type=2,ID=14418,Icon=023405,BuffType=0,MinLevel=10},	--Deflect Oil
				{Type=2,ID=9016,Icon=013338,BuffType=0,MinLevel=12},	--Juggernaut
				{Type=2,ID=9013,Icon=013378,BuffType=1,MinLevel=20},	--Challenge
				{Type=2,ID=9034,Icon=002497,BuffType=2,MinLevel=22},	--Shatter Enchantment
--				{Type=2,ID=9018,Icon=013381,BuffType=1,MinLevel=30},	--Modify War Engine
				{Type=2,ID=9018,Icon=013381,BuffType=0,MinLevel=30}		--Aethyric Grasp
--				{Type=2,ID=14420,Icon=023402,BuffType=3,MinLevel=40}	--Bulwark
				},
	Tactic = {
				{Type=1,ID=818,Icon=022705,BuffType=0,MinLevel=11},		--Centuries of Training
				{Type=1,ID=500,Icon=022701,BuffType=0,MinLevel=13},		--Focused Offense
				{Type=1,ID=9045,Icon=022701,BuffType=0,MinLevel=15},	--Ensorcelled Agony
				{Type=1,ID=819,Icon=022705,BuffType=0,MinLevel=17},		--Bend the Winds
				{Type=1,ID=503,Icon=022702,BuffType=0,MinLevel=19},		--Rugged
				{Type=1,ID=9066,Icon=022703,BuffType=0,MinLevel=21},	--Bolstering Enchantments				
				{Type=1,ID=823,Icon=022705,BuffType=0,MinLevel=23},		--Discerning Offense
				{Type=1,ID=504,Icon=022709,BuffType=0,MinLevel=25},		--Menace
				{Type=1,ID=9043,Icon=022706,BuffType=0,MinLevel=27},	--Isha's Protection
				{Type=1,ID=505,Icon=022694,BuffType=0,MinLevel=29},		--Unstoppable Juggernaut
				{Type=1,ID=9047,Icon=022708,BuffType=0,MinLevel=31},	--Potent Enchantment
				{Type=1,ID=9052,Icon=022698,BuffType=0,MinLevel=33},	--Poised Attack
				{Type=1,ID=9065,Icon=022704,BuffType=0,MinLevel=35},	--Lingering Intimidation				
				{Type=1,ID=9050,Icon=022705,BuffType=0,MinLevel=37},	--Impeccable Reactions
				{Type=1,ID=9053,Icon=022704,BuffType=0,MinLevel=39}		--Adept Movements
				},
	Morale = {
				{Type=3,ID=606,Icon=023172,BuffType=0,Rank=1,MinLevel=8},	--Demolishing Strike
				{Type=3,ID=608,Icon=023174,BuffType=0,Rank=1,MinLevel=16},	--Champion's Challenge
				{Type=3,ID=9056,Icon=013391,BuffType=0,Rank=1,MinLevel=28},	--Guard of Steel
				{Type=3,ID=611,Icon=023177,BuffType=0,Rank=2,MinLevel=12},	--Shield Wall
				{Type=3,ID=607,Icon=023176,BuffType=0,Rank=2,MinLevel=20},	--Raze
				{Type=3,ID=9057,Icon=013392,BuffType=0,Rank=2,MinLevel=32},	--Wings of Heaven
				{Type=3,ID=610,Icon=023173,BuffType=0,Rank=3,MinLevel=24},	--Distracting Bellow
				{Type=3,ID=9058,Icon=013393,BuffType=0,Rank=3,MinLevel=36},	--Bladeshield
				{Type=3,ID=613,Icon=023175,BuffType=0,Rank=4,MinLevel=40}	--Immaculate Defence				
				}
}


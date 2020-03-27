
--==ShadowWarrior==--
Warbuilder.Career[18] = { CareerIcon=20194, ID=93, Line=18, Build=190813.1}
Warbuilder.Career[18].Path = {
{Core={ Icon=004691,				--Path of The Scout
			{Path=1,Type=2,ID=9082,Icon=013322,BuffType=2,MinLevel=1},		--Eagle Eye
			{Path=1,Type=2,ID=9104,Icon=013324,BuffType=7,MinLevel=3},		--Acid Arrow
			{Path=1,Type=2,ID=9088,Icon=013326,BuffType=2,MinLevel=14},		--Flame Arrow
			{Path=1,Type=2,ID=9101,Icon=013314,BuffType=2,MinLevel=16},		--Rapid Fire
			{Path=1,Type=2,ID=9095,Icon=013408,BuffType=7,MinLevel=35}		--Throat Shot
			},
	{Path=1,Type=1,ID=9127,Icon=022697,BuffType=0,MinLevel=0},		--Guerilla Training
	{Path=1,Type=2,ID=9103,Icon=013311,BuffType=7,MinLevel=0},		--Glass Arrow
	{Path=1,Type=1,ID=9126,Icon=022698,BuffType=0,MinLevel=0},		--Enchanted Arrows	
	{Path=1,Type=2,ID=9085,Icon=013401,BuffType=2,MinLevel=0},		--Festering Arrow
	{Path=1,Type=1,ID=2741,Icon=022709,BuffType=0,MinLevel=0},		--No Quarter
	{Path=1,Type=2,ID=9105,Icon=013313,BuffType=7,MinLevel=0},		--Fell The Weak
	{Path=1,Type=3,ID=9142,Icon=013337,BuffType=2,Rank=4,MinLevel=0}		--Rain of Steel
	},	
{Core={ Icon=004693,				--Path of Assault
			{Path=2,Type=2,ID=9083,Icon=013400,BuffType=2,MinLevel=1},		--Grim Slash
			{Path=2,Type=2,ID=9086,Icon=013402,BuffType=2,MinLevel=4},		--Brutal Assault
			{Path=2,Type=2,ID=9091,Icon=013405,BuffType=7,MinLevel=9},		--Draw Blood
			{Path=2,Type=2,ID=9098,Icon=013319,BuffType=7,MinLevel=25},		--Opportunistic Strike
			{Path=2,Type=2,ID=9107,Icon=013331,BuffType=2,MinLevel=26},		--Sweeping Slash			
			{Path=2,Type=2,ID=9099,Icon=013323,BuffType=2,MinLevel=30},		--Counterstrike
			{Path=2,Type=3,ID=9143,Icon=013338,BuffType=2,Rank=4,MinLevel=40}	--Whirling Rage			
			},
	{Path=2,Type=1,ID=9130,Icon=022698,BuffType=0,MinLevel=0},		--Sinister Assault
	{Path=2,Type=2,ID=9106,Icon=013330,BuffType=2,MinLevel=0},		--Swift Strikes
	{Path=2,Type=1,ID=9131,Icon=022702,BuffType=0,MinLevel=0},		--No Respite
	{Path=2,Type=2,ID=2972,Icon=013301,BuffType=2,MinLevel=0},		--Crosscut
	{Path=2,Type=1,ID=2974,Icon=022708,BuffType=0,MinLevel=0},		--Merciless Soldier
	{Path=2,Type=2,ID=9108,Icon=013409,BuffType=7,MinLevel=0},		--Exploit Weakness
	{Path=2,Type=2,ID=2822,Icon=013335,BuffType=2,MinLevel=0}		--Shadowstep
	},
{Core={ Icon=004689,				--Path of The Skirmisher
			{Path=3,Type=2,ID=9084,Icon=013309,BuffType=7,MinLevel=2},		--Broadhead Arrow
			{Path=3,Type=2,ID=9087,Icon=013310,BuffType=7,MinLevel=5},		--Takedown			
			{Path=3,Type=2,ID=9093,Icon=013406,BuffType=2,MinLevel=6},		--Spiral-Fletched Arrow
			{Path=3,Type=2,ID=9110,Icon=013329,BuffType=2,MinLevel=25},		--Flanking Shot				
			{Path=3,Type=2,ID=9100,Icon=013307,BuffType=2,MinLevel=40}		--Lileath's Arrow
		},
	{Path=3,Type=1,ID=9134,Icon=022694,BuffType=0,MinLevel=0},		--Split Arrows
	{Path=3,Type=2,ID=9111,Icon=013337,BuffType=2,MinLevel=0},		--Barrage
	{Path=3,Type=1,ID=9133,Icon=022702,BuffType=0,MinLevel=0},		--Keen Arrowhead	
	{Path=3,Type=2,ID=9109,Icon=013317,BuffType=7,MinLevel=0},		--Shadow Sting
	{Path=3,Type=1,ID=9132,Icon=022697,BuffType=0,MinLevel=0},		--Powerful Draw	
	{Path=3,Type=2,ID=9096,Icon=013325,BuffType=7,MinLevel=0},		--Eye Shot
	{Path=3,Type=3,ID=9144,Icon=013339,BuffType=2,Rank=4,MinLevel=0}		--Penetrating Arrow
	}
}

Warbuilder.Career[18].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=9080,Icon=013398,BuffType=0,MinLevel=1},		--Scout Stance
				{Type=2,ID=9090,Icon=013404,BuffType=0,MinLevel=4},		--Assault Stance
				{Type=2,ID=9094,Icon=013407,BuffType=0,MinLevel=6},		--Skirmish Stance
				{Type=2,ID=9089,Icon=013403,BuffType=1,MinLevel=7},		--Distracting Shot
				{Type=2,ID=9148,Icon=013302,BuffType=9,MinLevel=8},		--Hunter's Fervor
				{Type=2,ID=9081,Icon=013399,BuffType=9,MinLevel=10},	--Vengeance of Nagarythe
--				{Type=2,ID=14406,Icon=023411,BuffType=0,MinLevel=10},	--Bolster War Engine
				{Type=2,ID=9092,Icon=013321,BuffType=7,MinLevel=12},	--Whirling Pin
				{Type=2,ID=9097,Icon=013308,BuffType=9,MinLevel=20}		--Steady Aim
--				{Type=2,ID=14407,Icon=023409,BuffType=1,MinLevel=30},	--Hamper War Engine
--				{Type=2,ID=14408,Icon=023406,BuffType=1,MinLevel=40}	--Diminish War Engine
				},
	Tactic = {
				{Type=1,ID=818,Icon=022705,BuffType=0,MinLevel=11},		--Centuries of Training
				{Type=1,ID=544,Icon=022694,BuffType=0,MinLevel=13},		--Expert Skirmisher
				{Type=1,ID=9118,Icon=022708,BuffType=0,MinLevel=15},	--Replenishing Strikes
				{Type=1,ID=819,Icon=022705,BuffType=0,MinLevel=17},		--Bend the Winds
				{Type=1,ID=542,Icon=022697,BuffType=0,MinLevel=19},		--Masterful Aim
				{Type=1,ID=9116,Icon=022704,BuffType=0,MinLevel=21},	--Wrist Slash
				{Type=1,ID=823,Icon=022705,BuffType=0,MinLevel=23},		--Discerning Offense	
				{Type=1,ID=549,Icon=022698,BuffType=0,MinLevel=25},		--Cleaver Recovery
				{Type=1,ID=9119,Icon=022697,BuffType=0,MinLevel=27},	--Smoldering Arrows
				{Type=1,ID=550,Icon=022709,BuffType=0,MinLevel=29},		--Pierce Defenses
				{Type=1,ID=9122,Icon=022697,BuffType=0,MinLevel=31},	--Distracting Rebounds
				{Type=1,ID=9121,Icon=022694,BuffType=0,MinLevel=33},	--Instinctive Aim
				{Type=1,ID=9117,Icon=022709,BuffType=0,MinLevel=35},	--Bullseye
				{Type=1,ID=9128,Icon=022697,BuffType=0,MinLevel=37},	--Leading Shots
				{Type=1,ID=9123,Icon=022696,BuffType=0,MinLevel=39}		--Blood-Soaked War
				},
	Morale = { 
				{Type=3,ID=648,Icon=023165,BuffType=1,Rank=1,MinLevel=8},	--Point-Blank
				{Type=3,ID=652,Icon=023162,BuffType=0,Rank=1,MinLevel=16},	--Concealment
				{Type=3,ID=9137,Icon=013334,BuffType=0,Rank=1,MinLevel=28},	--Lileath's Forgiveness
				{Type=3,ID=653,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=2711,Icon=013335,BuffType=2,Rank=2,MinLevel=32},	--Ambush
				{Type=3,ID=650,Icon=023163,BuffType=0,Rank=3,MinLevel=24},	--Explosive Shots
				{Type=3,ID=9139,Icon=013336,BuffType=2,Rank=3,MinLevel=36},	--Instill Fear
				{Type=3,ID=651,Icon=023164,BuffType=0,Rank=4,MinLevel=40},	--Hail of Doom
				{Path=2,Type=3,ID=9143,Icon=013338,BuffType=2,Rank=4,MinLevel=40}	--Whirling Rage
			}
}

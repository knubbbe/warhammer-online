
--==WarriorPriest==--
Warbuilder.Career[12] = { CareerIcon=20199, ID=63, Line=12, Build=190813.1}
Warbuilder.Career[12].Path = {
{Core={ Icon=005113,				--Path of Salvation
		{Path=1,Type=2,ID=8238,Icon=007903,BuffType=8,MinLevel=1},		--Divine Aid
		{Path=1,Type=2,ID=8236,Icon=008029,BuffType=2,MinLevel=1},		--Judgement
		{Path=1,Type=2,ID=8239,Icon=007978,BuffType=3,MinLevel=8},		--Divine Mend
		{Path=1,Type=2,ID=8242,Icon=007917,BuffType=0,MinLevel=14},		--Prayer of Absolution
		{Path=1,Type=2,ID=8247,Icon=007946,BuffType=2,MinLevel=20}		--Touch of the Divine
		},
	{Path=1,Type=1,ID=8288,Icon=022694,BuffType=0,MinLevel=0},		--Divine Warding
	{Path=1,Type=2,ID=8264,Icon=007904,BuffType=8,MinLevel=0},		--Divine Light
	{Path=1,Type=1,ID=8287,Icon=022708,BuffType=0,MinLevel=0},		--Refreshing Radiance
	{Path=1,Type=2,ID=8265,Icon=008035,BuffType=8,MinLevel=0},		--Pious Restoration
	{Path=1,Type=1,ID=8289,Icon=022704,BuffType=0,MinLevel=0},		--Cleansing Power
	{Path=1,Type=2,ID=8266,Icon=008036,BuffType=3,MinLevel=0},		--Martyr's Blessing
	{Path=1,Type=3,ID=8308,Icon=008042,BuffType=3,Rank=4,MinLevel=0}		--Gift of Life
	},	
{Core={ Icon=005237,				--Path of Grace
		{Path=2,Type=2,ID=8253,Icon=007944,BuffType=2,MinLevel=2},		--Sigmar's Fist
		{Path=2,Type=2,ID=8249,Icon=007948,BuffType=0,MinLevel=4},		--Prayer of Devotion
		{Path=2,Type=2,ID=8244,Icon=008031,BuffType=2,MinLevel=6},		--Divine Assault
		{Path=2,Type=2,ID=2931,Icon=007945,BuffType=2,MinLevel=6},		--Divine Strike		
		{Path=2,Type=2,ID=2948,Icon=002469,BuffType=8,MinLevel=16},		--Divine Warden	
		{Path=2,Type=2,ID=8268,Icon=008038,BuffType=2,MinLevel=22},		--Sigmar's Vision
		{Path=2,Type=2,ID=8252,Icon=007953,BuffType=2,MinLevel=30},		--Sigmar's Radiance
		{Path=2,Type=2,ID=2940,Icon=007976,BuffType=2,MinLevel=32},		--Sacrifice			
		{Path=2,Type=2,ID=8256,Icon=008037,BuffType=6,MinLevel=35}		--Vow of Silence
		},
	{Path=2,Type=1,ID=8291,Icon=022703,BuffType=0,MinLevel=0},		--Greave of Sigmar
	{Path=2,Type=2,ID=8267,Icon=008034,BuffType=2,MinLevel=0},		--Sigmar's Shield
	{Path=2,Type=1,ID=8290,Icon=022706,BuffType=0,MinLevel=0},		--Leading the Prayer
	{Path=2,Type=2,ID=8269,Icon=008039,BuffType=8,MinLevel=0},		--Sigmar's Grace
	{Path=2,Type=1,ID=8292,Icon=022703,BuffType=0,MinLevel=0},		--Grace of Sigmar
	{Path=2,Type=2,ID=2947,Icon=007993,BuffType=2,MinLevel=0},		--Shielding Grace
	{Path=2,Type=3,ID=8310,Icon=008044,BuffType=1,Rank=4,MinLevel=0}		--Divine Amazement
	},
{Core={ Icon=005236,				--Path of Wrath
		{Path=3,Type=2,ID=8240,Icon=007959,BuffType=2,MinLevel=1},		--Bludgeon
		{Path=3,Type=2,ID=8257,Icon=008001,BuffType=6,MinLevel=5},		--Castigation
		{Path=3,Type=2,ID=8255,Icon=007927,BuffType=6,MinLevel=9},		--Wight of Guilt
		{Path=3,Type=2,ID=8250,Icon=007923,BuffType=2,MinLevel=12},		--Smite
		{Path=3,Type=2,ID=8243,Icon=007950,BuffType=0,MinLevel=18},		--Prayer of Righteousness
		{Path=3,Type=2,ID=8271,Icon=007947,BuffType=6,MinLevel=21}		--Soulfire		
	},
	{Path=3,Type=1,ID=8279,Icon=022706,BuffType=0,MinLevel=0},		--Divine Justice
	{Path=3,Type=2,ID=8270,Icon=008040,BuffType=6,MinLevel=0},		--Absence of Faith
	{Path=3,Type=1,ID=8281,Icon=022694,BuffType=0,MinLevel=0},		--Intimidating Repent
	{Path=3,Type=2,ID=2937,Icon=007921,BuffType=0,MinLevel=0},		--Sigmar's Wrath
	{Path=3,Type=1,ID=8295,Icon=022709,BuffType=0,MinLevel=0},		--Guilty Soul
	{Path=3,Type=2,ID=8272,Icon=007962,BuffType=2,MinLevel=0},		--Hammer of Sigmar
	{Path=3,Type=3,ID=8309,Icon=008043,BuffType=0,Rank=4,MinLevel=0}	--Avatar of Sigmar	
	}
}

Warbuilder.Career[12].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8237,Icon=008030,BuffType=0,MinLevel=1},		--Supplication
				{Type=2,ID=8241,Icon=007960,BuffType=8,MinLevel=3},		--Healing Hand
				{Type=2,ID=8245,Icon=008054,BuffType=1,MinLevel=7},		--Repent
				{Type=2,ID=8248,Icon=007901,BuffType=3,MinLevel=10},	--Breath of Sigmar
--				{Type=2,ID=14414,Icon=023414,BuffType=0,MinLevel=10},	--Reinforce War Engine
				{Type=2,ID=8246,Icon=008032,BuffType=3,MinLevel=16},	--Purify
				{Type=2,ID=2960,Icon=008066,BuffType=0,MinLevel=18},	--Unstoppable Wrath				
				{Type=2,ID=8251,Icon=008041,BuffType=2,MinLevel=25},	--Purge
--				{Type=2,ID=14415,Icon=023404,BuffType=0,MinLevel=30},	--Cleanse War Engine
				{Type=2,ID=8254,Icon=008033,BuffType=1,MinLevel=40}		--Divine Shock
--				{Type=2,ID=14416,Icon=023415,BuffType=0,MinLevel=40}	--Shield the Skies

				},
	Tactic = {
				{Type=1,ID=779,Icon=022710,BuffType=0,MinLevel=11},		--Emperor's Ward
				{Type=1,ID=585,Icon=022703,BuffType=0,MinLevel=13},		--Divine Fury
				{Type=1,ID=8276,Icon=022708,BuffType=0,MinLevel=15},	--Hastened Divinity
				{Type=1,ID=777,Icon=022710,BuffType=0,MinLevel=17},		--Unwavering Faith
				{Type=1,ID=592,Icon=022706,BuffType=0,MinLevel=19},		--Discipline
				{Type=1,ID=8277,Icon=022710,BuffType=0,MinLevel=21},	--Charged Fury
				{Type=1,ID=776,Icon=022710,BuffType=0,MinLevel=23},		--Sigmar's Favor
				{Type=1,ID=588,Icon=022709,BuffType=0,MinLevel=25},		--Subtlety
				{Type=1,ID=8278,Icon=022702,BuffType=0,MinLevel=27},	--Shield of Faith
				{Type=1,ID=589,Icon=022694,BuffType=0,MinLevel=29},		--Restorative Burst
				{Type=1,ID=8293,Icon=022701,BuffType=0,MinLevel=31},	--Fanaticism
				{Type=1,ID=8280,Icon=022702,BuffType=0,MinLevel=33},	--Exalted Defenses
				{Type=1,ID=8294,Icon=022696,BuffType=0,MinLevel=35},	--Endless Guilt
				{Type=1,ID=8282,Icon=022710,BuffType=0,MinLevel=37},	--Fueled Fury
				{Type=1,ID=8283,Icon=022704,BuffType=0,MinLevel=39}		--Divine Petitioning
				},
	Morale = { 
				{Type=3,ID=694,Icon=023151,BuffType=3,Rank=1,MinLevel=8},	--Divine Favor
				{Type=3,ID=690,Icon=023155,BuffType=0,Rank=1,MinLevel=16},	--Steal Life
				{Type=3,ID=8302,Icon=007949,BuffType=0,Rank=1,MinLevel=28},	--Divine Aegis
				{Type=3,ID=692,Icon=023154,BuffType=0,Rank=2,MinLevel=12},	--Rampaging Siphon
				{Type=3,ID=695,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=8303,Icon=007905,BuffType=0,Rank=2,MinLevel=32},	--Divine Replenishment
				{Type=3,ID=696,Icon=023152,BuffType=0,Rank=3,MinLevel=24},	--Divine Protection
				{Type=3,ID=8304,Icon=007916,BuffType=2,Rank=3,MinLevel=36},	--Penance
				{Type=3,ID=697,Icon=023150,BuffType=0,Rank=4,MinLevel=40}	--Alter Fate
			}
}

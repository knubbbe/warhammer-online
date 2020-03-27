
--==RunePriest==--
Warbuilder.Career[3] = { CareerIcon=20193, ID=22, Line=3, Build=190813.1}
Warbuilder.Career[3].Path = {
{Core={ Icon=004508,				--Path of Grungni
		{Path=1,Type=2,ID=1587,Icon=004625,BuffType=3,MinLevel=1},		--Grungni's Gift
		{Path=1,Type=2,ID=1586,Icon=004624,BuffType=2,MinLevel=1},		--Rune of Striking
		{Path=1,Type=2,ID=1591,Icon=004562,BuffType=8,MinLevel=4},		--Oath Rune of Power
		{Path=1,Type=2,ID=1594,Icon=004630,BuffType=2,MinLevel=5},		--Rune of Fire
		{Path=1,Type=2,ID=1596,Icon=004563,BuffType=3,MinLevel=8},		--Rune of Restoration
		{Path=1,Type=2,ID=1606,Icon=004636,BuffType=8,MinLevel=30}		--Protection of the Ancestors
		},
	{Path=1,Type=1,ID=1634,Icon=022708,BuffType=0,MinLevel=0},		--Runic Blasting
	{Path=1,Type=2,ID=1612,Icon=004637,BuffType=0,MinLevel=0},		--Master Rune of Fury
	{Path=1,Type=1,ID=1632,Icon=022709,BuffType=0,MinLevel=0},		--Ancestor's Blessing
	{Path=1,Type=2,ID=1611,Icon=004559,BuffType=2,MinLevel=0},		--Rune of Fortune
	{Path=1,Type=1,ID=1633,Icon=022709,BuffType=0,MinLevel=0},		--Rune of Nullification
	{Path=1,Type=2,ID=1613,Icon=004638,BuffType=2,MinLevel=0},		--Rune of Binding
	{Path=1,Type=3,ID=1648,Icon=004643,BuffType=2,Rank=4,MinLevel=0}		--Rune of Ending
	},	
{Core={ Icon=004471,				--Path of Valaya
		{Path=2,Type=2,ID=1589,Icon=004627,BuffType=2,MinLevel=2},		--Rune of Immolation
		{Path=2,Type=2,ID=1593,Icon=004629,BuffType=8,MinLevel=6},		--Rune of Shielding
		{Path=2,Type=2,ID=1599,Icon=004503,BuffType=3,MinLevel=10},		--Rune of Mending
		{Path=2,Type=2,ID=1600,Icon=004634,BuffType=8,MinLevel=12},		--Oath Rune of Iron
		{Path=2,Type=2,ID=1607,Icon=004533,BuffType=7,MinLevel=35}		--Spellbinding Rune
		},
	{Path=2,Type=1,ID=1635,Icon=022694,BuffType=0,MinLevel=0},		--Immolating Grasp
	{Path=2,Type=2,ID=1615,Icon=004640,BuffType=0,MinLevel=0},		--Master Rune of Speed
	{Path=2,Type=1,ID=1636,Icon=022704,BuffType=2,MinLevel=0},		--Earth's Shielding
	{Path=2,Type=2,ID=1614,Icon=004639,BuffType=2,MinLevel=0},		--Rune of Burning
	{Path=2,Type=1,ID=1637,Icon=022708,BuffType=0,MinLevel=0},		--Efficient Runecarving
	{Path=2,Type=2,ID=1616,Icon=004500,BuffType=7,MinLevel=0},		--Rune of Fate
	{Path=2,Type=3,ID=1649,Icon=004644,BuffType=3,Rank=4,MinLevel=0}		--Valaya's Shield
	},
{Core={ Icon=004647,				--Path of Grimnir
		{Path=3,Type=2,ID=1603,Icon=004558,BuffType=2,MinLevel=7},		--Rune of Might
		{Path=3,Type=2,ID=1588,Icon=004626,BuffType=8,MinLevel=9},		--Oath Rune of Warding
		{Path=3,Type=2,ID=1601,Icon=004635,BuffType=8,MinLevel=14},		--Rune of Serenity
		{Path=3,Type=2,ID=1597,Icon=004632,BuffType=7,MinLevel=18},		--Rune of Cleaving	
		{Path=3,Type=2,ID=1604,Icon=004489,BuffType=3,MinLevel=20}		--Blessing of Valaya
	},
	{Path=3,Type=1,ID=1640,Icon=022694,BuffType=0,MinLevel=0},		--Extended Battle
	{Path=3,Type=2,ID=1618,Icon=004502,BuffType=3,MinLevel=0},		--Master Rune of Adamant
	{Path=3,Type=1,ID=1638,Icon=022709,BuffType=0,MinLevel=0},		--Concussive Rune
	{Path=3,Type=2,ID=1617,Icon=004641,BuffType=8,MinLevel=0},		--Rune of Battle
	{Path=3,Type=1,ID=1639,Icon=022706,BuffType=0,MinLevel=0},		--Ancestor's Echo
	{Path=3,Type=2,ID=1619,Icon=004557,BuffType=8,MinLevel=0},		--Grimnir's Fury
	{Path=3,Type=3,ID=1650,Icon=004645,BuffType=2,Rank=4,MinLevel=0}		--Rune of Skewering
	}
}

Warbuilder.Career[3].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=1,MinLevel=1},		--Flee
				{Type=2,ID=1659,Icon=004100,BuffType=8,MinLevel=1},		--Rune of Breaking	
				{Type=2,ID=1590,Icon=004561,BuffType=5,MinLevel=3},		--Rune of Regeneration	
				{Type=2,ID=1595,Icon=004631,BuffType=2,MinLevel=7},		--Rune of Preservation		
				{Type=2,ID=1598,Icon=004633,BuffType=0,MinLevel=10},	--Rune of Life
--				{Type=2,ID=14414,Icon=023414,BuffType=0,MinLevel=10},	--Reinforce War Engine	
				{Type=2,ID=1602,Icon=004507,BuffType=3,MinLevel=16},	--Rune of Cleansing
				{Type=2,ID=1592,Icon=004628,BuffType=0,MinLevel=21},	--Grimnir's Shield
				{Type=2,ID=1605,Icon=004564,BuffType=8,MinLevel=25},	--Rune of Sundering
--				{Type=2,ID=14415,Icon=023404,BuffType=8,MinLevel=30},	--Cleanse War Engine
				{Type=2,ID=1608,Icon=004554,BuffType=0,MinLevel=40}		--Oath Rune of Sanctuary
--				{Type=2,ID=14416,Icon=023415,BuffType=0,MinLevel=40}	--Shield the Skies
				},
	Tactic = {
				{Type=1,ID=713,Icon=022711,BuffType=0,MinLevel=11},		--Stoutness of Stone
				{Type=1,ID=585,Icon=022703,BuffType=0,MinLevel=13},		--Divine Fury
				{Type=1,ID=1626,Icon=022694,BuffType=0,MinLevel=15},	--Swift Runes
				{Type=1,ID=714,Icon=022711,BuffType=0,MinLevel=17},		--Stubbornness
				{Type=1,ID=592,Icon=022706,BuffType=0,MinLevel=19},		--Discipline
				{Type=1,ID=1623,Icon=022706,BuffType=0,MinLevel=21},	--Cleansing Vitality
				{Type=1,ID=716,Icon=022711,BuffType=0,MinLevel=23},		--Ancestral Inheritance	
				{Type=1,ID=588,Icon=022709,BuffType=0,MinLevel=25},		--Subtlety
				{Type=1,ID=1622,Icon=022702,BuffType=0,MinLevel=27},	--Regenerative Shielding
				{Type=1,ID=589,Icon=022694,BuffType=0,MinLevel=29},		--Restorative Burst
				{Type=1,ID=1624,Icon=022704,BuffType=0,MinLevel=31},	--Blessing of Grungni
				{Type=1,ID=1625,Icon=022694,BuffType=0,MinLevel=33},	--Potent Runes
				{Type=1,ID=1627,Icon=022706,BuffType=0,MinLevel=35},	--On Your Feet!
				{Type=1,ID=1628,Icon=022703,BuffType=0,MinLevel=37},	--Sundered Motion
				{Type=1,ID=1629,Icon=022696,BuffType=0,MinLevel=39}		--Thick-Skulled
				},
	Morale = { 
				{Type=3,ID=694,Icon=023151,BuffType=3,Rank=1,MinLevel=8},	--Divine Favor
				{Type=3,ID=690,Icon=023155,BuffType=0,Rank=1,MinLevel=16},	--Steal life
				{Type=3,ID=1643,Icon=004537,BuffType=2,Rank=1,MinLevel=28},	--Rune of Insanity
				{Type=3,ID=692,Icon=023154,BuffType=0,Rank=2,MinLevel=12},	--Rampaging Siphon
				{Type=3,ID=695,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=1644,Icon=004642,BuffType=0,Rank=2,MinLevel=32},	--Mountain Spirit
				{Type=3,ID=696,Icon=023152,BuffType=0,Rank=3,MinLevel=24},	--Divine Protection
				{Type=3,ID=1645,Icon=004535,BuffType=3,Rank=3,MinLevel=36},	--Rune of Rebirth
				{Type=3,ID=697,Icon=023150,BuffType=0,Rank=4,MinLevel=40}	--Alter Fate
			}
}

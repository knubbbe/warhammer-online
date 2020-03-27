

--==BlackOrc==--
Warbuilder.Career[5] = { CareerIcon=20182, ID=24, Line=5, Build=190813.1}
Warbuilder.Career[5].Path = {
{Core={ Icon=004579,				--Path of Da' Brawler
		{Path=1,Type=2,ID=1670,Icon=002526,BuffType=7,MinLevel=2},		--Trip 'Em Up
		{Path=1,Type=2,ID=1676,Icon=002560,BuffType=2,MinLevel=3},		--Skull Thumper
		{Path=1,Type=2,ID=1678,Icon=002561,BuffType=2,MinLevel=8},		--Da Big Un'			
		{Path=1,Type=2,ID=1666,Icon=002552,BuffType=7,MinLevel=12},		--Wot armor?
		{Path=1,Type=2,ID=1668,Icon=002554,BuffType=4,MinLevel=14}		--Da Biggest!
		},
	{Path=1,Type=1,ID=1711,Icon=022702,BuffType=0,MinLevel=0},		--Keep It Goin'!
	{Path=1,Type=2,ID=1687,Icon=002527,BuffType=7,MinLevel=0},		--Arm Breaka
	{Path=1,Type=1,ID=1712,Icon=022707,BuffType=0,MinLevel=0},		--Gork Smash!
	{Path=1,Type=2,ID=2810,Icon=002564,BuffType=2,MinLevel=0},		--T'ree Hit Combo
	{Path=1,Type=1,ID=1713,Icon=022702,BuffType=0,MinLevel=0},		--Guud at Big Choppin!
	{Path=1,Type=2,ID=2851,Icon=002406,BuffType=0,MinLevel=0},		--You Woot?
	{Path=1,Type=3,ID=1727,Icon=002572,BuffType=2,Rank=4,MinLevel=0}	--Puddle o Muck				
	},	
{Core={ Icon=004515,				--Path of Da' Toughest
		{Path=2,Type=2,ID=1664,Icon=002497,BuffType=2,MinLevel=1},		--Clobber
		{Path=2,Type=2,ID=1673,Icon=002504,BuffType=4,MinLevel=4},		--Da Toughest!
		{Path=2,Type=2,ID=1669,Icon=002555,BuffType=8,MinLevel=6},		--Tuffer 'n Nails		
		{Path=2,Type=2,ID=1682,Icon=002419,BuffType=7,MinLevel=9},		--Right in Da Jibblies
		{Path=2,Type=2,ID=1680,Icon=002562,BuffType=2,MinLevel=18},		--Big Slash		
		{Path=2,Type=2,ID=1690,Icon=002565,BuffType=7,MinLevel=21}	--Ya Missed Me		
		},
	{Path=2,Type=1,ID=1714,Icon=022702,BuffType=0,MinLevel=0},		--Less Stabbin' Me
	{Path=2,Type=2,ID=1692,Icon=002567,BuffType=8,MinLevel=0},		--Can't Hit Me!
	{Path=2,Type=1,ID=1715,Icon=022704,BuffType=0,MinLevel=0},		--Stopp Hittin' Da Runts
	{Path=3,Type=2,ID=1691,Icon=002566,BuffType=7,MinLevel=0},		--Not in da face!
	{Path=2,Type=1,ID=1716,Icon=022708,BuffType=0,MinLevel=0},		--Mor' Hardcore
	{Path=2,Type=2,ID=2856,Icon=002568,BuffType=8,MinLevel=0},		--We'z Bigger
	{Path=2,Type=3,ID=1728,Icon=002573,BuffType=0,Rank=4,MinLevel=0}		--Can't Touch Us
	},
{Core={ Icon=004482,				--Path of Da' Boss
		{Path=3,Type=2,ID=1667,Icon=002553,BuffType=8,MinLevel=5},		--Follow 'me Lead
		{Path=3,Type=2,ID=1677,Icon=002499,BuffType=8,MinLevel=16},		--Savin' Me Hide			
		{Path=3,Type=2,ID=1675,Icon=002559,BuffType=4,MinLevel=25},		--Da Greenest
		{Path=3,Type=2,ID=1672,Icon=002557,BuffType=7,MinLevel=35},		--Big Swing
		{Path=3,Type=2,ID=1683,Icon=002457,BuffType=7,MinLevel=40}		--Shut Yer Face
	},
	{Path=3,Type=1,ID=1717,Icon=022706,BuffType=0,MinLevel=0},		--You Got Nuffin'
	{Path=3,Type=2,ID=2744,Icon=002401,BuffType=8,MinLevel=0},		--Rock 'Ard
	{Path=3,Type=1,ID=1718,Icon=022701,BuffType=0,MinLevel=0},		--Big Brawlin'
	{Path=2,Type=2,ID=1688,Icon=002528,BuffType=2,MinLevel=0},		--Down Ya Go
	{Path=3,Type=1,ID=2866,Icon=022702,BuffType=0,MinLevel=0},		--No Choppin' Me
	{Path=3,Type=2,ID=1695,Icon=002569,BuffType=2,MinLevel=0},		--WAAAAAAAGH!
	{Path=3,Type=3,ID=1729,Icon=002574,BuffType=2,Rank=4,MinLevel=0}		--Yer Nothin
	}
}

Warbuilder.Career[5].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=1665,Icon=002551,BuffType=2,MinLevel=1},		--Lob Choppa
				{Type=2,ID=1734,Icon=002445,BuffType=4,MinLevel=3},		--Changin' Da Plan
				{Type=2,ID=1671,Icon=002556,BuffType=1,MinLevel=7},		--Taunt
				{Type=2,ID=1684,Icon=002529,BuffType=8,MinLevel=10},	--Get 'Em
				{Type=2,ID=1685,Icon=002428,BuffType=0,MinLevel=10},	--Hold The Line!
				{Type=2,ID=1674,Icon=002558,BuffType=0,MinLevel=10},	--Save Da Runts
--				{Type=2,ID=14418,Icon=023405,BuffType=0,MinLevel=10},	--Deflect Oil
				{Type=2,ID=1740,Icon=002441,BuffType=0,MinLevel=12},	--Juggernaut
				{Type=2,ID=1679,Icon=002422,BuffType=1,MinLevel=20},	--Challenge				
				{Type=2,ID=1733,Icon=002497,BuffType=2,MinLevel=22},	--Shatter Enchantment
				{Type=2,ID=1681,Icon=002563,BuffType=1,MinLevel=30}		--Where You Going?
--				{Type=2,ID=14419,Icon=023413,BuffType=0,MinLevel=30},	--Modify War Engine
--				{Type=2,ID=14420,Icon=023402,BuffType=3,MinLevel=40}	--Bulwark
				},
	Tactic = {
				{Type=1,ID=734,Icon=022707,BuffType=0,MinLevel=11},		--I'm Da Biggers!
				{Type=1,ID=500,Icon=022701,BuffType=0,MinLevel=13},		--Focused Offense
				{Type=1,ID=1700,Icon=022704,BuffType=0,MinLevel=15},	--'Ave Another One
				{Type=1,ID=735,Icon=022707,BuffType=0,MinLevel=17},		--Don't Bother Me None
				{Type=1,ID=503,Icon=022702,BuffType=0,MinLevel=19},		--Rugged
				{Type=1,ID=1701,Icon=022696,BuffType=0,MinLevel=21},	--Lookin' For Opp'tunity
				{Type=1,ID=739,Icon=022707,BuffType=4,MinLevel=23},		--Stab You Gooder
				{Type=1,ID=504,Icon=022709,BuffType=0,MinLevel=25},		--Menace
				{Type=1,ID=1705,Icon=022702,BuffType=0,MinLevel=27},	--Good Wif Shield
				{Type=1,ID=1719,Icon=022702,BuffType=0,MinLevel=27},	--No Choppin' Me				
				{Type=1,ID=505,Icon=022694,BuffType=0,MinLevel=29},		--Unstoppable Juggernaut
				{Type=1,ID=1703,Icon=022694,BuffType=0,MinLevel=31},	--Dat Was Great!
				{Type=1,ID=1707,Icon=022702,BuffType=0,MinLevel=33},	--Youz see me blok' dat'?!
				{Type=1,ID=1702,Icon=022708,BuffType=0,MinLevel=35},	--Bring 'Em On
				{Type=1,ID=1706,Icon=022701,BuffType=0,MinLevel=37},	--Loudmouth
				{Type=1,ID=1704,Icon=022702,BuffType=0,MinLevel=39}		--Can Youz Hear Me Now?
				},
	Morale = {
				{Type=3,ID=606,Icon=023172,BuffType=0,Rank=1,MinLevel=8},	--Demolishing Strike
				{Type=3,ID=608,Icon=023174,BuffType=0,Rank=1,MinLevel=16},	--Champion's Challenge
				{Type=3,ID=1721,Icon=002570,BuffType=0,Rank=1,MinLevel=28},	--Quit Yer Squabblin'	
				{Type=3,ID=611,Icon=023177,BuffType=0,Rank=2,MinLevel=12},	--Shield Wall
				{Type=3,ID=607,Icon=023176,BuffType=0,Rank=2,MinLevel=20},	--Raze
				{Type=3,ID=1723,Icon=002571,BuffType=0,Rank=2,MinLevel=32},	--Walk it Off!
				{Type=3,ID=610,Icon=023173,BuffType=0,Rank=3,MinLevel=24},	--Distracting Bellow
				{Type=3,ID=1722,Icon=002453,BuffType=1,Rank=3,MinLevel=36},	--Deafening Bellow!
				{Type=3,ID=613,Icon=023175,BuffType=0,Rank=4,MinLevel=40}	--Immaculate Defence
				}
}



--==Choppa==--
Warbuilder.Career[6] = { CareerIcon=20184, ID=25, Line=6, Build=190813.1}
Warbuilder.Career[6].Path = {
{Core={ Icon=004691,				--Path of Da' Savage
			{Path=2,Type=2,ID=1761,Icon=002649,BuffType=2,MinLevel=2},		--Reckless Blow
			{Path=1,Type=2,ID=1744,Icon=002632,BuffType=6,MinLevel=3},		--Don't Go Nowhere
			{Path=1,Type=2,ID=1742,Icon=002630,BuffType=6,MinLevel=5},		--Throat Slasha
			{Path=1,Type=2,ID=1769,Icon=002652,BuffType=9,MinLevel=8},		--Bring Da Pain!
			{Path=1,Type=2,ID=1750,Icon=002638,BuffType=6,MinLevel=35}		--Try An' Hurt Me
			},
	{Path=1,Type=1,ID=1788,Icon=022702,BuffType=4,MinLevel=0},		--Wot Rules
	{Path=1,Type=2,ID=1770,Icon=002653,BuffType=9,MinLevel=0},		--Keep On Choppin'
	{Path=1,Type=1,ID=1789,Icon=022701,BuffType=4,MinLevel=0},		--Yer Gettin' Soft
	{Path=1,Type=2,ID=1746,Icon=002634,BuffType=6,MinLevel=0},		--Can't Stop Da Chop
	{Path=1,Type=1,ID=1790,Icon=022708,BuffType=4,MinLevel=0},		--Red goes faster
	{Path=1,Type=2,ID=1768,Icon=002651,BuffType=2,MinLevel=0},		--Furious Choppin'
	{Path=1,Type=3,ID=1802,Icon=002663,BuffType=0,Rank=4,MinLevel=0}		--We'z Fightin' Betta
	},	
{Core={ Icon=004693,				--Path of Da' Hitta
			{Path=2,Type=2,ID=1745,Icon=002633,BuffType=6,MinLevel=1},		--Slasha
			{Path=1,Type=2,ID=1749,Icon=002637,BuffType=2,MinLevel=7},		--Go For Da Soft Spot
			{Path=2,Type=2,ID=1751,Icon=002639,BuffType=2,MinLevel=9},		--Weaklin' Killa
			{Path=2,Type=2,ID=1760,Icon=002648,BuffType=10,MinLevel=14},	--Hurtin' Time
			{Path=2,Type=2,ID=1755,Icon=002643,BuffType=2,MinLevel=30}		--Sit Down!
			},
	{Path=2,Type=1,ID=1791,Icon=022707,BuffType=4,MinLevel=0},		--Long Lasta
	{Path=2,Type=2,ID=1771,Icon=002654,BuffType=6,MinLevel=0},		--Bleed Em Out
	{Path=2,Type=1,ID=1792,Icon=022701,BuffType=4,MinLevel=0},		--Wear Em Down
	{Path=2,Type=2,ID=1772,Icon=002655,BuffType=6,MinLevel=0},		--Tired Already?
	{Path=2,Type=1,ID=1793,Icon=022702,BuffType=4,MinLevel=0},		--Strong Finish
	{Path=2,Type=2,ID=1773,Icon=002656,BuffType=6,MinLevel=0},		--No More Helpin'
	{Path=2,Type=3,ID=1803,Icon=002664,BuffType=0,Rank=4,MinLevel=0}		--Yer Goin Down!
	},
{Core={ Icon=004689,				--Path of Da' Wrecka
			{Path=3,Type=2,ID=1747,Icon=002635,BuffType=2,MinLevel=4},		--Lotsa Choppin
			{Path=3,Type=2,ID=1759,Icon=002647,BuffType=2,MinLevel=6},		--Wild Choppin'
			{Path=3,Type=2,ID=1758,Icon=002646,BuffType=9,MinLevel=20},		--Come and Git It!
			{Path=3,Type=2,ID=1748,Icon=002636,BuffType=6,MinLevel=25},		--Yer All Bleedin' Now
			{Path=3,Type=2,ID=1762,Icon=002650,BuffType=2,MinLevel=40}		--Bring It On
		},
	{Path=3,Type=1,ID=1794,Icon=022709,BuffType=4,MinLevel=0},		--Longer and Stronger
	{Path=3,Type=2,ID=1774,Icon=002657,BuffType=6,MinLevel=0},		--Wot's Da Rush?
	{Path=3,Type=1,ID=1796,Icon=022701,BuffType=4,MinLevel=0},		--Extra Choppin'
	{Path=3,Type=2,ID=1775,Icon=002658,BuffType=9,MinLevel=0},		--Chop Fasta!
	{Path=3,Type=1,ID=1795,Icon=022707,BuffType=4,MinLevel=0},		--Keep It Comin'
	{Path=3,Type=2,ID=1776,Icon=002659,BuffType=2,MinLevel=0},		--Git To Da Choppa
	{Path=3,Type=3,ID=1804,Icon=002665,BuffType=0,Rank=4,MinLevel=0}		--Stomp Da Yard
	}
}

Warbuilder.Career[6].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=1743,Icon=002631,BuffType=2,MinLevel=1},		--Fling Choppa
				{Type=2,ID=1752,Icon=002640,BuffType=0,MinLevel=10},	--Charge!
				{Type=2,ID=1753,Icon=002641,BuffType=6,MinLevel=10},	--Outta My Face!
				{Type=2,ID=14423,Icon=023403,BuffType=0,MinLevel=10},	--Bypass Defenses
				{Type=2,ID=1754,Icon=002642,BuffType=9,MinLevel=12},	--Git Struck In
				{Type=2,ID=1756,Icon=002644,BuffType=6,MinLevel=16},	--Drop Da Basha
				{Type=2,ID=1757,Icon=002645,BuffType=10,MinLevel=18}	--Shrug It Off
--				{Type=2,ID=14422,Icon=023416,BuffType=1,MinLevel=30},	--Siege Wrecker
--				{Type=2,ID=14424,Icon=023408,BuffType=0,MinLevel=40}	--Faultfinder	
				},
	Tactic = {
				{Type=1,ID=734,Icon=022707,BuffType=0,MinLevel=11},		--I'm Da Biggest
				{Type=1,ID=526,Icon=022694,BuffType=0,MinLevel=13},		--Jagged Edge
				{Type=1,ID=1778,Icon=022703,BuffType=10,MinLevel=15},	--Don't Wanna Live Foreva
				{Type=1,ID=735,Icon=022707,BuffType=0,MinLevel=17},		--Don't Bother Me None
				{Type=1,ID=521,Icon=022701,BuffType=0,MinLevel=19},		--Brute Force
				{Type=1,ID=1779,Icon=022707,BuffType=10,MinLevel=21},	--Finish 'Em Faster
				{Type=1,ID=739,Icon=022707,BuffType=10,MinLevel=23},	--Stab You Gooder
				{Type=1,ID=523,Icon=022704,BuffType=0,MinLevel=25},		--Flanking
				{Type=1,ID=1780,Icon=022706,BuffType=10,MinLevel=27},	--Bloodlust
				{Type=1,ID=528,Icon=022702,BuffType=0,MinLevel=29},	--Riposte
				{Type=1,ID=1781,Icon=022707,BuffType=10,MinLevel=31},	--I'm Still Here
				{Type=1,ID=522,Icon=022707,BuffType=10,MinLevel=32},	--Close Combat				
				{Type=1,ID=1782,Icon=022708,BuffType=10,MinLevel=33},	--Don't Hate Da Choppa
				{Type=1,ID=1783,Icon=022709,BuffType=10,MinLevel=35},	--Easy Killin'
				{Type=1,ID=1784,Icon=022707,BuffType=10,MinLevel=37},	--Chop Til You Drop
				{Type=1,ID=1785,Icon=022701,BuffType=10,MinLevel=39}	--Was Dat Yer Finger?
				},
	Morale = { 
				{Type=3,ID=627,Icon=023161,BuffType=2,Rank=1,MinLevel=8},	--Severe Nerve
				{Type=3,ID=631,Icon=023157,BuffType=0,Rank=1,MinLevel=16},	--Confusing Movements		
				{Type=3,ID=1799,Icon=002660,BuffType=4,Rank=1,MinLevel=28},	--Dat Tickles!
				{Type=3,ID=628,Icon=023158,BuffType=0,Rank=2,MinLevel=12},	--Force of Will
				{Type=3,ID=633,Icon=023160,BuffType=0,Rank=2,MinLevel=20},	--Relentless Assault
				{Type=3,ID=1800,Icon=002661,BuffType=2,Rank=2,MinLevel=32},	--Tantrum
				{Type=3,ID=629,Icon=023156,BuffType=0,Rank=3,MinLevel=24},	--Broad Swings
				{Type=3,ID=1801,Icon=002662,BuffType=0,Rank=3,MinLevel=36},	--Supa Chop
				{Type=3,ID=630,Icon=023159,BuffType=0,Rank=4,MinLevel=40}	--Frenzied Slaughter							
			}
}


--	
--==Shaman==--
Warbuilder.Career[7] = { CareerIcon=20195, ID=26, Line=7, Build=190813.1}
Warbuilder.Career[7].Path = {
{Core={ Icon=005113,				--Path of Mork
		{Path=1,Type=2,ID=1898,Icon=002444,BuffType=9,MinLevel=1},		--Gork'll Fix It
		{Path=1,Type=2,ID=1910,Icon=002472,BuffType=9,MinLevel=7},		--Mork's Buffer
		{Path=1,Type=2,ID=1904,Icon=002466,BuffType=3,MinLevel=8},		--Bigger, Better, An' Greener
		{Path=1,Type=2,ID=1906,Icon=002579,BuffType=3,MinLevel=16},		--Greener 'n Cleaner
		{Path=1,Type=2,ID=1907,Icon=002467,BuffType=3,MinLevel=20}		--Gather Round
		},
	{Path=1,Type=1,ID=1951,Icon=022706,BuffType=2,MinLevel=0},		--Pass it on
	{Path=1,Type=2,ID=1928,Icon=002463,BuffType=2,MinLevel=0},		--Shrug It Off
	{Path=1,Type=1,ID=1950,Icon=022708,BuffType=3,MinLevel=0},		--Lookit What I Did!
	{Path=3,Type=2,ID=1927,Icon=004543,BuffType=7,MinLevel=0},		--Sticky Feetz
	{Path=1,Type=1,ID=1958,Icon=022706,BuffType=3,MinLevel=0},		--Pass It On
	{Path=1,Type=2,ID=1926,Icon=002501,BuffType=9,MinLevel=0},		--Do Sumfin Useful
	{Path=1,Type=3,ID=1970,Icon=002586,BuffType=3,Rank=4,MinLevel=0}--Feelz No Pain
	},	
{Core={ Icon=005237,				--Path of Gork
		{Path=2,Type=2,ID=1899,Icon=002459,BuffType=2,MinLevel=1},		--Brain Bursta
		{Path=2,Type=2,ID=1900,Icon=002575,BuffType=7,MinLevel=2},		--Life Leaka
		{Path=2,Type=2,ID=1903,Icon=002577,BuffType=2,MinLevel=6},		--Bunch o' Waaagh
		{Path=2,Type=2,ID=1902,Icon=002425,BuffType=0,MinLevel=12},		--'Ere We Go!
		{Path=2,Type=2,ID=1913,Icon=002498,BuffType=2,MinLevel=35}		--Big Waaagh!
		},
	{Path=2,Type=1,ID=1957,Icon=022703,BuffType=2,MinLevel=0},		--Ere We Goes Again
	{Path=1,Type=2,ID=1929,Icon=002456,BuffType=2,MinLevel=0},		--Geddoff!
	{Path=2,Type=1,ID=1954,Icon=022696,BuffType=2,MinLevel=0},		--Mork's Touch
	{Path=2,Type=2,ID=1905,Icon=002578,BuffType=7,MinLevel=0},		--Gork's Barbs'
	{Path=2,Type=1,ID=2749,Icon=022696,BuffType=2,MinLevel=0},		--Touch of Gork
	{Path=2,Type=2,ID=1931,Icon=002403,BuffType=2,MinLevel=0},		--Da Waaagh! Is Comming
	{Path=2,Type=3,ID=1971,Icon=002545,BuffType=2,Rank=4,MinLevel=0}		--Fist of Gork
	},
{Core={ Icon=005236,				--Path of Da Green
		{Path=3,Type=2,ID=2100,Icon=002464,BuffType=7,MinLevel=4},		--I'll Take That!
		{Path=3,Type=2,ID=1932,Icon=002534,BuffType=9,MinLevel=5},		--Don' Feel Nuthin
		{Path=3,Type=2,ID=1912,Icon=002582,BuffType=2,MinLevel=9},		--Bleed Fer' Me
		{Path=3,Type=2,ID=1909,Icon=002580,BuffType=7,MinLevel=30},		--Get'n Smarter
		{Path=3,Type=2,ID=1916,Icon=002585,BuffType=7,MinLevel=40}		--You'z Squishy
	},
	{Path=3,Type=1,ID=1956,Icon=022708,BuffType=1,MinLevel=0},		--You Really Got Nuthin
	{Path=2,Type=2,ID=1933,Icon=002500,BuffType=7,MinLevel=0},		--Scuse Me
	{Path=3,Type=1,ID=1949,Icon=022703,BuffType=3,MinLevel=0},		--Nuthin' But Da WAAAGH!
	{Path=3,Type=2,ID=1917,Icon=002460,BuffType=7,MinLevel=0},		--You Got Nuthin!
	{Path=3,Type=1,ID=2105,Icon=022707,BuffType=3,MinLevel=0},		--Waaagh! Frenzy
	{Path=3,Type=2,ID=2102,Icon=002429,BuffType=2,MinLevel=0},		--Fury of Da Green
	{Path=3,Type=3,ID=1972,Icon=02588,BuffType=1,Rank=4,MinLevel=0}		--Steal Yer Thunder
	}
}

Warbuilder.Career[7].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=1901,Icon=002576,BuffType=9,MinLevel=3},		--'Ey, Quit Bleedin'
				{Type=2,ID=1918,Icon=002477,BuffType=1,MinLevel=7},		--Look Over There!
				{Type=2,ID=1908,Icon=002433,BuffType=3,MinLevel=10},	--Gedop!
--				{Type=2,ID=14414,Icon=023414,BuffType=0,MinLevel=10},	--Reinforce War Engine
				{Type=2,ID=1915,Icon=002584,BuffType=9,MinLevel=14},	--Stop hittin' me!
				{Type=2,ID=1911,Icon=002581,BuffType=7,MinLevel=18},	--Yer Not So Bad
				{Type=2,ID=1914,Icon=002583,BuffType=1,MinLevel=25}		--Eeeek!
--				{Type=2,ID=14415,Icon=023404,BuffType=0,MinLevel=30},	--Cleanse War Engine
--				{Type=2,ID=14416,Icon=023415,BuffType=0,MinLevel=40}	--Shield the Skies
				},
	Tactic = {
				{Type=1,ID=760,Icon=022707,BuffType=0,MinLevel=11},		--Whazat Behind You?!
				{Type=1,ID=585,Icon=022708,BuffType=0,MinLevel=13},		--Divine Fury
				{Type=1,ID=1938,Icon=022707,BuffType=2,MinLevel=15},	--Burst O' Waaagh!
				{Type=1,ID=756,Icon=022707,BuffType=0,MinLevel=17},		--Too Smart For Dat
				{Type=1,ID=592,Icon=022706,BuffType=0,MinLevel=19},		--Discipline
				{Type=1,ID=1945,Icon=022694,BuffType=4,MinLevel=21},	--Green Cleanin'
				{Type=1,ID=758,Icon=022707,BuffType=0,MinLevel=23},		--RUN AWAY!
				{Type=1,ID=588,Icon=022709,BuffType=0,MinLevel=25},		--Subtlety	
				{Type=1,ID=1940,Icon=022703,BuffType=3,MinLevel=27},	--Extra Special Mushrooms
				{Type=1,ID=589,Icon=022694,BuffType=0,MinLevel=29},		--Restrorative Burst
				{Type=1,ID=1941,Icon=022703,BuffType=3,MinLevel=31},	--Dat Makes Me Dizzy
				{Type=1,ID=1942,Icon=022704,BuffType=2,MinLevel=33},	--Mork Is Watchin'
				{Type=1,ID=1943,Icon=022704,BuffType=2,MinLevel=35},	--Git Outta Here!
				{Type=1,ID=1944,Icon=022708,BuffType=3,MinLevel=37},	--Get Movin'!
				{Type=1,ID=1939,Icon=022707,BuffType=3,MinLevel=39}		--Ain't Done Yet!	
				},
	Morale = { 
				{Type=3,ID=694,Icon=023151,BuffType=3,Rank=1,MinLevel=8},	--Divine Favor
				{Type=3,ID=690,Icon=023155,BuffType=0,Rank=1,MinLevel=16},	--Steal Life
				{Type=3,ID=1964,Icon=002505,BuffType=2,Rank=1,MinLevel=28},	--Gork Sez Stop
				{Type=3,ID=692,Icon=023154,BuffType=0,Rank=2,MinLevel=12},	--Rampaging Siphon
				{Type=3,ID=695,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=1965,Icon=002462,BuffType=3,Rank=2,MinLevel=32},	--Breath of Mork
				{Type=3,ID=696,Icon=023152,BuffType=0,Rank=3,MinLevel=24},	--Divine Protection
				{Type=3,ID=1966,Icon=002506,BuffType=1,Rank=3,MinLevel=36},	--You Weren't Using Dat
				{Type=3,ID=697,Icon=023150,BuffType=0,Rank=4,MinLevel=40}	--Alter Fate
			}
}


--==Zealot==--
Warbuilder.Career[15] = { CareerIcon=20203, ID=66, Line=15, Build=190813.1}
Warbuilder.Career[15].Path = {
{Core={ Icon=005113,				--Path of Alchemye
		{Path=1,Type=2,ID=8569,Icon=005154,BuffType=3,MinLevel=1},		--Flash of Chaos
		{Path=1,Type=2,ID=8548,Icon=005144,BuffType=2,MinLevel=1},		--Scourge	
		{Path=1,Type=2,ID=8551,Icon=005140,BuffType=8,MinLevel=4},		--Mark of Daemonic Fury
		{Path=1,Type=2,ID=8568,Icon=005160,BuffType=2,MinLevel=5},		--Tzeentch's Cry	
		{Path=1,Type=2,ID=8566,Icon=005103,BuffType=3,MinLevel=8},		--Elexir of Dark Blessings		
		{Path=1,Type=2,ID=8561,Icon=005240,BuffType=8,MinLevel=30}		--Daemonic Fortitude
		},
	{Path=1,Type=1,ID=8595,Icon=022708,BuffType=0,MinLevel=0},		--Chaotic Force
	{Path=1,Type=2,ID=8572,Icon=005241,BuffType=0,MinLevel=0},		--Ritual of Innervation
	{Path=1,Type=1,ID=8594,Icon=022703,BuffType=2,MinLevel=0},		--Manipulation
	{Path=1,Type=2,ID=8573,Icon=005242,BuffType=2,MinLevel=0},		--Boon of Tzeentch
	{Path=1,Type=1,ID=8596,Icon=022709,BuffType=3,MinLevel=0},		--Changer's Touch
	{Path=1,Type=2,ID=8571,Icon=005236,BuffType=2,MinLevel=0},		--Aethyric Shock
	{Path=1,Type=3,ID=8611,Icon=005245,BuffType=0,Rank=4,MinLevel=0}		--Tzeentch's Shielding
	},	
{Core={ Icon=005237,				--Path of Witchcraft
		{Path=2,Type=2,ID=8553,Icon=005268,BuffType=5,MinLevel=2},		--Warp Reality
		{Path=2,Type=2,ID=8564,Icon=005244,BuffType=8,MinLevel=6},		--Veil of Chaos		
		{Path=2,Type=2,ID=8549,Icon=005113,BuffType=3,MinLevel=10},		--Dark Medicine
		{Path=2,Type=2,ID=8556,Icon=005136,BuffType=8,MinLevel=12},		--Mark of Spell Destroyer
		{Path=2,Type=2,ID=8565,Icon=005238,BuffType=5,MinLevel=35}		--Tzeentch's Lash
		},
	{Path=2,Type=1,ID=8599,Icon=022694,BuffType=0,MinLevel=0},		--Lashing Waves
	{Path=2,Type=2,ID=8574,Icon=005119,BuffType=0,MinLevel=0},		--Ritual of Superiority
	{Path=2,Type=1,ID=8598,Icon=022708,BuffType=0,MinLevel=0},		--Tzeentch's Refreshment
	{Path=2,Type=2,ID=8576,Icon=005243,BuffType=2,MinLevel=0},		--Storm of Ravens
	{Path=2,Type=1,ID=8597,Icon=022697,BuffType=2,MinLevel=0},		--Transference
	{Path=2,Type=2,ID=8575,Icon=005137,BuffType=5,MinLevel=0},		--Mirror of Madness
	{Path=2,Type=3,ID=8612,Icon=005246,BuffType=2,Rank=4,MinLevel=0}		--Tzeentch's Scream
	},
{Core={ Icon=005236,				--Path of Rites
		{Path=3,Type=2,ID=8552,Icon=005231,BuffType=2,MinLevel=7},		--Rite of Agony
		{Path=3,Type=2,ID=8560,Icon=005137,BuffType=8,MinLevel=9},		--Mark of the Vortex
		{Path=3,Type=2,ID=8557,Icon=005250,BuffType=8,MinLevel=14},		--Leaping Alteration
		{Path=3,Type=2,ID=8563,Icon=005158,BuffType=5,MinLevel=18},		--Demon Spittle
		{Path=3,Type=2,ID=8562,Icon=005232,BuffType=3,MinLevel=20}		--Dust of Pandemonium
	},
	{Path=3,Type=1,ID=8600,Icon=022704,BuffType=0,MinLevel=0},		--Sweeping Disgorgement
	{Path=3,Type=2,ID=8577,Icon=005162,BuffType=0,MinLevel=0},		--Ritual of Lunacy
	{Path=3,Type=1,ID=8601,Icon=022708,BuffType=2,MinLevel=0},		--Swirling Vortex
	{Path=3,Type=2,ID=8578,Icon=005110,BuffType=2,MinLevel=0},		--Chaotic Agitation
	{Path=3,Type=1,ID=8602,Icon=022706,BuffType=0,MinLevel=0},		--Tzeentch's Grip
	{Path=3,Type=2,ID=8579,Icon=005149,BuffType=8,MinLevel=0},		--Wind of Insanity
	{Path=3,Type=3,ID=8613,Icon=005247,BuffType=2,Rank=4,MinLevel=0}		--Windblock
	}
}

Warbuilder.Career[15].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=8550,Icon=005108,BuffType=0,MinLevel=1},		--Harbinger of Doom	
				{Type=2,ID=8558,Icon=005306,BuffType=8,MinLevel=3},		--Tzeentch's Cordial
				{Type=2,ID=8621,Icon=005116,BuffType=1,MinLevel=7},		--Chaotic Blur	
				{Type=2,ID=8555,Icon=005233,BuffType=3,MinLevel=10},	--Tzeentch Shall Remake You
--				{Type=2,ID=14414,Icon=023414,BuffType=0,MinLevel=10},	--Reinforce War Engine		
				{Type=2,ID=8554,Icon=005235,BuffType=2,MinLevel=16},	--Glimps of Chaos				
				{Type=2,ID=8622,Icon=005260,BuffType=8,MinLevel=21},	--Embrace the Warp
				{Type=2,ID=8559,Icon=005237,BuffType=5,MinLevel=25},	--Breath of Tzeentch				
--				{Type=2,ID=14415,Icon=023404,BuffType=0,MinLevel=30},	--Cleanse War Engine				
				{Type=2,ID=8567,Icon=005239,BuffType=8,MinLevel=40}		--Mark of Remaking
--				{Type=2,ID=14416,Icon=023415,BuffType=0,MinLevel=40}	--Shield the Skies						
				},
	Tactic = {
				{Type=1,ID=797,Icon=022714,BuffType=3,MinLevel=11},		--Warped Flesh			
				{Type=1,ID=585,Icon=022703,BuffType=0,MinLevel=13},		--Divine Fury
				{Type=1,ID=8591,Icon=022694,BuffType=0,MinLevel=15},	--Endless Gifts	
				{Type=1,ID=798,Icon=022714,BuffType=0,MinLevel=17},		--Tzeentch's Warding	
				{Type=1,ID=592,Icon=022706,BuffType=0,MinLevel=19},		--Discipline
				{Type=1,ID=8586,Icon=022709,BuffType=0,MinLevel=21},	--Scourged Warping
				{Type=1,ID=800,Icon=022714,BuffType=0,MinLevel=23},		--Backlash					
				{Type=1,ID=588,Icon=022709,BuffType=0,MinLevel=25},		--Subtlety	
				{Type=1,ID=8584,Icon=022706,BuffType=0,MinLevel=27},	--Warping the Spirit
				{Type=1,ID=589,Icon=022694,BuffType=0,MinLevel=29},		--Restorative Burst
				{Type=1,ID=8590,Icon=022704,BuffType=0,MinLevel=31},	--Blessing of Chaos					
				{Type=1,ID=8587,Icon=022708,BuffType=0,MinLevel=33},	--Empowered Alteration				
				{Type=1,ID=8588,Icon=022714,BuffType=0,MinLevel=35},	--By Tzeentch's Will!
				{Type=1,ID=8589,Icon=022706,BuffType=0,MinLevel=37},	--Drink Deeply
				{Type=1,ID=8585,Icon=022704,BuffType=0,MinLevel=39}		--Waves of Chaos
				
				
				},
	Morale = { 
				{Type=3,ID=694,Icon=023151,BuffType=3,Rank=1,MinLevel=8},	--Divine Favor
				{Type=3,ID=690,Icon=023155,BuffType=0,Rank=1,MinLevel=16},	--Steal Life					
				{Type=3,ID=8605,Icon=005118,BuffType=1,Rank=1,MinLevel=28},	--Tzeentch's Talon			
				{Type=3,ID=692,Icon=023154,BuffType=0,Rank=2,MinLevel=12},	--Rampaging Siphon
				{Type=3,ID=695,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=8606,Icon=005134,BuffType=3,Rank=2,MinLevel=32},	--Eye of Sheerian
				{Type=3,ID=696,Icon=023152,BuffType=0,Rank=3,MinLevel=24},	--Divine Protection
				{Type=3,ID=8607,Icon=005135,BuffType=2,Rank=3,MinLevel=36},	--Suppressing The Fragile Unbelivers (STFU)
				{Type=3,ID=697,Icon=023150,BuffType=0,Rank=4,MinLevel=40}	--Alter Fate									
			}
}

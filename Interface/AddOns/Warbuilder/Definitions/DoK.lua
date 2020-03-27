
--==DoK==--
Warbuilder.Career[23] = { CareerIcon=20186, ID=106, Line=23, Build=190813.1}
Warbuilder.Career[23].Path = {
{Core={ Icon=005113,				--Path of Dark Rites
		{Path=1,Type=2,ID=9548,Icon=010935,BuffType=3,MinLevel=1},		--Restore Essence
		{Path=1,Type=2,ID=9568,Icon=010934,BuffType=2,MinLevel=1},		--Fist of Khaine
		{Path=1,Type=2,ID=9553,Icon=011001,BuffType=3,MinLevel=8},		--Khaine's Invigoration
		{Path=1,Type=2,ID=9563,Icon=010951,BuffType=0,MinLevel=14},		--Covenant of Tenacity
		{Path=1,Type=2,ID=9556,Icon=010944,BuffType=3,MinLevel=16},		--Patch Wounds		
		{Path=1,Type=2,ID=9557,Icon=010945,BuffType=3,MinLevel=20}		--Khaine's Embrace
		},
	{Path=1,Type=1,ID=9595,Icon=022702,BuffType=0,MinLevel=0},		--Khaine's Bounty
	{Path=1,Type=2,ID=9574,Icon=010957,BuffType=8,MinLevel=0},		--Soul Shielding
	{Path=1,Type=1,ID=9596,Icon=022709,BuffType=0,MinLevel=0},		--Restored Motivation
	{Path=1,Type=2,ID=9573,Icon=010956,BuffType=8,MinLevel=0},		--Khaine's Vigor
	{Path=1,Type=1,ID=9597,Icon=022708,BuffType=0,MinLevel=0},		--Efficient Patching
	{Path=1,Type=2,ID=9579,Icon=011002,BuffType=2,MinLevel=0},		--Khaine's Refreshment
	{Path=1,Type=3,ID=9616,Icon=010965,BuffType=0,Rank=4,MinLevel=0}		--Thousand and One Dark Blessings
	},	
{Core={ Icon=005237,				--Path of Torture
		{Path=2,Type=2,ID=9552,Icon=010939,BuffType=2,MinLevel=1},		--Cleave Soul
		{Path=2,Type=2,ID=9551,Icon=010938,BuffType=6,MinLevel=5},		--Lacerate
		{Path=2,Type=2,ID=9549,Icon=010936,BuffType=6,MinLevel=9},		--Flay
		{Path=2,Type=2,ID=9566,Icon=010954,BuffType=2,MinLevel=12},		--Essence Lash
		{Path=2,Type=2,ID=9559,Icon=010947,BuffType=0,MinLevel=18},		--Covenant of Celerity
		{Path=2,Type=2,ID=9575,Icon=010950,BuffType=6,MinLevel=21}		--Fell Sacrifice		
		},
	{Path=2,Type=1,ID=9598,Icon=022709,BuffType=0,MinLevel=0},		--Bloodthirst
	{Path=2,Type=2,ID=9580,Icon=011003,BuffType=2,MinLevel=0},		--Sanguinary Extension
	{Path=2,Type=1,ID=9586,Icon=022704,BuffType=0,MinLevel=0},		--Murderous Intent	
	{Path=2,Type=2,ID=2938,Icon=011045,BuffType=0,MinLevel=0},		--Drowning in Blood	
	{Path=2,Type=1,ID=9602,Icon=022706,BuffType=0,MinLevel=0},		--Curse of Khaine
	{Path=2,Type=2,ID=2934,Icon=010964,BuffType=2,MinLevel=0},		--Execute
	{Path=2,Type=3,ID=9617,Icon=010966,BuffType=2,Rank=4,MinLevel=0}		--Vision of Torment		
	},
{Core={ Icon=005236,				--Path of Sacrifice

		{Path=3,Type=2,ID=2933,Icon=010940,BuffType=2,MinLevel=1},		--Consume Essence
		{Path=3,Type=2,ID=9560,Icon=010948,BuffType=6,MinLevel=2},		--Consume Strength
		{Path=3,Type=2,ID=9567,Icon=010955,BuffType=0,MinLevel=4},		--Covenant of Vitality
		{Path=3,Type=2,ID=9554,Icon=010941,BuffType=2,MinLevel=8},		--Rend Soul
		{Path=3,Type=2,ID=2953,Icon=011018,BuffType=8,MinLevel=16},		--Blood Guard		
		{Path=3,Type=2,ID=9577,Icon=010960,BuffType=6,MinLevel=22},		--Warding Strike		
		{Path=3,Type=2,ID=9562,Icon=010961,BuffType=2,MinLevel=30},		--Transfer Essence
		{Path=3,Type=2,ID=2941,Icon=011033,BuffType=4,MinLevel=32},		--Blood of my Blood		
		{Path=3,Type=2,ID=9565,Icon=010953,BuffType=6,MinLevel=35}		--Consume Thoughts
	},
	{Path=3,Type=1,ID=9599,Icon=022708,BuffType=0,MinLevel=0},		--Horrifying Offering
	{Path=3,Type=2,ID=9581,Icon=011004,BuffType=2,MinLevel=0},		--Pillage Essence
	{Path=3,Type=1,ID=9603,Icon=022712,BuffType=0,MinLevel=0},		--Gift of Khaine
	{Path=3,Type=2,ID=9578,Icon=010958,BuffType=2,MinLevel=0},		--Devour Essence
	{Path=3,Type=1,ID=9600,Icon=022706,BuffType=0,MinLevel=0},		--Empowered Transfer
	{Path=3,Type=2,ID=2952,Icon=011043,BuffType=4,MinLevel=0},		--Soul Ward
	{Path=3,Type=3,ID=9618,Icon=010967,BuffType=2,Rank=4,MinLevel=0}		--Chant of Pain
	}
}

Warbuilder.Career[23].Core = {
	Ability = {
				{Type=2,ID=245,Icon=005004,BuffType=0,MinLevel=1},		--Flee
				{Type=2,ID=9561,Icon=010949,BuffType=0,MinLevel=1},		--Bloody Offering
				{Type=2,ID=9550,Icon=010937,BuffType=8,MinLevel=3},		--Soul Infusion
				{Type=2,ID=9555,Icon=010942,BuffType=1,MinLevel=7},		--Terrifying Vison
				{Type=2,ID=9558,Icon=010946,BuffType=3,MinLevel=10},	--Stand, Coward!
--				{Type=2,ID=14414,Icon=023414,BuffType=0,MinLevel=10},	--Reinforce War Engine
				{Type=2,ID=2961,Icon=011040,BuffType=0,MinLevel=18},	--Unyeilding Tormentor
				{Type=2,ID=9569,Icon=005188,BuffType=2,MinLevel=25},	--Consume Enchantment
--				{Type=2,ID=14415,Icon=023404,BuffType=0,MinLevel=30},	--Cleanse War Engine
				{Type=2,ID=9564,Icon=010952,BuffType=1,MinLevel=40}		--Uncaring Dismissal
--				{Type=2,ID=14416,Icon=023415,BuffType=0,MinLevel=40}	--Shield the Skies
				},
	Tactic = {
				{Type=1,ID=841,Icon=022712,BuffType=0,MinLevel=11},		--Dark Blessings
				{Type=1,ID=585,Icon=022703,BuffType=0,MinLevel=13},	--Divine Fury
				{Type=1,ID=9588,Icon=022702,BuffType=0,MinLevel=15},	--Khaine's Blessing
				{Type=1,ID=839,Icon=022712,BuffType=0,MinLevel=17},		--Alignment of Naggaroth
				{Type=1,ID=592,Icon=022706,BuffType=0,MinLevel=19},		--Discipline
				{Type=1,ID=9584,Icon=022708,BuffType=0,MinLevel=21},	--Khaine's Imbuement
				{Type=1,ID=840,Icon=022712,BuffType=9,MinLevel=23},		--Bathing In Blood
				{Type=1,ID=588,Icon=022709,BuffType=0,MinLevel=25},		--Subtlety
				{Type=1,ID=9585,Icon=022706,BuffType=0,MinLevel=27},	--Bound by Blood
				{Type=1,ID=589,Icon=022694,BuffType=0,MinLevel=29},		--Restorative Burst
				{Type=1,ID=9591,Icon=022706,BuffType=0,MinLevel=31},	--Terrifying aura
				{Type=1,ID=9590,Icon=022694,BuffType=0,MinLevel=33},	--Potent Covenants
				{Type=1,ID=9601,Icon=022694,BuffType=0,MinLevel=35},	--Bleed Out
				{Type=1,ID=9587,Icon=022708,BuffType=0,MinLevel=37},	--Fueled Action
				{Type=1,ID=9589,Icon=022706,BuffType=0,MinLevel=39}		--Transfered Focus
				},
	Morale = { 
				{Type=3,ID=694,Icon=023151,BuffType=3,Rank=1,MinLevel=8},	--Divine Favor
				{Type=3,ID=690,Icon=023155,BuffType=0,Rank=1,MinLevel=16},	--Steal Life
				{Type=3,ID=9605,Icon=010962,BuffType=3,Rank=1,MinLevel=28},	--Life's End
				{Type=3,ID=692,Icon=023154,BuffType=0,Rank=2,MinLevel=12},	--Rampaging Siphon
				{Type=3,ID=695,Icon=023153,BuffType=0,Rank=2,MinLevel=20},	--Focused Mind
				{Type=3,ID=9607,Icon=010989,BuffType=0,Rank=2,MinLevel=32},	--Khaine's Withdrawal
				{Type=3,ID=696,Icon=023152,BuffType=0,Rank=3,MinLevel=24},	--Divine Protection
				{Type=3,ID=9606,Icon=010963,BuffType=2,Rank=3,MinLevel=36},	--Universal Confusion
				{Type=3,ID=697,Icon=023150,BuffType=0,Rank=4,MinLevel=40}	--Alter Fate			
			}
}

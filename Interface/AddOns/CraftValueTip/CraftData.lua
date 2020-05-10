--[[
  Crafting Info Tooltip v1.5.3

  Crafting Info Tooltip (CraftValueTip) is an addon for Warhammer: Age of 
  Reckoning which displays the hidden stats on crafting items as part of the 
  tooltip.

  This file, CraftData.lua, defines all of the data other than simple string
  constants that the mod uses to create its output.
]]--

--d("Data")


--Controls sort order of stats
CraftValueTip.BonusPreference={
  [1]=0,
  [2]=15,
  [3]=7,
  [4]=6,
  [5]=1,
  [6]=2,
  [7]=3,
  [8]=4,
  [9]=10,
  [10]=12,
  [11]=14,
  [12]=11,
}

--Apothecary effects
CraftValueTip.ApothEffectList={
  [1]="heal",
  [2]="regen",
  [3]="ap",
  [4]="str",
  [5]="int",
  [6]="wil",
  [7]="tou",
  [8]="rskill",
  [9]="shabs",
  [10]="rcorp",
  [11]="rele",
  [12]="rspi",
  [13]="arm",
  [14]="shdmg",
  [15]="dmg",
  [16]="dmgaoe",
  [17]="dmgcone",
  [18]="snare",
  [21]="hytoucrit",
  [22]="hystrmelee",
  [23]="hywillheal",
  [24]="hystrheal",
  [25]="hyintmcrit",
  [26]="hyaccrcrit",
  [27]="hywoumelee",
  [28]="hywoucrit",
  [29]="hywoumcrit",
  [30]="hywourcrit",
  [31]="hywouheal",
  [32]="hywoustr",
  [33]="hyresist",
  [34]="hywouarmpen",
  [35]="hywouinit",
  [36]="hytounocrit",
  [37]="hyhpregencritdmg",
  [38]="hywsarmpen",
  [41]="trapoth",
  [42]="trcult",
  [43]="trsalv",
  [44]="trtal",
  [45]="rez",
  [46]="morale",
	[51]="dyeyellow", --Yellow
	[52]="dyebrown",  --Brown
	[53]="dyegreen",  --Green
	[54]="dyeblue",   --Blue
	[55]="dyered",    --Red
	[56]="dyepurple", --Purple
  [57]="dyedarkpeach", --dark peach
  [59]="dyedarkred", -- dark red
  [60]="dyedarkblue", --dark sea blue
  [61]="dyedarkpurple", --dark purple
  [62]="dyedarkivory", --dark ivory     
	[1101]="autoheal", --Reactive Heal
	[1102]="freecast", --Clearcast chance
	[1103]="autoheal", --Reactive Heal
	[1104]="freecast", --Clearcast chance
	[1105]="autoheal", --Reactive Heal
	[1106]="freecast", --Clearcast chance
	[1107]="autoheal", --Reactive Heal
	[1108]="freecast", --Clearcast chance
	[1109]="pet", --Summon lion
	[1110]="movespeed", --Move speed (immediate)
	
}

--Apothecary effect tiers by stat effect number
CraftValueTip.ApothEffectTier={
	[1101]=1, --Reactive Heal
	[1102]=1, --Clearcast chance
	[1103]=2, --Reactive Heal
	[1104]=2, --Clearcast chance
	[1105]=3, --Reactive Heal
	[1106]=3, --Clearcast chance
	[1107]=4, --Reactive Heal
	[1108]=4, --Clearcast chance
}

--Talisman effects by stat effect number
CraftValueTip.TalEffectList={
  [407]="arm", --Armor
  [5]="rcorp", --Corp Resist
  [9]="rele", --Ele Resist
  [13]="rspi", --Spi Resist
  [3925]="tou", --Toughness
  [3965]="mskill", --Weapon Skill
  [3873]="rskill", --Ballistic
  [3924]="int", --Int
  [4097]="wil", --Willpower
  [3896]="str", --Strength
  [421]="ini", --Initiative
  [45]="wou", --Wounds
  [101]="crit", --Melee Crit
  [105]="rcrit", --Ranged Crit????????
  [109]="mgcrit", --Magic Crit
  [113]="mpower", --Melee Damage
  [117]="rpower", --Ranged Power
  [121]="mgpower", --Magic Damage
  [125]="hcrit", --Healing Crit
  [129]="hpower", --Healing Power
  [1001]="apdrain", --AP Drain on ability damage
  [1006]="reactspd", --Move speed on enemy ability damage
}

--Talisman effect tiers by stat effect number
CraftValueTip.TalEffectTier={
  [0]=0, --Armor
  [1]=1, --Armor
  [2]=2, --Armor
  [3]=3, --Armor
  [4]=4, --Armor
  [5]=1, --Corp Resist
  [6]=2, --Corp Resist
  [7]=3, --Corp Resist
  [8]=4, --Corp Resist
  [9]=1, --Ele Resist
  [10]=2, --Ele Resist
  [11]=3, --Ele Resist
  [12]=4, --Ele Resist
  [13]=1, --Spi Resist
  [14]=2, --Spi Resist
  [15]=3, --Spi Resist
  [16]=4, --Spi Resist
  [17]=1, --Toughness
  [18]=2, --Toughness
  [19]=3, --Toughness
  [20]=4, --Toughness
  [21]=1, --Ballistics
  [22]=2, --Ballistics
  [23]=3, --Ballistics
  [24]=4, --Ballistics
  [25]=1, --Weapon Skill
  [26]=2, --Weapon Skill
  [27]=3, --Weapon Skill
  [28]=4, --Weapon Skill
  [29]=1, --Intelligence
  [30]=2, --Intelligence
  [31]=3, --Intelligence
  [32]=4, --Intelligence
  [33]=1, --Willpower
  [34]=2, --Willpower
  [35]=3, --Willpower
  [36]=4, --Willpower
  [37]=1, --Strength
  [38]=2, --Strength
  [39]=3, --Strength
  [40]=4, --Strength
  [41]=1, --Initiative
  [42]=2, --Initiative
  [43]=3, --Initiative
  [44]=4, --Initiative
  [45]=1, --Wounds
  [46]=2, --Wounds
  [47]=3, --Wounds
  [48]=4, --Wounds
  [49]=0, --Ballistics
  [50]=0, --Intelligence
  [51]=0, --Willpower
  [52]=0, --Strength
  [101]=1, --Melee Crit
  [102]=2, --Melee Crit
  [103]=3, --Melee Crit
  [104]=4, --Melee Crit
  [105]=1, --Ranged Crit????????
  [106]=2, --Ranged Crit????????
  [107]=3, --Ranged Crit????????
  [108]=4, --Ranged Crit????????
  [109]=1, --Magic Crit
  [110]=2, --Magic Crit
  [111]=3, --Magic Crit
  [112]=4, --Magic Crit
  [113]=1, --Melee Damage
  [114]=2, --Melee Damage
  [115]=3, --Melee Damage
  [116]=4, --Melee Damage
  [117]=1, --Ranged Power
  [118]=2, --Ranged Power
  [119]=3, --Ranged Power
  [120]=3, --Ranged Power
  [121]=1, --Magic Damage
  [122]=2, --Magic Damage
  [123]=3, --Magic Damage
  [124]=4, --Magic Damage
  [125]=1, --Healing Crit
  [126]=2, --Healing Crit
  [127]=3, --Healing Crit
  [128]=4, --Healing Crit
  [129]=1, --Healing Power
  [130]=2, --Healing Power
  [131]=3, --Healing Power
  [132]=4, --Healing Power
  [1001]=1, --AP Drain on ability damage
  [1002]=2, --AP Drain on ability damage
  [1003]=3, --AP Drain on ability damage
  [1004]=4, --AP Drain on ability damage
  [1005]=5, --AP Drain on ability damage
  [1006]=1, --Move speed on enemy ability damage
  [1007]=2, --Move speed on enemy ability damage
  [1008]=3, --Move speed on enemy ability damage
  [1009]=4, --Move speed on enemy ability damage
  [1010]=5, --Move speed on enemy ability damage
}

--This actually is used by other mods, not CVT
CraftValueTip.ItemClasses = {
	[3] = {
		[1] = 1,
		[2] = 2,
		[3] = 2,
		[4] = 2,
		[5] = 1,
	},
	[4] = {
		[1] = 2,
		[2] = 1,
		[3] = 2,
		[4] = 2,
		[5] = 3,
		[6] = 3,
		[8] = 1,
		[9] = 2,
		[18] = 2,
	},
	[5] = {
		[13] = 3,
		[14] = 1,
		[15] = 2,
		[16] = 2,
		[17] = 2,
	},
}


--List of quality and effect/item type for each non-goldweed seed
CraftValueTip.SeedList={
--Purchased seeds
[190501]={"purch",false,"regen",83509,199901},
[190518]={"purch",false,"regen",83511,0},
[190532]={"purch",false,"regen",83516,0},
[190502]={"purch",false,"ap",83573,199901},
[190519]={"purch",false,"ap",83575,0},
[190533]={"purch",false,"ap",83579,0},
[190503]={"purch",false,"dmg",83861,199901},
[190520]={"purch",false,"dmg",83863,0},
[190534]={"purch",false,"dmg",83867,0},
[190504]={"purch",false,"dmgcone",83549,199901},
[190535]={"purch",false,"dmgcone",83555,0},
[84045]={"purch",false,"dmgcone",83551,0},
[190505]={"purch",false,"dmgaoe",83491,199901},
[190522]={"purch",false,"dmgaoe",83493,0},
[190536]={"purch",false,"dmgaoe",83497,0},
-- Extender
[3010020]={"std",true,"item3",3020020,199901},
[3010021]={"std",true,"item3",3020021,199901},
[3010022]={"std",true,"item3",3020022,199902},
[3010023]={"std",true,"item3",3020023,199902},
[3010024]={"std",true,"item3",3020024,199903},
[3010025]={"std",true,"item3",3020025,199903},
[3010026]={"std",true,"item3",3020026,199904},
[3010027]={"std",true,"item3",3020027,199904},
[3010028]={"std",true,"item3",3020028,199905},
-- Multiplier
[3010030]={"std",true,"item4",3020030,199901},
[3010031]={"std",true,"item4",3020031,199901},
[3010032]={"std",true,"item4",3020032,199902},
[3010033]={"std",true,"item4",3020033,199902},
[3010034]={"std",true,"item4",3020034,199903},
[3010035]={"std",true,"item4",3020035,199903},
[3010036]={"std",true,"item4",3020036,199904},
[3010037]={"std",true,"item4",3020037,199904},
[3010038]={"std",true,"item4",3020038,199905},
-- Stabilizer
[3010040]={"std",true,"item1",3020040,199901},
[3010041]={"std",true,"item1",3020041,199901},
[3010042]={"std",true,"item1",3020042,199902},
[3010043]={"std",true,"item1",3020043,199902},
[3010044]={"std",true,"item1",3020044,199903},
[3010045]={"std",true,"item1",3020045,199903},
[3010046]={"std",true,"item1",3020046,199904},
[3010047]={"std",true,"item1",3020047,199904},
[3010048]={"std",true,"item1",3020048,199905},
-- Stimulant
[84595]={"std",true,"item18",84340,199901},
[84596]={"std",true,"item18",84341,199901},
[84597]={"std",true,"item18",84342,199902},
[84598]={"std",true,"item18",84343,199902},
[84599]={"std",true,"item18",84344,199903},
[84600]={"std",true,"item18",84345,199903},
[84601]={"std",true,"item18",84346,199904},
[84602]={"std",true,"item18",84347,199904},
[84603]={"std",true,"item18",84348,199906},
-- Restoration
[84009]={"std",false,"regen",83508,199901},
[84010]={"std",false,"regen",83509,199901},
[84011]={"std",false,"regen",83510,199902},
[84012]={"std",false,"regen",83511,199902},
[84013]={"std",false,"regen",83512,199903},
[84014]={"std",false,"regen",83513,199903},
[84015]={"std",false,"regen",83514,199904},
[84016]={"std",false,"regen",83516,199904},
[84017]={"std",false,"regen",83516,199905},
-- Int
[84018]={"std",false,"int",83517,199901},
[84019]={"std",false,"int",83518,199901},
[84020]={"std",false,"int",83519,199902},
[84021]={"std",false,"int",83520,199902},
[84022]={"std",false,"int",83521,199903},
[84023]={"std",false,"int",83522,199903},
[84024]={"std",false,"int",83523,199904},
[84025]={"std",false,"int",83524,199904},
[84026]={"std",false,"int",83525,199905},
-- Wil
[84027]={"std",false,"wil",83526,199901},
[84028]={"std",false,"wil",83527,199901},
[84029]={"std",false,"wil",83528,199902},
[84030]={"std",false,"wil",83529,199902},
[84031]={"std",false,"wil",83530,199903},
[84032]={"std",false,"wil",83531,199903},
[84033]={"std",false,"wil",83532,199904},
[84034]={"std",false,"wil",83533,199904},
[84035]={"std",false,"wil",83534,199905},
-- Strength
[84036]={"std",false,"str",83535,199901},
[84037]={"std",false,"str",83536,199901},
[84038]={"std",false,"str",83537,199902},
[84039]={"std",false,"str",83538,199902},
[84040]={"std",false,"str",83539,199903},
[84041]={"std",false,"str",83540,199903},
[84042]={"std",false,"str",83541,199904},
[84043]={"std",false,"str",83542,199904},
[84044]={"std",false,"str",83543,199905},
-- Flame breath
[84045]={"std",false,"dmgcone",83544,199901},
[84046]={"std",false,"dmgcone",83545,199901},
[84047]={"std",false,"dmgcone",83546,199902},
[84048]={"std",false,"dmgcone",83547,199902},
[84049]={"std",false,"dmgcone",83548,199903},
[84050]={"std",false,"dmgcone",83549,199904},
[84051]={"std",false,"dmgcone",83550,199904},
[84052]={"std",false,"dmgcone",84551,199905},
-- AP
[84073]={"std",false,"ap",83572,199901},
[84074]={"std",false,"ap",83573,199901},
[84075]={"std",false,"ap",83574,199902},
[84076]={"std",false,"ap",83575,199902},
[84077]={"std",false,"ap",83576,199903},
[84078]={"std",false,"ap",83577,199903},
[84079]={"std",false,"ap",83578,199904},
[84080]={"std",false,"ap",83579,199904},
[84081]={"std",false,"ap",83580,199905},
-- Corp res
[3010000]={"std",false,"rcorp",3020000,199901},
[3010001]={"std",false,"rcorp",3020001,199901},
[3010002]={"std",false,"rcorp",3020002,199902},
[3010003]={"std",false,"rcorp",3020003,199902},
[3010004]={"std",false,"rcorp",3020004,199903},
[3010005]={"std",false,"rcorp",3020005,199903},
[3010006]={"std",false,"rcorp",3020006,199904},
[3010007]={"std",false,"rcorp",3020007,199904},
[3010008]={"std",false,"rcorp",3020008,199905},
-- Spirit res
[3010010]={"std",false,"rspi",3020010,199901},
[3010011]={"std",false,"rspi",3020011,199901},
[3010012]={"std",false,"rspi",3020012,199902},
[3010013]={"std",false,"rspi",3020013,199902},
[3010014]={"std",false,"rspi",3020014,199903},
[3010015]={"std",false,"rspi",3020015,199903},
[3010016]={"std",false,"rspi",3020016,199904},
[3010017]={"std",false,"rspi",3020017,199904},
[3010018]={"std",false,"rspi",3020018,199906},
-- Heal
[84235]={"std",false,"heal",83499,199901},
[84236]={"std",false,"heal",83500,199901},
[84237]={"std",false,"heal",83501,199902},
[84238]={"std",false,"heal",83502,199902},
[84239]={"std",false,"heal",83503,199903},
[84240]={"std",false,"heal",83504,199903},
[84241]={"std",false,"heal",83505,199904},
[84242]={"std",false,"heal",83506,199904},
[84243]={"std",false,"heal",83507,199905},
-- Ballistic
[84353]={"std",false,"rskill",83852,199901},
[84354]={"std",false,"rskill",83853,199901},
[84355]={"std",false,"rskill",83854,199902},
[84356]={"std",false,"rskill",83855,199902},
[84357]={"std",false,"rskill",83856,199903},
[84358]={"std",false,"rskill",83857,199903},
[84359]={"std",false,"rskill",83858,199904},
[84360]={"std",false,"rskill",83859,199904},
[84361]={"std",false,"rskill",84543,199905},
-- Molotov
[84054]={"std",false,"dmg",83860,199901},
[84055]={"std",false,"dmg",83861,199901},
[84056]={"std",false,"dmg",83862,199902},
[84057]={"std",false,"dmg",83863,199902},
[84058]={"std",false,"dmg",83864,199903},
[84059]={"std",false,"dmg",83865,199903},
[84060]={"std",false,"dmg",83866,199904},
[84061]={"std",false,"dmg",83867,199904},
[84062]={"std",false,"dmg",83868,199905},
-- Napalm
[84631]={"std",false,"dmgaoe",83490,199901},
[84632]={"std",false,"dmgaoe",83491,199901},
[84633]={"std",false,"dmgaoe",83492,199902},
[84634]={"std",false,"dmgaoe",83493,199902},
[84635]={"std",false,"dmgaoe",83494,199903},
[84636]={"std",false,"dmgaoe",83495,199903},
[84637]={"std",false,"dmgaoe",83496,199904},
[84638]={"std",false,"dmgaoe",83497,199904},
[84639]={"std",false,"dmgaoe",83498,199906},
-- Cookies
[199801]={"rare",false,"hytoucrit",199851,0},
[199802]={"rare",false,"hystrmelee",199852,0},
[199803]={"rare",false,"hywillheal",199853,0},
[199804]={"rare",false,"hystrheal",199854,0},
[199805]={"rare",false,"hyintmcrit",199855,0},
[199806]={"rare",false,"hyaccrcrit",199856,0},
[199807]={"rare",false,"hywoumelee",199857,0},
[199808]={"rare",false,"hywoucrit",199858,0},
[199809]={"rare",false,"hywoumcrit",199859,0},
[199810]={"rare",false,"hywourcrit",199860,0},
[199811]={"rare",false,"hywouheal",199861,0},
[199812]={"rare",false,"hywoustr",199862,0},
[2017642]={"rare",false,"hystrmelee",199852,0},
[2017643]={"rare",false,"hystrheal",199854,0},
[2017646]={"rare",false,"hywourcrit",199860,0},
[2017647]={"rare",false,"hywoustr",199864,0},
[2017648]={"rare",false,"hyaccrcrit",199856,0},
[2017649]={"rare",false,"hywillheal",199853,0},
[2017651]={"rare",false,"hyintmcrit",199855,0},
[2017641]={"rare",false,"hytoucrit",199851,0},
[2017650]={"rare",false,"hywoumcrit",199859,0},
[2017645]={"rare",false,"hywourcrit",199860,0},
-- Flame breath
[84045]={"std",false,"dmgcone",83544,199901},
[84046]={"std",false,"dmgcone",83545,199901},
[84047]={"std",false,"dmgcone",83546,199902},
[84048]={"std",false,"dmgcone",83547,199902},
[84049]={"std",false,"dmgcone",83548,199903},
[84050]={"std",false,"dmgcone",83549,199903},
[84051]={"std",false,"dmgcone",83550,199904},
[84052]={"std",false,"dmgcone",83551,199904},
[84053]={"std",false,"dmgcone",83552,199905},
}
-- This list contais crafting infos for RoR broken items missing key attributes
CraftValueTip.BrokenItems={
[1000276]={[6] = 33}, -- Primal defence
[1000284]={[6] = 30}, -- Primal frenzy
[1000281]={[6] = 36}, -- Primal Grace [+60 Toughness, -5% chance to be crit ]
[1000282]={[6] = 38}, -- Primal Alacrity [+60 Weapon Skill, -5% incoming armor penetration]
--[2017641]={[6] = 33}, -- Primal Alacrity [+60 Weapon Skill, -5% incoming armor penetration]
--[2017650]={[6] = 33}, -- Primal Alacrity [+60 Weapon Skill, -5% incoming armor penetration]

--[1000284]={[6] = 35}, -- Primal Vision [+60 Wounds & Initiative]
-- [1000284]={[6] = 32}, -- Primal Hunger [+60 Wounds & Strength]
-- [1000284]={[6] = 31}, -- Primal Affinity [+60 Wounds, +50 Healing Power]
}

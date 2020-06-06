-- ==========================================================================================================================
--   Various Globals
-- ==========================================================================================================================

HealGridGlobals = {};

HealGridGlobals.GUI_WIDGET_WIDTH = 450;

HealGridGlobals.FIRST_GROUP_MEMBER = 1;
HealGridGlobals.LAST_GROUP_MEMBER = 5;
HealGridGlobals.NUM_GROUP_MEMBERS = 5;

HealGridGlobals.FIRST_BATTLEGROUP = 1;
HealGridGlobals.LAST_BATTLEGROUP = 4;
HealGridGlobals.FIRST_BATTLEGROUP_MEMBER = 1;
HealGridGlobals.LAST_BATTLEGROUP_MEMBER = 6;

HealGridGlobals.FIRST_SCENARIOGROUP = 1;
HealGridGlobals.LAST_SCENARIOGROUP = 10;
HealGridGlobals.FIRST_SCENARIOGROUP_MEMBER = 1;
HealGridGlobals.LAST_SCENARIOGROUP_MEMBER = 6;

HealGridGlobals.DEFAULT_SKIN_ID = "MELLI_MEDIUM";

HealGridGlobals.HUD_GAP = 5;					-- the gap between the frame and the attached hud

HealGridGlobals.healthColor = 
          { healthy  = { r=000,									-- 100%
                         g=144,
                         b=000,
                         a=1, 
                         html='009000' },
            fair     = { r=000,                             	-- 80% - 100%
                         g=144,                             
                         b=000,                             
                         a=1, 
                         html='009000' },
            hurt     = { r=RMetColor.OLIVE.r, 					-- 60% - 80%
                         g=RMetColor.OLIVE.g, 
                         b=RMetColor.OLIVE.b, 
                         a=1, 
                         html=RMetColor.OLIVE.html },
            wounded  = { r=RMetColor.ORANGE.r, 		   		   	-- 40% - 60%
                         g=RMetColor.ORANGE.g,       
                         b=RMetColor.ORANGE.b,       
                         a=1, 
                         html=RMetColor.GOLD.html },
            poor     = { r=RMetColor.ORANGE_RED.r,    			-- 20% - 40%
                         g=RMetColor.ORANGE_RED.g,     
                         b=RMetColor.ORANGE_RED.b,     
                         a=1, 
                         html=RMetColor.DARK_ORANGE.html }, 
            critic   = { r=RMetColor.RED.r,		       		 	-- 0% - 20%
                         g=RMetColor.RED.g,        
                         b=RMetColor.RED.b,        
                         a=1, 
                         html=RMetColor.RED.html },
            dead     = { r=RMetColor.GRAY80.r,     				-- DEAD
                         g=RMetColor.GRAY80.g,        
                         b=RMetColor.GRAY80.b,        
                         a=1, 
                         html=RMetColor.GRAY80.html },
         };

HealGridGlobals.debuffFlagColor  =
	{	HEX =		{ r=RMetColor.LIME.r,    g=RMetColor.LIME.g,    b=RMetColor.LIME.b },
		DAMAGING =	{ r=RMetColor.MAROON.r,  g=RMetColor.MAROON.g,  b=RMetColor.MAROON.b },
		DEBUFF =	{ r=RMetColor.BLUE.r,    g=RMetColor.BLUE.g,    b=RMetColor.BLUE.b },
		AILMENT =	{ r=RMetColor.AQUA.r,    g=RMetColor.AQUA.g,    b=RMetColor.AQUA.b },
		CURSE =		{ r=RMetColor.MAGENTA.r, g=RMetColor.MAGENTA.g, b=RMetColor.MAGENTA.b },
		CRIPPLE =	{ r=RMetColor.YELLOW.r,  g=RMetColor.YELLOW.g,  b=RMetColor.YELLOW.b },
	};

HealGridGlobals.archColors = 
	{
		TANK  = { r=205, g=140, b=60  },	-- brown for tanks
		MPDPS = { r=255, g=80,  b=80  },	-- red for melee physical dps
		RPDPS = { r=255, g=180, b=0   },	-- orange for ranged physical dps
		RMDPS = { r=255, g=255, b=60  },	-- yellow for ranged magical dps
		MSUPP = { r=180, g=120, b=255 },	-- lavender for melee support
		RSUPP = { r=160, g=170, b=255 },	-- lightblue for ranged support
	};

HealGridGlobals.arches = 
	{
		[GameData.CareerLine.IRON_BREAKER] = "TANK",
		[GameData.CareerLine.SWORDMASTER] = "TANK",
		[GameData.CareerLine.CHOSEN] = "TANK",
		[GameData.CareerLine.BLACK_ORC] = "TANK",
		[GameData.CareerLine.CHOPPA] = "MPDPS",
		[GameData.CareerLine.SLAYER] = "MPDPS",
		[GameData.CareerLine.WITCH_HUNTER] = "MPDPS",
		[GameData.CareerLine.WHITE_LION] = "MPDPS",					-- White Lion (go figure?)
		[GameData.CareerLine.MARAUDER] = "MPDPS",				-- Marauder
		[GameData.CareerLine.WITCH_ELF] = "MPDPS",				-- Witch Elf
		[GameData.CareerLine.BRIGHT_WIZARD] = "RMDPS",
		[GameData.CareerLine.MAGUS] = "RMDPS",
		[GameData.CareerLine.SORCERER] = "RMDPS",
		[GameData.CareerLine.ENGINEER] = "RPDPS",
		[GameData.CareerLine.SHADOW_WARRIOR] = "RPDPS",
		[GameData.CareerLine.SQUIG_HERDER] = "RPDPS",
		[GameData.CareerLine.WARRIOR_PRIEST] = "MSUPP",
		[GameData.CareerLine.DISCIPLE] = "MSUPP",			-- Disciple of Khaine
		[GameData.CareerLine.ARCHMAGE] = "RSUPP",
		[GameData.CareerLine.SHAMAN] = "RSUPP",
		[GameData.CareerLine.RUNE_PRIEST] = "RSUPP",
		[GameData.CareerLine.ZEALOT] = "RSUPP",
		[GameData.CareerLine.KNIGHT] = "TANK",
		[GameData.CareerLine.BLACKGUARD] = "TANK",
	};

HealGridGlobals.careerMap =					-- maps 'character careers' to their defines
	{
		[24]  = GameData.CareerLine.BLACK_ORC,
		[25]  = GameData.CareerLine.CHOPPA,	
		[26]  = GameData.CareerLine.SHAMAN,
		[27]  = GameData.CareerLine.SQUIG_HERDER,

		[64]  = GameData.CareerLine.CHOSEN,
		[65]  = GameData.CareerLine.MARAUDER,
		[66]  = GameData.CareerLine.ZEALOT,
		[67]  = GameData.CareerLine.MAGUS,

		[104] = GameData.CareerLine.BLACKGUARD,
		[105] = GameData.CareerLine.WITCH_ELF,
		[106] = GameData.CareerLine.DISCIPLE,
		[107] = GameData.CareerLine.SORCERER,

		[20]  = GameData.CareerLine.IRON_BREAKER,
		[21]  = GameData.CareerLine.SLAYER,
		[22]  = GameData.CareerLine.RUNE_PRIEST,
		[23]  = GameData.CareerLine.ENGINEER,

		[60]  = GameData.CareerLine.WITCH_HUNTER,
		[61]  = GameData.CareerLine.KNIGHT,
		[62]  = GameData.CareerLine.BRIGHT_WIZARD,
		[63]  = GameData.CareerLine.WARRIOR_PRIEST,

		[100] = GameData.CareerLine.SWORDMASTER,
		[101] = GameData.CareerLine.SHADOW_WARRIOR,
		[102] = GameData.CareerLine.WHITE_LION,
		[103] = GameData.CareerLine.ARCHMAGE,
	};

HealGridGlobals.gridCareerOrder =			-- order in which to display the careers in the grid
	{
		-- destruction
		[1]   = GameData.CareerLine.BLACK_ORC,
		[4]   = GameData.CareerLine.CHOPPA,	
		[11]  = GameData.CareerLine.SHAMAN,
		[8]  = GameData.CareerLine.SQUIG_HERDER,

		[2]  = GameData.CareerLine.CHOSEN,
		[5]  = GameData.CareerLine.MARAUDER,
		[12] = GameData.CareerLine.ZEALOT,
		[9] = GameData.CareerLine.MAGUS,

		[3]  = GameData.CareerLine.BLACKGUARD,
		[6]  = GameData.CareerLine.WITCH_ELF,
		[7] = GameData.CareerLine.DISCIPLE,
		[10] = GameData.CareerLine.SORCERER,

		-- order
		[13]  = GameData.CareerLine.IRON_BREAKER,
		[16] = GameData.CareerLine.SLAYER,
		[23] = GameData.CareerLine.RUNE_PRIEST,
		[20] = GameData.CareerLine.ENGINEER,

		[14]  = GameData.CareerLine.WITCH_HUNTER,
		[17] = GameData.CareerLine.KNIGHT,
		[24] = GameData.CareerLine.WARRIOR_PRIEST,
		[21] = GameData.CareerLine.BRIGHT_WIZARD,

		[15]  = GameData.CareerLine.SWORDMASTER,
		[18] = GameData.CareerLine.SHADOW_WARRIOR,
		[19] = GameData.CareerLine.WHITE_LION,
		[22] = GameData.CareerLine.ARCHMAGE,
	};

HealGridGlobals.gridArchOrder = 
	{
		[1] = "TANK",
		[2] = "MSUPP",
		[3] = "MPDPS",
		[4] = "RPDPS",
		[5] = "RMDPS",
		[6] = "RSUPP",
	};

-- KEEP in sync with SystemData.TargetObjectType!!!
HealGridGlobals.UnitTargetType =
	{
		NONE							= SystemData.TargetObjectType.NONE,
		SELF							= SystemData.TargetObjectType.SELF,
		ALLY_PLAYER						= SystemData.TargetObjectType.ALLY_PLAYER,
		ALLY_NON_PLAYER					= SystemData.TargetObjectType.ALLY_NON_PLAYER,
		ENEMY_PLAYER					= SystemData.TargetObjectType.ENEMY_PLAYER,
		ENEMY_NON_PLAYER				= SystemData.TargetObjectType.ENEMY_NON_PLAYER,
		STATIC							= SystemData.TargetObjectType.STATIC,
		STATIC_ATTACKABLE				= SystemData.TargetObjectType.STATIC_ATTACKABLE,
		ENEMY_NON_PLAYER_NON_AGGRESSIVE	= 100,
		ALLY_PET						= 101,
	};

HealGridGlobals.UnitTargetTypeColor =
	{
		[HealGridGlobals.UnitTargetType.NONE]								= 'BLACK',
		[HealGridGlobals.UnitTargetType.SELF]								= 'LIME',
		[HealGridGlobals.UnitTargetType.ALLY_PLAYER]						= 'LIME',
		[HealGridGlobals.UnitTargetType.ALLY_NON_PLAYER]					= 'GREEN',
		[HealGridGlobals.UnitTargetType.ENEMY_PLAYER]						= 'RED',
		[HealGridGlobals.UnitTargetType.ENEMY_NON_PLAYER]					= 'DARK_RED',
		[HealGridGlobals.UnitTargetType.STATIC]								= 'IVORY',
		[HealGridGlobals.UnitTargetType.STATIC_ATTACKABLE]					= 'MISTY_ROSE',
		[HealGridGlobals.UnitTargetType.ENEMY_NON_PLAYER_NON_AGGRESSIVE]	= 'ORANGE',
		[HealGridGlobals.UnitTargetType.ALLY_PET]							= 'LIME',
	};

-- KEEP in sync with GameData.ConTypes!!!
HealGridGlobals.UnitConType =
	{
		NO_LEVEL	= GameData.ConType.NO_LEVEL,
		TRIVIAL		= GameData.ConType.TRIVIAL,
		EFFORTLESS	= GameData.ConType.EFFORTLESS,
		EASY		= GameData.ConType.EASY,
		EQUAL		= GameData.ConType.EQUAL,
		CHALLENGING	= GameData.ConType.CHALLENGING,
		DANGEROUS	= GameData.ConType.DANGEROUS,
		DEADLY		= GameData.ConType.DEADLY,
		FRIENDLY	= GameData.ConType.FRIENDLY,
	};

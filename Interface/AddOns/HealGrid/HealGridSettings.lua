-- ========================================================================================================
-- The (saved) settings
-- ========================================================================================================

HealGridSettings = {};

-- ========================================================================================================
-- The default values
-- ========================================================================================================

HealGridSettingsDefault = {};

HealGridSettingsDefault.version = 01000000;						--vMM.RRR.mmm

-- NOTE: settings in the career must be defined "oustside" too, as HealGrid.SettingSet() checks if the setting exists!
HealGridSettingsDefault._careers =
	{
		[GameData.CareerLine.ARCHMAGE]			= { rangeScanFriendlyAbility = 9236,				-- Healing Energy 
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = { 
														AILMENT=true, CRIPPLE=false, CURSE=false, DAMAGING=false, DEBUFF=false, HEX=true, 
													},
												  },
		[GameData.CareerLine.WITCH_ELF]			= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.BLACK_ORC]			= { rangeScanFriendlyAbility = 1674,				-- Save Da Runts						(level 10!)
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.DISCIPLE]		= { rangeScanFriendlyAbility = 9548,				-- Restore Essence 
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = { 
														AILMENT=true, CRIPPLE=false, CURSE=false, DAMAGING=false, DEBUFF=false, HEX=true, 
													},
												  },
		[GameData.CareerLine.BRIGHT_WIZARD]		= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = { 
														AILMENT=true, CRIPPLE=false, CURSE=true, DAMAGING=false, DEBUFF=false, HEX=true, 
													},
												  },
		[GameData.CareerLine.CHOSEN]			= { rangeScanFriendlyAbility = 8325,				-- Guard (Chosen)						(level 10!)
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.CHOPPA]			= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.ENGINEER]			= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.IRON_BREAKER]		= { rangeScanFriendlyAbility = 1353,				-- Oath Friend 
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.KNIGHT]			= { rangeScanFriendlyAbility = 8013,				-- Guard (Knight of the Blazing Sun)	(level 10!)
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.MAGUS]				= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.RUNE_PRIEST]		= { rangeScanFriendlyAbility = 1587,				-- Grungni's Gift
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = { 
														AILMENT=true, CRIPPLE=false, CURSE=true, DAMAGING=false, DEBUFF=false, HEX=false, 
													},
												  },
		[GameData.CareerLine.WHITE_LION]		= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.BLACKGUARD]				= { rangeScanFriendlyAbility = 9325,				-- Guard (Black Guard)					(level 10!)
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.SHADOW_WARRIOR]	= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.SHAMAN]			= { rangeScanFriendlyAbility = 1898,				-- Gork'll Fix It
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = { 
														AILMENT=true, CRIPPLE=false, CURSE=true, DAMAGING=false, DEBUFF=false, HEX=false, 
													},
												  },
		[GameData.CareerLine.SLAYER]			= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.SORCERER]			= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.SQUIG_HERDER]		= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.SWORDMASTER]		= { rangeScanFriendlyAbility = 9008,				-- Guard (Swordmaster)					(level 10!)
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.MARAUDER]			= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.WARRIOR_PRIEST]	= { rangeScanFriendlyAbility = 8238,				-- Divine Aid 
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = { 
														AILMENT=false, CRIPPLE=false, CURSE=true, DAMAGING=false, DEBUFF=false, HEX=true, 
													},
												  },
		[GameData.CareerLine.WITCH_HUNTER]		= { rangeScanFriendlyAbility = nil,					-- no spell, take default from below
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = nil,
												  },
		[GameData.CareerLine.ZEALOT]			= { rangeScanFriendlyAbility = 8569,				-- Flash Of Chaos 
													rangeScanHostileAbility = nil,
													rangeScanResurrectAbility = nil,
													dispellableDebuffFlags = { 
														AILMENT=false, CRIPPLE=false, CURSE=true, DAMAGING=false, DEBUFF=false, HEX=true, 
													},
												  },
	};    

HealGridSettingsDefault.useColoredLabels = true;

HealGridSettingsDefault.rangeScanStatus = true;
HealGridSettingsDefault.rangeScanFriendlyAbility = 0;
HealGridSettingsDefault.rangeScanHostileAbility = 0;
HealGridSettingsDefault.rangeScanResurrectAbility = 0;
HealGridSettingsDefault.rangeScanData =
	{
		UNIT_IN_RANGE		= { TIME_PALE = 5, TIME_FADE = 10, COLOR_HARD='LAWN_GREEN',	COLOR_SOFT="LIME_GREEN",	},
		UNIT_OUT_OF_RANGE	= { TIME_PALE = 5, TIME_FADE = 10, COLOR_HARD='MAGENTA',	COLOR_SOFT="PURPLE",		},
		UNIT_OUT_OF_REACH	= { TIME_PALE = 5, TIME_FADE = 10, COLOR_HARD='WHITE',		COLOR_SOFT="GRAY",			},
		UNIT_UNKNOWN_RANGE	= { TIME_PALE = 5, TIME_FADE = 10, COLOR_HARD='BLACK',		COLOR_SOFT="BLACK",			},
	};

HealGridSettingsDefault.trackedBuffs = {};						-- [(string)buffName] = {(wstring)buffName,duration,sign,warnExpire,warnExpireSign}

HealGridSettingsDefault.mouseClickMap =
	{
		UNIT_ANY_LMB_ANY = { frameType='UNIT',	targetType='ANY',	mouseButton='LMB',	modifierKey='ANY',	action='TARGET',	actionDetail=nil },
		UNIT_ANY_MMB_ANY = { frameType='UNIT',	targetType='ANY',	mouseButton='MMB',	modifierKey='ANY',	action='ASSIST',	actionDetail=nil },
		UNIT_ANY_RMB_ANY = { frameType='UNIT',	targetType='ANY',	mouseButton='RMB',	modifierKey='ANY',	action='UNITMENU',	actionDetail=nil },
	};

HealGridSettingsDefault.dispellableDebuffFlags = { AILMENT=false, CRIPPLE=false, CURSE=false, DAMAGING=false, DEBUFF=false, HEX=false, };

HealGridSettingsDefault.playCareerPointSound = false;

-- HUD
HealGridSettingsDefault.hudSkin = HealGridGlobals.DEFAULT_SKIN_ID;
HealGridSettingsDefault.hudUnitFrameWidthAdjust = 0;
HealGridSettingsDefault.hudUnitFrameHeightAdjust = 0;
HealGridSettingsDefault.hudShowPlayerDebuffFlags = 'ALL';
HealGridSettingsDefault.hudShowFriendlyTargetDebuffFlags = 'ALL';
HealGridSettingsDefault.hudShowHostileTargetDebuffFlags = 'ALL';
HealGridSettingsDefault.hudStayHidden = false;
HealGridSettingsDefault.hudUpdateThrottle = 0.2;
HealGridSettingsDefault.hudBuffUpdateThrottle = 0.2;
HealGridSettingsDefault.hudShowPetFrames = true;
HealGridSettingsDefault.hudTwoLineBars = false;
HealGridSettingsDefault.hudPlayerBuffsFilter = 'ALL';					-- ALL / SELFCAST / NONE
HealGridSettingsDefault.hudPlayerDebuffsFilter = 'ALL';					-- ALL / DISPELLABLE / SELFCAST / NONE
HealGridSettingsDefault.hudFriendlyTargetBuffsFilter = 'ALL';
HealGridSettingsDefault.hudFriendlyTargetDebuffsFilter = 'ALL';
HealGridSettingsDefault.hudHostileTargetBuffsFilter = 'ALL';
HealGridSettingsDefault.hudHostileTargetDebuffsFilter = 'ALL';
HealGridSettingsDefault.hudShowBuffsMax = 7;
HealGridSettingsDefault.hudBuffFrameSizeAdjust = 0;
HealGridSettingsDefault.hudShowHostileTargetName = true;
HealGridSettingsDefault.hudHideWARPlayerFrame = false;
HealGridSettingsDefault.hudHideWARTargetFrame = false;
HealGridSettingsDefault.hudHideWARCastBar = false;
HealGridSettingsDefault.hudHideWARCareerPointsFrame = false;
HealGridSettingsDefault.hudShowCareerLineIcon = 'SKIN';						-- SKIN / SHOW / HIDE
HealGridSettingsDefault.hudShowHealthPointsBar = 'SKIN';					-- SKIN / SHOW / HIDE
HealGridSettingsDefault.hudShowActionPointsBar = 'SKIN';					-- SKIN / SHOW / HIDE
HealGridSettingsDefault.hudShowMoraleLevelBar = 'SKIN';						-- SKIN / SHOW / HIDE

-- group
HealGridSettingsDefault.groupSkin = HealGridGlobals.DEFAULT_SKIN_ID;
HealGridSettingsDefault.groupUnitFrameWidthAdjust = 0;
HealGridSettingsDefault.groupUnitFrameHeightAdjust = 0;
HealGridSettingsDefault.groupHideWARGroupFrame = true;
HealGridSettingsDefault.hideGroupInBattlegroup = true;
HealGridSettingsDefault.hideGroupInScenariogroup = true;
HealGridSettingsDefault.groupShowDebuffFlags = 'ALL';
HealGridSettingsDefault.groupShowAvatar = false;
HealGridSettingsDefault.groupShowHUD = false;
HealGridSettingsDefault.groupShowPets = false;
HealGridSettingsDefault.groupStayHidden = false;
HealGridSettingsDefault.groupGridGrouping = 'SKIN';							-- SKIN / GROUP / ARCH / CAREER
HealGridSettingsDefault.groupGridOrientation = 'SKIN';						-- SKIN / HORIZONTAL / VERTICAL
HealGridSettingsDefault.groupGridGrowth = 'SKIN';							-- SKIN / DOWN / UP
HealGridSettingsDefault.groupUpdateThrottle = 0.2;
HealGridSettingsDefault.groupBuffUpdateThrottle = 0.2;
HealGridSettingsDefault.groupShowCareerLineIcon = 'SKIN';					-- SKIN / SHOW / HIDE
HealGridSettingsDefault.groupShowHealthPointsBar = 'SKIN';					-- SKIN / SHOW / HIDE
HealGridSettingsDefault.groupShowActionPointsBar = 'SKIN';					-- SKIN / SHOW / HIDE
HealGridSettingsDefault.groupShowMoraleLevelBar = 'SKIN';					-- SKIN / SHOW / HIDE

-- battlegroup
HealGridSettingsDefault.battlegroupSkin = HealGridGlobals.DEFAULT_SKIN_ID;
HealGridSettingsDefault.battlegroupUnitFrameWidthAdjust = 0;
HealGridSettingsDefault.battlegroupUnitFrameHeightAdjust = 0;
HealGridSettingsDefault.battlegroupHideWARWarbandFrames = true;
HealGridSettingsDefault.battlegroupShowDebuffFlags = 'ALL';
HealGridSettingsDefault.battlegroupShowHUD = false;
HealGridSettingsDefault.battlegroupStayHidden = false;
HealGridSettingsDefault.battlegroupGridGrouping = 'SKIN';						-- SKIN / GROUP / ARCH / CAREER
HealGridSettingsDefault.battlegroupGridOrientation = 'SKIN';					-- SKIN / HORIZONTAL / VERTICAL
HealGridSettingsDefault.battlegroupGridGrowth = 'SKIN';							-- SKIN / DOWN / UP
HealGridSettingsDefault.battlegroupUpdateThrottle = 0.2;
HealGridSettingsDefault.battlegroupBuffUpdateThrottle = 0.2;
HealGridSettingsDefault.battlegroupShowCareerLineIcon = 'SKIN';					-- SKIN / SHOW / HIDE
HealGridSettingsDefault.battlegroupShowHealthPointsBar = 'SKIN';				-- SKIN / SHOW / HIDE
HealGridSettingsDefault.battlegroupShowActionPointsBar = 'SKIN';				-- SKIN / SHOW / HIDE
HealGridSettingsDefault.battlegroupShowMoraleLevelBar = 'SKIN';					-- SKIN / SHOW / HIDE

-- scenariogroup
HealGridSettingsDefault.scenariogroupSkin = HealGridGlobals.DEFAULT_SKIN_ID;
HealGridSettingsDefault.scenariogroupUnitFrameWidthAdjust = 0;
HealGridSettingsDefault.scenariogroupUnitFrameHeightAdjust = 0;
HealGridSettingsDefault.scenariogroupHideWARGroupFrame = true;
HealGridSettingsDefault.scenariogroupShowDebuffFlags = 'ALL';
HealGridSettingsDefault.scenariogroupShowHUD = false;
HealGridSettingsDefault.scenariogroupStayHidden = false;
HealGridSettingsDefault.scenariogroupGridGrouping = 'SKIN';						-- SKIN / GROUP / ARCH / CAREER
HealGridSettingsDefault.scenariogroupGridOrientation = 'SKIN';					-- SKIN / HORIZONTAL / VERTICAL
HealGridSettingsDefault.scenariogroupGridGrowth = 'SKIN';						-- SKIN / DOWN / UP
HealGridSettingsDefault.scenariogroupUpdateThrottle = 0.2;
HealGridSettingsDefault.scenariogroupBuffUpdateThrottle = 0.2;
HealGridSettingsDefault.scenariogroupNumGroupsDisplayed = 10;
HealGridSettingsDefault.scenariogroupCollapseGroups = true;
HealGridSettingsDefault.scenariogroupShowUngroupedPlayers = true;
HealGridSettingsDefault.scenariogroupShowCareerLineIcon = 'SKIN';				-- SKIN / SHOW / HIDE
HealGridSettingsDefault.scenariogroupShowHealthPointsBar = 'SKIN';				-- SKIN / SHOW / HIDE
HealGridSettingsDefault.scenariogroupShowActionPointsBar = 'SKIN';				-- SKIN / SHOW / HIDE
HealGridSettingsDefault.scenariogroupShowMoraleLevelBar = 'SKIN';				-- SKIN / SHOW / HIDE

-- (unit) tooltip
HealGridSettingsDefault.unitTooltipShow = true;

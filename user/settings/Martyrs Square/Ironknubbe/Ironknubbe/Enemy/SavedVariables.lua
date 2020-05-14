Enemy.Settings = 
{
	combatLogIgnoreAbilityMinValue = 20000,
	combatLogTargetDefenseShow = 
	{
		true,
		true,
		true,
		true,
		true,
		true,
	},
	prevVersion = 279,
	combatLogTargetDefenseHideTimeout = 10,
	guardDistanceIndicatorAnimation = true,
	groupIconsOtherGroupsAlpha = 1,
	debug = false,
	combatLogIDSEnabled = false,
	unitFramesDirection1 = 1,
	groupIconsPetScale = 1,
	unitFramesMyGroupOnly = true,
	soundOnNewTarget = false,
	guardDistanceIndicatorAlphaNormal = 0.75,
	talismanAlerterColorWarning = 
	{
		255,
		255,
		100,
	},
	talismanAlerterAnimation = false,
	combatLogIDSRowPadding = L"3",
	killSpamKilledByYouSound = 219,
	combatLogTargetDefenseSize = 
	{
		60,
		20,
	},
	guardDistanceIndicatorWarningDistance = 30,
	combatLogTargetDefenseTotalBackgroundAlpha = 0.5,
	groupIconsPetLayer = 0,
	combatLogIDSDisplayTime = 20,
	combatLogIgnoreNpc = false,
	groupIconsEnabled = false,
	groupIconsBGColor = 
	{
		200,
		255,
		0,
	},
	groupIconsOffset = 
	{
		0,
		50,
	},
	combatLogTargetDefenseBackgroundAlpha = 0.5,
	combatLogIDSType = "dps",
	groupIconsPetIconColor = 
	{
		255,
		100,
		200,
	},
	combatLogIDSRowBackgroundAlpha = 0.7,
	clickCastings = 
	{
		[1] = 
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			action = 1,
			mouseButton = 1,
			exceptMe = true,
			abilityId = 1363,
			name = L"Guard",
			keyModifiers = 
			{
				false,
				true,
				false,
			},
			playerType = 3,
			archetypeMatch = 1,
			isEnabled = true,
			playerTypeMatch = 1,
		},
	},
	unitFramesDetachMyGroup = false,
	unitFramesHideWhenSolo = true,
	groupIconsBGAlpha = 0.5,
	effectsIndicators = 
	{
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					type = "guard",
					durationType = 3,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyGuard",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			color = 
			{
				r = 191,
				g = 243,
				b = 127,
			},
			anchorFrom = 8,
			exceptMe = true,
			offsetX = 10,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "1990",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 5,
			name = L"My guard",
			playerType = 3,
			isEnabled = true,
			offsetY = 2,
			scale = 1,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				true,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					type = "guard",
					durationType = 3,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"NotMyGuard",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			color = 
			{
				r = 127,
				g = 181,
				b = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 8,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "1991",
			alpha = 1,
			archetypeMatch = 2,
			name = L"Other guard",
			playerType = 3,
			isEnabled = true,
			anchorTo = 5,
			scale = 0.8,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					castedByMe = 1,
					descriptionMatch = 2,
					nameMatch = 1,
					filterName = L"Any",
					hasDurationLimit = false,
					durationType = 2,
				},
			},
			color = 
			{
				r = 255,
				g = 60,
				b = 119,
			},
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -25,
			icon = "dot",
			canDispell = 2,
			isCircleIcon = false,
			id = "1992",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 9,
			name = L"Any dispellable",
			playerType = 1,
			isEnabled = true,
			offsetY = 0,
			scale = 1,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					type = "isHealing",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			color = 
			{
				r = 255,
				g = 191,
				b = 0,
			},
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -14,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "1993",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 9,
			name = L"HoT",
			playerType = 1,
			isEnabled = true,
			offsetY = 0,
			scale = 1,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				
				{
					descriptionMatch = 2,
					type = "isBuff",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyBuff",
					hasDurationLimit = false,
					typeMatch = 1,
				},
				
				{
					descriptionMatch = 2,
					type = "isHealing",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			scale = 1,
			anchorFrom = 9,
			exceptMe = true,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "1994",
			alpha = 1,
			logic = L"MyBuff and not MyHealing",
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
			},
			anchorTo = 9,
			name = L"Buff",
			isEnabled = true,
			playerType = 1,
			offsetY = 0,
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				
				{
					durationType = 2,
					type = "isBlessing",
					filterName = L"MyBlessing",
					descriptionMatch = 2,
					castedByMe = 2,
					durationMax = 59,
					typeMatch = 1,
					hasDurationLimit = true,
					nameMatch = 1,
				},
				
				{
					descriptionMatch = 2,
					type = "isHealing",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "1995",
			alpha = 1,
			logic = L"MyBlessing and not MyHealing",
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
			},
			anchorTo = 9,
			name = L"Blessing",
			isEnabled = true,
			playerType = 1,
			offsetY = 0,
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				true,
			},
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					type = "healDebuffOut50",
					durationType = 1,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"OutHealDebuff",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			color = 
			{
				r = 191,
				g = 255,
				b = 64,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -53,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "1996",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 8,
			name = L"Outgoing 50% heal debuff",
			playerType = 1,
			isEnabled = true,
			offsetY = -5,
			scale = 0.6,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					type = "healDebuffIn50",
					durationType = 1,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"InHealDebuff",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			color = 
			{
				r = 255,
				g = 64,
				b = 64,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -40,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "1997",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 8,
			name = L"Incomming 50% heal debuff",
			playerType = 1,
			isEnabled = true,
			offsetY = -5,
			scale = 0.6,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					type = "stagger",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 1,
					filterName = L"Stagger",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			color = 
			{
				r = 255,
				g = 255,
				b = 128,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			icon = "stagger",
			canDispell = 1,
			isCircleIcon = false,
			id = "1998",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Stagger",
			playerType = 1,
			isEnabled = true,
			anchorTo = 5,
			scale = 0.75,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				true,
			},
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"DoK_WP_Regen",
					abilityIds = L"9561, 8237",
					castedByMe = 1,
					durationType = 1,
					hasDurationLimit = false,
					abilityIdsHash = 
					{
						[9561] = true,
						[8237] = true,
					},
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				r = 255,
				g = 64,
				b = 128,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -65,
			icon = "disabled",
			canDispell = 1,
			isCircleIcon = false,
			id = "1999",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 8,
			name = L"DoK/WP regen",
			playerType = 1,
			isEnabled = true,
			offsetY = -5,
			scale = 0.5,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"ID",
					abilityIds = L"613",
					castedByMe = 1,
					durationType = 2,
					hasDurationLimit = false,
					abilityIdsHash = 
					{
						[613] = true,
					},
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 23175,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "2000",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Immaculate Defense",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			scale = 0.5,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				true,
			},
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"FM",
					abilityIds = L"653, 674, 695, 3882",
					castedByMe = 1,
					durationType = 2,
					hasDurationLimit = false,
					abilityIdsHash = 
					{
						[3882] = true,
						[674] = true,
						[653] = true,
						[695] = true,
					},
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 23153,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "2001",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Focused Mind",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			scale = 0.5,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"TODB",
					abilityIds = L"9616",
					castedByMe = 1,
					durationType = 2,
					hasDurationLimit = false,
					abilityIdsHash = 
					{
						[9616] = true,
					},
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 10965,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "2002",
			alpha = 1,
			archetypeMatch = 1,
			name = L"1001 Dark Blessings",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			scale = 0.5,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"GOF",
					abilityIds = L"8308",
					castedByMe = 1,
					durationType = 2,
					hasDurationLimit = false,
					abilityIdsHash = 
					{
						[8308] = true,
					},
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 8042,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "2003",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Gift of Life",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			scale = 0.5,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"AnyMarkOrRune",
					abilityIds = L"3746, 8551, 8617, 3748, 8560, 8619, 20458, 3747, 8556, 8618, 3038, 3773, 8567, 8620, 1591, 3670, 20476, 1588, 1600, 3570, 1608, 3650, 3671",
					castedByMe = 2,
					durationType = 1,
					hasDurationLimit = false,
					abilityIdsHash = 
					{
						[8560] = true,
						[1608] = true,
						[3746] = true,
						[3748] = true,
						[20458] = true,
						[8617] = true,
						[3570] = true,
						[8556] = true,
						[3671] = true,
						[8618] = true,
						[1591] = true,
						[8619] = true,
						[8567] = true,
						[3650] = true,
						[8620] = true,
						[3747] = true,
						[3670] = true,
						[3038] = true,
						[8551] = true,
						[3773] = true,
						[1600] = true,
						[1588] = true,
						[20476] = true,
					},
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				r = 0,
				g = 255,
				b = 221,
			},
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -36,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "2004",
			alpha = 1,
			archetypeMatch = 1,
			name = L"My marks/runes",
			playerType = 3,
			isEnabled = true,
			anchorTo = 9,
			scale = 1,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					durationType = 2,
					filterName = L"WordOfPain",
					descriptionMatch = 2,
					castedByMe = 1,
					typeMatch = 1,
					durationMax = 5,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[9475] = true,
						[20535] = true,
					},
					hasDurationLimit = true,
					abilityIds = L"9475, 20535",
				},
			},
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 6,
			customIcon = 10908,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "2005",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Word of Pain",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			scale = 0.5,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			effectFilters = 
			{
				[1] = 
				{
					durationType = 2,
					filterName = L"BoilingBlood",
					descriptionMatch = 2,
					castedByMe = 1,
					typeMatch = 1,
					durationMax = 5,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[8165] = true,
					},
					hasDurationLimit = true,
					abilityIds = L"8165",
				},
			},
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 6,
			customIcon = 8015,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "2006",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Boiling Blood",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			scale = 0.5,
			playerTypeMatch = 1,
		},
	},
	groupIconsPetHPBGColor = 
	{
		100,
		0,
		0,
	},
	unitFramesDirection2 = 4,
	guardMarkTemplate = 
	{
		scale = 0.8,
		unique = false,
		firstLetters = L"4",
		showCareerIcon = false,
		canClearOnClick = false,
		permanentTargets = 
		{
		},
		id = 152,
		text = L"G",
		alpha = 0.4,
		color = 
		{
			65,
			150,
			255,
		},
		targetOnClick = true,
		font = "font_default_text_huge",
		name = L"",
		layer = 3,
		display = 1,
		offsetY = 75,
		neverExpire = true,
		permanent = false,
	},
	groupIconsOtherGroupsHPBGColor = 
	{
		50,
		100,
		100,
	},
	unitFramesSorting = 
	{
		1,
		2,
		3,
	},
	objectWindowsInactiveTimeout = 1200,
	unitFramesGroupsCount1 = 2,
	killSpamEnabled = false,
	groupIconsParts = 
	{
	},
	groupIconsOtherGroupsOffset = 
	{
		0,
		50,
	},
	CombatLogStats = 
	{
		[1] = 
		{
			eps = 
			{
			},
			name = L"Default",
			data = 
			{
			},
			dt = 
			{
				minutes = 22,
				year = 2020,
				month = 5,
				day = 13,
				hours = 23,
				seconds = 29,
				totalSeconds = 64939015349,
			},
		},
	},
	groupIconsOtherGroupsBGColor = 
	{
		200,
		255,
		255,
	},
	unitFramesGroupsPadding2 = 40,
	talismanAlerterEnabled = false,
	groupIconsLayer = 0,
	groupIconsPetHPColor = 
	{
		255,
		225,
		255,
	},
	combatLogIDSTimeframe = 7.5,
	unitFramesHideMyGroup = false,
	groupIconsHPBGColor = 
	{
		0,
		100,
		0,
	},
	timerEnabled = false,
	killSpamListBottomUp = false,
	groupIconsScale = 1,
	playerKills = 0,
	combatLogIDSMaxRows = L"5",
	groupIconsPetAlpha = 1,
	combatLogTargetDefenseTimeframe = 7.5,
	combatLogTargetDefenseEnabled = true,
	markNewTarget = false,
	unitFramesTooltipMode = "always",
	unitFramesGroupsDirection1 = 1,
	combatLogEPSTimeframe = 7.5,
	combatLogEPSMaxValueMinTime = 4.5,
	combatLogTargetDefenseTotalBackground = 
	{
		0,
		0,
		0,
	},
	objectWindowsTimeout = 20,
	combatLogIgnoreWhenPolymorphed = true,
	combatLogIDSRowBackground = 
	{
		225,
		50,
		50,
	},
	unitFramesPadding2 = 20,
	combatLogEPSEnabled = 
	{
		false,
		false,
		false,
		false,
	},
	unitFramesLayer = 1,
	groupIconsOtherGroupsScale = 0.6,
	targetShowDelay = 8,
	assistTargetOnNotifyClick = false,
	scenarioInfoReplaceStandardWindow = false,
	unitFramesTestMode = false,
	markTemplates = 
	{
		
		{
			color = 
			{
				191,
				255,
				0,
			},
			firstLetters = 4,
			showCareerIcon = true,
			canClearOnClick = true,
			_activeMarks = 
			{
			},
			permanentTargets = 
			{
			},
			id = 1,
			text = L"",
			alpha = 1,
			targetOnClick = true,
			scale = 1,
			font = "font_clear_large_bold",
			name = L"A",
			layer = 3,
			display = 2,
			offsetY = 50,
			neverExpire = false,
			permanent = false,
		},
		
		{
			color = 
			{
				255,
				64,
				255,
			},
			firstLetters = 4,
			showCareerIcon = true,
			canClearOnClick = true,
			_activeMarks = 
			{
			},
			permanentTargets = 
			{
			},
			id = 2,
			text = L"",
			alpha = 1,
			targetOnClick = true,
			scale = 1,
			font = "font_clear_large_bold",
			name = L"B",
			layer = 3,
			display = 2,
			offsetY = 50,
			neverExpire = false,
			permanent = true,
		},
		
		{
			color = 
			{
				65,
				150,
				255,
			},
			firstLetters = 4,
			showCareerIcon = false,
			canClearOnClick = true,
			_activeMarks = 
			{
			},
			permanentTargets = 
			{
			},
			id = 3,
			text = L"G",
			alpha = 1,
			targetOnClick = true,
			scale = 1,
			font = "font_default_text_giant",
			name = L"G",
			layer = 3,
			display = 1,
			offsetY = 50,
			neverExpire = false,
			permanent = false,
		},
	},
	talismanAlerterDisplayMode = 2,
	unitFramesSize = 
	{
		164,
		32,
	},
	guardDistanceIndicatorScaleWarning = 1.5,
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	stateMachineThrottle = 0.3,
	groupIconsPetBGAlpha = 0.5,
	unitFramesSortingEnabled = true,
	unitFramesScale = 1,
	groupIconsOtherGroupsHPColor = 
	{
		200,
		255,
		255,
	},
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	newTargetMarkTemplate = 
	{
		scale = 1,
		unique = false,
		firstLetters = 4,
		showCareerIcon = true,
		canClearOnClick = true,
		permanentTargets = 
		{
		},
		id = 154,
		text = L"KILL",
		alpha = 1,
		color = 
		{
			b = 0,
			g = 0,
			r = 255,
		},
		targetOnClick = true,
		font = "font_clear_large_bold",
		name = L"",
		layer = 3,
		display = 1,
		offsetY = 50,
		neverExpire = false,
		permanent = false,
	},
	timerActiveColor = 
	{
		255,
		255,
		75,
	},
	groupIconsPetOffset = 
	{
		0,
		20,
	},
	scenarioInfoEnabled = false,
	guardDistanceIndicator = 2,
	guardMarkEnabled = true,
	intercomPrivate = true,
	groupIconsAlpha = 1,
	combatLogEPSShow = 
	{
		true,
		true,
		true,
		true,
	},
	combatLogLogParseErrors = true,
	guardDistanceIndicatorMovable = true,
	version = 279,
	groupIconsTargetOnClick = true,
	guardDistanceIndicatorClickThrough = false,
	chatThrottleDelay = 10,
	playerDeaths = 0,
	killSpamReparseChunkSize = 20,
	unitFramesEnabled = true,
	groupIconsShowOnMarkedPlayers = false,
	groupIconsHPColor = 
	{
		200,
		255,
		0,
	},
	groupIconsOtherGroupsLayer = 0,
	chatDelay = 2,
	combatLogStatisticsEnabled = false,
	combatLogIDSRowSize = 
	{
		250,
		30,
	},
	guardDistanceIndicatorColorNormal = 
	{
		127,
		181,
		255,
	},
	unitFramesParts = 
	{
		
		{
			type = "selectionFrame",
			id = "1978",
			data = 
			{
				offlineHide = true,
				anchorTo = "topleft",
				color = 
				{
					255,
					255,
					255,
				},
				layer = 0,
				anchorFrom = "topleft",
				texture = "rect",
				vertical = false,
				alpha = 1,
				deadHide = false,
				scale = 1,
				distHide = false,
				size = 
				{
					136,
					37,
				},
				pos = 
				{
					31,
					-1,
				},
			},
			exceptMe = false,
			name = L"Selection",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "panel",
			id = "1979",
			data = 
			{
				offlineColor = 
				{
					150,
					150,
					150,
				},
				offlineHide = false,
				anchorTo = "topleft",
				color = 
				{
					0,
					0,
					0,
				},
				layer = 0,
				anchorFrom = "topleft",
				texture = "default2",
				alpha = 0.75,
				vertical = false,
				scale = 1,
				deadHide = false,
				deadColor = 
				{
					200,
					50,
					50,
				},
				distHide = false,
				size = 
				{
					136,
					37,
				},
				pos = 
				{
					31,
					-1,
				},
			},
			exceptMe = false,
			name = L"Background",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "hpbar",
			id = "1980",
			data = 
			{
				size = 
				{
					129,
					30,
				},
				offlineHide = true,
				anchorTo = "topleft",
				distAlpha = 0.5,
				color = 
				{
					150,
					190,
					255,
				},
				wrap = false,
				anchorFrom = "topleft",
				scale = 1,
				alpha = 1,
				vertical = false,
				textureFullResize = true,
				deadHide = true,
				texture = "default",
				distHide = false,
				layer = 1,
				pos = 
				{
					35,
					3,
				},
			},
			exceptMe = false,
			name = L"HP",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "apbar",
			id = "1981",
			data = 
			{
				offlineHide = true,
				texture = "plain",
				anchorTo = "bottomleft",
				textureFullResize = true,
				layer = 2,
				anchorFrom = "bottomleft",
				size = 
				{
					128,
					3,
				},
				color = 
				{
					255,
					220,
					100,
				},
				deadHide = true,
				scale = 1,
				vertical = false,
				alpha = 1,
				distHide = false,
				distAlpha = 0.5,
				pos = 
				{
					35,
					0,
				},
			},
			exceptMe = false,
			name = L"AP",
			isEnabled = true,
			playerType = 3,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "nameText",
			id = "1982",
			data = 
			{
				anchorTo = "bottomleft",
				scale = 1,
				anchorFrom = "bottomleft",
				vertical = false,
				distHide = false,
				size = 
				{
					129,
					30,
				},
				distColor = 
				{
					190,
					225,
					255,
				},
				distAlpha = 0.5,
				align = "bottomleft",
				layer = 4,
				alpha = 1,
				maxLength = 10,
				deadHide = false,
				font = "font_clear_small_bold",
				texture = "aluminium",
				offlineHide = false,
				wrap = false,
				color = 
				{
					255,
					255,
					255,
				},
				pos = 
				{
					37,
					0,
				},
			},
			exceptMe = false,
			name = L"Name",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "careerIcon",
			id = "1983",
			data = 
			{
				anchorTo = "topleft",
				color = 
				{
					255,
					255,
					255,
				},
				layer = 1,
				alpha = 1,
				vertical = false,
				texture = "aluminium",
				size = 
				{
					28,
					28,
				},
				anchorFrom = "topleft",
				scale = 1,
				pos = 
				{
					0,
					4,
				},
			},
			exceptMe = false,
			name = L"Icon",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "levelText",
			id = "1984",
			data = 
			{
				anchorTo = "bottomleft",
				scale = 0.8,
				layer = 2,
				anchorFrom = "bottomleft",
				texture = "aluminium",
				vertical = false,
				alpha = 1,
				color = 
				{
					255,
					255,
					255,
				},
				font = "font_clear_small_bold",
				align = "center",
				size = 
				{
					30,
					20,
				},
				pos = 
				{
					12,
					5,
				},
			},
			exceptMe = false,
			name = L"Level",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "groupLeaderIcon",
			id = "1985",
			data = 
			{
				anchorTo = "topleft",
				color = 
				{
					150,
					190,
					255,
				},
				layer = 2,
				alpha = 1,
				vertical = false,
				texture = "star",
				size = 
				{
					16,
					16,
				},
				anchorFrom = "topleft",
				scale = 1,
				pos = 
				{
					-5,
					-1,
				},
			},
			exceptMe = false,
			name = L"Leader",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "moraleBar",
			id = "1986",
			data = 
			{
				texture = "4dots",
				offlineHide = true,
				anchorFrom = "topleft",
				anchorTo = "topleft",
				color = 
				{
					120,
					200,
					255,
				},
				layer = 3,
				alpha = 1,
				size = 
				{
					38,
					10,
				},
				vertical = false,
				deadHide = true,
				prefix = L"M ",
				suffix = L"",
				textureFullResize = false,
				distHide = false,
				scale = 1,
				pos = 
				{
					37,
					4,
				},
			},
			exceptMe = false,
			name = L"Morale",
			isEnabled = true,
			playerType = 3,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "distanceText",
			id = "1987",
			data = 
			{
				anchorTo = "topright",
				color = 
				{
					255,
					255,
					255,
				},
				farValue = 151,
				anchorFrom = "topright",
				farText = L"FAR",
				prefix = L"",
				suffix = L"",
				distHide = false,
				size = 
				{
					30,
					30,
				},
				offlineHide = true,
				align = "right",
				layer = 2,
				alpha = 1,
				deadHide = true,
				font = "font_clear_small_bold",
				texture = "aluminium",
				scale = 0.9,
				vertical = false,
				pos = 
				{
					-3,
					3,
				},
			},
			exceptMe = true,
			name = L"Distance",
			isEnabled = false,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "distanceBar",
			id = "1988",
			data = 
			{
				anchorTo = "topright",
				color = 
				{
					190,
					255,
					50,
				},
				level1 = 65,
				anchorFrom = "topright",
				level2 = 100,
				distHide = false,
				texture = "4dots",
				offlineHide = true,
				textureFullResize = false,
				layer = 2,
				alpha = 1,
				color1 = 
				{
					255,
					150,
					50,
				},
				color2 = 
				{
					255,
					50,
					50,
				},
				deadHide = true,
				color3 = 
				{
					255,
					50,
					50,
				},
				scale = 1,
				level3 = 150,
				size = 
				{
					40,
					10,
				},
				vertical = false,
				pos = 
				{
					-3,
					4,
				},
			},
			exceptMe = false,
			name = L"Distance bar",
			isEnabled = true,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			type = "hppText",
			id = "1989",
			data = 
			{
				anchorTo = "right",
				scale = 0.7,
				anchorFrom = "right",
				vertical = false,
				prefix = L"",
				suffix = L"%",
				distHide = false,
				size = 
				{
					50,
					30,
				},
				offlineHide = true,
				textureFullResize = false,
				layer = 2,
				alpha = 1,
				deadHide = true,
				color = 
				{
					255,
					255,
					255,
				},
				font = "font_clear_small_bold",
				align = "rightcenter",
				texture = "3dots",
				pos = 
				{
					-3,
					1,
				},
			},
			exceptMe = false,
			name = L"HP %",
			isEnabled = false,
			playerType = 1,
			archetypeMatch = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
	},
	unitFramesPadding1 = 3,
	guardEnabled = true,
	guardDistanceIndicatorColorWarning = 
	{
		255,
		50,
		50,
	},
	groupIconsOtherGroupsBGAlpha = 0.5,
	playerKDRDisplayMode = 5,
	guardDistanceIndicatorAlphaWarning = 1,
	groupIconsHideOnSelf = true,
	scenarioAlerterEnabled = true,
	combatLogTargetDefenseTotalCalculate = 
	{
		true,
		true,
		true,
		true,
		true,
		true,
	},
	unitFramesCount1 = 6,
	guardDistanceIndicatorScaleNormal = 1,
	combatLogTargetDefenseTotalEnabled = true,
	combatLogIDSRowScale = 1,
	groupIconsShowOtherGroups = true,
	groupIconsPetBGColor = 
	{
		255,
		225,
		255,
	},
	unitFramesGroupsPadding1 = 40,
	scenarioInfoSelection = 
	{
		
		{
			sortColumn = "value1",
			columns = 
			{
				"db",
				"deaths",
			},
			sortDirection = false,
			id2 = "1",
			id = "All",
		},
		
		{
			sortColumn = "value1",
			columns = 
			{
				"db",
				"deaths",
			},
			sortDirection = false,
			id2 = "2",
			id = "All",
		},
	},
	unitFramesIsVertical = false,
	combatLogTargetDefenseScale = 1,
	unitFramesMyGroupFirst = true,
	combatLogEnabled = false,
	unitFramesGroupsDirection2 = 4,
	soundOnNewTargetId = 500,
}




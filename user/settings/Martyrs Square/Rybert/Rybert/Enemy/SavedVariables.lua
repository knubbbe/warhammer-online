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
	guardMarkEnabled = true,
	groupIconsOtherGroupsAlpha = 0.3,
	groupIconsAlpha = 0.4,
	chatThrottleDelay = 10,
	unitFramesDirection1 = 1,
	groupIconsPetScale = 1,
	unitFramesMyGroupOnly = false,
	soundOnNewTarget = false,
	guardDistanceIndicatorAlphaNormal = 0.75,
	talismanAlerterColorWarning = 
	{
		255,
		255,
		100,
	},
	talismanAlerterAnimation = false,
	scenarioAlerterEnabled = true,
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
	groupIconsOtherGroupsHPColor = 
	{
		200,
		255,
		255,
	},
	groupIconsEnabled = false,
	guardDistanceIndicatorScaleNormal = 1,
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
	combatLogEnabled = true,
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
			anchorTo = 5,
			color = 
			{
				b = 127,
				g = 243,
				r = 191,
			},
			anchorFrom = 8,
			exceptMe = true,
			offsetX = 10,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "22689",
			alpha = 1,
			archetypeMatch = 1,
			scale = 1,
			name = L"My guard",
			isEnabled = true,
			playerType = 3,
			offsetY = 2,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 3,
					type = "guard",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyGuard",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
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
					durationType = 3,
					type = "guard",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 3,
					filterName = L"NotMyGuard",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				b = 255,
				g = 181,
				r = 127,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 8,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "22690",
			alpha = 1,
			archetypeMatch = 2,
			name = L"Other guard",
			scale = 0.8,
			playerType = 3,
			anchorTo = 5,
			isEnabled = true,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			anchorTo = 9,
			color = 
			{
				b = 119,
				g = 60,
				r = 255,
			},
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -25,
			icon = "dot",
			canDispell = 2,
			isCircleIcon = false,
			id = "22691",
			alpha = 1,
			archetypeMatch = 1,
			scale = 1,
			name = L"Any dispellable",
			isEnabled = true,
			playerType = 1,
			offsetY = 0,
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					hasDurationLimit = false,
					filterName = L"Any",
					nameMatch = 1,
					typeMatch = 1,
				},
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			anchorTo = 9,
			color = 
			{
				b = 0,
				g = 191,
				r = 255,
			},
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -14,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "22692",
			alpha = 1,
			archetypeMatch = 1,
			scale = 1,
			name = L"HoT",
			isEnabled = true,
			playerType = 1,
			offsetY = 0,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 2,
					type = "isHealing",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyHealing",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			anchorTo = 9,
			color = 
			{
				b = 255,
				g = 200,
				r = 50,
			},
			anchorFrom = 9,
			exceptMe = true,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "22693",
			alpha = 1,
			logic = L"MyBuff and not MyHealing",
			archetypeMatch = 1,
			effectFilters = 
			{
				
				{
					durationType = 2,
					type = "isBuff",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyBuff",
					nameMatch = 1,
					descriptionMatch = 2,
				},
				
				{
					durationType = 2,
					type = "isHealing",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyHealing",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			name = L"Buff",
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
			anchorTo = 9,
			color = 
			{
				b = 255,
				g = 200,
				r = 50,
			},
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "22694",
			alpha = 1,
			logic = L"MyBlessing and not MyHealing",
			archetypeMatch = 1,
			effectFilters = 
			{
				
				{
					durationType = 2,
					type = "isBlessing",
					filterName = L"MyBlessing",
					descriptionMatch = 2,
					castedByMe = 2,
					durationMax = 59,
					nameMatch = 1,
					hasDurationLimit = true,
					typeMatch = 1,
				},
				
				{
					durationType = 2,
					type = "isHealing",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyHealing",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			name = L"Blessing",
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
				true,
			},
			anchorTo = 8,
			color = 
			{
				b = 64,
				g = 255,
				r = 191,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -53,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "22695",
			alpha = 1,
			archetypeMatch = 1,
			scale = 0.6,
			name = L"Outgoing 50% heal debuff",
			isEnabled = true,
			playerType = 1,
			offsetY = -5,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 1,
					type = "healDebuffOut50",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 3,
					filterName = L"OutHealDebuff",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			anchorTo = 8,
			color = 
			{
				b = 64,
				g = 64,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -40,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "22696",
			alpha = 1,
			archetypeMatch = 1,
			scale = 0.6,
			name = L"Incomming 50% heal debuff",
			isEnabled = true,
			playerType = 1,
			offsetY = -5,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 1,
					type = "healDebuffIn50",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 3,
					filterName = L"InHealDebuff",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
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
					type = "stagger",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 1,
					filterName = L"Stagger",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
			color = 
			{
				b = 128,
				g = 255,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			icon = "stagger",
			canDispell = 1,
			isCircleIcon = false,
			id = "22697",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Stagger",
			scale = 0.75,
			playerType = 1,
			anchorTo = 5,
			isEnabled = true,
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				true,
			},
			anchorTo = 8,
			color = 
			{
				b = 128,
				g = 64,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -65,
			icon = "disabled",
			canDispell = 1,
			isCircleIcon = false,
			id = "22698",
			alpha = 1,
			archetypeMatch = 1,
			scale = 0.5,
			name = L"DoK/WP regen",
			isEnabled = true,
			playerType = 1,
			offsetY = -5,
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"DoK_WP_Regen",
					abilityIds = L"9561, 8237",
					castedByMe = 1,
					descriptionMatch = 2,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[9561] = true,
						[8237] = true,
					},
					hasDurationLimit = false,
					durationType = 1,
				},
			},
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
					descriptionMatch = 2,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[613] = true,
					},
					hasDurationLimit = false,
					durationType = 2,
				},
			},
			color = 
			{
				b = 255,
				g = 255,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 23175,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "22699",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Immaculate Defense",
			scale = 0.5,
			playerType = 3,
			anchorTo = 2,
			isEnabled = true,
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
					descriptionMatch = 2,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[3882] = true,
						[695] = true,
						[674] = true,
						[653] = true,
					},
					hasDurationLimit = false,
					durationType = 2,
				},
			},
			color = 
			{
				b = 255,
				g = 255,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 23153,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "22700",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Focused Mind",
			scale = 0.5,
			playerType = 3,
			anchorTo = 2,
			isEnabled = true,
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
					descriptionMatch = 2,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[9616] = true,
					},
					hasDurationLimit = false,
					durationType = 2,
				},
			},
			color = 
			{
				b = 255,
				g = 255,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 10965,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "22701",
			alpha = 1,
			archetypeMatch = 1,
			name = L"1001 Dark Blessings",
			scale = 0.5,
			playerType = 3,
			anchorTo = 2,
			isEnabled = true,
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
					descriptionMatch = 2,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[8308] = true,
					},
					hasDurationLimit = false,
					durationType = 2,
				},
			},
			color = 
			{
				b = 255,
				g = 255,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 8042,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "22702",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Gift of Life",
			scale = 0.5,
			playerType = 3,
			anchorTo = 2,
			isEnabled = true,
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
					descriptionMatch = 2,
					nameMatch = 1,
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
						[20476] = true,
						[1588] = true,
						[8619] = true,
						[1600] = true,
						[3650] = true,
						[3773] = true,
						[8620] = true,
						[3670] = true,
						[3038] = true,
						[8551] = true,
						[3747] = true,
						[8567] = true,
						[1591] = true,
						[8618] = true,
					},
					hasDurationLimit = false,
					durationType = 1,
				},
			},
			color = 
			{
				b = 221,
				g = 255,
				r = 0,
			},
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -36,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "22703",
			alpha = 1,
			archetypeMatch = 1,
			name = L"My marks/runes",
			scale = 1,
			playerType = 3,
			anchorTo = 9,
			isEnabled = true,
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
					abilityIds = L"9475, 20535",
					durationMax = 5,
					hasDurationLimit = true,
					abilityIdsHash = 
					{
						[9475] = true,
						[20535] = true,
					},
					nameMatch = 1,
					typeMatch = 1,
				},
			},
			color = 
			{
				b = 255,
				g = 255,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 6,
			customIcon = 10908,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "22704",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Word of Pain",
			scale = 0.5,
			playerType = 3,
			anchorTo = 2,
			isEnabled = true,
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
					abilityIds = L"8165",
					durationMax = 5,
					hasDurationLimit = true,
					abilityIdsHash = 
					{
						[8165] = true,
					},
					nameMatch = 1,
					typeMatch = 1,
				},
			},
			color = 
			{
				b = 255,
				g = 255,
				r = 255,
			},
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 6,
			customIcon = 8015,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "22705",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Boiling Blood",
			scale = 0.5,
			playerType = 3,
			anchorTo = 2,
			isEnabled = true,
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
		firstLetters = 4,
		showCareerIcon = false,
		canClearOnClick = false,
		permanentTargets = 
		{
		},
		id = 2504,
		text = L"G",
		alpha = 1,
		layer = 3,
		font = "font_default_text_giant",
		name = L"",
		targetOnClick = true,
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
	guardDistanceIndicatorMovable = true,
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
			name = L"Default",
			eps = 
			{
				
				{
					totalAoe = 0,
					total = 0,
					valueAoe = 0,
					value = 0,
					objectTime = 64939191395,
					data = 
					{
						
						{
							str = L"Bighorn's ability hits you for 0 damage. (40 mitigated) (32 absorbed)",
							type = 1,
							abs = 32,
							currentTarget = true,
							time = 64939191395,
							object = L"Bighorn",
							value = 0,
							crit = false,
							mit = 40,
							ability = L"ability",
						},
						
						{
							str = L"Bighorn's ability hits you for 0 damage. (40 mitigated) (32 absorbed)",
							type = 1,
							abs = 32,
							currentTarget = true,
							time = 64939191397,
							object = L"Bighorn",
							value = 0,
							crit = false,
							mit = 40,
							ability = L"ability",
						},
						
						{
							str = L"Bighorn's ability hits you for 0 damage. (40 mitigated) (32 absorbed)",
							type = 1,
							abs = 32,
							currentTarget = true,
							time = 64939191400,
							object = L"Bighorn",
							value = 0,
							crit = false,
							mit = 40,
							ability = L"ability",
						},
					},
					object = L"Bighorn",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Castigation hits Bighorn for 44 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"Castigation",
							value = 44,
							mit = 15,
							crit = false,
							time = 64939191395,
						},
						
						{
							str = L"Your attack hits Bighorn for 32 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"attack",
							value = 32,
							mit = 21,
							crit = false,
							time = 64939191395,
						},
						
						{
							str = L"Your Sigmar's Fist hits Bighorn for 60 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"Sigmar's Fist",
							value = 60,
							mit = 28,
							crit = false,
							time = 64939191396,
						},
						
						{
							str = L"Your attack hits Bighorn for 40 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"attack",
							value = 40,
							mit = 21,
							crit = false,
							time = 64939191397,
						},
						
						{
							str = L"Your Castigation hits Bighorn for 11 damage. (5 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"Castigation",
							value = 11,
							mit = 5,
							crit = false,
							time = 64939191397,
						},
						
						{
							str = L"Your Divine Strike hits Bighorn for 60 damage. (25 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"Divine Strike",
							value = 60,
							mit = 25,
							crit = false,
							time = 64939191398,
						},
						
						{
							str = L"Your attack hits Bighorn for 40 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"attack",
							value = 40,
							mit = 21,
							crit = false,
							time = 64939191400,
						},
						
						{
							str = L"Your Castigation hits Bighorn for 11 damage. (5 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Bighorn",
							ability = L"Castigation",
							value = 11,
							mit = 5,
							crit = false,
							time = 64939191400,
						},
					},
					total = 338,
					objectTime = 64939191395,
					data = 
					{
						
						{
							str = L"Your Castigation hits Bighorn for 44 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191395,
							object = L"Bighorn",
							value = 44,
							crit = false,
							mit = 15,
							ability = L"Castigation",
						},
						
						{
							str = L"Your attack hits Bighorn for 32 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191395,
							object = L"Bighorn",
							value = 32,
							crit = false,
							mit = 21,
							ability = L"attack",
						},
						
						{
							str = L"Your Sigmar's Fist hits Bighorn for 60 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191396,
							object = L"Bighorn",
							value = 60,
							crit = false,
							mit = 28,
							ability = L"Sigmar's Fist",
						},
						
						{
							str = L"Your attack hits Bighorn for 40 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191397,
							object = L"Bighorn",
							value = 40,
							crit = false,
							mit = 21,
							ability = L"attack",
						},
						
						{
							str = L"Your Castigation hits Bighorn for 11 damage. (5 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191397,
							object = L"Bighorn",
							value = 11,
							crit = false,
							mit = 5,
							ability = L"Castigation",
						},
						
						{
							str = L"Your Divine Strike hits Bighorn for 60 damage. (25 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191398,
							object = L"Bighorn",
							value = 60,
							crit = false,
							mit = 25,
							ability = L"Divine Strike",
						},
						
						{
							str = L"Your attack hits Bighorn for 40 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191400,
							object = L"Bighorn",
							value = 40,
							crit = false,
							mit = 21,
							ability = L"attack",
						},
						
						{
							str = L"Your Castigation hits Bighorn for 11 damage. (5 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191400,
							object = L"Bighorn",
							value = 11,
							crit = false,
							mit = 5,
							ability = L"Castigation",
						},
						
						{
							str = L"Your attack hits Bighorn for 40 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191402,
							object = L"Bighorn",
							value = 40,
							crit = false,
							mit = 21,
							ability = L"attack",
						},
					},
					totalAoe = 338,
					valueMaxData = 
					{
						
						{
							str = L"Your Castigation hits Bighorn for 44 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191395,
							object = L"Bighorn",
							value = 44,
							crit = false,
							mit = 15,
							ability = L"Castigation",
						},
						
						{
							str = L"Your attack hits Bighorn for 32 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191395,
							object = L"Bighorn",
							value = 32,
							crit = false,
							mit = 21,
							ability = L"attack",
						},
						
						{
							str = L"Your Sigmar's Fist hits Bighorn for 60 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191396,
							object = L"Bighorn",
							value = 60,
							crit = false,
							mit = 28,
							ability = L"Sigmar's Fist",
						},
						
						{
							str = L"Your attack hits Bighorn for 40 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191397,
							object = L"Bighorn",
							value = 40,
							crit = false,
							mit = 21,
							ability = L"attack",
						},
						
						{
							str = L"Your Castigation hits Bighorn for 11 damage. (5 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191397,
							object = L"Bighorn",
							value = 11,
							crit = false,
							mit = 5,
							ability = L"Castigation",
						},
						
						{
							str = L"Your Divine Strike hits Bighorn for 60 damage. (25 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191398,
							object = L"Bighorn",
							value = 60,
							crit = false,
							mit = 25,
							ability = L"Divine Strike",
						},
						
						{
							str = L"Your attack hits Bighorn for 40 damage. (21 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191400,
							object = L"Bighorn",
							value = 40,
							crit = false,
							mit = 21,
							ability = L"attack",
						},
						
						{
							str = L"Your Castigation hits Bighorn for 11 damage. (5 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64939191400,
							object = L"Bighorn",
							value = 11,
							crit = false,
							mit = 5,
							ability = L"Castigation",
						},
					},
					valueAoe = 48,
					valueMax = 60,
					value = 48,
					object = L"Bighorn",
					valueAoeMax = 60,
				},
				
				{
					totalAoe = 0,
					total = 60,
					object = L"Rybert",
					objectTime = 64939191398,
					data = 
					{
						[1] = 
						{
							str = L"Your Divine Strike heals you for 0 points. (60 overhealed)",
							type = 3,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64939191398,
							value = 0,
							overheal = 60,
							crit = false,
							object = L"Rybert",
						},
					},
				},
				
				{
					totalAoe = 60,
					total = 60,
					object = L"you",
					objectTime = 64939191398,
					data = 
					{
						[1] = 
						{
							str = L"Your Divine Strike heals you for 0 points. (60 overhealed)",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"you",
							value = 0,
							time = 64939191398,
							crit = false,
							overheal = 60,
						},
					},
				},
			},
			data = 
			{
				
				{
					[L"Brain Bursta"] = 
					{
						normal = 
						{
							min = 52,
							total = 281,
							count = 2,
							abs = 166,
							max = 229,
							mit = 75,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Mage Bolt"] = 
					{
						normal = 
						{
							min = 266,
							total = 266,
							count = 1,
							abs = 0,
							max = 266,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Frozen Touch"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 110,
							max = 110,
							min = 110,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								career = 24,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								career = 24,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Ethereal Emanation"] = 
					{
						
						{
							overheal = 0,
							total = 37,
							abs = 0,
							min = 37,
							count = 1,
							max = 37,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								career = 0,
							},
							mit = 21,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								career = 0,
							},
						},
						
						{
							overheal = 0,
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 105,
							time = 64937103489,
							crit = false,
							str = L"Your Healing Hand heals you for 105 points.",
						}, 
						parry = 0,
					},
					[L"Flickering Red Fire"] = 
					{
						normal = 
						{
							min = 76,
							total = 623,
							count = 3,
							abs = 166,
							max = 305,
							mit = 138,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Glean Magic"] = 
					{
						normal = 
						{
							min = 54,
							total = 475,
							count = 8,
							max = 66,
							overheal = 0,
							mit = 47,
							abs = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 171,
							count = 2,
							abs = 0,
							min = 81,
							mit = 13,
							max = 90,
						},
						parry = 0,
					},
					[L"Trip 'Em Up"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 411,
							max = 115,
							min = 92,
							count = 4,
							abs = 10,
							mit = 135,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								career = 5,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 139,
							max = 139,
							min = 139,
							count = 1,
							abs = 0,
							mit = 47,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
						},
						parry = 0,
					},
					[L"Ravage"] = 
					{
						normal = 
						{
							min = 0,
							total = 575,
							count = 6,
							overheal = 0,
							max = 174,
							abs = 300,
							mit = 235,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								career = 13,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
					},
					[L"Rabid Bite"] = 
					{
						[1] = 
						{
							overheal = 0,
							total = 411,
							abs = 152,
							min = 0,
							count = 6,
							max = 116,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4186,
								level = 6,
								hp = 100,
								career = 0,
							},
							mit = 250,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 1181,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						normal = 
						{
							overheal = 0,
							total = 1244,
							abs = 736,
							min = 0,
							count = 28,
							max = 79,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4184,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 782,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 1196,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						parry = 0,
					},
					[L"Tri-Barrel Hellcannon"] = 
					{
						normal = 
						{
							min = 963,
							total = 963,
							count = 1,
							abs = 0,
							max = 963,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"ability"] = 
					{
						[1] = 
						{
							overheal = 0,
							total = 115,
							abs = 308,
							min = 0,
							count = 4,
							max = 80,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4262,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 84,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Krev the Plunderer",
								id = 4039,
								level = 8,
								hp = 100,
								career = 0,
							},
						},
						normal = 
						{
							overheal = 0,
							total = 5247,
							abs = 8909,
							min = 0,
							count = 182,
							max = 2016,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 67,
								career = 12,
							},
							mit = 4624,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 60160,
								level = 5,
								hp = 100,
								name = L"Bighorn",
							},
						},
						parry = 0,
					},
					[L"Lob Choppa"] = 
					{
						normal = 
						{
							min = 24,
							total = 72,
							count = 3,
							abs = 0,
							max = 24,
							mit = 81,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Tooth of Tzeentch"] = 
					{
						normal = 
						{
							min = 64,
							total = 423,
							count = 4,
							overheal = 0,
							abs = 0,
							max = 154,
							mit = 113,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								career = 13,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Surging Violet Fire"] = 
					{
						normal = 
						{
							min = 183,
							total = 366,
							count = 2,
							abs = 0,
							max = 183,
							mit = 70,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Blue Horror's Coruscating Energy"] = 
					{
						normal = 
						{
							min = 0,
							total = 20,
							count = 2,
							abs = 120,
							max = 20,
							mit = 60,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Gas Squig's attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 143,
							count = 6,
							min = 13,
							abs = 0,
							max = 52,
							mit = 56,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 18,
							abs = 0,
							min = 18,
							count = 1,
							max = 18,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
							mit = 7,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
						},
						parry = 0,
					},
					[L"Demolition"] = 
					{
						normal = 
						{
							min = 0,
							total = 0,
							count = 1,
							abs = 98,
							max = 0,
							mit = 35,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Yer Bleedin'!"] = 
					{
						
						{
							overheal = 0,
							total = 228,
							abs = 0,
							min = 76,
							count = 3,
							max = 76,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
							mit = 57,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
						},
						
						{
							str = L"Your Healing Hand heals you for 105 points.",
							currentTarget = true,
							time = 64937103489,
							value = 105,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
							overheal = 0,
							type = 4,
							ability = L"Healing Hand",
							abs = 0,
							min = 113,
							total = 113,
							object = L"you",
							crit = false,
							max = 113,
							count = 1,
							mit = 29,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
						}, 
						parry = 0,
					},
					[L"What Blocka?"] = 
					{
						normal = 
						{
							min = 169,
							total = 169,
							count = 1,
							abs = 7,
							max = 169,
							mit = 34,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Seeping Wound"] = 
					{
						normal = 
						{
							min = 31,
							total = 123,
							count = 3,
							abs = 0,
							overheal = 0,
							mit = 70,
							max = 51,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 60,
							total = 60,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 28,
							max = 60,
						},
						parry = 0,
					},
					[L"Baleful Transmogrification"] = 
					{
						normal = 
						{
							min = 108,
							total = 762,
							count = 6,
							abs = 0,
							max = 158,
							mit = 130,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 178,
							total = 578,
							count = 3,
							abs = 0,
							max = 210,
							mit = 104,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Demolishing Strike"] = 
					{
						normal = 
						{
							min = 80,
							total = 800,
							count = 10,
							abs = 0,
							max = 80,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Clobber"] = 
					{
						normal = 
						{
							min = 0,
							total = 514,
							count = 8,
							abs = 534,
							max = 167,
							mit = 311,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 206,
							max = 195,
							min = 11,
							count = 2,
							abs = 106,
							mit = 73,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
						},
						parry = 0,
					},
					[L"Lunging Maw"] = 
					{
						[1] = 
						{
							overheal = 0,
							total = 0,
							abs = 143,
							min = 0,
							count = 2,
							max = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 83,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						normal = 
						{
							overheal = 0,
							total = 1234,
							abs = 425,
							min = 0,
							count = 23,
							max = 81,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4184,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 627,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 1196,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						parry = 0,
					},
					[L"Blue Horror's Warping Energy"] = 
					{
						normal = 
						{
							min = 19,
							total = 19,
							count = 1,
							abs = 85,
							max = 19,
							mit = 35,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"attack"] = 
					{
						[1] = 
						{
							overheal = 0,
							total = 2490,
							abs = 0,
							min = 12,
							count = 24,
							max = 277,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								career = 0,
							},
							mit = 638,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Nurgling",
								id = 206,
								level = 1,
								hp = 100,
								career = 0,
							},
						},
						normal = 
						{
							min = 8,
							total = 22354,
							count = 356,
							overheal = 0,
							max = 183,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								career = 0,
							},
							mit = 8357,
							abs = 0,
						},
						parry = 0,
					},
					[L"Chillwind"] = 
					{
						normal = 
						{
							min = 92,
							total = 184,
							count = 2,
							abs = 0,
							overheal = 0,
							mit = 18,
							max = 92,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 143,
							total = 754,
							count = 4,
							overheal = 0,
							abs = 0,
							mit = 37,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								career = 24,
							},
							max = 246,
						},
						parry = 0,
					},
					[L"Scythe Gash"] = 
					{
						[1] = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						normal = 
						{
							overheal = 0,
							total = 39,
							abs = 0,
							min = 39,
							count = 1,
							max = 39,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								career = 0,
							},
							mit = 21,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Gas Squig's Goop Shootin'"] = 
					{
						[1] = 
						{
							overheal = 0,
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"Rybert",
							value = 86,
							time = 64937103491,
							crit = false,
							str = L"Your Prayer of Devotion heals you for 86 points.",
						},
						normal = 
						{
							overheal = 0,
							total = 171,
							count = 3,
							min = 28,
							abs = 0,
							max = 115,
							mit = 48,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
						},
						parry = 0,
					},
					[L"Lotsa Choppin"] = 
					{
						normal = 
						{
							min = 152,
							total = 152,
							count = 1,
							abs = 0,
							max = 152,
							mit = 34,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 188,
							max = 188,
							min = 188,
							count = 1,
							abs = 0,
							mit = 60,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Cracrah",
								id = 1273,
								level = 12,
								hp = 14,
								career = 6,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Cracrah",
								id = 1273,
								level = 12,
								hp = 14,
								career = 6,
							},
						},
						parry = 0,
					},
					[L"Rend Winds"] = 
					{
						normal = 
						{
							min = 65,
							total = 325,
							count = 5,
							abs = 0,
							max = 65,
							mit = 35,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 94,
							total = 94,
							count = 1,
							abs = 0,
							max = 94,
							mit = 11,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Ethereal Chill"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 271,
							abs = 0,
							min = 43,
							count = 6,
							max = 56,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Sigmundi Spirit",
								id = 139,
								level = 4,
								hp = 100,
								career = 0,
							},
							mit = 132,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Sigmundi Spirit",
								id = 294,
								level = 3,
								hp = 100,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Word of Pain"] = 
					{
						[1] = 
						{
							min = 222,
							total = 222,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 36,
							max = 222,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Shattered Shadows"] = 
					{
						normal = 
						{
							min = 239,
							total = 497,
							count = 2,
							abs = 0,
							max = 258,
							mit = 60,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								career = 24,
							},
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Ethereal Hand"] = 
					{
						[1] = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						normal = 
						{
							overheal = 0,
							total = 283,
							abs = 0,
							min = 37,
							count = 7,
							max = 49,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Sigmundi Spirit",
								id = 139,
								level = 4,
								hp = 100,
								career = 0,
							},
							mit = 147,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Sigmundi Spirit",
								id = 294,
								level = 3,
								hp = 100,
								career = 0,
							},
						},
					},
					[L"Pink Horror's attack"] = 
					{
						normal = 
						{
							min = 57,
							total = 174,
							count = 3,
							abs = 0,
							max = 60,
							mit = 57,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Ground Rumble"] = 
					{
						
						{
							overheal = 13,
							type = 3,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 27,
							time = 64937103492,
							crit = true,
							str = L"Your Lingering Divine Aid critically heals you for 27 points. (13 overhealed)",
						},
						
						{
							overheal = 105,
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103493,
							crit = false,
							str = L"Your Divine Assault heals you for 0 points. (105 overhealed)",
						},
						
						{
							overheal = 0,
							type = 3,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 27,
							time = 64937103494,
							crit = false,
							str = L"Your Lingering Divine Aid heals you for 27 points.",
						},
						
						{
							overheal = 0,
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 143,
							time = 64937103494,
							crit = false,
							str = L"Your Divine Assault heals you for 143 points.",
						}, 
						normal = 
						{
							overheal = 0,
							total = 10,
							max = 10,
							min = 10,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 284,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							mit = 1,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 284,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
						},
					},
					[L"Skull Thumper"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1122,
							max = 195,
							min = 0,
							count = 14,
							abs = 316,
							mit = 298,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 190,
							max = 190,
							min = 190,
							count = 1,
							abs = 0,
							mit = 54,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								career = 5,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								career = 5,
							},
						},
						parry = 0,
					},
					[L"Daemonic Lash"] = 
					{
						normal = 
						{
							min = 205,
							total = 205,
							count = 1,
							abs = 0,
							max = 205,
							mit = 30,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 282,
							total = 282,
							count = 1,
							abs = 0,
							max = 282,
							mit = 40,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Withering Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 1,
							abs = 138,
							mit = 44,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								career = 13,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								career = 13,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Da Big Un'"] = 
					{
						normal = 
						{
							min = 0,
							total = 0,
							count = 1,
							abs = 156,
							max = 0,
							mit = 32,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 232,
							total = 232,
							count = 1,
							abs = 0,
							max = 232,
							mit = 45,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Tzeentch's Cry"] = 
					{
						normal = 
						{
							min = 129,
							total = 129,
							count = 1,
							abs = 0,
							max = 129,
							mit = 30,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Pink Horror's Daemonic Fire"] = 
					{
						normal = 
						{
							min = 139,
							total = 139,
							count = 1,
							abs = 0,
							max = 139,
							mit = 33,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Dizzying Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 93,
							max = 93,
							min = 93,
							count = 1,
							abs = 30,
							mit = 44,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								career = 13,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								career = 13,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
				},
				
				{
					[L"Bludgeon"] = 
					{
						
						{
							overheal = 0,
							total = 5892,
							abs = 0,
							min = 27,
							count = 100,
							max = 110,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Costusss",
								id = 2707,
								level = 3,
								hp = 94,
								career = 23,
							},
							mit = 3651,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Lorok the Heartless",
								id = 3864,
								level = 7,
								hp = 97,
								career = 0,
							},
						},
						
						{
							overheal = 0,
							total = 707,
							abs = 0,
							min = 77,
							count = 8,
							max = 105,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 847,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 376,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4128,
								level = 7,
								hp = 100,
								career = 0,
							},
						}, 
						parry = 0,
					},
					[L"Castigation"] = 
					{
						[1] = 
						{
							overheal = 0,
							total = 325,
							abs = 0,
							min = 8,
							count = 15,
							max = 58,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4136,
								level = 5,
								hp = 100,
								career = 0,
							},
							mit = 202,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4186,
								level = 6,
								hp = 100,
								career = 0,
							},
						},
						normal = 
						{
							overheal = 0,
							total = 3331,
							abs = 47,
							min = 0,
							count = 219,
							max = 55,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								career = 24,
							},
							mit = 2131,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zaph",
								id = 1267,
								level = 9,
								hp = 100,
								career = 14,
							},
						},
						parry = 0,
					},
					[L"attack"] = 
					{
						
						{
							overheal = 0,
							total = 966,
							abs = 0,
							min = 13,
							count = 23,
							max = 67,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Costusss",
								id = 2707,
								level = 3,
								hp = 94,
								career = 23,
							},
							mit = 931,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Lorok the Heartless",
								id = 3864,
								level = 7,
								hp = 97,
								career = 0,
							},
						},
						
						{
							overheal = 0,
							total = 3568,
							abs = 0,
							min = 31,
							count = 101,
							max = 45,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 2112,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Escaped Patient",
								id = 4065,
								level = 7,
								hp = 100,
								career = 0,
							},
						},
						
						{
							str = L"Your Divine Assault heals you for 105 points.",
							currentTarget = true,
							time = 64937103492,
							value = 105,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								career = 0,
							},
							overheal = 0,
							type = 4,
							ability = L"Divine Assault",
							abs = 0,
							min = 43,
							total = 854,
							object = L"you",
							crit = false,
							max = 68,
							count = 17,
							mit = 516,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
						}, 
						normal = 
						{
							overheal = 0,
							total = 10214,
							abs = 0,
							min = 7,
							count = 332,
							max = 47,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Shikimara",
								id = 2674,
								level = 4,
								hp = 100,
								career = 22,
							},
							mit = 8430,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 68,
								career = 5,
							},
						},
						parry = 1,
					},
					[L"Divine Assault"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1471,
							max = 67,
							min = 0,
							count = 39,
							abs = 23,
							mit = 987,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Cracrah",
								id = 1273,
								level = 12,
								hp = 14,
								career = 6,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Rathil",
								id = 878,
								level = 10,
								hp = 71,
								career = 13,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 371,
							max = 69,
							min = 48,
							count = 6,
							abs = 0,
							mit = 161,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Murderous Raider",
								id = 434,
								level = 5,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								career = 5,
							},
						},
						parry = 1,
					},
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2495,
							abs = 0,
							min = 25,
							count = 52,
							max = 65,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Murderous Raider",
								id = 392,
								level = 5,
								hp = 100,
								career = 0,
							},
							mit = 1744,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 68,
								career = 5,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 73,
							abs = 0,
							min = 73,
							count = 1,
							max = 73,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Nurgling",
								id = 204,
								level = 1,
								hp = 100,
								career = 0,
							},
							mit = 23,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Nurgling",
								id = 204,
								level = 1,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Weight of Guilt"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 226,
							max = 79,
							min = 68,
							count = 3,
							abs = 0,
							mit = 146,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Murderous Raider",
								id = 521,
								level = 7,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								career = 5,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Divine Strike"] = 
					{
						
						{
							overheal = 13,
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							time = 64937103492,
							crit = true,
							str = L"Your Lingering Divine Aid critically heals you for 27 points. (13 overhealed)",
						},
						
						{
							overheal = 105,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							time = 64937103493,
							crit = false,
							str = L"Your Divine Assault heals you for 0 points. (105 overhealed)",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							time = 64937103494,
							crit = false,
							str = L"Your Lingering Divine Aid heals you for 27 points.",
						},
						
						{
							str = L"Your Divine Assault heals you for 143 points.",
							currentTarget = true,
							time = 64937103494,
							value = 143,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Rhetr",
								id = 2512,
								level = 10,
								hp = 26,
								career = 13,
							},
							overheal = 0,
							type = 4,
							ability = L"Divine Assault",
							abs = 66,
							min = 0,
							total = 468,
							object = L"you",
							crit = false,
							max = 90,
							count = 8,
							mit = 359,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Klaudiana",
								id = 2655,
								level = 3,
								hp = 79,
								career = 21,
							},
						}, 
						normal = 
						{
							overheal = 0,
							total = 2889,
							abs = 23,
							min = 0,
							count = 63,
							max = 76,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Shikimara",
								id = 2674,
								level = 4,
								hp = 100,
								career = 22,
							},
							mit = 1894,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Rathil",
								id = 878,
								level = 10,
								hp = 71,
								career = 13,
							},
						},
					},
					[L"ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 3,
							abs = 49,
							mit = 112,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								career = 5,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								career = 5,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Judgement"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 602,
							abs = 0,
							min = 21,
							count = 22,
							max = 51,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Anehtas",
								id = 2527,
								level = 12,
								hp = 100,
								career = 24,
							},
							mit = 501,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 114,
							abs = 0,
							min = 33,
							count = 3,
							max = 41,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Raven Host Marauder",
								career = 0,
								id = 187,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
							mit = 86,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tainted Hound",
								id = 4181,
								level = 7,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
				},
				
				{
					[L"Rybert - Lingering Divine Aid"] = 
					{
						normal = 
						{
							overheal = 1389,
							total = 3132,
							max = 45,
							min = 23,
							count = 149,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 57,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 196,
							total = 198,
							max = 64,
							min = 33,
							count = 9,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 1973,
								level = 11,
								hp = 43,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Zytorg - Rune of Serenity"] = 
					{
						normal = 
						{
							min = 119,
							total = 0,
							count = 3,
							abs = 0,
							max = 119,
							mit = 0,
							overheal = 357,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Rybert - Divine Strike"] = 
					{
						normal = 
						{
							overheal = 581,
							total = 2628,
							abs = 0,
							min = 15,
							count = 65,
							max = 80,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 74,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 58,
								career = 12,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Rybert - Divine Aid"] = 
					{
						normal = 
						{
							overheal = 888,
							total = 2731,
							max = 186,
							min = 95,
							count = 29,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 57,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 350,
							total = 175,
							max = 210,
							min = 140,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 59549,
								level = 12,
								hp = 100,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Juzzler - Divine Strike"] = 
					{
						normal = 
						{
							min = 60,
							total = 60,
							count = 1,
							abs = 0,
							max = 60,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Rybert - Divine Mend"] = 
					{
						normal = 
						{
							overheal = 685,
							total = 649,
							abs = 0,
							min = 199,
							count = 5,
							max = 326,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 1973,
								level = 11,
								hp = 73,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
								career = 12,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Rybert - Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 2560,
							total = 5588,
							abs = 0,
							min = 73,
							count = 89,
							max = 160,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 100,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								career = 12,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Rybert - Healing Hand"] = 
					{
						normal = 
						{
							overheal = 8178,
							total = 10907,
							abs = 0,
							min = 82,
							count = 166,
							max = 186,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 2800,
								level = 7,
								hp = 100,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 1446,
							total = 1124,
							abs = 0,
							min = 115,
							count = 16,
							max = 231,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 1973,
								level = 11,
								hp = 84,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 5,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Rybert - Divine Assault"] = 
					{
						normal = 
						{
							overheal = 9151,
							total = 11421,
							abs = 0,
							min = 108,
							count = 150,
							max = 241,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 100,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
								career = 12,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
				},
				
				{
					[L"Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 2560,
							total = 5588,
							abs = 0,
							min = 73,
							count = 89,
							max = 160,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 100,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								career = 12,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Breath of Sigmar"] = 
					{
						normal = 
						{
							min = 502,
							total = 502,
							count = 1,
							abs = 0,
							max = 502,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Lingering Divine Aid"] = 
					{
						normal = 
						{
							overheal = 2750,
							total = 7430,
							abs = 0,
							min = 23,
							count = 280,
							max = 47,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Novena",
								id = 970,
								level = 14,
								hp = 100,
								career = 9,
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 430,
							total = 830,
							max = 72,
							min = 33,
							count = 23,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Novena",
								id = 970,
								level = 14,
								hp = 65,
								career = 9,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Divine Mend"] = 
					{
						normal = 
						{
							overheal = 1041,
							total = 2475,
							abs = 0,
							min = 199,
							count = 12,
							max = 356,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Sicuxa",
								id = 1059,
								level = 13,
								hp = 98,
								career = 20,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Nightswatch",
								id = 3769,
								level = 11,
								hp = 10,
								career = 11,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 288,
							total = 676,
							max = 507,
							min = 457,
							count = 2,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Belldarkness",
								id = 1051,
								level = 12,
								hp = 89,
								career = 4,
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Kralgron",
								id = 885,
								level = 12,
								hp = 26,
								career = 1,
							},
						},
						parry = 0,
					},
					[L"Divine Assault"] = 
					{
						normal = 
						{
							overheal = 9151,
							total = 12735,
							abs = 0,
							min = 77,
							count = 161,
							max = 241,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 100,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Jullia",
								id = 2306,
								level = 13,
								hp = 53,
								career = 17,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 1024,
							total = 3574,
							max = 90,
							min = 15,
							count = 91,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Eladorin",
								id = 2470,
								level = 11,
								hp = 26,
								career = 17,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 58,
								career = 12,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Healing Hand"] = 
					{
						normal = 
						{
							overheal = 14641,
							total = 22186,
							max = 186,
							min = 82,
							count = 275,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 2800,
								level = 7,
								hp = 100,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 2608,
							total = 2829,
							count = 29,
							min = 115,
							abs = 0,
							max = 264,
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 5,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Divine Aid"] = 
					{
						normal = 
						{
							overheal = 1502,
							total = 6947,
							max = 191,
							min = 95,
							count = 56,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Novena",
								id = 970,
								level = 14,
								hp = 65,
								career = 9,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 350,
							total = 699,
							max = 270,
							min = 140,
							count = 5,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Svanson",
								id = 2376,
								level = 3,
								hp = 67,
								career = 18,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 6,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
				},
			},
			dt = 
			{
				minutes = 43,
				year = 2020,
				month = 4,
				day = 21,
				hours = 8,
				seconds = 2,
				totalSeconds = 64936975382,
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
	guardDistanceIndicatorAlphaWarning = 1,
	groupIconsHPBGColor = 
	{
		0,
		100,
		0,
	},
	timerEnabled = false,
	killSpamListBottomUp = false,
	groupIconsScale = 0.6,
	playerKills = 2,
	combatLogIDSMaxRows = L"5",
	groupIconsPetAlpha = 1,
	combatLogEPSShow = 
	{
		true,
		true,
		true,
		true,
	},
	combatLogTargetDefenseEnabled = false,
	markNewTarget = false,
	unitFramesTooltipMode = "always",
	unitFramesGroupsDirection1 = 2,
	combatLogEPSTimeframe = 7.5,
	combatLogEPSMaxValueMinTime = 4.5,
	combatLogTargetDefenseTotalBackground = 
	{
		0,
		0,
		0,
	},
	combatLogTargetDefenseScale = 1,
	combatLogIgnoreWhenPolymorphed = true,
	guardEnabled = false,
	unitFramesPadding2 = 40,
	combatLogEPSEnabled = 
	{
		true,
		true,
		true,
		true,
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
			scale = 1,
			firstLetters = 4,
			showCareerIcon = true,
			canClearOnClick = true,
			permanentTargets = 
			{
			},
			id = 1,
			layer = 3,
			alpha = 1,
			text = L"",
			color = 
			{
				191,
				255,
				0,
			},
			font = "font_clear_large_bold",
			name = L"A",
			targetOnClick = true,
			display = 2,
			offsetY = 50,
			neverExpire = false,
			permanent = false,
		},
		
		{
			scale = 1,
			firstLetters = 4,
			showCareerIcon = true,
			canClearOnClick = true,
			permanentTargets = 
			{
			},
			id = 2,
			layer = 3,
			alpha = 1,
			text = L"",
			color = 
			{
				255,
				64,
				255,
			},
			font = "font_clear_large_bold",
			name = L"B",
			targetOnClick = true,
			display = 2,
			offsetY = 50,
			neverExpire = false,
			permanent = true,
		},
		
		{
			scale = 1,
			firstLetters = 4,
			showCareerIcon = false,
			canClearOnClick = true,
			permanentTargets = 
			{
			},
			id = 3,
			layer = 3,
			alpha = 1,
			text = L"G",
			color = 
			{
				65,
				150,
				255,
			},
			font = "font_default_text_giant",
			name = L"G",
			targetOnClick = true,
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
	unitFramesIsVertical = false,
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	unitFramesSortingEnabled = true,
	groupIconsPetOffset = 
	{
		0,
		20,
	},
	groupIconsPetBGAlpha = 0.5,
	unitFramesMyGroupFirst = true,
	unitFramesScale = 1,
	combatLogTargetDefenseTotalEnabled = false,
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	soundOnNewTargetId = 500,
	timerActiveColor = 
	{
		255,
		255,
		75,
	},
	scenarioInfoData = 
	{
		maxTimer = 120,
		startingScenario = 0,
		destructionPoints = 75,
		id = 2103,
		queuedWithGroup = false,
		activeQueue = 0,
		mode = 2,
		orderPoints = 500,
		timeLeft = 94.051706490107,
		pointMax = 500,
	},
	guardDistanceIndicator = 2,
	combatLogIDSRowPadding = L"3",
	unitFramesEnabled = true,
	unitFramesHideMyGroup = false,
	combatLogTargetDefenseTimeframe = 7.5,
	guardDistanceIndicatorAnimation = true,
	combatLogLogParseErrors = true,
	debug = false,
	version = 279,
	combatLogIDSRowScale = 1,
	combatLogIDSRowBackground = 
	{
		225,
		50,
		50,
	},
	guardDistanceIndicatorColorWarning = 
	{
		255,
		50,
		50,
	},
	playerDeaths = 9,
	groupIconsShowOtherGroups = true,
	clickCastings = 
	{
	},
	groupIconsShowOnMarkedPlayers = false,
	groupIconsHPColor = 
	{
		200,
		255,
		0,
	},
	groupIconsOtherGroupsLayer = 0,
	chatDelay = 2,
	combatLogStatisticsEnabled = true,
	combatLogIDSRowSize = 
	{
		250,
		30,
	},
	scenarioInfoPlayers = 
	{
		
		{
			deaths = 1,
			renown = 1502,
			healing = 49,
			soloKills = 0,
			realm = 1,
			kills = 19,
			name = L"Cannella",
			career = 1,
			db = 0,
			level = 15,
			exp = 16473,
			damage = 4861,
		},
		
		{
			deaths = 4,
			renown = 377,
			healing = 4270,
			soloKills = 0,
			realm = 2,
			kills = 14,
			name = L"Mewten",
			career = 14,
			db = 3,
			level = 14,
			exp = 2216,
			damage = 32086,
		},
		
		{
			deaths = 3,
			renown = 1642,
			healing = 24993,
			soloKills = 0,
			realm = 1,
			kills = 32,
			name = L"Rybert",
			career = 12,
			db = 2,
			level = 11,
			exp = 29289,
			damage = 6058,
		},
		
		{
			deaths = 2,
			renown = 60,
			healing = 266,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Biffobea",
			career = 2,
			db = 0,
			level = 15,
			exp = 62,
			damage = 4016,
		},
		
		{
			deaths = 2,
			renown = 1562,
			healing = 639,
			soloKills = 0,
			realm = 1,
			kills = 15,
			name = L"Matric",
			career = 9,
			db = 3,
			level = 13,
			exp = 18929,
			damage = 19177,
		},
		
		{
			deaths = 4,
			renown = 397,
			healing = 15449,
			soloKills = 0,
			realm = 2,
			kills = 14,
			name = L"Goobber",
			career = 5,
			db = 2,
			level = 14,
			exp = 2602,
			damage = 21558,
		},
		
		{
			deaths = 1,
			renown = 1622,
			healing = 133,
			soloKills = 0,
			realm = 1,
			kills = 37,
			name = L"Frigginpew",
			career = 4,
			db = 7,
			level = 15,
			exp = 16276,
			damage = 31323,
		},
		
		{
			deaths = 5,
			renown = 337,
			healing = 473,
			soloKills = 0,
			realm = 2,
			kills = 8,
			name = L"Navec",
			career = 21,
			db = 2,
			level = 12,
			exp = 2216,
			damage = 15803,
		},
		
		{
			deaths = 3,
			renown = 503,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 9,
			name = L"Kashyik",
			career = 24,
			db = 0,
			level = 3,
			exp = 4703,
			damage = 12414,
		},
		
		{
			deaths = 0,
			renown = 2169,
			healing = 43811,
			soloKills = 0,
			realm = 1,
			kills = 42,
			name = L"Pxpx",
			career = 3,
			db = 0,
			level = 15,
			exp = 17718,
			damage = 1943,
		},
		
		{
			deaths = 3,
			renown = 1642,
			healing = 1318,
			soloKills = 0,
			realm = 1,
			kills = 31,
			name = L"Dynamire",
			career = 10,
			db = 1,
			level = 11,
			exp = 16246,
			damage = 13146,
		},
		
		{
			deaths = 2,
			renown = 437,
			healing = 60593,
			soloKills = 0,
			realm = 2,
			kills = 8,
			name = L"Curaqualecura",
			career = 15,
			db = 1,
			level = 15,
			exp = 2216,
			damage = 6799,
		},
		
		{
			deaths = 1,
			renown = 257,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 1,
			name = L"Harvestin",
			career = 5,
			db = 0,
			level = 8,
			exp = 1998,
			damage = 9700,
		},
		
		{
			deaths = 0,
			renown = 2624,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 45,
			name = L"Pithardt",
			career = 10,
			db = 14,
			level = 12,
			exp = 17432,
			damage = 79334,
		},
		
		{
			deaths = 6,
			renown = 417,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 9,
			name = L"Yeetyboi",
			career = 8,
			db = 1,
			level = 4,
			exp = 2468,
			damage = 16343,
		},
		
		{
			deaths = 0,
			renown = 2169,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 45,
			name = L"Brakly",
			career = 4,
			db = 15,
			level = 14,
			exp = 17418,
			damage = 59972,
		},
		
		{
			deaths = 2,
			renown = 1762,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 24,
			name = L"Phantasm",
			career = 17,
			db = 1,
			level = 9,
			exp = 16361,
			damage = 4612,
		},
		
		{
			deaths = 0,
			renown = 2169,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 45,
			name = L"Cumblast",
			career = 11,
			db = 6,
			level = 10,
			exp = 17236,
			damage = 35949,
		},
		
		{
			deaths = 0,
			renown = 2169,
			healing = 48613,
			soloKills = 0,
			realm = 1,
			kills = 46,
			name = L"Healasgod",
			career = 3,
			db = 0,
			level = 12,
			exp = 17228,
			damage = 541,
		},
		
		{
			deaths = 3,
			renown = 317,
			healing = 23317,
			soloKills = 0,
			realm = 2,
			kills = 8,
			name = L"Heerhall",
			career = 23,
			db = 2,
			level = 11,
			exp = 2420,
			damage = 12296,
		},
		
		{
			deaths = 2,
			renown = 1582,
			healing = 188,
			soloKills = 0,
			realm = 1,
			kills = 34,
			name = L"Xarktes",
			career = 4,
			db = 2,
			level = 12,
			exp = 16794,
			damage = 27445,
		},
		
		{
			deaths = 7,
			renown = 397,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 12,
			name = L"Dipdab",
			career = 16,
			db = 1,
			level = 6,
			exp = 2700,
			damage = 23047,
		},
		
		{
			deaths = 8,
			renown = 397,
			healing = 22015,
			soloKills = 0,
			realm = 2,
			kills = 9,
			name = L"Epifanov",
			career = 15,
			db = 0,
			level = 9,
			exp = 2216,
			damage = 1507,
		},
		
		{
			deaths = 5,
			renown = 397,
			healing = 6682,
			soloKills = 0,
			realm = 2,
			kills = 9,
			name = L"Groshark",
			career = 5,
			db = 2,
			level = 8,
			exp = 1998,
			damage = 13330,
		},
		
		{
			deaths = 3,
			renown = 417,
			healing = 24365,
			soloKills = 0,
			realm = 2,
			kills = 8,
			name = L"Nachtkerz",
			career = 7,
			db = 0,
			level = 5,
			exp = 2636,
			damage = 2477,
		},
		
		{
			deaths = 1,
			renown = 190,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 9,
			name = L"Aroz",
			career = 5,
			db = 2,
			level = 1,
			exp = 754,
			damage = 8110,
		},
	},
	unitFramesParts = 
	{
		
		{
			archetypeMatch = 1,
			id = "22677",
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
				pos = 
				{
					31,
					-1,
				},
				vertical = false,
				size = 
				{
					136,
					37,
				},
				deadHide = false,
				scale = 1,
				distHide = false,
				alpha = 1,
				texture = "rect",
			},
			exceptMe = false,
			name = L"Selection",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "selectionFrame",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22678",
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
				pos = 
				{
					31,
					-1,
				},
				size = 
				{
					136,
					37,
				},
				vertical = false,
				scale = 1,
				deadColor = 
				{
					200,
					50,
					50,
				},
				deadHide = false,
				distHide = false,
				alpha = 0.75,
				texture = "default2",
			},
			exceptMe = false,
			name = L"Background",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "panel",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22679",
			data = 
			{
				pos = 
				{
					35,
					3,
				},
				offlineHide = true,
				wrap = false,
				distAlpha = 0.5,
				color = 
				{
					150,
					190,
					255,
				},
				layer = 1,
				anchorFrom = "topleft",
				scale = 1,
				texture = "default",
				vertical = false,
				deadHide = true,
				textureFullResize = true,
				alpha = 1,
				distHide = false,
				anchorTo = "topleft",
				size = 
				{
					129,
					30,
				},
			},
			exceptMe = false,
			name = L"HP",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "hpbar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22680",
			data = 
			{
				offlineHide = true,
				pos = 
				{
					35,
					0,
				},
				anchorTo = "bottomleft",
				textureFullResize = true,
				layer = 2,
				anchorFrom = "bottomleft",
				distAlpha = 0.5,
				color = 
				{
					255,
					220,
					100,
				},
				deadHide = true,
				alpha = 1,
				vertical = false,
				scale = 1,
				distHide = false,
				size = 
				{
					128,
					3,
				},
				texture = "plain",
			},
			exceptMe = false,
			name = L"AP",
			playerType = 3,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "apbar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22681",
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
				color = 
				{
					255,
					255,
					255,
				},
				wrap = false,
				offlineHide = false,
				texture = "aluminium",
				pos = 
				{
					37,
					0,
				},
			},
			exceptMe = false,
			name = L"Name",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "nameText",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22682",
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
				pos = 
				{
					0,
					4,
				},
				scale = 1,
				anchorFrom = "topleft",
				size = 
				{
					28,
					28,
				},
				texture = "aluminium",
			},
			exceptMe = false,
			name = L"Icon",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "careerIcon",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22683",
			data = 
			{
				anchorTo = "bottomleft",
				scale = 0.8,
				layer = 2,
				anchorFrom = "bottomleft",
				pos = 
				{
					12,
					5,
				},
				vertical = false,
				size = 
				{
					30,
					20,
				},
				align = "center",
				font = "font_clear_small_bold",
				color = 
				{
					255,
					255,
					255,
				},
				alpha = 1,
				texture = "aluminium",
			},
			exceptMe = false,
			name = L"Level",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "levelText",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22684",
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
				pos = 
				{
					-5,
					-1,
				},
				scale = 1,
				anchorFrom = "topleft",
				size = 
				{
					16,
					16,
				},
				texture = "star",
			},
			exceptMe = false,
			name = L"Leader",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "groupLeaderIcon",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22685",
			data = 
			{
				pos = 
				{
					37,
					4,
				},
				offlineHide = true,
				color = 
				{
					120,
					200,
					255,
				},
				anchorTo = "topleft",
				scale = 1,
				layer = 3,
				alpha = 1,
				size = 
				{
					38,
					10,
				},
				textureFullResize = false,
				deadHide = true,
				prefix = L"M ",
				suffix = L"",
				vertical = false,
				distHide = false,
				anchorFrom = "topleft",
				texture = "4dots",
			},
			exceptMe = false,
			name = L"Morale",
			playerType = 3,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "moraleBar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22686",
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
				vertical = false,
				scale = 0.9,
				texture = "aluminium",
				pos = 
				{
					-3,
					3,
				},
			},
			exceptMe = true,
			name = L"Distance",
			playerType = 1,
			isEnabled = false,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "distanceText",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22687",
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
				vertical = false,
				size = 
				{
					40,
					10,
				},
				pos = 
				{
					-3,
					4,
				},
			},
			exceptMe = false,
			name = L"Distance bar",
			playerType = 1,
			isEnabled = true,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "distanceBar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "22688",
			data = 
			{
				anchorTo = "right",
				color = 
				{
					255,
					255,
					255,
				},
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
				scale = 0.7,
				texture = "3dots",
				align = "rightcenter",
				font = "font_clear_small_bold",
				pos = 
				{
					-3,
					1,
				},
			},
			exceptMe = false,
			name = L"HP %",
			playerType = 1,
			isEnabled = false,
			archetypes = 
			{
				false,
				false,
				false,
			},
			type = "hppText",
			playerTypeMatch = 1,
		},
	},
	unitFramesPadding1 = 8,
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
	intercomPrivate = true,
	groupIconsOtherGroupsBGAlpha = 0.5,
	playerKDRDisplayMode = 5,
	killSpamReparseChunkSize = 20,
	groupIconsHideOnSelf = true,
	objectWindowsTimeout = 20,
	combatLogIgnoreNpc = false,
	unitFramesCount1 = 6,
	combatLogIDSEnabled = false,
	guardDistanceIndicatorClickThrough = false,
	combatLogTargetDefenseTotalCalculate = 
	{
		false,
		true,
		true,
		true,
		true,
		true,
	},
	groupIconsBGColor = 
	{
		200,
		255,
		0,
	},
	groupIconsPetBGColor = 
	{
		255,
		225,
		255,
	},
	unitFramesGroupsPadding1 = 40,
	scenarioInfoEnabled = true,
	guardDistanceIndicatorColorNormal = 
	{
		127,
		181,
		255,
	},
	killSpamEnabled = true,
	newTargetMarkTemplate = 
	{
		color = 
		{
			b = 0,
			g = 0,
			r = 255,
		},
		unique = false,
		firstLetters = 4,
		showCareerIcon = true,
		canClearOnClick = true,
		permanentTargets = 
		{
		},
		id = 45,
		layer = 3,
		alpha = 1,
		scale = 1,
		text = L"KILL",
		font = "font_clear_large_bold",
		name = L"",
		targetOnClick = true,
		display = 1,
		offsetY = 50,
		neverExpire = false,
		permanent = false,
	},
	stateMachineThrottle = 0.3,
	unitFramesGroupsDirection2 = 3,
	groupIconsTargetOnClick = true,
}




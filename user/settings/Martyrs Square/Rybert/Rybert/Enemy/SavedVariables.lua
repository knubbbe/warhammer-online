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
	unitFramesDirection1 = 2,
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
	groupIconsEnabled = true,
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
	unitFramesHideWhenSolo = false,
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
					typeMatch = 1,
					type = "guard",
					durationType = 3,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyGuard",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
			scale = 1,
			anchorFrom = 8,
			exceptMe = true,
			offsetX = 10,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "13",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 5,
			name = L"My guard",
			playerType = 3,
			isEnabled = true,
			offsetY = 2,
			color = 
			{
				r = 191,
				g = 243,
				b = 127,
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
					typeMatch = 1,
					type = "guard",
					durationType = 3,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"NotMyGuard",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
			scale = 0.8,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 8,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "14",
			alpha = 1,
			archetypeMatch = 2,
			name = L"Other guard",
			playerType = 3,
			isEnabled = true,
			anchorTo = 5,
			color = 
			{
				r = 127,
				g = 181,
				b = 255,
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
					castedByMe = 1,
					descriptionMatch = 2,
					nameMatch = 1,
					filterName = L"Any",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -25,
			icon = "dot",
			canDispell = 2,
			isCircleIcon = false,
			id = "15",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 9,
			name = L"Any dispellable",
			playerType = 1,
			isEnabled = true,
			offsetY = 0,
			color = 
			{
				r = 255,
				g = 60,
				b = 119,
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
					type = "isHealing",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -14,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "16",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 9,
			name = L"HoT",
			playerType = 1,
			isEnabled = true,
			offsetY = 0,
			color = 
			{
				r = 255,
				g = 191,
				b = 0,
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
			scale = 1,
			anchorFrom = 9,
			exceptMe = true,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "17",
			alpha = 1,
			logic = L"MyBuff and not MyHealing",
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
			},
			effectFilters = 
			{
				
				{
					typeMatch = 1,
					type = "isBuff",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyBuff",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
				
				{
					typeMatch = 1,
					type = "isHealing",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
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
			anchorTo = 9,
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "18",
			alpha = 1,
			logic = L"MyBlessing and not MyHealing",
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
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
					typeMatch = 1,
					type = "isHealing",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
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
					typeMatch = 1,
					type = "healDebuffOut50",
					durationType = 1,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"OutHealDebuff",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
			scale = 0.6,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -53,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "19",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 8,
			name = L"Outgoing 50% heal debuff",
			playerType = 1,
			isEnabled = true,
			offsetY = -5,
			color = 
			{
				r = 191,
				g = 255,
				b = 64,
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
					type = "healDebuffIn50",
					durationType = 1,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"InHealDebuff",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
			scale = 0.6,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -40,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "20",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 8,
			name = L"Incomming 50% heal debuff",
			playerType = 1,
			isEnabled = true,
			offsetY = -5,
			color = 
			{
				r = 255,
				g = 64,
				b = 64,
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
					type = "stagger",
					durationType = 2,
					nameMatch = 1,
					castedByMe = 1,
					filterName = L"Stagger",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
			scale = 0.75,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			icon = "stagger",
			canDispell = 1,
			isCircleIcon = false,
			id = "21",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Stagger",
			playerType = 1,
			isEnabled = true,
			anchorTo = 5,
			color = 
			{
				r = 255,
				g = 255,
				b = 128,
			},
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
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 1,
					abilityIds = L"9561, 8237",
					abilityIdsHash = 
					{
						[9561] = true,
						[8237] = true,
					},
					nameMatch = 1,
					hasDurationLimit = false,
				},
			},
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -65,
			icon = "disabled",
			canDispell = 1,
			isCircleIcon = false,
			id = "22",
			alpha = 1,
			archetypeMatch = 1,
			anchorTo = 8,
			name = L"DoK/WP regen",
			playerType = 1,
			isEnabled = true,
			offsetY = -5,
			color = 
			{
				r = 255,
				g = 64,
				b = 128,
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
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					abilityIds = L"613",
					abilityIdsHash = 
					{
						[613] = true,
					},
					nameMatch = 1,
					hasDurationLimit = false,
				},
			},
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 23175,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "23",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Immaculate Defense",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
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
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					abilityIds = L"653, 674, 695, 3882",
					abilityIdsHash = 
					{
						[3882] = true,
						[674] = true,
						[653] = true,
						[695] = true,
					},
					nameMatch = 1,
					hasDurationLimit = false,
				},
			},
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 23153,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "24",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Focused Mind",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
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
					filterName = L"TODB",
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					abilityIds = L"9616",
					abilityIdsHash = 
					{
						[9616] = true,
					},
					nameMatch = 1,
					hasDurationLimit = false,
				},
			},
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 10965,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "25",
			alpha = 1,
			archetypeMatch = 1,
			name = L"1001 Dark Blessings",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
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
					filterName = L"GOF",
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					abilityIds = L"8308",
					abilityIdsHash = 
					{
						[8308] = true,
					},
					nameMatch = 1,
					hasDurationLimit = false,
				},
			},
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			customIcon = 8042,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "25",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Gift of Life",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
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
					filterName = L"AnyMarkOrRune",
					descriptionMatch = 2,
					castedByMe = 2,
					durationType = 1,
					abilityIds = L"3746, 8551, 8617, 3748, 8560, 8619, 20458, 3747, 8556, 8618, 3038, 3773, 8567, 8620, 1591, 3670, 20476, 1588, 1600, 3570, 1608, 3650, 3671",
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
						[1588] = true,
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
						[3671] = true,
						[20476] = true,
					},
					nameMatch = 1,
					hasDurationLimit = false,
				},
			},
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -36,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "26",
			alpha = 1,
			archetypeMatch = 1,
			name = L"My marks/runes",
			playerType = 3,
			isEnabled = true,
			anchorTo = 9,
			color = 
			{
				r = 0,
				g = 255,
				b = 221,
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
					filterName = L"WordOfPain",
					abilityIds = L"9475, 20535",
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
					descriptionMatch = 2,
				},
			},
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 6,
			customIcon = 10908,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "27",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Word of Pain",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
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
					filterName = L"BoilingBlood",
					abilityIds = L"8165",
					castedByMe = 1,
					typeMatch = 1,
					durationMax = 5,
					nameMatch = 1,
					abilityIdsHash = 
					{
						[8165] = true,
					},
					hasDurationLimit = true,
					descriptionMatch = 2,
				},
			},
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 6,
			customIcon = 8015,
			icon = "other",
			canDispell = 1,
			isCircleIcon = false,
			id = "28",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Boiling Blood",
			playerType = 3,
			isEnabled = true,
			anchorTo = 2,
			color = 
			{
				r = 255,
				g = 255,
				b = 255,
			},
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
		layer = 3,
		alpha = 1,
		targetOnClick = true,
		font = "font_default_text_giant",
		name = L"",
		text = L"G",
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
					total = 1592,
					objectTime = 64938459029,
					data = 
					{
						
						{
							str = L"Zumzat's ability hits you for 8 damage. (27 mitigated) (52 absorbed)",
							type = 1,
							abs = 52,
							currentTarget = true,
							time = 64938459035,
							object = L"Zumzat",
							value = 8,
							crit = false,
							mit = 27,
							ability = L"ability",
						},
						
						{
							str = L"Ninimae's Pink Horror's attack hits you for 57 damage. (20 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459035,
							object = L"Ninimae",
							value = 57,
							crit = false,
							mit = 20,
							ability = L"Pink Horror's attack",
						},
						
						{
							str = L"Zumzat's Trip 'Em Up hits you for 102 damage. (37 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 102,
							crit = false,
							mit = 37,
							ability = L"Trip 'Em Up",
						},
						
						{
							str = L"Ninimae's Pink Horror's attack hits you for 57 damage. (20 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459037,
							object = L"Ninimae",
							value = 57,
							crit = false,
							mit = 20,
							ability = L"Pink Horror's attack",
						},
						
						{
							str = L"Ninimae's Baleful Transmogrification critically hits you for 210 damage. (40 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459037,
							object = L"Ninimae",
							value = 210,
							crit = true,
							mit = 40,
							ability = L"Baleful Transmogrification",
						},
						
						{
							str = L"Zumzat's attack hits you for 60 damage. (27 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 60,
							crit = false,
							mit = 27,
							ability = L"attack",
						},
						
						{
							str = L"Ninimae's Pink Horror's Daemonic Fire hits you for 139 damage. (33 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459038,
							object = L"Ninimae",
							value = 139,
							crit = false,
							mit = 33,
							ability = L"Pink Horror's Daemonic Fire",
						},
						
						{
							str = L"Ninimae's Pink Horror's attack hits you for 60 damage. (17 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459039,
							object = L"Ninimae",
							value = 60,
							crit = false,
							mit = 17,
							ability = L"Pink Horror's attack",
						},
						
						{
							str = L"Zumzat's attack hits you for 78 damage. (35 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459039,
							object = L"Zumzat",
							value = 78,
							crit = false,
							mit = 35,
							ability = L"attack",
						},
						
						{
							str = L"Zumzat's Skull Thumper hits you for 172 damage. (53 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459039,
							object = L"Zumzat",
							value = 172,
							crit = false,
							mit = 53,
							ability = L"Skull Thumper",
						},
						
						{
							str = L"Packo's Brain Bursta hits you for 229 damage. (32 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459040,
							object = L"Packo",
							value = 229,
							crit = false,
							mit = 32,
							ability = L"Brain Bursta",
						},
						
						{
							str = L"Ninimae's Baleful Transmogrification hits you for 158 damage. (20 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459040,
							object = L"Ninimae",
							value = 158,
							crit = false,
							mit = 20,
							ability = L"Baleful Transmogrification",
						},
						
						{
							str = L"Recuvah's Tzeentch's Cry hits you for 129 damage. (30 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459040,
							object = L"Recuvah",
							value = 129,
							crit = false,
							mit = 30,
							ability = L"Tzeentch's Cry",
						},
						
						{
							str = L"Zumzat's Clobber hits you for 0 damage. (50 mitigated) (148 absorbed)",
							type = 1,
							abs = 148,
							currentTarget = false,
							time = 64938459041,
							object = L"Zumzat",
							value = 0,
							crit = false,
							mit = 50,
							ability = L"Clobber",
						},
						
						{
							str = L"Zumzat's ability hits you for 60 damage. (35 mitigated) (18 absorbed)",
							type = 1,
							abs = 18,
							currentTarget = false,
							time = 64938459042,
							object = L"Zumzat",
							value = 60,
							crit = false,
							mit = 35,
							ability = L"ability",
						},
						
						{
							str = L"Ninimae's Flickering Red Fire hits you for 305 damage. (44 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938459042,
							object = L"Ninimae",
							value = 305,
							crit = false,
							mit = 44,
							ability = L"Flickering Red Fire",
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Zumzat's ability hits you for 8 damage. (27 mitigated) (52 absorbed)",
							type = 1,
							abs = 52,
							currentTarget = true,
							time = 64938459035,
							object = L"Zumzat",
							value = 8,
							crit = false,
							mit = 27,
							ability = L"ability",
						},
						
						{
							str = L"Zumzat's Trip 'Em Up hits you for 102 damage. (37 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 102,
							crit = false,
							mit = 37,
							ability = L"Trip 'Em Up",
						},
						
						{
							str = L"Zumzat's attack hits you for 60 damage. (27 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 60,
							crit = false,
							mit = 27,
							ability = L"attack",
						},
					},
					valueAoe = 0,
					valueMax = 227,
					value = 227,
					object = L"Zumzat",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Zumzat",
							ability = L"attack",
							value = 16,
							mit = 39,
							crit = false,
							time = 64938459027,
						},
						
						{
							str = L"Your Divine Assault hits Zumzat for 34 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Zumzat",
							ability = L"Divine Assault",
							value = 34,
							mit = 32,
							crit = false,
							time = 64938459028,
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Zumzat",
							ability = L"attack",
							value = 16,
							mit = 39,
							crit = false,
							time = 64938459031,
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Zumzat",
							ability = L"attack",
							value = 16,
							mit = 39,
							crit = false,
							time = 64938459033,
						},
					},
					total = 82,
					objectTime = 64938459027,
					data = 
					{
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459027,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Assault hits Zumzat for 34 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459028,
							object = L"Zumzat",
							value = 34,
							crit = false,
							mit = 32,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459031,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							ability = L"attack",
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459033,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							ability = L"attack",
						},
					},
					totalAoe = 82,
					valueMaxData = 
					{
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459027,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Assault hits Zumzat for 34 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459028,
							object = L"Zumzat",
							value = 34,
							crit = false,
							mit = 32,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459031,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							ability = L"attack",
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459033,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							ability = L"attack",
						},
					},
					valueAoe = 14,
					valueMax = 14,
					value = 14,
					object = L"Zumzat",
					valueAoeMax = 14,
				},
				
				{
					totalAoe = 0,
					valueMaxData = 
					{
					},
					valueAoe = 0,
					valueMax = 44,
					value = 44,
					data = 
					{
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = false,
							time = 64938459027,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = false,
							time = 64938459033,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"Rybert",
						},
					},
					total = 266,
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Healing Hand heals you for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = false,
							time = 64938459005,
							value = 163,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Strike heals Helgapataki for 36 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64938459006,
							value = 36,
							overheal = 0,
							crit = false,
							object = L"Helgapataki",
						},
						
						{
							str = L"Your Divine Strike heals Kar for 0 points. (36 overhealed)",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = false,
							time = 64938459006,
							value = 0,
							overheal = 36,
							crit = false,
							object = L"Kar",
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = false,
							time = 64938459006,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Healing Hand heals Helgapataki for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64938459006,
							value = 163,
							overheal = 0,
							crit = false,
							object = L"Helgapataki",
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = false,
							time = 64938459008,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Assault heals Helgapataki for 119 points.",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64938459008,
							value = 119,
							overheal = 0,
							crit = false,
							object = L"Helgapataki",
						},
						
						{
							str = L"Your Healing Hand heals you for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = false,
							time = 64938459008,
							value = 163,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Assault heals Helgapataki for 119 points.",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64938459009,
							value = 119,
							overheal = 0,
							crit = false,
							object = L"Helgapataki",
						},
						
						{
							str = L"Your Healing Hand heals Helgapataki for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64938459009,
							value = 163,
							overheal = 0,
							crit = false,
							object = L"Helgapataki",
						},
						
						{
							str = L"Your Divine Assault heals Helgapataki for 119 points.",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64938459010,
							value = 119,
							overheal = 0,
							crit = false,
							object = L"Helgapataki",
						},
						
						{
							str = L"Your Divine Assault heals Helgapataki for 168 points.",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64938459011,
							value = 168,
							overheal = 0,
							crit = false,
							object = L"Helgapataki",
						},
						
						{
							str = L"Your Healing Hand critically heals you for 226 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = false,
							time = 64938459011,
							value = 226,
							overheal = 0,
							crit = true,
							object = L"you",
						},
					},
					total = 834,
					objectTime = 64938459024,
					data = 
					{
						
						{
							str = L"Your Divine Aid heals Kar for 174 points.",
							type = 4,
							ability = L"Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 174,
							time = 64938459026,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459027,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = false,
							object = L"you",
							value = 133,
							time = 64938459027,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Assault heals Kar for 119 points.",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Kar",
							value = 119,
							time = 64938459028,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals Kar for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Kar",
							value = 163,
							time = 64938459028,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459028,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459029,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459030,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals Kar for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Kar",
							value = 163,
							time = 64938459031,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459031,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = false,
							object = L"you",
							value = 133,
							time = 64938459033,
							crit = false,
							overheal = 0,
						},
					},
					totalAoe = 1100,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Mend heals Kar for 326 points.",
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"Kar",
							value = 326,
							time = 64938459024,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals Kar for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Kar",
							value = 163,
							time = 64938459025,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Aid heals Kar for 174 points.",
							type = 4,
							ability = L"Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 174,
							time = 64938459026,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459027,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Assault heals Kar for 119 points.",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Kar",
							value = 119,
							time = 64938459028,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals Kar for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Kar",
							value = 163,
							time = 64938459028,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459028,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459029,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459030,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals Kar for 163 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Kar",
							value = 163,
							time = 64938459031,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Kar for 43 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Kar",
							value = 43,
							time = 64938459031,
							crit = false,
							overheal = 0,
						},
					},
					object = L"Kar",
					valueMax = 189,
					value = 119,
					valueAoe = 157,
					valueAoeMax = 290,
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
								career = 24,
								isFriendly = false,
								id = 882,
								level = 11,
								hp = 97,
								name = L"Vesi",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								isFriendly = false,
								id = 882,
								level = 11,
								hp = 97,
								name = L"Vesi",
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
								career = 0,
								isFriendly = false,
								id = 239,
								level = 3,
								hp = 100,
								name = L"Eoldred Nightbane",
							},
							mit = 21,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 239,
								level = 3,
								hp = 100,
								name = L"Eoldred Nightbane",
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
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 48,
								name = L"Zumzat",
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
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
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
								career = 13,
								isFriendly = false,
								id = 2314,
								level = 14,
								hp = 94,
								name = L"Kharnivour",
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
								career = 0,
								isFriendly = false,
								id = 4186,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 250,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 1181,
								level = 7,
								hp = 100,
								career = 0,
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
								career = 0,
								isFriendly = false,
								id = 4184,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 782,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 1196,
								level = 7,
								hp = 100,
								career = 0,
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
								career = 0,
								isFriendly = false,
								id = 4262,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 84,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4039,
								level = 8,
								hp = 100,
								name = L"Krev the Plunderer",
							},
						},
						normal = 
						{
							overheal = 0,
							total = 5247,
							abs = 8813,
							min = 0,
							count = 179,
							max = 2016,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 2305,
								level = 7,
								hp = 67,
								name = L"Rybert",
							},
							mit = 4504,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
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
								career = 13,
								isFriendly = false,
								id = 2314,
								level = 14,
								hp = 94,
								name = L"Kharnivour",
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
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
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
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
							},
							mit = 7,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
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
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
							},
							mit = 57,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
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
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
							},
							overheal = 0,
							type = 4,
							abs = 0,
							total = 113,
							min = 113,
							crit = false,
							object = L"you",
							max = 113,
							ability = L"Healing Hand",
							count = 1,
							mit = 29,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
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
							mit = 311,
							abs = 534,
							max = 167,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
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
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
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
								name = L"Tainted Hound",
								isFriendly = false,
								id = 1180,
								level = 6,
								hp = 100,
								career = 0,
							},
							mit = 83,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 1180,
								level = 6,
								hp = 100,
								career = 0,
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
								career = 0,
								isFriendly = false,
								id = 4184,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 627,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 1196,
								level = 7,
								hp = 100,
								career = 0,
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
								career = 0,
								isFriendly = false,
								id = 3937,
								level = 7,
								hp = 30,
								name = L"Blackhand the Deceiver",
							},
							mit = 638,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 206,
								level = 1,
								hp = 100,
								name = L"Nurgling",
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
								career = 0,
								isFriendly = false,
								id = 3937,
								level = 7,
								hp = 30,
								name = L"Blackhand the Deceiver",
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
								career = 24,
								isFriendly = false,
								id = 882,
								level = 11,
								hp = 97,
								name = L"Vesi",
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
								career = 0,
								isFriendly = false,
								id = 239,
								level = 3,
								hp = 100,
								name = L"Eoldred Nightbane",
							},
							mit = 21,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 239,
								level = 3,
								hp = 100,
								name = L"Eoldred Nightbane",
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
								career = 8,
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								name = L"Terrorbit",
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
								career = 6,
								isFriendly = false,
								id = 1273,
								level = 12,
								hp = 14,
								name = L"Cracrah",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 6,
								isFriendly = false,
								id = 1273,
								level = 12,
								hp = 14,
								name = L"Cracrah",
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
								career = 0,
								isFriendly = false,
								id = 139,
								level = 4,
								hp = 100,
								name = L"Sigmundi Spirit",
							},
							mit = 132,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 294,
								level = 3,
								hp = 100,
								name = L"Sigmundi Spirit",
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
								career = 24,
								isFriendly = false,
								id = 882,
								level = 11,
								hp = 97,
								name = L"Vesi",
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
								career = 0,
								isFriendly = false,
								id = 139,
								level = 4,
								hp = 100,
								name = L"Sigmundi Spirit",
							},
							mit = 147,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 294,
								level = 3,
								hp = 100,
								name = L"Sigmundi Spirit",
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
								isFriendly = false,
								career = 0,
								id = 284,
								level = 2,
								hp = 100,
								name = L"Argog the Unstoppable",
							},
							mit = 1,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 284,
								level = 2,
								hp = 100,
								name = L"Argog the Unstoppable",
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
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
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
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 48,
								name = L"Zumzat",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 48,
								name = L"Zumzat",
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
								career = 13,
								isFriendly = false,
								id = 2314,
								level = 14,
								hp = 94,
								name = L"Kharnivour",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 2314,
								level = 14,
								hp = 94,
								name = L"Kharnivour",
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
								career = 13,
								isFriendly = false,
								id = 2314,
								level = 14,
								hp = 94,
								name = L"Kharnivour",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 2314,
								level = 14,
								hp = 94,
								name = L"Kharnivour",
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
								career = 23,
								isFriendly = false,
								id = 2707,
								level = 3,
								hp = 94,
								name = L"Costusss",
							},
							mit = 3651,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 3864,
								level = 7,
								hp = 97,
								name = L"Lorok the Heartless",
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
								name = L"Tainted Hound",
								isFriendly = false,
								id = 847,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 376,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4128,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
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
								career = 0,
								isFriendly = false,
								id = 4136,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 202,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4186,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						normal = 
						{
							overheal = 0,
							total = 3265,
							abs = 47,
							min = 0,
							count = 216,
							max = 55,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								isFriendly = false,
								id = 882,
								level = 11,
								hp = 97,
								name = L"Vesi",
							},
							mit = 2106,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 14,
								isFriendly = false,
								id = 1267,
								level = 9,
								hp = 100,
								name = L"Zaph",
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
								career = 23,
								isFriendly = false,
								id = 2707,
								level = 3,
								hp = 94,
								name = L"Costusss",
							},
							mit = 931,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 3864,
								level = 7,
								hp = 97,
								name = L"Lorok the Heartless",
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
								name = L"Tainted Hound",
								isFriendly = false,
								id = 1180,
								level = 6,
								hp = 100,
								career = 0,
							},
							mit = 2112,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4065,
								level = 7,
								hp = 100,
								name = L"Escaped Patient",
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
								career = 0,
								isFriendly = false,
								id = 3937,
								level = 7,
								hp = 30,
								name = L"Blackhand the Deceiver",
							},
							overheal = 0,
							type = 4,
							abs = 0,
							total = 854,
							min = 43,
							crit = false,
							object = L"you",
							max = 68,
							ability = L"Divine Assault",
							count = 17,
							mit = 516,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 1180,
								level = 6,
								hp = 100,
								career = 0,
							},
						}, 
						normal = 
						{
							overheal = 0,
							total = 10062,
							abs = 0,
							min = 7,
							count = 328,
							max = 47,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 22,
								isFriendly = false,
								id = 2674,
								level = 4,
								hp = 100,
								name = L"Shikimara",
							},
							mit = 8346,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 68,
								name = L"Zumzat",
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
								career = 6,
								isFriendly = false,
								id = 1273,
								level = 12,
								hp = 14,
								name = L"Cracrah",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 878,
								level = 10,
								hp = 71,
								name = L"Rathil",
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
								career = 0,
								isFriendly = false,
								id = 434,
								level = 5,
								hp = 100,
								name = L"Murderous Raider",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 48,
								name = L"Zumzat",
							},
						},
						parry = 1,
					},
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2435,
							abs = 0,
							min = 25,
							count = 51,
							max = 65,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 392,
								level = 5,
								hp = 100,
								name = L"Murderous Raider",
							},
							mit = 1716,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 68,
								name = L"Zumzat",
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
								career = 0,
								isFriendly = false,
								id = 204,
								level = 1,
								hp = 100,
								name = L"Nurgling",
							},
							mit = 23,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 204,
								level = 1,
								hp = 100,
								name = L"Nurgling",
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
								career = 0,
								isFriendly = false,
								id = 521,
								level = 7,
								hp = 100,
								name = L"Murderous Raider",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2155,
								level = 11,
								hp = 100,
								name = L"Zumzat",
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
								career = 13,
								isFriendly = false,
								id = 2512,
								level = 10,
								hp = 26,
								name = L"Rhetr",
							},
							overheal = 0,
							type = 4,
							abs = 66,
							total = 468,
							min = 0,
							crit = false,
							object = L"you",
							max = 90,
							ability = L"Divine Assault",
							count = 8,
							mit = 359,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 21,
								isFriendly = false,
								id = 2655,
								level = 3,
								hp = 79,
								name = L"Klaudiana",
							},
						}, 
						normal = 
						{
							overheal = 0,
							total = 2829,
							abs = 23,
							min = 0,
							count = 62,
							max = 76,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 22,
								isFriendly = false,
								id = 2674,
								level = 4,
								hp = 100,
								name = L"Shikimara",
							},
							mit = 1869,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 878,
								level = 10,
								hp = 71,
								name = L"Rathil",
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
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 48,
								name = L"Zumzat",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 2295,
								level = 11,
								hp = 48,
								name = L"Zumzat",
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
								career = 24,
								isFriendly = false,
								id = 2527,
								level = 12,
								hp = 100,
								name = L"Anehtas",
							},
							mit = 501,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 3937,
								level = 7,
								hp = 30,
								name = L"Blackhand the Deceiver",
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
								isFriendly = false,
								name = L"Raven Host Marauder",
								id = 187,
								level = 1,
								hp = 100,
								career = 0,
							},
							mit = 86,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4181,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
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
							overheal = 1241,
							total = 3132,
							max = 45,
							min = 23,
							count = 145,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 117,
								level = 10,
								hp = 57,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 145,
							total = 198,
							max = 64,
							min = 33,
							count = 8,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 1973,
								level = 11,
								hp = 43,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
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
							overheal = 521,
							total = 2628,
							abs = 0,
							min = 15,
							count = 64,
							max = 80,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 117,
								level = 10,
								hp = 74,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 117,
								level = 10,
								hp = 58,
								name = L"Rybert",
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
								career = 12,
								isFriendly = true,
								id = 117,
								level = 10,
								hp = 57,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 140,
							total = 175,
							max = 175,
							min = 140,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 66,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
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
							overheal = 398,
							total = 649,
							abs = 0,
							min = 199,
							count = 4,
							max = 326,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 1973,
								level = 11,
								hp = 73,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 2800,
								level = 8,
								hp = 100,
								name = L"Rybert",
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
								career = 12,
								isFriendly = true,
								id = 2305,
								level = 7,
								hp = 100,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
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
								career = 12,
								isFriendly = true,
								id = 2800,
								level = 7,
								hp = 100,
								name = L"Rybert",
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
								career = 12,
								isFriendly = true,
								id = 1973,
								level = 11,
								hp = 84,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Rybert",
								id = 114,
								level = 5,
								hp = 100,
								career = 12,
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
								career = 12,
								isFriendly = true,
								id = 117,
								level = 10,
								hp = 100,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 2800,
								level = 8,
								hp = 100,
								name = L"Rybert",
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
								career = 12,
								isFriendly = true,
								id = 2305,
								level = 7,
								hp = 100,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
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
							overheal = 2367,
							total = 7054,
							count = 263,
							min = 23,
							abs = 0,
							max = 47,
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 379,
							total = 689,
							max = 64,
							min = 33,
							count = 20,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 1973,
								level = 11,
								hp = 43,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
							},
						},
						parry = 0,
					},
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 964,
							total = 3574,
							max = 90,
							min = 15,
							count = 90,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 17,
								isFriendly = true,
								id = 2470,
								level = 11,
								hp = 26,
								name = L"Eladorin",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 117,
								level = 10,
								hp = 58,
								name = L"Rybert",
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
								career = 12,
								isFriendly = true,
								id = 117,
								level = 10,
								hp = 100,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 17,
								isFriendly = true,
								id = 2306,
								level = 13,
								hp = 53,
								name = L"Jullia",
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
							overheal = 13784,
							total = 22148,
							max = 186,
							min = 82,
							count = 270,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 2800,
								level = 7,
								hp = 100,
								name = L"Rybert",
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
								isFriendly = true,
								name = L"Rybert",
								id = 114,
								level = 5,
								hp = 100,
								career = 12,
							},
						},
						parry = 0,
					},
					[L"Divine Mend"] = 
					{
						normal = 
						{
							overheal = 398,
							total = 2475,
							abs = 0,
							min = 199,
							count = 10,
							max = 326,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 2,
								isFriendly = true,
								id = 2302,
								level = 11,
								hp = 64,
								name = L"Kar",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 11,
								isFriendly = true,
								id = 3769,
								level = 11,
								hp = 10,
								name = L"Nightswatch",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 457,
							max = 457,
							min = 457,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 1,
								isFriendly = true,
								id = 885,
								level = 12,
								hp = 26,
								name = L"Kralgron",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 1,
								isFriendly = true,
								id = 885,
								level = 12,
								hp = 26,
								name = L"Kralgron",
							},
						},
						parry = 0,
					},
					[L"Divine Aid"] = 
					{
						normal = 
						{
							overheal = 1311,
							total = 6565,
							max = 191,
							min = 95,
							count = 53,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 17,
								isFriendly = true,
								id = 2470,
								level = 11,
								hp = 70,
								name = L"Eladorin",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 140,
							total = 699,
							max = 270,
							min = 140,
							count = 4,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 18,
								isFriendly = true,
								id = 2376,
								level = 3,
								hp = 67,
								name = L"Svanson",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 6,
								hp = 100,
								name = L"Rybert",
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
	playerKills = 0,
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
	unitFramesPadding2 = 20,
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
	unitFramesSortingEnabled = true,
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	guardDistanceIndicator = 2,
	unitFramesIsVertical = false,
	groupIconsPetBGAlpha = 0.5,
	unitFramesMyGroupFirst = true,
	unitFramesScale = 1,
	groupIconsPetOffset = 
	{
		0,
		20,
	},
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	combatLogTargetDefenseTotalEnabled = false,
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
		destructionPoints = 500,
		id = 2100,
		queuedWithGroup = false,
		activeQueue = 0,
		mode = 2,
		orderPoints = 394,
		timeLeft = 95.290287814103,
		pointMax = 500,
	},
	soundOnNewTargetId = 500,
	combatLogIDSRowPadding = L"3",
	unitFramesEnabled = true,
	unitFramesHideMyGroup = false,
	combatLogTargetDefenseTimeframe = 7.5,
	groupIconsHPColor = 
	{
		200,
		255,
		0,
	},
	combatLogLogParseErrors = true,
	guardDistanceIndicatorAnimation = true,
	version = 279,
	debug = false,
	combatLogIDSEnabled = false,
	combatLogIDSRowBackground = 
	{
		225,
		50,
		50,
	},
	playerDeaths = 5,
	guardDistanceIndicatorColorWarning = 
	{
		255,
		50,
		50,
	},
	objectWindowsTimeout = 20,
	killSpamReparseChunkSize = 20,
	clickCastings = 
	{
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
			deaths = 4,
			renown = 1538,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 15,
			name = L"Chefhenny",
			career = 11,
			db = 3,
			level = 13,
			exp = 10419,
			damage = 14431,
		},
		
		{
			deaths = 2,
			renown = 1208,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 17,
			name = L"Grozond",
			career = 4,
			db = 4,
			level = 5,
			exp = 16012,
			damage = 18439,
		},
		
		{
			deaths = 2,
			renown = 1628,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Discdrive",
			career = 16,
			db = 4,
			level = 14,
			exp = 11883,
			damage = 22522,
		},
		
		{
			deaths = 3,
			renown = 1628,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 22,
			name = L"Diynk",
			career = 6,
			db = 5,
			level = 15,
			exp = 11712,
			damage = 21406,
		},
		
		{
			deaths = 2,
			renown = 1087,
			healing = 10829,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Rybert",
			career = 12,
			db = 0,
			level = 11,
			exp = 10433,
			damage = 1621,
		},
		
		{
			deaths = 0,
			renown = 1488,
			healing = 16096,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Recuvah",
			career = 15,
			db = 4,
			level = 14,
			exp = 15960,
			damage = 4975,
		},
		
		{
			deaths = 4,
			renown = 986,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 16,
			name = L"Toymatches",
			career = 11,
			db = 2,
			level = 15,
			exp = 9763,
			damage = 6952,
		},
		
		{
			deaths = 4,
			renown = 986,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 15,
			name = L"Helgapataki",
			career = 11,
			db = 2,
			level = 13,
			exp = 9647,
			damage = 17120,
		},
		
		{
			deaths = 4,
			renown = 2263,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 19,
			name = L"Icegod",
			career = 22,
			db = 4,
			level = 10,
			exp = 11250,
			damage = 11336,
		},
		
		{
			deaths = 5,
			renown = 2253,
			healing = 2184,
			soloKills = 0,
			realm = 2,
			kills = 10,
			name = L"Pointyjenkins",
			career = 23,
			db = 0,
			level = 12,
			exp = 11536,
			damage = 1421,
		},
		
		{
			deaths = 0,
			renown = 1488,
			healing = 11550,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Crabit",
			career = 5,
			db = 8,
			level = 13,
			exp = 11150,
			damage = 22013,
		},
		
		{
			deaths = 1,
			renown = 1488,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 20,
			name = L"Ninimae",
			career = 16,
			db = 1,
			level = 12,
			exp = 11150,
			damage = 7844,
		},
		
		{
			deaths = 1,
			renown = 1628,
			healing = 35838,
			soloKills = 0,
			realm = 2,
			kills = 25,
			name = L"Selenezk",
			career = 15,
			db = 0,
			level = 13,
			exp = 11283,
			damage = 1500,
		},
		
		{
			deaths = 2,
			renown = 1628,
			healing = 30574,
			soloKills = 0,
			realm = 2,
			kills = 20,
			name = L"Lorogue",
			career = 15,
			db = 0,
			level = 15,
			exp = 11624,
			damage = 376,
		},
		
		{
			deaths = 4,
			renown = 1556,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 9,
			name = L"Cennypoo",
			career = 9,
			db = 1,
			level = 15,
			exp = 9647,
			damage = 11422,
		},
		
		{
			deaths = 2,
			renown = 1254,
			healing = 2038,
			soloKills = 0,
			realm = 1,
			kills = 11,
			name = L"Guzzler",
			career = 10,
			db = 1,
			level = 13,
			exp = 10208,
			damage = 15281,
		},
		
		{
			deaths = 2,
			renown = 1253,
			healing = 17303,
			soloKills = 0,
			realm = 1,
			kills = 13,
			name = L"Juzzler",
			career = 12,
			db = 3,
			level = 13,
			exp = 10108,
			damage = 16516,
		},
		
		{
			deaths = 2,
			renown = 1167,
			healing = 980,
			soloKills = 0,
			realm = 1,
			kills = 10,
			name = L"Fizzler",
			career = 10,
			db = 2,
			level = 12,
			exp = 10032,
			damage = 8542,
		},
		
		{
			deaths = 1,
			renown = 1588,
			healing = 11550,
			soloKills = 0,
			realm = 2,
			kills = 24,
			name = L"Zumzat",
			career = 5,
			db = 3,
			level = 11,
			exp = 11224,
			damage = 13338,
		},
		
		{
			deaths = 3,
			renown = 986,
			healing = 452,
			soloKills = 0,
			realm = 1,
			kills = 16,
			name = L"Eorm",
			career = 10,
			db = 2,
			level = 13,
			exp = 9647,
			damage = 14320,
		},
		
		{
			deaths = 3,
			renown = 1026,
			healing = 873,
			soloKills = 0,
			realm = 1,
			kills = 8,
			name = L"Jullia",
			career = 17,
			db = 0,
			level = 13,
			exp = 10075,
			damage = 11026,
		},
		
		{
			deaths = 3,
			renown = 1074,
			healing = 954,
			soloKills = 0,
			realm = 1,
			kills = 8,
			name = L"Kar",
			career = 2,
			db = 4,
			level = 11,
			exp = 10597,
			damage = 20203,
		},
		
		{
			deaths = 3,
			renown = 1771,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 22,
			name = L"Kharnivour",
			career = 13,
			db = 5,
			level = 14,
			exp = 14643,
			damage = 17322,
		},
		
		{
			deaths = 2,
			renown = 4482,
			healing = 4575,
			soloKills = 0,
			realm = 2,
			kills = 18,
			name = L"Packo",
			career = 7,
			db = 0,
			level = 1,
			exp = 17191,
			damage = 2630,
		},
	},
	unitFramesParts = 
	{
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			id = "30",
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
			type = "selectionFrame",
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
			id = "31",
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
			type = "panel",
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
			id = "32",
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
			type = "hpbar",
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
			id = "33",
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
			type = "apbar",
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
			id = "34",
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
			type = "nameText",
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
			id = "35",
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
			type = "careerIcon",
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
			id = "36",
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
			type = "levelText",
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
			id = "37",
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
			type = "groupLeaderIcon",
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
			id = "38",
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
			type = "moraleBar",
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
			id = "39",
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
			type = "distanceText",
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
			id = "11",
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
			archetypeMatch = 1,
			type = "distanceBar",
			playerTypeMatch = 1,
		},
		
		{
			archetypes = 
			{
				false,
				false,
				false,
			},
			id = "254",
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
			isEnabled = false,
			playerType = 1,
			archetypeMatch = 1,
			type = "hppText",
			playerTypeMatch = 1,
		},
	},
	unitFramesPadding1 = 3,
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
	groupIconsShowOtherGroups = true,
	groupIconsHideOnSelf = true,
	combatLogIgnoreNpc = false,
	combatLogIDSRowScale = 1,
	unitFramesCount1 = 6,
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
	groupIconsShowOnMarkedPlayers = false,
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
	stateMachineThrottle = 0.3,
	groupIconsTargetOnClick = true,
	unitFramesGroupsDirection2 = 4,
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
		targetOnClick = true,
		scale = 1,
		font = "font_clear_large_bold",
		name = L"",
		text = L"KILL",
		display = 1,
		offsetY = 50,
		neverExpire = false,
		permanent = false,
	},
}




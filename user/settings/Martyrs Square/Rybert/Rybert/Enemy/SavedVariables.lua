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
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					type = "guard",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyGuard",
					nameMatch = 1,
					durationType = 3,
				},
			},
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
			anchorTo = 5,
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
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 3,
					filterName = L"NotMyGuard",
					nameMatch = 1,
					durationType = 3,
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
			isEnabled = true,
			anchorTo = 5,
			playerType = 3,
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
					durationType = 2,
					hasDurationLimit = false,
					filterName = L"Any",
					nameMatch = 1,
					descriptionMatch = 2,
				},
			},
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
			anchorTo = 9,
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
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyHealing",
					nameMatch = 1,
					durationType = 2,
				},
			},
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
			anchorTo = 9,
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
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyBuff",
					nameMatch = 1,
					durationType = 2,
				},
				
				{
					descriptionMatch = 2,
					type = "isHealing",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyHealing",
					nameMatch = 1,
					durationType = 2,
				},
			},
			scale = 1,
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
			anchorTo = 9,
			name = L"Buff",
			playerType = 1,
			isEnabled = true,
			offsetY = 0,
			color = 
			{
				b = 255,
				g = 200,
				r = 50,
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
				
				{
					durationType = 2,
					type = "isBlessing",
					filterName = L"MyBlessing",
					descriptionMatch = 2,
					castedByMe = 2,
					durationMax = 59,
					hasDurationLimit = true,
					nameMatch = 1,
					typeMatch = 1,
				},
				
				{
					descriptionMatch = 2,
					type = "isHealing",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 2,
					filterName = L"MyHealing",
					nameMatch = 1,
					durationType = 2,
				},
			},
			scale = 1,
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
			anchorTo = 9,
			name = L"Blessing",
			playerType = 1,
			isEnabled = true,
			offsetY = 0,
			color = 
			{
				b = 255,
				g = 200,
				r = 50,
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
					descriptionMatch = 2,
					type = "healDebuffOut50",
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 3,
					filterName = L"OutHealDebuff",
					nameMatch = 1,
					durationType = 1,
				},
			},
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
			anchorTo = 8,
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
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 3,
					filterName = L"InHealDebuff",
					nameMatch = 1,
					durationType = 1,
				},
			},
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
			anchorTo = 8,
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
					typeMatch = 1,
					hasDurationLimit = false,
					castedByMe = 1,
					filterName = L"Stagger",
					nameMatch = 1,
					durationType = 2,
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
			isEnabled = true,
			anchorTo = 5,
			playerType = 1,
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
			anchorTo = 8,
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
			isEnabled = true,
			anchorTo = 2,
			playerType = 3,
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
						[653] = true,
						[695] = true,
						[674] = true,
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
			isEnabled = true,
			anchorTo = 2,
			playerType = 3,
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
			isEnabled = true,
			anchorTo = 2,
			playerType = 3,
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
			isEnabled = true,
			anchorTo = 2,
			playerType = 3,
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
						[3747] = true,
						[3670] = true,
						[3038] = true,
						[8551] = true,
						[8620] = true,
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
			isEnabled = true,
			anchorTo = 9,
			playerType = 3,
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
			isEnabled = true,
			anchorTo = 2,
			playerType = 3,
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
			isEnabled = true,
			anchorTo = 2,
			playerType = 3,
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
							ability = L"ability",
							currentTarget = true,
							time = 64938459035,
							object = L"Zumzat",
							value = 8,
							crit = false,
							mit = 27,
							abs = 52,
						},
						
						{
							str = L"Ninimae's Pink Horror's attack hits you for 57 damage. (20 mitigated)",
							type = 1,
							ability = L"Pink Horror's attack",
							currentTarget = false,
							time = 64938459035,
							object = L"Ninimae",
							value = 57,
							crit = false,
							mit = 20,
							abs = 0,
						},
						
						{
							str = L"Zumzat's Trip 'Em Up hits you for 102 damage. (37 mitigated)",
							type = 1,
							ability = L"Trip 'Em Up",
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 102,
							crit = false,
							mit = 37,
							abs = 0,
						},
						
						{
							str = L"Ninimae's Pink Horror's attack hits you for 57 damage. (20 mitigated)",
							type = 1,
							ability = L"Pink Horror's attack",
							currentTarget = false,
							time = 64938459037,
							object = L"Ninimae",
							value = 57,
							crit = false,
							mit = 20,
							abs = 0,
						},
						
						{
							str = L"Ninimae's Baleful Transmogrification critically hits you for 210 damage. (40 mitigated)",
							type = 1,
							ability = L"Baleful Transmogrification",
							currentTarget = false,
							time = 64938459037,
							object = L"Ninimae",
							value = 210,
							crit = true,
							mit = 40,
							abs = 0,
						},
						
						{
							str = L"Zumzat's attack hits you for 60 damage. (27 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 60,
							crit = false,
							mit = 27,
							abs = 0,
						},
						
						{
							str = L"Ninimae's Pink Horror's Daemonic Fire hits you for 139 damage. (33 mitigated)",
							type = 1,
							ability = L"Pink Horror's Daemonic Fire",
							currentTarget = false,
							time = 64938459038,
							object = L"Ninimae",
							value = 139,
							crit = false,
							mit = 33,
							abs = 0,
						},
						
						{
							str = L"Ninimae's Pink Horror's attack hits you for 60 damage. (17 mitigated)",
							type = 1,
							ability = L"Pink Horror's attack",
							currentTarget = false,
							time = 64938459039,
							object = L"Ninimae",
							value = 60,
							crit = false,
							mit = 17,
							abs = 0,
						},
						
						{
							str = L"Zumzat's attack hits you for 78 damage. (35 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = false,
							time = 64938459039,
							object = L"Zumzat",
							value = 78,
							crit = false,
							mit = 35,
							abs = 0,
						},
						
						{
							str = L"Zumzat's Skull Thumper hits you for 172 damage. (53 mitigated)",
							type = 1,
							ability = L"Skull Thumper",
							currentTarget = false,
							time = 64938459039,
							object = L"Zumzat",
							value = 172,
							crit = false,
							mit = 53,
							abs = 0,
						},
						
						{
							str = L"Packo's Brain Bursta hits you for 229 damage. (32 mitigated)",
							type = 1,
							ability = L"Brain Bursta",
							currentTarget = false,
							time = 64938459040,
							object = L"Packo",
							value = 229,
							crit = false,
							mit = 32,
							abs = 0,
						},
						
						{
							str = L"Ninimae's Baleful Transmogrification hits you for 158 damage. (20 mitigated)",
							type = 1,
							ability = L"Baleful Transmogrification",
							currentTarget = false,
							time = 64938459040,
							object = L"Ninimae",
							value = 158,
							crit = false,
							mit = 20,
							abs = 0,
						},
						
						{
							str = L"Recuvah's Tzeentch's Cry hits you for 129 damage. (30 mitigated)",
							type = 1,
							ability = L"Tzeentch's Cry",
							currentTarget = false,
							time = 64938459040,
							object = L"Recuvah",
							value = 129,
							crit = false,
							mit = 30,
							abs = 0,
						},
						
						{
							str = L"Zumzat's Clobber hits you for 0 damage. (50 mitigated) (148 absorbed)",
							type = 1,
							ability = L"Clobber",
							currentTarget = false,
							time = 64938459041,
							object = L"Zumzat",
							value = 0,
							crit = false,
							mit = 50,
							abs = 148,
						},
						
						{
							str = L"Zumzat's ability hits you for 60 damage. (35 mitigated) (18 absorbed)",
							type = 1,
							ability = L"ability",
							currentTarget = false,
							time = 64938459042,
							object = L"Zumzat",
							value = 60,
							crit = false,
							mit = 35,
							abs = 18,
						},
						
						{
							str = L"Ninimae's Flickering Red Fire hits you for 305 damage. (44 mitigated)",
							type = 1,
							ability = L"Flickering Red Fire",
							currentTarget = false,
							time = 64938459042,
							object = L"Ninimae",
							value = 305,
							crit = false,
							mit = 44,
							abs = 0,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Zumzat's ability hits you for 8 damage. (27 mitigated) (52 absorbed)",
							type = 1,
							ability = L"ability",
							currentTarget = true,
							time = 64938459035,
							object = L"Zumzat",
							value = 8,
							crit = false,
							mit = 27,
							abs = 52,
						},
						
						{
							str = L"Zumzat's Trip 'Em Up hits you for 102 damage. (37 mitigated)",
							type = 1,
							ability = L"Trip 'Em Up",
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 102,
							crit = false,
							mit = 37,
							abs = 0,
						},
						
						{
							str = L"Zumzat's attack hits you for 60 damage. (27 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64938459037,
							object = L"Zumzat",
							value = 60,
							crit = false,
							mit = 27,
							abs = 0,
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
							time = 64938459027,
							ability = L"attack",
							value = 16,
							mit = 39,
							crit = false,
							object = L"Zumzat",
						},
						
						{
							str = L"Your Divine Assault hits Zumzat for 34 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459028,
							ability = L"Divine Assault",
							value = 34,
							mit = 32,
							crit = false,
							object = L"Zumzat",
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459031,
							ability = L"attack",
							value = 16,
							mit = 39,
							crit = false,
							object = L"Zumzat",
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938459033,
							ability = L"attack",
							value = 16,
							mit = 39,
							crit = false,
							object = L"Zumzat",
						},
					},
					total = 82,
					objectTime = 64938459027,
					data = 
					{
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64938459027,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							abs = 0,
						},
						
						{
							str = L"Your Divine Assault hits Zumzat for 34 damage. (32 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64938459028,
							object = L"Zumzat",
							value = 34,
							crit = false,
							mit = 32,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64938459031,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64938459033,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							abs = 0,
						},
					},
					totalAoe = 82,
					valueMaxData = 
					{
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64938459027,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							abs = 0,
						},
						
						{
							str = L"Your Divine Assault hits Zumzat for 34 damage. (32 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64938459028,
							object = L"Zumzat",
							value = 34,
							crit = false,
							mit = 32,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64938459031,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Zumzat for 16 damage. (39 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64938459033,
							object = L"Zumzat",
							value = 16,
							crit = false,
							mit = 39,
							abs = 0,
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
							object = L"Rybert",
							value = 133,
							overheal = 0,
							crit = false,
							time = 64938459027,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = false,
							object = L"Rybert",
							value = 133,
							overheal = 0,
							crit = false,
							time = 64938459033,
						},
					},
					total = 266,
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Mend heals Sicuxa for 0 points. (356 overhealed)",
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"Sicuxa",
							value = 0,
							overheal = 356,
							crit = false,
							time = 64938920328,
						},
						
						{
							str = L"Your Divine Mend critically heals Belldarkness for 219 points. (288 overhealed)",
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"Belldarkness",
							value = 219,
							overheal = 288,
							crit = true,
							time = 64938920334,
						},
					},
					total = 507,
					objectTime = 64938920334,
					data = 
					{
						
						{
							overheal = 356,
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"Sicuxa",
							value = 0,
							time = 64938920328,
							crit = false,
							str = L"Your Divine Mend heals Sicuxa for 0 points. (356 overhealed)",
						},
						
						{
							overheal = 288,
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"Belldarkness",
							value = 219,
							time = 64938920334,
							crit = true,
							str = L"Your Divine Mend critically heals Belldarkness for 219 points. (288 overhealed)",
						},
					},
					totalAoe = 863,
					valueMaxData = 
					{
						[1] = 
						{
							overheal = 288,
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"Belldarkness",
							value = 219,
							time = 64938920334,
							crit = true,
							str = L"Your Divine Mend critically heals Belldarkness for 219 points. (288 overhealed)",
						},
					},
					object = L"Belldarkness",
					valueMax = 85,
					value = 85,
					valueAoe = 144,
					valueAoeMax = 144,
				},
			},
			name = L"Default",
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
							abs = 0,
							min = 110,
							count = 1,
							max = 110,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								isFriendly = false,
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
							max = 37,
							min = 37,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
							mit = 21,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
						},
						
						{
							str = L"Your Healing Hand heals you for 105 points.",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 105,
							time = 64937103489,
							crit = false,
							overheal = 0,
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
							abs = 10,
							min = 92,
							count = 4,
							max = 115,
							mit = 135,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 139,
							abs = 0,
							min = 139,
							count = 1,
							max = 139,
							mit = 47,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Ravage"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 575,
							count = 6,
							min = 0,
							max = 174,
							abs = 300,
							mit = 235,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								isFriendly = false,
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
							max = 116,
							min = 0,
							count = 6,
							abs = 152,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4186,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 250,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1181,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
						},
						normal = 
						{
							overheal = 0,
							total = 1244,
							max = 79,
							min = 0,
							count = 28,
							abs = 736,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4184,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 782,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1196,
								level = 7,
								hp = 100,
								isFriendly = false,
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
							max = 80,
							min = 0,
							count = 4,
							abs = 308,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4262,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 84,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Krev the Plunderer",
								id = 4039,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						normal = 
						{
							overheal = 0,
							total = 5247,
							max = 2016,
							min = 0,
							count = 179,
							abs = 8813,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 67,
								isFriendly = true,
							},
							mit = 4504,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
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
							overheal = 0,
							total = 423,
							count = 4,
							min = 64,
							abs = 0,
							max = 154,
							mit = 113,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								isFriendly = false,
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
							min = 13,
							total = 143,
							count = 6,
							overheal = 0,
							abs = 0,
							max = 52,
							mit = 56,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 18,
							max = 18,
							min = 18,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
							mit = 7,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
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
							max = 76,
							min = 76,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
							mit = 57,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
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
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
							overheal = 0,
							total = 113,
							max = 113,
							abs = 0,
							min = 113,
							type = 4,
							object = L"you",
							crit = false,
							ability = L"Healing Hand",
							count = 1,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
							mit = 29,
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
							overheal = 0,
							total = 514,
							count = 8,
							max = 167,
							abs = 534,
							mit = 311,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
							},
							min = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 206,
							abs = 106,
							min = 11,
							count = 2,
							max = 195,
							mit = 73,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
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
							max = 0,
							min = 0,
							count = 2,
							abs = 143,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 83,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
						},
						normal = 
						{
							overheal = 0,
							total = 1234,
							max = 81,
							min = 0,
							count = 23,
							abs = 425,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4184,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 627,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1196,
								level = 7,
								hp = 100,
								isFriendly = false,
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
							max = 277,
							min = 12,
							count = 24,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
							},
							mit = 638,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Nurgling",
								id = 206,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
						},
						normal = 
						{
							min = 8,
							total = 22354,
							count = 356,
							overheal = 0,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
							},
							mit = 8357,
							max = 183,
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
							max = 246,
							mit = 37,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								isFriendly = false,
							},
							abs = 0,
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
							max = 39,
							min = 39,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
							mit = 21,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Gas Squig's Goop Shootin'"] = 
					{
						[1] = 
						{
							str = L"Your Prayer of Devotion heals you for 86 points.",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"Rybert",
							value = 86,
							time = 64937103491,
							crit = false,
							overheal = 0,
						},
						normal = 
						{
							min = 28,
							total = 171,
							count = 3,
							overheal = 0,
							abs = 0,
							max = 115,
							mit = 48,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
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
							abs = 0,
							min = 188,
							count = 1,
							max = 188,
							mit = 60,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 6,
								name = L"Cracrah",
								id = 1273,
								level = 12,
								hp = 14,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 6,
								name = L"Cracrah",
								id = 1273,
								level = 12,
								hp = 14,
								isFriendly = false,
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
							max = 56,
							min = 43,
							count = 6,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 139,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 132,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 294,
								level = 3,
								hp = 100,
								isFriendly = false,
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
							overheal = 0,
							total = 497,
							count = 2,
							max = 258,
							abs = 0,
							mit = 60,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								isFriendly = false,
							},
							min = 239,
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
							max = 49,
							min = 37,
							count = 7,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 139,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 147,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 294,
								level = 3,
								hp = 100,
								isFriendly = false,
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
							str = L"Your Lingering Divine Aid critically heals you for 27 points. (13 overhealed)",
							type = 3,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 27,
							time = 64937103492,
							crit = true,
							overheal = 13,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (105 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103493,
							crit = false,
							overheal = 105,
						},
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 3,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 27,
							time = 64937103494,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Assault heals you for 143 points.",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 143,
							time = 64937103494,
							crit = false,
							overheal = 0,
						}, 
						normal = 
						{
							overheal = 0,
							total = 10,
							abs = 0,
							min = 10,
							count = 1,
							max = 10,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Argog the Unstoppable",
								id = 284,
								level = 2,
								hp = 100,
								career = 0,
							},
							mit = 1,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Argog the Unstoppable",
								id = 284,
								level = 2,
								hp = 100,
								career = 0,
							},
						},
					},
					[L"Skull Thumper"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1122,
							abs = 316,
							min = 0,
							count = 14,
							max = 195,
							mit = 298,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 190,
							abs = 0,
							min = 190,
							count = 1,
							max = 190,
							mit = 54,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								isFriendly = false,
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
							abs = 138,
							min = 0,
							count = 1,
							max = 0,
							mit = 44,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								isFriendly = false,
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
							abs = 30,
							min = 93,
							count = 1,
							max = 93,
							mit = 44,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Kharnivour",
								id = 2314,
								level = 14,
								hp = 94,
								isFriendly = false,
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
							max = 110,
							min = 27,
							count = 100,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Costusss",
								id = 2707,
								level = 3,
								hp = 94,
								isFriendly = false,
							},
							mit = 3651,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Lorok the Heartless",
								id = 3864,
								level = 7,
								hp = 97,
								isFriendly = false,
							},
						},
						
						{
							overheal = 0,
							total = 707,
							max = 105,
							min = 77,
							count = 8,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 847,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 376,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4128,
								level = 7,
								hp = 100,
								isFriendly = false,
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
							max = 58,
							min = 8,
							count = 15,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4136,
								level = 5,
								hp = 100,
								isFriendly = false,
							},
							mit = 202,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4186,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
						},
						normal = 
						{
							overheal = 0,
							total = 3265,
							max = 55,
							min = 0,
							count = 216,
							abs = 47,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								name = L"Vesi",
								id = 882,
								level = 11,
								hp = 97,
								isFriendly = false,
							},
							mit = 2106,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 14,
								name = L"Zaph",
								id = 1267,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"attack"] = 
					{
						
						{
							overheal = 0,
							total = 966,
							max = 67,
							min = 13,
							count = 23,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Costusss",
								id = 2707,
								level = 3,
								hp = 94,
								isFriendly = false,
							},
							mit = 931,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Lorok the Heartless",
								id = 3864,
								level = 7,
								hp = 97,
								isFriendly = false,
							},
						},
						
						{
							overheal = 0,
							total = 3568,
							max = 45,
							min = 31,
							count = 101,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 2112,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Escaped Patient",
								id = 4065,
								level = 7,
								hp = 100,
								isFriendly = false,
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
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
							},
							overheal = 0,
							total = 854,
							max = 68,
							abs = 0,
							min = 43,
							type = 4,
							object = L"you",
							crit = false,
							ability = L"Divine Assault",
							count = 17,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 516,
						}, 
						normal = 
						{
							overheal = 0,
							total = 10062,
							max = 47,
							min = 7,
							count = 328,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 22,
								name = L"Shikimara",
								id = 2674,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 8346,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 68,
								isFriendly = false,
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
							abs = 23,
							min = 0,
							count = 39,
							max = 67,
							mit = 987,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 6,
								name = L"Cracrah",
								id = 1273,
								level = 12,
								hp = 14,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Rathil",
								id = 878,
								level = 10,
								hp = 71,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 371,
							abs = 0,
							min = 48,
							count = 6,
							max = 69,
							mit = 161,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Murderous Raider",
								id = 434,
								level = 5,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								isFriendly = false,
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
							max = 65,
							min = 25,
							count = 51,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Murderous Raider",
								id = 392,
								level = 5,
								hp = 100,
								isFriendly = false,
							},
							mit = 1716,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 68,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 73,
							max = 73,
							min = 73,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Nurgling",
								id = 204,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
							mit = 23,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Nurgling",
								id = 204,
								level = 1,
								hp = 100,
								isFriendly = false,
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
							abs = 0,
							min = 68,
							count = 3,
							max = 79,
							mit = 146,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Murderous Raider",
								id = 521,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2155,
								level = 11,
								hp = 100,
								isFriendly = false,
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
							str = L"Your Lingering Divine Aid critically heals you for 27 points. (13 overhealed)",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							time = 64937103492,
							crit = true,
							overheal = 13,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (105 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							time = 64937103493,
							crit = false,
							overheal = 105,
						},
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							time = 64937103494,
							crit = false,
							overheal = 0,
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
								name = L"Rhetr",
								id = 2512,
								level = 10,
								hp = 26,
								isFriendly = false,
							},
							overheal = 0,
							total = 468,
							max = 90,
							abs = 66,
							min = 0,
							type = 4,
							object = L"you",
							crit = false,
							ability = L"Divine Assault",
							count = 8,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 21,
								name = L"Klaudiana",
								id = 2655,
								level = 3,
								hp = 79,
								isFriendly = false,
							},
							mit = 359,
						}, 
						normal = 
						{
							overheal = 0,
							total = 2829,
							max = 76,
							min = 0,
							count = 62,
							abs = 23,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 22,
								name = L"Shikimara",
								id = 2674,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 1869,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Rathil",
								id = 878,
								level = 10,
								hp = 71,
								isFriendly = false,
							},
						},
					},
					[L"ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							abs = 49,
							min = 0,
							count = 3,
							max = 0,
							mit = 112,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Zumzat",
								id = 2295,
								level = 11,
								hp = 48,
								isFriendly = false,
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
							max = 51,
							min = 21,
							count = 22,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								name = L"Anehtas",
								id = 2527,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
							mit = 501,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 114,
							max = 41,
							min = 33,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 187,
								level = 1,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							mit = 86,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4181,
								level = 7,
								hp = 100,
								isFriendly = false,
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
							abs = 0,
							min = 23,
							count = 145,
							max = 45,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 57,
								isFriendly = true,
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
							overheal = 145,
							total = 198,
							abs = 0,
							min = 33,
							count = 8,
							max = 64,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 1973,
								level = 11,
								hp = 43,
								isFriendly = true,
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
							max = 80,
							min = 15,
							count = 64,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 74,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 58,
								isFriendly = true,
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
							abs = 0,
							min = 95,
							count = 29,
							max = 186,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 57,
								isFriendly = true,
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
							overheal = 140,
							total = 175,
							abs = 0,
							min = 140,
							count = 2,
							max = 175,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 66,
								isFriendly = true,
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
						parry = 0,
					},
					[L"Rybert - Divine Assault"] = 
					{
						normal = 
						{
							overheal = 9151,
							total = 11421,
							max = 241,
							min = 108,
							count = 150,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 100,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
								isFriendly = true,
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
					[L"Rybert - Divine Mend"] = 
					{
						normal = 
						{
							overheal = 398,
							total = 649,
							max = 326,
							min = 199,
							count = 4,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 1973,
								level = 11,
								hp = 73,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
								isFriendly = true,
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
							max = 160,
							min = 73,
							count = 89,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 100,
								isFriendly = true,
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
							max = 186,
							min = 82,
							count = 166,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 7,
								hp = 100,
								isFriendly = true,
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
							overheal = 1446,
							total = 1124,
							max = 231,
							min = 115,
							count = 16,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 1973,
								level = 11,
								hp = 84,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 5,
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
				},
				
				{
					[L"Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 2560,
							total = 5588,
							max = 160,
							min = 73,
							count = 89,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 100,
								isFriendly = true,
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
							overheal = 2602,
							total = 7430,
							max = 47,
							min = 23,
							count = 276,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 9,
								name = L"Novena",
								id = 970,
								level = 14,
								hp = 100,
								isFriendly = true,
							},
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
							overheal = 379,
							total = 830,
							abs = 0,
							min = 33,
							count = 22,
							max = 72,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 9,
								name = L"Novena",
								id = 970,
								level = 14,
								hp = 65,
								isFriendly = true,
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
						parry = 0,
					},
					[L"Healing Hand"] = 
					{
						normal = 
						{
							overheal = 14641,
							total = 22186,
							abs = 0,
							min = 82,
							count = 275,
							max = 186,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 7,
								hp = 100,
								isFriendly = true,
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
							min = 115,
							total = 2829,
							count = 29,
							overheal = 2608,
							abs = 0,
							max = 264,
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 5,
								hp = 100,
								name = L"Rybert",
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
							max = 241,
							min = 77,
							count = 161,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 100,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 17,
								name = L"Jullia",
								id = 2306,
								level = 13,
								hp = 53,
								isFriendly = true,
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
					[L"Divine Mend"] = 
					{
						normal = 
						{
							overheal = 754,
							total = 2475,
							max = 356,
							min = 199,
							count = 11,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 20,
								name = L"Sicuxa",
								id = 1059,
								level = 13,
								hp = 98,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 11,
								name = L"Nightswatch",
								id = 3769,
								level = 11,
								hp = 10,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 288,
							total = 676,
							abs = 0,
							min = 457,
							count = 2,
							max = 507,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 4,
								name = L"Belldarkness",
								id = 1051,
								level = 12,
								hp = 89,
								isFriendly = true,
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 1,
								name = L"Kralgron",
								id = 885,
								level = 12,
								hp = 26,
								isFriendly = true,
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
							abs = 0,
							min = 15,
							count = 90,
							max = 90,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 17,
								name = L"Eladorin",
								id = 2470,
								level = 11,
								hp = 26,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 117,
								level = 10,
								hp = 58,
								isFriendly = true,
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
					[L"Divine Aid"] = 
					{
						normal = 
						{
							overheal = 1502,
							total = 6947,
							abs = 0,
							min = 95,
							count = 56,
							max = 191,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 9,
								name = L"Novena",
								id = 970,
								level = 14,
								hp = 65,
								isFriendly = true,
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
							overheal = 140,
							total = 699,
							abs = 0,
							min = 140,
							count = 4,
							max = 270,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 18,
								name = L"Svanson",
								id = 2376,
								level = 3,
								hp = 67,
								isFriendly = true,
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
	groupIconsTargetOnClick = true,
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	unitFramesGroupsDirection2 = 3,
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
		id = 45,
		layer = 3,
		alpha = 1,
		targetOnClick = true,
		color = 
		{
			b = 0,
			g = 0,
			r = 255,
		},
		font = "font_clear_large_bold",
		name = L"",
		text = L"KILL",
		display = 1,
		offsetY = 50,
		neverExpire = false,
		permanent = false,
	},
	groupIconsPetBGAlpha = 0.5,
	stateMachineThrottle = 0.3,
	unitFramesScale = 1,
	killSpamEnabled = true,
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	guardDistanceIndicatorColorNormal = 
	{
		127,
		181,
		255,
	},
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
		orderPoints = 500,
		mode = 2,
		pointMax = 500,
		timeLeft = 94.051706490107,
	},
	scenarioInfoEnabled = true,
	combatLogIDSRowPadding = L"3",
	unitFramesEnabled = true,
	groupIconsBGColor = 
	{
		200,
		255,
		0,
	},
	combatLogTargetDefenseTotalCalculate = 
	{
		false,
		true,
		true,
		true,
		true,
		true,
	},
	guardDistanceIndicatorClickThrough = false,
	combatLogLogParseErrors = true,
	combatLogIDSEnabled = false,
	version = 279,
	combatLogIDSRowScale = 1,
	combatLogIgnoreNpc = false,
	objectWindowsTimeout = 20,
	playerDeaths = 9,
	groupIconsShowOtherGroups = true,
	groupIconsShowOnMarkedPlayers = false,
	killSpamReparseChunkSize = 20,
	groupIconsOtherGroupsLayer = 0,
	groupIconsHPColor = 
	{
		200,
		255,
		0,
	},
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
			type = "selectionFrame",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "panel",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "hpbar",
			id = "22679",
			data = 
			{
				pos = 
				{
					35,
					3,
				},
				offlineHide = true,
				layer = 1,
				anchorTo = "topleft",
				color = 
				{
					150,
					190,
					255,
				},
				wrap = false,
				anchorFrom = "topleft",
				scale = 1,
				texture = "default",
				vertical = false,
				deadHide = true,
				textureFullResize = true,
				alpha = 1,
				distHide = false,
				distAlpha = 0.5,
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "apbar",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "nameText",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "careerIcon",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "levelText",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "groupLeaderIcon",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "moraleBar",
			id = "22685",
			data = 
			{
				pos = 
				{
					37,
					4,
				},
				offlineHide = true,
				scale = 1,
				anchorTo = "topleft",
				color = 
				{
					120,
					200,
					255,
				},
				layer = 3,
				anchorFrom = "topleft",
				size = 
				{
					38,
					10,
				},
				textureFullResize = false,
				vertical = false,
				prefix = L"M ",
				suffix = L"",
				deadHide = true,
				distHide = false,
				alpha = 1,
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "distanceText",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "distanceBar",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "hppText",
			id = "22688",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
	},
	unitFramesPadding1 = 8,
	intercomPrivate = true,
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
	groupIconsOtherGroupsBGAlpha = 0.5,
	playerKDRDisplayMode = 5,
	clickCastings = 
	{
	},
	groupIconsHideOnSelf = true,
	guardDistanceIndicatorColorWarning = 
	{
		255,
		50,
		50,
	},
	combatLogIDSRowBackground = 
	{
		225,
		50,
		50,
	},
	unitFramesCount1 = 6,
	debug = false,
	guardDistanceIndicatorAnimation = true,
	combatLogTargetDefenseTimeframe = 7.5,
	unitFramesHideMyGroup = false,
	groupIconsPetBGColor = 
	{
		255,
		225,
		255,
	},
	unitFramesGroupsPadding1 = 40,
	guardDistanceIndicator = 2,
	soundOnNewTargetId = 500,
	combatLogTargetDefenseTotalEnabled = false,
	unitFramesMyGroupFirst = true,
	groupIconsPetOffset = 
	{
		0,
		20,
	},
	unitFramesSortingEnabled = true,
	unitFramesIsVertical = false,
}




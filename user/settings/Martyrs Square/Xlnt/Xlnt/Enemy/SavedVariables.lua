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
	groupIconsOtherGroupsAlpha = 0.4,
	debug = false,
	combatLogIDSEnabled = false,
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
	groupIconsEnabled = true,
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
			exceptMe = false,
			abilityId = 8241,
			name = L"Cure",
			keyModifiers = 
			{
				false,
				false,
				true,
			},
			playerType = 1,
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
			id = "867",
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
			id = "868",
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
			id = "869",
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
			id = "870",
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
			anchorTo = 9,
			scale = 1,
			anchorFrom = 9,
			exceptMe = true,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "871",
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
			name = L"Buff",
			playerType = 1,
			isEnabled = true,
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
			id = "872",
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
			name = L"Blessing",
			playerType = 1,
			isEnabled = true,
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
			id = "873",
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
			id = "874",
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
			id = "875",
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
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 1,
					abilityIds = L"9561, 8237",
					abilityIdsHash = 
					{
						[9561] = true,
						[8237] = true,
					},
					hasDurationLimit = false,
					nameMatch = 1,
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
			id = "876",
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
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					abilityIds = L"613",
					abilityIdsHash = 
					{
						[613] = true,
					},
					hasDurationLimit = false,
					nameMatch = 1,
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
			id = "877",
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
					hasDurationLimit = false,
					nameMatch = 1,
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
			id = "878",
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
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					abilityIds = L"9616",
					abilityIdsHash = 
					{
						[9616] = true,
					},
					hasDurationLimit = false,
					nameMatch = 1,
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
			id = "879",
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
					descriptionMatch = 2,
					castedByMe = 1,
					durationType = 2,
					abilityIds = L"8308",
					abilityIdsHash = 
					{
						[8308] = true,
					},
					hasDurationLimit = false,
					nameMatch = 1,
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
			id = "880",
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
						[8619] = true,
						[1591] = true,
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
					hasDurationLimit = false,
					nameMatch = 1,
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
			id = "881",
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
			id = "882",
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
			id = "883",
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
		firstLetters = 4,
		showCareerIcon = false,
		canClearOnClick = false,
		permanentTargets = 
		{
		},
		id = 2504,
		targetOnClick = true,
		alpha = 1,
		text = L"G",
		layer = 3,
		font = "font_default_text_giant",
		name = L"",
		color = 
		{
			65,
			150,
			255,
		},
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
	killSpamEnabled = true,
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
					total = 1261,
					objectTime = 64938232004,
					data = 
					{
						
						{
							str = L"Balumba's Ard Noggin critically hits you for 69 damage. (27 mitigated) (91 absorbed)",
							type = 1,
							abs = 91,
							currentTarget = false,
							time = 64938232000,
							object = L"Balumba",
							value = 69,
							crit = true,
							mit = 27,
							ability = L"Ard Noggin",
						},
						
						{
							str = L"Balumba's Horned Squig's attack hits you for 60 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232000,
							object = L"Balumba",
							value = 60,
							crit = false,
							mit = 16,
							ability = L"Horned Squig's attack",
						},
						
						{
							str = L"Balumba's attack hits you for 68 damage. (19 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232001,
							object = L"Balumba",
							value = 68,
							crit = false,
							mit = 19,
							ability = L"attack",
						},
						
						{
							str = L"Balumba's Covenant of Vitality hits you for 49 damage. (34 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232001,
							object = L"Balumba",
							value = 49,
							crit = false,
							mit = 34,
							ability = L"Covenant of Vitality",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 0 damage. (12 mitigated) (97 absorbed)",
							type = 1,
							abs = 97,
							currentTarget = false,
							time = 64938232001,
							object = L"Balumba",
							value = 0,
							crit = false,
							mit = 12,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Balumba's Ard Noggin hits you for 70 damage. (24 mitigated) (69 absorbed)",
							type = 1,
							abs = 69,
							currentTarget = false,
							time = 64938232001,
							object = L"Balumba",
							value = 70,
							crit = false,
							mit = 24,
							ability = L"Ard Noggin",
						},
						
						{
							str = L"Crabit's Trip 'Em Up hits you for 161 damage. (31 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232001,
							object = L"Crabit",
							value = 161,
							crit = false,
							mit = 31,
							ability = L"Trip 'Em Up",
						},
						
						{
							str = L"Balumba's Big Claw hits you for 69 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232001,
							object = L"Balumba",
							value = 69,
							crit = false,
							mit = 16,
							ability = L"Big Claw",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore critically hits you for 18 damage. (4 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232002,
							object = L"Balumba",
							value = 18,
							crit = true,
							mit = 4,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Crabit's attack hits you for 171 damage. (35 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232002,
							object = L"Crabit",
							value = 171,
							crit = false,
							mit = 35,
							ability = L"attack",
						},
						
						{
							str = L"Balumba's Horned Squig's attack hits you for 60 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232002,
							object = L"Balumba",
							value = 60,
							crit = false,
							mit = 16,
							ability = L"Horned Squig's attack",
						},
						
						{
							str = L"Balumba's Ard Noggin hits you for 152 damage. (24 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232002,
							object = L"Balumba",
							value = 152,
							crit = false,
							mit = 24,
							ability = L"Ard Noggin",
						},
						
						{
							str = L"Balumba's Covenant of Vitality hits you for 49 damage. (34 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232002,
							object = L"Balumba",
							value = 49,
							crit = false,
							mit = 34,
							ability = L"Covenant of Vitality",
						},
						
						{
							str = L"Crabit's Skull Thumper hits you for 223 damage. (31 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232003,
							object = L"Crabit",
							value = 223,
							crit = false,
							mit = 31,
							ability = L"Skull Thumper",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 14 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232003,
							object = L"Balumba",
							value = 14,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Balumba's attack critically hits you for 121 damage. (27 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232003,
							object = L"Balumba",
							value = 121,
							crit = true,
							mit = 27,
							ability = L"attack",
						},
						
						{
							str = L"Crabit's Skull Thumper hits you for 53 damage. (10 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232003,
							object = L"Crabit",
							value = 53,
							crit = false,
							mit = 10,
							ability = L"Skull Thumper",
						},
						
						{
							str = L"Balumba's Ard Noggin hits you for 139 damage. (24 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232004,
							object = L"Balumba",
							value = 139,
							crit = false,
							mit = 24,
							ability = L"Ard Noggin",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232004,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Crabit's Wot armor? hits you for 0 damage. (31 mitigated) (140 absorbed)",
							type = 1,
							abs = 140,
							currentTarget = false,
							time = 64938232004,
							object = L"Crabit",
							value = 0,
							crit = false,
							mit = 31,
							ability = L"Wot armor?",
						},
						
						{
							str = L"Crabit's Covenant of Vitality hits you for 39 damage. (35 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232004,
							object = L"Crabit",
							value = 39,
							crit = false,
							mit = 35,
							ability = L"Covenant of Vitality",
						},
						
						{
							str = L"Balumba's Big Claw critically hits you for 99 damage. (21 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 99,
							crit = true,
							mit = 21,
							ability = L"Big Claw",
						},
						
						{
							str = L"Balumba's Big Claw hits you for 69 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 69,
							crit = false,
							mit = 16,
							ability = L"Big Claw",
						},
						
						{
							str = L"Trollkarlious's Word of Pain critically hits you for 399 damage. (199 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232005,
							object = L"Trollkarlious",
							value = 399,
							crit = true,
							mit = 199,
							ability = L"Word of Pain",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Crabit's attack hits you for 171 damage. (35 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232006,
							object = L"Crabit",
							value = 171,
							crit = false,
							mit = 35,
							ability = L"attack",
						},
						
						{
							str = L"Crabit's Right in Da Jibblies hits you for 205 damage. (31 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232006,
							object = L"Crabit",
							value = 205,
							crit = false,
							mit = 31,
							ability = L"Right in Da Jibblies",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232006,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Balumba's Ard Noggin hits you for 104 damage. (18 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232007,
							object = L"Balumba",
							value = 104,
							crit = false,
							mit = 18,
							ability = L"Ard Noggin",
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Balumba's Ard Noggin hits you for 139 damage. (24 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232004,
							object = L"Balumba",
							value = 139,
							crit = false,
							mit = 24,
							ability = L"Ard Noggin",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232004,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Balumba's Big Claw critically hits you for 99 damage. (21 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 99,
							crit = true,
							mit = 21,
							ability = L"Big Claw",
						},
						
						{
							str = L"Balumba's Big Claw hits you for 69 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 69,
							crit = false,
							mit = 16,
							ability = L"Big Claw",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232006,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},
						
						{
							str = L"Balumba's Ard Noggin hits you for 104 damage. (18 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232007,
							object = L"Balumba",
							value = 104,
							crit = false,
							mit = 18,
							ability = L"Ard Noggin",
						},
					},
					object = L"Balumba",
					valueMax = 180,
					value = 180,
					valueAoe = 0,
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Fervor hits Taursenrir for 59 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"Fervor",
							value = 59,
							mit = 36,
							crit = false,
							time = 64938231989,
						},
						
						{
							str = L"Your attack critically hits Taursenrir for 38 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"attack",
							value = 38,
							mit = 40,
							crit = true,
							time = 64938231989,
						},
						
						{
							str = L"Your attack hits Taursenrir for 16 damage. (16 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"attack",
							value = 16,
							mit = 16,
							crit = false,
							time = 64938231989,
						},
						
						{
							str = L"Your Flames of Rhuin hits Taursenrir for 98 damage. (2 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"Flames of Rhuin",
							value = 98,
							mit = 2,
							crit = false,
							time = 64938231989,
						},
						
						{
							str = L"Your Fervor hits Taursenrir for 53 damage. (35 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"Fervor",
							value = 53,
							mit = 35,
							crit = false,
							time = 64938231990,
						},
						
						{
							str = L"Your attack critically hits Taursenrir for 26 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"attack",
							value = 26,
							mit = 36,
							crit = true,
							time = 64938231991,
						},
						
						{
							str = L"Your Torment hits Taursenrir for 80 damage. (61 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"Torment",
							value = 80,
							mit = 61,
							crit = false,
							time = 64938231992,
						},
						
						{
							str = L"Your Absolution hits Taursenrir for 4 damage. (99 mitigated) (140 absorbed)",
							type = 2,
							abs = 140,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"Absolution",
							value = 4,
							mit = 99,
							crit = false,
							time = 64938231994,
						},
						
						{
							str = L"Your Blessed Bullets of Confession hits Taursenrir for 261 damage. (10 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"Blessed Bullets of Confession",
							value = 261,
							mit = 10,
							crit = false,
							time = 64938231994,
						},
						
						{
							str = L"Your Fervor hits Taursenrir for 62 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"Fervor",
							value = 62,
							mit = 17,
							crit = false,
							time = 64938231994,
						},
					},
					total = 0,
					objectTime = 64938232005,
					valueAoeMax = 139,
					totalAoe = 88,
					valueMaxData = 
					{
						
						{
							str = L"Your Fervor hits Balumba for 29 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 29,
							crit = false,
							mit = 15,
							ability = L"Fervor",
						},
						
						{
							str = L"Your attack hits Balumba for 8 damage. (16 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 8,
							crit = false,
							mit = 16,
							ability = L"attack",
						},
						
						{
							str = L"Your attack hits Balumba for 6 damage. (7 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 6,
							crit = false,
							mit = 7,
							ability = L"attack",
						},
						
						{
							str = L"Your Fervor hits Balumba for 21 damage. (12 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938232006,
							object = L"Balumba",
							value = 21,
							crit = false,
							mit = 12,
							ability = L"Fervor",
						},
					},
					valueAoe = 18,
					valueMax = 13,
					value = 0,
					object = L"Balumba",
					data = 
					{
						
						{
							str = L"Your Fervor critically hits Balumba for 40 damage. (14 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = false,
							time = 64938232010,
							object = L"Balumba",
							value = 40,
							crit = true,
							mit = 14,
							ability = L"Fervor",
						},
						
						{
							str = L"Your Fervor hits Balumba for 20 damage. (14 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = false,
							time = 64938232013,
							object = L"Balumba",
							value = 20,
							crit = false,
							mit = 14,
							ability = L"Fervor",
						},
						
						{
							str = L"Your Fervor critically hits Balumba for 28 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = false,
							time = 64938232015,
							object = L"Balumba",
							value = 28,
							crit = true,
							mit = 17,
							ability = L"Fervor",
						},
					},
				},
				
				{
					totalAoe = 0,
					total = 892,
					valueAoe = 0,
					valueMax = 263,
					value = 127,
					data = 
					{
						
						{
							str = L"Vyamon's Lingering Rune of Mending heals you for 45 points.",
							type = 3,
							ability = L"Lingering Rune of Mending",
							currentTarget = false,
							object = L"Vyamon",
							value = 45,
							time = 64938231998,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Vyamon's Grungni's Gift heals you for 133 points. (69 overhealed)",
							type = 3,
							ability = L"Grungni's Gift",
							currentTarget = false,
							object = L"Vyamon",
							value = 133,
							time = 64938231998,
							crit = false,
							overheal = 69,
						},
						
						{
							str = L"Hwiee's Lambent Aura heals you for 0 points. (185 overhealed)",
							type = 3,
							ability = L"Lambent Aura",
							currentTarget = false,
							object = L"Hwiee",
							value = 0,
							time = 64938231999,
							crit = false,
							overheal = 185,
						},
						
						{
							str = L"Vyamon's Lingering Rune of Mending heals you for 0 points. (45 overhealed)",
							type = 3,
							ability = L"Lingering Rune of Mending",
							currentTarget = false,
							object = L"Vyamon",
							value = 0,
							time = 64938231999,
							crit = false,
							overheal = 45,
						},
						
						{
							str = L"Vyamon's Lingering Rune of Mending heals you for 45 points.",
							type = 3,
							ability = L"Lingering Rune of Mending",
							currentTarget = false,
							object = L"Vyamon",
							value = 45,
							time = 64938232000,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Hwiee's Lambent Aura heals you for 185 points.",
							type = 3,
							ability = L"Lambent Aura",
							currentTarget = false,
							object = L"Hwiee",
							value = 185,
							time = 64938232002,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Hwiee's Lambent Aura heals you for 185 points.",
							type = 3,
							ability = L"Lambent Aura",
							currentTarget = false,
							object = L"Hwiee",
							value = 185,
							time = 64938232005,
							crit = false,
							overheal = 0,
						},
					},
					valueMaxData = 
					{
					},
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067440,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067446,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"you",
						},
					},
					total = 266,
					objectTime = 64938067440,
					data = 
					{
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 133,
							time = 64938067446,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 133,
							time = 64938067448,
							crit = false,
							overheal = 0,
						},
					},
					totalAoe = 266,
					valueMaxData = 
					{
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 133,
							time = 64938067440,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 133,
							time = 64938067446,
							crit = false,
							overheal = 0,
						},
					},
					object = L"you",
					valueMax = 44,
					value = 133,
					valueAoe = 133,
					valueAoeMax = 44,
				},
			},
			data = 
			{
				
				{
					[L"Corruption"] = 
					{
						normal = 
						{
							min = 114,
							total = 114,
							count = 1,
							abs = 0,
							max = 114,
							mit = 12,
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
					[L"Brain Bursta"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 163,
							max = 163,
							min = 163,
							count = 1,
							abs = 0,
							mit = 29,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
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
					[L"Shattered Shadows"] = 
					{
						normal = 
						{
							min = 0,
							total = 365,
							count = 4,
							abs = 303,
							max = 191,
							mit = 408,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 102,
							total = 738,
							count = 3,
							abs = 80,
							max = 339,
							mit = 597,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Throat Slasha"] = 
					{
						normal = 
						{
							min = 29,
							total = 213,
							count = 5,
							abs = 0,
							max = 110,
							mit = 22,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 6,
								isFriendly = false,
								id = 3838,
								level = 14,
								hp = 99,
								name = L"Drastargh",
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
						parry = 1,
					},
					[L"Don't Go Nowhere"] = 
					{
						normal = 
						{
							min = 175,
							total = 175,
							count = 1,
							abs = 0,
							max = 175,
							mit = 22,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 248,
							total = 248,
							count = 1,
							abs = 0,
							max = 248,
							mit = 62,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Trip 'Em Up"] = 
					{
						normal = 
						{
							min = 90,
							total = 914,
							count = 8,
							abs = 0,
							max = 161,
							mit = 237,
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
					[L"Bat Screech"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 32,
							max = 32,
							min = 32,
							count = 1,
							abs = 0,
							mit = 16,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1786,
								level = 2,
								hp = 100,
								name = L"Stonewing Bat",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1786,
								level = 2,
								hp = 100,
								name = L"Stonewing Bat",
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
					[L"Spiked Squig's Git Em!"] = 
					{
						normal = 
						{
							min = 79,
							total = 158,
							count = 2,
							abs = 0,
							max = 79,
							mit = 56,
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
					[L"Wot armor?"] = 
					{
						normal = 
						{
							min = 0,
							total = 249,
							count = 5,
							max = 88,
							overheal = 0,
							mit = 173,
							abs = 236,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 275,
							count = 2,
							abs = 0,
							min = 135,
							mit = 86,
							max = 140,
						},
						parry = 0,
					},
					[L"Spiked Squig's ability"] = 
					{
						normal = 
						{
							min = 0,
							total = 26,
							count = 7,
							mit = 136,
							abs = 402,
							max = 26,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2059,
								level = 11,
								hp = 82,
								name = L"Ranho",
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
					[L"Word of Pain"] = 
					{
						normal = 
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
							min = 399,
							total = 399,
							count = 1,
							abs = 0,
							max = 399,
							mit = 199,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Hurtin' Time"] = 
					{
						normal = 
						{
							min = 61,
							total = 250,
							count = 4,
							abs = 0,
							max = 63,
							mit = 2,
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
					[L"Horned Squig's ability"] = 
					{
						normal = 
						{
							min = 0,
							total = 74,
							count = 5,
							abs = 235,
							max = 36,
							mit = 130,
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
							min = 39,
							total = 168,
							count = 2,
							abs = 36,
							max = 129,
							mit = 25,
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
					[L"Covenant of Vitality"] = 
					{
						normal = 
						{
							min = 39,
							total = 1625,
							count = 25,
							mit = 505,
							abs = 0,
							max = 78,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
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
					[L"Daemonic Fury"] = 
					{
						normal = 
						{
							min = 110,
							total = 504,
							count = 4,
							abs = 0,
							max = 149,
							mit = 104,
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
					[L"Skull Thumper"] = 
					{
						normal = 
						{
							min = 0,
							total = 566,
							count = 9,
							abs = 287,
							max = 223,
							mit = 208,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 198,
							total = 198,
							count = 1,
							abs = 0,
							max = 198,
							mit = 47,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Explodin' Arrer"] = 
					{
						normal = 
						{
							min = 0,
							total = 235,
							count = 7,
							abs = 134,
							max = 41,
							mit = 46,
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
					[L"Spiked Squig's Poisoned Spine"] = 
					{
						normal = 
						{
							min = 18,
							total = 352,
							count = 14,
							overheal = 0,
							abs = 0,
							max = 30,
							mit = 112,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2059,
								level = 11,
								hp = 82,
								name = L"Ranho",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 30,
							total = 104,
							count = 3,
							overheal = 0,
							abs = 0,
							max = 43,
							mit = 27,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2059,
								level = 11,
								hp = 82,
								name = L"Ranho",
							},
						},
						parry = 0,
					},
					[L"Seeping Wound"] = 
					{
						normal = 
						{
							min = 31,
							total = 72,
							count = 2,
							abs = 0,
							overheal = 0,
							mit = 48,
							max = 41,
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
					[L"Demolishing Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 560,
							count = 7,
							abs = 0,
							max = 80,
							mit = 0,
							min = 80,
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
					[L"Horned Squig's Git Em!"] = 
					{
						normal = 
						{
							min = 0,
							total = 112,
							count = 4,
							abs = 100,
							max = 56,
							mit = 130,
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
					[L"Flamer's attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 133,
							total = 133,
							count = 1,
							abs = 0,
							max = 133,
							mit = 26,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Impale"] = 
					{
						normal = 
						{
							min = 138,
							total = 418,
							count = 3,
							abs = 0,
							max = 142,
							mit = 26,
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
					[L"Fist of Khaine"] = 
					{
						normal = 
						{
							min = 45,
							total = 45,
							count = 1,
							abs = 0,
							max = 45,
							mit = 36,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 61,
							total = 138,
							count = 2,
							abs = 0,
							max = 77,
							mit = 74,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Ethereal Hand"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 366,
							abs = 0,
							min = 37,
							count = 9,
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
							mit = 180,
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
					[L"Mind Killer"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 224,
							total = 224,
							count = 1,
							abs = 0,
							max = 224,
							mit = 21,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Cleave Soul"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 926,
							max = 159,
							min = 148,
							count = 6,
							abs = 0,
							mit = 82,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3860,
								level = 10,
								hp = 100,
								name = L"Kaioshin",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 200,
							max = 200,
							min = 200,
							count = 1,
							abs = 0,
							mit = 23,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3860,
								level = 10,
								hp = 100,
								name = L"Kaioshin",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3860,
								level = 10,
								hp = 100,
								name = L"Kaioshin",
							},
						},
						parry = 0,
					},
					[L"Essence Lash"] = 
					{
						normal = 
						{
							min = 0,
							total = 249,
							count = 4,
							abs = 91,
							max = 88,
							mit = 54,
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
					[L"Run 'n Shoot"] = 
					{
						normal = 
						{
							min = 133,
							total = 275,
							count = 2,
							abs = 0,
							max = 142,
							mit = 60,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 209,
							total = 209,
							count = 1,
							abs = 0,
							max = 209,
							mit = 21,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Warp Reality"] = 
					{
						normal = 
						{
							min = 55,
							total = 1175,
							count = 18,
							abs = 0,
							max = 74,
							mit = 478,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3850,
								level = 12,
								hp = 100,
								name = L"Darkrite",
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
					[L"Frozen Touch"] = 
					{
						normal = 
						{
							min = 20,
							total = 497,
							count = 7,
							abs = 0,
							max = 95,
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
					[L"Ethereal Emanation"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 90,
							abs = 0,
							min = 37,
							count = 2,
							max = 53,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1814,
								level = 4,
								hp = 100,
								name = L"Eoldred Nightbane",
							},
							mit = 38,
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
					[L"Flickering Red Fire"] = 
					{
						normal = 
						{
							min = 297,
							total = 297,
							count = 1,
							abs = 16,
							max = 297,
							mit = 49,
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
					[L"Squig's attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 23,
							max = 23,
							min = 23,
							count = 2,
							abs = 0,
							mit = 17,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 3792,
								level = 9,
								hp = 100,
								name = L"Fockigob",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 3792,
								level = 9,
								hp = 100,
								name = L"Fockigob",
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
						parry = 1,
					},
					[L"Ground Rumble"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 43,
							max = 11,
							min = 10,
							count = 4,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1192,
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
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 15,
							max = 15,
							min = 15,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 829,
								level = 2,
								hp = 100,
								name = L"Argog the Unstoppable",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 829,
								level = 2,
								hp = 100,
								name = L"Argog the Unstoppable",
							},
						},
						parry = 0,
					},
					[L"Tzeentch's Cry"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 363,
							max = 127,
							min = 113,
							count = 3,
							abs = 0,
							mit = 119,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2051,
								level = 13,
								hp = 100,
								name = L"Alay",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3850,
								level = 12,
								hp = 100,
								name = L"Darkrite",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 183,
							max = 183,
							min = 183,
							count = 1,
							abs = 0,
							mit = 53,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3850,
								level = 12,
								hp = 100,
								name = L"Darkrite",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3850,
								level = 12,
								hp = 100,
								name = L"Darkrite",
							},
						},
						parry = 0,
					},
					[L"Pitiless Strike"] = 
					{
						normal = 
						{
							min = 195,
							total = 610,
							count = 3,
							mit = 37,
							abs = 0,
							max = 210,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 21,
								isFriendly = false,
								id = 639,
								level = 14,
								hp = 31,
								name = L"Destruktiw",
							},
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 55,
							total = 348,
							count = 2,
							overheal = 0,
							abs = 166,
							max = 293,
							mit = 43,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 21,
								isFriendly = false,
								id = 639,
								level = 14,
								hp = 31,
								name = L"Destruktiw",
							},
						},
						parry = 0,
					},
					[L"Poisoned Spine"] = 
					{
						normal = 
						{
							min = 26,
							total = 26,
							count = 1,
							abs = 0,
							max = 26,
							mit = 8,
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
					[L"Rabid Bite"] = 
					{
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
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
						parry = 0,
					},
					[L"Yer Bleedin'!"] = 
					{
						normal = 
						{
							min = 42,
							total = 1211,
							count = 15,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 1421,
								level = 15,
								hp = 27,
								name = L"Tinkertwik",
							},
							max = 91,
							abs = 0,
							mit = 294,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 113,
							abs = 0,
							min = 113,
							count = 1,
							max = 113,
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
							mit = 29,
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
					[L"Slasha"] = 
					{
						normal = 
						{
							min = 220,
							total = 220,
							count = 2,
							abs = 0,
							max = 220,
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
						parry = 1,
					},
					[L"Big Claw"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 541,
							count = 9,
							mit = 197,
							abs = 0,
							max = 69,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2310,
								level = 11,
								hp = 100,
								name = L"Balumba",
							},
							min = 50,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 187,
							count = 2,
							mit = 48,
							abs = 0,
							max = 99,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2310,
								level = 11,
								hp = 100,
								name = L"Balumba",
							},
							min = 88,
						},
						parry = 0,
					},
					[L"Clobber"] = 
					{
						normal = 
						{
							min = 0,
							total = 1420,
							count = 20,
							abs = 855,
							max = 129,
							mit = 408,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 45,
							total = 409,
							count = 3,
							abs = 98,
							max = 182,
							mit = 85,
							overheal = 0,
						},
						parry = 2,
					},
					[L"Lob Choppa"] = 
					{
						normal = 
						{
							min = 35,
							total = 461,
							count = 6,
							abs = 0,
							max = 303,
							mit = 139,
							overheal = 0,
						},
						dodge = 1,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 61,
							total = 61,
							count = 1,
							abs = 0,
							max = 61,
							mit = 31,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Tooth of Tzeentch"] = 
					{
						normal = 
						{
							min = 39,
							total = 258,
							count = 3,
							overheal = 0,
							abs = 0,
							max = 167,
							mit = 44,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
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
					[L"Lacerate"] = 
					{
						normal = 
						{
							min = 0,
							total = 561,
							count = 21,
							abs = 189,
							max = 92,
							mit = 67,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 33,
							total = 69,
							count = 2,
							overheal = 0,
							abs = 0,
							max = 36,
							mit = 5,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
							},
						},
						parry = 1,
					},
					[L"Gas Squig's Goop Shootin'"] = 
					{
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
					[L"Flail"] = 
					{
						normal = 
						{
							min = 87,
							total = 205,
							count = 2,
							abs = 0,
							max = 118,
							mit = 13,
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
					[L"Ravage"] = 
					{
						normal = 
						{
							min = 105,
							total = 242,
							count = 2,
							abs = 0,
							overheal = 0,
							mit = 80,
							max = 137,
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
					[L"Daemonic Lash"] = 
					{
						normal = 
						{
							min = 0,
							total = 647,
							count = 6,
							abs = 180,
							max = 161,
							mit = 343,
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
					[L"Crippling Anger"] = 
					{
						normal = 
						{
							min = 50,
							total = 200,
							count = 4,
							abs = 0,
							max = 50,
							mit = 16,
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
					[L"What Blocka?"] = 
					{
						normal = 
						{
							min = 143,
							total = 305,
							count = 2,
							abs = 0,
							max = 162,
							mit = 73,
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
						normal = 
						{
							min = 8,
							total = 20334,
							count = 325,
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
							mit = 5468,
							abs = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 3524,
							abs = 0,
							min = 12,
							count = 35,
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
							mit = 825,
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
						parry = 22,
					},
					[L"Baleful Transmogrification"] = 
					{
						normal = 
						{
							min = 116,
							total = 854,
							count = 7,
							abs = 0,
							max = 146,
							mit = 124,
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
					[L"Life Leaka"] = 
					{
						normal = 
						{
							min = 65,
							total = 990,
							count = 13,
							abs = 0,
							max = 90,
							mit = 267,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 101,
							total = 101,
							count = 1,
							abs = 0,
							max = 101,
							mit = 30,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Surging Violet Fire"] = 
					{
						normal = 
						{
							min = 167,
							total = 367,
							count = 2,
							abs = 0,
							max = 200,
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
					[L"I'll Take That!"] = 
					{
						normal = 
						{
							min = 0,
							total = 145,
							count = 2,
							overheal = 0,
							abs = 112,
							max = 145,
							mit = 78,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 3882,
								level = 10,
								hp = 72,
								name = L"Shieldahila",
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
					[L"Mangling Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 1,
							abs = 58,
							mit = 29,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1795,
								level = 4,
								hp = 100,
								name = L"Blackfang Runt",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1795,
								level = 4,
								hp = 100,
								name = L"Blackfang Runt",
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
					[L"Rend"] = 
					{
						normal = 
						{
							min = 0,
							total = 669,
							count = 6,
							abs = 117,
							max = 145,
							mit = 36,
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
						normal = 
						{
							min = 0,
							total = 4391,
							count = 86,
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
							max = 2016,
							abs = 5093,
							mit = 1790,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
						parry = 0,
					},
					[L"Da Big Un'"] = 
					{
						normal = 
						{
							min = 155,
							total = 155,
							count = 1,
							abs = 0,
							max = 155,
							mit = 10,
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
					[L"Lunging Maw"] = 
					{
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
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
						parry = 0,
					},
					[L"Lasting Scorching Blast Potion"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 644,
							max = 121,
							min = 80,
							count = 6,
							abs = 0,
							mit = 32,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 1036,
								level = 15,
								hp = 98,
								name = L"Poezdlubvi",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 1036,
								level = 15,
								hp = 98,
								name = L"Poezdlubvi",
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
					[L"Point-Blank"] = 
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
					[L"Plink"] = 
					{
						normal = 
						{
							min = 281,
							total = 281,
							count = 1,
							abs = 0,
							max = 281,
							mit = 48,
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
					[L"Envenomed Fangs"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 459,
							max = 51,
							min = 12,
							count = 22,
							abs = 0,
							mit = 158,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 2509,
								level = 4,
								hp = 100,
								name = L"Filthy Spider",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 2509,
								level = 4,
								hp = 0,
								name = L"Filthy Spider",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 54,
							count = 3,
							abs = 0,
							max = 19,
							mit = 17,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 2527,
								level = 4,
								hp = 0,
								name = L"Filthy Spider",
							},
							min = 17,
						},
						parry = 0,
					},
					[L"Murderous Wrath"] = 
					{
						normal = 
						{
							min = 165,
							total = 165,
							count = 1,
							abs = 0,
							max = 165,
							mit = 15,
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
					[L"Chillwind"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 240,
							count = 3,
							min = 56,
							abs = 0,
							max = 92,
							mit = 31,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								isFriendly = false,
								id = 643,
								level = 9,
								hp = 100,
								name = L"Trollkarlious",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 143,
							total = 590,
							count = 3,
							overheal = 0,
							abs = 0,
							mit = 71,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 24,
								isFriendly = false,
								id = 643,
								level = 9,
								hp = 100,
								name = L"Trollkarlious",
							},
							max = 231,
						},
						parry = 0,
					},
					[L"Spiked Squig's attack"] = 
					{
						normal = 
						{
							min = 51,
							total = 267,
							count = 4,
							abs = 0,
							max = 74,
							mit = 76,
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
					[L"Scythe Gash"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 95,
							abs = 0,
							min = 39,
							count = 2,
							max = 56,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1814,
								level = 4,
								hp = 100,
								name = L"Eoldred Nightbane",
							},
							mit = 38,
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
					[L"Bleed Fer' Me"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 233,
							max = 85,
							min = 63,
							count = 3,
							abs = 0,
							mit = 39,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
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
					[L"Horned Squig's attack"] = 
					{
						normal = 
						{
							min = 49,
							total = 1059,
							count = 17,
							max = 95,
							abs = 0,
							mit = 389,
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
						parry = 3,
					},
					[L"Ethereal Chill"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 416,
							abs = 0,
							min = 43,
							count = 9,
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
							mit = 182,
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
					[L"Consume Essence"] = 
					{
						normal = 
						{
							min = 65,
							total = 729,
							count = 8,
							abs = 0,
							max = 106,
							mit = 246,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 111,
							total = 250,
							count = 2,
							mit = 88,
							abs = 0,
							max = 139,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
							},
							overheal = 0,
						},
						parry = 0,
					},
					[L"Right in Da Jibblies"] = 
					{
						normal = 
						{
							min = 148,
							total = 353,
							count = 2,
							abs = 0,
							max = 205,
							mit = 55,
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
					[L"Git Em!"] = 
					{
						normal = 
						{
							min = 0,
							total = 176,
							count = 5,
							abs = 239,
							max = 82,
							mit = 162,
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
					[L"Ard Noggin"] = 
					{
						normal = 
						{
							min = 0,
							total = 1630,
							count = 19,
							abs = 515,
							max = 152,
							mit = 559,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 440,
							count = 3,
							abs = 91,
							min = 69,
							mit = 124,
							max = 213,
						},
						parry = 2,
					},
					[L"Throwing Axe"] = 
					{
						normal = 
						{
							min = 0,
							total = 0,
							count = 2,
							abs = 23,
							max = 0,
							mit = 25,
							overheal = 0,
						},
						dodge = 1,
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
					[L"Rite of Agony"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 110,
							max = 110,
							min = 110,
							count = 1,
							abs = 0,
							mit = 12,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 1097,
								level = 9,
								hp = 80,
								name = L"Psinaa",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 1097,
								level = 9,
								hp = 80,
								name = L"Psinaa",
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
					[L"Debilitate"] = 
					{
						normal = 
						{
							min = 153,
							total = 153,
							count = 1,
							abs = 0,
							max = 153,
							mit = 13,
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
					[L"Flamer's Flame Of Tzeentch"] = 
					{
						normal = 
						{
							min = 49,
							total = 49,
							count = 1,
							abs = 0,
							max = 49,
							mit = 19,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 73,
							total = 73,
							count = 1,
							abs = 0,
							max = 73,
							mit = 25,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Bunch o' Waaagh"] = 
					{
						normal = 
						{
							min = 25,
							total = 548,
							count = 4,
							abs = 155,
							max = 180,
							mit = 200,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 242,
							max = 242,
							min = 242,
							count = 1,
							abs = 0,
							mit = 41,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
							},
						},
						parry = 0,
					},
					[L"Horned Squig's Gore"] = 
					{
						normal = 
						{
							min = 0,
							total = 447,
							count = 20,
							abs = 184,
							max = 92,
							mit = 145,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 17,
							total = 35,
							count = 2,
							abs = 0,
							max = 18,
							mit = 10,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Weaklin' Killa"] = 
					{
						normal = 
						{
							min = 361,
							total = 361,
							count = 1,
							abs = 0,
							max = 361,
							mit = 48,
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
					[L"Consume Strength"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 137,
							max = 137,
							min = 137,
							count = 2,
							abs = 0,
							mit = 13,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
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
						parry = 1,
					},
				},
				
				{
					[L"Flames of Rhuin"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 4867,
							max = 100,
							min = 28,
							count = 64,
							abs = 0,
							mit = 418,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 3882,
								level = 10,
								hp = 72,
								name = L"Shieldahila",
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
					[L"Burn, Heretic!"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 820,
							max = 176,
							min = 63,
							count = 7,
							abs = 0,
							mit = 238,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 3885,
								level = 10,
								hp = 100,
								name = L"Fockigob",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3850,
								level = 12,
								hp = 100,
								name = L"Darkrite",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 429,
							max = 244,
							min = 185,
							count = 2,
							abs = 0,
							mit = 101,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 3885,
								level = 10,
								hp = 8,
								name = L"Fockigob",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 3786,
								level = 12,
								hp = 90,
								name = L"Yrkoonorc",
							},
						},
						parry = 0,
					},
					[L"Fervor"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 5815,
							max = 105,
							min = 0,
							count = 149,
							abs = 389,
							mit = 2543,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2051,
								level = 13,
								hp = 35,
								name = L"Alay",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2144,
								level = 10,
								hp = 100,
								name = L"Alzathor",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 1709,
							max = 105,
							min = 15,
							count = 29,
							abs = 9,
							mit = 699,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2144,
								level = 10,
								hp = 100,
								name = L"Alzathor",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 829,
								level = 2,
								hp = 100,
								name = L"Argog the Unstoppable",
							},
						},
						parry = 0,
					},
					[L"Burn Armor"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 156,
							max = 76,
							min = 24,
							count = 3,
							abs = 0,
							mit = 40,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2051,
								level = 13,
								hp = 100,
								name = L"Alay",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
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
							overheal = 0,
							total = 2030,
							abs = 0,
							min = 35,
							count = 44,
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
							mit = 1297,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 2626,
								level = 14,
								hp = 88,
								name = L"Dalsgard",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 468,
							abs = 66,
							min = 0,
							count = 8,
							max = 90,
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
							mit = 359,
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
						},
						parry = 0,
					},
					[L"Judgement"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 534,
							abs = 0,
							min = 21,
							count = 20,
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
							mit = 453,
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
					[L"Cannon"] = 
					{
						normal = 
						{
							min = 110,
							total = 7582,
							count = 25,
							abs = 0,
							max = 441,
							mit = 4221,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 575,
								level = 2,
								hp = 100,
								name = L"Raven Hellfang",
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
					[L"Divine Assault"] = 
					{
						normal = 
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
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 854,
							abs = 0,
							min = 43,
							count = 17,
							max = 68,
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
							mit = 516,
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
						parry = 0,
					},
					[L"Castigation"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2168,
							abs = 0,
							min = 2,
							count = 156,
							max = 41,
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
							mit = 1534,
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
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
						parry = 0,
					},
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 11647,
							abs = 0,
							min = 3,
							count = 514,
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
							mit = 11174,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								isFriendly = false,
								id = 1036,
								level = 15,
								hp = 98,
								name = L"Poezdlubvi",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 1890,
							abs = 0,
							min = 7,
							count = 61,
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
							mit = 1865,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 905,
								level = 9,
								hp = 100,
								name = L"Marxism",
							},
						},
						parry = 5,
					},
					[L"Absolution"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 7957,
							max = 284,
							min = 0,
							count = 80,
							abs = 1554,
							mit = 3636,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2426,
								level = 13,
								hp = 71,
								name = L"Alay",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2051,
								level = 13,
								hp = 100,
								name = L"Alay",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 898,
							max = 399,
							min = 249,
							count = 3,
							abs = 5,
							mit = 208,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 3792,
								level = 9,
								hp = 100,
								name = L"Fockigob",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3821,
								level = 12,
								hp = 90,
								name = L"Darkrite",
							},
						},
						parry = 2,
					},
					[L"Blessed Bullets of Confession"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 5662,
							max = 261,
							min = 40,
							count = 31,
							abs = 0,
							mit = 1438,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 2393,
								level = 10,
								hp = 48,
								name = L"Taursenrir",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 1170,
								level = 9,
								hp = 100,
								name = L"Alzathor",
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
					[L"ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 23,
							abs = 384,
							mit = 556,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 2393,
								level = 10,
								hp = 48,
								name = L"Taursenrir",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 2393,
								level = 10,
								hp = 48,
								name = L"Taursenrir",
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
					[L"Torment"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 7661,
							max = 126,
							min = 0,
							count = 98,
							abs = 794,
							mit = 3595,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 3792,
								level = 9,
								hp = 100,
								name = L"Fockigob",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								isFriendly = false,
								id = 2393,
								level = 10,
								hp = 48,
								name = L"Taursenrir",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 2522,
							max = 202,
							min = 67,
							count = 19,
							abs = 0,
							mit = 811,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 4378,
								level = 13,
								hp = 100,
								name = L"Vires",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3850,
								level = 12,
								hp = 100,
								name = L"Darkrite",
							},
						},
						parry = 1,
					},
					[L"Snap Shot"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 999,
							max = 36,
							min = 0,
							count = 57,
							abs = 108,
							mit = 1707,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 3832,
								level = 3,
								hp = 100,
								name = L"Anonencore",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 2144,
								level = 10,
								hp = 100,
								name = L"Alzathor",
							},
						},
						dodge = 1,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 113,
							max = 36,
							min = 23,
							count = 4,
							abs = 0,
							mit = 172,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 4378,
								level = 13,
								hp = 100,
								name = L"Vires",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 888,
								level = 2,
								hp = 100,
								name = L"Savage Gorehorn",
							},
						},
						parry = 0,
					},
					[L"Bludgeon"] = 
					{
						normal = 
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
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1658,
							abs = 0,
							min = 37,
							count = 36,
							max = 55,
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
							mit = 1104,
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
					[L"Blessed Bullets of Purity"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 5899,
							max = 286,
							min = 81,
							count = 31,
							abs = 0,
							mit = 642,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								isFriendly = false,
								id = 3883,
								level = 6,
								hp = 100,
								name = L"Sistermanic",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 3882,
								level = 10,
								hp = 72,
								name = L"Shieldahila",
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
					[L"Razor Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2853,
							max = 145,
							min = 39,
							count = 45,
							abs = 0,
							mit = 1282,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								isFriendly = false,
								id = 3785,
								level = 15,
								hp = 91,
								name = L"Frfqm",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 829,
								level = 2,
								hp = 100,
								name = L"Argog the Unstoppable",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 171,
							max = 91,
							min = 80,
							count = 2,
							abs = 0,
							mit = 80,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 2330,
								level = 4,
								hp = 100,
								name = L"Filthy Spider",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1723,
								level = 3,
								hp = 100,
								name = L"Sigmundi Spirit",
							},
						},
						parry = 1,
					},
				},
				
				{
					[L"Hwiee - Lambent Aura"] = 
					{
						normal = 
						{
							min = 185,
							total = 555,
							count = 4,
							abs = 0,
							max = 185,
							mit = 0,
							overheal = 185,
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
							overheal = 464,
							total = 1688,
							abs = 0,
							min = 37,
							count = 46,
							max = 65,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 2800,
								level = 8,
								hp = 87,
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
					[L"Smellyheals - Rune of Shielding"] = 
					{
						normal = 
						{
							min = 128,
							total = 128,
							count = 1,
							abs = 0,
							max = 128,
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
					[L"Vyamon - Lingering Rune of Mending"] = 
					{
						normal = 
						{
							min = 45,
							total = 180,
							count = 5,
							abs = 0,
							max = 45,
							mit = 0,
							overheal = 45,
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
					[L"Alfflaed - Lambent Aura"] = 
					{
						normal = 
						{
							min = 185,
							total = 670,
							count = 5,
							abs = 0,
							max = 185,
							mit = 0,
							overheal = 255,
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
					[L"Marshal - Divine Assault"] = 
					{
						normal = 
						{
							min = 255,
							total = 856,
							count = 4,
							abs = 0,
							max = 346,
							mit = 0,
							overheal = 255,
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
					[L"Talivar - Rune of Serenity"] = 
					{
						normal = 
						{
							min = 113,
							total = 676,
							count = 14,
							abs = 0,
							max = 113,
							mit = 0,
							overheal = 906,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 167,
							total = 0,
							count = 1,
							abs = 0,
							max = 167,
							mit = 0,
							overheal = 167,
						},
						parry = 0,
					},
					[L"Rybert - Lingering Divine Aid"] = 
					{
						normal = 
						{
							overheal = 951,
							total = 737,
							max = 31,
							min = 23,
							count = 68,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 92,
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
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 101,
							total = 88,
							max = 45,
							min = 33,
							count = 5,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 78,
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
					[L"Marshal - Divine Aid"] = 
					{
						normal = 
						{
							min = 182,
							total = 182,
							count = 1,
							abs = 0,
							max = 182,
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
					[L"Vyamon - Rune of Mending"] = 
					{
						normal = 
						{
							min = 180,
							total = 180,
							count = 1,
							abs = 0,
							max = 180,
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
					[L"Vyamon - Rune of Shielding"] = 
					{
						normal = 
						{
							min = 142,
							total = 142,
							count = 1,
							abs = 0,
							max = 142,
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
					[L"Smellyheals - Grungni's Gift"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 255,
							total = 255,
							count = 1,
							abs = 0,
							max = 255,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Marshal - Healing Hand"] = 
					{
						normal = 
						{
							min = 179,
							total = 798,
							count = 8,
							abs = 0,
							max = 179,
							mit = 0,
							overheal = 634,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 247,
							total = 125,
							count = 2,
							abs = 0,
							max = 251,
							mit = 0,
							overheal = 373,
						},
						parry = 0,
					},
					[L"Talivar - Grungni's Gift"] = 
					{
						normal = 
						{
							min = 208,
							total = 748,
							count = 4,
							abs = 0,
							max = 208,
							mit = 0,
							overheal = 84,
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
					[L"Talivar - Rune of Restoration"] = 
					{
						normal = 
						{
							min = 668,
							total = 668,
							count = 1,
							abs = 0,
							max = 668,
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
					[L"Rybert - Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 2560,
							total = 4524,
							abs = 0,
							min = 73,
							count = 81,
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
					[L"Something - Rune of Regeneration"] = 
					{
						normal = 
						{
							min = 158,
							total = 609,
							count = 4,
							abs = 0,
							max = 158,
							mit = 0,
							overheal = 23,
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
					[L"Talivar - Rune of Life"] = 
					{
						normal = 
						{
							min = 494,
							total = 494,
							count = 1,
							abs = 0,
							max = 494,
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
					[L"Marshal - Lingering Divine Aid"] = 
					{
						normal = 
						{
							min = 46,
							total = 46,
							count = 4,
							abs = 0,
							max = 46,
							mit = 0,
							overheal = 138,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 69,
							total = 69,
							count = 1,
							abs = 0,
							max = 69,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Rybert - Divine Assault"] = 
					{
						normal = 
						{
							overheal = 8032,
							total = 7419,
							abs = 0,
							min = 108,
							count = 118,
							max = 238,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 100,
								career = 12,
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
					[L"Beardhealer - Grungni's Gift"] = 
					{
						normal = 
						{
							min = 196,
							total = 2260,
							count = 11,
							abs = 0,
							max = 209,
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
					[L"Hwiee - Healing Energy"] = 
					{
						normal = 
						{
							min = 200,
							total = 200,
							count = 1,
							abs = 0,
							max = 200,
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
					[L"Hwiee - Lingering Healing Energy"] = 
					{
						normal = 
						{
							min = 48,
							total = 192,
							count = 4,
							abs = 0,
							max = 48,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 71,
							total = 71,
							count = 1,
							abs = 0,
							max = 71,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Talivar - Rune of Regeneration"] = 
					{
						normal = 
						{
							min = 161,
							total = 154,
							count = 10,
							abs = 0,
							max = 161,
							mit = 0,
							overheal = 1456,
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
					[L"Smellyheals - Rune of Regeneration"] = 
					{
						normal = 
						{
							min = 162,
							total = 1134,
							count = 7,
							abs = 0,
							max = 162,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 236,
							total = 236,
							count = 1,
							abs = 0,
							max = 236,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Vyamon - Grungni's Gift"] = 
					{
						normal = 
						{
							min = 202,
							total = 335,
							count = 2,
							abs = 0,
							max = 202,
							mit = 0,
							overheal = 69,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 301,
							total = 301,
							count = 1,
							abs = 0,
							max = 301,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Rybert - Divine Mend"] = 
					{
						normal = 
						{
							overheal = 398,
							total = 0,
							abs = 0,
							min = 199,
							count = 2,
							max = 199,
							maxObject = 
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
					[L"Rybert - Divine Aid"] = 
					{
						normal = 
						{
							overheal = 760,
							total = 558,
							max = 128,
							min = 95,
							count = 13,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 77,
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
					[L"Marshal - Divine Mend"] = 
					{
						normal = 
						{
							min = 383,
							total = 796,
							count = 2,
							abs = 0,
							max = 413,
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
					[L"Xlnt - Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 599,
							total = 1662,
							max = 133,
							min = 133,
							count = 17,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 9,
								isFriendly = true,
								id = 3628,
								level = 6,
								hp = 73,
								name = L"Xlnt",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 9,
								isFriendly = true,
								id = 3628,
								level = 6,
								hp = 73,
								name = L"Xlnt",
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
							overheal = 6364,
							total = 4328,
							abs = 0,
							min = 82,
							count = 104,
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
							overheal = 873,
							total = 495,
							abs = 0,
							min = 115,
							count = 10,
							max = 169,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 98,
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
								level = 5,
								hp = 100,
								career = 12,
							},
						},
						parry = 0,
					},
					[L"Something - Rune of Shielding"] = 
					{
						normal = 
						{
							min = 122,
							total = 122,
							count = 1,
							abs = 0,
							max = 122,
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
					[L"Smellyheals - Rune of Restoration"] = 
					{
						normal = 
						{
							min = 595,
							total = 1516,
							count = 3,
							abs = 0,
							max = 595,
							mit = 0,
							overheal = 269,
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
					[L"Beardhealer - Rune of Regeneration"] = 
					{
						normal = 
						{
							min = 185,
							total = 279,
							count = 3,
							abs = 0,
							max = 185,
							mit = 0,
							overheal = 276,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 276,
							total = 557,
							count = 2,
							abs = 0,
							max = 281,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
				},
				
				{
					[L"Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 3159,
							total = 6186,
							abs = 0,
							min = 73,
							count = 98,
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
					[L"Lingering Divine Aid"] = 
					{
						normal = 
						{
							overheal = 1770,
							total = 3511,
							count = 153,
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
							overheal = 217,
							total = 573,
							max = 64,
							min = 33,
							count = 15,
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
					[L"Divine Mend"] = 
					{
						normal = 
						{
							overheal = 398,
							total = 199,
							abs = 0,
							min = 199,
							count = 3,
							max = 199,
							maxObject = 
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
							overheal = 8032,
							total = 7419,
							abs = 0,
							min = 108,
							count = 118,
							max = 238,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 100,
								career = 12,
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
					[L"Healing Hand"] = 
					{
						normal = 
						{
							overheal = 11299,
							total = 11995,
							max = 186,
							min = 82,
							count = 183,
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
							overheal = 2035,
							total = 1947,
							count = 22,
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
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 770,
							total = 2550,
							max = 90,
							min = 35,
							count = 66,
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
								career = 17,
								isFriendly = true,
								id = 2470,
								level = 11,
								hp = 62,
								name = L"Eladorin",
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
							overheal = 996,
							total = 3313,
							max = 191,
							min = 95,
							count = 30,
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
	unitFramesGroupsPadding2 = 20,
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
	groupIconsScale = 0.6,
	playerKills = 12,
	combatLogIDSMaxRows = L"5",
	groupIconsPetAlpha = 1,
	combatLogTargetDefenseTimeframe = 7.5,
	combatLogStatsWindowColumns = 
	{
		[2] = 
		{
			sortDirection = false,
			sortColumn = 2,
			columns = 
			{
				"name",
				"totalPercent",
				"critPercent",
				"maxNormal",
				"maxCrit",
				"mitPercent",
			},
		},
	},
	combatLogTargetDefenseEnabled = false,
	markNewTarget = false,
	unitFramesTooltipMode = "always",
	unitFramesGroupsDirection1 = 4,
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
	combatLogStatsWindowType = 1,
	combatLogIDSRowBackground = 
	{
		225,
		50,
		50,
	},
	unitFramesPadding2 = 10,
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
		64,
	},
	guardDistanceIndicatorScaleWarning = 1.5,
	scenarioInfoPlayers = 
	{
		
		{
			deaths = 4,
			renown = 287,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Vegonator",
			career = 11,
			db = 0,
			level = 15,
			exp = 3487,
			damage = 16920,
		},
		
		{
			deaths = 4,
			renown = 344,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Xlnt",
			career = 9,
			db = 1,
			level = 10,
			exp = 3487,
			damage = 12365,
		},
		
		{
			deaths = 0,
			renown = 414,
			healing = 43294,
			soloKills = 0,
			realm = 1,
			kills = 0,
			name = L"Vyamon",
			career = 3,
			db = 0,
			level = 13,
			exp = 2376,
			damage = 0,
		},
		
		{
			deaths = 2,
			renown = 333,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Rozhilda",
			career = 10,
			db = 0,
			level = 9,
			exp = 3873,
			damage = 15608,
		},
		
		{
			deaths = 0,
			renown = 1872,
			healing = 20846,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Crabit",
			career = 5,
			db = 7,
			level = 12,
			exp = 12719,
			damage = 34060,
		},
		
		{
			deaths = 0,
			renown = 1404,
			healing = 42774,
			soloKills = 0,
			realm = 1,
			kills = 0,
			name = L"Hwiee",
			career = 20,
			db = 0,
			level = 5,
			exp = 7330,
			damage = 2415,
		},
		
		{
			deaths = 0,
			renown = 2219,
			healing = 11280,
			soloKills = 0,
			realm = 2,
			kills = 25,
			name = L"Mojo",
			career = 5,
			db = 3,
			level = 11,
			exp = 10574,
			damage = 31457,
		},
		
		{
			deaths = 0,
			renown = 2158,
			healing = 17862,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Banish",
			career = 23,
			db = 4,
			level = 15,
			exp = 12270,
			damage = 13103,
		},
		
		{
			deaths = 3,
			renown = 226,
			healing = 1316,
			soloKills = 0,
			realm = 1,
			kills = 2,
			name = L"Fabondil",
			career = 18,
			db = 0,
			level = 12,
			exp = 3173,
			damage = 26709,
		},
		
		{
			deaths = 0,
			renown = 1880,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Balumba",
			career = 8,
			db = 7,
			level = 10,
			exp = 13219,
			damage = 27074,
		},
		
		{
			deaths = 0,
			renown = 1990,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 27,
			name = L"Taursenrir",
			career = 13,
			db = 3,
			level = 9,
			exp = 13249,
			damage = 15029,
		},
		
		{
			deaths = 1,
			renown = 2278,
			healing = 33078,
			soloKills = 0,
			realm = 2,
			kills = 28,
			name = L"Roos",
			career = 23,
			db = 1,
			level = 13,
			exp = 12437,
			damage = 8084,
		},
		
		{
			deaths = 1,
			renown = 350,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 0,
			name = L"Ranho",
			career = 8,
			db = 0,
			level = 11,
			exp = 4000,
			damage = 20445,
		},
		
		{
			deaths = 2,
			renown = 408,
			healing = 21975,
			soloKills = 0,
			realm = 1,
			kills = 0,
			name = L"Alfflaed",
			career = 20,
			db = 0,
			level = 4,
			exp = 2762,
			damage = 8502,
		},
		
		{
			deaths = 0,
			renown = 2449,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 28,
			name = L"Trollkarlious",
			career = 24,
			db = 2,
			level = 10,
			exp = 12316,
			damage = 41534,
		},
		
		{
			deaths = 0,
			renown = 2325,
			healing = 29795,
			soloKills = 0,
			realm = 2,
			kills = 25,
			name = L"Alzathor",
			career = 15,
			db = 0,
			level = 10,
			exp = 10965,
			damage = 253,
		},
		
		{
			deaths = 4,
			renown = 671,
			healing = 344,
			soloKills = 0,
			realm = 1,
			kills = 1,
			name = L"Famous",
			career = 19,
			db = 1,
			level = 10,
			exp = 4476,
			damage = 12247,
		},
		
		{
			deaths = 2,
			renown = 1868,
			healing = 6004,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Alay",
			career = 15,
			db = 2,
			level = 13,
			exp = 13104,
			damage = 6182,
		},
		
		{
			deaths = 3,
			renown = 429,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 0,
			name = L"Skullz",
			career = 2,
			db = 0,
			level = 8,
			exp = 3037,
			damage = 17754,
		},
		
		{
			deaths = 0,
			renown = 1940,
			healing = 52040,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Xelci",
			career = 23,
			db = 0,
			level = 9,
			exp = 12376,
			damage = 2277,
		},
		
		{
			deaths = 4,
			renown = 398,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Droidle",
			career = 10,
			db = 1,
			level = 4,
			exp = 4793,
			damage = 11310,
		},
		
		{
			deaths = 5,
			renown = 394,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 0,
			name = L"Kofala",
			career = 9,
			db = 0,
			level = 4,
			exp = 3839,
			damage = 15003,
		},
		
		{
			deaths = 3,
			renown = 635,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Ejet",
			career = 18,
			db = 1,
			level = 1,
			exp = 4892,
			damage = 12572,
		},
	},
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	unitFramesGroupsDirection2 = 4,
	combatLogTargetDefenseScale = 1,
	groupIconsPetBGAlpha = 0.5,
	unitFramesMyGroupFirst = true,
	unitFramesScale = 1,
	soundOnNewTargetId = 500,
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	combatLogEnabled = true,
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
		id = 2000,
		queuedWithGroup = false,
		activeQueue = 0,
		mode = 2,
		orderPoints = 297,
		timeLeft = 88.273179860786,
		pointMax = 500,
	},
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
	guardMarkEnabled = true,
	intercomPrivate = true,
	groupIconsShowOtherGroups = true,
	combatLogIDSRowScale = 1,
	combatLogLogParseErrors = true,
	combatLogTargetDefenseTotalEnabled = false,
	version = 279,
	guardDistanceIndicatorScaleNormal = 1,
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
	playerDeaths = 18,
	scenarioAlerterEnabled = true,
	groupIconsShowOnMarkedPlayers = false,
	killSpamReparseChunkSize = 20,
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
	guardDistanceIndicatorColorNormal = 
	{
		127,
		181,
		255,
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
			id = "855",
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
				alpha = 1,
				pos = 
				{
					31,
					0,
				},
				deadHide = false,
				anchorFrom = "topleft",
				vertical = false,
				scale = 1,
				distHide = false,
				size = 
				{
					136,
					65,
				},
				texture = "rect",
			},
			exceptMe = false,
			name = L"Selection",
			type = "selectionFrame",
			isEnabled = true,
			playerType = 1,
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
			id = "856",
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
					67,
				},
				texture = "default2",
			},
			exceptMe = false,
			name = L"Background",
			type = "panel",
			isEnabled = true,
			playerType = 1,
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
			id = "857",
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
				alpha = 1,
				textureFullResize = true,
				distHide = false,
				anchorTo = "topleft",
				size = 
				{
					129,
					59,
				},
			},
			exceptMe = false,
			name = L"HP",
			type = "hpbar",
			isEnabled = true,
			playerType = 1,
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
			id = "858",
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
			type = "apbar",
			isEnabled = false,
			playerType = 3,
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
			id = "859",
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
					40,
					-5,
				},
			},
			exceptMe = false,
			name = L"Name",
			type = "nameText",
			isEnabled = true,
			playerType = 1,
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
			id = "860",
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
			type = "careerIcon",
			isEnabled = true,
			playerType = 1,
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
			id = "861",
			data = 
			{
				offlineHide = false,
				pos = 
				{
					10,
					-5,
				},
				anchorTo = "bottomleft",
				align = "center",
				layer = 2,
				anchorFrom = "bottomleft",
				scale = 0.8,
				alpha = 1,
				font = "font_clear_small_bold",
				color = 
				{
					255,
					255,
					255,
				},
				deadHide = false,
				vertical = false,
				distHide = false,
				size = 
				{
					20,
					20,
				},
				texture = "aluminium",
			},
			exceptMe = false,
			name = L"Level",
			type = "levelText",
			isEnabled = true,
			playerType = 1,
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
			id = "862",
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
			type = "groupLeaderIcon",
			isEnabled = true,
			playerType = 1,
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
			id = "863",
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
			type = "moraleBar",
			isEnabled = false,
			playerType = 3,
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
			id = "864",
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
			type = "distanceText",
			isEnabled = false,
			playerType = 1,
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
			id = "865",
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
			type = "distanceBar",
			isEnabled = true,
			playerType = 1,
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
			id = "866",
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
			type = "hppText",
			isEnabled = false,
			playerType = 1,
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
	},
	unitFramesPadding1 = 6,
	guardEnabled = false,
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
	unitFramesEnabled = true,
	chatThrottleDelay = 10,
	unitFramesCount1 = 6,
	groupIconsTargetOnClick = true,
	guardDistanceIndicatorMovable = true,
	combatLogEPSShow = 
	{
		true,
		true,
		true,
		true,
	},
	groupIconsAlpha = 0.4,
	groupIconsPetBGColor = 
	{
		255,
		225,
		255,
	},
	unitFramesGroupsPadding1 = 10,
	scenarioInfoEnabled = true,
	guardDistanceIndicator = 2,
	groupIconsPetOffset = 
	{
		0,
		20,
	},
	stateMachineThrottle = 0.3,
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
	unitFramesSortingEnabled = true,
	groupIconsOtherGroupsHPColor = 
	{
		200,
		255,
		255,
	},
}




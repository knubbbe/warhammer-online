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
			keyModifiers = 
			{
				false,
				false,
				true,
			},
			action = 1,
			mouseButton = 1,
			exceptMe = false,
			abilityId = 8241,
			name = L"Cure",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerType = 1,
			isEnabled = true,
			archetypeMatch = 1,
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
			id = "134000",
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
			id = "134001",
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
			id = "134002",
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
			id = "134003",
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
			id = "134004",
			alpha = 1,
			logic = L"MyBuff and not MyHealing",
			archetypeMatch = 1,
			scale = 1,
			name = L"Buff",
			anchorTo = 9,
			playerType = 1,
			offsetY = 0,
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
			id = "134005",
			alpha = 1,
			logic = L"MyBlessing and not MyHealing",
			archetypeMatch = 1,
			scale = 1,
			name = L"Blessing",
			anchorTo = 9,
			playerType = 1,
			offsetY = 0,
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
			id = "134006",
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
			id = "134007",
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
			id = "134008",
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
			id = "134009",
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
					nameMatch = 1,
					descriptionMatch = 2,
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
					nameMatch = 1,
					descriptionMatch = 2,
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
			id = "134010",
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
					nameMatch = 1,
					descriptionMatch = 2,
					abilityIdsHash = 
					{
						[3882] = true,
						[674] = true,
						[653] = true,
						[695] = true,
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
			id = "134011",
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
					nameMatch = 1,
					descriptionMatch = 2,
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
			id = "134012",
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
					nameMatch = 1,
					descriptionMatch = 2,
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
			id = "134013",
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
					nameMatch = 1,
					descriptionMatch = 2,
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
			id = "134014",
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
			id = "134015",
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
			id = "134016",
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
		id = 3271,
		layer = 3,
		alpha = 1,
		targetOnClick = true,
		color = 
		{
			65,
			150,
			255,
		},
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
			eps = 
			{
				
				{
					total = 347,
					objectTime = 64937023843,
					data = 
					{
						
						{
							str = L"Argog the Unstoppable's attack hits you for 117 damage. (31 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023852,
							value = 117,
							crit = false,
							mit = 31,
							abs = 0,
						},
						
						{
							str = L"Argog the Unstoppable's attack hits you for 115 damage. (31 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023855,
							value = 115,
							crit = false,
							mit = 31,
							abs = 0,
						},
						
						{
							str = L"Argog the Unstoppable's attack hits you for 115 damage. (31 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023857,
							value = 115,
							crit = false,
							mit = 31,
							abs = 0,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Argog the Unstoppable's attack hits you for 117 damage. (31 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023852,
							value = 117,
							crit = false,
							mit = 31,
							abs = 0,
						},
						
						{
							str = L"Argog the Unstoppable's attack hits you for 115 damage. (31 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023855,
							value = 115,
							crit = false,
							mit = 31,
							abs = 0,
						},
						
						{
							str = L"Argog the Unstoppable's attack hits you for 115 damage. (31 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023857,
							value = 115,
							crit = false,
							mit = 31,
							abs = 0,
						},
					},
					object = L"Argog the Unstoppable",
					valueMax = 69,
					value = 69,
					valueAoe = 0,
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Strike hits Argog the Unstoppable for 42 damage. (25 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937023851,
							abs = 0,
							value = 42,
							mit = 25,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							time = 64937023852,
							abs = 0,
							value = 6,
							mit = 5,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937023852,
							abs = 0,
							value = 33,
							mit = 21,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							time = 64937023854,
							abs = 0,
							value = 6,
							mit = 5,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937023855,
							abs = 0,
							value = 33,
							mit = 21,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your Bludgeon hits Argog the Unstoppable for 55 damage. (30 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							time = 64937023855,
							abs = 0,
							value = 55,
							mit = 30,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your Divine Strike hits Argog the Unstoppable for 42 damage. (25 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937023856,
							abs = 0,
							value = 42,
							mit = 25,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							time = 64937023857,
							abs = 0,
							value = 6,
							mit = 5,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937023857,
							abs = 0,
							value = 33,
							mit = 21,
							crit = false,
							object = L"Argog the Unstoppable",
						},
						
						{
							str = L"Your Bludgeon hits Argog the Unstoppable for 55 damage. (30 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							time = 64937023858,
							abs = 0,
							value = 55,
							mit = 30,
							crit = false,
							object = L"Argog the Unstoppable",
						},
					},
					total = 311,
					objectTime = 64937023842,
					data = 
					{
						
						{
							str = L"Your Divine Strike hits Argog the Unstoppable for 42 damage. (25 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023851,
							value = 42,
							crit = false,
							mit = 25,
							abs = 0,
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023852,
							value = 6,
							crit = false,
							mit = 5,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023852,
							value = 33,
							crit = false,
							mit = 21,
							abs = 0,
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023854,
							value = 6,
							crit = false,
							mit = 5,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023855,
							value = 33,
							crit = false,
							mit = 21,
							abs = 0,
						},
						
						{
							str = L"Your Bludgeon hits Argog the Unstoppable for 55 damage. (30 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023855,
							value = 55,
							crit = false,
							mit = 30,
							abs = 0,
						},
						
						{
							str = L"Your Divine Strike hits Argog the Unstoppable for 42 damage. (25 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023856,
							value = 42,
							crit = false,
							mit = 25,
							abs = 0,
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023857,
							value = 6,
							crit = false,
							mit = 5,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023857,
							value = 33,
							crit = false,
							mit = 21,
							abs = 0,
						},
						
						{
							str = L"Your Bludgeon hits Argog the Unstoppable for 55 damage. (30 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023858,
							value = 55,
							crit = false,
							mit = 30,
							abs = 0,
						},
					},
					totalAoe = 311,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Strike hits Argog the Unstoppable for 42 damage. (25 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023851,
							value = 42,
							crit = false,
							mit = 25,
							abs = 0,
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023852,
							value = 6,
							crit = false,
							mit = 5,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023852,
							value = 33,
							crit = false,
							mit = 21,
							abs = 0,
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023854,
							value = 6,
							crit = false,
							mit = 5,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023855,
							value = 33,
							crit = false,
							mit = 21,
							abs = 0,
						},
						
						{
							str = L"Your Bludgeon hits Argog the Unstoppable for 55 damage. (30 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023855,
							value = 55,
							crit = false,
							mit = 30,
							abs = 0,
						},
						
						{
							str = L"Your Divine Strike hits Argog the Unstoppable for 42 damage. (25 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023856,
							value = 42,
							crit = false,
							mit = 25,
							abs = 0,
						},
						
						{
							str = L"Your Castigation hits Argog the Unstoppable for 6 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023857,
							value = 6,
							crit = false,
							mit = 5,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Argog the Unstoppable for 33 damage. (21 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023857,
							value = 33,
							crit = false,
							mit = 21,
							abs = 0,
						},
						
						{
							str = L"Your Bludgeon hits Argog the Unstoppable for 55 damage. (30 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							object = L"Argog the Unstoppable",
							time = 64937023858,
							value = 55,
							crit = false,
							mit = 30,
							abs = 0,
						},
					},
					valueAoe = 44,
					valueMax = 44,
					value = 44,
					object = L"Argog the Unstoppable",
					valueAoeMax = 44,
				},
				
				{
					total = 312,
					objectTime = 64937024037,
					data = 
					{
						
						{
							overheal = 89,
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							str = L"Your Healing Hand heals you for 0 points. (89 overhealed)",
							crit = false,
							time = 64937024048,
						},
						
						{
							overheal = 134,
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
							crit = true,
							time = 64937024051,
						},
						
						{
							overheal = 89,
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							str = L"Your Healing Hand heals you for 0 points. (89 overhealed)",
							crit = false,
							time = 64937024054,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							overheal = 134,
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
							crit = true,
							time = 64937024045,
						},
						
						{
							overheal = 89,
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							str = L"Your Healing Hand heals you for 0 points. (89 overhealed)",
							crit = false,
							time = 64937024048,
						},
						
						{
							overheal = 134,
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
							crit = true,
							time = 64937024051,
						},
					},
					valueAoe = 0,
					valueMax = 60,
					value = 52,
					object = L"Rybert",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							overheal = 134,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
							crit = true,
							time = 64937024045,
						},
						
						{
							overheal = 89,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Healing Hand heals you for 0 points. (89 overhealed)",
							crit = false,
							time = 64937024048,
						},
						
						{
							overheal = 134,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
							crit = true,
							time = 64937024051,
						},
					},
					total = 312,
					objectTime = 64937024037,
					data = 
					{
						
						{
							overheal = 89,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64937024048,
							value = 0,
							object = L"you",
							crit = false,
							str = L"Your Healing Hand heals you for 0 points. (89 overhealed)",
						},
						
						{
							overheal = 134,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64937024051,
							value = 0,
							object = L"you",
							crit = true,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
						},
						
						{
							overheal = 89,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64937024054,
							value = 0,
							object = L"you",
							crit = false,
							str = L"Your Healing Hand heals you for 0 points. (89 overhealed)",
						},
					},
					totalAoe = 312,
					valueMaxData = 
					{
						
						{
							overheal = 134,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64937024045,
							value = 0,
							object = L"you",
							crit = true,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
						},
						
						{
							overheal = 89,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64937024048,
							value = 0,
							object = L"you",
							crit = false,
							str = L"Your Healing Hand heals you for 0 points. (89 overhealed)",
						},
						
						{
							overheal = 134,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							time = 64937024051,
							value = 0,
							object = L"you",
							crit = true,
							str = L"Your Healing Hand critically heals you for 0 points. (134 overhealed)",
						},
					},
					valueAoe = 52,
					valueMax = 60,
					value = 52,
					object = L"you",
					valueAoeMax = 60,
				},
			},
			data = 
			{
				
				{
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1084,
							abs = 0,
							min = 8,
							count = 26,
							max = 117,
							mit = 492,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 181,
								level = 1,
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
							total = 59,
							abs = 0,
							min = 29,
							count = 2,
							max = 30,
							mit = 44,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 193,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Kar Ravensword",
								id = 195,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Ground Rumble"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 10,
							max = 10,
							min = 10,
							count = 1,
							abs = 0,
							mit = 1,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
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
				},
				
				{
					[L"Judgement"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 180,
							abs = 0,
							min = 23,
							count = 7,
							max = 31,
							mit = 136,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 181,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
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
							total = 81,
							abs = 0,
							min = 40,
							count = 2,
							max = 41,
							mit = 46,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 187,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 234,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 288,
							abs = 0,
							min = 43,
							count = 6,
							max = 54,
							mit = 137,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 348,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
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
					[L"Bludgeon"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 293,
							abs = 0,
							min = 55,
							count = 5,
							max = 63,
							mit = 130,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 360,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
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
							total = 168,
							abs = 0,
							min = 79,
							count = 2,
							max = 89,
							mit = 68,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 352,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 147,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Castigation"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 134,
							abs = 0,
							min = 6,
							count = 8,
							max = 35,
							mit = 63,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
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
							total = 66,
							abs = 0,
							min = 10,
							count = 2,
							max = 56,
							mit = 23,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 352,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 352,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 270,
							abs = 0,
							min = 42,
							count = 6,
							max = 48,
							mit = 130,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 360,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
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
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1150,
							abs = 0,
							min = 29,
							count = 33,
							max = 40,
							mit = 584,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Host Marauder",
								id = 348,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Argog the Unstoppable",
								career = 0,
								id = 284,
								level = 2,
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
				},
				
				{
					[L"Rybert - Healing Hand"] = 
					{
						normal = 
						{
							overheal = 3066,
							total = 759,
							abs = 0,
							min = 82,
							count = 44,
							max = 89,
							mit = 0,
							maxObject = 
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
							overheal = 865,
							total = 20,
							abs = 0,
							min = 115,
							count = 7,
							max = 134,
							mit = 0,
							maxObject = 
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
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 5,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Rybert - Divine Strike"] = 
					{
						normal = 
						{
							overheal = 66,
							total = 204,
							abs = 0,
							min = 42,
							count = 6,
							max = 48,
							mit = 0,
							maxObject = 
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
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 6,
								hp = 92,
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
							overheal = 760,
							total = 95,
							max = 95,
							min = 95,
							count = 9,
							abs = 0,
							mit = 0,
							maxObject = 
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
							overheal = 140,
							total = 0,
							max = 140,
							min = 140,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
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
						parry = 0,
					},
					[L"Rybert - Lingering Divine Aid"] = 
					{
						normal = 
						{
							overheal = 920,
							total = 115,
							max = 23,
							min = 23,
							count = 45,
							abs = 0,
							mit = 0,
							maxObject = 
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
							overheal = 101,
							total = 0,
							max = 35,
							min = 33,
							count = 3,
							abs = 0,
							mit = 0,
							maxObject = 
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
						parry = 0,
					},
				},
				
				{
					[L"Healing Hand"] = 
					{
						normal = 
						{
							overheal = 3066,
							total = 759,
							abs = 0,
							min = 82,
							count = 44,
							max = 89,
							mit = 0,
							maxObject = 
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
							overheal = 865,
							total = 20,
							abs = 0,
							min = 115,
							count = 7,
							max = 134,
							mit = 0,
							maxObject = 
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
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 114,
								level = 5,
								hp = 100,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 171,
							total = 279,
							count = 10,
							abs = 0,
							max = 48,
							mit = 0,
							maxObject = 
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
							min = 42,
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
							overheal = 920,
							total = 115,
							max = 23,
							min = 23,
							count = 45,
							abs = 0,
							mit = 0,
							maxObject = 
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
							overheal = 101,
							total = 0,
							max = 35,
							min = 33,
							count = 3,
							abs = 0,
							mit = 0,
							maxObject = 
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
						parry = 0,
					},
					[L"Divine Aid"] = 
					{
						normal = 
						{
							overheal = 760,
							total = 95,
							max = 95,
							min = 95,
							count = 9,
							abs = 0,
							mit = 0,
							maxObject = 
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
							overheal = 140,
							total = 0,
							max = 140,
							min = 140,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
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
						parry = 0,
					},
				},
			},
			name = L"Default",
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
	groupIconsScale = 1,
	playerKills = 0,
	combatLogIDSMaxRows = L"5",
	groupIconsPetAlpha = 1,
	combatLogTargetDefenseTimeframe = 7.5,
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
	objectWindowsTimeout = 20,
	combatLogIgnoreWhenPolymorphed = true,
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
			text = L"",
			alpha = 1,
			targetOnClick = true,
			color = 
			{
				191,
				255,
				0,
			},
			font = "font_clear_large_bold",
			name = L"A",
			layer = 3,
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
			text = L"",
			alpha = 1,
			targetOnClick = true,
			color = 
			{
				255,
				64,
				255,
			},
			font = "font_clear_large_bold",
			name = L"B",
			layer = 3,
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
			text = L"G",
			alpha = 1,
			targetOnClick = true,
			color = 
			{
				65,
				150,
				255,
			},
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
		64,
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
		color = 
		{
			r = 255,
			g = 0,
			b = 0,
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
	scenarioInfoEnabled = true,
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
			archetypeMatch = 1,
			id = "133988",
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
				texture = "rect",
				deadHide = false,
				size = 
				{
					136,
					65,
				},
				vertical = false,
				scale = 1,
				distHide = false,
				anchorFrom = "topleft",
				pos = 
				{
					31,
					0,
				},
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
			id = "133989",
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
				size = 
				{
					136,
					67,
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
				pos = 
				{
					31,
					-1,
				},
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
			id = "133990",
			data = 
			{
				size = 
				{
					129,
					59,
				},
				offlineHide = true,
				distAlpha = 0.5,
				anchorTo = "topleft",
				color = 
				{
					150,
					190,
					255,
				},
				layer = 1,
				anchorFrom = "topleft",
				scale = 1,
				textureFullResize = true,
				vertical = false,
				alpha = 1,
				deadHide = true,
				texture = "default",
				distHide = false,
				wrap = false,
				pos = 
				{
					35,
					3,
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
			id = "133991",
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
			playerType = 3,
			isEnabled = false,
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
			id = "133992",
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
					40,
					-5,
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
			id = "133993",
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
			id = "133994",
			data = 
			{
				offlineHide = false,
				texture = "aluminium",
				anchorTo = "bottomleft",
				align = "center",
				layer = 2,
				anchorFrom = "bottomleft",
				size = 
				{
					20,
					20,
				},
				alpha = 1,
				font = "font_clear_small_bold",
				vertical = false,
				deadHide = false,
				color = 
				{
					255,
					255,
					255,
				},
				distHide = false,
				scale = 0.8,
				pos = 
				{
					10,
					-5,
				},
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
			id = "133995",
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
			id = "133996",
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
			playerType = 3,
			isEnabled = false,
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
			id = "133997",
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
			id = "133998",
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
			id = "133999",
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
	unitFramesPadding1 = 3,
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
	scenarioAlerterEnabled = true,
	combatLogTargetDefenseTotalCalculate = 
	{
		false,
		true,
		true,
		true,
		true,
		true,
	},
	unitFramesCount1 = 6,
	guardDistanceIndicatorScaleNormal = 1,
	combatLogTargetDefenseTotalEnabled = false,
	combatLogIDSRowScale = 1,
	groupIconsShowOtherGroups = true,
	groupIconsPetBGColor = 
	{
		255,
		225,
		255,
	},
	unitFramesGroupsPadding1 = 10,
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
	combatLogEnabled = true,
	unitFramesGroupsDirection2 = 4,
	soundOnNewTargetId = 500,
}




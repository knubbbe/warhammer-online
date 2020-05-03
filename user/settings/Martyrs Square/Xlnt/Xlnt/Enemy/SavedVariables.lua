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
			keyModifiers = 
			{
				false,
				false,
				true,
			},
			playerType = 1,
			exceptMe = false,
			abilityId = 8241,
			name = L"Cure",
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
			playerType = 3,
			name = L"My guard",
			anchorTo = 5,
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
			playerType = 1,
			name = L"Any dispellable",
			anchorTo = 9,
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
			playerType = 1,
			name = L"HoT",
			anchorTo = 9,
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
			id = "871",
			logic = L"MyBuff and not MyHealing",
			alpha = 1,
			playerType = 1,
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
			},
			isEnabled = true,
			name = L"Buff",
			anchorTo = 9,
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
			id = "872",
			logic = L"MyBlessing and not MyHealing",
			alpha = 1,
			playerType = 1,
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
			},
			isEnabled = true,
			name = L"Blessing",
			anchorTo = 9,
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
			playerType = 1,
			name = L"Outgoing 50% heal debuff",
			anchorTo = 8,
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
			playerType = 1,
			name = L"Incomming 50% heal debuff",
			anchorTo = 8,
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
			playerType = 1,
			name = L"DoK/WP regen",
			anchorTo = 8,
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
						[653] = true,
						[695] = true,
						[674] = true,
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
						[3671] = true,
						[8618] = true,
						[8620] = true,
						[8619] = true,
						[8567] = true,
						[3650] = true,
						[1591] = true,
						[3747] = true,
						[3670] = true,
						[3038] = true,
						[8551] = true,
						[3773] = true,
						[1600] = true,
						[1588] = true,
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
		color = 
		{
			65,
			150,
			255,
		},
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
		scale = 0.8,
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
					totalAoe = 0,
					total = 0,
					object = L"Shieldahila",
					value = 0,
					objectTime = 64938067449,
					data = 
					{
						
						{
							str = L"Sistermanic's Consume Strength hits you for 137 damage. (13 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938067442,
							object = L"Sistermanic",
							value = 137,
							crit = false,
							mit = 13,
							ability = L"Consume Strength",
						},
						
						{
							str = L"Sistermanic's Covenant of Vitality hits you for 78 damage. (13 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938067442,
							object = L"Sistermanic",
							value = 78,
							crit = false,
							mit = 13,
							ability = L"Covenant of Vitality",
						},
						
						{
							str = L"Sistermanic's attack hits you for 85 damage. (10 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938067443,
							object = L"Sistermanic",
							value = 85,
							crit = false,
							mit = 10,
							ability = L"attack",
						},
						
						{
							str = L"Sistermanic's attack hits you for 53 damage. (4 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938067443,
							object = L"Sistermanic",
							value = 53,
							crit = false,
							mit = 4,
							ability = L"attack",
						},
						
						{
							str = L"Sistermanic's Consume Essence hits you for 106 damage. (27 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938067443,
							object = L"Sistermanic",
							value = 106,
							crit = false,
							mit = 27,
							ability = L"Consume Essence",
						},
						
						{
							str = L"Sistermanic's Lacerate hits you for 24 damage. (2 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938067444,
							object = L"Sistermanic",
							value = 24,
							crit = false,
							mit = 2,
							ability = L"Lacerate",
						},
						
						{
							str = L"Sistermanic's Lacerate critically hits you for 36 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938067446,
							object = L"Sistermanic",
							value = 36,
							crit = true,
							mit = 3,
							ability = L"Lacerate",
						},
						
						{
							str = L"Jailtime's Mind Killer critically hits you for 224 damage. (21 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938067448,
							object = L"Jailtime",
							value = 224,
							crit = true,
							mit = 21,
							ability = L"Mind Killer",
						},
						
						{
							str = L"Sistermanic's Lacerate hits you for 24 damage. (2 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938067449,
							object = L"Sistermanic",
							value = 24,
							crit = false,
							mit = 2,
							ability = L"Lacerate",
						},
						
						{
							str = L"Shieldahila's I'll Take That! hits you for 0 damage. (31 mitigated) (112 absorbed)",
							type = 1,
							abs = 112,
							currentTarget = true,
							time = 64938067449,
							object = L"Shieldahila",
							value = 0,
							crit = false,
							mit = 31,
							ability = L"I'll Take That!",
						},
					},
					valueAoe = 0,
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"attack",
							value = 25,
							mit = 28,
							crit = false,
							time = 64938067635,
						},
						
						{
							str = L"Your attack hits Vires for 19 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"attack",
							value = 19,
							mit = 15,
							crit = false,
							time = 64938067635,
						},
						
						{
							str = L"Your Snap Shot hits Vires for 32 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"Snap Shot",
							value = 32,
							mit = 36,
							crit = false,
							time = 64938067636,
						},
						
						{
							str = L"Your Torment critically hits Vires for 200 damage. (34 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"Torment",
							value = 200,
							mit = 34,
							crit = true,
							time = 64938067637,
						},
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"attack",
							value = 25,
							mit = 28,
							crit = false,
							time = 64938067638,
						},
						
						{
							str = L"Your Torment critically hits Vires for 202 damage. (34 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"Torment",
							value = 202,
							mit = 34,
							crit = true,
							time = 64938067638,
						},
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"attack",
							value = 25,
							mit = 28,
							crit = false,
							time = 64938067640,
						},
						
						{
							str = L"Your Absolution hits Vires for 223 damage. (109 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							ability = L"Absolution",
							value = 223,
							mit = 109,
							crit = false,
							time = 64938067640,
						},
					},
					total = 751,
					objectTime = 64938067621,
					valueAoeMax = 150,
					totalAoe = 751,
					valueMaxData = 
					{
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067635,
							object = L"Vires",
							value = 25,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your attack hits Vires for 19 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067635,
							object = L"Vires",
							value = 19,
							crit = false,
							mit = 15,
							ability = L"attack",
						},
						
						{
							str = L"Your Snap Shot hits Vires for 32 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067636,
							object = L"Vires",
							value = 32,
							crit = false,
							mit = 36,
							ability = L"Snap Shot",
						},
						
						{
							str = L"Your Torment critically hits Vires for 200 damage. (34 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067637,
							object = L"Vires",
							value = 200,
							crit = true,
							mit = 34,
							ability = L"Torment",
						},
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067638,
							object = L"Vires",
							value = 25,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Torment critically hits Vires for 202 damage. (34 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067638,
							object = L"Vires",
							value = 202,
							crit = true,
							mit = 34,
							ability = L"Torment",
						},
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067640,
							object = L"Vires",
							value = 25,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Absolution hits Vires for 223 damage. (109 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067640,
							object = L"Vires",
							value = 223,
							crit = false,
							mit = 109,
							ability = L"Absolution",
						},
					},
					valueAoe = 150,
					valueMax = 150,
					value = 150,
					object = L"Vires",
					data = 
					{
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067635,
							object = L"Vires",
							value = 25,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your attack hits Vires for 19 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067635,
							object = L"Vires",
							value = 19,
							crit = false,
							mit = 15,
							ability = L"attack",
						},
						
						{
							str = L"Your Snap Shot hits Vires for 32 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067636,
							object = L"Vires",
							value = 32,
							crit = false,
							mit = 36,
							ability = L"Snap Shot",
						},
						
						{
							str = L"Your Torment critically hits Vires for 200 damage. (34 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067637,
							object = L"Vires",
							value = 200,
							crit = true,
							mit = 34,
							ability = L"Torment",
						},
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067638,
							object = L"Vires",
							value = 25,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Torment critically hits Vires for 202 damage. (34 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067638,
							object = L"Vires",
							value = 202,
							crit = true,
							mit = 34,
							ability = L"Torment",
						},
						
						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067640,
							object = L"Vires",
							value = 25,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Absolution hits Vires for 223 damage. (109 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64938067640,
							object = L"Vires",
							value = 223,
							crit = false,
							mit = 109,
							ability = L"Absolution",
						},
					},
				},
				
				{
					total = 596,
					objectTime = 64938067404,
					data = 
					{
						
						{
							str = L"Something's Rune of Regeneration heals you for 158 points.",
							type = 3,
							ability = L"Rune of Regeneration",
							currentTarget = false,
							object = L"Something",
							value = 158,
							time = 64938067456,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Something's Rune of Shielding heals you for 122 points.",
							type = 3,
							ability = L"Rune of Shielding",
							currentTarget = false,
							object = L"Something",
							value = 122,
							time = 64938067459,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Something's Rune of Regeneration heals you for 158 points.",
							type = 3,
							ability = L"Rune of Regeneration",
							currentTarget = false,
							object = L"Something",
							value = 158,
							time = 64938067460,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Something's Rune of Regeneration heals you for 135 points. (23 overhealed)",
							type = 3,
							ability = L"Rune of Regeneration",
							currentTarget = false,
							object = L"Something",
							value = 135,
							time = 64938067463,
							crit = false,
							overheal = 23,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067422,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"Xlnt",
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067423,
							value = 133,
							overheal = 0,
							crit = false,
							object = L"Xlnt",
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 78 points. (55 overhealed)",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067424,
							value = 78,
							overheal = 55,
							crit = false,
							object = L"Xlnt",
						},
					},
					valueAoe = 0,
					valueMax = 575,
					value = 85,
					object = L"Xlnt",
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
					[L"Throat Slasha"] = 
					{
						normal = 
						{
							min = 29,
							total = 213,
							count = 5,
							mit = 22,
							abs = 0,
							max = 110,
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
					[L"Wot armor?"] = 
					{
						normal = 
						{
							min = 73,
							total = 73,
							count = 1,
							abs = 0,
							max = 73,
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
					[L"Ravage"] = 
					{
						normal = 
						{
							min = 105,
							total = 105,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 30,
							max = 105,
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
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
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
					[L"ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 3823,
							abs = 3660,
							min = 0,
							count = 62,
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
							mit = 1110,
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
					[L"Life Leaka"] = 
					{
						normal = 
						{
							min = 65,
							total = 424,
							count = 6,
							abs = 0,
							max = 74,
							mit = 158,
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
					[L"Yer Bleedin'!"] = 
					{
						normal = 
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
					[L"What Blocka?"] = 
					{
						normal = 
						{
							min = 143,
							total = 143,
							count = 1,
							abs = 0,
							max = 143,
							mit = 29,
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
							min = 80,
							total = 160,
							count = 2,
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
					[L"Lacerate"] = 
					{
						normal = 
						{
							min = 0,
							total = 515,
							count = 16,
							overheal = 0,
							abs = 94,
							max = 92,
							mit = 54,
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
							mit = 17,
							abs = 0,
							max = 19,
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
					[L"Covenant of Vitality"] = 
					{
						normal = 
						{
							min = 76,
							total = 622,
							count = 8,
							mit = 106,
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
							total = 143,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 13,
							max = 143,
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
					[L"attack"] = 
					{
						normal = 
						{
							min = 8,
							total = 17326,
							count = 285,
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
							mit = 4527,
							abs = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 3096,
							abs = 0,
							min = 12,
							count = 32,
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
							mit = 755,
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
						parry = 17,
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
					[L"Ard Noggin"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 122,
							max = 122,
							min = 122,
							count = 3,
							abs = 0,
							mit = 28,
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
						parry = 2,
					},
					[L"Consume Essence"] = 
					{
						normal = 
						{
							min = 85,
							total = 589,
							count = 6,
							overheal = 0,
							abs = 0,
							max = 106,
							mit = 159,
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
							total = 139,
							max = 139,
							min = 139,
							count = 1,
							abs = 0,
							mit = 30,
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
					[L"Bunch o' Waaagh"] = 
					{
						normal = 
						{
							min = 25,
							total = 385,
							count = 3,
							abs = 155,
							max = 180,
							mit = 171,
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
					[L"Tzeentch's Cry"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 236,
							max = 123,
							min = 113,
							count = 2,
							abs = 0,
							mit = 88,
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
							total = 2841,
							max = 100,
							min = 28,
							count = 35,
							abs = 0,
							mit = 190,
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
					[L"Torment"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 3250,
							max = 126,
							min = 0,
							count = 39,
							abs = 358,
							mit = 1259,
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
								id = 3850,
								level = 12,
								hp = 100,
								name = L"Darkrite",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 1682,
							max = 202,
							min = 67,
							count = 12,
							abs = 0,
							mit = 540,
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
							mit = 4221,
							abs = 0,
							max = 441,
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
					[L"ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 2,
							abs = 25,
							mit = 39,
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
					[L"Absolution"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 3966,
							max = 223,
							min = 48,
							count = 44,
							abs = 23,
							mit = 1456,
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
							total = 648,
							max = 399,
							min = 249,
							count = 2,
							abs = 5,
							mit = 113,
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
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 10222,
							abs = 0,
							min = 6,
							count = 416,
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
							mit = 8977,
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
							total = 1472,
							abs = 0,
							min = 9,
							count = 42,
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
							mit = 1337,
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
						parry = 3,
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
					[L"Fervor"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2093,
							max = 79,
							min = 0,
							count = 67,
							abs = 59,
							mit = 828,
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
							total = 650,
							max = 84,
							min = 15,
							count = 14,
							abs = 0,
							mit = 242,
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
					[L"Snap Shot"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 685,
							max = 36,
							min = 9,
							count = 36,
							abs = 0,
							mit = 904,
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
						dodge = 1,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 89,
							max = 36,
							min = 23,
							count = 3,
							abs = 0,
							mit = 123,
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
							total = 2629,
							max = 145,
							min = 39,
							count = 43,
							abs = 0,
							mit = 1195,
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
	playerKills = 8,
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
			renown = 1073,
			healing = 0,
			soloKills = 0,
			exp = 11166,
			kills = 34,
			name = L"Uryuu",
			damage = 16973,
			db = 2,
			level = 11,
			career = 18,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 2264,
			healing = 21202,
			soloKills = 0,
			exp = 11585,
			kills = 32,
			name = L"Errvus",
			damage = 6463,
			db = 1,
			level = 15,
			career = 7,
			realm = 2,
		},
		
		{
			deaths = 6,
			renown = 878,
			healing = 0,
			soloKills = 0,
			exp = 9345,
			kills = 31,
			name = L"Quirlath",
			damage = 16779,
			db = 3,
			level = 14,
			career = 17,
			realm = 1,
		},
		
		{
			deaths = 2,
			renown = 1219,
			healing = 1132,
			soloKills = 0,
			exp = 12774,
			kills = 37,
			name = L"Warbringerz",
			damage = 34857,
			db = 8,
			level = 14,
			career = 19,
			realm = 1,
		},
		
		{
			deaths = 2,
			renown = 1131,
			healing = 0,
			soloKills = 0,
			exp = 12208,
			kills = 38,
			name = L"Flingueuse",
			damage = 23372,
			db = 6,
			level = 15,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 1570,
			healing = 0,
			soloKills = 0,
			exp = 14364,
			kills = 38,
			name = L"Xlnt",
			damage = 13095,
			db = 2,
			level = 6,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 2712,
			healing = 14035,
			soloKills = 0,
			exp = 12084,
			kills = 34,
			name = L"Grzfrst",
			damage = 8033,
			db = 3,
			level = 6,
			career = 7,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 2577,
			healing = 20367,
			soloKills = 0,
			exp = 11897,
			kills = 33,
			name = L"Shieldahila",
			damage = 5656,
			db = 3,
			level = 10,
			career = 7,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 1273,
			healing = 0,
			soloKills = 0,
			exp = 11845,
			kills = 35,
			name = L"Gingerbeerd",
			damage = 38964,
			db = 3,
			level = 11,
			career = 4,
			realm = 1,
		},
		
		{
			deaths = 5,
			renown = 2061,
			healing = 0,
			soloKills = 0,
			exp = 10807,
			kills = 28,
			name = L"Dranzir",
			damage = 17936,
			db = 6,
			level = 9,
			career = 13,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 952,
			healing = 0,
			soloKills = 0,
			exp = 9767,
			kills = 34,
			name = L"Dumperpumper",
			damage = 26067,
			db = 6,
			level = 14,
			career = 1,
			realm = 1,
		},
		
		{
			deaths = 1,
			renown = 2020,
			healing = 36750,
			soloKills = 0,
			exp = 12595,
			kills = 30,
			name = L"Denying",
			damage = 2759,
			db = 1,
			level = 11,
			career = 23,
			realm = 2,
		},
		
		{
			deaths = 5,
			renown = 2267,
			healing = 0,
			soloKills = 0,
			exp = 13326,
			kills = 27,
			name = L"Ghakmakull",
			damage = 6900,
			db = 3,
			level = 11,
			career = 5,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 2647,
			healing = 0,
			soloKills = 0,
			exp = 11615,
			kills = 31,
			name = L"Elune",
			damage = 15407,
			db = 5,
			level = 6,
			career = 22,
			realm = 2,
		},
		
		{
			deaths = 4,
			renown = 907,
			healing = 0,
			soloKills = 0,
			exp = 7758,
			kills = 32,
			name = L"Gwyn",
			damage = 5159,
			db = 0,
			level = 7,
			career = 11,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 1852,
			healing = 0,
			soloKills = 0,
			exp = 11351,
			kills = 27,
			name = L"Dabigdude",
			damage = 7007,
			db = 3,
			level = 12,
			career = 6,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 1384,
			healing = 0,
			soloKills = 0,
			exp = 12947,
			kills = 40,
			name = L"Fondueswiss",
			damage = 7072,
			db = 0,
			level = 11,
			career = 11,
			realm = 1,
		},
		
		{
			deaths = 4,
			renown = 831,
			healing = 0,
			soloKills = 0,
			exp = 7837,
			kills = 28,
			name = L"Gaylord",
			damage = 14267,
			db = 5,
			level = 9,
			career = 11,
			realm = 1,
		},
		
		{
			deaths = 5,
			renown = 2115,
			healing = 0,
			soloKills = 0,
			exp = 12377,
			kills = 27,
			name = L"Snotbomb",
			damage = 9607,
			db = 1,
			level = 8,
			career = 8,
			realm = 2,
		},
		
		{
			deaths = 4,
			renown = 2659,
			healing = 0,
			soloKills = 0,
			exp = 11545,
			kills = 33,
			name = L"Jailtime",
			damage = 16274,
			db = 7,
			level = 14,
			career = 21,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 2144,
			healing = 12674,
			soloKills = 0,
			exp = 11401,
			kills = 25,
			name = L"Nielecze",
			damage = 10245,
			db = 3,
			level = 9,
			career = 7,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 968,
			healing = 0,
			soloKills = 0,
			exp = 8561,
			kills = 31,
			name = L"Marhuz",
			damage = 11443,
			db = 1,
			level = 10,
			career = 11,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 816,
			healing = 0,
			soloKills = 0,
			exp = 8068,
			kills = 30,
			name = L"Romulusxiii",
			damage = 13089,
			db = 5,
			level = 10,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 4,
			renown = 2569,
			healing = 8336,
			soloKills = 0,
			exp = 11442,
			kills = 32,
			name = L"Zonkrun",
			damage = 5323,
			db = 3,
			level = 7,
			career = 5,
			realm = 2,
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
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	soundOnNewTargetId = 500,
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
		timeLeft = 86.027123809792,
		orderPoints = 479,
		pointMax = 500,
		mode = 2,
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
	combatLogLogParseErrors = true,
	combatLogIDSRowScale = 1,
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
	playerDeaths = 9,
	scenarioAlerterEnabled = true,
	killSpamReparseChunkSize = 20,
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
			type = "selectionFrame",
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
			isEnabled = true,
			name = L"Selection",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = true,
			name = L"Background",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = true,
			name = L"HP",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = false,
			name = L"AP",
			archetypeMatch = 1,
			playerType = 3,
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
			isEnabled = true,
			name = L"Name",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = true,
			name = L"Icon",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = true,
			name = L"Level",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = true,
			name = L"Leader",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = false,
			name = L"Morale",
			archetypeMatch = 1,
			playerType = 3,
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
			isEnabled = false,
			name = L"Distance",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = true,
			name = L"Distance bar",
			archetypeMatch = 1,
			playerType = 1,
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
			isEnabled = false,
			name = L"HP %",
			archetypeMatch = 1,
			playerType = 1,
			archetypes = 
			{
				false,
				false,
				false,
			},
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
	guardDistanceIndicator = 2,
	scenarioInfoEnabled = true,
	groupIconsPetOffset = 
	{
		0,
		20,
	},
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
		text = L"KILL",
		alpha = 1,
		scale = 1,
		targetOnClick = true,
		font = "font_clear_large_bold",
		name = L"",
		layer = 3,
		display = 1,
		offsetY = 50,
		neverExpire = false,
		permanent = false,
	},
	stateMachineThrottle = 0.3,
	unitFramesSortingEnabled = true,
	groupIconsOtherGroupsHPColor = 
	{
		200,
		255,
		255,
	},
}




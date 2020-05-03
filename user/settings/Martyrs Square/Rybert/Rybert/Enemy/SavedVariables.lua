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
			id = "3405",
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
			id = "3406",
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
			id = "3407",
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
			id = "3408",
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
			id = "3409",
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
			id = "3410",
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
			id = "3411",
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
			id = "3412",
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
			id = "3413",
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
			id = "3414",
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
			id = "3415",
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
			id = "3416",
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
			id = "3417",
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
			id = "3418",
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
			id = "3419",
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
			id = "3420",
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
			id = "3421",
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
		layer = 3,
		alpha = 1,
		targetOnClick = true,
		text = L"G",
		font = "font_default_text_giant",
		name = L"",
		scale = 0.8,
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
					total = 338,
					objectTime = 64937361554,
					data = 
					{
						
						{
							str = L"Tainted Hound's attack critically hits you for 101 damage. (39 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361573,
							abs = 0,
							value = 101,
							mit = 39,
							crit = true,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's attack hits you for 69 damage. (26 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361575,
							abs = 0,
							value = 69,
							mit = 26,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's attack hits you for 69 damage. (26 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361577,
							abs = 0,
							value = 69,
							mit = 26,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's Rabid Bite critically hits you for 99 damage. (48 mitigated)",
							type = 1,
							ability = L"Rabid Bite",
							currentTarget = true,
							time = 64937361577,
							abs = 0,
							value = 99,
							mit = 48,
							crit = true,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's attack hits you for 69 damage. (26 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361580,
							abs = 0,
							value = 69,
							mit = 26,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's Lunging Maw hits you for 0 damage. (34 mitigated) (71 absorbed)",
							type = 1,
							ability = L"Lunging Maw",
							currentTarget = true,
							time = 64937361580,
							abs = 71,
							value = 0,
							mit = 34,
							crit = false,
							object = L"Tainted Hound",
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Tainted Hound's attack critically hits you for 101 damage. (39 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361573,
							abs = 0,
							value = 101,
							mit = 39,
							crit = true,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's attack hits you for 69 damage. (26 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361575,
							abs = 0,
							value = 69,
							mit = 26,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's attack hits you for 69 damage. (26 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361577,
							abs = 0,
							value = 69,
							mit = 26,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's Rabid Bite critically hits you for 99 damage. (48 mitigated)",
							type = 1,
							ability = L"Rabid Bite",
							currentTarget = true,
							time = 64937361577,
							abs = 0,
							value = 99,
							mit = 48,
							crit = true,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's attack hits you for 69 damage. (26 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937361580,
							abs = 0,
							value = 69,
							mit = 26,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Tainted Hound's Lunging Maw hits you for 0 damage. (34 mitigated) (71 absorbed)",
							type = 1,
							ability = L"Lunging Maw",
							currentTarget = true,
							time = 64937361580,
							abs = 71,
							value = 0,
							mit = 34,
							crit = false,
							object = L"Tainted Hound",
						},
					},
					valueAoe = 0,
					valueMax = 48,
					value = 48,
					object = L"Tainted Hound",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your attack hits Tainted Hound for 29 damage. (25 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937361564,
							object = L"Tainted Hound",
							value = 29,
							crit = false,
							mit = 25,
							ability = L"attack",
						},
						
						{
							str = L"Your Sigmar's Fist hits Tainted Hound for 51 damage. (35 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937361564,
							object = L"Tainted Hound",
							value = 51,
							crit = false,
							mit = 35,
							ability = L"Sigmar's Fist",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Hound for 69 damage. (39 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937361566,
							object = L"Tainted Hound",
							value = 69,
							crit = false,
							mit = 39,
							ability = L"Bludgeon",
						},
						
						{
							str = L"Your attack hits Tainted Hound for 34 damage. (27 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937361566,
							object = L"Tainted Hound",
							value = 34,
							crit = false,
							mit = 27,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Strike hits Tainted Hound for 52 damage. (31 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937361568,
							object = L"Tainted Hound",
							value = 52,
							crit = false,
							mit = 31,
							ability = L"Divine Strike",
						},
						
						{
							str = L"Your attack hits Tainted Hound for 34 damage. (27 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937361569,
							object = L"Tainted Hound",
							value = 34,
							crit = false,
							mit = 27,
							ability = L"attack",
						},
					},
					total = 317,
					objectTime = 64937361556,
					data = 
					{
						
						{
							str = L"Your Divine Assault hits Tainted Hound for 43 damage. (21 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937361574,
							abs = 0,
							value = 43,
							mit = 21,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Hound for 43 damage. (21 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937361575,
							abs = 0,
							value = 43,
							mit = 21,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Hound for 43 damage. (21 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937361576,
							abs = 0,
							value = 43,
							mit = 21,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your attack hits Tainted Hound for 34 damage. (27 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937361576,
							abs = 0,
							value = 34,
							mit = 27,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your attack hits Tainted Hound for 34 damage. (27 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937361579,
							abs = 0,
							value = 34,
							mit = 27,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Hound for 69 damage. (39 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							time = 64937361579,
							abs = 0,
							value = 69,
							mit = 39,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your attack critically hits Tainted Hound for 51 damage. (39 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937361581,
							abs = 0,
							value = 51,
							mit = 39,
							crit = true,
							object = L"Tainted Hound",
						},
					},
					totalAoe = 317,
					valueMaxData = 
					{
						
						{
							str = L"Your attack hits Tainted Hound for 29 damage. (25 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937361564,
							abs = 0,
							value = 29,
							mit = 25,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your Sigmar's Fist hits Tainted Hound for 51 damage. (35 mitigated)",
							type = 2,
							ability = L"Sigmar's Fist",
							currentTarget = true,
							time = 64937361564,
							abs = 0,
							value = 51,
							mit = 35,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Hound for 69 damage. (39 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							time = 64937361566,
							abs = 0,
							value = 69,
							mit = 39,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your attack hits Tainted Hound for 34 damage. (27 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937361566,
							abs = 0,
							value = 34,
							mit = 27,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your Divine Strike hits Tainted Hound for 52 damage. (31 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937361568,
							abs = 0,
							value = 52,
							mit = 31,
							crit = false,
							object = L"Tainted Hound",
						},
						
						{
							str = L"Your attack hits Tainted Hound for 34 damage. (27 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937361569,
							abs = 0,
							value = 34,
							mit = 27,
							crit = false,
							object = L"Tainted Hound",
						},
					},
					valueAoe = 45,
					valueMax = 54,
					value = 45,
					valueAoeMax = 54,
					object = L"Tainted Hound",
				},
				
				{
					total = 960,
					objectTime = 64937361554,
					data = 
					{
						
						{
							str = L"Your Healing Hand heals you for 35 points. (85 overhealed)",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 35,
							time = 64937361572,
							crit = false,
							overheal = 85,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (150 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937361572,
							crit = false,
							overheal = 150,
						},
						
						{
							str = L"Your Divine Assault heals you for 101 points. (49 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 101,
							time = 64937361574,
							crit = false,
							overheal = 49,
						},
						
						{
							str = L"Your Healing Hand heals you for 0 points. (120 overhealed)",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937361575,
							crit = false,
							overheal = 120,
						},
						
						{
							str = L"Your Divine Assault heals you for 69 points. (81 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 69,
							time = 64937361575,
							crit = false,
							overheal = 81,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (150 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937361576,
							crit = false,
							overheal = 150,
						},
						
						{
							str = L"Your Healing Hand heals you for 120 points.",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 120,
							time = 64937361578,
							crit = false,
							overheal = 0,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Your Healing Hand heals you for 35 points. (85 overhealed)",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 35,
							time = 64937361572,
							crit = false,
							overheal = 85,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (150 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937361572,
							crit = false,
							overheal = 150,
						},
						
						{
							str = L"Your Divine Assault heals you for 101 points. (49 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 101,
							time = 64937361574,
							crit = false,
							overheal = 49,
						},
						
						{
							str = L"Your Healing Hand heals you for 0 points. (120 overhealed)",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937361575,
							crit = false,
							overheal = 120,
						},
						
						{
							str = L"Your Divine Assault heals you for 69 points. (81 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 69,
							time = 64937361575,
							crit = false,
							overheal = 81,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (150 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937361576,
							crit = false,
							overheal = 150,
						},
						
						{
							str = L"Your Healing Hand heals you for 120 points.",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 120,
							time = 64937361578,
							crit = false,
							overheal = 0,
						},
					},
					valueAoe = 0,
					valueMax = 160,
					value = 160,
					object = L"Rybert",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Aid heals Khanivorhia for 170 points.",
							type = 4,
							ability = L"Divine Aid",
							currentTarget = true,
							object = L"Khanivorhia",
							value = 170,
							time = 64937362173,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid critically heals Khanivorhia for 4 points. (57 overhealed)",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = false,
							object = L"Khanivorhia",
							value = 4,
							time = 64937362174,
							crit = true,
							overheal = 57,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Khanivorhia for 0 points. (41 overhealed)",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = false,
							object = L"Khanivorhia",
							value = 0,
							time = 64937362175,
							crit = false,
							overheal = 41,
						},
						
						{
							str = L"Your Lingering Divine Aid critically heals Khanivorhia for 0 points. (59 overhealed)",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = false,
							object = L"Khanivorhia",
							value = 0,
							time = 64937362176,
							crit = true,
							overheal = 59,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Khanivorhia for 0 points. (41 overhealed)",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = false,
							object = L"Khanivorhia",
							value = 0,
							time = 64937362177,
							crit = false,
							overheal = 41,
						},
						
						{
							str = L"Your Healing Hand heals Doshehowyou for 0 points. (158 overhealed)",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = false,
							object = L"Doshehowyou",
							value = 0,
							time = 64937362177,
							crit = false,
							overheal = 158,
						},
						
						{
							str = L"Your Lingering Divine Aid heals Khanivorhia for 0 points. (41 overhealed)",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = false,
							object = L"Khanivorhia",
							value = 0,
							time = 64937362178,
							crit = false,
							overheal = 41,
						},
					},
					total = 0,
					objectTime = 64937362173,
					data = 
					{
						
						{
							overheal = 158,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = false,
							object = L"Doshehowyou",
							value = 0,
							str = L"Your Healing Hand heals Doshehowyou for 0 points. (158 overhealed)",
							crit = false,
							time = 64937362183,
						},
						
						{
							overheal = 158,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = false,
							object = L"Doshehowyou",
							value = 0,
							str = L"Your Healing Hand heals Doshehowyou for 0 points. (158 overhealed)",
							crit = false,
							time = 64937362186,
						},
						
						{
							overheal = 158,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = false,
							object = L"Doshehowyou",
							value = 0,
							str = L"Your Healing Hand heals Doshehowyou for 0 points. (158 overhealed)",
							crit = false,
							time = 64937362189,
						},
					},
					totalAoe = 474,
					valueMaxData = 
					{
						[1] = 
						{
							overheal = 0,
							type = 4,
							ability = L"Divine Aid",
							currentTarget = true,
							object = L"Khanivorhia",
							value = 170,
							str = L"Your Divine Aid heals Khanivorhia for 170 points.",
							crit = false,
							time = 64937362173,
						},
					},
					valueAoe = 79,
					valueMax = 34,
					value = 0,
					valueAoeMax = 114,
					object = L"Khanivorhia",
				},
			},
			name = L"Default",
			data = 
			{
				
				{
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
					[L"Scythe Gash"] = 
					{
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
								name = L"Eoldred Nightbane",
								isFriendly = false,
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
								name = L"Eoldred Nightbane",
								isFriendly = false,
								id = 239,
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
								name = L"Sigmundi Spirit",
								isFriendly = false,
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
								name = L"Sigmundi Spirit",
								isFriendly = false,
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
					[L"ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 3823,
							max = 2016,
							min = 0,
							count = 62,
							abs = 3660,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 2305,
								level = 7,
								hp = 67,
								career = 12,
							},
							mit = 1110,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1196,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
								name = L"Tainted Hound",
								isFriendly = false,
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
								name = L"Krev the Plunderer",
								isFriendly = false,
								id = 4039,
								level = 8,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Rabid Bite"] = 
					{
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
								name = L"Tainted Hound",
								isFriendly = false,
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
								career = 0,
								isFriendly = false,
								id = 1196,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
								name = L"Tainted Hound",
								isFriendly = false,
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
								career = 0,
								isFriendly = false,
								id = 1181,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						parry = 0,
					},
					[L"Ethereal Hand"] = 
					{
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
								name = L"Sigmundi Spirit",
								isFriendly = false,
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
								name = L"Sigmundi Spirit",
								isFriendly = false,
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
					[L"Ethereal Emanation"] = 
					{
						normal = 
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
								name = L"Eoldred Nightbane",
								isFriendly = false,
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
								name = L"Eoldred Nightbane",
								isFriendly = false,
								id = 239,
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
					[L"Lunging Maw"] = 
					{
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
								name = L"Tainted Hound",
								isFriendly = false,
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
								career = 0,
								isFriendly = false,
								id = 1196,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
								career = 0,
								isFriendly = false,
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
								career = 0,
								isFriendly = false,
								id = 1180,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
						},
						parry = 0,
					},
					[L"Gas Squig's Goop Shootin'"] = 
					{
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
								name = L"Terrorbit",
								isFriendly = false,
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
								name = L"Terrorbit",
								isFriendly = false,
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
							max = 18,
							min = 18,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Terrorbit",
								isFriendly = false,
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
								name = L"Terrorbit",
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
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
					[L"Ground Rumble"] = 
					{
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
								name = L"Argog the Unstoppable",
								career = 0,
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
					[L"Yer Bleedin'!"] = 
					{
						normal = 
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
								name = L"Terrorbit",
								isFriendly = false,
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
								name = L"Terrorbit",
								isFriendly = false,
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
							total = 113,
							max = 113,
							min = 113,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Terrorbit",
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
							mit = 29,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Terrorbit",
								isFriendly = false,
								id = 2650,
								level = 13,
								hp = 95,
								career = 8,
							},
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
					[L"attack"] = 
					{
						normal = 
						{
							min = 8,
							total = 13194,
							count = 194,
							overheal = 0,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Blackhand the Deceiver",
								isFriendly = false,
								id = 3937,
								level = 7,
								hp = 30,
								career = 0,
							},
							mit = 3609,
							max = 183,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
								name = L"Blackhand the Deceiver",
								isFriendly = false,
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
								name = L"Nurgling",
								isFriendly = false,
								id = 206,
								level = 1,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
				},
				
				{
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 7153,
							max = 47,
							min = 9,
							count = 234,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Shikimara",
								isFriendly = false,
								id = 2674,
								level = 4,
								hp = 100,
								career = 22,
							},
							mit = 5793,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Lorok the Heartless",
								isFriendly = false,
								id = 3864,
								level = 7,
								hp = 97,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
								name = L"Costusss",
								isFriendly = false,
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
								name = L"Lorok the Heartless",
								isFriendly = false,
								id = 3864,
								level = 7,
								hp = 97,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Divine Assault"] = 
					{
						normal = 
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
								career = 0,
								isFriendly = false,
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
								name = L"Escaped Patient",
								isFriendly = false,
								id = 4065,
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
							total = 854,
							max = 68,
							min = 43,
							count = 17,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1180,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 516,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Blackhand the Deceiver",
								isFriendly = false,
								id = 3937,
								level = 7,
								hp = 30,
								career = 0,
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
							max = 76,
							min = 35,
							count = 44,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Shikimara",
								isFriendly = false,
								id = 2674,
								level = 4,
								hp = 100,
								career = 22,
							},
							mit = 1297,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Dalsgard",
								isFriendly = false,
								id = 2626,
								level = 14,
								hp = 88,
								career = 13,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 468,
							max = 90,
							min = 0,
							count = 8,
							abs = 66,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Klaudiana",
								isFriendly = false,
								id = 2655,
								level = 3,
								hp = 79,
								career = 21,
							},
							mit = 359,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Rhetr",
								isFriendly = false,
								id = 2512,
								level = 10,
								hp = 26,
								career = 13,
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
							max = 110,
							min = 27,
							count = 100,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Costusss",
								isFriendly = false,
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
								name = L"Lorok the Heartless",
								isFriendly = false,
								id = 3864,
								level = 7,
								hp = 97,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
								career = 0,
								isFriendly = false,
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
								name = L"Tainted Hound",
								isFriendly = false,
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
						normal = 
						{
							overheal = 0,
							total = 2168,
							max = 41,
							min = 2,
							count = 156,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 847,
								level = 7,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 1534,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Lorok the Heartless",
								isFriendly = false,
								id = 3864,
								level = 7,
								hp = 97,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
								name = L"Tainted Hound",
								isFriendly = false,
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
								name = L"Tainted Hound",
								isFriendly = false,
								id = 4186,
								level = 6,
								hp = 100,
								career = 0,
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
							max = 55,
							min = 37,
							count = 36,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1180,
								level = 6,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 1104,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Blackhand the Deceiver",
								isFriendly = false,
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
							total = 73,
							max = 73,
							min = 73,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Nurgling",
								isFriendly = false,
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
								name = L"Nurgling",
								isFriendly = false,
								id = 204,
								level = 1,
								hp = 100,
								career = 0,
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
							max = 51,
							min = 21,
							count = 20,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Anehtas",
								isFriendly = false,
								id = 2527,
								level = 12,
								hp = 100,
								career = 24,
							},
							mit = 453,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Blackhand the Deceiver",
								isFriendly = false,
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
							max = 41,
							min = 33,
							count = 3,
							abs = 0,
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
							mit = 86,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
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
							overheal = 951,
							total = 737,
							abs = 0,
							min = 23,
							count = 68,
							max = 31,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 92,
								name = L"Rybert",
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
							overheal = 101,
							total = 88,
							abs = 0,
							min = 33,
							count = 5,
							max = 45,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 78,
								name = L"Rybert",
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
						parry = 0,
					},
					[L"Rybert - Divine Aid"] = 
					{
						normal = 
						{
							overheal = 760,
							total = 558,
							abs = 0,
							min = 95,
							count = 13,
							max = 128,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 77,
								name = L"Rybert",
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
								career = 12,
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 66,
								name = L"Rybert",
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
						parry = 0,
					},
					[L"Rybert - Divine Assault"] = 
					{
						normal = 
						{
							overheal = 8032,
							total = 7419,
							max = 238,
							min = 108,
							count = 118,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 100,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
					[L"Rybert - Healing Hand"] = 
					{
						normal = 
						{
							overheal = 6364,
							total = 4328,
							max = 186,
							min = 82,
							count = 104,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
							overheal = 873,
							total = 495,
							max = 169,
							min = 115,
							count = 10,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 98,
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
							overheal = 464,
							total = 1688,
							max = 65,
							min = 37,
							count = 46,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 2800,
								level = 8,
								hp = 87,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
					[L"Rybert - Divine Mend"] = 
					{
						normal = 
						{
							overheal = 398,
							total = 0,
							max = 199,
							min = 199,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
								id = 2800,
								level = 8,
								hp = 100,
								career = 12,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
							total = 4524,
							max = 160,
							min = 73,
							count = 81,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
								name = L"Rybert",
								isFriendly = true,
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
				},
				
				{
					[L"Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 2560,
							total = 4524,
							max = 160,
							min = 73,
							count = 81,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
								name = L"Rybert",
								isFriendly = true,
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
					[L"Lingering Divine Aid"] = 
					{
						normal = 
						{
							min = 23,
							total = 3511,
							count = 153,
							overheal = 1770,
							abs = 0,
							max = 47,
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
							overheal = 217,
							total = 573,
							abs = 0,
							min = 33,
							count = 15,
							max = 64,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Eladorin",
								isFriendly = true,
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
					[L"Divine Mend"] = 
					{
						normal = 
						{
							overheal = 398,
							total = 199,
							max = 199,
							min = 199,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Nightswatch",
								isFriendly = true,
								id = 3769,
								level = 11,
								hp = 10,
								career = 11,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Nightswatch",
								isFriendly = true,
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
							max = 238,
							min = 108,
							count = 118,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 10,
								hp = 100,
								name = L"Rybert",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
					[L"Healing Hand"] = 
					{
						normal = 
						{
							overheal = 11299,
							total = 11995,
							abs = 0,
							min = 82,
							count = 183,
							max = 186,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Rybert",
								isFriendly = true,
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
							min = 115,
							total = 1947,
							count = 22,
							overheal = 2035,
							abs = 0,
							max = 264,
							mit = 0,
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
							overheal = 770,
							total = 2550,
							abs = 0,
							min = 35,
							count = 66,
							max = 90,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Eladorin",
								isFriendly = true,
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
								name = L"Eladorin",
								isFriendly = true,
								id = 2470,
								level = 11,
								hp = 62,
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
					[L"Divine Aid"] = 
					{
						normal = 
						{
							overheal = 996,
							total = 3313,
							abs = 0,
							min = 95,
							count = 30,
							max = 191,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Eladorin",
								isFriendly = true,
								id = 2470,
								level = 11,
								hp = 70,
								career = 17,
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
								name = L"Svanson",
								isFriendly = true,
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
	playerKills = 0,
	combatLogIDSMaxRows = L"5",
	groupIconsPetAlpha = 1,
	combatLogTargetDefenseTimeframe = 7.5,
	combatLogTargetDefenseEnabled = false,
	markNewTarget = false,
	unitFramesTooltipMode = "always",
	unitFramesGroupsDirection1 = 3,
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
			color = 
			{
				191,
				255,
				0,
			},
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
			scale = 1,
			font = "font_clear_large_bold",
			name = L"A",
			targetOnClick = true,
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
			permanentTargets = 
			{
			},
			id = 2,
			layer = 3,
			alpha = 1,
			text = L"",
			scale = 1,
			font = "font_clear_large_bold",
			name = L"B",
			targetOnClick = true,
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
			permanentTargets = 
			{
			},
			id = 3,
			layer = 3,
			alpha = 1,
			text = L"G",
			scale = 1,
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
	groupIconsOtherGroupsHPColor = 
	{
		200,
		255,
		255,
	},
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	unitFramesSortingEnabled = true,
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
		text = L"KILL",
		alpha = 1,
		layer = 3,
		color = 
		{
			b = 0,
			g = 0,
			r = 255,
		},
		font = "font_clear_large_bold",
		name = L"",
		targetOnClick = true,
		display = 1,
		offsetY = 50,
		neverExpire = false,
		permanent = false,
	},
	groupIconsPetBGAlpha = 0.5,
	stateMachineThrottle = 0.3,
	unitFramesScale = 1,
	groupIconsPetOffset = 
	{
		0,
		20,
	},
	soundOnNewTargetId = 500,
	guardDistanceIndicator = 2,
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
		orderPoints = 84,
		timeLeft = 53.880964225158,
		pointMax = 500,
	},
	scenarioInfoEnabled = true,
	unitFramesIsVertical = false,
	guardMarkEnabled = true,
	groupIconsAlpha = 0.4,
	combatLogEPSShow = 
	{
		true,
		true,
		true,
		true,
	},
	guardDistanceIndicatorMovable = true,
	combatLogIDSRowScale = 1,
	groupIconsTargetOnClick = true,
	version = 279,
	guardDistanceIndicatorScaleNormal = 1,
	chatThrottleDelay = 10,
	unitFramesEnabled = true,
	playerDeaths = 2,
	scenarioAlerterEnabled = true,
	groupIconsOtherGroupsLayer = 0,
	groupIconsShowOnMarkedPlayers = false,
	guardDistanceIndicatorAlphaWarning = 1,
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
			id = "3393",
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
			id = "3394",
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
			id = "3395",
			data = 
			{
				size = 
				{
					129,
					59,
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
				textureFullResize = true,
				vertical = false,
				alpha = 1,
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
			id = "3396",
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
			id = "3397",
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
			id = "3398",
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
			id = "3399",
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
			id = "3400",
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
			id = "3401",
			data = 
			{
				texture = "4dots",
				offlineHide = true,
				alpha = 1,
				anchorTo = "topleft",
				scale = 1,
				layer = 3,
				anchorFrom = "topleft",
				size = 
				{
					38,
					10,
				},
				deadHide = true,
				vertical = false,
				prefix = L"M ",
				suffix = L"",
				textureFullResize = false,
				distHide = false,
				color = 
				{
					120,
					200,
					255,
				},
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
			id = "3402",
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
			id = "3403",
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
			id = "3404",
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
	unitFramesPadding1 = 6,
	guardDistanceIndicatorColorWarning = 
	{
		255,
		50,
		50,
	},
	guardEnabled = false,
	groupIconsOtherGroupsBGAlpha = 0.5,
	playerKDRDisplayMode = 5,
	killSpamReparseChunkSize = 20,
	groupIconsHideOnSelf = true,
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
	unitFramesCount1 = 6,
	combatLogTargetDefenseTotalEnabled = false,
	combatLogLogParseErrors = true,
	groupIconsShowOtherGroups = true,
	intercomPrivate = true,
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
	combatLogEnabled = true,
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	unitFramesMyGroupFirst = true,
	combatLogTargetDefenseScale = 1,
	unitFramesGroupsDirection2 = 4,
	scenarioInfoPlayers = 
	{
		
		{
			deaths = 0,
			renown = 2099,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 27,
			name = L"Urummuk",
			career = 6,
			db = 10,
			level = 14,
			exp = 20789,
			damage = 35896,
		},
		
		{
			deaths = 3,
			renown = 631,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Aerya",
			career = 11,
			db = 1,
			level = 7,
			exp = 2691,
			damage = 3149,
		},
		
		{
			deaths = 2,
			renown = 645,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Azaburg",
			career = 10,
			db = 0,
			level = 7,
			exp = 2537,
			damage = 6079,
		},
		
		{
			deaths = 4,
			renown = 574,
			healing = 85,
			soloKills = 0,
			realm = 1,
			kills = 2,
			name = L"Khanivorhia",
			career = 19,
			db = 1,
			level = 8,
			exp = 1693,
			damage = 6861,
		},
		
		{
			deaths = 0,
			renown = 2959,
			healing = 8766,
			soloKills = 0,
			realm = 2,
			kills = 24,
			name = L"Faustis",
			career = 23,
			db = 0,
			level = 8,
			exp = 11010,
			damage = 1586,
		},
		
		{
			deaths = 1,
			renown = 2534,
			healing = 2500,
			soloKills = 0,
			realm = 2,
			kills = 23,
			name = L"Grimgorgg",
			career = 5,
			db = 1,
			level = 14,
			exp = 10516,
			damage = 7525,
		},
		
		{
			deaths = 2,
			renown = 761,
			healing = 13477,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Rybert",
			career = 12,
			db = 0,
			level = 10,
			exp = 2871,
			damage = 1770,
		},
		
		{
			deaths = 2,
			renown = 508,
			healing = 133,
			soloKills = 0,
			realm = 1,
			kills = 2,
			name = L"Synnamon",
			career = 9,
			db = 1,
			level = 15,
			exp = 2813,
			damage = 6727,
		},
		
		{
			deaths = 0,
			renown = 1635,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 23,
			name = L"Maimoudorixtis",
			career = 8,
			db = 3,
			level = 14,
			exp = 17171,
			damage = 4576,
		},
		
		{
			deaths = 1,
			renown = 2530,
			healing = 2553,
			soloKills = 0,
			realm = 2,
			kills = 21,
			name = L"Kevonn",
			career = 23,
			db = 0,
			level = 7,
			exp = 9881,
			damage = 2787,
		},
		
		{
			deaths = 3,
			renown = 741,
			healing = 342,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Braendgeat",
			career = 17,
			db = 0,
			level = 9,
			exp = 2878,
			damage = 4358,
		},
		
		{
			deaths = 1,
			renown = 517,
			healing = 605,
			soloKills = 0,
			realm = 1,
			kills = 2,
			name = L"Iymyrr",
			career = 10,
			db = 0,
			level = 9,
			exp = 1593,
			damage = 6227,
		},
		
		{
			deaths = 3,
			renown = 619,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 2,
			name = L"Teutbert",
			career = 9,
			db = 0,
			level = 14,
			exp = 2595,
			damage = 4724,
		},
		
		{
			deaths = 1,
			renown = 1848,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 24,
			name = L"Thorngarden",
			career = 16,
			db = 1,
			level = 12,
			exp = 19387,
			damage = 9967,
		},
		
		{
			deaths = 0,
			renown = 2436,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 27,
			name = L"Gedoran",
			career = 6,
			db = 6,
			level = 8,
			exp = 21228,
			damage = 14007,
		},
		
		{
			deaths = 0,
			renown = 2839,
			healing = 2026,
			soloKills = 0,
			realm = 2,
			kills = 29,
			name = L"Zoarian",
			career = 15,
			db = 5,
			level = 14,
			exp = 12805,
			damage = 12801,
		},
		
		{
			deaths = 2,
			renown = 690,
			healing = 5775,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Arutoria",
			career = 17,
			db = 0,
			level = 9,
			exp = 2235,
			damage = 6016,
		},
		
		{
			deaths = 3,
			renown = 588,
			healing = 5720,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Alderya",
			career = 3,
			db = 0,
			level = 7,
			exp = 3035,
			damage = 0,
		},
		
		{
			deaths = 0,
			renown = 1791,
			healing = 72,
			soloKills = 0,
			realm = 2,
			kills = 27,
			name = L"Zahr",
			career = 21,
			db = 1,
			level = 14,
			exp = 21209,
			damage = 3242,
		},
		
		{
			deaths = 1,
			renown = 2690,
			healing = 6200,
			soloKills = 0,
			realm = 2,
			kills = 26,
			name = L"Zugergorc",
			career = 5,
			db = 2,
			level = 12,
			exp = 11886,
			damage = 13915,
		},
		
		{
			deaths = 0,
			renown = 3011,
			healing = 33411,
			soloKills = 0,
			realm = 2,
			kills = 28,
			name = L"Schetthealz",
			career = 15,
			db = 0,
			level = 9,
			exp = 11777,
			damage = 2080,
		},
		
		{
			deaths = 2,
			renown = 663,
			healing = 5316,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Doshehowyou",
			career = 17,
			db = 0,
			level = 8,
			exp = 2403,
			damage = 8499,
		},
		
		{
			deaths = 3,
			renown = 507,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 3,
			name = L"Anoldman",
			career = 9,
			db = 1,
			level = 5,
			exp = 2913,
			damage = 5923,
		},
	},
}




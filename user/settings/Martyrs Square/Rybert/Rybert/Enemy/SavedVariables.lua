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
	groupIconsOtherGroupsAlpha = 0.3,
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
			id = "78060",
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
			id = "78061",
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
			id = "78062",
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
			id = "78063",
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
			id = "78064",
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
			id = "78065",
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
			id = "78066",
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
			id = "78067",
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
			id = "78068",
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
			id = "78069",
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
			id = "78070",
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
			id = "78071",
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
			id = "78072",
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
			id = "78073",
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
			id = "78074",
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
			id = "78075",
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
			id = "78076",
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
	unitFramesDirection2 = 3,
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
		text = L"G",
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
	unitFramesGroupsCount1 = 1,
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
					total = -234,
					objectTime = 64937103500,
					data = 
					{
						
						{
							str = L"Tainted Horror's ability hits you for 31 damage. (15 mitigated) (38 absorbed)",
							type = 1,
							ability = L"ability",
							currentTarget = true,
							time = 64937103506,
							abs = 38,
							value = 31,
							mit = 15,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Tainted Horror's ability hits you for 0 damage. (14 mitigated) (70 absorbed)",
							type = 1,
							ability = L"ability",
							currentTarget = true,
							time = 64937103508,
							abs = 70,
							value = 0,
							mit = 14,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Tainted Horror's ability hits you for 31 damage. (15 mitigated) (38 absorbed)",
							type = 1,
							ability = L"ability",
							currentTarget = true,
							time = 64937103510,
							abs = 38,
							value = 31,
							mit = 15,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Tainted Horror's ability hits you for 0 damage. (14 mitigated) (70 absorbed)",
							type = 1,
							ability = L"ability",
							currentTarget = true,
							time = 64937103513,
							abs = 70,
							value = 0,
							mit = 14,
							crit = false,
							object = L"Tainted Horror",
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						[1] = 
						{
							str = L"Tainted Horror's attack hits you for 67 damage. (17 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							time = 64937103500,
							abs = 0,
							value = 67,
							mit = 17,
							crit = false,
							object = L"Tainted Horror",
						},
					},
					valueAoe = 0,
					valueMax = 10,
					value = -33,
					object = L"Tainted Horror",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your attack critically hits Tainted Horror for 41 damage. (38 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103448,
							object = L"Tainted Horror",
							value = 41,
							crit = true,
							mit = 38,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 34 damage. (22 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103448,
							object = L"Tainted Horror",
							value = 34,
							crit = false,
							mit = 22,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your Sigmar's Fist hits Tainted Horror for 47 damage. (38 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103448,
							object = L"Tainted Horror",
							value = 47,
							crit = false,
							mit = 38,
							ability = L"Sigmar's Fist",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103448,
							object = L"Tainted Horror",
							value = 7,
							crit = false,
							mit = 6,
							ability = L"Castigation",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103450,
							object = L"Tainted Horror",
							value = 29,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Strike hits Tainted Horror for 43 damage. (31 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103450,
							object = L"Tainted Horror",
							value = 43,
							crit = false,
							mit = 31,
							ability = L"Divine Strike",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103451,
							object = L"Tainted Horror",
							value = 7,
							crit = false,
							mit = 6,
							ability = L"Castigation",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 56 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103452,
							object = L"Tainted Horror",
							value = 56,
							crit = false,
							mit = 40,
							ability = L"Bludgeon",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103452,
							object = L"Tainted Horror",
							value = 29,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Bludgeon critically hits Tainted Horror for 80 damage. (58 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103453,
							object = L"Tainted Horror",
							value = 80,
							crit = true,
							mit = 58,
							ability = L"Bludgeon",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103453,
							object = L"Tainted Horror",
							value = 7,
							crit = false,
							mit = 6,
							ability = L"Castigation",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103455,
							object = L"Tainted Horror",
							value = 29,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 56 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937103455,
							object = L"Tainted Horror",
							value = 56,
							crit = false,
							mit = 40,
							ability = L"Bludgeon",
						},
					},
					total = 395,
					objectTime = 64937103499,
					data = 
					{
						
						{
							str = L"Your attack hits Tainted Horror for 32 damage. (25 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937103508,
							abs = 0,
							value = 32,
							mit = 25,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103508,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103509,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							time = 64937103509,
							abs = 0,
							value = 7,
							mit = 5,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103510,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103511,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 32 damage. (25 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937103511,
							abs = 0,
							value = 32,
							mit = 25,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 61 damage. (35 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							time = 64937103512,
							abs = 0,
							value = 61,
							mit = 35,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 37 damage. (18 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							time = 64937103513,
							abs = 0,
							value = 37,
							mit = 18,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 32 damage. (25 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937103514,
							abs = 0,
							value = 32,
							mit = 25,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Strike hits Tainted Horror for 46 damage. (28 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937103515,
							abs = 0,
							value = 46,
							mit = 28,
							crit = false,
							object = L"Tainted Horror",
						},
					},
					totalAoe = 395,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Strike hits Tainted Horror for 40 damage. (27 mitigated)",
							type = 2,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937103505,
							abs = 0,
							value = 40,
							mit = 27,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 28 damage. (24 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937103505,
							abs = 0,
							value = 28,
							mit = 24,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Sigmar's Fist hits Tainted Horror for 46 damage. (32 mitigated)",
							type = 2,
							ability = L"Sigmar's Fist",
							currentTarget = true,
							time = 64937103506,
							abs = 0,
							value = 46,
							mit = 32,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							time = 64937103507,
							abs = 0,
							value = 7,
							mit = 5,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 32 damage. (25 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937103508,
							abs = 0,
							value = 32,
							mit = 25,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103508,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103509,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (5 mitigated)",
							type = 2,
							ability = L"Castigation",
							currentTarget = true,
							time = 64937103509,
							abs = 0,
							value = 7,
							mit = 5,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103510,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 37 damage. (19 mitigated)",
							type = 2,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937103511,
							abs = 0,
							value = 37,
							mit = 19,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 32 damage. (25 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							time = 64937103511,
							abs = 0,
							value = 32,
							mit = 25,
							crit = false,
							object = L"Tainted Horror",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 61 damage. (35 mitigated)",
							type = 2,
							ability = L"Bludgeon",
							currentTarget = true,
							time = 64937103512,
							abs = 0,
							value = 61,
							mit = 35,
							crit = false,
							object = L"Tainted Horror",
						},
					},
					valueAoe = 56,
					valueMax = 57,
					value = 56,
					valueAoeMax = 66,
					object = L"Tainted Horror",
				},
				
				{
					total = 820,
					objectTime = 64937103429,
					data = 
					{
						
						{
							str = L"Your Prayer of Devotion heals you for 0 points. (86 overhealed)",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103508,
							crit = false,
							overheal = 86,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (129 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103508,
							crit = false,
							overheal = 129,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (129 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103509,
							crit = false,
							overheal = 129,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (129 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103510,
							crit = false,
							overheal = 129,
						},
						
						{
							str = L"Your Divine Assault heals you for 31 points. (98 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 31,
							time = 64937103511,
							crit = false,
							overheal = 98,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 0 points. (86 overhealed)",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103513,
							crit = false,
							overheal = 86,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 0 points. (86 overhealed)",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103515,
							crit = false,
							overheal = 86,
						},
						
						{
							str = L"Your Divine Strike heals you for 0 points. (46 overhealed)",
							type = 3,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"Rybert",
							value = 0,
							time = 64937103515,
							crit = false,
							overheal = 46,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Aid heals you for 112 points.",
							type = 3,
							ability = L"Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 112,
							time = 64937103488,
							crit = false,
							overheal = 0,
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
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 3,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 27,
							time = 64937103489,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Mend heals you for 205 points.",
							type = 3,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"Rybert",
							value = 205,
							time = 64937103490,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 3,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 27,
							time = 64937103490,
							crit = false,
							overheal = 0,
						},
						
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
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 3,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"Rybert",
							value = 27,
							time = 64937103492,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Assault heals you for 105 points.",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"Rybert",
							value = 105,
							time = 64937103492,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals you for 105 points.",
							type = 3,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"Rybert",
							value = 105,
							time = 64937103492,
							crit = false,
							overheal = 0,
						},
						
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
					},
					valueAoe = 0,
					valueMax = 186,
					value = 117,
					object = L"Rybert",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Aid heals you for 112 points.",
							type = 4,
							ability = L"Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 112,
							time = 64937103488,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals you for 105 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"you",
							value = 105,
							time = 64937103489,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							time = 64937103489,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Mend heals you for 205 points.",
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"you",
							value = 205,
							time = 64937103490,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							time = 64937103490,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 86 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 86,
							time = 64937103491,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							time = 64937103492,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Assault heals you for 105 points.",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 105,
							time = 64937103492,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Healing Hand heals you for 105 points.",
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"you",
							value = 105,
							time = 64937103492,
							crit = false,
							overheal = 0,
						},
						
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
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 143,
							time = 64937103494,
							crit = false,
							overheal = 0,
						},
					},
					total = 820,
					objectTime = 64937103429,
					data = 
					{
						
						{
							overheal = 86,
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Prayer of Devotion heals you for 0 points. (86 overhealed)",
							crit = false,
							time = 64937103508,
						},
						
						{
							overheal = 129,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Divine Assault heals you for 0 points. (129 overhealed)",
							crit = false,
							time = 64937103508,
						},
						
						{
							overheal = 129,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Divine Assault heals you for 0 points. (129 overhealed)",
							crit = false,
							time = 64937103509,
						},
						
						{
							overheal = 129,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Divine Assault heals you for 0 points. (129 overhealed)",
							crit = false,
							time = 64937103510,
						},
						
						{
							overheal = 98,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 31,
							str = L"Your Divine Assault heals you for 31 points. (98 overhealed)",
							crit = false,
							time = 64937103511,
						},
						
						{
							overheal = 86,
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Prayer of Devotion heals you for 0 points. (86 overhealed)",
							crit = false,
							time = 64937103513,
						},
						
						{
							overheal = 86,
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Prayer of Devotion heals you for 0 points. (86 overhealed)",
							crit = false,
							time = 64937103515,
						},
						
						{
							overheal = 46,
							type = 4,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Divine Strike heals you for 0 points. (46 overhealed)",
							crit = false,
							time = 64937103515,
						},
					},
					totalAoe = 820,
					valueMaxData = 
					{
						
						{
							overheal = 0,
							type = 4,
							ability = L"Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 112,
							str = L"Your Divine Aid heals you for 112 points.",
							crit = false,
							time = 64937103488,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"you",
							value = 105,
							str = L"Your Healing Hand heals you for 105 points.",
							crit = false,
							time = 64937103489,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							crit = false,
							time = 64937103489,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Divine Mend",
							currentTarget = true,
							object = L"you",
							value = 205,
							str = L"Your Divine Mend heals you for 205 points.",
							crit = false,
							time = 64937103490,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							crit = false,
							time = 64937103490,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 86,
							str = L"Your Prayer of Devotion heals you for 86 points.",
							crit = false,
							time = 64937103491,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							crit = false,
							time = 64937103492,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 105,
							str = L"Your Divine Assault heals you for 105 points.",
							crit = false,
							time = 64937103492,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Healing Hand",
							currentTarget = true,
							object = L"you",
							value = 105,
							str = L"Your Healing Hand heals you for 105 points.",
							crit = false,
							time = 64937103492,
						},
						
						{
							overheal = 13,
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							str = L"Your Lingering Divine Aid critically heals you for 27 points. (13 overhealed)",
							crit = true,
							time = 64937103492,
						},
						
						{
							overheal = 105,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							str = L"Your Divine Assault heals you for 0 points. (105 overhealed)",
							crit = false,
							time = 64937103493,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Divine Aid",
							currentTarget = true,
							object = L"you",
							value = 27,
							str = L"Your Lingering Divine Aid heals you for 27 points.",
							crit = false,
							time = 64937103494,
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 143,
							str = L"Your Divine Assault heals you for 143 points.",
							crit = false,
							time = 64937103494,
						},
					},
					valueAoe = 117,
					valueMax = 186,
					value = 117,
					valueAoeMax = 186,
					object = L"you",
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
							total = 4133,
							max = 2016,
							min = 0,
							count = 69,
							abs = 4159,
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
							mit = 1035,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 431,
								level = 6,
								hp = 87,
								name = L"Tainted Horror",
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
							count = 5,
							abs = 390,
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
							mit = 104,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 385,
								level = 6,
								hp = 100,
								name = L"Tainted Horror",
							},
						},
						parry = 0,
					},
					[L"Rabid Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1071,
							max = 79,
							min = 0,
							count = 19,
							abs = 278,
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
							mit = 443,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 217,
								level = 5,
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
							total = 294,
							max = 116,
							min = 79,
							count = 3,
							abs = 26,
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
							mit = 106,
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
							total = 805,
							max = 81,
							min = 0,
							count = 16,
							abs = 354,
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
							mit = 369,
							minObject = 
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
							count = 1,
							abs = 84,
							maxObject = 
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
							mit = 31,
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
							total = 15550,
							count = 208,
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
							mit = 3681,
							max = 183,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 3414,
							max = 277,
							min = 12,
							count = 28,
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
							mit = 739,
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
							total = 7704,
							max = 47,
							min = 9,
							count = 256,
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
							mit = 6372,
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
							total = 987,
							max = 67,
							min = 13,
							count = 24,
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
							mit = 966,
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
							total = 4536,
							max = 38,
							min = 30,
							count = 131,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 217,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 2732,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 391,
								level = 6,
								hp = 100,
								name = L"Tainted Flamer",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 1071,
							max = 56,
							min = 41,
							count = 22,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 4350,
								level = 5,
								hp = 100,
								career = 0,
							},
							mit = 659,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 391,
								level = 6,
								hp = 100,
								name = L"Tainted Flamer",
							},
						},
						parry = 0,
					},
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2358,
							max = 76,
							min = 35,
							count = 52,
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
							mit = 1518,
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
							total = 519,
							max = 90,
							min = 0,
							count = 9,
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
							mit = 403,
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
							total = 6002,
							max = 110,
							min = 27,
							count = 104,
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
							mit = 3810,
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
							total = 830,
							max = 92,
							min = 77,
							count = 10,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 4350,
								level = 5,
								hp = 100,
								career = 0,
							},
							mit = 494,
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
							total = 2605,
							max = 38,
							min = 2,
							count = 191,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 217,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
							mit = 1845,
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
							total = 358,
							max = 58,
							min = 5,
							count = 16,
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
							mit = 224,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 391,
								level = 6,
								hp = 100,
								name = L"Tainted Flamer",
							},
						},
						parry = 0,
					},
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1876,
							max = 54,
							min = 37,
							count = 41,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								isFriendly = false,
								id = 4129,
								level = 5,
								hp = 100,
								career = 0,
							},
							mit = 1279,
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
							total = 135,
							max = 73,
							min = 62,
							count = 2,
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
							mit = 66,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 385,
								level = 6,
								hp = 100,
								name = L"Tainted Horror",
							},
						},
						parry = 0,
					},
					[L"Judgement"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 630,
							max = 51,
							min = 21,
							count = 24,
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
							mit = 557,
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
							total = 150,
							max = 41,
							min = 33,
							count = 4,
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
							mit = 121,
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
							overheal = 920,
							total = 628,
							abs = 0,
							min = 23,
							count = 64,
							max = 27,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 8,
								hp = 83,
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
							overheal = 114,
							total = 27,
							abs = 0,
							min = 33,
							count = 4,
							max = 40,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 8,
								hp = 100,
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
							total = 542,
							abs = 0,
							min = 95,
							count = 13,
							max = 112,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 8,
								hp = 53,
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
							total = 0,
							abs = 0,
							min = 140,
							count = 1,
							max = 140,
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
							overheal = 10121,
							total = 9471,
							max = 196,
							min = 105,
							count = 153,
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
								career = 12,
								isFriendly = true,
								id = 114,
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
							overheal = 6898,
							total = 4139,
							max = 186,
							min = 82,
							count = 109,
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
							overheal = 1219,
							total = 434,
							max = 160,
							min = 115,
							count = 12,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
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
							overheal = 633,
							total = 1898,
							max = 65,
							min = 37,
							count = 55,
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
							total = 205,
							max = 205,
							min = 199,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 8,
								hp = 81,
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
					[L"Rybert - Prayer of Devotion"] = 
					{
						normal = 
						{
							overheal = 3489,
							total = 5745,
							max = 160,
							min = 73,
							count = 106,
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
							overheal = 3489,
							total = 5745,
							max = 160,
							min = 73,
							count = 106,
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
							total = 3402,
							count = 146,
							overheal = 1616,
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
							overheal = 114,
							total = 508,
							abs = 0,
							min = 33,
							count = 12,
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
							total = 404,
							max = 205,
							min = 199,
							count = 4,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 8,
								hp = 81,
								name = L"Rybert",
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
							overheal = 10121,
							total = 9471,
							max = 196,
							min = 105,
							count = 153,
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
								career = 12,
								isFriendly = true,
								id = 114,
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
							overheal = 11043,
							total = 11806,
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
							total = 1886,
							count = 24,
							overheal = 2381,
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
							overheal = 939,
							total = 2760,
							abs = 0,
							min = 35,
							count = 75,
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
							total = 3127,
							abs = 0,
							min = 95,
							count = 29,
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
							total = 524,
							abs = 0,
							min = 140,
							count = 3,
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
	unitFramesGroupsPadding2 = 0,
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
	playerKills = 1,
	combatLogIDSMaxRows = L"5",
	groupIconsPetAlpha = 1,
	combatLogTargetDefenseTimeframe = 7.5,
	combatLogTargetDefenseEnabled = false,
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
		destructionPoints = 10,
		id = 2006,
		queuedWithGroup = false,
		activeQueue = 0,
		pointMax = 500,
		mode = 2,
		timeLeft = 86.365067107603,
		orderPoints = 500,
	},
	scenarioInfoEnabled = true,
	unitFramesIsVertical = false,
	guardMarkEnabled = true,
	groupIconsAlpha = 0.5,
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
	playerDeaths = 4,
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
			id = "78048",
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
			id = "78049",
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
			id = "78050",
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
			id = "78051",
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
			id = "78052",
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
			id = "78053",
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
			isEnabled = false,
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
			id = "78054",
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
					15,
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
			id = "78055",
			data = 
			{
				offlineHide = false,
				anchorTo = "topleft",
				scale = 1,
				layer = 2,
				alpha = 1,
				texture = "star",
				vertical = false,
				size = 
				{
					16,
					16,
				},
				deadHide = false,
				color = 
				{
					150,
					190,
					255,
				},
				distHide = false,
				anchorFrom = "topleft",
				pos = 
				{
					20,
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
			id = "78056",
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
			id = "78057",
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
			id = "78058",
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
			id = "78059",
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
	unitFramesPadding1 = 2,
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
			deaths = 1,
			renown = 40,
			healing = 3829,
			soloKills = 0,
			damage = 415,
			kills = 1,
			name = L"Sybannak",
			exp = 228,
			db = 0,
			level = 15,
			career = 15,
			realm = 2,
		},
		
		{
			deaths = 0,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			damage = 1880,
			kills = 5,
			name = L"Vendial",
			exp = 15247,
			db = 0,
			level = 13,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 1629,
			healing = 1724,
			soloKills = 0,
			damage = 9098,
			kills = 18,
			name = L"Eladorin",
			exp = 16878,
			db = 1,
			level = 11,
			career = 17,
			realm = 1,
		},
		
		{
			deaths = 1,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			damage = 2912,
			kills = 9,
			name = L"Stenna",
			exp = 28825,
			db = 1,
			level = 11,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 2088,
			healing = 16022,
			soloKills = 0,
			damage = 1203,
			kills = 17,
			name = L"Rybert",
			exp = 14744,
			db = 0,
			level = 7,
			career = 12,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 70124,
			kills = 1,
			name = L"Terrorbit",
			exp = 614,
			db = 0,
			level = 13,
			career = 8,
			realm = 2,
		},
		
		{
			deaths = 0,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			damage = 2494,
			kills = 6,
			name = L"Helmtrudd",
			exp = 15247,
			db = 0,
			level = 15,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			damage = 15100,
			kills = 13,
			name = L"Andofili",
			exp = 16036,
			db = 7,
			level = 14,
			career = 19,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 3420,
			kills = 0,
			name = L"Anehtas",
			exp = 228,
			db = 0,
			level = 12,
			career = 24,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 36442,
			kills = 0,
			name = L"Kwiskass",
			exp = 209,
			db = 0,
			level = 8,
			career = 8,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 1529,
			healing = 160,
			soloKills = 0,
			damage = 4005,
			kills = 14,
			name = L"Oscrue",
			exp = 15247,
			db = 3,
			level = 13,
			career = 11,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 1153,
			kills = 1,
			name = L"Dalsgard",
			exp = 228,
			db = 0,
			level = 14,
			career = 13,
			realm = 2,
		},
		
		{
			deaths = 0,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 1290,
			kills = 0,
			name = L"Cpkabana",
			exp = 228,
			db = 0,
			level = 13,
			career = 24,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 2563,
			healing = 0,
			soloKills = 0,
			damage = 2766,
			kills = 7,
			name = L"Keronus",
			exp = 16317,
			db = 1,
			level = 10,
			career = 11,
			realm = 1,
		},
		
		{
			deaths = 1,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			damage = 3487,
			kills = 10,
			name = L"Adelhide",
			exp = 16158,
			db = 1,
			level = 6,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 2823,
			kills = 1,
			name = L"Rhetr",
			exp = 614,
			db = 0,
			level = 10,
			career = 13,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 1275,
			kills = 3,
			name = L"Klaudiana",
			exp = 1353,
			db = 2,
			level = 3,
			career = 21,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 40,
			healing = 875,
			soloKills = 0,
			damage = 636,
			kills = 1,
			name = L"Costusss",
			exp = 195,
			db = 0,
			level = 3,
			career = 23,
			realm = 2,
		},
		
		{
			deaths = 0,
			renown = 3372,
			healing = 7986,
			soloKills = 0,
			damage = 3981,
			kills = 16,
			name = L"Drakonval",
			exp = 17623,
			db = 0,
			level = 4,
			career = 12,
			realm = 1,
		},
		
		{
			deaths = 2,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 3453,
			kills = 3,
			name = L"Shikimara",
			exp = 1167,
			db = 1,
			level = 4,
			career = 22,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 40,
			healing = 0,
			soloKills = 0,
			damage = 2084,
			kills = 3,
			name = L"Ptkaos",
			exp = 781,
			db = 0,
			level = 3,
			career = 13,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 1840,
			healing = 0,
			soloKills = 0,
			damage = 4056,
			kills = 10,
			name = L"Svanson",
			exp = 19860,
			db = 1,
			level = 3,
			career = 18,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 3062,
			healing = 710,
			soloKills = 0,
			damage = 8512,
			kills = 18,
			name = L"Eorend",
			exp = 18155,
			db = 4,
			level = 2,
			career = 18,
			realm = 1,
		},
		
		{
			deaths = 1,
			renown = 0,
			healing = 0,
			soloKills = 0,
			damage = 911,
			kills = 0,
			name = L"Ghaelaso",
			exp = 0,
			db = 0,
			level = 1,
			career = 24,
			realm = 2,
		},
	},
}




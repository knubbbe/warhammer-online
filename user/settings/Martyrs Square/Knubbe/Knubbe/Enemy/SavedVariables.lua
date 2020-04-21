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
	unitFramesDirection1 = 2,
	groupIconsPetScale = 1,
	unitFramesMyGroupOnly = true,
	soundOnNewTarget = false,
	guardDistanceIndicatorAlphaNormal = 0.35,
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
			scale = 1,
			anchorFrom = 8,
			exceptMe = true,
			offsetX = 10,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "7900",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					type = "guard",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyGuard",
					hasDurationLimit = false,
					durationType = 3,
				},
			},
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
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"NotMyGuard",
					hasDurationLimit = false,
					durationType = 3,
				},
			},
			scale = 0.8,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 8,
			icon = "guard",
			canDispell = 1,
			isCircleIcon = false,
			id = "7901",
			alpha = 1,
			archetypeMatch = 2,
			name = L"Other guard",
			isEnabled = true,
			playerType = 3,
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
			anchorTo = 9,
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -25,
			icon = "dot",
			canDispell = 2,
			isCircleIcon = false,
			id = "7902",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 2,
					castedByMe = 1,
					typeMatch = 1,
					nameMatch = 1,
					filterName = L"Any",
					hasDurationLimit = false,
					descriptionMatch = 2,
				},
			},
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
			anchorTo = 9,
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -14,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "7903",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					type = "isHealing",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					durationType = 2,
				},
			},
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
			effectFilters = 
			{
				
				{
					typeMatch = 1,
					type = "isBuff",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyBuff",
					hasDurationLimit = false,
					durationType = 2,
				},
				
				{
					typeMatch = 1,
					type = "isHealing",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
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
			id = "7904",
			alpha = 1,
			logic = L"MyBuff and not MyHealing",
			isEnabled = true,
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
			},
			name = L"Buff",
			anchorTo = 9,
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
					nameMatch = 1,
					hasDurationLimit = true,
				},
				
				{
					typeMatch = 1,
					type = "isHealing",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
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
			id = "7905",
			alpha = 1,
			logic = L"MyBlessing and not MyHealing",
			isEnabled = true,
			color = 
			{
				r = 50,
				g = 200,
				b = 255,
			},
			name = L"Blessing",
			anchorTo = 9,
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
			anchorTo = 8,
			scale = 0.6,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -53,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "7906",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					type = "healDebuffOut50",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"OutHealDebuff",
					hasDurationLimit = false,
					durationType = 1,
				},
			},
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
			anchorTo = 8,
			scale = 0.6,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -40,
			icon = "heal",
			canDispell = 1,
			isCircleIcon = false,
			id = "7907",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					type = "healDebuffIn50",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"InHealDebuff",
					hasDurationLimit = false,
					durationType = 1,
				},
			},
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
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 1,
					filterName = L"Stagger",
					hasDurationLimit = false,
					durationType = 2,
				},
			},
			scale = 0.75,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = 5,
			icon = "stagger",
			canDispell = 1,
			isCircleIcon = false,
			id = "7908",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Stagger",
			isEnabled = true,
			playerType = 1,
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
			anchorTo = 8,
			scale = 0.5,
			anchorFrom = 8,
			exceptMe = false,
			offsetX = -65,
			icon = "disabled",
			canDispell = 1,
			isCircleIcon = false,
			id = "7909",
			alpha = 1,
			archetypeMatch = 1,
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
			id = "7910",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Immaculate Defense",
			isEnabled = true,
			playerType = 3,
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
						[695] = true,
						[674] = true,
						[653] = true,
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
			id = "7911",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Focused Mind",
			isEnabled = true,
			playerType = 3,
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
			id = "7912",
			alpha = 1,
			archetypeMatch = 1,
			name = L"1001 Dark Blessings",
			isEnabled = true,
			playerType = 3,
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
			id = "7913",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Gift of Life",
			isEnabled = true,
			playerType = 3,
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
						[3747] = true,
						[8620] = true,
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
			id = "7914",
			alpha = 1,
			archetypeMatch = 1,
			name = L"My marks/runes",
			isEnabled = true,
			playerType = 3,
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
			id = "7915",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Word of Pain",
			isEnabled = true,
			playerType = 3,
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
			id = "7916",
			alpha = 1,
			archetypeMatch = 1,
			name = L"Improved Boiling Blood",
			isEnabled = true,
			playerType = 3,
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
		color = 
		{
			65,
			150,
			255,
		},
		unique = true,
		firstLetters = 4,
		showCareerIcon = true,
		canClearOnClick = false,
		permanentTargets = 
		{
		},
		id = 5902,
		text = L"G",
		alpha = 0.5,
		layer = 3,
		scale = 0.6,
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
			eps = 
			{
				
				{
					total = 345,
					objectTime = 64936537860,
					data = 
					{
						
						{
							str = L"Purple Crawler's attack hits you for 36 damage. (72 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 36,
							mit = 72,
							crit = false,
							time = 64936537889,
						},
						
						{
							str = L"Purple Crawler's Envenomed Fangs hits you for 8 damage. (20 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Envenomed Fangs",
							value = 8,
							mit = 20,
							crit = false,
							time = 64936537890,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 47 damage. (73 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 47,
							mit = 73,
							crit = false,
							time = 64936537890,
						},
						
						{
							str = L"Purple Crawler's Spider Bite critically hits you for 68 damage. (131 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Spider Bite",
							value = 68,
							mit = 131,
							crit = true,
							time = 64936537890,
						},
						
						{
							str = L"Purple Crawler's Spider Bite hits you for 31 damage. (91 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Spider Bite",
							value = 31,
							mit = 91,
							crit = false,
							time = 64936537890,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 32 damage. (75 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 32,
							mit = 75,
							crit = false,
							time = 64936537891,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 43 damage. (76 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 43,
							mit = 76,
							crit = false,
							time = 64936537892,
						},
						
						{
							str = L"Purple Crawler's Envenomed Fangs hits you for 37 damage. (89 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Envenomed Fangs",
							value = 37,
							mit = 89,
							crit = false,
							time = 64936537893,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 43 damage. (76 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 43,
							mit = 76,
							crit = false,
							time = 64936537895,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Purple Crawler's attack hits you for 43 damage. (76 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 43,
							mit = 76,
							crit = false,
							time = 64936537878,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 32 damage. (75 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 32,
							mit = 75,
							crit = false,
							time = 64936537878,
						},
						
						{
							str = L"Purple Crawler's Envenomed Fangs hits you for 9 damage. (22 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Envenomed Fangs",
							value = 9,
							mit = 22,
							crit = false,
							time = 64936537878,
						},
						
						{
							str = L"Purple Crawler's Envenomed Fangs hits you for 28 damage. (86 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Envenomed Fangs",
							value = 28,
							mit = 86,
							crit = false,
							time = 64936537879,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 43 damage. (76 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 43,
							mit = 76,
							crit = false,
							time = 64936537880,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 32 damage. (75 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 32,
							mit = 75,
							crit = false,
							time = 64936537880,
						},
						
						{
							str = L"Purple Crawler's Spider Bite hits you for 42 damage. (93 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Spider Bite",
							value = 42,
							mit = 93,
							crit = false,
							time = 64936537880,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 43 damage. (76 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 43,
							mit = 76,
							crit = false,
							time = 64936537880,
						},
						
						{
							str = L"Purple Crawler's Envenomed Fangs hits you for 9 damage. (22 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Envenomed Fangs",
							value = 9,
							mit = 22,
							crit = false,
							time = 64936537881,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 32 damage. (75 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 32,
							mit = 75,
							crit = false,
							time = 64936537882,
						},
						
						{
							str = L"Purple Crawler's Envenomed Fangs hits you for 7 damage. (21 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Envenomed Fangs",
							value = 7,
							mit = 21,
							crit = false,
							time = 64936537882,
						},
						
						{
							str = L"Purple Crawler's Spider Bite hits you for 31 damage. (91 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Spider Bite",
							value = 31,
							mit = 91,
							crit = false,
							time = 64936537882,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 43 damage. (76 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 43,
							mit = 76,
							crit = false,
							time = 64936537883,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 32 damage. (75 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 32,
							mit = 75,
							crit = false,
							time = 64936537884,
						},
						
						{
							str = L"Purple Crawler's Envenomed Fangs hits you for 7 damage. (21 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Envenomed Fangs",
							value = 7,
							mit = 21,
							crit = false,
							time = 64936537884,
						},
						
						{
							str = L"Purple Crawler's attack hits you for 61 damage. (58 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 61,
							mit = 58,
							crit = false,
							time = 64936537885,
						},
					},
					valueAoe = 0,
					valueMax = 77,
					value = 58,
					object = L"Purple Crawler",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 64 damage. (42 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537884,
							value = 64,
							crit = false,
							mit = 42,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Purple Crawler for 53 damage. (50 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537885,
							value = 53,
							crit = false,
							mit = 50,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537886,
							value = 30,
							crit = false,
							mit = 32,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 64 damage. (42 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537886,
							value = 64,
							crit = false,
							mit = 42,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537887,
							value = 30,
							crit = false,
							mit = 32,
							abs = 0,
						},
						
						{
							str = L"Your Shield Sweep hits Purple Crawler for 65 damage. (34 mitigated)",
							type = 2,
							ability = L"Shield Sweep",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537887,
							value = 65,
							crit = false,
							mit = 34,
							abs = 0,
						},
						
						{
							str = L"Your Shield Sweep hits Purple Crawler for 63 damage. (36 mitigated)",
							type = 2,
							ability = L"Shield Sweep",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537887,
							value = 63,
							crit = false,
							mit = 36,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537888,
							value = 30,
							crit = false,
							mit = 32,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Purple Crawler for 56 damage. (47 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537889,
							value = 56,
							crit = false,
							mit = 47,
							abs = 0,
						},
						
						{
							str = L"Your Guarded Attack hits Purple Crawler for 55 damage. (37 mitigated)",
							type = 2,
							ability = L"Guarded Attack",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537889,
							value = 55,
							crit = false,
							mit = 37,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Purple Crawler",
							time = 64936537889,
							value = 30,
							crit = false,
							mit = 32,
							abs = 0,
						},
					},
					total = 492,
					objectTime = 64936537864,
					data = 
					{
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 30,
							mit = 32,
							crit = false,
							time = 64936537888,
						},
						
						{
							str = L"Your attack hits Purple Crawler for 56 damage. (47 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 56,
							mit = 47,
							crit = false,
							time = 64936537889,
						},
						
						{
							str = L"Your Guarded Attack hits Purple Crawler for 55 damage. (37 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Guarded Attack",
							value = 55,
							mit = 37,
							crit = false,
							time = 64936537889,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 30,
							mit = 32,
							crit = false,
							time = 64936537889,
						},
						
						{
							str = L"Your Vengeful Strike hits Purple Crawler for 55 damage. (37 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Vengeful Strike",
							value = 55,
							mit = 37,
							crit = false,
							time = 64936537890,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 66 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 66,
							mit = 40,
							crit = false,
							time = 64936537892,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 31 damage. (31 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 31,
							mit = 31,
							crit = false,
							time = 64936537893,
						},
						
						{
							str = L"Your attack hits Purple Crawler for 56 damage. (47 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 56,
							mit = 47,
							crit = false,
							time = 64936537893,
						},
						
						{
							str = L"Your Heavy Blow critically hits Purple Crawler for 90 damage. (58 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 90,
							mit = 58,
							crit = true,
							time = 64936537894,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 23 damage. (29 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 23,
							mit = 29,
							crit = false,
							time = 64936537895,
						},
					},
					totalAoe = 492,
					valueMaxData = 
					{
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 64 damage. (42 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 64,
							mit = 42,
							crit = false,
							time = 64936537884,
						},
						
						{
							str = L"Your attack hits Purple Crawler for 53 damage. (50 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 53,
							mit = 50,
							crit = false,
							time = 64936537885,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 30,
							mit = 32,
							crit = false,
							time = 64936537886,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 64 damage. (42 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 64,
							mit = 42,
							crit = false,
							time = 64936537886,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 30,
							mit = 32,
							crit = false,
							time = 64936537887,
						},
						
						{
							str = L"Your Shield Sweep hits Purple Crawler for 65 damage. (34 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Shield Sweep",
							value = 65,
							mit = 34,
							crit = false,
							time = 64936537887,
						},
						
						{
							str = L"Your Shield Sweep hits Purple Crawler for 63 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Shield Sweep",
							value = 63,
							mit = 36,
							crit = false,
							time = 64936537887,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 30,
							mit = 32,
							crit = false,
							time = 64936537888,
						},
						
						{
							str = L"Your attack hits Purple Crawler for 56 damage. (47 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"attack",
							value = 56,
							mit = 47,
							crit = false,
							time = 64936537889,
						},
						
						{
							str = L"Your Guarded Attack hits Purple Crawler for 55 damage. (37 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Guarded Attack",
							value = 55,
							mit = 37,
							crit = false,
							time = 64936537889,
						},
						
						{
							str = L"Your Heavy Blow hits Purple Crawler for 30 damage. (32 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Purple Crawler",
							ability = L"Heavy Blow",
							value = 30,
							mit = 32,
							crit = false,
							time = 64936537889,
						},
					},
					valueAoe = 70,
					valueMax = 108,
					value = 70,
					valueAoeMax = 108,
					object = L"Purple Crawler",
				},
				
				{
					totalAoe = 0,
					total = 240,
					object = L"Ironknubbe",
					value = 80,
					objectTime = 64936537886,
					data = 
					{
						
						{
							overheal = 0,
							type = 3,
							ability = L"Fleeting Elixir of Mending",
							currentTarget = true,
							time = 64936537886,
							value = 120,
							object = L"Ironknubbe",
							crit = false,
							str = L"Your Fleeting Elixir of Mending heals you for 120 points.",
						},
						
						{
							overheal = 0,
							type = 3,
							ability = L"Fleeting Elixir of Mending",
							currentTarget = true,
							time = 64936537889,
							value = 120,
							object = L"Ironknubbe",
							crit = false,
							str = L"Your Fleeting Elixir of Mending heals you for 120 points.",
						},
					},
					valueAoe = 0,
				},
				
				{
					totalAoe = 240,
					total = 240,
					object = L"you",
					value = 80,
					objectTime = 64936537886,
					data = 
					{
						
						{
							str = L"Your Fleeting Elixir of Mending heals you for 120 points.",
							type = 4,
							ability = L"Fleeting Elixir of Mending",
							currentTarget = true,
							time = 64936537886,
							value = 120,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Fleeting Elixir of Mending heals you for 120 points.",
							type = 4,
							ability = L"Fleeting Elixir of Mending",
							currentTarget = true,
							time = 64936537889,
							value = 120,
							overheal = 0,
							crit = false,
							object = L"you",
						},
					},
					valueAoe = 80,
				},
			},
			name = L"Default",
			data = 
			{
				
				{
					[L"Envenomed Fangs"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 674,
							abs = 0,
							min = 7,
							count = 47,
							max = 61,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
								hp = 0,
								isFriendly = false,
							},
							mit = 1422,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 593,
								level = 9,
								hp = 93,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 189,
							abs = 0,
							min = 9,
							count = 5,
							max = 68,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 545,
								level = 9,
								hp = 0,
								isFriendly = false,
							},
							mit = 399,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 546,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Spider Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 783,
							abs = 0,
							min = 31,
							count = 22,
							max = 67,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							mit = 1779,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 544,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 2,
						crit = 
						{
							overheal = 0,
							total = 178,
							abs = 0,
							min = 46,
							count = 3,
							max = 68,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 544,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
							mit = 390,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 546,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 3725,
							max = 67,
							min = 23,
							count = 100,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
								hp = 0,
								isFriendly = false,
							},
							mit = 6616,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Mountain Squig",
								career = 0,
								id = 373,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 6,
						crit = 
						{
							overheal = 0,
							total = 683,
							max = 91,
							min = 31,
							count = 13,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							mit = 1339,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								isFriendly = false,
								id = 11972,
								level = 7,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
				},
				
				{
					[L"Shield Sweep"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 601,
							abs = 0,
							min = 58,
							count = 9,
							max = 81,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							mit = 330,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
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
							total = 87,
							abs = 0,
							min = 87,
							count = 1,
							max = 87,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
							mit = 53,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Binding Grudge"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 708,
							abs = 0,
							min = 20,
							count = 17,
							max = 75,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 607,
								level = 9,
								hp = 90,
								isFriendly = false,
							},
							mit = 341,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Mountain Squig",
								career = 0,
								id = 377,
								level = 8,
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
							total = 160,
							abs = 0,
							min = 44,
							count = 3,
							max = 69,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							mit = 81,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 547,
								level = 8,
								hp = 92,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Heavy Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2912,
							max = 74,
							min = 17,
							count = 73,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 607,
								level = 9,
								hp = 90,
								isFriendly = false,
							},
							mit = 2487,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 546,
								level = 8,
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
							total = 479,
							max = 95,
							min = 24,
							count = 9,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Mountain Squig",
								career = 0,
								id = 377,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
							mit = 416,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								isFriendly = false,
								id = 11972,
								level = 7,
								hp = 100,
								career = 0,
							},
						},
						parry = 1,
					},
					[L"Axe Toss"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 45,
							max = 15,
							min = 15,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 545,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							mit = 81,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 545,
								level = 9,
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
					[L"Grudging Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 57,
							max = 57,
							min = 57,
							count = 1,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								isFriendly = false,
								id = 11972,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 35,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								isFriendly = false,
								id = 11972,
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
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Guarded Attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 353,
							max = 55,
							min = 47,
							count = 9,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 544,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
							mit = 251,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
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
							total = 276,
							abs = 0,
							min = 64,
							count = 4,
							max = 73,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Mountain Squig",
								career = 0,
								id = 373,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 204,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 546,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 2,
					},
					[L"Inspiring Attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 432,
							max = 74,
							min = 58,
							count = 8,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							mit = 278,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 548,
								level = 8,
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
							total = 79,
							abs = 0,
							min = 79,
							count = 1,
							max = 79,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
							mit = 51,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 606,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 1,
					},
					[L"Shield of Reprisal"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 88,
							abs = 0,
							min = 88,
							count = 1,
							max = 88,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 547,
								level = 8,
								hp = 92,
								isFriendly = false,
							},
							mit = 45,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 547,
								level = 8,
								hp = 92,
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
					[L"Vengeful Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 402,
							max = 57,
							min = 46,
							count = 9,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								isFriendly = false,
								id = 11972,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 284,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 588,
								level = 9,
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
							total = 64,
							abs = 0,
							min = 64,
							count = 1,
							max = 64,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 548,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
							mit = 47,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 548,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 1,
					},
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2186,
							max = 58,
							min = 43,
							count = 44,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Mountain Squig",
								career = 0,
								id = 373,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 1969,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 588,
								level = 9,
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
							total = 304,
							abs = 0,
							min = 65,
							count = 4,
							max = 83,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 548,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
							mit = 265,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								career = 0,
								id = 546,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 2,
					},
				},
				
				{
					[L"Ironknubbe - Fleeting Elixir of Mending"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 240,
							abs = 0,
							min = 120,
							count = 2,
							max = 120,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ironknubbe",
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ironknubbe",
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
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
				},
				
				{
					[L"Fleeting Elixir of Mending"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 240,
							abs = 0,
							min = 120,
							count = 2,
							max = 120,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ironknubbe",
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
								isFriendly = true,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ironknubbe",
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
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
				},
			},
			dt = 
			{
				minutes = 10,
				year = 2020,
				month = 4,
				day = 15,
				hours = 23,
				seconds = 44,
				totalSeconds = 64936509440,
			},
		},
	},
	groupIconsOtherGroupsBGColor = 
	{
		200,
		255,
		255,
	},
	unitFramesGroupsPadding2 = 30,
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
	killSpamListBottomUp = true,
	groupIconsScale = 1,
	playerKills = 0,
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
	markNewTarget = true,
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
	combatLogStatsWindowType = 1,
	combatLogIDSRowBackground = 
	{
		225,
		50,
		50,
	},
	unitFramesPadding2 = 20,
	combatLogEPSEnabled = 
	{
		true,
		true,
		true,
		true,
	},
	unitFramesLayer = 1,
	groupIconsOtherGroupsScale = 0,
	targetShowDelay = 8,
	assistTargetOnNotifyClick = true,
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
		46,
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
		id = 6,
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
	groupIconsAlpha = 0.5,
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
	playerDeaths = 6,
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
			archetypes = 
			{
				false,
				false,
				false,
			},
			id = "7888",
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
			isEnabled = true,
			playerType = 1,
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
			id = "7889",
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
			isEnabled = true,
			playerType = 1,
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
			id = "7890",
			data = 
			{
				pos = 
				{
					35,
					3,
				},
				offlineHide = true,
				layer = 1,
				distAlpha = 0.3,
				scale = 1,
				wrap = false,
				anchorFrom = "topleft",
				color = 
				{
					150,
					190,
					255,
				},
				size = 
				{
					129,
					30,
				},
				vertical = false,
				deadHide = true,
				alpha = 1,
				textureFullResize = true,
				distHide = false,
				anchorTo = "topleft",
				texture = "default",
			},
			exceptMe = false,
			name = L"HP",
			isEnabled = true,
			playerType = 1,
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
			id = "7891",
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
			isEnabled = true,
			playerType = 3,
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
			id = "7892",
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
			isEnabled = true,
			playerType = 1,
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
			id = "7893",
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
			isEnabled = true,
			playerType = 1,
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
			id = "7894",
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
			isEnabled = true,
			playerType = 1,
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
			id = "7895",
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
			isEnabled = true,
			playerType = 1,
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
			id = "7896",
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
			isEnabled = true,
			playerType = 3,
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
			id = "7897",
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
			isEnabled = false,
			playerType = 1,
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
			id = "7898",
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
			isEnabled = true,
			playerType = 1,
			type = "distanceBar",
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
			id = "7899",
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
			type = "hppText",
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
	},
	unitFramesPadding1 = 6,
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
	combatLogTargetDefenseTotalEnabled = false,
	combatLogIDSRowScale = 1,
	groupIconsShowOtherGroups = true,
	groupIconsPetBGColor = 
	{
		255,
		225,
		255,
	},
	unitFramesGroupsPadding1 = 30,
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




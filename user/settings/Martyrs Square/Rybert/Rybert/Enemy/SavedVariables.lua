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
			id = "134000",
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
			id = "134001",
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
			id = "134002",
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
			id = "134003",
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
			id = "134004",
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
			id = "134005",
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
			id = "134006",
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
			id = "134007",
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
			id = "134008",
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
			id = "134009",
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
			id = "134010",
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
			id = "134011",
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
			id = "134012",
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
			id = "134013",
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
			id = "134014",
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
			id = "134015",
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
			id = "134016",
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
		id = 3271,
		layer = 3,
		alpha = 1,
		scale = 0.8,
		text = L"G",
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
							max = 105,
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
					[L"Word of Pain"] = 
					{
						normal = 
						{
							min = 222,
							total = 222,
							count = 1,
							abs = 0,
							max = 222,
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
					[L"attack"] = 
					{
						normal = 
						{
							min = 8,
							total = 11460,
							count = 168,
							mit = 2933,
							abs = 0,
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
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 2290,
							max = 277,
							min = 12,
							count = 22,
							abs = 0,
							mit = 561,
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
							mit = 132,
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
					[L"ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 3665,
							max = 2016,
							min = 0,
							count = 46,
							abs = 2738,
							mit = 694,
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
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4453,
								level = 7,
								hp = 100,
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
							count = 4,
							abs = 308,
							mit = 84,
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
					[L"Rabid Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 946,
							max = 79,
							min = 0,
							count = 16,
							abs = 218,
							mit = 374,
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
							minObject = 
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
							mit = 106,
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
							mit = 147,
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
							total = 37,
							max = 37,
							min = 37,
							count = 1,
							abs = 0,
							mit = 21,
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
					[L"Lunging Maw"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 678,
							max = 81,
							min = 0,
							count = 14,
							abs = 354,
							mit = 321,
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
							minObject = 
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
							mit = 31,
							maxObject = 
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
							max = 18,
							min = 18,
							count = 1,
							abs = 0,
							mit = 7,
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
							mit = 1,
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
							max = 41,
							mit = 48,
							overheal = 0,
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
							max = 60,
							mit = 28,
							overheal = 0,
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
							mit = 57,
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
							max = 113,
							min = 113,
							count = 1,
							abs = 0,
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
					[L"Chillwind"] = 
					{
						normal = 
						{
							min = 92,
							total = 184,
							count = 2,
							abs = 0,
							max = 92,
							mit = 18,
							overheal = 0,
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
							max = 143,
							mit = 13,
							overheal = 0,
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
							mit = 21,
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
				},
				
				{
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
							mit = 453,
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
							max = 41,
							min = 33,
							count = 3,
							abs = 0,
							mit = 86,
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
					[L"Castigation"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1855,
							max = 38,
							min = 2,
							count = 138,
							abs = 0,
							mit = 1361,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4350,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
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
							total = 288,
							max = 58,
							min = 8,
							count = 12,
							abs = 0,
							mit = 175,
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
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1450,
							max = 54,
							min = 37,
							count = 32,
							abs = 0,
							mit = 968,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4129,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
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
							max = 73,
							min = 73,
							count = 1,
							abs = 0,
							mit = 23,
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
					[L"Bludgeon"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 5087,
							max = 110,
							min = 27,
							count = 88,
							abs = 0,
							mit = 3196,
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
							total = 503,
							max = 92,
							min = 77,
							count = 6,
							abs = 0,
							mit = 261,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4350,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
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
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1778,
							max = 76,
							min = 35,
							count = 39,
							abs = 0,
							mit = 1143,
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
							max = 90,
							min = 0,
							count = 8,
							abs = 66,
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
					[L"Divine Assault"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 3132,
							max = 38,
							min = 31,
							count = 91,
							abs = 0,
							mit = 1908,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4350,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
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
							total = 720,
							max = 56,
							min = 43,
							count = 15,
							abs = 0,
							mit = 456,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4350,
								level = 5,
								hp = 100,
								name = L"Tainted Hound",
							},
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
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 6179,
							max = 47,
							min = 9,
							count = 204,
							abs = 0,
							mit = 5021,
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
							total = 726,
							max = 67,
							min = 13,
							count = 18,
							abs = 0,
							mit = 742,
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
						parry = 0,
					},
				},
				
				{
					[L"Rybert - Lingering Divine Aid"] = 
					{
						normal = 
						{
							overheal = 920,
							total = 520,
							abs = 0,
							min = 23,
							count = 60,
							max = 27,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 2800,
								level = 8,
								hp = 81,
								name = L"Rybert",
							},
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
							total = 0,
							abs = 0,
							min = 33,
							count = 3,
							max = 35,
							mit = 0,
							maxObject = 
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
					[L"Rybert - Divine Aid"] = 
					{
						normal = 
						{
							overheal = 760,
							total = 430,
							abs = 0,
							min = 95,
							count = 12,
							max = 112,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 2800,
								level = 8,
								hp = 62,
								name = L"Rybert",
							},
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
							total = 0,
							abs = 0,
							min = 140,
							count = 1,
							max = 140,
							mit = 0,
							maxObject = 
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
					[L"Rybert - Divine Assault"] = 
					{
						normal = 
						{
							overheal = 6884,
							total = 6577,
							max = 196,
							min = 108,
							count = 106,
							abs = 0,
							mit = 0,
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
							overheal = 5962,
							total = 3290,
							max = 186,
							min = 82,
							count = 92,
							abs = 0,
							mit = 0,
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
							total = 326,
							max = 159,
							min = 115,
							count = 9,
							abs = 0,
							mit = 0,
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
					[L"Rybert - Divine Strike"] = 
					{
						normal = 
						{
							overheal = 412,
							total = 1488,
							max = 65,
							min = 37,
							count = 41,
							abs = 0,
							mit = 0,
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
							total = 4524,
							max = 160,
							min = 73,
							count = 81,
							abs = 0,
							mit = 0,
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
							mit = 0,
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
							total = 4524,
							max = 160,
							min = 73,
							count = 81,
							abs = 0,
							mit = 0,
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
							min = 23,
							total = 3294,
							count = 142,
							overheal = 1616,
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
							overheal = 101,
							total = 481,
							abs = 0,
							min = 33,
							count = 11,
							max = 64,
							mit = 0,
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
					[L"Healing Hand"] = 
					{
						normal = 
						{
							overheal = 10107,
							total = 10957,
							abs = 0,
							min = 82,
							count = 166,
							max = 186,
							mit = 0,
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
							min = 115,
							total = 1778,
							count = 21,
							overheal = 2035,
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
					[L"Divine Assault"] = 
					{
						normal = 
						{
							overheal = 6884,
							total = 6577,
							max = 196,
							min = 108,
							count = 106,
							abs = 0,
							mit = 0,
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
							mit = 0,
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
					[L"Divine Strike"] = 
					{
						normal = 
						{
							overheal = 718,
							total = 2350,
							abs = 0,
							min = 35,
							count = 61,
							max = 90,
							mit = 0,
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
							total = 3015,
							abs = 0,
							min = 95,
							count = 28,
							max = 191,
							mit = 0,
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
							total = 524,
							abs = 0,
							min = 140,
							count = 3,
							max = 270,
							mit = 0,
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
			eps = 
			{
				
				{
					total = 237,
					objectTime = 64937093172,
					data = 
					{
						
						{
							str = L"Tainted Horror's attack hits you for 79 damage. (17 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64937093177,
							object = L"Tainted Horror",
							value = 79,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
						
						{
							str = L"Tainted Horror's attack hits you for 79 damage. (17 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64937093179,
							object = L"Tainted Horror",
							value = 79,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
						
						{
							str = L"Tainted Horror's attack hits you for 79 damage. (17 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64937093181,
							object = L"Tainted Horror",
							value = 79,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
						
						{
							str = L"Tainted Horror's ability hits you for 0 damage. (14 mitigated) (82 absorbed)",
							type = 1,
							abs = 82,
							currentTarget = true,
							time = 64937093184,
							object = L"Tainted Horror",
							value = 0,
							crit = false,
							mit = 14,
							ability = L"ability",
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Tainted Horror's attack critically hits you for 112 damage. (24 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64937093172,
							object = L"Tainted Horror",
							value = 112,
							crit = true,
							mit = 24,
							ability = L"attack",
						},
						
						{
							str = L"Tainted Horror's attack hits you for 79 damage. (17 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64937093175,
							object = L"Tainted Horror",
							value = 79,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
						
						{
							str = L"Tainted Horror's attack hits you for 79 damage. (17 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64937093177,
							object = L"Tainted Horror",
							value = 79,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
					},
					valueAoe = 0,
					valueMax = 54,
					value = 34,
					object = L"Tainted Horror",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 34 damage. (22 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Divine Assault",
							value = 34,
							mit = 22,
							crit = false,
							time = 64937093178,
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Castigation",
							value = 7,
							mit = 6,
							crit = false,
							time = 64937093179,
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 34 damage. (22 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Divine Assault",
							value = 34,
							mit = 22,
							crit = false,
							time = 64937093179,
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"attack",
							value = 29,
							mit = 28,
							crit = false,
							time = 64937093180,
						},
						
						{
							str = L"Your Divine Assault critically hits Tainted Horror for 47 damage. (30 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Divine Assault",
							value = 47,
							mit = 30,
							crit = true,
							time = 64937093180,
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 56 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Bludgeon",
							value = 56,
							mit = 40,
							crit = false,
							time = 64937093180,
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Castigation",
							value = 7,
							mit = 6,
							crit = false,
							time = 64937093181,
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 56 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Bludgeon",
							value = 56,
							mit = 40,
							crit = false,
							time = 64937093181,
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"attack",
							value = 29,
							mit = 28,
							crit = false,
							time = 64937093182,
						},
						
						{
							str = L"Your Divine Strike hits Tainted Horror for 43 damage. (31 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Divine Strike",
							value = 43,
							mit = 31,
							crit = false,
							time = 64937093183,
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Castigation",
							value = 7,
							mit = 6,
							crit = false,
							time = 64937093183,
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 56 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"Bludgeon",
							value = 56,
							mit = 40,
							crit = false,
							time = 64937093184,
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Tainted Horror",
							ability = L"attack",
							value = 29,
							mit = 28,
							crit = false,
							time = 64937093184,
						},
					},
					total = 490,
					objectTime = 64937093172,
					data = 
					{
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 34 damage. (22 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093178,
							object = L"Tainted Horror",
							value = 34,
							crit = false,
							mit = 22,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093179,
							object = L"Tainted Horror",
							value = 7,
							crit = false,
							mit = 6,
							ability = L"Castigation",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 34 damage. (22 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093179,
							object = L"Tainted Horror",
							value = 34,
							crit = false,
							mit = 22,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093180,
							object = L"Tainted Horror",
							value = 29,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Assault critically hits Tainted Horror for 47 damage. (30 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093180,
							object = L"Tainted Horror",
							value = 47,
							crit = true,
							mit = 30,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 56 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093180,
							object = L"Tainted Horror",
							value = 56,
							crit = false,
							mit = 40,
							ability = L"Bludgeon",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093181,
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
							time = 64937093181,
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
							time = 64937093182,
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
							time = 64937093183,
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
							time = 64937093183,
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
							time = 64937093184,
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
							time = 64937093184,
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
							time = 64937093185,
							object = L"Tainted Horror",
							value = 56,
							crit = false,
							mit = 40,
							ability = L"Bludgeon",
						},
					},
					totalAoe = 490,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 34 damage. (22 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093178,
							object = L"Tainted Horror",
							value = 34,
							crit = false,
							mit = 22,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093179,
							object = L"Tainted Horror",
							value = 7,
							crit = false,
							mit = 6,
							ability = L"Castigation",
						},
						
						{
							str = L"Your Divine Assault hits Tainted Horror for 34 damage. (22 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093179,
							object = L"Tainted Horror",
							value = 34,
							crit = false,
							mit = 22,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your attack hits Tainted Horror for 29 damage. (28 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093180,
							object = L"Tainted Horror",
							value = 29,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Assault critically hits Tainted Horror for 47 damage. (30 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093180,
							object = L"Tainted Horror",
							value = 47,
							crit = true,
							mit = 30,
							ability = L"Divine Assault",
						},
						
						{
							str = L"Your Bludgeon hits Tainted Horror for 56 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093180,
							object = L"Tainted Horror",
							value = 56,
							crit = false,
							mit = 40,
							ability = L"Bludgeon",
						},
						
						{
							str = L"Your Castigation hits Tainted Horror for 7 damage. (6 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64937093181,
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
							time = 64937093181,
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
							time = 64937093182,
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
							time = 64937093183,
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
							time = 64937093183,
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
							time = 64937093184,
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
							time = 64937093184,
							object = L"Tainted Horror",
							value = 29,
							crit = false,
							mit = 28,
							ability = L"attack",
						},
					},
					valueAoe = 70,
					valueMax = 72,
					value = 70,
					object = L"Tainted Horror",
					valueAoeMax = 72,
				},
				
				{
					total = 531,
					objectTime = 64937093175,
					data = 
					{
						
						{
							str = L"Your Divine Assault heals you for 79 points. (40 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093178,
							value = 79,
							overheal = 40,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (119 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093179,
							value = 0,
							overheal = 119,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (85 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093180,
							value = 79,
							overheal = 85,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Strike heals you for 43 points.",
							type = 3,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937093183,
							value = 43,
							overheal = 0,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 36 points. (50 overhealed)",
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64937093184,
							value = 36,
							overheal = 50,
							crit = false,
							object = L"Rybert",
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Strike heals you for 43 points.",
							type = 3,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937093175,
							value = 43,
							overheal = 0,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Assault heals you for 148 points. (13 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093176,
							value = 148,
							overheal = 13,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (40 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093178,
							value = 79,
							overheal = 40,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (119 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093179,
							value = 0,
							overheal = 119,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (85 overhealed)",
							type = 3,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093180,
							value = 79,
							overheal = 85,
							crit = false,
							object = L"Rybert",
						},
					},
					valueAoe = 0,
					valueMax = 121,
					value = 89,
					object = L"Rybert",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Strike heals you for 43 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = true,
							time = 64937093175,
							value = 43,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Assault heals you for 148 points. (13 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093176,
							value = 148,
							overheal = 13,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (40 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093178,
							value = 79,
							overheal = 40,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (119 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093179,
							value = 0,
							overheal = 119,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (85 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							time = 64937093180,
							value = 79,
							overheal = 85,
							crit = false,
							object = L"you",
						},
					},
					total = 531,
					objectTime = 64937093175,
					data = 
					{
						
						{
							str = L"Your Divine Assault heals you for 79 points. (40 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 79,
							time = 64937093178,
							crit = false,
							overheal = 40,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (119 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							time = 64937093179,
							crit = false,
							overheal = 119,
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (85 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 79,
							time = 64937093180,
							crit = false,
							overheal = 85,
						},
						
						{
							str = L"Your Divine Strike heals you for 43 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"you",
							value = 43,
							time = 64937093183,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Prayer of Devotion heals you for 36 points. (50 overhealed)",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							object = L"you",
							value = 36,
							time = 64937093184,
							crit = false,
							overheal = 50,
						},
					},
					totalAoe = 531,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Strike heals you for 43 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = true,
							object = L"you",
							value = 43,
							time = 64937093175,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Assault heals you for 148 points. (13 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 148,
							time = 64937093176,
							crit = false,
							overheal = 13,
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (40 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 79,
							time = 64937093178,
							crit = false,
							overheal = 40,
						},
						
						{
							str = L"Your Divine Assault heals you for 0 points. (119 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 0,
							time = 64937093179,
							crit = false,
							overheal = 119,
						},
						
						{
							str = L"Your Divine Assault heals you for 79 points. (85 overhealed)",
							type = 4,
							ability = L"Divine Assault",
							currentTarget = true,
							object = L"you",
							value = 79,
							time = 64937093180,
							crit = false,
							overheal = 85,
						},
					},
					valueAoe = 89,
					valueMax = 121,
					value = 89,
					object = L"you",
					valueAoeMax = 121,
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
			deaths = 1,
			renown = 40,
			healing = 3829,
			soloKills = 0,
			realm = 2,
			kills = 1,
			name = L"Sybannak",
			career = 15,
			db = 0,
			level = 15,
			exp = 228,
			damage = 415,
		},
		
		{
			deaths = 0,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 5,
			name = L"Vendial",
			career = 9,
			db = 0,
			level = 13,
			exp = 15247,
			damage = 1880,
		},
		
		{
			deaths = 0,
			renown = 1629,
			healing = 1724,
			soloKills = 0,
			realm = 1,
			kills = 18,
			name = L"Eladorin",
			career = 17,
			db = 1,
			level = 11,
			exp = 16878,
			damage = 9098,
		},
		
		{
			deaths = 1,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 9,
			name = L"Stenna",
			career = 9,
			db = 1,
			level = 11,
			exp = 28825,
			damage = 2912,
		},
		
		{
			deaths = 0,
			renown = 2088,
			healing = 16022,
			soloKills = 0,
			realm = 1,
			kills = 17,
			name = L"Rybert",
			career = 12,
			db = 0,
			level = 7,
			exp = 14744,
			damage = 1203,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 1,
			name = L"Terrorbit",
			career = 8,
			db = 0,
			level = 13,
			exp = 614,
			damage = 70124,
		},
		
		{
			deaths = 0,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 6,
			name = L"Helmtrudd",
			career = 9,
			db = 0,
			level = 15,
			exp = 15247,
			damage = 2494,
		},
		
		{
			deaths = 0,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 13,
			name = L"Andofili",
			career = 19,
			db = 7,
			level = 14,
			exp = 16036,
			damage = 15100,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 0,
			name = L"Anehtas",
			career = 24,
			db = 0,
			level = 12,
			exp = 228,
			damage = 3420,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 0,
			name = L"Kwiskass",
			career = 8,
			db = 0,
			level = 8,
			exp = 209,
			damage = 36442,
		},
		
		{
			deaths = 2,
			renown = 1529,
			healing = 160,
			soloKills = 0,
			realm = 1,
			kills = 14,
			name = L"Oscrue",
			career = 11,
			db = 3,
			level = 13,
			exp = 15247,
			damage = 4005,
		},
		
		{
			deaths = 0,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 1,
			name = L"Dalsgard",
			career = 13,
			db = 0,
			level = 14,
			exp = 228,
			damage = 1153,
		},
		
		{
			deaths = 0,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 0,
			name = L"Cpkabana",
			career = 24,
			db = 0,
			level = 13,
			exp = 228,
			damage = 1290,
		},
		
		{
			deaths = 2,
			renown = 2563,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 7,
			name = L"Keronus",
			career = 11,
			db = 1,
			level = 10,
			exp = 16317,
			damage = 2766,
		},
		
		{
			deaths = 1,
			renown = 1409,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 10,
			name = L"Adelhide",
			career = 9,
			db = 1,
			level = 6,
			exp = 16158,
			damage = 3487,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 1,
			name = L"Rhetr",
			career = 13,
			db = 0,
			level = 10,
			exp = 614,
			damage = 2823,
		},
		
		{
			deaths = 3,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 3,
			name = L"Klaudiana",
			career = 21,
			db = 2,
			level = 3,
			exp = 1353,
			damage = 1275,
		},
		
		{
			deaths = 2,
			renown = 40,
			healing = 875,
			soloKills = 0,
			realm = 2,
			kills = 1,
			name = L"Costusss",
			career = 23,
			db = 0,
			level = 3,
			exp = 195,
			damage = 636,
		},
		
		{
			deaths = 0,
			renown = 3372,
			healing = 7986,
			soloKills = 0,
			realm = 1,
			kills = 16,
			name = L"Drakonval",
			career = 12,
			db = 0,
			level = 4,
			exp = 17623,
			damage = 3981,
		},
		
		{
			deaths = 2,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 3,
			name = L"Shikimara",
			career = 22,
			db = 1,
			level = 4,
			exp = 1167,
			damage = 3453,
		},
		
		{
			deaths = 2,
			renown = 40,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 3,
			name = L"Ptkaos",
			career = 13,
			db = 0,
			level = 3,
			exp = 781,
			damage = 2084,
		},
		
		{
			deaths = 2,
			renown = 1840,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 10,
			name = L"Svanson",
			career = 18,
			db = 1,
			level = 3,
			exp = 19860,
			damage = 4056,
		},
		
		{
			deaths = 0,
			renown = 3062,
			healing = 710,
			soloKills = 0,
			realm = 1,
			kills = 18,
			name = L"Eorend",
			career = 18,
			db = 4,
			level = 2,
			exp = 18155,
			damage = 8512,
		},
		
		{
			deaths = 1,
			renown = 0,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 0,
			name = L"Ghaelaso",
			career = 24,
			db = 0,
			level = 1,
			exp = 0,
			damage = 911,
		},
	},
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	combatLogTargetDefenseScale = 1,
	soundOnNewTargetId = 500,
	groupIconsPetBGAlpha = 0.5,
	unitFramesGroupsDirection2 = 4,
	unitFramesScale = 1,
	combatLogEnabled = true,
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	unitFramesMyGroupFirst = true,
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
		mode = 2,
		orderPoints = 500,
		timeLeft = 86.365067107603,
		pointMax = 500,
	},
	unitFramesIsVertical = false,
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
	playerDeaths = 0,
	scenarioAlerterEnabled = true,
	groupIconsShowOnMarkedPlayers = false,
	killSpamReparseChunkSize = 20,
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
			type = "selectionFrame",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "panel",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "hpbar",
			id = "133990",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "apbar",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "nameText",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "careerIcon",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "levelText",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "groupLeaderIcon",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "moraleBar",
			id = "133996",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "distanceText",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "distanceBar",
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
			archetypeMatch = 1,
			playerTypeMatch = 1,
		},
		
		{
			type = "hppText",
			id = "133999",
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
			archetypeMatch = 1,
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
	groupIconsOtherGroupsLayer = 0,
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
	groupIconsAlpha = 1,
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
		text = L"KILL",
		alpha = 1,
		layer = 3,
		targetOnClick = true,
		font = "font_clear_large_bold",
		name = L"",
		scale = 1,
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




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
	},
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
			anchorTo = 5,
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
			id = "3215",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 3,
					type = "guard",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyGuard",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
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
					durationType = 3,
					type = "guard",
					descriptionMatch = 2,
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
			id = "3216",
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
			anchorTo = 9,
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
			id = "3217",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					descriptionMatch = 2,
					castedByMe = 1,
					typeMatch = 1,
					nameMatch = 1,
					filterName = L"Any",
					hasDurationLimit = false,
					durationType = 2,
				},
			},
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
			anchorTo = 9,
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
			id = "3218",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 2,
					type = "isHealing",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
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
			id = "3219",
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
					durationType = 2,
					type = "isBuff",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyBuff",
					hasDurationLimit = false,
					typeMatch = 1,
				},
				
				{
					durationType = 2,
					type = "isHealing",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					typeMatch = 1,
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
			id = "3220",
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
					durationType = 2,
					type = "isHealing",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 2,
					filterName = L"MyHealing",
					hasDurationLimit = false,
					typeMatch = 1,
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
			anchorTo = 8,
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
			id = "3221",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 1,
					type = "healDebuffOut50",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"OutHealDebuff",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
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
			anchorTo = 8,
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
			id = "3222",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					durationType = 1,
					type = "healDebuffIn50",
					descriptionMatch = 2,
					nameMatch = 1,
					castedByMe = 3,
					filterName = L"InHealDebuff",
					hasDurationLimit = false,
					typeMatch = 1,
				},
			},
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
					durationType = 2,
					type = "stagger",
					descriptionMatch = 2,
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
			id = "3223",
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
			anchorTo = 8,
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
			id = "3224",
			alpha = 1,
			archetypeMatch = 1,
			effectFilters = 
			{
				[1] = 
				{
					typeMatch = 1,
					filterName = L"DoK_WP_Regen",
					abilityIds = L"9561, 8237",
					castedByMe = 1,
					durationType = 1,
					descriptionMatch = 2,
					abilityIdsHash = 
					{
						[9561] = true,
						[8237] = true,
					},
					hasDurationLimit = false,
					nameMatch = 1,
				},
			},
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
					abilityIds = L"613",
					castedByMe = 1,
					durationType = 2,
					descriptionMatch = 2,
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
			id = "3225",
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
					abilityIds = L"653, 674, 695, 3882",
					castedByMe = 1,
					durationType = 2,
					descriptionMatch = 2,
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
			id = "3226",
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
					abilityIds = L"9616",
					castedByMe = 1,
					durationType = 2,
					descriptionMatch = 2,
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
			id = "3227",
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
					abilityIds = L"8308",
					castedByMe = 1,
					durationType = 2,
					descriptionMatch = 2,
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
			id = "3228",
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
					abilityIds = L"3746, 8551, 8617, 3748, 8560, 8619, 20458, 3747, 8556, 8618, 3038, 3773, 8567, 8620, 1591, 3670, 20476, 1588, 1600, 3570, 1608, 3650, 3671",
					castedByMe = 2,
					durationType = 1,
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
			id = "3229",
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
			id = "3230",
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
			id = "3231",
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
		id = 3271,
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
			data = 
			{
				
				{
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 388,
							max = 20,
							min = 8,
							count = 20,
							abs = 0,
							mit = 306,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 360,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 181,
								level = 1,
								hp = 100,
								name = L"Raven Host Marauder",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 59,
							max = 30,
							min = 29,
							count = 2,
							abs = 0,
							mit = 44,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 193,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 195,
								level = 2,
								hp = 100,
								name = L"Kar Ravensword",
							},
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
							total = 157,
							max = 31,
							min = 24,
							count = 6,
							abs = 0,
							mit = 113,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 181,
								level = 1,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 186,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 81,
							max = 41,
							min = 40,
							count = 2,
							abs = 0,
							mit = 46,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 187,
								level = 1,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 234,
								level = 1,
								hp = 100,
								name = L"Raven Host Marauder",
							},
						},
						parry = 0,
					},
					[L"Castigation"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 81,
							max = 35,
							min = 6,
							count = 4,
							abs = 0,
							mit = 33,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 185,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 185,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 66,
							max = 56,
							min = 10,
							count = 2,
							abs = 0,
							mit = 23,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 352,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 352,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
						},
						parry = 0,
					},
					[L"Bludgeon"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 183,
							max = 63,
							min = 57,
							count = 3,
							abs = 0,
							mit = 70,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 360,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 195,
								level = 2,
								hp = 100,
								name = L"Kar Ravensword",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 168,
							max = 89,
							min = 79,
							count = 2,
							abs = 0,
							mit = 68,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 352,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 147,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
						},
						parry = 0,
					},
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 245,
							max = 54,
							min = 44,
							count = 5,
							abs = 0,
							mit = 109,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 348,
								level = 1,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 186,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
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
							total = 186,
							max = 48,
							min = 42,
							count = 4,
							abs = 0,
							mit = 80,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 360,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 328,
								level = 2,
								hp = 9,
								name = L"Raven Host Marauder",
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
							total = 956,
							max = 40,
							min = 32,
							count = 27,
							abs = 0,
							mit = 458,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 348,
								level = 1,
								hp = 100,
								name = L"Raven Host Marauder",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 186,
								level = 2,
								hp = 100,
								name = L"Raven Host Marauder",
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
							overheal = 719,
							total = 347,
							max = 82,
							min = 82,
							count = 13,
							abs = 0,
							mit = 0,
							maxObject = 
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
							overheal = 211,
							total = 20,
							max = 116,
							min = 115,
							count = 2,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 5,
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
								level = 5,
								hp = 100,
								name = L"Rybert",
							},
						},
						parry = 0,
					},
					[L"Rybert - Divine Strike"] = 
					{
						normal = 
						{
							overheal = 66,
							total = 120,
							max = 48,
							min = 42,
							count = 4,
							abs = 0,
							mit = 0,
							maxObject = 
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
				},
				
				{
					[L"Healing Hand"] = 
					{
						normal = 
						{
							overheal = 719,
							total = 347,
							max = 82,
							min = 82,
							count = 13,
							abs = 0,
							mit = 0,
							maxObject = 
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
							overheal = 211,
							total = 20,
							max = 116,
							min = 115,
							count = 2,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								isFriendly = true,
								id = 114,
								level = 5,
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
								level = 5,
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
							overheal = 96,
							total = 186,
							max = 48,
							min = 42,
							count = 6,
							abs = 0,
							mit = 0,
							maxObject = 
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
				},
			},
			eps = 
			{
				
				{
					total = 80,
					objectTime = 64936976708,
					data = 
					{
						
						{
							str = L"Raven Host Marauder's attack hits you for 20 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64936976715,
							object = L"Raven Host Marauder",
							value = 20,
							crit = false,
							mit = 16,
							ability = L"attack",
						},
						
						{
							str = L"Raven Host Marauder's attack hits you for 20 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64936976718,
							object = L"Raven Host Marauder",
							value = 20,
							crit = false,
							mit = 16,
							ability = L"attack",
						},
						
						{
							str = L"Raven Host Marauder's attack hits you for 20 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64936976720,
							object = L"Raven Host Marauder",
							value = 20,
							crit = false,
							mit = 16,
							ability = L"attack",
						},
						
						{
							str = L"Raven Host Marauder's attack hits you for 20 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64936976722,
							object = L"Raven Host Marauder",
							value = 20,
							crit = false,
							mit = 16,
							ability = L"attack",
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Raven Host Marauder's attack hits you for 20 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64936976715,
							object = L"Raven Host Marauder",
							value = 20,
							crit = false,
							mit = 16,
							ability = L"attack",
						},
						
						{
							str = L"Raven Host Marauder's attack hits you for 20 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64936976720,
							object = L"Raven Host Marauder",
							value = 20,
							crit = false,
							mit = 16,
							ability = L"attack",
						},
					},
					object = L"Raven Host Marauder",
					valueMax = 12,
					value = 11,
					valueAoe = 0,
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Strike hits Raven Host Marauder for 42 damage. (20 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Raven Host Marauder",
							ability = L"Divine Strike",
							value = 42,
							mit = 20,
							crit = false,
							time = 64936976704,
						},
						
						{
							str = L"Your Sigmar's Fist hits Raven Host Marauder for 54 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Raven Host Marauder",
							ability = L"Sigmar's Fist",
							value = 54,
							mit = 17,
							crit = false,
							time = 64936976706,
						},
						
						{
							str = L"Your attack hits Raven Host Marauder for 40 damage. (14 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Raven Host Marauder",
							ability = L"attack",
							value = 40,
							mit = 14,
							crit = false,
							time = 64936976706,
						},
						
						{
							str = L"Your Castigation critically hits Raven Host Marauder for 56 damage. (18 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Raven Host Marauder",
							ability = L"Castigation",
							value = 56,
							mit = 18,
							crit = true,
							time = 64936976708,
						},
						
						{
							str = L"Your attack hits Raven Host Marauder for 37 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Raven Host Marauder",
							ability = L"attack",
							value = 37,
							mit = 17,
							crit = false,
							time = 64936976708,
						},
						
						{
							str = L"Your Bludgeon critically hits Raven Host Marauder for 89 damage. (33 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Raven Host Marauder",
							ability = L"Bludgeon",
							value = 89,
							mit = 33,
							crit = true,
							time = 64936976709,
						},
					},
					total = 233,
					objectTime = 64936976704,
					data = 
					{
						
						{
							str = L"Your attack hits Raven Host Marauder for 37 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976719,
							object = L"Raven Host Marauder",
							value = 37,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
						
						{
							str = L"Your Bludgeon hits Raven Host Marauder for 63 damage. (23 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976720,
							object = L"Raven Host Marauder",
							value = 63,
							crit = false,
							mit = 23,
							ability = L"Bludgeon",
						},
						
						{
							str = L"Your Divine Strike hits Raven Host Marauder for 48 damage. (20 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976721,
							object = L"Raven Host Marauder",
							value = 48,
							crit = false,
							mit = 20,
							ability = L"Divine Strike",
						},
						
						{
							str = L"Your attack hits Raven Host Marauder for 37 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976722,
							object = L"Raven Host Marauder",
							value = 37,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
						
						{
							str = L"Your Divine Strike hits Raven Host Marauder for 48 damage. (20 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976724,
							object = L"Raven Host Marauder",
							value = 48,
							crit = false,
							mit = 20,
							ability = L"Divine Strike",
						},
					},
					totalAoe = 233,
					valueMaxData = 
					{
						
						{
							str = L"Your Divine Strike hits Raven Host Marauder for 42 damage. (20 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976704,
							object = L"Raven Host Marauder",
							value = 42,
							crit = false,
							mit = 20,
							ability = L"Divine Strike",
						},
						
						{
							str = L"Your Sigmar's Fist hits Raven Host Marauder for 54 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976706,
							object = L"Raven Host Marauder",
							value = 54,
							crit = false,
							mit = 17,
							ability = L"Sigmar's Fist",
						},
						
						{
							str = L"Your attack hits Raven Host Marauder for 40 damage. (14 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976706,
							object = L"Raven Host Marauder",
							value = 40,
							crit = false,
							mit = 14,
							ability = L"attack",
						},
						
						{
							str = L"Your Castigation critically hits Raven Host Marauder for 56 damage. (18 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976708,
							object = L"Raven Host Marauder",
							value = 56,
							crit = true,
							mit = 18,
							ability = L"Castigation",
						},
						
						{
							str = L"Your attack hits Raven Host Marauder for 37 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976708,
							object = L"Raven Host Marauder",
							value = 37,
							crit = false,
							mit = 17,
							ability = L"attack",
						},
						
						{
							str = L"Your Bludgeon critically hits Raven Host Marauder for 89 damage. (33 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							time = 64936976709,
							object = L"Raven Host Marauder",
							value = 89,
							crit = true,
							mit = 33,
							ability = L"Bludgeon",
						},
					},
					valueAoe = 47,
					valueMax = 64,
					value = 47,
					object = L"Raven Host Marauder",
					valueAoeMax = 64,
				},
				
				{
					totalAoe = 0,
					valueMaxData = 
					{
					},
					valueAoe = 0,
					valueMax = 19,
					value = 32,
					data = 
					{
						
						{
							str = L"Your Divine Strike heals you for 48 points.",
							type = 3,
							ability = L"Divine Strike",
							currentTarget = false,
							time = 64936976721,
							value = 48,
							overheal = 0,
							crit = false,
							object = L"Rybert",
						},
						
						{
							str = L"Your Divine Strike heals you for 24 points. (24 overhealed)",
							type = 3,
							ability = L"Divine Strike",
							currentTarget = false,
							time = 64936976724,
							value = 24,
							overheal = 24,
							crit = false,
							object = L"Rybert",
						},
					},
					total = 96,
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Divine Strike heals you for 48 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = false,
							time = 64936976716,
							value = 48,
							overheal = 0,
							crit = false,
							object = L"you",
						},
						
						{
							str = L"Your Divine Strike heals Father Sigwald for 48 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = false,
							time = 64936976716,
							value = 48,
							overheal = 0,
							crit = false,
							object = L"Father Sigwald",
						},
						
						{
							str = L"Your Divine Strike heals Nordland Peasant for 18 points. (30 overhealed)",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = false,
							time = 64936976716,
							value = 18,
							overheal = 30,
							crit = false,
							object = L"Nordland Peasant",
						},
						
						{
							str = L"Your Divine Strike heals you for 48 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = false,
							time = 64936976721,
							value = 48,
							overheal = 0,
							crit = false,
							object = L"you",
						},
					},
					total = 0,
					valueAoe = 32,
					value = 0,
					totalAoe = 96,
					data = 
					{
						
						{
							str = L"Your Divine Strike heals you for 48 points.",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = false,
							object = L"you",
							value = 48,
							time = 64936976721,
							crit = false,
							overheal = 0,
						},
						
						{
							str = L"Your Divine Strike heals you for 24 points. (24 overhealed)",
							type = 4,
							ability = L"Divine Strike",
							currentTarget = false,
							object = L"you",
							value = 24,
							time = 64936976724,
							crit = false,
							overheal = 24,
						},
					},
					valueAoeMax = 38,
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
		64,
	},
	guardDistanceIndicatorScaleWarning = 1.5,
	timerInactiveColor = 
	{
		255,
		255,
		255,
	},
	combatLogTargetDefenseBackground = 
	{
		0,
		0,
		0,
	},
	groupIconsPetBGAlpha = 0.5,
	unitFramesGroupsDirection2 = 4,
	unitFramesScale = 1,
	combatLogLogParseErrors = true,
	soundOnNewTargetId = 500,
	unitFramesMyGroupFirst = true,
	timerActiveColor = 
	{
		255,
		255,
		75,
	},
	combatLogEnabled = true,
	combatLogTargetDefenseScale = 1,
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
	unitFramesEnabled = true,
	groupIconsShowOnMarkedPlayers = false,
	guardDistanceIndicatorAlphaWarning = 1,
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
			id = "3203",
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
				anchorFrom = "topleft",
				vertical = false,
				scale = 1,
				distHide = false,
				size = 
				{
					136,
					61,
				},
				pos = 
				{
					31,
					-1,
				},
			},
			exceptMe = false,
			name = L"Selection",
			isEnabled = true,
			playerType = 1,
			type = "selectionFrame",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3204",
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
				alpha = 0.75,
				texture = "default2",
				anchorFrom = "topleft",
				deadHide = false,
				scale = 1,
				vertical = false,
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
					64,
				},
				pos = 
				{
					31,
					-1,
				},
			},
			exceptMe = false,
			name = L"Background",
			isEnabled = true,
			playerType = 1,
			type = "panel",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3205",
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
			isEnabled = true,
			playerType = 1,
			type = "hpbar",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3206",
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
			isEnabled = true,
			playerType = 3,
			type = "apbar",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3207",
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
					37,
					0,
				},
			},
			exceptMe = false,
			name = L"Name",
			isEnabled = true,
			playerType = 1,
			type = "nameText",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3208",
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
			isEnabled = true,
			playerType = 1,
			type = "careerIcon",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3209",
			data = 
			{
				anchorTo = "bottomleft",
				scale = 0.8,
				layer = 2,
				anchorFrom = "bottomleft",
				texture = "aluminium",
				vertical = false,
				alpha = 1,
				color = 
				{
					255,
					255,
					255,
				},
				font = "font_clear_small_bold",
				align = "center",
				size = 
				{
					30,
					20,
				},
				pos = 
				{
					12,
					5,
				},
			},
			exceptMe = false,
			name = L"Level",
			isEnabled = true,
			playerType = 1,
			type = "levelText",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3210",
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
			isEnabled = true,
			playerType = 1,
			type = "groupLeaderIcon",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3211",
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
			isEnabled = true,
			playerType = 3,
			type = "moraleBar",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3212",
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
			isEnabled = false,
			playerType = 1,
			type = "distanceText",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3213",
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
			isEnabled = true,
			playerType = 1,
			type = "distanceBar",
			archetypes = 
			{
				false,
				false,
				false,
			},
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "3214",
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
			isEnabled = false,
			playerType = 1,
			type = "hppText",
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
	groupIconsHPColor = 
	{
		200,
		255,
		0,
	},
	groupIconsHideOnSelf = true,
	killSpamReparseChunkSize = 20,
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
	unitFramesGroupsPadding1 = 40,
	guardDistanceIndicator = 2,
	scenarioInfoEnabled = true,
	groupIconsPetOffset = 
	{
		0,
		20,
	},
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
		color = 
		{
			r = 255,
			g = 0,
			b = 0,
		},
		targetOnClick = true,
		font = "font_clear_large_bold",
		name = L"",
		layer = 3,
		display = 1,
		offsetY = 50,
		neverExpire = false,
		permanent = false,
	},
	groupIconsOtherGroupsHPColor = 
	{
		200,
		255,
		255,
	},
	unitFramesSortingEnabled = true,
	stateMachineThrottle = 0.3,
}




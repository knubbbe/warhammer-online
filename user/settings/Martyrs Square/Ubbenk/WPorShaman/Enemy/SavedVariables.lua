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
	groupIconsEnabled = false,
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
			id = "7073",
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
			id = "7074",
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
			id = "7075",
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
			id = "7076",
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
			id = "7077",
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
			id = "7078",
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
			id = "7079",
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
			id = "7080",
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
			id = "7081",
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
			id = "7082",
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
			id = "7083",
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
			id = "7084",
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
			id = "7085",
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
			id = "7086",
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
			id = "7087",
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
			id = "7088",
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
			id = "7089",
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
		unique = true,
		firstLetters = 4,
		showCareerIcon = true,
		canClearOnClick = false,
		permanentTargets = 
		{
		},
		id = 3055,
		targetOnClick = true,
		alpha = 0.5,
		text = L"G",
		layer = 3,
		font = "font_default_text_giant",
		name = L"",
		scale = 0.6,
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
			data = 
			{
				
				{
					[L"Corruption"] = 
					{
						normal = 
						{
							min = 79,
							total = 158,
							count = 2,
							abs = 0,
							max = 79,
							mit = 154,
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
					[L"Takedown"] = 
					{
						normal = 
						{
							min = 153,
							total = 364,
							count = 2,
							abs = 0,
							overheal = 0,
							mit = 53,
							max = 211,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 146,
							total = 146,
							count = 1,
							abs = 27,
							max = 146,
							mit = 26,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Burn, Heretic!"] = 
					{
						normal = 
						{
							min = 161,
							total = 161,
							count = 1,
							abs = 0,
							max = 161,
							mit = 19,
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
					[L"Torment"] = 
					{
						normal = 
						{
							min = 132,
							total = 292,
							count = 2,
							abs = 0,
							max = 160,
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
					[L"Rune of Striking"] = 
					{
						normal = 
						{
							min = 0,
							total = 501,
							count = 4,
							abs = 135,
							max = 197,
							mit = 199,
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
					[L"Trip 'Em Up"] = 
					{
						normal = 
						{
							min = 75,
							total = 263,
							count = 3,
							abs = 0,
							max = 111,
							mit = 207,
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
					[L"Flurry"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 512,
							max = 195,
							min = 127,
							count = 3,
							abs = 0,
							mit = 55,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
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
							min = 0,
							total = 309,
							count = 13,
							abs = 149,
							max = 46,
							mit = 476,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 31,
							total = 31,
							count = 1,
							abs = 0,
							max = 31,
							mit = 30,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Spiked Squig's ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 1,
							abs = 49,
							mit = 39,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								name = L"Kakzu",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								name = L"Kakzu",
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
							total = 33,
							max = 33,
							min = 33,
							count = 1,
							abs = 0,
							mit = 16,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
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
					[L"Spiral-Fletched Arrow"] = 
					{
						normal = 
						{
							min = 153,
							total = 338,
							count = 2,
							overheal = 0,
							abs = 0,
							max = 185,
							mit = 70,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 18,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 353,
							total = 353,
							count = 1,
							abs = 0,
							max = 353,
							mit = 52,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Rampaging Siphon"] = 
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
					[L"Covenant of Vitality"] = 
					{
						normal = 
						{
							min = 80,
							total = 1201,
							count = 14,
							abs = 0,
							max = 88,
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
					[L"Eagle Eye"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 275,
							count = 2,
							abs = 329,
							max = 275,
							mit = 48,
							min = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 388,
							total = 388,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 49,
							max = 388,
						},
						parry = 0,
					},
					[L"Demolition"] = 
					{
						normal = 
						{
							min = 92,
							total = 378,
							count = 4,
							abs = 0,
							max = 97,
							mit = 236,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 138,
							total = 138,
							count = 1,
							abs = 0,
							max = 138,
							mit = 82,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Explodin' Arrer"] = 
					{
						normal = 
						{
							min = 28,
							total = 135,
							count = 3,
							abs = 0,
							max = 107,
							mit = 47,
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
					[L"Spiked Squig's Poisoned Spine"] = 
					{
						normal = 
						{
							min = 13,
							total = 272,
							count = 18,
							abs = 0,
							max = 20,
							mit = 304,
							overheal = 0,
						},
						dodge = 1,
						disrupt = 0,
						block = 1,
						crit = 
						{
							min = 23,
							total = 101,
							count = 4,
							abs = 0,
							max = 27,
							mit = 86,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Shield Rush"] = 
					{
						normal = 
						{
							min = 118,
							total = 118,
							count = 1,
							abs = 0,
							max = 118,
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
					[L"Away With Ye"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 119,
							max = 119,
							min = 119,
							count = 1,
							abs = 0,
							mit = 30,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 1,
								isFriendly = false,
								id = 2980,
								level = 15,
								hp = 33,
								name = L"Jaliidann",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 1,
								isFriendly = false,
								id = 2980,
								level = 15,
								hp = 33,
								name = L"Jaliidann",
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
					[L"Jagged Edge"] = 
					{
						normal = 
						{
							min = 87,
							total = 435,
							count = 5,
							abs = 0,
							max = 87,
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
					[L"Acid Bomb"] = 
					{
						normal = 
						{
							min = 20,
							total = 724,
							count = 19,
							abs = 0,
							max = 48,
							mit = 204,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 31,
							total = 327,
							count = 6,
							abs = 0,
							max = 75,
							mit = 73,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Guarded Attack"] = 
					{
						normal = 
						{
							min = 0,
							total = 96,
							count = 3,
							abs = 62,
							max = 70,
							mit = 77,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 1,
								isFriendly = false,
								id = 2980,
								level = 15,
								hp = 33,
								name = L"Jaliidann",
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
					[L"Acid Arrow"] = 
					{
						normal = 
						{
							min = 173,
							total = 383,
							count = 2,
							abs = 0,
							overheal = 0,
							mit = 69,
							max = 210,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Stop Runnin!"] = 
					{
						normal = 
						{
							min = 121,
							total = 121,
							count = 1,
							abs = 0,
							max = 121,
							mit = 78,
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
					[L"Castigation"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 110,
							max = 48,
							min = 4,
							count = 4,
							abs = 0,
							mit = 47,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
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
					[L"Enliven Sap"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1544,
							max = 74,
							min = 34,
							count = 26,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 675,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
							mit = 750,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 705,
								level = 4,
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
							total = 300,
							max = 113,
							min = 83,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 643,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 83,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 570,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Bombardment Turret's Shock Grenade"] = 
					{
						normal = 
						{
							min = 0,
							total = 354,
							count = 10,
							abs = 67,
							max = 99,
							mit = 166,
							overheal = 0,
						},
						dodge = 3,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Spider Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2378,
							abs = 280,
							min = 0,
							count = 53,
							max = 84,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Deep Root Spider",
								isFriendly = false,
								id = 455,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 3411,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Root Spider",
								isFriendly = false,
								id = 368,
								level = 7,
								hp = 100,
								career = 0,
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
					[L"Shield of Reprisal"] = 
					{
						normal = 
						{
							min = 47,
							total = 173,
							count = 2,
							abs = 0,
							max = 126,
							mit = 55,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 1,
								isFriendly = false,
								id = 2980,
								level = 15,
								hp = 33,
								name = L"Jaliidann",
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
					[L"Cleave Soul"] = 
					{
						normal = 
						{
							min = 50,
							total = 438,
							count = 7,
							abs = 0,
							max = 70,
							mit = 424,
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
					[L"Gun Turret's Machine Gun"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 51,
							max = 51,
							min = 0,
							count = 6,
							abs = 165,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 164,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 2,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 77,
							total = 77,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 56,
							max = 77,
						},
						parry = 0,
					},
					[L"Rune of Might"] = 
					{
						normal = 
						{
							min = 0,
							total = 0,
							count = 1,
							abs = 101,
							max = 0,
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
					[L"Shield Sweep"] = 
					{
						normal = 
						{
							min = 46,
							total = 417,
							count = 5,
							abs = 0,
							max = 102,
							mit = 128,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 1,
								isFriendly = false,
								id = 2980,
								level = 15,
								hp = 91,
								name = L"Jaliidann",
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
					[L"Run 'n Shoot"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 61,
							max = 61,
							min = 61,
							count = 1,
							abs = 53,
							mit = 68,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								name = L"Kakzu",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								name = L"Kakzu",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 313,
							max = 157,
							min = 156,
							count = 2,
							abs = 0,
							mit = 168,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								name = L"Kakzu",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								name = L"Kakzu",
							},
						},
						parry = 0,
					},
					[L"Warp Reality"] = 
					{
						normal = 
						{
							min = 81,
							total = 81,
							count = 1,
							abs = 0,
							max = 81,
							mit = 32,
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
					[L"Sunder"] = 
					{
						normal = 
						{
							min = 80,
							total = 240,
							count = 3,
							abs = 0,
							max = 80,
							mit = 102,
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
					[L"Flame Arrow"] = 
					{
						normal = 
						{
							min = 61,
							total = 246,
							count = 3,
							abs = 0,
							max = 122,
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
					[L"Cut Ya!"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							count = 1,
							abs = 0,
							mit = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Thorny Paw"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2766,
							max = 58,
							min = 0,
							count = 122,
							abs = 114,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 666,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 1203,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 667,
								level = 4,
								hp = 46,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 226,
							max = 83,
							min = 14,
							count = 7,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 552,
								level = 4,
								hp = 53,
								isFriendly = false,
							},
							mit = 85,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tenacious Spite",
								id = 705,
								level = 4,
								hp = 0,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Broadhead Arrow"] = 
					{
						normal = 
						{
							min = 41,
							total = 929,
							count = 10,
							overheal = 0,
							abs = 0,
							max = 119,
							mit = 186,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 18,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 58,
							total = 618,
							count = 5,
							overheal = 0,
							abs = 0,
							max = 157,
							mit = 123,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 18,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Precision Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 400,
							max = 100,
							min = 100,
							count = 4,
							abs = 0,
							mit = 132,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 542,
								level = 6,
								hp = 100,
								name = L"Ticklegiggles",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 542,
								level = 6,
								hp = 100,
								name = L"Ticklegiggles",
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
					[L"Consume Strength"] = 
					{
						normal = 
						{
							min = 45,
							total = 163,
							count = 3,
							abs = 0,
							max = 63,
							mit = 168,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 78,
							total = 78,
							count = 1,
							abs = 0,
							max = 78,
							mit = 66,
							overheal = 0,
						},
						parry = 0,
					},
					[L"ability"] = 
					{
						normal = 
						{
							min = 0,
							total = 194,
							count = 117,
							overheal = 0,
							max = 72,
							mit = 2223,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Brozarg",
								isFriendly = false,
								id = 1900,
								level = 9,
								hp = 100,
								career = 0,
							},
							abs = 6351,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Farty Squig Sub"] = 
					{
						normal = 
						{
							min = 112,
							total = 112,
							count = 1,
							abs = 0,
							max = 112,
							mit = 79,
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
					[L"Pulverizing Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 576,
							max = 264,
							min = 81,
							count = 3,
							abs = 142,
							mit = 80,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
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
					[L"Sigmar's Fist"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 137,
							max = 76,
							min = 26,
							count = 3,
							abs = 0,
							mit = 70,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
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
					[L"Rune of Fire"] = 
					{
						normal = 
						{
							min = 0,
							total = 204,
							count = 3,
							abs = 78,
							max = 105,
							mit = 122,
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
					[L"Bombardment Turret's ability"] = 
					{
						normal = 
						{
							min = 0,
							total = 0,
							count = 6,
							abs = 15,
							max = 0,
							mit = 31,
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
					[L"Stone Breaker"] = 
					{
						normal = 
						{
							min = 60,
							total = 155,
							count = 2,
							abs = 0,
							max = 95,
							mit = 67,
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
					[L"Heavy Blow"] = 
					{
						normal = 
						{
							min = 12,
							total = 159,
							count = 6,
							abs = 0,
							max = 63,
							mit = 121,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 18,
							total = 78,
							count = 2,
							abs = 0,
							max = 60,
							mit = 47,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Skull Thumper"] = 
					{
						normal = 
						{
							min = 48,
							total = 449,
							count = 6,
							abs = 0,
							max = 113,
							mit = 137,
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
							min = 81,
							total = 589,
							count = 7,
							max = 91,
							abs = 0,
							mit = 300,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 239,
							max = 124,
							min = 115,
							count = 2,
							abs = 0,
							mit = 103,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
						},
						parry = 0,
					},
					[L"What Blocka?"] = 
					{
						normal = 
						{
							min = 99,
							total = 99,
							count = 3,
							abs = 0,
							max = 99,
							mit = 109,
							overheal = 0,
						},
						dodge = 2,
						disrupt = 0,
						block = 0,
						crit = 
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
							total = 49380,
							abs = 0,
							min = 10,
							count = 963,
							max = 408,
							mit = 29629,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Goren Stonebrow",
								isFriendly = false,
								id = 3144,
								level = 7,
								hp = 97,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1229,
								level = 5,
								hp = 100,
								name = L"Barrens Mauler",
							},
						},
						dodge = 1,
						disrupt = 0,
						block = 10,
						crit = 
						{
							overheal = 0,
							total = 7246,
							count = 102,
							min = 20,
							max = 445,
							abs = 0,
							mit = 4692,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
						},
						parry = 8,
					},
					[L"Grim Slash"] = 
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
							min = 412,
							total = 412,
							count = 1,
							abs = 0,
							max = 412,
							mit = 68,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Weight of Guilt"] = 
					{
						normal = 
						{
							min = 137,
							total = 137,
							count = 1,
							abs = 0,
							max = 137,
							mit = 38,
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
					[L"Blazing Blade"] = 
					{
						normal = 
						{
							min = 34,
							total = 708,
							count = 9,
							abs = 0,
							max = 125,
							mit = 97,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 42,
							total = 196,
							count = 2,
							abs = 0,
							max = 154,
							mit = 26,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Clobber"] = 
					{
						normal = 
						{
							min = 0,
							total = 292,
							count = 4,
							abs = 136,
							max = 105,
							mit = 287,
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
					[L"Lacerate"] = 
					{
						normal = 
						{
							min = 5,
							total = 184,
							count = 13,
							abs = 0,
							max = 48,
							mit = 201,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 9,
							total = 9,
							count = 1,
							abs = 0,
							max = 9,
							mit = 15,
							overheal = 0,
						},
						parry = 1,
					},
					[L"Fervor"] = 
					{
						normal = 
						{
							min = 32,
							total = 976,
							count = 12,
							abs = 65,
							max = 126,
							mit = 165,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 9,
								isFriendly = false,
								id = 688,
								level = 6,
								hp = 53,
								name = L"Starkadder",
							},
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 212,
							max = 111,
							min = 101,
							count = 2,
							abs = 0,
							mit = 51,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 9,
								isFriendly = false,
								id = 688,
								level = 6,
								hp = 53,
								name = L"Starkadder",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 9,
								isFriendly = false,
								id = 688,
								level = 6,
								hp = 53,
								name = L"Starkadder",
							},
						},
						parry = 0,
					},
					[L"Rune of Immolation"] = 
					{
						normal = 
						{
							min = 60,
							total = 602,
							count = 9,
							abs = 0,
							max = 81,
							mit = 237,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 88,
							total = 88,
							count = 1,
							abs = 0,
							max = 88,
							mit = 43,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Blessed Bullets of Purity"] = 
					{
						normal = 
						{
							min = 226,
							total = 226,
							count = 1,
							abs = 0,
							max = 226,
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
					[L"Bombardment Turret's attack"] = 
					{
						normal = 
						{
							min = 2,
							total = 90,
							count = 17,
							abs = 0,
							max = 9,
							mit = 196,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								isFriendly = false,
								id = 3013,
								level = 8,
								hp = 95,
								name = L"Rhizomatic",
							},
							overheal = 0,
						},
						dodge = 4,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 5,
							total = 24,
							count = 2,
							abs = 0,
							max = 19,
							mit = 35,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Gun Blast"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2866,
							count = 9,
							abs = 0,
							max = 354,
							mit = 695,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								isFriendly = false,
								id = 3220,
								level = 8,
								hp = 47,
								name = L"Rhizomatic",
							},
							min = 249,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 185,
							total = 3062,
							count = 7,
							abs = 0,
							max = 543,
							mit = 639,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								isFriendly = false,
								id = 3013,
								level = 8,
								hp = 95,
								name = L"Rhizomatic",
							},
							overheal = 0,
						},
						parry = 0,
					},
					[L"Point-Blank"] = 
					{
						normal = 
						{
							min = 293,
							total = 586,
							count = 2,
							abs = 0,
							max = 293,
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
							min = 157,
							total = 340,
							count = 3,
							abs = 0,
							max = 183,
							mit = 275,
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
					[L"Envenomed Fangs"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2243,
							abs = 0,
							min = 7,
							count = 116,
							max = 76,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Root Spider",
								isFriendly = false,
								id = 462,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 2689,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1402,
								level = 9,
								hp = 93,
								name = L"Purple Crawler",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 450,
							count = 11,
							min = 9,
							abs = 0,
							max = 83,
							mit = 667,
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
					[L"Firebomb"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 738,
							max = 229,
							min = 0,
							count = 5,
							abs = 342,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 242,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 288,
							total = 288,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 61,
							max = 288,
						},
						parry = 0,
					},
					[L"Guard"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 103,
							max = 40,
							min = 21,
							count = 4,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 1,
								isFriendly = true,
								id = 1741,
								level = 11,
								hp = 79,
								name = L"Ironknubbe",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 1,
								isFriendly = true,
								id = 1741,
								level = 11,
								hp = 77,
								name = L"Ironknubbe",
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
					[L"Spiked Squig's attack"] = 
					{
						normal = 
						{
							min = 35,
							total = 761,
							count = 18,
							abs = 0,
							max = 66,
							mit = 809,
							overheal = 0,
						},
						dodge = 1,
						disrupt = 0,
						block = 1,
						crit = 
						{
							min = 82,
							total = 82,
							count = 1,
							abs = 0,
							max = 82,
							mit = 96,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Slow Down"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 1,
							abs = 145,
							mit = 20,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
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
					[L"Binding Grudge"] = 
					{
						normal = 
						{
							min = 63,
							total = 511,
							count = 6,
							overheal = 0,
							abs = 0,
							max = 123,
							mit = 97,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 1,
								isFriendly = false,
								id = 2980,
								level = 15,
								hp = 33,
								name = L"Jaliidann",
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
							total = 1268,
							max = 112,
							min = 0,
							count = 18,
							abs = 260,
							mit = 559,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Hungry Grove Wolf",
								isFriendly = false,
								id = 1875,
								level = 8,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Hungry Grove Wolf",
								isFriendly = false,
								id = 1875,
								level = 8,
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
							total = 148,
							abs = 0,
							min = 148,
							count = 1,
							max = 148,
							mit = 43,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Grove Wolf",
								isFriendly = false,
								id = 1841,
								level = 7,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Grove Wolf",
								isFriendly = false,
								id = 1841,
								level = 7,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Consume Essence"] = 
					{
						normal = 
						{
							min = 38,
							total = 147,
							count = 3,
							abs = 0,
							max = 61,
							mit = 132,
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
					[L"Bombardment Turret's High-Explosive Grenade"] = 
					{
						normal = 
						{
							min = 0,
							total = 102,
							count = 5,
							abs = 54,
							max = 56,
							mit = 65,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								isFriendly = false,
								id = 3013,
								level = 8,
								hp = 95,
								name = L"Rhizomatic",
							},
							overheal = 0,
						},
						dodge = 1,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 83,
							total = 83,
							count = 1,
							abs = 0,
							max = 83,
							mit = 38,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Vengeful Strike"] = 
					{
						normal = 
						{
							min = 28,
							total = 139,
							count = 2,
							abs = 0,
							max = 111,
							mit = 66,
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
							total = 493,
							count = 15,
							max = 80,
							abs = 269,
							mit = 383,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Cave Bat",
								isFriendly = false,
								id = 1452,
								level = 7,
								hp = 100,
								career = 0,
							},
							min = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
							min = 53,
							total = 561,
							count = 7,
							abs = 0,
							max = 103,
							mit = 330,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 87,
							total = 87,
							count = 1,
							abs = 0,
							max = 87,
							mit = 53,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Gun Turret's attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 10,
							max = 5,
							min = 5,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 30,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
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
					[L"Gun Turret's ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							max = 0,
							min = 0,
							count = 1,
							abs = 5,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 15,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 4,
								name = L"Runolf",
								id = 1125,
								level = 4,
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
							min = 44,
							total = 214,
							count = 4,
							abs = 0,
							max = 61,
							mit = 192,
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
					[L"Swooping Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1446,
							abs = 285,
							min = 0,
							count = 38,
							max = 81,
							mit = 910,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Cave Bat",
								isFriendly = false,
								id = 1495,
								level = 7,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Mine Bat",
								isFriendly = false,
								id = 2312,
								level = 4,
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
							total = 249,
							abs = 0,
							min = 61,
							count = 3,
							max = 121,
							mit = 108,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Cave Bat",
								isFriendly = false,
								id = 1453,
								level = 7,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Mine Bat",
								isFriendly = false,
								id = 2312,
								level = 4,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Gore"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 603,
							abs = 0,
							min = 86,
							count = 6,
							max = 115,
							mit = 168,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Kron Komar Boar",
								isFriendly = false,
								id = 1649,
								level = 8,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Kron Komar Boar",
								isFriendly = false,
								id = 1649,
								level = 8,
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
					[L"Precarious Assault"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 294,
							max = 294,
							min = 294,
							count = 1,
							abs = 0,
							mit = 33,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 2,
								isFriendly = false,
								id = 3704,
								level = 15,
								hp = 25,
								name = L"Andrinironward",
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
					[L"Blunderbuss Blast"] = 
					{
						normal = 
						{
							min = 0,
							total = 107,
							count = 4,
							abs = 152,
							max = 57,
							mit = 83,
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
							min = 64,
							total = 256,
							count = 4,
							abs = 0,
							max = 64,
							mit = 80,
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
					[L"Shield Sweep"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1002,
							abs = 0,
							min = 57,
							count = 16,
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
							mit = 537,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1474,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 181,
							abs = 0,
							min = 87,
							count = 2,
							max = 94,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1401,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
							mit = 97,
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
					[L"Brain Bursta"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 9967,
							max = 233,
							min = 6,
							count = 91,
							abs = 166,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							mit = 3939,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 637,
								level = 14,
								hp = 79,
								name = L"Skypse",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 1436,
							max = 208,
							min = 119,
							count = 9,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Komar Hammerstriker",
								id = 454,
								level = 5,
								hp = 100,
								career = 0,
							},
							mit = 511,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Scartusk Hunta",
								isFriendly = false,
								id = 1948,
								level = 7,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"I'll Take That!"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 8630,
							max = 184,
							min = 46,
							count = 99,
							abs = 25,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							mit = 4072,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 625,
								level = 7,
								hp = 86,
								name = L"Knerps",
							},
						},
						dodge = 0,
						disrupt = 1,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 1272,
							max = 161,
							min = 87,
							count = 10,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Komar Hammerstriker",
								id = 539,
								level = 6,
								hp = 75,
								career = 0,
							},
							mit = 497,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Komar Hammerstriker",
								isFriendly = false,
								id = 821,
								level = 7,
								hp = 93,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Axe Toss"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 122,
							max = 17,
							min = 15,
							count = 8,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							mit = 223,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1474,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
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
					[L"Frozen Touch"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 160,
							max = 85,
							min = 75,
							count = 2,
							abs = 0,
							mit = 50,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 637,
								level = 14,
								hp = 79,
								name = L"Skypse",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 636,
								level = 12,
								hp = 100,
								name = L"Heki",
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
							total = 1353,
							max = 63,
							min = 46,
							count = 31,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							mit = 927,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								name = L"Tufftoof",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 344,
							abs = 0,
							min = 64,
							count = 5,
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
							mit = 249,
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
						parry = 5,
					},
					[L"Inspiring Attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1613,
							max = 77,
							min = 57,
							count = 28,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							mit = 1001,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1440,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 203,
							abs = 0,
							min = 79,
							count = 2,
							max = 124,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								name = L"Tufftoof",
							},
							mit = 121,
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
						parry = 2,
					},
					[L"Vengeful Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1143,
							max = 62,
							min = 46,
							count = 23,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							mit = 789,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1440,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 295,
							abs = 0,
							min = 64,
							count = 4,
							max = 82,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1293,
								level = 7,
								hp = 100,
								name = L"Frenzied Bloody Sun Drumma",
							},
							mit = 172,
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
					[L"'Ere We Go!"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 30,
							max = 30,
							min = 30,
							count = 1,
							abs = 0,
							mit = 10,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 625,
								level = 7,
								hp = 86,
								name = L"Knerps",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 625,
								level = 7,
								hp = 86,
								name = L"Knerps",
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
					[L"Binding Grudge"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1978,
							abs = 0,
							min = 20,
							count = 40,
							max = 84,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							mit = 825,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1440,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 435,
							abs = 0,
							min = 44,
							count = 6,
							max = 119,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								name = L"Mogwai",
							},
							mit = 167,
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
					[L"Bleed Fer' Me"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2646,
							count = 62,
							max = 65,
							abs = 0,
							mit = 1405,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Komar Hammerstriker",
								id = 618,
								level = 6,
								hp = 100,
								career = 0,
							},
							min = 26,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 447,
							count = 7,
							max = 89,
							abs = 0,
							mit = 196,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Komar Hammerstriker",
								id = 618,
								level = 6,
								hp = 100,
								career = 0,
							},
							min = 37,
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
							count = 1,
							abs = 65,
							mit = 8,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 9,
								isFriendly = false,
								id = 688,
								level = 6,
								hp = 53,
								name = L"Starkadder",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 9,
								isFriendly = false,
								id = 688,
								level = 6,
								hp = 53,
								name = L"Starkadder",
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
					[L"Life Leaka"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 23912,
							count = 493,
							abs = 0,
							max = 120,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							mit = 10303,
							min = 25,
						},
						dodge = 0,
						disrupt = 2,
						block = 2,
						crit = 
						{
							min = 41,
							total = 4529,
							count = 64,
							overheal = 0,
							abs = 0,
							max = 160,
							mit = 1716,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Brozarg",
								isFriendly = false,
								id = 1900,
								level = 9,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Tooth of Tzeentch"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 101,
							max = 52,
							min = 49,
							count = 2,
							abs = 0,
							mit = 31,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 3,
								isFriendly = false,
								id = 2958,
								level = 10,
								hp = 100,
								name = L"Valeroth",
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 1,
								isFriendly = false,
								id = 2875,
								level = 15,
								hp = 87,
								name = L"Jaliidann",
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
					[L"Shield of Reprisal"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 171,
							abs = 0,
							min = 83,
							count = 2,
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
							mit = 86,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 811,
								level = 7,
								hp = 100,
								name = L"Bloody Sun Hunta",
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
					[L"Bunch o' Waaagh"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 38400,
							max = 291,
							min = 0,
							count = 324,
							abs = 161,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							mit = 16157,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 636,
								level = 12,
								hp = 100,
								name = L"Heki",
							},
						},
						dodge = 0,
						disrupt = 2,
						block = 2,
						crit = 
						{
							overheal = 0,
							total = 6601,
							max = 391,
							min = 113,
							count = 36,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3266,
								level = 6,
								hp = 88,
								name = L"Wolverheal",
							},
							mit = 2222,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Deep Root Spider",
								isFriendly = false,
								id = 367,
								level = 7,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Heavy Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 7276,
							max = 83,
							min = 9,
							count = 181,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								name = L"Tufftoof",
							},
							mit = 6122,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1282,
								level = 7,
								hp = 100,
								name = L"Bloody Sun Shaman",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 981,
							max = 97,
							min = 24,
							count = 18,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1401,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
							mit = 786,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1474,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						parry = 2,
					},
					[L"Grudging Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1091,
							max = 70,
							min = 46,
							count = 20,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								name = L"Tufftoof",
							},
							mit = 726,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								name = L"Tufftoof",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 77,
							max = 77,
							min = 77,
							count = 1,
							abs = 0,
							mit = 46,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1433,
								level = 8,
								hp = 100,
								name = L"Dog Ambusher",
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 1433,
								level = 8,
								hp = 100,
								name = L"Dog Ambusher",
							},
						},
						parry = 0,
					},
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 13399,
							max = 77,
							min = 19,
							count = 330,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 12,
								isFriendly = false,
								id = 3046,
								level = 6,
								hp = 100,
								name = L"Wolverheal",
							},
							mit = 11529,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								isFriendly = false,
								id = 4124,
								level = 8,
								hp = 100,
								name = L"Throll Skraasgrisson",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 2,
						crit = 
						{
							overheal = 0,
							total = 2251,
							abs = 0,
							min = 16,
							count = 38,
							max = 87,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Komar Runesmith",
								id = 1539,
								level = 7,
								hp = 90,
								career = 0,
							},
							mit = 1742,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 10,
								isFriendly = false,
								id = 625,
								level = 7,
								hp = 78,
								name = L"Knerps",
							},
						},
						parry = 17,
					},
				},
				
				{
					[L"Alagos - Consume Essence"] = 
					{
						normal = 
						{
							min = 45,
							total = 0,
							count = 1,
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
					[L"Hhirio - Gork'll Fix It"] = 
					{
						normal = 
						{
							min = 187,
							total = 187,
							count = 1,
							abs = 0,
							max = 187,
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
					[L"Badikuz - Lingering Gork'll Fix It"] = 
					{
						normal = 
						{
							min = 44,
							total = 220,
							count = 5,
							abs = 0,
							max = 44,
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
					[L"Ubbenk - Bigger, Better, An' Greener"] = 
					{
						normal = 
						{
							overheal = 1379,
							total = 4421,
							max = 660,
							min = 397,
							count = 12,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 57,
								name = L"Ubbenk",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 3376,
								level = 8,
								hp = 66,
								name = L"Ubbenk",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 1003,
							max = 1003,
							min = 1003,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 48,
								name = L"Ubbenk",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 48,
								name = L"Ubbenk",
							},
						},
						parry = 0,
					},
					[L"Hhan - Grungni's Gift"] = 
					{
						normal = 
						{
							min = 196,
							total = 1372,
							count = 7,
							abs = 0,
							max = 196,
							mit = 0,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 275,
							total = 567,
							count = 2,
							abs = 0,
							max = 292,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Hhan - Rune of Regeneration"] = 
					{
						normal = 
						{
							min = 172,
							total = 1636,
							count = 10,
							abs = 0,
							max = 172,
							mit = 0,
							overheal = 84,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 236,
							total = 736,
							count = 3,
							abs = 0,
							max = 257,
							mit = 0,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Hhan - Rune of Shielding"] = 
					{
						normal = 
						{
							min = 130,
							total = 130,
							count = 1,
							abs = 0,
							max = 130,
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
					[L"Ubbenk - Divine Favor"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 880,
							max = 880,
							min = 880,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 70,
								name = L"Ubbenk",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 70,
								name = L"Ubbenk",
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
					[L"Ubbenk - Gork'll Fix It"] = 
					{
						normal = 
						{
							overheal = 1763,
							total = 6087,
							max = 212,
							min = 96,
							count = 56,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 73,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 80,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 383,
							total = 804,
							max = 267,
							min = 130,
							count = 7,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 497,
								level = 7,
								hp = 70,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 65,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Badikuz - Gork'll Fix It"] = 
					{
						normal = 
						{
							min = 183,
							total = 183,
							count = 1,
							abs = 0,
							max = 183,
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
					[L"Littlegit - Rampaging Siphon"] = 
					{
						normal = 
						{
							min = 1130,
							total = 190,
							count = 1,
							abs = 0,
							max = 1130,
							mit = 0,
							overheal = 940,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Hhirio - 'Ey, Quit Bleedin'"] = 
					{
						normal = 
						{
							min = 179,
							total = 895,
							count = 5,
							abs = 0,
							max = 179,
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
					[L"Ubbenk - I'll Take That!"] = 
					{
						normal = 
						{
							overheal = 6338,
							total = 6327,
							max = 276,
							min = 93,
							count = 91,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 100,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ubbenk",
								isFriendly = true,
								id = 116,
								level = 9,
								hp = 94,
								career = 7,
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
					[L"Halimaa - Flash of Chaos"] = 
					{
						normal = 
						{
							min = 178,
							total = 212,
							count = 2,
							abs = 0,
							max = 178,
							mit = 0,
							overheal = 144,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Ubbenk - Lingering Gork'll Fix It"] = 
					{
						normal = 
						{
							overheal = 2439,
							total = 5891,
							max = 54,
							min = 23,
							count = 250,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 100,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 74,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 507,
							total = 873,
							max = 74,
							min = 34,
							count = 28,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 85,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 94,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"Hhirio - Lingering Gork'll Fix It"] = 
					{
						normal = 
						{
							min = 47,
							total = 91,
							count = 4,
							abs = 0,
							max = 47,
							mit = 0,
							overheal = 97,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 69,
							total = 66,
							count = 1,
							abs = 0,
							max = 69,
							mit = 0,
							overheal = 3,
						},
						parry = 0,
					},
					[L"Alyran - Consume Essence"] = 
					{
						normal = 
						{
							min = 55,
							total = 0,
							count = 1,
							abs = 0,
							overheal = 55,
							mit = 0,
							max = 55,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Ubbenk - 'Ey, Quit Bleedin'"] = 
					{
						normal = 
						{
							overheal = 26503,
							total = 25780,
							max = 265,
							min = 98,
							count = 379,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 100,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 7,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 4100,
							total = 5989,
							max = 404,
							min = 135,
							count = 49,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 100,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 794,
								level = 7,
								hp = 100,
								name = L"Ubbenk",
							},
						},
						parry = 0,
					},
					[L"Hhirio - Bleed Fer' Me"] = 
					{
						normal = 
						{
							min = 105,
							total = 218,
							count = 2,
							abs = 0,
							max = 113,
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
					[L"Excedryn - Flash of Chaos"] = 
					{
						normal = 
						{
							min = 226,
							total = 678,
							count = 3,
							abs = 0,
							max = 226,
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
					[L"Halimaa - Tzeentch's Cordial"] = 
					{
						normal = 
						{
							min = 156,
							total = 156,
							count = 2,
							abs = 0,
							max = 156,
							mit = 0,
							overheal = 156,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 216,
							total = 440,
							count = 3,
							abs = 0,
							max = 221,
							mit = 0,
							overheal = 216,
						},
						parry = 0,
					},
					[L"Ubbenk - Bleed Fer' Me"] = 
					{
						normal = 
						{
							overheal = 427,
							total = 4330,
							abs = 0,
							min = 49,
							count = 69,
							max = 134,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 10,
								hp = 0,
								career = 7,
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ubbenk",
								isFriendly = true,
								id = 116,
								level = 9,
								hp = 77,
								career = 7,
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
					[L"Badikuz - 'Ey, Quit Bleedin'"] = 
					{
						normal = 
						{
							min = 170,
							total = 881,
							count = 9,
							max = 170,
							abs = 0,
							mit = 0,
							overheal = 649,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 263,
							total = 0,
							count = 1,
							abs = 0,
							max = 263,
							mit = 0,
							overheal = 263,
						},
						parry = 0,
					},
					[L"Narissa - Feeding On Weakness"] = 
					{
						normal = 
						{
							min = 15,
							total = 392,
							count = 7,
							abs = 0,
							max = 142,
							mit = 0,
							overheal = 191,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
					[L"'Ey, Quit Bleedin'"] = 
					{
						normal = 
						{
							overheal = 45223,
							total = 46926,
							max = 265,
							min = 98,
							count = 605,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 100,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 7,
								hp = 100,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 8961,
							total = 11270,
							max = 404,
							min = 135,
							count = 87,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 100,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 794,
								level = 7,
								hp = 100,
								name = L"Ubbenk",
							},
						},
						parry = 0,
					},
					[L"Divine Favor"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 880,
							max = 880,
							min = 880,
							count = 1,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 70,
								name = L"Ubbenk",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 70,
								name = L"Ubbenk",
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
					[L"Lingering Gork'll Fix It"] = 
					{
						normal = 
						{
							min = 23,
							total = 17703,
							count = 570,
							overheal = 5168,
							abs = 0,
							max = 61,
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 74,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							min = 33,
							total = 3816,
							count = 87,
							overheal = 1309,
							abs = 0,
							max = 89,
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Brutiisimo",
								id = 415,
								level = 6,
								hp = 62,
								career = 5,
							},
						},
						parry = 0,
					},
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
					[L"Gork'll Fix It"] = 
					{
						normal = 
						{
							overheal = 2671,
							total = 18521,
							max = 218,
							min = 96,
							count = 128,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 14,
								isFriendly = true,
								id = 2952,
								level = 4,
								hp = 74,
								name = L"Wezsietato",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 80,
								isFriendly = true,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 511,
							total = 2891,
							max = 363,
							min = 130,
							count = 15,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 21,
								isFriendly = true,
								id = 2824,
								level = 12,
								hp = 47,
								name = L"Narissa",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 65,
								isFriendly = true,
							},
						},
						parry = 0,
					},
					[L"I'll Take That!"] = 
					{
						normal = 
						{
							overheal = 7430,
							total = 7463,
							max = 276,
							min = 93,
							count = 107,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 2727,
								level = 8,
								hp = 100,
								name = L"Ubbenk",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ubbenk",
								isFriendly = true,
								id = 116,
								level = 9,
								hp = 94,
								career = 7,
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
					[L"Bigger, Better, An' Greener"] = 
					{
						normal = 
						{
							min = 397,
							total = 18159,
							count = 34,
							overheal = 2585,
							abs = 0,
							max = 844,
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 7,
								isFriendly = true,
								id = 3376,
								level = 8,
								hp = 66,
								name = L"Ubbenk",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 828,
							total = 3817,
							max = 1096,
							min = 648,
							count = 5,
							abs = 0,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 21,
								isFriendly = true,
								id = 2824,
								level = 12,
								hp = 46,
								name = L"Narissa",
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Brutiisimo",
								id = 415,
								level = 6,
								hp = 62,
								career = 5,
							},
						},
						parry = 0,
					},
					[L"Bleed Fer' Me"] = 
					{
						normal = 
						{
							overheal = 611,
							total = 5274,
							abs = 0,
							min = 39,
							count = 85,
							max = 134,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 10,
								hp = 74,
								career = 7,
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Mihk",
								isFriendly = true,
								id = 2972,
								level = 9,
								hp = 77,
								career = 6,
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
					total = 240,
					objectTime = 64938744204,
					data = 
					{
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744208,
						},
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744210,
						},
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744213,
						},
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744215,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744204,
						},
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744206,
						},
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744208,
						},
						
						{
							str = L"Komar Hammerstriker's attack hits you for 60 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 60,
							mit = 23,
							crit = false,
							time = 64938744210,
						},
					},
					valueAoe = 0,
					valueMax = 40,
					value = 34,
					object = L"Komar Hammerstriker",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							ability = L"Life Leaka",
							currentTarget = true,
							object = L"Komar Hammerstriker",
							time = 64938744207,
							value = 60,
							crit = false,
							mit = 19,
							abs = 0,
						},
						
						{
							str = L"Your Bunch o' Waaagh hits Komar Hammerstriker for 148 damage. (43 mitigated)",
							type = 2,
							ability = L"Bunch o' Waaagh",
							currentTarget = true,
							object = L"Komar Hammerstriker",
							time = 64938744207,
							value = 148,
							crit = false,
							mit = 43,
							abs = 0,
						},
						
						{
							str = L"Your Bunch o' Waaagh hits Komar Hammerstriker for 148 damage. (43 mitigated)",
							type = 2,
							ability = L"Bunch o' Waaagh",
							currentTarget = true,
							object = L"Komar Hammerstriker",
							time = 64938744209,
							value = 148,
							crit = false,
							mit = 43,
							abs = 0,
						},
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							ability = L"Life Leaka",
							currentTarget = false,
							object = L"Komar Hammerstriker",
							time = 64938744210,
							value = 60,
							crit = false,
							mit = 19,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Komar Hammerstriker for 70 damage. (37 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Komar Hammerstriker",
							time = 64938744212,
							value = 70,
							crit = false,
							mit = 37,
							abs = 0,
						},
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							ability = L"Life Leaka",
							currentTarget = true,
							object = L"Komar Hammerstriker",
							time = 64938744212,
							value = 60,
							crit = false,
							mit = 19,
							abs = 0,
						},
					},
					total = 453,
					objectTime = 64938744204,
					data = 
					{
						
						{
							str = L"Your Bunch o' Waaagh hits Komar Hammerstriker for 148 damage. (43 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"Bunch o' Waaagh",
							value = 148,
							mit = 43,
							crit = false,
							time = 64938744209,
						},
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = false,
							object = L"Komar Hammerstriker",
							ability = L"Life Leaka",
							value = 60,
							mit = 19,
							crit = false,
							time = 64938744210,
						},
						
						{
							str = L"Your attack hits Komar Hammerstriker for 70 damage. (37 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 70,
							mit = 37,
							crit = false,
							time = 64938744212,
						},
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"Life Leaka",
							value = 60,
							mit = 19,
							crit = false,
							time = 64938744212,
						},
						
						{
							str = L"Your I'll Take That! hits Komar Hammerstriker for 115 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"I'll Take That!",
							value = 115,
							mit = 40,
							crit = false,
							time = 64938744214,
						},
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"Life Leaka",
							value = 60,
							mit = 19,
							crit = false,
							time = 64938744215,
						},
					},
					totalAoe = 513,
					valueMaxData = 
					{
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"Life Leaka",
							value = 60,
							mit = 19,
							crit = false,
							time = 64938744207,
						},
						
						{
							str = L"Your Bunch o' Waaagh hits Komar Hammerstriker for 148 damage. (43 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"Bunch o' Waaagh",
							value = 148,
							mit = 43,
							crit = false,
							time = 64938744207,
						},
						
						{
							str = L"Your Bunch o' Waaagh hits Komar Hammerstriker for 148 damage. (43 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"Bunch o' Waaagh",
							value = 148,
							mit = 43,
							crit = false,
							time = 64938744209,
						},
						
						{
							str = L"Your attack hits Komar Hammerstriker for 70 damage. (37 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"attack",
							value = 70,
							mit = 37,
							crit = false,
							time = 64938744212,
						},
						
						{
							str = L"Your Life Leaka hits Komar Hammerstriker for 60 damage. (19 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Komar Hammerstriker",
							ability = L"Life Leaka",
							value = 60,
							mit = 19,
							crit = false,
							time = 64938744212,
						},
					},
					valueAoe = 86,
					valueMax = 97,
					value = 76,
					valueAoeMax = 109,
					object = L"Komar Hammerstriker",
				},
				
				{
					totalAoe = 0,
					total = 172,
					object = L"Ubbenk",
					objectTime = 64938744214,
					data = 
					{
						[1] = 
						{
							overheal = 0,
							type = 3,
							ability = L"I'll Take That!",
							currentTarget = true,
							time = 64938744214,
							value = 172,
							object = L"Ubbenk",
							crit = false,
							str = L"Your I'll Take That! heals you for 172 points.",
						},
					},
				},
				
				{
					totalAoe = 172,
					total = 172,
					object = L"you",
					objectTime = 64938744214,
					data = 
					{
						[1] = 
						{
							str = L"Your I'll Take That! heals you for 172 points.",
							type = 4,
							ability = L"I'll Take That!",
							currentTarget = true,
							time = 64938744214,
							value = 172,
							overheal = 0,
							crit = false,
							object = L"you",
						},
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
	playerKills = 3,
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
		46,
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
	stateMachineThrottle = 0.3,
	groupIconsPetBGAlpha = 0.5,
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
	scenarioInfoEnabled = true,
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
		orderPoints = 403,
		timeLeft = 69.59635925293,
		pointMax = 500,
	},
	guardDistanceIndicator = 2,
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
	combatLogLogParseErrors = true,
	groupIconsTargetOnClick = true,
	version = 279,
	guardDistanceIndicatorScaleNormal = 1,
	chatThrottleDelay = 10,
	unitFramesEnabled = true,
	playerDeaths = 14,
	scenarioAlerterEnabled = true,
	guardDistanceIndicatorAlphaWarning = 1,
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
			id = "7061",
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
				texture = "rect",
				vertical = false,
				alpha = 1,
				deadHide = false,
				scale = 1,
				distHide = false,
				size = 
				{
					136,
					37,
				},
				pos = 
				{
					31,
					-1,
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
			id = "7062",
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
					37,
				},
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
			id = "7063",
			data = 
			{
				texture = "default",
				offlineHide = true,
				distAlpha = 0.3,
				anchorTo = "topleft",
				scale = 1,
				wrap = false,
				anchorFrom = "topleft",
				color = 
				{
					150,
					190,
					255,
				},
				textureFullResize = true,
				vertical = false,
				alpha = 1,
				deadHide = true,
				size = 
				{
					129,
					30,
				},
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
			id = "7064",
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
			isEnabled = true,
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
			id = "7065",
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
			id = "7066",
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
			id = "7067",
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
			id = "7068",
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
			id = "7069",
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
			isEnabled = true,
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
			id = "7070",
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
			id = "7071",
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
			id = "7072",
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
	groupIconsShowOnMarkedPlayers = false,
	groupIconsHideOnSelf = true,
	combatLogTargetDefenseTotalCalculate = 
	{
		true,
		true,
		true,
		true,
		true,
		true,
	},
	guardDistanceIndicatorClickThrough = false,
	unitFramesCount1 = 6,
	combatLogTargetDefenseTotalEnabled = false,
	combatLogIDSRowScale = 1,
	groupIconsShowOtherGroups = true,
	intercomPrivate = true,
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
	combatLogEnabled = true,
	soundOnNewTargetId = 500,
	unitFramesMyGroupFirst = true,
	combatLogTargetDefenseScale = 1,
	unitFramesGroupsDirection2 = 4,
	scenarioInfoPlayers = 
	{
		
		{
			deaths = 2,
			renown = 1568,
			healing = 3010,
			soloKills = 0,
			realm = 1,
			kills = 11,
			name = L"Jaliidann",
			career = 1,
			db = 0,
			level = 15,
			exp = 4546,
			damage = 23456,
		},
		
		{
			deaths = 1,
			renown = 2300,
			healing = 62846,
			soloKills = 0,
			realm = 2,
			kills = 30,
			name = L"Ubbenk",
			career = 7,
			db = 1,
			level = 8,
			exp = 9678,
			damage = 9465,
		},
		
		{
			deaths = 4,
			renown = 2767,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 34,
			name = L"Asaya",
			career = 24,
			db = 2,
			level = 5,
			exp = 10515,
			damage = 11036,
		},
		
		{
			deaths = 3,
			renown = 1588,
			healing = 40196,
			soloKills = 0,
			realm = 1,
			kills = 11,
			name = L"Justinseagul",
			career = 3,
			db = 1,
			level = 14,
			exp = 4932,
			damage = 11676,
		},
		
		{
			deaths = 3,
			renown = 1773,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 27,
			name = L"Diceomatic",
			career = 22,
			db = 5,
			level = 14,
			exp = 8906,
			damage = 37562,
		},
		
		{
			deaths = 4,
			renown = 1548,
			healing = 48482,
			soloKills = 0,
			realm = 1,
			kills = 11,
			name = L"Anrage",
			career = 3,
			db = 0,
			level = 13,
			exp = 4546,
			damage = 1091,
		},
		
		{
			deaths = 4,
			renown = 1059,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 13,
			name = L"Thjarges",
			career = 4,
			db = 1,
			level = 9,
			exp = 8574,
			damage = 35420,
		},
		
		{
			deaths = 0,
			renown = 2732,
			healing = 36091,
			soloKills = 0,
			realm = 2,
			kills = 39,
			name = L"Excedryn",
			career = 15,
			db = 2,
			level = 15,
			exp = 10139,
			damage = 1563,
		},
		
		{
			deaths = 1,
			renown = 2980,
			healing = 25726,
			soloKills = 0,
			realm = 2,
			kills = 39,
			name = L"Halimaa",
			career = 15,
			db = 0,
			level = 8,
			exp = 10191,
			damage = 987,
		},
		
		{
			deaths = 3,
			renown = 811,
			healing = 1700,
			soloKills = 0,
			realm = 1,
			kills = 14,
			name = L"Fabondil",
			career = 18,
			db = 4,
			level = 15,
			exp = 8882,
			damage = 26434,
		},
		
		{
			deaths = 0,
			renown = 2770,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 39,
			name = L"Alston",
			career = 16,
			db = 13,
			level = 14,
			exp = 10074,
			damage = 69717,
		},
		
		{
			deaths = 1,
			renown = 2078,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 30,
			name = L"Kuantic",
			career = 13,
			db = 2,
			level = 15,
			exp = 9744,
			damage = 18546,
		},
		
		{
			deaths = 1,
			renown = 2732,
			healing = 1900,
			soloKills = 0,
			realm = 2,
			kills = 39,
			name = L"Kiekefretter",
			career = 14,
			db = 10,
			level = 15,
			exp = 10139,
			damage = 32973,
		},
		
		{
			deaths = 3,
			renown = 717,
			healing = 7846,
			soloKills = 0,
			realm = 1,
			kills = 11,
			name = L"Mondren",
			career = 12,
			db = 0,
			level = 10,
			exp = 7378,
			damage = 12997,
		},
		
		{
			deaths = 1,
			renown = 2140,
			healing = 4646,
			soloKills = 0,
			realm = 2,
			kills = 30,
			name = L"Narissa",
			career = 21,
			db = 2,
			level = 12,
			exp = 9190,
			damage = 36522,
		},
		
		{
			deaths = 2,
			renown = 1971,
			healing = 29906,
			soloKills = 0,
			realm = 2,
			kills = 28,
			name = L"Badikuz",
			career = 7,
			db = 1,
			level = 7,
			exp = 9999,
			damage = 15671,
		},
		
		{
			deaths = 4,
			renown = 925,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 15,
			name = L"Maybelline",
			career = 10,
			db = 2,
			level = 13,
			exp = 8905,
			damage = 20833,
		},
		
		{
			deaths = 2,
			renown = 877,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 12,
			name = L"Rhizomatic",
			career = 4,
			db = 3,
			level = 8,
			exp = 7481,
			damage = 40447,
		},
		
		{
			deaths = 4,
			renown = 2176,
			healing = 28098,
			soloKills = 0,
			realm = 1,
			kills = 12,
			name = L"Tormmack",
			career = 3,
			db = 2,
			level = 7,
			exp = 6128,
			damage = 5283,
		},
		
		{
			deaths = 4,
			renown = 1561,
			healing = 24265,
			soloKills = 0,
			realm = 1,
			kills = 11,
			name = L"Valeroth",
			career = 3,
			db = 0,
			level = 10,
			exp = 4850,
			damage = 9687,
		},
		
		{
			deaths = 0,
			renown = 2962,
			healing = 27517,
			soloKills = 0,
			realm = 2,
			kills = 38,
			name = L"Gutslam",
			career = 5,
			db = 4,
			level = 7,
			exp = 10023,
			damage = 11716,
		},
		
		{
			deaths = 2,
			renown = 2037,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 25,
			name = L"Wezsietato",
			career = 14,
			db = 0,
			level = 3,
			exp = 10714,
			damage = 21491,
		},
		
		{
			deaths = 4,
			renown = 854,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 11,
			name = L"Kusin",
			career = 10,
			db = 3,
			level = 5,
			exp = 10974,
			damage = 16385,
		},
		
		{
			deaths = 6,
			renown = 1474,
			healing = 21000,
			soloKills = 0,
			realm = 1,
			kills = 10,
			name = L"Wolverheal",
			career = 12,
			db = 0,
			level = 6,
			exp = 6460,
			damage = 6822,
		},
	},
}




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
	unitFramesDirection1 = 2,
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
			id = "76101",
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
			id = "76102",
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
			id = "76103",
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
			id = "76104",
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
			anchorTo = 9,
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
			id = "76105",
			alpha = 1,
			logic = L"MyBuff and not MyHealing",
			archetypeMatch = 1,
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
			name = L"Buff",
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
			id = "76106",
			alpha = 1,
			logic = L"MyBlessing and not MyHealing",
			archetypeMatch = 1,
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
			name = L"Blessing",
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
			id = "76107",
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
			id = "76108",
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
			id = "76109",
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
			id = "76110",
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
			id = "76111",
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
			id = "76112",
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
			id = "76113",
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
			id = "76114",
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
						[1588] = true,
						[20476] = true,
						[3671] = true,
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
						[8618] = true,
						[1591] = true,
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
			id = "76115",
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
			id = "76116",
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
			id = "76117",
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
		unique = true,
		firstLetters = 4,
		showCareerIcon = true,
		canClearOnClick = false,
		permanentTargets = 
		{
		},
		id = 7,
		targetOnClick = true,
		alpha = 0.5,
		scale = 0.6,
		layer = 3,
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
			data = 
			{
				
				{
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 165,
							max = 44,
							min = 23,
							count = 6,
							abs = 0,
							mit = 408,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
							total = 31,
							max = 31,
							min = 31,
							count = 1,
							abs = 0,
							mit = 101,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
				},
				
				{
					[L"Guarded Attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 49,
							max = 49,
							min = 49,
							count = 1,
							abs = 0,
							mit = 33,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
					[L"Inspiring Attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 60,
							max = 60,
							min = 60,
							count = 1,
							abs = 0,
							mit = 36,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
					[L"Heavy Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 68,
							max = 68,
							min = 68,
							count = 1,
							abs = 0,
							mit = 38,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
							total = 119,
							max = 95,
							min = 24,
							count = 2,
							abs = 0,
							mit = 89,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Axe Toss"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 30,
							max = 15,
							min = 15,
							count = 2,
							abs = 0,
							mit = 54,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
							mit = 35,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
					[L"Vengeful Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 57,
							max = 57,
							min = 57,
							count = 1,
							abs = 0,
							mit = 35,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
							total = 164,
							max = 58,
							min = 48,
							count = 4,
							abs = 0,
							mit = 129,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Black Orc",
								career = 0,
								id = 11972,
								level = 7,
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
						parry = 1,
					},
				},
			},
			eps = 
			{
				
				{
					totalAoe = 0,
					total = 196,
					object = L"Black Orc",
					objectTime = 64936509440,
					data = 
					{
						
						{
							str = L"Black Orc's attack hits you for 44 damage. (52 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 44,
							crit = false,
							mit = 52,
							abs = 0,
						},
						
						{
							str = L"Black Orc's attack hits you for 26 damage. (70 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 26,
							crit = false,
							mit = 70,
							abs = 0,
						},
						
						{
							str = L"Black Orc's attack hits you for 26 damage. (70 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 26,
							crit = false,
							mit = 70,
							abs = 0,
						},
						
						{
							str = L"Black Orc's attack hits you for 23 damage. (72 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 23,
							crit = false,
							mit = 72,
							abs = 0,
						},
						
						{
							str = L"Black Orc's attack hits you for 23 damage. (72 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 23,
							crit = false,
							mit = 72,
							abs = 0,
						},
						
						{
							str = L"Black Orc's attack hits you for 23 damage. (72 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 23,
							crit = false,
							mit = 72,
							abs = 0,
						},
						
						{
							str = L"Black Orc's attack critically hits you for 31 damage. (101 mitigated)",
							type = 1,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 31,
							crit = true,
							mit = 101,
							abs = 0,
						},
					},
				},
				
				{
					totalAoe = 604,
					total = 604,
					object = L"Black Orc",
					objectTime = 64936509440,
					data = 
					{
						
						{
							str = L"Your Axe Toss hits Black Orc for 15 damage. (27 mitigated)",
							type = 2,
							ability = L"Axe Toss",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 15,
							crit = false,
							mit = 27,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Black Orc for 48 damage. (41 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 48,
							crit = false,
							mit = 41,
							abs = 0,
						},
						
						{
							str = L"Your Axe Toss hits Black Orc for 15 damage. (27 mitigated)",
							type = 2,
							ability = L"Axe Toss",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 15,
							crit = false,
							mit = 27,
							abs = 0,
						},
						
						{
							str = L"Your Guarded Attack hits Black Orc for 49 damage. (33 mitigated)",
							type = 2,
							ability = L"Guarded Attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 49,
							crit = false,
							mit = 33,
							abs = 0,
						},
						
						{
							str = L"Your Inspiring Attack hits Black Orc for 60 damage. (36 mitigated)",
							type = 2,
							ability = L"Inspiring Attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 60,
							crit = false,
							mit = 36,
							abs = 0,
						},
						
						{
							str = L"Your Vengeful Strike hits Black Orc for 57 damage. (35 mitigated)",
							type = 2,
							ability = L"Vengeful Strike",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 57,
							crit = false,
							mit = 35,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Black Orc for 58 damage. (44 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 58,
							crit = false,
							mit = 44,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow critically hits Black Orc for 95 damage. (52 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 95,
							crit = true,
							mit = 52,
							abs = 0,
						},
						
						{
							str = L"Your attack hits Black Orc for 58 damage. (44 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 58,
							crit = false,
							mit = 44,
							abs = 0,
						},
						
						{
							str = L"Your Grudging Blow hits Black Orc for 57 damage. (35 mitigated)",
							type = 2,
							ability = L"Grudging Blow",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 57,
							crit = false,
							mit = 35,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow hits Black Orc for 68 damage. (38 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 68,
							crit = false,
							mit = 38,
							abs = 0,
						},
						
						{
							str = L"Your Heavy Blow critically hits Black Orc for 24 damage. (37 mitigated)",
							type = 2,
							ability = L"Heavy Blow",
							currentTarget = true,
							object = L"Black Orc",
							time = 64936509440,
							value = 24,
							crit = true,
							mit = 37,
							abs = 0,
						},
					},
				},
			},
			name = L"Default",
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
	groupIconsOtherGroupsScale = 0.6,
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
		true,
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
			type = "selectionFrame",
			id = "76089",
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
			id = "76090",
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
			id = "76091",
			data = 
			{
				pos = 
				{
					35,
					3,
				},
				offlineHide = true,
				wrap = false,
				anchorTo = "topleft",
				scale = 1,
				layer = 1,
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
				distAlpha = 0.3,
				texture = "default",
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
			id = "76092",
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
			id = "76093",
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
			id = "76094",
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
			id = "76095",
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
			id = "76096",
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
			id = "76097",
			data = 
			{
				pos = 
				{
					37,
					4,
				},
				offlineHide = true,
				color = 
				{
					120,
					200,
					255,
				},
				anchorTo = "topleft",
				scale = 1,
				layer = 3,
				alpha = 1,
				size = 
				{
					38,
					10,
				},
				textureFullResize = false,
				deadHide = true,
				prefix = L"M ",
				suffix = L"",
				vertical = false,
				distHide = false,
				anchorFrom = "topleft",
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
			id = "76098",
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
			id = "76099",
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
			id = "76100",
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
	unitFramesGroupsPadding1 = 30,
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
		id = 6,
		targetOnClick = true,
		alpha = 1,
		scale = 1,
		layer = 3,
		font = "font_clear_large_bold",
		name = L"",
		text = L"KILL",
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




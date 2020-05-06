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
			id = "1883",
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
			id = "1884",
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
			id = "1885",
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
			id = "1886",
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
			id = "1887",
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
			id = "1888",
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
			id = "1889",
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
			id = "1890",
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
			id = "1891",
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
			id = "1892",
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
			id = "1893",
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
			id = "1894",
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
			id = "1895",
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
			id = "1896",
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
			id = "1897",
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
			id = "1898",
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
			id = "1899",
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
					[L"Run 'n Shoot"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 61,
							abs = 53,
							min = 61,
							count = 1,
							max = 61,
							mit = 68,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Kakzu",
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								career = 8,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Kakzu",
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								career = 8,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 313,
							abs = 0,
							min = 156,
							count = 2,
							max = 157,
							mit = 168,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Kakzu",
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								career = 8,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Kakzu",
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								career = 8,
							},
						},
						parry = 0,
					},
					[L"Takedown"] = 
					{
						normal = 
						{
							min = 153,
							total = 153,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 41,
							max = 153,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
					[L"Firebomb"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 738,
							abs = 342,
							min = 0,
							count = 5,
							max = 229,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
							},
							mit = 242,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
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
							abs = 114,
							min = 0,
							count = 122,
							max = 58,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 666,
								level = 4,
								hp = 100,
								career = 0,
							},
							mit = 1203,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 667,
								level = 4,
								hp = 46,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 226,
							abs = 0,
							min = 14,
							count = 7,
							max = 83,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 552,
								level = 4,
								hp = 53,
								career = 0,
							},
							mit = 85,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 705,
								level = 4,
								hp = 0,
								career = 0,
							},
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
					[L"Broadhead Arrow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 165,
							abs = 0,
							min = 41,
							count = 3,
							max = 83,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								career = 18,
							},
							mit = 45,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								career = 18,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 328,
							count = 3,
							min = 58,
							abs = 0,
							max = 157,
							mit = 67,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								career = 18,
							},
						},
						parry = 0,
					},
					[L"Spiked Squig's ability"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 0,
							abs = 49,
							min = 0,
							count = 1,
							max = 0,
							mit = 39,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Kakzu",
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
								career = 8,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Kakzu",
								isFriendly = false,
								id = 1914,
								level = 14,
								hp = 100,
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
					[L"ability"] = 
					{
						normal = 
						{
							min = 0,
							total = 0,
							count = 8,
							max = 0,
							overheal = 0,
							mit = 178,
							abs = 411,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
							overheal = 0,
							total = 153,
							abs = 0,
							min = 153,
							count = 1,
							max = 153,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								career = 18,
							},
							mit = 41,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Candypeach",
								id = 1263,
								level = 14,
								hp = 100,
								career = 18,
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
							total = 589,
							count = 7,
							abs = 0,
							max = 91,
							mit = 300,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							min = 81,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 239,
							abs = 0,
							min = 115,
							count = 2,
							max = 124,
							mit = 103,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
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
							min = 275,
							total = 275,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 36,
							max = 275,
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
							total = 14445,
							count = 378,
							min = 10,
							abs = 0,
							max = 83,
							mit = 18183,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Barrens Mauler",
								isFriendly = false,
								id = 1229,
								level = 5,
								hp = 100,
								career = 0,
							},
						},
						dodge = 1,
						disrupt = 0,
						block = 10,
						crit = 
						{
							overheal = 0,
							total = 2819,
							count = 49,
							abs = 0,
							max = 91,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
							mit = 3369,
							min = 21,
						},
						parry = 1,
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
					[L"Mangling Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 14,
							abs = 0,
							min = 14,
							count = 1,
							max = 14,
							mit = 88,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Barrens Mauler",
								isFriendly = false,
								id = 1229,
								level = 5,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Barrens Mauler",
								isFriendly = false,
								id = 1229,
								level = 5,
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
					[L"Acid Arrow"] = 
					{
						normal = 
						{
							min = 173,
							total = 173,
							count = 1,
							abs = 0,
							overheal = 0,
							mit = 40,
							max = 173,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
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
							total = 1125,
							max = 61,
							min = 7,
							count = 75,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1440,
								level = 9,
								hp = 100,
								career = 0,
							},
							mit = 2279,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1402,
								level = 9,
								hp = 93,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 340,
							max = 78,
							min = 9,
							count = 9,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1474,
								level = 9,
								hp = 100,
								career = 0,
							},
							mit = 630,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 546,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						parry = 0,
					},
					[L"Guard"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 103,
							abs = 0,
							min = 21,
							count = 4,
							max = 40,
							mit = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ironknubbe",
								isFriendly = true,
								id = 1741,
								level = 11,
								hp = 79,
								career = 1,
							},
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								name = L"Ironknubbe",
								isFriendly = true,
								id = 1741,
								level = 11,
								hp = 77,
								career = 1,
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
					[L"Spider Bite"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1398,
							max = 67,
							min = 31,
							count = 36,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
							mit = 2991,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1402,
								level = 9,
								hp = 93,
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
							max = 68,
							min = 46,
							count = 3,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 544,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
							mit = 390,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 546,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						parry = 0,
					},
					[L"Enliven Sap"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1544,
							abs = 0,
							min = 34,
							count = 26,
							max = 74,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 675,
								level = 3,
								hp = 100,
								career = 0,
							},
							mit = 750,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 705,
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
							total = 300,
							abs = 0,
							min = 83,
							count = 3,
							max = 113,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 643,
								level = 4,
								hp = 100,
								career = 0,
							},
							mit = 83,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 570,
								level = 3,
								hp = 100,
								career = 0,
							},
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
							abs = 0,
							min = 5,
							count = 2,
							max = 5,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
							},
							mit = 30,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
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
							abs = 5,
							min = 0,
							count = 1,
							max = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
							},
							mit = 15,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
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
							abs = 165,
							min = 0,
							count = 6,
							max = 51,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
							},
							mit = 164,
							minObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Runolf",
								id = 1125,
								level = 4,
								hp = 100,
								career = 4,
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
				},
				
				{
					[L"Shield Sweep"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1002,
							max = 81,
							min = 57,
							count = 16,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 588,
								level = 9,
								hp = 100,
								name = L"Purple Crawler",
							},
							mit = 537,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1474,
								level = 9,
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
							total = 181,
							max = 94,
							min = 87,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1401,
								level = 8,
								hp = 100,
								career = 0,
							},
							mit = 97,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 606,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						parry = 1,
					},
					[L"Binding Grudge"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1978,
							max = 84,
							min = 20,
							count = 40,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							mit = 825,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1440,
								level = 9,
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
							total = 435,
							max = 119,
							min = 44,
							count = 6,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							mit = 167,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 547,
								level = 8,
								hp = 92,
								name = L"Purple Crawler",
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
							abs = 0,
							min = 9,
							count = 181,
							max = 83,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tufftoof",
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								career = 0,
							},
							mit = 6122,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Bloody Sun Shaman",
								isFriendly = false,
								id = 1282,
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
							total = 981,
							abs = 0,
							min = 24,
							count = 18,
							max = 97,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1401,
								level = 8,
								hp = 100,
								career = 0,
							},
							mit = 786,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1474,
								level = 9,
								hp = 100,
								career = 0,
							},
						},
						parry = 2,
					},
					[L"Axe Toss"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 122,
							abs = 0,
							min = 15,
							count = 8,
							max = 17,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							mit = 223,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1474,
								level = 9,
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
					[L"Grudging Blow"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1091,
							abs = 0,
							min = 46,
							count = 20,
							max = 70,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tufftoof",
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								career = 0,
							},
							mit = 726,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tufftoof",
								isFriendly = false,
								id = 818,
								level = 9,
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
							total = 77,
							abs = 0,
							min = 77,
							count = 1,
							max = 77,
							mit = 46,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Dog Ambusher",
								isFriendly = false,
								id = 1433,
								level = 8,
								hp = 100,
								career = 0,
							},
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Dog Ambusher",
								isFriendly = false,
								id = 1433,
								level = 8,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Life Leaka"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 5114,
							abs = 0,
							min = 34,
							count = 110,
							max = 106,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Candypeach",
								id = 1124,
								level = 14,
								hp = 72,
								career = 18,
							},
							mit = 1772,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Slogga",
								id = 307,
								level = 5,
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
							total = 1630,
							count = 22,
							min = 49,
							abs = 0,
							max = 160,
							mit = 474,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Slogga",
								id = 307,
								level = 5,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Guarded Attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1353,
							abs = 0,
							min = 46,
							count = 31,
							max = 63,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							mit = 927,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tufftoof",
								isFriendly = false,
								id = 818,
								level = 9,
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
							total = 344,
							max = 73,
							min = 64,
							count = 5,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 373,
								level = 7,
								hp = 100,
								name = L"Mountain Squig",
							},
							mit = 249,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 546,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
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
							abs = 0,
							min = 57,
							count = 28,
							max = 77,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							mit = 1001,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1440,
								level = 9,
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
							total = 203,
							max = 124,
							min = 79,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tufftoof",
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								career = 0,
							},
							mit = 121,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 606,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						parry = 2,
					},
					[L"Shield of Reprisal"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 171,
							max = 88,
							min = 83,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 547,
								level = 8,
								hp = 92,
								name = L"Purple Crawler",
							},
							mit = 86,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Bloody Sun Hunta",
								isFriendly = false,
								id = 811,
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
					[L"I'll Take That!"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1960,
							abs = 0,
							min = 64,
							count = 23,
							max = 169,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Mackarrow",
								id = 1328,
								level = 6,
								hp = 90,
								career = 18,
							},
							mit = 738,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Slogga",
								id = 307,
								level = 5,
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
							total = 336,
							abs = 0,
							min = 104,
							count = 3,
							max = 119,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 700,
								level = 4,
								hp = 100,
								career = 0,
							},
							mit = 125,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 624,
								level = 4,
								hp = 82,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Vengeful Strike"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1143,
							abs = 0,
							min = 46,
							count = 23,
							max = 62,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Mogwai",
								isFriendly = false,
								id = 1815,
								level = 7,
								hp = 94,
								career = 7,
							},
							mit = 789,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Purple Crawler",
								isFriendly = false,
								id = 1440,
								level = 9,
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
							total = 295,
							max = 82,
							min = 64,
							count = 4,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Frenzied Bloody Sun Drumma",
								isFriendly = false,
								id = 1293,
								level = 7,
								hp = 100,
								career = 0,
							},
							mit = 172,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								career = 0,
								id = 548,
								level = 8,
								hp = 100,
								name = L"Purple Crawler",
							},
						},
						parry = 1,
					},
					[L"Bunch o' Waaagh"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 6661,
							abs = 0,
							min = 86,
							count = 61,
							max = 256,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Condonusado",
								id = 1324,
								level = 10,
								hp = 100,
								career = 3,
							},
							mit = 2176,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Slogga",
								id = 307,
								level = 5,
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
							total = 1193,
							abs = 0,
							min = 128,
							count = 7,
							max = 375,
							maxObject = 
							{
								isNpc = false,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Candypeach",
								id = 1124,
								level = 14,
								hp = 72,
								career = 18,
							},
							mit = 328,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Rebellin' Orc",
								id = 298,
								level = 4,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"Brain Bursta"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2729,
							abs = 0,
							min = 86,
							count = 28,
							max = 109,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 716,
								level = 3,
								hp = 100,
								career = 0,
							},
							mit = 972,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Slogga",
								id = 307,
								level = 5,
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
							total = 296,
							abs = 0,
							min = 137,
							count = 2,
							max = 159,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 708,
								level = 3,
								hp = 100,
								career = 0,
							},
							mit = 87,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 588,
								level = 3,
								hp = 100,
								career = 0,
							},
						},
						parry = 0,
					},
					[L"attack"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 7641,
							abs = 0,
							min = 29,
							count = 170,
							max = 69,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tufftoof",
								isFriendly = false,
								id = 818,
								level = 9,
								hp = 100,
								career = 0,
							},
							mit = 6695,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Slogga",
								id = 307,
								level = 5,
								hp = 100,
								career = 0,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit = 
						{
							overheal = 0,
							total = 1211,
							max = 86,
							min = 47,
							count = 19,
							abs = 0,
							maxObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Bloody Sun Shaman",
								isFriendly = false,
								id = 1345,
								level = 8,
								hp = 100,
								career = 0,
							},
							mit = 915,
							minObject = 
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Tenacious Spite",
								id = 574,
								level = 4,
								hp = 69,
								career = 0,
							},
						},
						parry = 7,
					},
				},
				
				{
					[L"Ubbenk - 'Ey, Quit Bleedin'"] = 
					{
						normal = 
						{
							overheal = 5246,
							total = 5430,
							abs = 0,
							min = 98,
							count = 88,
							max = 224,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 987,
								level = 7,
								hp = 100,
								career = 7,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 7,
								hp = 100,
								career = 7,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 1416,
							total = 1208,
							abs = 0,
							min = 144,
							count = 15,
							max = 322,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 987,
								level = 7,
								hp = 97,
								career = 7,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 7,
								hp = 100,
								career = 7,
							},
						},
						parry = 0,
					},
					[L"Ubbenk - I'll Take That!"] = 
					{
						normal = 
						{
							overheal = 1599,
							total = 1585,
							abs = 0,
							min = 96,
							count = 25,
							max = 253,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 987,
								level = 7,
								hp = 100,
								career = 7,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 92,
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
					[L"Ubbenk - Lingering Gork'll Fix It"] = 
					{
						normal = 
						{
							overheal = 296,
							total = 1186,
							abs = 0,
							min = 23,
							count = 57,
							max = 47,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 987,
								level = 7,
								hp = 100,
								career = 7,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 74,
								career = 7,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 104,
							abs = 0,
							min = 34,
							count = 3,
							max = 35,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 7,
								hp = 97,
								career = 7,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 94,
								career = 7,
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
					[L"Ironknubbe - Fleeting Elixir of Mending"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 240,
							max = 120,
							min = 120,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
								name = L"Ironknubbe",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
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
					[L"Ubbenk - Gork'll Fix It"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 1000,
							abs = 0,
							min = 96,
							count = 9,
							max = 191,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 987,
								level = 7,
								hp = 82,
								career = 7,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 80,
								career = 7,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 33,
							total = 516,
							abs = 0,
							min = 130,
							count = 4,
							max = 146,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 97,
								career = 7,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 65,
								career = 7,
							},
						},
						parry = 0,
					},
				},
				
				{
					[L"Lingering Gork'll Fix It"] = 
					{
						normal = 
						{
							overheal = 594,
							total = 2622,
							abs = 0,
							min = 23,
							count = 91,
							max = 51,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Gaelzul",
								id = 1275,
								level = 13,
								hp = 58,
								career = 24,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 74,
								career = 7,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 0,
							total = 484,
							abs = 0,
							min = 34,
							count = 8,
							max = 79,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Gaelzul",
								id = 1097,
								level = 12,
								hp = 61,
								career = 24,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 94,
								career = 7,
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
							max = 120,
							min = 120,
							count = 2,
							abs = 0,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
								name = L"Ironknubbe",
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 1,
								id = 114,
								level = 11,
								hp = 13,
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
					[L"Gork'll Fix It"] = 
					{
						normal = 
						{
							overheal = 0,
							total = 2260,
							abs = 0,
							min = 96,
							count = 15,
							max = 210,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Gaelzul",
								id = 1275,
								level = 13,
								hp = 85,
								career = 24,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 80,
								career = 7,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 161,
							total = 1318,
							abs = 0,
							min = 130,
							count = 7,
							max = 315,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Alyran",
								id = 1280,
								level = 10,
								hp = 81,
								career = 23,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 65,
								career = 7,
							},
						},
						parry = 0,
					},
					[L"'Ey, Quit Bleedin'"] = 
					{
						normal = 
						{
							overheal = 7951,
							total = 6853,
							abs = 0,
							min = 98,
							count = 107,
							max = 246,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Gaelzul",
								id = 1275,
								level = 13,
								hp = 58,
								career = 24,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 7,
								hp = 100,
								career = 7,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit = 
						{
							overheal = 2096,
							total = 1538,
							abs = 0,
							min = 144,
							count = 18,
							max = 346,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Gaelzul",
								id = 1275,
								level = 13,
								hp = 85,
								career = 24,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 7,
								hp = 100,
								career = 7,
							},
						},
						parry = 0,
					},
					[L"I'll Take That!"] = 
					{
						normal = 
						{
							overheal = 1599,
							total = 1838,
							abs = 0,
							min = 96,
							count = 26,
							max = 253,
							maxObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Taennmag",
								id = 1282,
								level = 13,
								hp = 81,
								career = 16,
							},
							mit = 0,
							minObject = 
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								name = L"Ubbenk",
								id = 114,
								level = 6,
								hp = 92,
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
				},
			},
			name = L"Default",
			eps = 
			{
				
				{
					total = -163,
					objectTime = 64938379180,
					data = 
					{
						
						{
							str = L"Candypeach's Broadhead Arrow hits you for 41 damage. (11 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Candypeach",
							ability = L"Broadhead Arrow",
							value = 41,
							mit = 11,
							crit = false,
							time = 64938379186,
						},
						
						{
							str = L"Candypeach's Broadhead Arrow critically hits you for 58 damage. (15 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Candypeach",
							ability = L"Broadhead Arrow",
							value = 58,
							mit = 15,
							crit = true,
							time = 64938379189,
						},
						
						{
							str = L"Candypeach's Broadhead Arrow hits you for 41 damage. (11 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Candypeach",
							ability = L"Broadhead Arrow",
							value = 41,
							mit = 11,
							crit = false,
							time = 64938379192,
						},
					},
					totalAoe = 0,
					valueMaxData = 
					{
						
						{
							str = L"Candypeach's Spiral-Fletched Arrow hits you for 153 damage. (41 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Candypeach",
							ability = L"Spiral-Fletched Arrow",
							value = 153,
							mit = 41,
							crit = false,
							time = 64938379180,
						},
						
						{
							str = L"Candypeach's Broadhead Arrow critically hits you for 113 damage. (29 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Candypeach",
							ability = L"Broadhead Arrow",
							value = 113,
							mit = 29,
							crit = true,
							time = 64938379180,
						},
						
						{
							str = L"Candypeach's Broadhead Arrow hits you for 83 damage. (23 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Candypeach",
							ability = L"Broadhead Arrow",
							value = 83,
							mit = 23,
							crit = false,
							time = 64938379183,
						},
					},
					valueAoe = 0,
					valueMax = 58,
					value = -27,
					object = L"Candypeach",
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							str = L"Your Bunch o' Waaagh hits Condonusado for 205 damage. (41 mitigated)",
							type = 2,
							ability = L"Bunch o' Waaagh",
							currentTarget = true,
							object = L"Condonusado",
							time = 64938379274,
							value = 205,
							crit = false,
							mit = 41,
							abs = 0,
						},
						
						{
							str = L"Your Life Leaka hits Condonusado for 83 damage. (18 mitigated)",
							type = 2,
							ability = L"Life Leaka",
							currentTarget = true,
							object = L"Condonusado",
							time = 64938379275,
							value = 83,
							crit = false,
							mit = 18,
							abs = 0,
						},
						
						{
							str = L"Your Bunch o' Waaagh hits Condonusado for 205 damage. (41 mitigated)",
							type = 2,
							ability = L"Bunch o' Waaagh",
							currentTarget = true,
							object = L"Condonusado",
							time = 64938379276,
							value = 205,
							crit = false,
							mit = 41,
							abs = 0,
						},
						
						{
							str = L"Your Life Leaka hits Condonusado for 83 damage. (18 mitigated)",
							type = 2,
							ability = L"Life Leaka",
							currentTarget = true,
							object = L"Condonusado",
							time = 64938379278,
							value = 83,
							crit = false,
							mit = 18,
							abs = 0,
						},
						
						{
							str = L"Your Bunch o' Waaagh hits Condonusado for 205 damage. (41 mitigated)",
							type = 2,
							ability = L"Bunch o' Waaagh",
							currentTarget = true,
							object = L"Condonusado",
							time = 64938379278,
							value = 205,
							crit = false,
							mit = 41,
							abs = 0,
						},
						
						{
							str = L"Your Bunch o' Waaagh hits Condonusado for 205 damage. (41 mitigated)",
							type = 2,
							ability = L"Bunch o' Waaagh",
							currentTarget = true,
							object = L"Condonusado",
							time = 64938379280,
							value = 205,
							crit = false,
							mit = 41,
							abs = 0,
						},
					},
					total = 331,
					objectTime = 64938379285,
					data = 
					{
						
						{
							str = L"Your Life Leaka hits Whitecat for 85 damage. (16 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Whitecat",
							ability = L"Life Leaka",
							value = 85,
							mit = 16,
							crit = false,
							time = 64938379285,
						},
						
						{
							str = L"Your I'll Take That! hits Whitecat for 161 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Whitecat",
							ability = L"I'll Take That!",
							value = 161,
							mit = 36,
							crit = false,
							time = 64938379285,
						},
						
						{
							str = L"Your Life Leaka hits Whitecat for 85 damage. (16 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Whitecat",
							ability = L"Life Leaka",
							value = 85,
							mit = 16,
							crit = false,
							time = 64938379288,
						},
					},
					totalAoe = 331,
					valueMaxData = 
					{
						
						{
							str = L"Your Life Leaka hits Whitecat for 85 damage. (16 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Whitecat",
							ability = L"Life Leaka",
							value = 85,
							mit = 16,
							crit = false,
							time = 64938379285,
						},
						
						{
							str = L"Your I'll Take That! hits Whitecat for 161 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Whitecat",
							ability = L"I'll Take That!",
							value = 161,
							mit = 36,
							crit = false,
							time = 64938379285,
						},
					},
					valueAoe = 110,
					valueMax = 35,
					value = 110,
					valueAoeMax = 164,
					object = L"Whitecat",
				},
				
				{
					totalAoe = 0,
					total = 241,
					data = 
					{
						[1] = 
						{
							overheal = 241,
							type = 3,
							ability = L"I'll Take That!",
							currentTarget = false,
							time = 64938379285,
							value = 0,
							object = L"Ubbenk",
							crit = false,
							str = L"Your I'll Take That! heals you for 0 points. (241 overhealed)",
						},
					},
				},
				
				{
					valueAoeMaxData = 
					{
						
						{
							overheal = 0,
							type = 4,
							ability = L"Gork'll Fix It",
							currentTarget = true,
							time = 64938379288,
							value = 309,
							object = L"Gaelzul",
							crit = true,
							str = L"Your Gork'll Fix It critically heals Gaelzul for 309 points.",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"'Ey, Quit Bleedin'",
							currentTarget = true,
							time = 64938379289,
							value = 246,
							object = L"Gaelzul",
							crit = false,
							str = L"Your 'Ey, Quit Bleedin' heals Gaelzul for 246 points.",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379289,
							value = 51,
							object = L"Gaelzul",
							crit = false,
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379290,
							value = 51,
							object = L"Gaelzul",
							crit = false,
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379291,
							value = 51,
							object = L"Gaelzul",
							crit = false,
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"'Ey, Quit Bleedin'",
							currentTarget = true,
							time = 64938379292,
							value = 246,
							object = L"Gaelzul",
							crit = false,
							str = L"Your 'Ey, Quit Bleedin' heals Gaelzul for 246 points.",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379292,
							value = 51,
							object = L"Gaelzul",
							crit = false,
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
						},
						
						{
							overheal = 0,
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379293,
							value = 51,
							object = L"Gaelzul",
							crit = false,
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
						},
					},
					total = 1056,
					objectTime = 64938379288,
					data = 
					{
						
						{
							str = L"Your Gork'll Fix It critically heals Gaelzul for 309 points.",
							type = 4,
							ability = L"Gork'll Fix It",
							currentTarget = true,
							time = 64938379288,
							value = 309,
							overheal = 0,
							crit = true,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your 'Ey, Quit Bleedin' heals Gaelzul for 246 points.",
							type = 4,
							ability = L"'Ey, Quit Bleedin'",
							currentTarget = true,
							time = 64938379289,
							value = 246,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379289,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379290,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379291,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your 'Ey, Quit Bleedin' heals Gaelzul for 246 points.",
							type = 4,
							ability = L"'Ey, Quit Bleedin'",
							currentTarget = true,
							time = 64938379292,
							value = 246,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379292,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379293,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
					},
					totalAoe = 1056,
					valueMaxData = 
					{
						
						{
							str = L"Your Gork'll Fix It critically heals Gaelzul for 309 points.",
							type = 4,
							ability = L"Gork'll Fix It",
							currentTarget = true,
							time = 64938379288,
							value = 309,
							overheal = 0,
							crit = true,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your 'Ey, Quit Bleedin' heals Gaelzul for 246 points.",
							type = 4,
							ability = L"'Ey, Quit Bleedin'",
							currentTarget = true,
							time = 64938379289,
							value = 246,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379289,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379290,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379291,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your 'Ey, Quit Bleedin' heals Gaelzul for 246 points.",
							type = 4,
							ability = L"'Ey, Quit Bleedin'",
							currentTarget = true,
							time = 64938379292,
							value = 246,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379292,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
						
						{
							str = L"Your Lingering Gork'll Fix It heals Gaelzul for 51 points.",
							type = 4,
							ability = L"Lingering Gork'll Fix It",
							currentTarget = true,
							time = 64938379293,
							value = 51,
							overheal = 0,
							crit = false,
							object = L"Gaelzul",
						},
					},
					valueAoe = 211,
					valueMax = 211,
					value = 211,
					valueAoeMax = 211,
					object = L"Gaelzul",
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
	playerKills = 1,
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
			targetOnClick = true,
			alpha = 1,
			layer = 3,
			scale = 1,
			font = "font_clear_large_bold",
			name = L"A",
			text = L"",
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
			targetOnClick = true,
			alpha = 1,
			layer = 3,
			scale = 1,
			font = "font_clear_large_bold",
			name = L"B",
			text = L"",
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
			targetOnClick = true,
			alpha = 1,
			layer = 3,
			scale = 1,
			font = "font_default_text_giant",
			name = L"G",
			text = L"G",
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
	scenarioInfoPlayers = 
	{
		
		{
			deaths = 1,
			renown = 1529,
			healing = 6856,
			soloKills = 0,
			damage = 4518,
			kills = 19,
			name = L"Ubbenk",
			exp = 9110,
			db = 1,
			level = 7,
			career = 7,
			realm = 2,
		},
		
		{
			deaths = 1,
			renown = 163,
			healing = 0,
			soloKills = 0,
			damage = 5769,
			kills = 1,
			name = L"Halfreed",
			exp = 2524,
			db = 0,
			level = 12,
			career = 4,
			realm = 1,
		},
		
		{
			deaths = 2,
			renown = 299,
			healing = 0,
			soloKills = 0,
			damage = 4095,
			kills = 5,
			name = L"Candypeach",
			exp = 3664,
			db = 1,
			level = 14,
			career = 18,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 1367,
			healing = 0,
			soloKills = 0,
			damage = 18785,
			kills = 24,
			name = L"Taennmag",
			exp = 11556,
			db = 6,
			level = 13,
			career = 16,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 272,
			healing = 0,
			soloKills = 0,
			damage = 8622,
			kills = 4,
			name = L"Lolgogol",
			exp = 3044,
			db = 0,
			level = 12,
			career = 2,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 1331,
			healing = 0,
			soloKills = 0,
			damage = 13147,
			kills = 19,
			name = L"Skraeckodlan",
			exp = 8951,
			db = 3,
			level = 8,
			career = 16,
			realm = 2,
		},
		
		{
			deaths = 1,
			renown = 449,
			healing = 0,
			soloKills = 0,
			damage = 9036,
			kills = 5,
			name = L"Wyf",
			exp = 4340,
			db = 1,
			level = 5,
			career = 18,
			realm = 1,
		},
		
		{
			deaths = 0,
			renown = 1460,
			healing = 14074,
			soloKills = 0,
			damage = 1859,
			kills = 25,
			name = L"Alyran",
			exp = 12825,
			db = 0,
			level = 10,
			career = 23,
			realm = 2,
		},
		
		{
			deaths = 1,
			renown = 1299,
			healing = 0,
			soloKills = 0,
			damage = 4695,
			kills = 21,
			name = L"Etfonehome",
			exp = 9789,
			db = 2,
			level = 6,
			career = 16,
			realm = 2,
		},
		
		{
			deaths = 0,
			renown = 1208,
			healing = 10762,
			soloKills = 0,
			damage = 5659,
			kills = 21,
			name = L"Nehily",
			exp = 8769,
			db = 1,
			level = 9,
			career = 7,
			realm = 2,
		},
		
		{
			deaths = 0,
			renown = 0,
			healing = 0,
			soloKills = 0,
			damage = 0,
			kills = 0,
			name = L"Lellya",
			exp = 0,
			db = 0,
			level = 11,
			career = 24,
			realm = 2,
		},
		
		{
			deaths = 1,
			renown = 1356,
			healing = 0,
			soloKills = 0,
			damage = 10555,
			kills = 23,
			name = L"Bodzugg",
			exp = 9825,
			db = 4,
			level = 12,
			career = 5,
			realm = 2,
		},
		
		{
			deaths = 1,
			renown = 1265,
			healing = 6873,
			soloKills = 0,
			damage = 4417,
			kills = 19,
			name = L"Chtouille",
			exp = 9541,
			db = 2,
			level = 12,
			career = 7,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 342,
			healing = 0,
			soloKills = 0,
			damage = 6713,
			kills = 3,
			name = L"Arnhard",
			exp = 4393,
			db = 2,
			level = 7,
			career = 9,
			realm = 1,
		},
		
		{
			deaths = 2,
			renown = 467,
			healing = 13900,
			soloKills = 0,
			damage = 1010,
			kills = 6,
			name = L"Henealer",
			exp = 5057,
			db = 0,
			level = 7,
			career = 12,
			realm = 1,
		},
		
		{
			deaths = 1,
			renown = 719,
			healing = 0,
			soloKills = 0,
			damage = 934,
			kills = 9,
			name = L"Ozzyl",
			exp = 5860,
			db = 1,
			level = 9,
			career = 13,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 189,
			healing = 16866,
			soloKills = 0,
			damage = 0,
			kills = 2,
			name = L"Condonusado",
			exp = 1414,
			db = 0,
			level = 10,
			career = 3,
			realm = 1,
		},
		
		{
			deaths = 1,
			renown = 1435,
			healing = 11440,
			soloKills = 0,
			damage = 3719,
			kills = 25,
			name = L"Myhme",
			exp = 11428,
			db = 1,
			level = 8,
			career = 23,
			realm = 2,
		},
		
		{
			deaths = 1,
			renown = 1342,
			healing = 566,
			soloKills = 0,
			damage = 33377,
			kills = 25,
			name = L"Gaelzul",
			exp = 11685,
			db = 5,
			level = 12,
			career = 24,
			realm = 2,
		},
		
		{
			deaths = 2,
			renown = 1159,
			healing = 0,
			soloKills = 0,
			damage = 5744,
			kills = 16,
			name = L"Benkee",
			exp = 10602,
			db = 1,
			level = 5,
			career = 14,
			realm = 2,
		},
		
		{
			deaths = 3,
			renown = 419,
			healing = 0,
			soloKills = 0,
			damage = 4314,
			kills = 4,
			name = L"Mackarrow",
			exp = 3748,
			db = 1,
			level = 6,
			career = 18,
			realm = 1,
		},
		
		{
			deaths = 4,
			renown = 283,
			healing = 0,
			soloKills = 0,
			damage = 8784,
			kills = 3,
			name = L"Whitecat",
			exp = 2176,
			db = 0,
			level = 5,
			career = 19,
			realm = 1,
		},
		
		{
			deaths = 2,
			renown = 316,
			healing = 0,
			soloKills = 0,
			damage = 6840,
			kills = 3,
			name = L"Runolf",
			exp = 2562,
			db = 1,
			level = 4,
			career = 4,
			realm = 1,
		},
		
		{
			deaths = 4,
			renown = 472,
			healing = 14,
			soloKills = 0,
			damage = 4044,
			kills = 4,
			name = L"Meow",
			exp = 3748,
			db = 0,
			level = 3,
			career = 19,
			realm = 1,
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
		id = 2108,
		queuedWithGroup = false,
		activeQueue = 0,
		pointMax = 500,
		mode = 2,
		timeLeft = 92.507533260621,
		orderPoints = 119,
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
		true,
		true,
		true,
		true,
		true,
		true,
	},
	playerDeaths = 10,
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
			archetypeMatch = 1,
			id = "1871",
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
			type = "selectionFrame",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1872",
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
			type = "panel",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1873",
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
			type = "hpbar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1874",
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
			type = "apbar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1875",
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
			type = "nameText",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1876",
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
			type = "careerIcon",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1877",
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
			type = "levelText",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1878",
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
			type = "groupLeaderIcon",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1879",
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
			type = "moraleBar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1880",
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
			type = "distanceText",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1881",
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
			type = "distanceBar",
			playerTypeMatch = 1,
		},
		
		{
			archetypeMatch = 1,
			id = "1882",
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
			type = "hppText",
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
	groupIconsAlpha = 0.5,
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
		scale = 1,
		unique = false,
		firstLetters = 4,
		showCareerIcon = true,
		canClearOnClick = true,
		permanentTargets = 
		{
		},
		id = 6,
		text = L"KILL",
		alpha = 1,
		layer = 3,
		color = 
		{
			r = 255,
			g = 0,
			b = 0,
		},
		font = "font_clear_large_bold",
		name = L"",
		targetOnClick = true,
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




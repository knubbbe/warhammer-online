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
			id = "22858",
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
			id = "22859",
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
			id = "22860",
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
			id = "22861",
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
			anchorTo = 9,
			scale = 1,
			anchorFrom = 9,
			exceptMe = true,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "871",
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
			id = "22862",
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
			anchorTo = 9,
			scale = 1,
			anchorFrom = 9,
			exceptMe = false,
			offsetX = -3,
			icon = "dot",
			canDispell = 1,
			isCircleIcon = false,
			id = "872",
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
			id = "22863",
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
			id = "22864",
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
			id = "22865",
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
			id = "22866",
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
			id = "22867",
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
			id = "22868",
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
			id = "22869",
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
			id = "22870",
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
			id = "22871",
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
			id = "22872",
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
			id = "22873",
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
			id = "22874",
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
	unitFramesDirection2 = 1,
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
		id = 2504,
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
					total = 1261,
					objectTime = 64938232004,
					data =
					{

						{
							str = L"Balumba's Ard Noggin critically hits you for 69 damage. (27 mitigated) (91 absorbed)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Sistermanic",
							time = 64938067442,
							value = 137,
							crit = false,
							mit = 13,
							ability = L"Consume Strength",
						},

						{
							str = L"Balumba's Horned Squig's attack hits you for 60 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Sistermanic",
							time = 64938067442,
							value = 78,
							crit = false,
							mit = 16,
							ability = L"Horned Squig's attack",
						},

						{
							str = L"Balumba's attack hits you for 68 damage. (19 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Sistermanic",
							time = 64938067443,
							value = 85,
							crit = false,
							mit = 19,
							ability = L"attack",
						},

						{
							str = L"Balumba's Covenant of Vitality hits you for 49 damage. (34 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Sistermanic",
							time = 64938067443,
							value = 53,
							crit = false,
							mit = 34,
							ability = L"Covenant of Vitality",
						},

						{
							str = L"Balumba's Horned Squig's Gore hits you for 0 damage. (12 mitigated) (97 absorbed)",
							type = 1,
							abs = 97,
							currentTarget = false,
							object = L"Sistermanic",
							time = 64938067443,
							value = 106,
							crit = false,
							mit = 12,
							ability = L"Horned Squig's Gore",
						},

						{
							str = L"Balumba's Ard Noggin hits you for 70 damage. (24 mitigated) (69 absorbed)",
							type = 1,
							abs = 69,
							currentTarget = false,
							object = L"Sistermanic",
							time = 64938067444,
							value = 24,
							crit = false,
							mit = 24,
							ability = L"Ard Noggin",
						},

						{
							str = L"Crabit's Trip 'Em Up hits you for 161 damage. (31 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							object = L"Sistermanic",
							time = 64938067446,
							value = 36,
							crit = true,
							mit = 3,
							ability = L"Lacerate",
						},

						{
							str = L"Balumba's Big Claw hits you for 69 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							object = L"Jailtime",
							time = 64938067448,
							value = 224,
							crit = true,
							mit = 21,
							ability = L"Mind Killer",
						},

						{
							str = L"Balumba's Horned Squig's Gore critically hits you for 18 damage. (4 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							object = L"Sistermanic",
							time = 64938067449,
							value = 24,
							crit = false,
							mit = 2,
							ability = L"Lacerate",
						},

						{
							str = L"Crabit's attack hits you for 171 damage. (35 mitigated)",
							type = 1,
							abs = 112,
							currentTarget = true,
							object = L"Shieldahila",
							time = 64938067449,
							value = 0,
							crit = false,
							mit = 35,
							ability = L"attack",
						},

						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 25,
							mit = 28,
							crit = false,
							mit = 16,
							ability = L"Horned Squig's attack",
						},

						{
							str = L"Your attack hits Vires for 19 damage. (15 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 19,
							mit = 15,
							crit = false,
							mit = 24,
							ability = L"Ard Noggin",
						},

						{
							str = L"Your Snap Shot hits Vires for 32 damage. (36 mitigated)",
							type = 2,
							ability = L"Snap Shot",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 32,
							mit = 36,
							crit = false,
							mit = 34,
							ability = L"Covenant of Vitality",
						},

						{
							str = L"Your Torment critically hits Vires for 200 damage. (34 mitigated)",
							type = 2,
							ability = L"Torment",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 200,
							mit = 34,
							crit = true,
							time = 64938067637,
						},

						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 25,
							mit = 28,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},

						{
							str = L"Your Torment critically hits Vires for 202 damage. (34 mitigated)",
							type = 2,
							ability = L"Torment",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 202,
							mit = 34,
							crit = true,
							mit = 27,
							ability = L"attack",
						},

						{
							str = L"Your attack hits Vires for 25 damage. (28 mitigated)",
							type = 2,
							ability = L"attack",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 25,
							mit = 28,
							crit = false,
							mit = 10,
							ability = L"Skull Thumper",
						},

						{
							str = L"Your Absolution hits Vires for 223 damage. (109 mitigated)",
							type = 2,
							ability = L"Absolution",
							currentTarget = true,
							object = L"Vires",
							abs = 0,
							value = 223,
							mit = 109,
							crit = false,
							mit = 24,
							ability = L"Ard Noggin",
						},

						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067635,
							value = 25,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},

						{
							str = L"Crabit's Wot armor? hits you for 0 damage. (31 mitigated) (140 absorbed)",
							type = 1,
							abs = 140,
							currentTarget = false,
							time = 64938232004,
							object = L"Crabit",
							value = 0,
							crit = false,
							mit = 31,
							ability = L"Wot armor?",
						},

						{
							str = L"Crabit's Covenant of Vitality hits you for 39 damage. (35 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232004,
							object = L"Crabit",
							value = 39,
							crit = false,
							mit = 35,
							ability = L"Covenant of Vitality",
						},

						{
							str = L"Balumba's Big Claw critically hits you for 99 damage. (21 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 99,
							crit = true,
							mit = 21,
							ability = L"Big Claw",
						},

						{
							str = L"Balumba's Big Claw hits you for 69 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067635,
							value = 19,
							crit = false,
							mit = 16,
							ability = L"Big Claw",
						},

						{
							str = L"Trollkarlious's Word of Pain critically hits you for 399 damage. (199 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232005,
							object = L"Trollkarlious",
							value = 399,
							crit = true,
							mit = 199,
							ability = L"Word of Pain",
						},

						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},

						{
							str = L"Crabit's attack hits you for 171 damage. (35 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232006,
							object = L"Crabit",
							value = 171,
							crit = false,
							mit = 35,
							ability = L"attack",
						},

						{
							str = L"Crabit's Right in Da Jibblies hits you for 205 damage. (31 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = false,
							time = 64938232006,
							object = L"Crabit",
							value = 205,
							crit = false,
							mit = 31,
							ability = L"Right in Da Jibblies",
						},

						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067636,
							value = 32,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},

						{
							str = L"Balumba's Ard Noggin hits you for 104 damage. (18 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067637,
							value = 200,
							crit = true,
							mit = 21,
							ability = L"Big Claw",
						},

						{
							str = L"Balumba's Big Claw hits you for 69 damage. (16 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 69,
							crit = false,
							mit = 16,
							ability = L"Big Claw",
						},

						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232005,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},

						{
							str = L"Balumba's Horned Squig's Gore hits you for 12 damage. (3 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232006,
							object = L"Balumba",
							value = 12,
							crit = false,
							mit = 3,
							ability = L"Horned Squig's Gore",
						},

						{
							str = L"Balumba's Ard Noggin hits you for 104 damage. (18 mitigated)",
							type = 1,
							abs = 0,
							currentTarget = true,
							time = 64938232007,
							object = L"Balumba",
							value = 104,
							crit = false,
							mit = 18,
							ability = L"Ard Noggin",
						},
					},
					object = L"Balumba",
					valueMax = 180,
					value = 180,
					valueAoe = 0,
				},

				{
					valueAoeMaxData =
					{

						{
							str = L"Your Fervor hits Taursenrir for 59 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067638,
							value = 25,
							crit = false,
							time = 64938231989,
						},

						{
							str = L"Your attack critically hits Taursenrir for 38 damage. (40 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067638,
							value = 202,
							crit = true,
							time = 64938231989,
						},

						{
							str = L"Your attack hits Taursenrir for 16 damage. (16 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067640,
							value = 25,
							crit = false,
							mit = 28,
							ability = L"attack",
							value = 16,
							mit = 16,
							crit = false,
							time = 64938231989,
						},

						{
							str = L"Your Flames of Rhuin hits Taursenrir for 98 damage. (2 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067640,
							value = 223,
							crit = false,
							time = 64938231989,
						},

						{
							str = L"Your Fervor hits Taursenrir for 53 damage. (35 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067635,
							value = 25,
							crit = false,
							time = 64938231990,
						},

						{
							str = L"Your attack critically hits Taursenrir for 26 damage. (36 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Taursenrir",
							ability = L"attack",
							value = 26,
							mit = 36,
							crit = true,
							time = 64938231991,
						},

						{
							str = L"Your Torment hits Taursenrir for 80 damage. (61 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067635,
							value = 19,
							crit = false,
							time = 64938231994,
						},

						{
							str = L"Your Blessed Bullets of Confession hits Taursenrir for 261 damage. (10 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067636,
							value = 32,
							crit = false,
							time = 64938231994,
						},

						{
							str = L"Your Fervor hits Taursenrir for 62 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067637,
							value = 200,
							crit = true,
							mit = 34,
							ability = L"Torment",
						},
					},
					total = 0,
					objectTime = 64938232005,
					valueAoeMax = 139,
					totalAoe = 88,
					valueMaxData =
					{

						{
							str = L"Your Fervor hits Balumba for 29 damage. (15 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067638,
							value = 25,
							crit = false,
							mit = 15,
							ability = L"Fervor",
						},

						{
							str = L"Your attack hits Balumba for 8 damage. (16 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067638,
							value = 202,
							crit = true,
							mit = 34,
							ability = L"Torment",
						},

						{
							str = L"Your attack hits Balumba for 6 damage. (7 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067640,
							value = 25,
							crit = false,
							mit = 7,
							ability = L"attack",
						},

						{
							str = L"Your Fervor hits Balumba for 21 damage. (12 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = true,
							object = L"Vires",
							time = 64938067640,
							value = 223,
							crit = false,
							mit = 12,
							ability = L"Fervor",
						},
					},
					valueAoe = 18,
					valueMax = 13,
					value = 0,
					object = L"Balumba",
					data =
					{

						{
							str = L"Your Fervor critically hits Balumba for 40 damage. (14 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = false,
							time = 64938232010,
							object = L"Balumba",
							value = 40,
							crit = true,
							mit = 14,
							ability = L"Fervor",
						},

						{
							str = L"Your Fervor hits Balumba for 20 damage. (14 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = false,
							time = 64938232013,
							object = L"Balumba",
							value = 20,
							crit = false,
							mit = 14,
							ability = L"Fervor",
						},

						{
							str = L"Your Fervor critically hits Balumba for 28 damage. (17 mitigated)",
							type = 2,
							abs = 0,
							currentTarget = false,
							time = 64938232015,
							object = L"Balumba",
							value = 28,
							crit = true,
							mit = 17,
							ability = L"Fervor",
						},
					},
				},

				{
					totalAoe = 0,
					total = 892,
					valueAoe = 0,
					valueMax = 263,
					value = 127,
					data =
					{

						{
							str = L"Vyamon's Lingering Rune of Mending heals you for 45 points.",
							type = 3,
							ability = L"Lingering Rune of Mending",
							currentTarget = false,
							time = 64938067456,
							value = 158,
							object = L"Something",
							crit = false,
							overheal = 0,
						},

						{
							str = L"Vyamon's Grungni's Gift heals you for 133 points. (69 overhealed)",
							type = 3,
							ability = L"Grungni's Gift",
							currentTarget = false,
							time = 64938067459,
							value = 122,
							object = L"Something",
							crit = false,
							overheal = 69,
						},

						{
							str = L"Hwiee's Lambent Aura heals you for 0 points. (185 overhealed)",
							type = 3,
							ability = L"Lambent Aura",
							currentTarget = false,
							time = 64938067460,
							value = 158,
							object = L"Something",
							crit = false,
							overheal = 185,
						},

						{
							str = L"Vyamon's Lingering Rune of Mending heals you for 0 points. (45 overhealed)",
							type = 3,
							ability = L"Lingering Rune of Mending",
							currentTarget = false,
							time = 64938067463,
							value = 135,
							object = L"Something",
							crit = false,
							overheal = 45,
						},

						{
							overheal = 0,
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067422,
							value = 133,
							str = L"Your Prayer of Devotion heals you for 133 points.",
							crit = false,
							overheal = 0,
						},

						{
							overheal = 0,
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067423,
							value = 133,
							str = L"Your Prayer of Devotion heals you for 133 points.",
							crit = false,
							overheal = 0,
						},

						{
							overheal = 55,
							type = 3,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067424,
							value = 78,
							str = L"Your Prayer of Devotion heals you for 78 points. (55 overhealed)",
							crit = false,
							overheal = 0,
						},
					},
					valueMaxData =
					{
					},
				},

				{
					valueAoeMaxData =
					{

						{
							overheal = 0,
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067440,
							value = 133,
							str = L"Your Prayer of Devotion heals you for 133 points.",
							crit = false,
							object = L"you",
						},

						{
							overheal = 0,
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067446,
							value = 133,
							str = L"Your Prayer of Devotion heals you for 133 points.",
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
							time = 64938067446,
							value = 133,
							object = L"you",
							crit = false,
							overheal = 0,
						},

						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067448,
							value = 133,
							object = L"you",
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
							time = 64938067440,
							value = 133,
							object = L"you",
							crit = false,
							overheal = 0,
						},

						{
							str = L"Your Prayer of Devotion heals you for 133 points.",
							type = 4,
							ability = L"Prayer of Devotion",
							currentTarget = true,
							time = 64938067446,
							value = 133,
							object = L"you",
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
			name = L"Default",
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
					[L"Brain Bursta"] =
					{
						normal =
						{
							overheal = 0,
							total = 163,
							max = 163,
							min = 163,
							count = 1,
							abs = 0,
							mit = 29,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
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
					[L"Shattered Shadows"] =
					{
						normal =
						{
							min = 0,
							total = 365,
							count = 4,
							abs = 303,
							max = 191,
							mit = 408,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 102,
							total = 738,
							count = 3,
							abs = 80,
							max = 339,
							mit = 597,
							overheal = 0,
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
							abs = 0,
							max = 110,
							mit = 22,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 6,
								name = L"Drastargh",
								id = 3838,
								level = 14,
								hp = 99,
								isFriendly = false,
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
							min = 248,
							total = 248,
							count = 1,
							abs = 0,
							max = 248,
							mit = 62,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Trip 'Em Up"] =
					{
						normal =
						{
							min = 90,
							total = 914,
							count = 8,
							abs = 0,
							max = 161,
							mit = 237,
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
							abs = 0,
							min = 32,
							count = 1,
							max = 32,
							mit = 16,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Stonewing Bat",
								id = 1786,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Stonewing Bat",
								id = 1786,
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
					[L"Spiked Squig's Git Em!"] =
					{
						normal =
						{
							min = 79,
							total = 158,
							count = 2,
							abs = 0,
							max = 79,
							mit = 56,
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
					[L"Wot armor?"] =
					{
						normal =
						{
							min = 0,
							total = 249,
							count = 5,
							max = 88,
							overheal = 0,
							mit = 173,
							abs = 236,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							overheal = 0,
							total = 275,
							count = 2,
							abs = 0,
							min = 135,
							mit = 86,
							max = 140,
						},
						parry = 0,
					},
					[L"Spiked Squig's ability"] =
					{
						normal =
						{
							min = 0,
							total = 26,
							count = 7,
							mit = 136,
							abs = 402,
							max = 26,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2059,
								level = 11,
								hp = 82,
								name = L"Ranho",
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
							min = 399,
							total = 399,
							count = 1,
							abs = 0,
							max = 399,
							mit = 199,
							overheal = 0,
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
					[L"Horned Squig's ability"] =
					{
						normal =
						{
							min = 0,
							total = 74,
							count = 5,
							abs = 235,
							max = 36,
							mit = 130,
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
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
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
					[L"Covenant of Vitality"] =
					{
						normal =
						{
							min = 39,
							total = 1625,
							count = 25,
							mit = 505,
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
					[L"Daemonic Fury"] =
					{
						normal =
						{
							min = 110,
							total = 504,
							count = 4,
							abs = 0,
							max = 149,
							mit = 104,
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
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
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
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
							mit = 7,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Skull Thumper"] =
					{
						normal =
						{
							min = 0,
							total = 566,
							count = 9,
							abs = 287,
							max = 223,
							mit = 208,
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
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
							mit = 57,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 198,
							total = 198,
							count = 1,
							abs = 0,
							max = 198,
							mit = 47,
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
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
							mit = 29,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Terrorbit",
								id = 2650,
								level = 13,
								hp = 95,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Explodin' Arrer"] =
					{
						normal =
						{
							min = 0,
							total = 235,
							count = 7,
							abs = 134,
							max = 41,
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
					[L"Spiked Squig's Poisoned Spine"] =
					{
						normal =
						{
							min = 18,
							total = 352,
							count = 14,
							overheal = 0,
							abs = 0,
							max = 30,
							mit = 112,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2059,
								level = 11,
								hp = 82,
								name = L"Ranho",
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 30,
							total = 104,
							count = 3,
							overheal = 0,
							abs = 0,
							max = 43,
							mit = 27,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								isFriendly = false,
								id = 2059,
								level = 11,
								hp = 82,
								name = L"Ranho",
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
					[L"Demolishing Strike"] =
					{
						normal =
						{
							overheal = 0,
							total = 560,
							count = 7,
							abs = 0,
							max = 80,
							mit = 0,
							min = 80,
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
					[L"Horned Squig's Git Em!"] =
					{
						normal =
						{
							overheal = 0,
							total = 145,
							count = 2,
							min = 0,
							abs = 112,
							max = 145,
							mit = 78,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								name = L"Shieldahila",
								id = 3882,
								level = 10,
								hp = 72,
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
					[L"Flamer's attack"] =
					{
						normal =
						{
							overheal = 0,
							total = 515,
							count = 16,
							min = 0,
							abs = 94,
							max = 92,
							mit = 54,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
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
							total = 69,
							count = 2,
							min = 33,
							abs = 0,
							max = 36,
							mit = 5,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
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
					[L"Fist of Khaine"] =
					{
						normal =
						{
							min = 45,
							total = 45,
							count = 1,
							abs = 0,
							max = 45,
							mit = 36,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 61,
							total = 138,
							count = 2,
							abs = 0,
							max = 77,
							mit = 74,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Ethereal Hand"] =
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
								career = 0,
								name = L"Tainted Hound",
								id = 4184,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 180,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1196,
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
							max = 0,
							min = 0,
							count = 2,
							abs = 143,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
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
							total = 23,
							abs = 0,
							min = 23,
							count = 2,
							max = 23,
							mit = 17,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3792,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3792,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"ability"] =
					{
						normal =
						{
							min = 0,
							total = 249,
							count = 4,
							abs = 91,
							max = 88,
							mit = 54,
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
								career = 12,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 67,
								isFriendly = true,
							},
							mit = 1110,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1196,
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
							total = 115,
							max = 80,
							min = 0,
							count = 4,
							abs = 308,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4262,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 84,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Krev the Plunderer",
								id = 4039,
								level = 8,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Run 'n Shoot"] =
					{
						normal =
						{
							overheal = 0,
							total = 459,
							abs = 0,
							min = 12,
							count = 22,
							max = 51,
							mit = 158,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Filthy Spider",
								id = 2509,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Filthy Spider",
								id = 2509,
								level = 4,
								hp = 0,
								isFriendly = false,
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
							abs = 0,
							max = 19,
							mit = 17,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Filthy Spider",
								id = 2527,
								level = 4,
								hp = 0,
								isFriendly = false,
							},
							min = 17,
						},
						parry = 0,
					},
					[L"Warp Reality"] =
					{
						normal =
						{
							min = 76,
							total = 622,
							count = 8,
							abs = 0,
							max = 78,
							mit = 106,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
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
					[L"Frozen Touch"] =
					{
						normal =
						{
							min = 20,
							total = 497,
							count = 7,
							abs = 0,
							max = 95,
							mit = 57,
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
					[L"Ethereal Emanation"] =
					{
						normal =
						{
							overheal = 0,
							total = 95,
							max = 56,
							min = 39,
							count = 2,
							abs = 0,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 1814,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 38,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
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
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4184,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1196,
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
							total = 411,
							max = 116,
							min = 0,
							count = 6,
							abs = 152,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4186,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 250,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1181,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 1,
					},
					[L"Ground Rumble"] =
					{
						normal =
						{
							overheal = 0,
							total = 43,
							abs = 0,
							min = 10,
							count = 4,
							max = 11,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 1192,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							mit = 1,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								isFriendly = false,
								name = L"Argog the Unstoppable",
								id = 284,
								level = 2,
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
							total = 15,
							abs = 0,
							min = 15,
							count = 1,
							max = 15,
							mit = 0,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 829,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 829,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Ethereal Emanation"] =
					{
						normal =
						{
							overheal = 0,
							total = 90,
							max = 53,
							min = 37,
							count = 2,
							abs = 0,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 1814,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 38,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Eoldred Nightbane",
								id = 239,
								level = 3,
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
					[L"Ethereal Chill"] =
					{
						normal =
						{
							overheal = 0,
							total = 416,
							max = 56,
							min = 43,
							count = 9,
							abs = 0,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 139,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 182,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 294,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Poisoned Spine"] =
					{
						normal =
						{
							min = 26,
							total = 26,
							count = 1,
							abs = 0,
							max = 26,
							mit = 8,
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
							total = 17326,
							count = 285,
							min = 8,
							max = 183,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							overheal = 0,
							total = 3096,
							max = 277,
							min = 12,
							count = 32,
							abs = 0,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
							},
							mit = 250,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Nurgling",
								id = 206,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Ard Noggin"] =
					{
						normal =
						{
							overheal = 0,
							total = 122,
							abs = 0,
							min = 122,
							count = 3,
							max = 122,
							mit = 28,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3792,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3792,
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
						parry = 2,
					},
					[L"Ethereal Hand"] =
					{
						normal =
						{
							overheal = 0,
							total = 366,
							max = 49,
							min = 37,
							count = 9,
							abs = 0,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 139,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 180,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 294,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
							max = 91,
							abs = 0,
							mit = 294,
							overheal = 0,
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
						parry = 1,
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
					[L"Consume Essence"] =
					{
						normal =
						{
							overheal = 0,
							total = 589,
							count = 6,
							min = 85,
							abs = 0,
							max = 99,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							min = 88,
						},
						parry = 0,
					},
					[L"Clobber"] =
					{
						normal =
						{
							min = 0,
							total = 1420,
							count = 20,
							abs = 855,
							max = 129,
							mit = 408,
							overheal = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 45,
							total = 409,
							count = 3,
							abs = 98,
							max = 182,
							mit = 85,
							overheal = 0,
							total = 139,
							abs = 0,
							min = 139,
							count = 1,
							max = 139,
							mit = 30,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 2,
					},
					[L"Lob Choppa"] =
					{
						normal =
						{
							min = 35,
							total = 461,
							count = 6,
							abs = 0,
							max = 303,
							mit = 139,
							overheal = 0,
						},
						dodge = 1,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 61,
							total = 61,
							count = 1,
							abs = 0,
							max = 61,
							mit = 31,
							overheal = 0,
						},
						parry = 0,
					},
					[L"Tooth of Tzeentch"] =
					{
						normal =
						{
							min = 39,
							total = 258,
							count = 3,
							overheal = 0,
							total = 926,
							abs = 0,
							min = 148,
							count = 6,
							max = 159,
							mit = 82,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Kaioshin",
								id = 3860,
								level = 10,
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
							total = 200,
							abs = 0,
							min = 200,
							count = 1,
							max = 200,
							mit = 23,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Kaioshin",
								id = 3860,
								level = 10,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Kaioshin",
								id = 3860,
								level = 10,
								hp = 100,
								isFriendly = false,
							},
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
					[L"Flail"] =
					{
						normal =
						{
							overheal = 0,
							total = 236,
							abs = 0,
							min = 113,
							count = 2,
							max = 123,
							mit = 88,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
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
							total = 183,
							abs = 0,
							min = 183,
							count = 1,
							max = 183,
							mit = 53,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Ravage"] =
					{
						normal =
						{
							min = 105,
							total = 242,
							count = 2,
							abs = 0,
							overheal = 0,
							mit = 80,
							max = 137,
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
					[L"Daemonic Lash"] =
					{
						normal =
						{
							overheal = 0,
							total = 137,
							abs = 0,
							min = 137,
							count = 2,
							max = 137,
							mit = 13,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
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
					[L"Crippling Anger"] =
					{
						normal =
						{
							overheal = 0,
							total = 2841,
							abs = 0,
							min = 28,
							count = 35,
							max = 100,
							mit = 190,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								name = L"Shieldahila",
								id = 3882,
								level = 10,
								hp = 72,
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
					[L"What Blocka?"] =
					{
						normal =
						{
							overheal = 0,
							total = 820,
							abs = 0,
							min = 63,
							count = 7,
							max = 176,
							mit = 238,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3885,
								level = 10,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
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
							total = 429,
							abs = 0,
							min = 185,
							count = 2,
							max = 244,
							mit = 101,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3885,
								level = 10,
								hp = 8,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 5,
								name = L"Yrkoonorc",
								id = 3786,
								level = 12,
								hp = 90,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Fervor"] =
					{
						normal =
						{
							min = 8,
							total = 20334,
							count = 325,
							overheal = 0,
							total = 2093,
							abs = 59,
							min = 0,
							count = 67,
							max = 79,
							mit = 828,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3792,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
							mit = 5468,
							abs = 0,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							overheal = 0,
							total = 650,
							abs = 0,
							min = 15,
							count = 14,
							max = 84,
							mit = 242,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 23,
								name = L"Kaioshin",
								id = 3860,
								level = 10,
								hp = 100,
								isFriendly = false,
							},
							mit = 825,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 829,
								level = 2,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 22,
					},
					[L"Baleful Transmogrification"] =
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
								career = 22,
								name = L"Shikimara",
								id = 2674,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 1297,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Dalsgard",
								id = 2626,
								level = 14,
								hp = 88,
								isFriendly = false,
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
								career = 21,
								name = L"Klaudiana",
								id = 2655,
								level = 3,
								hp = 79,
								isFriendly = false,
							},
							mit = 359,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 13,
								name = L"Rhetr",
								id = 2512,
								level = 10,
								hp = 26,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Surging Violet Fire"] =
					{
						normal =
						{
							min = 167,
							total = 367,
							count = 2,
							abs = 0,
							max = 200,
							mit = 60,
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
								career = 24,
								name = L"Anehtas",
								id = 2527,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
							mit = 453,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
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
								isFriendly = false,
								career = 0,
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
								name = L"Tainted Hound",
								id = 4181,
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
					[L"Rend"] =
					{
						normal =
						{
							min = 110,
							total = 7582,
							count = 25,
							abs = 0,
							max = 441,
							mit = 4221,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Raven Hellfang",
								id = 575,
								level = 2,
								hp = 100,
								isFriendly = false,
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
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 2112,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Escaped Patient",
								id = 4065,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
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
							total = 854,
							max = 68,
							min = 43,
							count = 17,
							abs = 0,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 516,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Lunging Maw"] =
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
								name = L"Tainted Hound",
								career = 0,
								id = 847,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 627,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Lorok the Heartless",
								id = 3864,
								level = 7,
								hp = 97,
								isFriendly = false,
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
								career = 0,
								name = L"Tainted Hound",
								id = 4136,
								level = 5,
								hp = 100,
								isFriendly = false,
							},
							mit = 83,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4186,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Lasting Scorching Blast Potion"] =
					{
						normal =
						{
							overheal = 0,
							total = 3966,
							abs = 23,
							min = 48,
							count = 44,
							max = 223,
							mit = 1456,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Vires",
								id = 4378,
								level = 13,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 829,
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
							total = 648,
							abs = 5,
							min = 249,
							count = 2,
							max = 399,
							mit = 113,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3792,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3821,
								level = 12,
								hp = 90,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Point-Blank"] =
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
							total = 10222,
							max = 47,
							min = 6,
							count = 416,
							abs = 0,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 22,
								name = L"Shikimara",
								id = 2674,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							mit = 8977,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
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
							total = 1472,
							max = 67,
							min = 9,
							count = 42,
							abs = 0,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Costusss",
								id = 2707,
								level = 3,
								hp = 94,
								isFriendly = false,
							},
							mit = 1337,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"ability"] =
					{
						normal =
						{
							overheal = 0,
							total = 0,
							abs = 25,
							min = 0,
							count = 2,
							max = 0,
							mit = 39,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
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
					[L"Murderous Wrath"] =
					{
						normal =
						{
							min = 165,
							total = 165,
							count = 1,
							abs = 0,
							max = 165,
							mit = 15,
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
								career = 23,
								name = L"Costusss",
								id = 2707,
								level = 3,
								hp = 94,
								isFriendly = false,
							},
							mit = 3651,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Lorok the Heartless",
								id = 3864,
								level = 7,
								hp = 97,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 143,
							total = 590,
							count = 3,
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
								name = L"Tainted Hound",
								career = 0,
								id = 847,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							mit = 376,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Tainted Hound",
								id = 4128,
								level = 7,
								hp = 100,
								isFriendly = false,
							},
							max = 231,
						},
						parry = 0,
					},
					[L"Torment"] =
					{
						normal =
						{
							min = 51,
							total = 267,
							count = 4,
							abs = 0,
							max = 74,
							mit = 76,
							overheal = 0,
							total = 3250,
							abs = 358,
							min = 0,
							count = 39,
							max = 126,
							mit = 1259,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 8,
								name = L"Fockigob",
								id = 3792,
								level = 9,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
								hp = 100,
								isFriendly = false,
							},
						},
						dodge = 0,
						disrupt = 0,
						block = 1,
						crit =
						{
							overheal = 0,
							total = 1682,
							abs = 0,
							min = 67,
							count = 12,
							max = 202,
							mit = 540,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 23,
								name = L"Vires",
								id = 4378,
								level = 13,
								hp = 100,
								isFriendly = false,
							},
							mit = 38,
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Darkrite",
								id = 3850,
								level = 12,
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
					[L"Bleed Fer' Me"] =
					{
						normal =
						{
							overheal = 0,
							total = 685,
							abs = 0,
							min = 9,
							count = 36,
							max = 36,
							mit = 904,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								name = L"Anonencore",
								id = 3832,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 829,
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
							total = 89,
							abs = 0,
							min = 23,
							count = 3,
							max = 36,
							mit = 123,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 23,
								name = L"Vires",
								id = 4378,
								level = 13,
								hp = 100,
								isFriendly = false,
							},
							mit = 182,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Savage Gorehorn",
								id = 888,
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
					[L"Consume Essence"] =
					{
						normal =
						{
							min = 65,
							total = 729,
							count = 8,
							abs = 0,
							max = 106,
							mit = 246,
							overheal = 0,
							total = 1658,
							max = 55,
							min = 37,
							count = 36,
							abs = 0,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								name = L"Tainted Hound",
								career = 0,
								id = 1180,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							mit = 0,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Blackhand the Deceiver",
								id = 3937,
								level = 7,
								hp = 30,
								isFriendly = false,
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
								career = 0,
								name = L"Nurgling",
								id = 204,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
							mit = 0,
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Nurgling",
								id = 204,
								level = 1,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Marshal - Divine Aid"] =
					{
						normal =
						{
							overheal = 0,
							total = 5899,
							abs = 0,
							min = 81,
							count = 31,
							max = 286,
							mit = 642,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 23,
								name = L"Sistermanic",
								id = 3883,
								level = 6,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 7,
								name = L"Shieldahila",
								id = 3882,
								level = 10,
								hp = 72,
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
					[L"Vyamon - Rune of Mending"] =
					{
						normal =
						{
							overheal = 0,
							total = 2629,
							abs = 0,
							min = 39,
							count = 43,
							max = 145,
							mit = 1195,
							maxObject =
							{
								isNpc = false,
								type = "selfhostiletarget",
								career = 15,
								name = L"Frfqm",
								id = 3785,
								level = 15,
								hp = 91,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Argog the Unstoppable",
								id = 829,
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
							total = 171,
							abs = 0,
							min = 80,
							count = 2,
							max = 91,
							mit = 80,
							maxObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Filthy Spider",
								id = 2330,
								level = 4,
								hp = 100,
								isFriendly = false,
							},
							minObject =
							{
								isNpc = true,
								type = "selfhostiletarget",
								career = 0,
								name = L"Sigmundi Spirit",
								id = 1723,
								level = 3,
								hp = 100,
								isFriendly = false,
							},
						},
						parry = 0,
					},
					[L"Vyamon - Rune of Shielding"] =
					{
						normal =
						{
							min = 142,
							total = 142,
							count = 1,
							abs = 0,
							max = 142,
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
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 87,
								isFriendly = true,
							},
							mit = 0,
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
								isFriendly = true,
							},
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
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 100,
								isFriendly = true,
							},
							mit = 0,
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
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
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 92,
								isFriendly = true,
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
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 78,
								isFriendly = true,
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
								career = 12,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 100,
								isFriendly = true,
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
							overheal = 0,
							total = 0,
							count = 0,
							abs = 0,
							mit = 0,
						},
						parry = 0,
					},
					[L"Beardhealer - Grungni's Gift"] =
					{
						normal =
						{
							min = 196,
							total = 2260,
							count = 11,
							abs = 0,
							max = 209,
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
					[L"Xlnt - Prayer of Devotion"] =
					{
						normal =
						{
							overheal = 599,
							total = 1662,
							abs = 0,
							min = 133,
							count = 17,
							max = 133,
							mit = 0,
							maxObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 9,
								name = L"Xlnt",
								id = 3628,
								level = 6,
								hp = 73,
								isFriendly = true,
							},
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 9,
								name = L"Xlnt",
								id = 3628,
								level = 6,
								hp = 73,
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
					[L"Vyamon - Grungni's Gift"] =
					{
						normal =
						{
							min = 202,
							total = 335,
							count = 2,
							abs = 0,
							max = 202,
							mit = 0,
							overheal = 69,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 301,
							total = 301,
							count = 1,
							abs = 0,
							max = 301,
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
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 77,
								isFriendly = true,
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
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 66,
								isFriendly = true,
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
							max = 199,
							min = 199,
							count = 2,
							abs = 0,
							maxObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
								isFriendly = true,
							},
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
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
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 7,
								hp = 100,
								isFriendly = true,
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
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 98,
								isFriendly = true,
							},
							mit = 0,
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								isFriendly = true,
								career = 12,
								id = 114,
								level = 5,
								hp = 100,
								name = L"Rybert",
							},
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
					[L"Beardhealer - Rune of Regeneration"] =
					{
						normal =
						{
							min = 185,
							total = 279,
							count = 3,
							abs = 0,
							max = 185,
							mit = 0,
							overheal = 276,
						},
						dodge = 0,
						disrupt = 0,
						block = 0,
						crit =
						{
							min = 276,
							total = 557,
							count = 2,
							abs = 0,
							max = 281,
							mit = 0,
							overheal = 0,
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
							max = 160,
							min = 73,
							count = 98,
							abs = 0,
							maxObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2305,
								level = 7,
								hp = 100,
								isFriendly = true,
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
								career = 17,
								name = L"Eladorin",
								id = 2470,
								level = 11,
								hp = 26,
								isFriendly = true,
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
								career = 11,
								name = L"Nightswatch",
								id = 3769,
								level = 11,
								hp = 10,
								isFriendly = true,
							},
							mit = 0,
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 11,
								name = L"Nightswatch",
								id = 3769,
								level = 11,
								hp = 10,
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
								name = L"Rybert",
								career = 12,
								id = 114,
								level = 10,
								hp = 100,
								isFriendly = true,
							},
							mit = 0,
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 8,
								hp = 100,
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
								career = 12,
								name = L"Rybert",
								id = 2800,
								level = 7,
								hp = 100,
								isFriendly = true,
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
								isFriendly = true,
								career = 12,
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
								career = 17,
								name = L"Eladorin",
								id = 2470,
								level = 11,
								hp = 26,
								isFriendly = true,
							},
							mit = 0,
							minObject =
							{
								isNpc = false,
								type = "selffriendlytarget",
								career = 17,
								name = L"Eladorin",
								id = 2470,
								level = 11,
								hp = 62,
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
								career = 17,
								name = L"Eladorin",
								id = 2470,
								level = 11,
								hp = 70,
								isFriendly = true,
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
								career = 18,
								name = L"Svanson",
								id = 2376,
								level = 3,
								hp = 67,
								isFriendly = true,
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
	playerKills = 10,
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
		scale = 1,
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
		color =
		{
			b = 0,
			g = 0,
			r = 255,
		},
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
		destructionPoints = 163,
		id = 2106,
		queuedWithGroup = false,
		activeQueue = 0,
		mode = 2,
		orderPoints = 500,
		timeLeft = 63.429965151474,
		pointMax = 500,
	},
	guardDistanceIndicator = 2,
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
	combatLogLogParseErrors = true,
	groupIconsTargetOnClick = true,
	version = 279,
	guardDistanceIndicatorScaleNormal = 1,
	chatThrottleDelay = 10,
	unitFramesEnabled = true,
	playerDeaths = 13,
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
			id = "22846",
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
			id = "22847",
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
			id = "22848",
			data =
			{
				pos =
				{
					35,
					3,
				},
				offlineHide = true,
				layer = 1,
				anchorTo = "topleft",
				color =
				{
					150,
					190,
					255,
				},
				wrap = false,
				anchorFrom = "topleft",
				scale = 1,
				texture = "default",
				vertical = false,
				deadHide = true,
				alpha = 1,
				textureFullResize = true,
				distHide = false,
				distAlpha = 0.5,
				size =
				{
					129,
					59,
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
			id = "22849",
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
			id = "22850",
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
			id = "22851",
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
			id = "22852",
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
			id = "22853",
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
			id = "22854",
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
			id = "22855",
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
			id = "22856",
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
			id = "22857",
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
	combatLogIDSRowScale = 1,
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
	soundOnNewTargetId = 500,
	unitFramesMyGroupFirst = true,
	combatLogTargetDefenseScale = 1,
	unitFramesGroupsDirection2 = 4,
	scenarioInfoPlayers =
	{

		{
			deaths = 1,
			renown = 3490,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 65,
			name = L"Eloran",
			career = 18,
			db = 5,
			level = 12,
			exp = 22293,
			damage = 26565,
		},

		{
			deaths = 0,
			renown = 2698,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 68,
			name = L"Zumir",
			career = 10,
			db = 6,
			level = 14,
			exp = 26362,
			damage = 33033,
		},

		{
			deaths = 3,
			renown = 1936,
			healing = 31632,
			soloKills = 0,
			realm = 2,
			kills = 18,
			name = L"Mivea",
			career = 23,
			db = 0,
			level = 7,
			exp = 7231,
			damage = 990,
		},

		{
			deaths = 1,
			renown = 2970,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 64,
			name = L"Exoteks",
			career = 11,
			db = 7,
			level = 14,
			exp = 22018,
			damage = 40149,
		},

		{
			deaths = 4,
			renown = 2053,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 16,
			name = L"Sakiados",
			career = 24,
			db = 4,
			level = 9,
			exp = 9033,
			damage = 22886,
		},

		{
			deaths = 2,
			renown = 3637,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 48,
			name = L"Xlnt",
			career = 9,
			db = 2,
			level = 8,
			exp = 19762,
			damage = 4099,
		},

		{
			deaths = 2,
			renown = 4168,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 53,
			name = L"Babajagerjr",
			career = 19,
			db = 5,
			level = 12,
			exp = 18686,
			damage = 24859,
		},

		{
			deaths = 4,
			renown = 1831,
			healing = 16443,
			soloKills = 0,
			realm = 2,
			kills = 13,
			name = L"Vampelfo",
			career = 23,
			db = 1,
			level = 6,
			exp = 4915,
			damage = 1915,
		},

		{
			deaths = 6,
			renown = 1394,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 16,
			name = L"Brackfang",
			career = 5,
			db = 2,
			level = 15,
			exp = 8189,
			damage = 15524,
		},

		{
			deaths = 2,
			renown = 1914,
			healing = 67244,
			soloKills = 0,
			realm = 2,
			kills = 19,
			name = L"Elvoletta",
			career = 15,
			db = 0,
			level = 8,
			exp = 7896,
			damage = 0,
		},

		{
			deaths = 6,
			renown = 1705,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 20,
			name = L"Equithings",
			career = 8,
			db = 2,
			level = 12,
			exp = 7953,
			damage = 37252,
		},

		{
			deaths = 10,
			renown = 1829,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 21,
			name = L"Schlimmshady",
			career = 13,
			db = 1,
			level = 9,
			exp = 8178,
			damage = 19927,
		},

		{
			deaths = 1,
			renown = 4963,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 59,
			name = L"Bouglir",
			career = 1,
			db = 4,
			level = 6,
			exp = 21616,
			damage = 10872,
		},

		{
			deaths = 3,
			renown = 2203,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 34,
			name = L"Lepibreno",
			career = 2,
			db = 4,
			level = 13,
			exp = 15264,
			damage = 32613,
		},

		{
			deaths = 4,
			renown = 1876,
			healing = 24599,
			soloKills = 0,
			realm = 2,
			kills = 13,
			name = L"Evraggg",
			career = 7,
			db = 1,
			level = 2,
			exp = 8617,
			damage = 2286,
		},

		{
			deaths = 2,
			renown = 2639,
			healing = 47159,
			soloKills = 0,
			realm = 2,
			kills = 19,
			name = L"Excedryn",
			career = 15,
			db = 0,
			level = 6,
			exp = 9289,
			damage = 662,
		},

		{
			deaths = 4,
			renown = 4135,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 57,
			name = L"Rugrog",
			career = 4,
			db = 2,
			level = 11,
			exp = 19588,
			damage = 68373,
		},

		{
			deaths = 0,
			renown = 2719,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 68,
			name = L"Dollardance",
			career = 18,
			db = 11,
			level = 14,
			exp = 23102,
			damage = 34916,
		},

		{
			deaths = 0,
			renown = 5297,
			healing = 76617,
			soloKills = 0,
			realm = 1,
			kills = 68,
			name = L"Goldenarchmage",
			career = 20,
			db = 4,
			level = 6,
			exp = 26667,
			damage = 5714,
		},

		{
			deaths = 0,
			renown = 4008,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 59,
			name = L"Cogger",
			career = 4,
			db = 6,
			level = 12,
			exp = 20909,
			damage = 37857,
		},

		{
			deaths = 8,
			renown = 1602,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 19,
			name = L"Stockshtall",
			career = 5,
			db = 4,
			level = 11,
			exp = 8098,
			damage = 7989,
		},

		{
			deaths = 1,
			renown = 2871,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 47,
			name = L"Tyriol",
			career = 17,
			db = 3,
			level = 12,
			exp = 17093,
			damage = 18869,
		},

		{
			deaths = 0,
			renown = 2958,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 68,
			name = L"Sokeas",
			career = 10,
			db = 7,
			level = 10,
			exp = 23102,
			damage = 23759,
		},

		{
			deaths = 4,
			renown = 1420,
			healing = 2544,
			soloKills = 0,
			realm = 2,
			kills = 12,
			name = L"Dwarffslayer",
			career = 5,
			db = 0,
			level = 6,
			exp = 4832,
			damage = 3903,
		},

		{
			deaths = 2,
			renown = 2754,
			healing = 889,
			soloKills = 0,
			realm = 1,
			kills = 44,
			name = L"Vostol",
			career = 19,
			db = 2,
			level = 11,
			exp = 17384,
			damage = 22906,
		},

		{
			deaths = 0,
			renown = 3226,
			healing = 36306,
			soloKills = 0,
			realm = 1,
			kills = 45,
			name = L"Azae",
			career = 20,
			db = 2,
			level = 5,
			exp = 16578,
			damage = 8484,
		},

		{
			deaths = 4,
			renown = 2122,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 20,
			name = L"Miasoo",
			career = 8,
			db = 2,
			level = 9,
			exp = 8351,
			damage = 20440,
		},

		{
			deaths = 5,
			renown = 1752,
			healing = 922,
			soloKills = 0,
			realm = 2,
			kills = 16,
			name = L"Aelaark",
			career = 21,
			db = 0,
			level = 10,
			exp = 6604,
			damage = 11598,
		},

		{
			deaths = 0,
			renown = 3316,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 45,
			name = L"Darhin",
			career = 4,
			db = 2,
			level = 9,
			exp = 16457,
			damage = 13908,
		},

		{
			deaths = 5,
			renown = 1977,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 18,
			name = L"Kiekefretter",
			career = 14,
			db = 2,
			level = 5,
			exp = 7425,
			damage = 18006,
		},

		{
			deaths = 6,
			renown = 2662,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 21,
			name = L"Wakz",
			career = 8,
			db = 1,
			level = 5,
			exp = 9859,
			damage = 17756,
		},

		{
			deaths = 4,
			renown = 3416,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 52,
			name = L"Ekynox",
			career = 9,
			db = 5,
			level = 5,
			exp = 21081,
			damage = 21572,
		},

		{
			deaths = 0,
			renown = 193,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 2,
			name = L"Valynh",
			career = 21,
			db = 0,
			level = 4,
			exp = 2820,
			damage = 812,
		},

		{
			deaths = 2,
			renown = 5242,
			healing = 0,
			soloKills = 0,
			realm = 1,
			kills = 57,
			name = L"Neirke",
			career = 11,
			db = 1,
			level = 4,
			exp = 19640,
			damage = 26457,
		},

		{
			deaths = 4,
			renown = 1138,
			healing = 0,
			soloKills = 0,
			realm = 2,
			kills = 11,
			name = L"Rodeowww",
			career = 6,
			db = 0,
			level = 5,
			exp = 4311,
			damage = 3932,
		},

		{
			deaths = 1,
			renown = 2056,
			healing = 39237,
			soloKills = 0,
			realm = 2,
			kills = 17,
			name = L"Xeration",
			career = 7,
			db = 3,
			level = 2,
			exp = 7262,
			damage = 16676,
		},
	},
}




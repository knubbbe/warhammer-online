HealGridSkin_MelliLarge = {

	skin = {
		id = "MELLI_LARGE",
		name = L"Melli - Large",
		author = "rmet0815",
		sortCriteria = "MELLI_30",
	},

	hud = {
		unitFrame = {
			background = {
				color = "HEALTHCOLOR",
				texture = "Melli",
				style = "FILL",
			},
			healthPointsBar = {
				foreground = {
					isVisible = true,
					color = "GREEN",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = true,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = true,
				isVisible = false,
			},
			actionPointsBar = {
				foreground = {
					isVisible = true,
					color = "ROYAL_BLUE",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = false,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = true,
				isVisible = false,
			},
			moraleLevelBar = {
				foreground = {
					isVisible = true,
					color = "DARK_SLATE_GRAY",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = false,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = true,
				isVisible = false,
			},
		},
		actionPointFrame = {
			border = {
				width = 1,
				height = 1,
				color = 'BLACK',
			},
			foreground = {
				color = 'DEEP_SKY_BLUE',
				texture = "Aluminium",
				style = "FILL",
			},
			background = {
				color = 'GRAY80',
				texture = "HalP",
				style = "FILL",
			},
		},
		careerFrame = {
			border = {
				width = 1,
				height = 1,
				color = 'BLACK',
			},
			foreground = {
				color = 'FUCHSIA',
				texture = "Aluminium",
				style = "FILL",
			},
			background = {
				color = 'GRAY80',
				texture = "HalP",
				style = "FILL",
			},
		},
		moraleFrame = {
			border = {
				width = 1,
				height = 1,
				color = 'BLACK',
			},
			foreground = {
				color = 'STEEL_BLUE',
				texture = "Aluminium",
				style = "FILL",
			},
			background = {
				color = 'GRAY80',
				texture = "HalP",
				style = "FILL",
			},
		},
		castFrame = {
			border = {
				width = 1,
				height = 1,
				color = 'BLACK',
			},
			foreground = {
				color = { r=255, g=210, b=0 },
				channelColor = { r=173, g=255, b=47 },
				failureColor = { r=178, g=34, b=34 },
				globalCooldownColor = { r=210, g=105, b=30 },
				texture = "Aluminium",
				style = "FILL",
			},
			background = {
				color = 'GRAY80',
				texture = "HalP",
				style = "FILL",
			},
		},
	},

	grid = {
		unitFrame = {
			background = {
				color = "HEALTHCOLOR",
				texture = "Melli",
				style = "FILL",
			},
			healthPointsBar = {
				foreground = {
					isVisible = true,
					color = "GREEN",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = true,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = true,
				isVisible = false,
			},
			actionPointsBar = {
				foreground = {
					isVisible = true,
					color = "ROYAL_BLUE",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = false,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = true,
				isVisible = false,
			},
			moraleLevelBar = {
				foreground = {
					isVisible = true,
					color = "DARK_SLATE_GRAY",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = false,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = true,
				isVisible = false,
			},
		},
	},
};

HealGridSkin.RegisterSkin( HealGridSkin_MelliLarge, 'SHARP_LARGE' );

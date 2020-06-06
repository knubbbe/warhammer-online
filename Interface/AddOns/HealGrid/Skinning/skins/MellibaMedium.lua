HealGridSkin_MellibaMedium = {

	skin = {
		id = "MELLIBA_MEDIUM",
		name = L"Melliba - Medium",
		author = "rmet0815",
		sortCriteria = "MELLIBA_20",
	},

	hud = {
		unitFrame = {
			background = {
				color = "RED",
				texture = "MelliDark",
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
					isVisible = false,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = false,
				isVisible = true,
			},
			actionPointsBar = {
				isVisible = true,
			},
		},
	},

	grid = {
		unitFrame = {
			background = {
				color = "BLACK",
				texture = "MelliDark",
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
					isVisible = false,
					color = "BLACK",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = false,
				isVisible = true,
			},
			actionPointsBar = {
				isVisible = true,
			},
		},
	},
};

HealGridSkin.RegisterSkin( HealGridSkin_MellibaMedium, 'MELLI_MEDIUM' );

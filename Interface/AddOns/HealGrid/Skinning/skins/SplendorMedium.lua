HealGridSkin_SplendorMedium = {

	skin = {
		id = "SPLENDOR_MEDIUM",
		name = L"Splendor - Medium",
		author = "rmet0815",
		sortCriteria = "SPLENDOR_20",
	},

	hud = {
		unitFrame = {
			background = {
				color = "HEALTHCOLOR",
				texture = "MelliDarkRough",
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
					texture = "MelliDarkRough",
					style = "FILL",
				},
				isToggleable = false,
				isVisible = true,
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
					color = "GOLD",
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
				color = { r=71, g=132, b=214 },
				texture = "Aluminium",
				style = "FILL",
			},
			background = {
				color = 'IVORY',
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
				color = { r=255, g=0, b=255 },
				texture = "Aluminium",
				style = "FILL",
			},
			background = {
				color = 'IVORY',
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
				color = { r=8, g=68, b=90 },
				texture = "Aluminium",
				style = "FILL",
			},
			background = {
				color = 'IVORY',
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
				color = 'IVORY',
				texture = "HalP",
				style = "FILL",
			},
		},
	},

	grid = {
		unitFrame = {
			background = {
				color = "HEALTHCOLOR",
				texture = "MelliDarkRough",
				style = "FILL",
			},
			healthPointsBar = {
				anchor1 = { windowName="SELF", point="TOPLEFT", relativeTo="PARENT", relativePoint="TOPLEFT", offsetX="0", offsetY="0", },
				anchor2 = { windowName="SELF", point="BOTTOMRIGHT", relativeTo="PARENT", relativePoint="BOTTOMRIGHT", offsetX="0", offsetY="-10%", },
				growth = "BOTTOM_TOP",
				foreground = {
					isVisible = true,
					color = "GREEN",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = false,
					color = "BLACK",
					texture = "MelliDarkRough",
					style = "FILL",
				},
				isToggleable = false,
				isVisible = true,
			},
			actionPointsBar = {
				anchor1 = { windowName="SELF", point="BOTTOMLEFT", relativeTo="PARENT", relativePoint="TOPLEFT", offsetX="0", offsetY="-10%", },
				anchor2 = { windowName="SELF", point="BOTTOMRIGHT", relativeTo="PARENT", relativePoint="BOTTOMRIGHT", offsetX="0", offsetY="0", },
				growth = "LEFT_RIGHT",
				foreground = {
					isVisible = true,
					color = "ROYAL_BLUE",
					texture = "Aluminium",
					style = "FILL",
				},
				background = {
					isVisible = true,
					color = "LIGHT_SLATE_GRAY",
					texture = "Fourths",
					style = "FILL",
				},
				isToggleable = false,
				isVisible = true,
			},
			moraleLevelBar = {
				anchor1 = { windowName="SELF", point="TOPRIGHT", relativeTo="PARENT", relativePoint="TOPLEFT", offsetX="-10%", offsetY="0", },
				anchor2 = { windowName="SELF", point="BOTTOMRIGHT", relativeTo="PARENT", relativePoint="BOTTOMRIGHT", offsetX="0", offsetY="-10%", },
				growth = "BOTTOM_TOP",
				foreground = {
					isVisible = true,
					color = "ORANGE",
					texture = "Melli",
					style = "FILL",
				},
				background = {
					isVisible = true,
					color = "KHAKI",
					texture = "MelliDark",
					style = "FILL",
				},
				isToggleable = true,
				isVisible = false,
			},
		},
	},
};

HealGridSkin.RegisterSkin( HealGridSkin_SplendorMedium, 'SHARP_MEDIUM' );

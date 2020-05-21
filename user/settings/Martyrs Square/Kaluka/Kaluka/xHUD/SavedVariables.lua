xHUD.Settings = 
{
	xHUDFriendlyTargetIcon = 
	{
		enabled = true,
		x = 694.99993896484,
		scale = 0.34000000357628,
		parent = "xHUDFriendlyTargetHP",
		layouteditor = true,
		y = 350,
	},
	xHUDPlayerMorale = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			0,
			0,
			255,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = true,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 381.59997558594,
		x = 1304.0999755859,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_LeftGlowArc",
		ooc_alpha = 0,
		color2 = 
		{
			150,
			150,
			255,
		},
	},
	xHUDPlayerAP = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			255,
			255,
			0,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = false,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 350.09997558594,
		x = 716.39996337891,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_LeftGlowArc",
		ooc_alpha = 0,
	},
	updateDelay = 0.5,
	xHUDFriendlyTargetHP = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			100,
			100,
			255,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = false,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 387,
		x = 1331.0999755859,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_RightGlowArc",
		uselti = false,
		ooc_alpha = 0,
	},
	xHUDPlayerRP = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			180,
			0,
			230,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = true,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 373.5,
		x = 1291.5,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_LeftGlowArc",
		ooc_alpha = 0,
	},
	xHUDHostileTargetIcon = 
	{
		enabled = true,
		x = 709.99993896484,
		scale = 0.34000000357628,
		parent = "xHUDHostileTargetHP",
		layouteditor = true,
		y = 350,
	},
	FriendlyTargetBuffs = 
	{
		direction2 = "left",
		ooc_alpha = 0,
		layouteditor = true,
		unit = 8,
		selfbuff = false,
		direction1 = "up",
		clickthrough = false,
		size = 40,
		enabled = true,
		max = 10,
		alpha = 1,
		y = 575,
		x = 640,
		arc = 75,
		frame = "xHUDFriendlyTargetBuff",
		no_target_fade = true,
		counter = 0,
	},
	HostileTargetBuffs = 
	{
		direction2 = "right",
		ooc_alpha = 0,
		layouteditor = true,
		unit = 7,
		selfbuff = false,
		direction1 = "up",
		clickthrough = false,
		size = 40,
		enabled = true,
		max = 10,
		alpha = 1,
		y = 575,
		x = 715,
		arc = 75,
		frame = "xHUDHostileTargetBuff",
		no_target_fade = true,
		counter = 0,
	},
	xHUDPlayerHP = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			0,
			255,
			0,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = false,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 341.09997558594,
		x = 613.79998779297,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_LeftGlowArc",
		ooc_alpha = 0,
	},
	Texts = 
	{
		FriendName = 
		{
			parent = "xHUDFriendlyTargetHP",
			scale = 0.72000002861023,
			text = "[$friend_level$friend_tier] $friend_name ($friend_hp%)",
			layouteditor = true,
			width = 350,
			y = 604,
			line = 
			{
				"[",
				17,
				19,
				"] ",
				14,
				" (",
				11,
				"%)",
			},
			font = "font_clear_medium_bold",
			align = "center",
			height = 30,
			color = 
			{
				100,
				100,
				255,
			},
			flags = 
			{
				[17] = true,
				[14] = true,
				[11] = true,
				[19] = true,
			},
			x = 563.99993896484,
		},
		PlayerHP = 
		{
			parent = "xHUDPlayerHP",
			scale = 0.72000002861023,
			text = "$cur_hp/$max_hp",
			layouteditor = true,
			width = 200,
			y = 604,
			line = 
			{
				1,
				"/",
				2,
			},
			font = "font_clear_medium_bold",
			align = "center",
			height = 25,
			color = 
			{
				0,
				255,
				0,
			},
			flags = 
			{
				true,
				true,
			},
			x = 420,
		},
		PlayerAP = 
		{
			parent = "xHUDPlayerAP",
			scale = 0.72000002861023,
			text = "$cur_ap/$max_ap",
			layouteditor = true,
			width = 200,
			y = 622,
			line = 
			{
				5,
				"/",
				6,
			},
			font = "font_clear_medium_bold",
			align = "center",
			height = 25,
			color = 
			{
				255,
				255,
				0,
			},
			flags = 
			{
				[5] = true,
				[6] = true,
			},
			x = 420,
		},
		PlayerCareer = 
		{
			parent = "xHUDPlayerCareer",
			scale = 0.72000002861023,
			text = "$cur_career",
			layouteditor = true,
			width = 200,
			y = 636,
			line = 
			{
				[1] = 8,
			},
			font = "font_clear_medium_bold",
			align = "center",
			height = 25,
			color = 
			{
				200,
				100,
				255,
			},
			flags = 
			{
				[8] = true,
			},
			x = 420,
		},
		EnemyName = 
		{
			parent = "xHUDHostileTargetHP",
			scale = 0.72000002861023,
			text = "[$enemy_level$enemy_tier] $enemy_name ($enemy_hp%)",
			layouteditor = true,
			width = 350,
			y = 622,
			line = 
			{
				"[",
				18,
				20,
				"] ",
				15,
				" (",
				12,
				"%)",
			},
			font = "font_clear_medium_bold",
			align = "center",
			height = 30,
			color = 
			{
				255,
				0,
				0,
			},
			flags = 
			{
				[20] = true,
				[18] = true,
				[15] = true,
				[12] = true,
			},
			x = 563.99993896484,
		},
	},
	PlayerBuffs = 
	{
		direction2 = "left",
		ooc_alpha = 0,
		layouteditor = true,
		unit = 6,
		selfbuff = false,
		direction1 = "up",
		clickthrough = false,
		size = 40,
		enabled = true,
		max = 10,
		alpha = 1,
		y = 575,
		x = 420,
		arc = -75,
		frame = "xHUDPlayerBuff",
		no_target_fade = true,
		counter = 1,
	},
	xHUDPlayerXP = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			0,
			255,
			150,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = true,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 375.29998779297,
		x = 1215.9000244141,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_LeftGlowArc",
		ooc_alpha = 0,
		color2 = 
		{
			0,
			0,
			0,
		},
	},
	version = 2,
	xHUDHostileTargetHP = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			255,
			0,
			0,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = true,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 383.40002441406,
		x = 1238.4000244141,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_RightGlowArc",
		uselti = false,
		ooc_alpha = 0,
	},
	xHUDPlayerCareer = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			200,
			100,
			255,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = true,
		smooth = true,
		enabled = true,
		texture = "xHUD_LeftGlowArc",
		alpha = 1,
		width = 200,
		color2 = 
		{
			255,
			100,
			50,
		},
		x = 1250.0999755859,
		inverse = false,
		no_target_fade = true,
		height = 400,
		ooc_alpha = 0,
		color3 = 
		{
			185,
			1,
			1,
		},
		y = 369.90002441406,
	},
	xHUDCastBar = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			255,
			255,
			255,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = true,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 300,
		y = 590,
		x = 470,
		inverse = false,
		no_target_fade = true,
		height = 20,
		texture = "xHUD_HorizontalFuzzyBar",
		ooc_alpha = 1,
	},
	xHUDPlayerInf = 
	{
		direction = "down",
		bgcolor = 
		{
			0,
			0,
			0,
		},
		color = 
		{
			0,
			0,
			255,
		},
		bgalpha = 0.2,
		layouteditor = true,
		clickthrough = true,
		smooth = true,
		enabled = true,
		alpha = 1,
		width = 200,
		y = 394.19995117188,
		x = 1175.4000244141,
		inverse = false,
		no_target_fade = true,
		height = 400,
		texture = "xHUD_LeftGlowArc",
		ooc_alpha = 0,
	},
	smoothDelay = 0.5,
}




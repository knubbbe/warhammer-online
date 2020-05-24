BuffHead.Settings = 
{
	Fading = 
	{
		Enable = true,
	},
	Trackers = 
	{
		Group = 
		{
			Enabled = true,
			Debuffs = 2,
			AlwaysShow = 
			{
			},
			Buffs = 2,
			AlwaysIgnore = 
			{
			},
			Permanent = false,
		},
		Self = 
		{
			Enabled = true,
			Debuffs = 2,
			AlwaysShow = 
			{
			},
			Buffs = 2,
			AlwaysIgnore = 
			{
			},
			Permanent = false,
		},
		Friendly = 
		{
			Enabled = true,
			Debuffs = 2,
			Permanent = false,
			AlwaysShow = 
			{
			},
			Buffs = 2,
			AlwaysIgnore = 
			{
			},
			OnTargetChange = 
			{
				ClearBuffs = true,
				ClearAlwaysShow = true,
				ClearDebuffs = true,
			},
		},
		Hostile = 
		{
			Enabled = true,
			Debuffs = 2,
			Permanent = false,
			AlwaysShow = 
			{
			},
			Buffs = 1,
			AlwaysIgnore = 
			{
			},
			OnTargetChange = 
			{
				ClearBuffs = false,
				ClearAlwaysShow = false,
				ClearDebuffs = false,
			},
		},
	},
	Indicators = 
	{
		Compression = 4,
		Padding = 
		{
			Y = 1,
			X = 0,
		},
	},
	Scale = 0.68000000715256,
	PriorityEffects = 
	{
		SortToFront = true,
		Animation = 2,
		Effect = 
		{
		},
	},
	AlwaysShow = 
	{
		[412] = true,
		[413] = true,
		[414] = true,
		Immovable = true,
		Unstoppable = true,
		[402] = true,
		[403] = true,
		[404] = true,
		[405] = true,
		[406] = true,
		[407] = true,
		[408] = true,
	},
	AdvancedContainers = 
	{
	},
	Performance = 
	{
		PriorityUpdate = true,
		PriorityStart = 3,
		GeneralDelay = 1,
		MaximumUpdates = 0,
		PriorityDelay = 0.1,
		EffectAnchoring = 2,
	},
	Offset = 
	{
		Y = -5,
		X = 0,
	},
	Layer = 1,
	AdvancedCompression = 
	{
	},
	Layouts = 
	{
	},
	MaximumThreshold = 60,
	Version = 9,
	Sync = 
	{
		Enable = true,
		ResyncEvery = 10,
	},
	Layout = 
	{
		StatusBar = 
		{
			Enabled = false,
			Scale = 1,
			Layer = 1,
			Width = 48,
			Y = 48,
			X = 0,
			Reverse = false,
			Height = 16,
			Background = 
			{
				Color = 
				{
					R = 0,
					G = 0,
					B = 0,
				},
				TextureDimensions = 
				{
					Height = 128,
					Width = 128,
				},
				Stretch = true,
				Alpha = 0.8,
				Texture = "EA_TintableImage",
			},
			Foreground = 
			{
				Type = 1,
				Color = 
				{
					R = 255,
					G = 255,
					B = 255,
				},
				TextureDimensions = 
				{
					Height = 128,
					Width = 128,
				},
				Stretch = true,
				Alpha = 1,
				Texture = "EA_TintableImage",
			},
			Orientation = 1,
		},
		Name = 
		{
			Scale = 1,
			Layer = 2,
			Alpha = 0,
			Width = 48,
			Y = 12,
			X = 50,
			Alignment = "leftcenter",
			Height = 16,
			Color = 
			{
				R = 255,
				G = 255,
				B = 255,
			},
			Font = "font_clear_small",
		},
		Height = 48,
		StackCount = 
		{
			Scale = 1,
			Layer = 2,
			Alpha = 1,
			Width = 48,
			Y = 2,
			X = 0,
			Alignment = "rightcenter",
			Height = 16,
			Color = 
			{
				R = 255,
				G = 255,
				B = 255,
			},
			Font = "font_clear_small_bold",
		},
		Duration = 
		{
			Scale = 1,
			Layer = 2,
			Alpha = 1,
			Width = 48,
			Y = 30,
			X = 0,
			Alignment = "center",
			Height = 16,
			Format = 3,
			Color = 
			{
				R = 255,
				G = 255,
				B = 255,
			},
			Font = "font_clear_small_bold",
		},
		Icon = 
		{
			Y = 0,
			X = 0,
			Height = 48,
			Alpha = 1,
			Scale = 1,
			Layer = 1,
			Border = 
			{
				Color = 
				{
					R = 0,
					G = 0,
					B = 0,
				},
				Type = 1,
				Alpha = 1,
			},
			Width = 48,
		},
		Width = 48,
	},
	Containers = 
	{
		AlwaysShow = 
		{
			Anchor = 1,
			Placement = 1,
			Size = 
			{
				Columns = 10,
				Rows = 1,
			},
		},
		Buffs = 
		{
			Anchor = 2,
			Placement = 1,
			Size = 
			{
				Columns = 10,
				Rows = 1,
			},
		},
		Debuffs = 
		{
			Anchor = 3,
			Placement = 1,
			Size = 
			{
				Columns = 10,
				Rows = 1,
			},
		},
		Padding = 
		{
			Y = 5,
			X = 0,
		},
	},
	AlwaysIgnore = 
	{
	},
	Sorting = 
	{
		Enabled = true,
		Type = 1,
		Direction = 2,
	},
}




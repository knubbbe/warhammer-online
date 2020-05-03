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
		Friendly = 
		{
			Enabled = true,
			Debuffs = 2,
			OnTargetChange = 
			{
				ClearBuffs = false,
				ClearAlwaysShow = true,
				ClearDebuffs = true,
			},
			AlwaysShow = 
			{
			},
			Buffs = 2,
			AlwaysIgnore = 
			{
			},
			Permanent = false,
		},
		Hostile = 
		{
			Enabled = true,
			Debuffs = 2,
			OnTargetChange = 
			{
				ClearBuffs = false,
				ClearAlwaysShow = false,
				ClearDebuffs = false,
			},
			AlwaysShow = 
			{
			},
			Buffs = 1,
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
	},
	Indicators = 
	{
		Padding = 
		{
			Y = 5,
			X = 2,
		},
		Compression = 3,
	},
	Scale = 0.75,
	PriorityEffects = 
	{
		SortToFront = true,
		Effect = 
		{
		},
		Animation = 2,
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
		EffectAnchoring = 2,
		PriorityDelay = 0.1,
		MaximumUpdates = 0,
	},
	Offset = 
	{
		Y = 20,
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
				TextureDimensions = 
				{
					Height = 128,
					Width = 128,
				},
				Color = 
				{
					B = 0,
					G = 0,
					R = 0,
				},
				Stretch = true,
				Alpha = 0.8,
				Texture = "EA_TintableImage",
			},
			Orientation = 1,
			Foreground = 
			{
				Type = 1,
				TextureDimensions = 
				{
					Height = 128,
					Width = 128,
				},
				Color = 
				{
					B = 255,
					G = 255,
					R = 255,
				},
				Stretch = true,
				Alpha = 1,
				Texture = "EA_TintableImage",
			},
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
			Font = "font_clear_small",
			Color = 
			{
				B = 255,
				G = 255,
				R = 255,
			},
		},
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
			Font = "font_clear_small_bold",
			Color = 
			{
				B = 255,
				G = 255,
				R = 255,
			},
		},
		Height = 48,
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
			Font = "font_clear_small_bold",
			Color = 
			{
				B = 255,
				G = 255,
				R = 255,
			},
		},
		Icon = 
		{
			Y = 0,
			X = 0,
			Scale = 1,
			Border = 
			{
				Color = 
				{
					B = 0,
					G = 0,
					R = 0,
				},
				Type = 1,
				Alpha = 1,
			},
			Height = 48,
			Layer = 1,
			Alpha = 1,
			Width = 48,
		},
		Width = 48,
	},
	Sync = 
	{
		Enable = true,
		ResyncEvery = 10,
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
		Padding = 
		{
			Y = 5,
			X = 0,
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





MothProfiles = { }

-- | Marvel at the amazing MothProfiles!  The method behind the madness that makes up the matrix of all that is Moth.
-- | 
-- | MothProfiles
-- | .profileName	-> pretty self-explanatory, at some point, a "Custom" profile will be gleaned from GUI configuration + SavedVariables
-- | .Global 		-> variables that contribute to Moth's aesthetics
-- | .Structure		-> tables and attributes that construct Moth's layout
-- |
-- | The top level container is Structure, first level tables in .Structure are the Rows, and first level tables in Rows are the Cells.
-- | 
-- | The Structure table follows a grid format consisting of: Table ( .Structure ), Row ( .Structure[Row] ), Cell ( .Structure[Row][Cell] ).
-- | 
-- | Detailed below, is the "Default" profile matrix in Structure ... R = Row, C = Cell
-- | 
-- | [ R1: [ C1: CareerIcon ] [ C2: NPCIcon ] [ C3: Name ] ]
-- | [ R2: [ C1: Rank ] [ C2: Con ] [ C3: CareerName ] [ C4: Tier ] ]
-- | [ R3: [ C1: Title ] ]
-- | [ R4: [ C1: QuestName ] [ C2: QuestCounters ]
-- | [ R5: [ C1: Health ]
-- |
-- | Hopefully, this system ( along with a GUI configuration ) will allow players to select any number of the different (or the same)
-- | texts and icons of their choosing, as well as their location in the Moth matrix.
-- | 
-- | Of course, stating the obvious here, you edit the below at your own risk.

MothProfiles =
{
	Default =
	{
		Global =
		{
			anchor 			= "cursor",					-- | Moth Anchor Point			->	String: cursor, or something else that's not "cursor", lol
			xOffset			= 8,						-- | Top Left xOffset: Right	->	Pixels
			yOffset			= 8,						-- | Top Left yOffset: Down		->	Pixels
			rowSpacing		= 6,						-- | Row Spacing				->	Pixels
			cellSpacing		= 6,						-- | Cell Spacing				->	Pixels
			backgroundAlpha	= 1,						-- | Background Alpha			->	Number: 0 - 1 ( Transparent - Opaque )
			borderStyle		= "Dark",					-- | Border Style				->	String: Dark, Silver, Gold, Tan, Decorative, Tronned
			healthBar		= 5,						-- | Health Bar Height			->	Number: Pixels, String: "off"
			scale			= 1,						-- | Scale						->	Number: 1 = 100%, 2 = 200%, 4.6 = 460%, etc.
			shortTier		= false,					-- | Abbreviated Tiers ( C,H,L )->	Boolean: true, false
			unitNameColor	= "icon",				-- | Unit Name Color			->	String: appearance, icon, archetype
			careerNameColor	= "archetype",					-- | Career Name Color			->	String: appearance, icon, archetype
		},
		
		Structure =
		{
			[1] =
			{
				[1] =
				{
					type = "CareerIcon",
					w = 0,
					h = 0,
					font = "font_journal_text_huge",	-- | Font Type					-> String: ( Acts as "Icon Size" )
					align = "",
					textAnchor =
					{
						point = "",
						relativeTo = "",
						relativePoint = "",
						xOffset = "",
						yOffset = ""
						},
					},
				[2] =
				{
					type = "NPCIcon",					-- | Icon Type Name				-> String: NPCIcon
					w = 0,								-- | Width of Parent Cell		-> Pixels: ( Adds to Minimum Width )
					h = 0,								-- | Height of Parent Cell 		-> Pixels: ( Adds to Minimum Height )
					align = "",							-- | Align Parent Cell			-> String: left, right
					iconSize = 32,						-- | Icon Size (Beta)			-> Pixels: As Width and Height Together
				},
				[3] =
				{
					type = "Name",						-- | Cell Type Name				-> String: Name, Rank, Con, Tier, Title, QuestName, QuestCounters, Health, CareerName
					w = 0,								-- | Width of Parent Cell		-> Pixels: ( Adds to Minimum Width )
					h = 0,								-- | Height of Parent Cell 		-> Pixels: ( Adds to Minimum Height )
					font = "font_default_text",			-- | Font Type					-> String:
														-- |							-> "font_journal_body"			Cronos Pro - Small
														-- |							-> "font_journal_text"			Cronos Pro - Medium
 														-- |							-> "font_default_text_small"	Age of Reckoning - Small
														-- |							-> "font_default_text"			Age of Reckoning - Medium
														-- |							-> "font_default_text_large"	Age of Reckoning - Large
														-- |							-> "font_clear_tiny"			Myriad Pro - Very Small
														-- |							-> "font_clear_small"			Myriad Pro - Small
														-- |							-> "font_clear_medium"			Myriad Pro - Medium
														-- |							-> "font_clear_large"			Myriad Pro - Large
														-- |							-> "font_clear_small_bold"		Myriad Pro SemiExt - Small
														-- |							-> "font_clear_medium_bold"		Myriad Pro SemiExt - Medium
														-- |							-> "font_clear_large_bold"		Myriad Pro SemiExt - Large
					align = "",							-- | Align Parent Cell			-> String: left, right
					textAnchor =						-- | Text Anchor				-> Aligns Label Text Window Within Its Parent Cell
					{
						point = "",						-- | Anchor to Point			-> String:
						relativeTo = "",				-- | Window Name				-> String:
						relativePoint = "",				-- | Anchor from Point			-> String:
						xOffset = "",					-- | Left-/Right+ Offset		-> Pixels:
						yOffset = ""					-- | Up-/Down+ Offset			-> Pixels:
					},
				},
			},
			[2] =
			{
				[1] = { type = "Level", w = 0, h = 0, font = "font_chat_text", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[2] = { type = "Con", w = 0, h = 0, font = "font_chat_text", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[3] = { type = "CareerName", w = 0, h = 0, font = "font_chat_text", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[4] = { type = "Tier", w = 0, h = 0, font = "font_chat_text", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
			},
			[3] =
			{
				[1] = { type = "Title", w = 0, h = 0, font = "font_chat_text", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
			},
			[4] =
			{
				[1] = { type = "QuestName", w = 0, h = 0, font = "font_clear_small", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[2] = { type = "QuestCounters", w = 0, h = 0, font = "font_clear_small", align = "right", textAnchor = { point = "topright", relativeTo = "", relativePoint = "topright", xOffset = "", yOffset = "" }, },
			},
			[5] =
			{
				[1] = { type = "Health", w = 0, h = 0, font = "font_chat_text", align = "right", textAnchor = { point = "topright", relativeTo = "", relativePoint = "topright", xOffset = "", yOffset = "" }, },
			}
		},
	},
	
	Warhammer =
	{
		Global =
		{
			anchor 			= "",
			xOffset			= 10,
			yOffset			= 10,
			rowSpacing		= 9,
			cellSpacing		= 13,
			backgroundAlpha	= 0.9,
			borderStyle		= "Silver",
			healthBar		= "off",
			scale			= 1,
			shortTier	= false,
			unitNameColor	= "icon",
			careerNameColor	= "archetype",
		},
		
		Structure =
		{
			[1] =
			{
				[1] = { type = "Name", w = 0, h = 0, font = "font_heading_target_mouseover_name", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
			},
			[2] = {
				[1] = { type = "CareerName", w = 0, h = 0, font = "font_heading_unitframe_con", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
			},
			[3] =
			{
				[1] = { type = "Con", w = 0, h = 0, font = "font_heading_unitframe_con", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[2] = { type = "Level", w = 0, h = 0, font = "font_heading_rank", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[3] = { type = "Tier", w = 0, h = 0, font = "font_heading_unitframe_con", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
			},
		},
	},
	
	tronned = 
	{
		Global =
		{
			anchor 			= "cursor",
			xOffset			= 4,
			yOffset			= 4,
			rowSpacing		= 2,
			cellSpacing		= 4,
			backgroundAlpha	= 0.85,
			borderStyle		= "tronned",
			healthBar		= 4,
			scale			= 1,
			shortTier	= true,
			unitNameColor	= "icon",
			careerNameColor	= "icon",
		},
		
		Structure =
		{
			[1] =
			{
				[1] = { type = "CareerIcon", w = 0, h = 0, font = "font_alert_outline_half_huge", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[2] = { type = "NPCIcon", w = 0, h = 0, font = "font_alert_outline_half_huge", iconSize = 24 },
				[3] = { type = "Name", w = 0, h = 0, font = "font_clear_small_bold", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
			},
			[2] =
			{
				[1] = { type = "Level", w = 0, h = 0, font = "font_clear_small_bold", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[2] = { type = "Title", w = 0, h = 0, font = "font_clear_small_bold", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[3] = { type = "CareerName", w = 0, h = 0, font = "font_clear_small_bold", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
			},
			[3] =
			{
				[1] = { type = "QuestName", w = 0, h = 0, font = "font_clear_small_bold", align = "", textAnchor = { point = "", relativeTo = "", relativePoint = "", xOffset = "", yOffset = "" }, },
				[2] = { type = "QuestCounters", w = 0, h = 0, font = "font_clear_small_bold", align = "right", textAnchor = { point = "topright", relativeTo = "", relativePoint = "topright", xOffset = "", yOffset = "" }, },
			},
		},
	},
	
	debug ={
		Global =
		{
			anchor 			= "cursor",
			xOffset			= 4,
			yOffset			= 4,
			rowSpacing		= 2,
			cellSpacing		= 4,
			backgroundAlpha	= 0.85,
			borderStyle		= "tronned",
			healthBar		= 4,
			scale			= 1,
			shortTier	= true,
			unitNameColor	= "icon",
			careerNameColor	= "icon",
		},
		Structure =
		{
			[1] =
			{
				[1] = { type = "Name", w = 0, h = 0, font = "font_clear_small_bold" },
			},
		},
	},
}
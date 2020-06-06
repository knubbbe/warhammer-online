DESCR_BAR_LABEL_LABEL			= "The text to be printed. You can use tags to dynamically change the text";
DESCR_BAR_LABEL_FONT			= "The font (and font-size) to be used for the label";
DESCR_BAR_LABEL_COLOR			= "The color in which the text should be displayed";

DESCR_LABEL_LABEL				= "The text to be printed. You can use tags to dynamically change the text";
DESCR_LABEL_FONT				= "The font (and font-size) to be used for the label";
DESCR_LABEL_PADDING_X			= "Padding applied to the label in horizontal (x) direction";
DESCR_LABEL_PADDING_Y			= "Padding applied to the label in vertical (y) direction";
DESCR_LABEL_COLOR				= "The color in which the text should be displayed. This might be overruled by other settings.";
DESCR_LABEL_USE_CAREER_COLOR	= "Color the label depending on the units career";
DESCR_LABEL_USE_CON_COLOR		= "Color the label depending on how difficult the unit is to kill (level-difference)";
DESCR_LABEL_IS_TARGETED			= "Highlight the label by giving it a special color if the unit is targeted by you";
DESCR_LABEL_IN_AVATAR_GROUP		= "Highlight the label by giving it a special color if the unit is the same group as your avatar";

-- #########################################################################################################################################################
-- #                                                                                                                                                       #
-- # Inherits for the skin                                                                                                                                 #
-- #                                                                                                                                                       #
-- #########################################################################################################################################################

HealGridSkinInherits =
{
	
-- ################################### unitFrameSpellTrack #################################################################################################

	unitFrameSpellTrack = {
		{ _key = 'spellTrack1',					_descr = "The primary (de)buff tracker label.",
												_type = "node",
			{ _key = 'font',					_descr = "The font to be used for the for the spell tracker.",
												_type = "font",
			},
			{ _key = 'position',				_descr = "The position of the spell tracker in the unit frame.",
												_type = "anchorpoint",
												_spec = {include={'TOPLEFT','LEFT','BOTTOMLEFT'},},
			},
			{ _key = 'maxWidth',				_descr = "The maximum width of the colored label, in percent relative to the unitframe (0-100)",
												_type = "uint",
			},
		},
		{ _key = 'spellTrack2',					_descr = "The secondary (de)buff tracker label.",
												_type = "node",
			{ _key = 'font',					_descr = "The font to be used for the spell tracker.",
												_type = "font",
			},
			{ _key = 'position',				_descr = "The position of the spell tracker in the unit frame.",
												_type = "anchorpoint",
												_spec = {include={'TOPLEFT','LEFT','BOTTOMLEFT'},},
			},
			{ _key = 'maxWidth',				_descr = "The maximum width of the colored label, in percent relative to the unitframe (0-100)",
												_type = "uint",
			},
		},
	},
	
-- ################################### unitFrameBars #######################################################################################################

	unitFrameBars = {
		{ _key = 'anchor1',					_descr = "The first anchor for the bar. Currently the bar has to be within the unit-frame boundaries.",
											_type = "anchor",
		},
		{ _key = 'anchor2',					_descr = "The second anchor for the bar. Currently the bar has to be within the unit-frame boundaries.",
											_type = "anchor",
		},
		{ _key = 'growth',					_descr = "How the bar grows: Bottom->Top, Left->Right and so on. The first value gives the empty state, the second the full.",
											_type = "list",
											_spec = {list={ {key="BOTTOM_TOP",label=L"Bottom -> Top"}, {key="TOP_BOTTOM",label=L"Top -> Bottom"}, 
															{key="LEFT_RIGHT",label=L"Left -> Right"}, {key="RIGHT_LEFT",label=L"Right -> Left"},
                                                          }, },
		},
		{ _key = 'foreground',				_descr = "How the foreground - thus the bar itself - will be displayed",
											_type = "node",
			{ _key = 'isVisible',			_descr = "If the bar is visible or not (thus hidden)",
											_type = "boolean",
			},
			{ _key = 'color',				_descr = "The color for the bar",
											_type = "color+",
			},
			{ _key = 'texture',				_descr = "Which texture to use for the bar",
											_type = "texture",
			},
			{ _key = 'style',				_descr = "How the texture should be applied to the bar",
											_type = "list",
											_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
			},
		},
		{ _key = 'background',				_descr = "How the background of the bar will be displayed",
											_type = "node",
			{ _key = 'isVisible',			_descr = "If the bar is visible or not (thus hidden)",
											_type = "boolean",
			},
			{ _key = 'color',				_descr = "The color for the bar",
											_type = "color+",
			},
			{ _key = 'texture',				_descr = "Which texture to use for the bar",
											_type = "texture",
			},
			{ _key = 'style',				_descr = "How the texture should be applied to the bar",
											_type = "list",
											_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
			},
		},
		{ _key = 'isToggleable',			_descr = "If the display of the bar can be toggled by the user in the GUI.",
											_type = "boolean",
		},
		{ _key = 'isVisible',				_descr = "If the bar will be visible after changing the skin - thus the default value for the GUI.",
											_type = "boolean",
		},
	},

-- ################################### unitFrameLabels #####################################################################################################

	unitFrameLabel = {
			{ _key = 'label',					_descr = DESCR_LABEL_LABEL,
												_type = "label",
			},
			{ _key = 'font',					_descr = DESCR_LABEL_FONT,
												_type = "font",
			},
			{ _key = 'paddingX',				_descr = DESCR_LABEL_PADDING_X,
												_type = "offset",
			},
			{ _key = 'paddingY',				_descr = DESCR_LABEL_PADDING_Y,
												_type = "offset",
			},
			{ _key = 'color',					_descr = DESCR_LABEL_COLOR,
												_type = "color+",
			},
			{ _key = 'isTargeted',				_descr = DESCR_LABEL_IS_TARGETED,
												_type = "boolean",
			},
			{ _key = 'inAvatarGroup',			_descr = DESCR_LABEL_IN_AVATAR_GROUP,
												_type = "boolean",
			},
	};

	unitFrameLabels = {
		{ _key = 'labelTopLeft',				_descr = "The topleft label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelTop',					_descr = "The top label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelTopRight',				_descr = "The topright label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelLeft',					_descr = "The left label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelCenter',					_descr = "The center label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelRight',					_descr = "The right label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelBottomLeft',				_descr = "The bottomleft label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelBottom',					_descr = "The bottom label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
		{ _key = 'labelBottomRight',			_descr = "The bottomright label.",
												_type = "node",
												_inherit = {'unitFrameLabel'},
		},
	},

-- ################################### careerLineIcon ######################################################################################################

	careerLineIcon = {
		{ _key = 'scale',					_descr = "The scale (relative size) of the watermark to the unit frame.",
											_type = "slider",
											_spec = {min=10,max=100},
		},
		{ _key = 'alpha',					_descr = "The transparency (alpha-value) for the careerline icon",
											_type = "slider",
											_spec = {min=0,max=100},
		},
		{ _key = 'position',				_descr = "The position of the career line icon (watermark) in the unit box",
											_type = "anchorpoint",
		},
		{ _key = 'paddingX',				_descr = "Padding applied to the watermark in horizontal (x) direction",
											_type = "offset",
		},
		{ _key = 'paddingY',				_descr = "Padding applied to the watermark in vertial (y) direction",
											_type = "offset",
		},
		{ _key = 'isVisible',				_descr = "If the watermark is visible or not",
											_type = "boolean",
		},
	},

-- ################################### barFrame ############################################################################################################

	barFrameLabel = {
		{ _key = 'label',					_descr = DESCR_BAR_LABEL_LABEL,
											_type = "label",
		},
		{ _key = 'font',					_descr = DESCR_BAR_LABEL_FONT,
											_type = "font",
		},
		{ _key = 'color',					_descr = DESCR_BAR_LABEL_COLOR,
											_type = "color+",
		},
	},

	barFrame = {
		{ _key = 'height',					_descr = "The height of the frame, in pixels.",
											_type = "uint",
		},
		{ _key = 'border',					_descr = "The border of the frame",
											_type = "node",
		
			{ _key = 'width',				_descr = "The width of the border for the frame, in pixels.",
											_type = "uint",
			},
			{ _key = 'height',				_descr = "The height of the border for the frame, in pixels.",
											_type = "uint",
			},
			{ _key = 'color',				_descr = "The color of the border.",
											_type = "color",
			},
		},
		{ _key = 'foreground',				_descr = "How the foreground of the bar will be displayed",
											_type = "node",
			{ _key = 'color',				_descr = "The color for the bar",
											_type = "color",
			},
			{ _key = 'texture',				_descr = "Which texture to use for the bar",
											_type = "texture",
			},
			{ _key = 'style',				_descr = "How the texture should be applied to the bar",
											_type = "list",
											_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
			},
		},
		{ _key = 'background',				_descr = "How the background of the bar will be displayed",
											_type = "node",
			{ _key = 'color',				_descr = "The color for the bar",
											_type = "color",
			},
			{ _key = 'texture',				_descr = "Which texture to use for the bar",
											_type = "texture",
			},
			{ _key = 'style',				_descr = "How the texture should be applied to the bar",
											_type = "list",
											_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
			},
		},
		{ _key = 'labelLeft',				_descr = "The left label of the bar.",
											_type = "node",
											_inherit = { "barFrameLabel" },
		},
		{ _key = 'labelCenter',				_descr = "The center label of the bar.",
											_type = "node",
											_inherit = { "barFrameLabel" },
		},
		{ _key = 'labelRight',				_descr = "The right label of the frame.",
											_type = "node",
											_inherit = { "barFrameLabel" },
		},
	},
};

-- #########################################################################################################################################################
-- #                                                                                                                                                       #
-- # The skin definition                                                                                                                                   #
-- #                                                                                                                                                       #
-- #########################################################################################################################################################

HealGridSkinDefinition = 

{ _key = 'root',									_desc = "Root entry",
													_type = "node",

-- ################################### SKIN ################################################################################################################

	{ _key = 'skin',								_descr = "This section covers skin related settings",
													_type = "node",
		{ _key = 'id',								_descr = "The unique identifier for the skin",
													_type = "string",
													_spec = {editable=false,},
        },
		{ _key = 'name',							_descr = "The human readable (short) name of the skin. Displayed in the pulldown box",
													_type = "wstring",
													_spec = {editable=false,},
		},
		{ _key = 'author',							_descr = "The author of the skin. The one who wrote/designed the skin. Multiple authors separated by komma",
													_type = "string",
													_spec = {editable=false,},
		},
		{ _key = 'sortCriteria',					_descr = "Th criteria used when sorting the list of skins, e.g. for a dropdown menu.",
													_type = "string",
		},
	},

-- ################################### HUD #################################################################################################################

	{ _key = 'hud',									_descr = "This section covers everything releated to the HUD, the Head Over Display.",
													_type = "node",
	
-- =================================== HUD / BUFFS =========================================================================================================

		{ _key = 'buffs',							_descr = "The buffs-icons for the HUD.",
													_type = "node",
			{ _key = 'size',						_descr = "Icon size (width and height).",
													_type = "uint",
			},
			{ _key = 'border',						_descr = "Thickness of the icon-border, in pixels.",
													_type = "uint",
			},
			{ _key = 'textPadding',					_descr = "Space between outer border and text border (in pixels)",
													_type = "int",
			},
			{ _key = 'font',						_descr = "Font for the text overlays of the icon.",
													_type = "font",
			},
		},

-- =================================== HUD / UNIT-FRAME ====================================================================================================

		{ _key = 'unitFrame',						_descr = "The unit frames of the HUDs.",
													_type = "node",
			{ _key = 'width',						_descr = "The width of one unitframe in the HUD, in pixels.",
													_type = "uint",
			},
			{ _key = 'height',						_descr = "The height of one unitframe in the HUD, in pixels.",
													_type = "uint",
			},
			{ _key = 'borderWidth',					_descr = "The thickness of the border for the unitframe, in pixels.",
													_type = "uint",
			},
			{ _key = 'borderHeight',				_descr = "The thickness of the border for the unitframe, in pixels.",
													_type = "uint",
			},
			{ _key = 'background',					_descr = "How the background of the unit frame will be displayed",
													_type = "node",
				{ _key = 'color',					_descr = "The color for the background",
													_type = "color+",
				},
				{ _key = 'texture',					_descr = "Which texture to use for the background",
													_type = "texture",
				},
				{ _key = 'style',					_descr = "How the texture should be applied to the bar",
													_type = "list",
													_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
				},
			},
			{ _key = 'careerLineIcon',				_descr = "The watermark with the career line icon.",
													_type = "node",
													_inherit = { "careerLineIcon" },
			},
			{ _key = 'healthPointsBar',				_descr = "The bar displaying the health points of the  unit",
													_type = "node",
													_inherit = { "unitFrameBars" },
			},
			{ _key = 'actionPointsBar',				_descr = "The bar displaying the action points of the  unit",
													_type = "node",
													_inherit = { "unitFrameBars" },
			},
			{ _key = 'moraleLevelBar',				_descr = "The bar displaying the morale level of the  unit",
													_type = "node",
													_inherit = { "unitFrameBars" },
			},
		},

-- =================================== HUD / AVATAR-FRAME ==================================================================================================

		{ _key = 'avatarFrame',						_descr = "The frame showing your avatar.",
													_type = "node",
													_inherit = { "unitFrameSpellTrack", "unitFrameLabels", },
		},

-- =================================== HUD / PET-FRAME =====================================================================================================

		{ _key = 'petFrame',						_descr = "The frame showing your pet.",
													_type = "node",
													_inherit = { "unitFrameSpellTrack", "unitFrameLabels", },
		},

-- =================================== HUD / FRIENDLY-TARGET-FRAME =========================================================================================

		{ _key = 'friendlyTargetFrame',				_descr = "The frame showing your friendly target.",
													_type = "node",
													_inherit = { "unitFrameSpellTrack", "unitFrameLabels", },
		},

-- =================================== HUD / HOSTILE-TARGET-FRAME ==========================================================================================

		{ _key = 'hostileTargetFrame',				_descr = "The frame showing your hostile target.",
													_type = "node",
													_inherit = { "unitFrameSpellTrack", "unitFrameLabels", },
		},

-- =================================== HUD / PET-TARGET-FRAME ==============================================================================================

		{ _key = 'petTargetFrame',					_descr = "The frame showing your pet's target.",
													_type = "node",
													_inherit = { "unitFrameSpellTrack", "unitFrameLabels", },
		},

-- =================================== HUD / ACTION-POINT-FRAME ============================================================================================

		{ _key = 'actionPointFrame',				_descr = "The action points (mana) frame in the HUD",
													_type = "node",
													_inherit = { "barFrame", },
		},

-- =================================== HUD / CAREER-FRAME ============================================================================================

		{ _key = 'careerFrame',						_descr = "The career frame in the HUD",
													_type = "node",
													_inherit = { "barFrame", },
		},

-- =================================== HUD / MORALE-FRAME===================================================================================================

		{ _key = 'moraleFrame',						_descr = "The morale frame in the HUD",
													_type = "node",
													_inherit = { "barFrame", },
		},

-- =================================== HUD / CAST-FRAME ====================================================================================================

		{ _key = 'castFrame',						_descr = "The cast frame in the HUD",
													_type = "node",
			{ _key = 'height',						_descr = "The height of the frame, in pixels.",
													_type = "uint",
			},
			{ _key = 'border',						_descr = "The border of the frame",
													_type = "node",
				{ _key = 'width',					_descr = "The width of the border for the frame, in pixels.",
													_type = "uint",
				},
				{ _key = 'height',					_descr = "The height of the border for the frame, in pixels.",
													_type = "uint",
				},
				{ _key = 'color',					_descr = "The color of the border.",
													_type = "color",
				},
			},
			{ _key = 'foreground',					_descr = "How the foreground of the bar will be displayed",
													_type = "node",
				{ _key = 'color',					_descr = "The color for the bar for normal spell casting.",
													_type = "color",
				},
				{ _key = 'channelColor',			_descr = "The color of the bar when casting a channelled spell.",
													_type = "color",
				},
				{ _key = 'failureColor',			_descr = "The color of the bar when casting a spell failed.",
													_type = "color",
				},
				{ _key = 'globalCooldownColor',		_descr = "The color of the bar when the global cooldown is active.",
													_type = "color",
				},
				{ _key = 'texture',					_descr = "Which texture to use for the bar",
													_type = "texture",
				},
				{ _key = 'style',					_descr = "How the texture should be applied to the bar",
													_type = "list",
													_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
				},
			},
			{ _key = 'background',					_descr = "How the background of the bar will be displayed",
													_type = "node",
				{ _key = 'color',					_descr = "The color for the bar",
													_type = "color",
				},
				{ _key = 'texture',					_descr = "Which texture to use for the bar",
													_type = "texture",
				},
				{ _key = 'style',					_descr = "How the texture should be applied to the bar",
													_type = "list",
													_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
				},
			},
			{ _key = 'labelLeft',					_descr = "The left label of the bar.",
													_type = "node",
				{ _key = 'font',					_descr = DESCR_BAR_LABEL_FONT,
													_type = "font",
				},
			},
			{ _key = 'labelCenter',					_descr = "The center label of the bar.",
													_type = "node",
				{ _key = 'font',					_descr = DESCR_BAR_LABEL_FONT,
													_type = "font",
				},
			},
			{ _key = 'labelRight',					_descr = "The right label of the frame.",
													_type = "node",
				{ _key = 'font',					_descr = DESCR_BAR_LABEL_FONT,
													_type = "font",
				},
			},
		},

-- =================================== HUD / TARGET ========================================================================================================

		{ _key = 'target',							_descr = "The target name in the hud",
													_type = "node",
			{ _key = 'font',						_descr = "The font to be used for the name of the target",
													_type = "font",
			},
		},

	},

-- ################################### GRID ################################################################################################################

	{ _key = 'grid',								_descr = "This section covers all the settings for the gris",
													_type = "node",
		{ _key = 'grouping',						_descr = "How to group units in the grid",
													_type = "list",
													_spec = {list={ {key="GROUP",label=L"WAR Groups"},
																	{key="ARCH",label=L"Career Arches"},
																	{key="CAREER",label=L"Careers"},
																}, },
		},
		{ _key = 'orientation',						_descr = "The orientation of the grid.",
													_type = "list",
													_spec = {list={ {key="HORIZONTAL",label=L"Horizontal"}, {key="VERTICAL",label=L"Vertical"}, }, },
		},
		{ _key = 'growth',							_descr = "How the grid grows.",
													_type = "list",
													_spec = {list={ {key="UP",label=L"Upwards"}, {key="DOWN",label=L"Downards"}, }, },
		},

-- =================================== UNIT-FRAME ==========================================================================================================

		{ _key = 'unitFrame',						_descr = "The unit frames of the grid",
													_type = "node",
													_inherit = { "unitFrameSpellTrack", "unitFrameLabels", },
			{ _key = 'width',						_descr = "The width of one unitframe in the grid, in pixels.",
													_type = "uint",
			},
			{ _key = 'height',						_descr = "The height of one unitframe in the grid, in pixels.",
													_type = "uint",
			},
			{ _key = 'borderWidth',					_descr = "The thickness of the border for the unitframe, in pixels.",
													_type = "uint",
			},
			{ _key = 'borderHeight',				_descr = "The thickness of the border for the unitframe, in pixels.",
													_type = "uint",
			},
			{ _key = 'background',					_descr = "How the background of the unit frame will be displayed",
													_type = "node",
				{ _key = 'color',					_descr = "The color for the background",
													_type = "color+",
				},
				{ _key = 'texture',					_descr = "Which texture to use for the background",
													_type = "texture",
				},
				{ _key = 'style',					_descr = "How the texture should be applied to the bar",
													_type = "list",
													_spec = {list={ {key="TILE",label=L"Tile"}, {key="FILL",label=L"Fill"} }, },
				},
			},
			{ _key = 'careerLineIcon',				_descr = "The watermark with the career line icon.",
													_type = "node",
													_inherit = { "careerLineIcon" },
			},
			{ _key = 'healthPointsBar',				_descr = "The bar displaying the health points of the  unit",
													_type = "node",
													_inherit = { "unitFrameBars" },
			},
			{ _key = 'actionPointsBar',				_descr = "The bar displaying the action points of the  unit",
													_type = "node",
													_inherit = { "unitFrameBars" },
			},
			{ _key = 'moraleLevelBar',				_descr = "The bar displaying the morale level of the  unit",
													_type = "node",
													_inherit = { "unitFrameBars" },
			},
		},

-- =================================== PET-FRAME ===========================================================================================================

		{ _key = 'petFrame',						_descr = "The pet frames of the grid, if it supports pets",
													_type = "node",
			{ _key = 'height',						_descr = "The height of one pet in the grid, in pixels (width is the same the unitFrame).",
													_type = "uint",
			},
			{ _key = 'borderWidth',					_descr = "The thickness of the border for the petframe, in pixels.",
													_type = "uint",
			},
			{ _key = 'borderHeight',				_descr = "The thickness of the border for the petframe, in pixels.",
													_type = "uint",
			},
			{ _key = 'labelCenter',					_descr = "The center label of a petframe in the grid.",
													_type = "node",
				{ _key = 'font',					_descr = "The font to be used for the center label.",
													_type = "font",
				},
			},
		},

	},

};



--[[
function print_tree()

	local collapsed = '';
	local indent = '';

	for a,b in ipairs(HG_FlatTree) do
		indent = '';
		for i=1,b.level*4 do
			indent = indent .. ' ';
		end
		if ( b.collapsed == false ) then
			collapsed = 'false';
		else
			collapsed = 'true';
		end
		print( a .. ' = ' .. indent .. b.node .. ' (' ..collapsed .. ') lvl=' .. b.level .. ' path=' .. b.path );
	end

end

function print_nodes()

	for a,b in pairs(HG_Nodes) do
		print( a .. ' = ');
		for x,y in ipairs(b) do
			print( '    '  .. y.node .. ' '.. y.path .. ' ' .. y.type .. ' ' .. y.descr );
		end
	end

end

function create_tree( t, l, path )

	local i = 1;

	if ( t._type == 'node' ) then
		table.insert( HG_FlatTree, {node=t._key, collapsed=false, level=l, path=path..'.'..t._key} );

		while ( t[i] ) do
			create_tree( t[i], l+1, path..'.'..t._key );
			i = i + 1;
		end
	else
		if ( HG_Nodes[path] == nil ) then
			HG_Nodes[path] = {};
		end
		table.insert( HG_Nodes[path], {node=t._key, path=path..'.'..t._key, type=t._type, descr=t._descr} );
	end

end

HG_FlatTree = {};
HG_Nodes = {};

tree = create_tree( HealGridSkinDefinition, 0, '' );

print_tree();
print( '-------------------' );
print_nodes();

]]

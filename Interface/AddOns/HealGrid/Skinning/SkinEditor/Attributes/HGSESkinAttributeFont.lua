HGSESkinAttributeFont = {};

HGSESkinAttributeFont.fontList =
    {
        [1]  = {key='font_clear_tiny',					label=L"Font Clear Tiny (14)",					},
        [2]  = {key='font_clear_small',					label=L"Font Clear Small (16)",					},
        [3]  = {key='font_clear_medium',				label=L"Font Clear Medium (20)",				},
        [4]  = {key='font_clear_large',					label=L"Font Clear Large (24)",					},
        [5]  = {key='font_clear_small_bold',			label=L"Font Clear Small Bold (16)",			},
        [6]  = {key='font_clear_medium_bold',			label=L"Font Clear Medium Bold (20)",			},
        [7]  = {key='font_clear_large_bold',			label=L"Font Clear Large Bold (24)",			},

        [8]  = {key='font_alert_outline_tiny',			label=L"Font Alert Outline Tiny (18)",			},
        [9]  = {key='font_alert_outline_small',			label=L"Font Alert Outline Small (24)",			},
        [10] = {key='font_alert_outline_medium',		label=L"Font Alert Outline Medium (30)",		},
        [11] = {key='font_alert_outline_large',			label=L"Font Alert Outline Large (36)",			},
        [12] = {key='font_alert_outline_huge',			label=L"Font Alert Outline Huge (42)",			},
        [13] = {key='font_alert_outline_giant',			label=L"Font Alert Outline Giant (48)",			},
        [14] = {key='font_alert_outline_gigantic',		label=L"Font Alert Outline Gigantic (60)",		},

        [15] = {key='font_alert_outline_half_tiny',		label=L"Font Alert Outline Half Tiny (9)",		},
        [16] = {key='font_alert_outline_half_small',	label=L"Font Alert Outline Half Small (12)",	},
        [17] = {key='font_alert_outline_half_medium',	label=L"Font Alert Outline Half Medium (15)",	},
        [18] = {key='font_alert_outline_half_large',	label=L"Font Alert Outline Half Large (18)",	},
        [19] = {key='font_alert_outline_half_huge',		label=L"Font Alert Outline Half Huge (21)",		},
        [20] = {key='font_alert_outline_half_giant',	label=L"Font Alert Outline Half Giant (24)",	},
        [21] = {key='font_alert_outline_half_gigantic',	label=L"Font Alert Outline Half Gigantic (30)",	},
    };

function HGSESkinAttributeFont.Initialize()

	HGSESkinAttributeFont.__index = HGSESkinAttributeFont;
	setmetatable( HGSESkinAttributeFont, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeFont', 'HGSE_SkinAttributeFontTemplate', 'HGSE_SkinAttributePanel' );

	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeFontValue", HGSESkinAttributeFont.fontList );

	WindowSetShowing( 'HGSE_SkinAttributeFont', false );

end

function HGSESkinAttributeFont.Shutdown()

end

function HGSESkinAttributeFont.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeFont.SetValue( value );

	WindowSetShowing( 'HGSE_SkinAttributeFont', true );

end

function HGSESkinAttributeFont.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeFont', false );

end

function HGSESkinAttributeFont.SetValue( value )

	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeFontValue", HGSESkinAttributeFont.fontList, value );

end

function HGSESkinAttributeFont.GetValue()

	return( HealGridGuiUtility.ComboBoxGetSelected("HGSE_SkinAttributeFontValue",HGSESkinAttributeFont.fontList) );

end

function HGSESkinAttributeFont.CheckValue()

	return( HGSESkinAttributeFont.GetValue() ~= nil );

end

function HGSESkinAttributeFont.ValueToWString( value )

	return( StringToWString(value) );

end

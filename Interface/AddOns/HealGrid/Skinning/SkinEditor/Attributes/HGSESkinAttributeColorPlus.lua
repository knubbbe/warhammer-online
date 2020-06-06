HGSESkinAttributeColorPlus = {};

HGSESkinAttributeColorPlus.valueList = {
	{ key="HEALTHCOLOR",	label=L"Health Color"			},
	{ key="CLASSCOLOR",		label=L"Career/Class Color"		},
	{ key="CONCOLOR",		label=L"Consider Color"			},
	{ key="MCDCOLOR",		label=L"Morale Cooldown Color"	},
	{ key="COLOR",			label=L"Custom color"			},
};

HGSESkinAttributeColorPlus.currColor = nil;

function HGSESkinAttributeColorPlus.Initialize()

	HGSESkinAttributeColorPlus.__index = HGSESkinAttributeColorPlus;
	setmetatable( HGSESkinAttributeColorPlus, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeColorPlus', 'HGSE_SkinAttributeColorPlusTemplate', 'HGSE_SkinAttributePanel' );

    HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeColorPlusValueSelect", HGSESkinAttributeColorPlus.valueList );

	WindowSetShowing( 'HGSE_SkinAttributeColorPlus', false );

end

function HGSESkinAttributeColorPlus.Shutdown()

end

function HGSESkinAttributeColorPlus.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeColorPlus.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeColorPlus', true );

end

function HGSESkinAttributeColorPlus.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeColorPlus', false );

end

function HGSESkinAttributeColorPlus.SetValue( value )

	local sel;

	if ( RMetColor[value] ~= nil ) then
		sel = 'COLOR';
		color = value;
	else
		sel = value;
		color = nil;
	end

	HGSESkinAttributeColorPlus.currColor = value;

	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeColorPlusValueSelect", HGSESkinAttributeColorPlus.valueList, sel );

	HGSESkinAttributeColorPlus.SelectionChanged();

end

function HGSESkinAttributeColorPlus.GetValue()

	return( HGSESkinAttributeColorPlus.currColor );

end

function HGSESkinAttributeColorPlus.CheckValue()

	return( true );

end

function HGSESkinAttributeColorPlus.ValueToWString( value )

	if ( RMetColor[value] ~= nil ) then
		return( RMetColor[value].label );
	else
		for k,v in pairs(HGSESkinAttributeColorPlus.valueList) do
			if ( v.key == value ) then
				return( v.label );
			end
		end
	end

	return( L"unknown" );

end

-- ----- DROPDOWN -----------------------------------------------------------------------------------------------------------------------------------------

function HGSESkinAttributeColorPlus.SelectionChanged()

	local sel = HealGridGuiUtility.ComboBoxGetSelected( "HGSE_SkinAttributeColorPlusValueSelect", HGSESkinAttributeColorPlus.valueList );

	if ( sel == 'COLOR' ) then
		if ( RMetColor[HGSESkinAttributeColorPlus.currColor] == nil ) then
			HGSESkinAttributeColorPlus.currColor = 'BLACK';
		end
		
		LabelSetText( 'HGSE_SkinAttributeColorPlusValueColorSign', RMetColor[HGSESkinAttributeColorPlus.currColor].label );
		HealGridUtility.WindowSetTintColor( 'HGSE_SkinAttributeColorPlusValueColorBackground', HGSESkinAttributeColorPlus.currColor );

		WindowSetShowing( 'HGSE_SkinAttributeColorPlusValueColor', true );
	else
		HGSESkinAttributeColorPlus.currColor = sel;
		WindowSetShowing( 'HGSE_SkinAttributeColorPlusValueColor', false );
	end

end

-- ----- COLOR PICKER -------------------------------------------------------------------------------------------------------------------------------------

function HGSESkinAttributeColorPlus.EditColor()

	HealGridGuiColorSelect.Activate( HGSESkinAttributeColorPlus, "EditColorDone" );

end

function HGSESkinAttributeColorPlus.EditColorDone( newColor )

	HGSESkinAttributeColorPlus.SetValue( newColor );

end

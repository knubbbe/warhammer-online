HGSESkinAttributeColor = {};

function HGSESkinAttributeColor.Initialize()

	HGSESkinAttributeColor.__index = HGSESkinAttributeColor;
	setmetatable( HGSESkinAttributeColor, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeColor', 'HGSE_SkinAttributeColorTemplate', 'HGSE_SkinAttributePanel' );

	LabelSetText( 'HGSE_SkinAttributeColorHint', L"Hint: Click on the color-name to open the color-picker" );

	WindowSetShowing( 'HGSE_SkinAttributeColor', false );

end

function HGSESkinAttributeColor.Shutdown()

end

function HGSESkinAttributeColor.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeColor.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeColor', true );

end

function HGSESkinAttributeColor.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeColor', false );

end

function HGSESkinAttributeColor.SetValue( value )

	local color;

	if ( type(value) == 'string' ) then
		color = RMetColor[value];
	else
		color = value;
	end

	TextEditBoxSetText( 'HGSE_SkinAttributeColorValueR', wstring.format(L"%d",color.r) );
	TextEditBoxSetText( 'HGSE_SkinAttributeColorValueG', wstring.format(L"%d",color.g) );
	TextEditBoxSetText( 'HGSE_SkinAttributeColorValueB', wstring.format(L"%d",color.b) );
	LabelSetText( 'HGSE_SkinAttributeColorValueCodeSign', RMetColor[HGSESkinAttributeColor.ColorToCode(color,false)].label );
	HealGridUtility.WindowSetTintColor( 'HGSE_SkinAttributeColorValueCodeBackground', color );

end

function HGSESkinAttributeColor.GetValue()

	local r = tonumber(TextEditBoxGetText('HGSE_SkinAttributeColorValueR'));
	local g = tonumber(TextEditBoxGetText('HGSE_SkinAttributeColorValueG'));
	local b = tonumber(TextEditBoxGetText('HGSE_SkinAttributeColorValueB'));
	local code = HGSESkinAttributeColor.ColorToCode( {r=r,g=g,b=b} );

	if ( code == nil ) then
		return( {r=r,g=g,b=b} );
	else
		return( code );
	end

end

function HGSESkinAttributeColor.CheckValue()

	local color = HGSESkinAttributeColor.GetValue();

	return( type(color) == 'string' or (color.r >= 0 and color.r <= 255 and color.g >= 0 and color.g <= 255 and color.b >= 0 and color.b <= 255) );

end

function HGSESkinAttributeColor.ValueToWString( value )

	return( RMetColor[HGSESkinAttributeColor.ColorToCode(value,false)].label );

end

-- ----- COLOR PICKER -------------------------------------------------------------------------------------------------------------------------------------

function HGSESkinAttributeColor.EditColor()

	HealGridGuiColorSelect.Activate( HGSESkinAttributeColor, "EditColorDone" );

end

function HGSESkinAttributeColor.EditColorDone( newColor )

	HGSESkinAttributeColor.SetValue( newColor );

end

-- ----- HELPERS ------------------------------------------------------------------------------------------------------------------------------------------

function HGSESkinAttributeColor.ColorToCode( color, match )

	local code, hgColor;
	local rOff = 1000;
	local gOff = 1000;
	local bOff = 1000;
	local allOff = 1000;
	local bestOff = 1000;
	local bestCode = 'BLACK';

	if ( type(color) == 'string' ) then
		return( color );
	end

	for code,hgColor in pairs(RMetColor) do
		rOff = math.abs( color.r-hgColor.r );
		gOff = math.abs( color.g-hgColor.g );
		bOff = math.abs( color.b-hgColor.b );
		allOff = rOff + gOff + bOff;
		if ( allOff == 0 ) then
			return( code );
		elseif ( allOff < bestOff ) then
			bestOff = allOff;
			bestCode = code;
		end
	end

	if ( match == false ) then
		return( bestCode );
	else
		return( nil );
	end

end

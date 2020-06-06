HGSESkinAttributeUInt = {};

function HGSESkinAttributeUInt.Initialize()

	HGSESkinAttributeUInt.__index = HGSESkinAttributeUInt;
	setmetatable( HGSESkinAttributeUInt, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeUInt', 'HGSE_SkinAttributeUIntTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeUInt', false );

end

function HGSESkinAttributeUInt.Shutdown()

end

function HGSESkinAttributeUInt.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeUInt.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeUInt', true );

end

function HGSESkinAttributeUInt.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeUInt', false );

end

function HGSESkinAttributeUInt.SetValue( value )

	TextEditBoxSetText( 'HGSE_SkinAttributeUIntValue', wstring.format(L"%d",value) );

end

function HGSESkinAttributeUInt.GetValue()

	return( tonumber(TextEditBoxGetText('HGSE_SkinAttributeUIntValue')) );

end

function HGSESkinAttributeUInt.CheckValue()

	local value = HGSESkinAttributeUInt.GetValue();

	if ( value < 0 ) then
		return( false );
	end

	return( true );

end

function HGSESkinAttributeUInt.ValueToWString( value )

	return( wstring.format(L"%d",value) );

end

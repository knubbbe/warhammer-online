HGSESkinAttributeInt = {};

function HGSESkinAttributeInt.Initialize()

	HGSESkinAttributeInt.__index = HGSESkinAttributeInt;
	setmetatable( HGSESkinAttributeInt, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeInt', 'HGSE_SkinAttributeIntTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeInt', false );

end

function HGSESkinAttributeInt.Shutdown()

end

function HGSESkinAttributeInt.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeInt.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeInt', true );

end

function HGSESkinAttributeInt.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeInt', false );

end

function HGSESkinAttributeInt.SetValue( value )

	TextEditBoxSetText( 'HGSE_SkinAttributeIntValue', wstring.format(L"%d",value) );

end

function HGSESkinAttributeInt.GetValue()

	return( tonumber(TextEditBoxGetText('HGSE_SkinAttributeIntValue')) );

end

function HGSESkinAttributeInt.CheckValue()

	return( true );

end

function HGSESkinAttributeInt.ValueToWString( value )

	return( wstring.format(L"%d",value) );

end

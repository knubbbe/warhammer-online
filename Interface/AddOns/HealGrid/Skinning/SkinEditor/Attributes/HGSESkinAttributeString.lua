HGSESkinAttributeString = {};

function HGSESkinAttributeString.Initialize()

	HGSESkinAttributeString.__index = HGSESkinAttributeString;
	setmetatable( HGSESkinAttributeString, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeString', 'HGSE_SkinAttributeStringTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeString', false );

end

function HGSESkinAttributeString.Shutdown()

end

function HGSESkinAttributeString.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeString.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeString', true );

end

function HGSESkinAttributeString.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeString', false );

end

function HGSESkinAttributeString.SetValue( value )

	TextEditBoxSetText( 'HGSE_SkinAttributeStringValue', StringToWString(value) );

end

function HGSESkinAttributeString.GetValue()

	return( WStringToString(TextEditBoxGetText('HGSE_SkinAttributeStringValue')) );

end

function HGSESkinAttributeString.CheckValue()

	return( true );

end

function HGSESkinAttributeString.ValueToWString( value )

	return( StringToWString(value) );

end

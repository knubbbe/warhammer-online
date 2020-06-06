HGSESkinAttributeWString = {};

function HGSESkinAttributeWString.Initialize()

	HGSESkinAttributeWString.__index = HGSESkinAttributeWString;
	setmetatable( HGSESkinAttributeWString, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeWString', 'HGSE_SkinAttributeWStringTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeWString', false );

end

function HGSESkinAttributeWString.Shutdown()

end

function HGSESkinAttributeWString.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeWString.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeWString', true );

end

function HGSESkinAttributeWString.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeWString', false );

end

function HGSESkinAttributeWString.SetValue( value )

	TextEditBoxSetText( 'HGSE_SkinAttributeWStringValue', value );

end

function HGSESkinAttributeWString.GetValue()

	return( TextEditBoxGetText('HGSE_SkinAttributeWStringValue') );

end

function HGSESkinAttributeWString.CheckValue()

	return( true );

end

function HGSESkinAttributeWString.ValueToWString( value )

	return( value );

end

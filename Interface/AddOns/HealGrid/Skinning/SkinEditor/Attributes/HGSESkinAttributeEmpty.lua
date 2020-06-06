HGSESkinAttributeEmpty = {};

function HGSESkinAttributeEmpty.Initialize()

	HGSESkinAttributeEmpty.__index = HGSESkinAttributeEmpty;
	setmetatable( HGSESkinAttributeEmpty, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeEmpty', 'HGSE_SkinAttributeEmptyTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeEmpty', false );

end

function HGSESkinAttributeEmpty.Shutdown()

end

function HGSESkinAttributeEmpty.Activate( path, index, value, spec )

	HGSESkinAttribute.DeActivate( path, index );				-- yes, DeActivate to hide it!
	HGSESkinAttributeEmpty.SetValue( value );

	WindowSetShowing( 'HGSE_SkinAttributeEmpty', true );

end

function HGSESkinAttributeEmpty.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeEmpty', false );

end

function HGSESkinAttributeEmpty.SetValue( value )

end

function HGSESkinAttributeEmpty.GetValue()

	return( nil );

end

function HGSESkinAttributeEmpty.CheckValue()

	return( false );

end

function HGSESkinAttributeEmpty.ValueToWString( value )

	return( L"" );

end

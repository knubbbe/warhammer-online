HGSESkinAttribute = {};

function HGSESkinAttribute.Initialize()

	HGSESkinAttribute.__index = HGSESkinAttribute;

	CreateWindowFromTemplate( 'HGSE_SkinAttribute', 'HGSE_SkinAttributeTemplate', 'HGSE_SkinAttributePanel' );

	ButtonSetText( "HGSE_SkinAttributeResetAttribute", L"Default" );
	ButtonSetText( "HGSE_SkinAttributeSetAttribute", L"Set" );

	WindowSetShowing( 'HGSE_SkinAttribute', false );

end

function HGSESkinAttribute.Shutdown()

end

function HGSESkinAttribute.Activate( path, index, value, spec )

	HGSESkinAttribute.path = path;

	if ( path ~= nil and index ~= 0 ) then
		LabelSetText( "HGSE_SkinAttributeName", StringToWString(HealGridSkinEditor.skinNodeList[path][index].attribute) );
		LabelSetText( "HGSE_SkinAttributeDescription", HealGridSkinEditor.skinNodeList[path][index].descr );
	else
		LabelSetText( "HGSE_SkinAttributeName", L"" );
		LabelSetText( "HGSE_SkinAttributeDescription", L"" );
	end

	WindowSetShowing( 'HGSE_SkinAttribute', true );

end

function HGSESkinAttribute.DeActivate()

	WindowSetShowing( 'HGSE_SkinAttribute', false );

end

function HGSESkinAttribute.SetValue( value )

end

function HGSESkinAttribute.GetValue()

end

function HGSESkinAttribute.CheckValue()

end

function HGSESkinAttribute.ValueToWString()

end

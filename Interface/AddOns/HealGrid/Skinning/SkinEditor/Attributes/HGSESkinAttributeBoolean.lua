HGSESkinAttributeBoolean = {};

function HGSESkinAttributeBoolean.Initialize()

	HGSESkinAttributeBoolean.__index = HGSESkinAttributeBoolean;
	setmetatable( HGSESkinAttributeBoolean, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeBoolean', 'HGSE_SkinAttributeBooleanTemplate', 'HGSE_SkinAttributePanel' );

	LabelSetText( "HGSE_SkinAttributeBooleanValueLabel", L"Enabled" );

	WindowSetShowing( 'HGSE_SkinAttributeBoolean', false );

end

function HGSESkinAttributeBoolean.Shutdown()

end

function HGSESkinAttributeBoolean.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeBoolean.SetValue( value );

	ButtonSetDisabledFlag( 'HGSE_SkinAttributeBooleanValueButton', spec.editable ~= nil and spec.editable == false );

	WindowSetShowing( 'HGSE_SkinAttributeBoolean', true );

end

function HGSESkinAttributeBoolean.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeBoolean', false );

end

function HGSESkinAttributeBoolean.SetValue( value )

	ButtonSetPressedFlag( 'HGSE_SkinAttributeBooleanValueButton', value );

end

function HGSESkinAttributeBoolean.GetValue()

	return( ButtonGetPressedFlag('HGSE_SkinAttributeBooleanValueButton') );

end

function HGSESkinAttributeBoolean.CheckValue()

	return( true );

end

function HGSESkinAttributeBoolean.ValueToWString( value )

	if ( value ) then
		return( L'On' );
	else
		return( L'Off' );
	end

end

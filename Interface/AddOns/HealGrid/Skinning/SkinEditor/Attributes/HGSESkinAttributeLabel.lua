HGSESkinAttributeLabel = {};

function HGSESkinAttributeLabel.Initialize()

	HGSESkinAttributeLabel.__index = HGSESkinAttributeLabel;
	setmetatable( HGSESkinAttributeLabel, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeLabel', 'HGSE_SkinAttributeLabelTemplate', 'HGSE_SkinAttributePanel' );

	ButtonSetText( "HGSE_SkinAttributeLabelHelp", L"Help" );

	WindowSetShowing( 'HGSE_SkinAttributeLabel', false );

end

function HGSESkinAttributeLabel.Shutdown()

end

function HGSESkinAttributeLabel.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeLabel.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeLabel', true );

end

function HGSESkinAttributeLabel.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeLabel', false );

end

function HGSESkinAttributeLabel.SetValue( value )

	TextEditBoxSetText( 'HGSE_SkinAttributeLabelValue', value );

end

function HGSESkinAttributeLabel.GetValue()

	return( TextEditBoxGetText('HGSE_SkinAttributeLabelValue') );

end

function HGSESkinAttributeLabel.CheckValue()

	return( true );

end

function HGSESkinAttributeLabel.ValueToWString( value )

	return( value );

end

-- ----------------------------------------------------------------
function HGSESkinAttributeLabel.OpenHelp()

	HGSELabelHelp.Open();

end

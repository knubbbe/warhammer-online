HGSESkinAttributeOffset = {};

function HGSESkinAttributeOffset.Initialize()

	HGSESkinAttributeOffset.__index = HGSESkinAttributeOffset;
	setmetatable( HGSESkinAttributeOffset, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeOffset', 'HGSE_SkinAttributeOffsetTemplate', 'HGSE_SkinAttributePanel' );

	LabelSetText( 'HGSE_SkinAttributeOffsetHint', L"Hint: Add % to the number for relative offsets (e.g. 15%)" );

	WindowSetShowing( 'HGSE_SkinAttributeOffset', false );

end

function HGSESkinAttributeOffset.Shutdown()

end

function HGSESkinAttributeOffset.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeOffset.SetValue( value );

	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	WindowSetShowing( 'HGSE_SkinAttributeOffset', true );

end

function HGSESkinAttributeOffset.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeOffset', false );

end

function HGSESkinAttributeOffset.SetValue( value )

	TextEditBoxSetText( 'HGSE_SkinAttributeOffsetValue', StringToWString(value) );

end

function HGSESkinAttributeOffset.GetValue()

	local offset;
    local offsetRel = "";
	local offsetString = TextEditBoxGetText( 'HGSE_SkinAttributeOffsetValue' );

	if ( wstring.sub(offsetString,-1) == L'%' ) then
		offsetRel = "%";
	end

	offset = tonumber(offsetString) .. offsetRel;

	return( offset );

end

function HGSESkinAttributeOffset.CheckValue()

	return( true );

end

function HGSESkinAttributeOffset.ValueToWString( value )

	return( StringToWString(value) );

end

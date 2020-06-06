HGSESkinAttributeDropDownList = {};

HGSESkinAttributeDropDownList.valueList = nil;

function HGSESkinAttributeDropDownList.Initialize()

	HGSESkinAttributeDropDownList.__index = HGSESkinAttributeDropDownList;
	setmetatable( HGSESkinAttributeDropDownList, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeDropDownList', 'HGSE_SkinAttributeDropDownListTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeDropDownList', false );

end

function HGSESkinAttributeDropDownList.Shutdown()

end

function HGSESkinAttributeDropDownList.Activate( path, index, value, spec )

	HGSESkinAttributeDropDownList.valueList = spec.list;
	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeDropDownListValue", HGSESkinAttributeDropDownList.valueList );

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeDropDownList.SetValue( value );

	WindowSetShowing( 'HGSE_SkinAttributeDropDownList', true );

end

function HGSESkinAttributeDropDownList.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeDropDownList', false );

end

function HGSESkinAttributeDropDownList.SetValue( value )

	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeDropDownListValue", HGSESkinAttributeDropDownList.valueList, value );

end

function HGSESkinAttributeDropDownList.GetValue()

	return( HealGridGuiUtility.ComboBoxGetSelected("HGSE_SkinAttributeDropDownListValue",HGSESkinAttributeDropDownList.valueList) );

end

function HGSESkinAttributeDropDownList.CheckValue()

	return( HGSESkinAttributeDropDownList.GetValue() ~= nil );

end

function HGSESkinAttributeDropDownList.ValueToWString( value )

	return( StringToWString(value) );

end

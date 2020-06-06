HGSESkinAttributeSlider = {};

HGSESkinAttributeSlider.currVal = 0;
HGSESkinAttributeSlider.minVal = 0;
HGSESkinAttributeSlider.maxVal = 100;
HGSESkinAttributeSlider.labelFormat = L"%d";
HGSESkinAttributeSlider.divisor = 1;

function HGSESkinAttributeSlider.Initialize()

	HGSESkinAttributeSlider.__index = HGSESkinAttributeSlider;
	setmetatable( HGSESkinAttributeSlider, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeSlider', 'HGSE_SkinAttributeSliderTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeSlider', false );

end

function HGSESkinAttributeSlider.Shutdown()

end

function HGSESkinAttributeSlider.Activate( path, index, value, spec )

	HGSESkinAttribute.Activate( path, index );

	HGSESkinAttributeSlider.currVal = value;
	HGSESkinAttributeSlider.minVal = (spec.min or 0);
	HGSESkinAttributeSlider.maxVal = (spec.max or 100);
	HGSESkinAttributeSlider.labelFormat = (spec.format or L"%d");
	HGSESkinAttributeSlider.divisor = (spec.divisor or 1);

	HealGridGuiUtility.SliderInit( 'HGSE_SkinAttributeSliderValue', nil, L""..HGSESkinAttributeSlider.minVal, L"", L""..HGSESkinAttributeSlider.maxVal );
	HGSESkinAttributeSlider.SetValue( value );

	SliderBarSetDisabledFlag( 'HGSE_SkinAttributeSliderValueSlider', spec.editable ~= nil and spec.editable == false );

	WindowSetShowing( 'HGSE_SkinAttributeSlider', true );

end

function HGSESkinAttributeSlider.OnSlide( sliderPos )

	HGSESkinAttributeSlider.currVal = HealGridGuiUtility.GetSliderValue( 'HGSE_SkinAttributeSliderValue', sliderPos, 
																		HGSESkinAttributeSlider.minVal, HGSESkinAttributeSlider.maxVal, 
																		HGSESkinAttributeSlider.labelFormat,HGSESkinAttributeSlider.divisor );
	HGSESkinAttributeSlider.SetValue( nil );

end

function HGSESkinAttributeSlider.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeSlider', false );

end

function HGSESkinAttributeSlider.SetValue( value )

	if ( value ~= nil ) then
		HGSESkinAttributeSlider.currVal = value;
	end
	HealGridGuiUtility.SetSliderValue( 'HGSE_SkinAttributeSliderValue', HGSESkinAttributeSlider.currVal, 
																		HGSESkinAttributeSlider.minVal, HGSESkinAttributeSlider.maxVal, 
																		HGSESkinAttributeSlider.labelFormat,HGSESkinAttributeSlider.divisor );

end

function HGSESkinAttributeSlider.GetValue()

	return( HGSESkinAttributeSlider.currVal );

end

function HGSESkinAttributeSlider.CheckValue()

	return( true );

end

function HGSESkinAttributeSlider.ValueToWString( value )

	return( wstring.format(L"%d",value) );

end

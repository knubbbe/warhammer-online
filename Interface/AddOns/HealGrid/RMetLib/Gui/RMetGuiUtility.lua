RMetGuiUtility = {};

function RMetGuiUtility.Initialize()

	RMetGuiUtility.__index = RMetGuiUtility;

end

-- =======================================================================================================================
-- AlternatingLineColors
-- =======================================================================================================================

function RMetGuiUtility.GetAlternatingRowColor( row )

	if ( row == 1 ) then
		return( {r=51,g=51,b=51} );
	else
		return( {r=0,g=0,b=0} );
	end

end

-- =====================================================================================================
-- CheckButton
-- =====================================================================================================

function RMetGuiUtility.CheckButtonInit( checkButtonName, labelText )

	LabelSetText( checkButtonName.."Label", labelText );
	ButtonSetStayDownFlag( checkButtonName.."Button", true );

end

function RMetGuiUtility.CheckButtonActivate( checkButtonName, flag )

	ButtonSetPressedFlag( checkButtonName.."Button", flag );

end

function RMetGuiUtility.CheckButtonToggle( checkButtonName, flag )

	ButtonSetPressedFlag( checkButtonName.."Button", flag );

end

function RMetGuiUtility.CheckButtonIsPressed( checkButtonName )

	return( ButtonGetPressedFlag(checkButtonName.."Button") );

end

function RMetGuiUtility.CheckButtonDisable( checkButtonName )

	ButtonSetDisabledFlag( checkButtonName.."Button", true );
	LabelSetTextColor( checkButtonName.."Label", 150, 150, 150 );

end

-- =====================================================================================================
-- SliderBar
-- =====================================================================================================

function RMetGuiUtility.SliderInit( sliderFrameName, labelText, minLabelText, midLabelText, maxLabelText )

    LabelSetText( sliderFrameName.."Label", labelText );
    LabelSetText( sliderFrameName.."SliderMinLabel", minLabelText );
    LabelSetText( sliderFrameName.."SliderMidLabel", midLabelText);
    LabelSetText( sliderFrameName.."SliderMaxLabel", maxLabelText );

end

function RMetGuiUtility.SetSliderValue( frameName, currVal, minVal, maxVal, labelFormat, divisor )

	local sliderPos, val, range;

	if ( not DoesWindowExist(frameName) ) then
		frameName = frameName..'Slider';
	end

	divisor = (divisor or 1);
	currVal = currVal * divisor;
	minVal = minVal * divisor;
	maxVal = maxVal * divisor;

	range = maxVal - minVal;

	if ( currVal < minVal ) then
		currVal = minVal;
	elseif ( currVal > maxVal ) then
		currVal = maxVal;
	end

	val = math.abs( currVal - minVal );

	sliderPos = val / range;

	SliderBarSetCurrentPosition( frameName, sliderPos );

	if ( labelFormat ~= nil ) then
		LabelSetText( frameName..'MidLabel', wstring.format(labelFormat,currVal/divisor) );
	end

end

function RMetGuiUtility.GetSliderValue( frameName, sliderPos, minVal, maxVal, labelFormat, divisor )

	local range;

	if ( not DoesWindowExist(frameName) ) then
		frameName = frameName..'Slider';
	end

	divisor = (divisor or 1 );
	minVal = minVal * divisor;
	maxVal = maxVal * divisor;

	range = maxVal - minVal;

	currVal = math.floor( range * sliderPos + 0.5 ) + minVal;

    if ( labelFormat ~= nil ) then
        LabelSetText( frameName..'MidLabel', wstring.format(labelFormat,currVal/divisor) );
    end

	return( currVal / divisor );

end

-- =====================================================================================================
-- Combo Boxes
-- =====================================================================================================

function RMetGuiUtility.ComboBoxInit( comboBoxName, list, labelText )

	ComboBoxClearMenuItems( comboBoxName );

    for k,v in ipairs(list) do
        ComboBoxAddMenuItem( comboBoxName, v.label );
    end

	if ( labelText ~= nil ) then
		LabelSetText( comboBoxName.."Label", labelText );
	end

end

function RMetGuiUtility.ComboBoxActivate( comboBoxName, list, selected )

    for k,v in ipairs(list) do
		if ( v.key == selected ) then
	        ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function RMetGuiUtility.ComboBoxGetSelected( comboBox, list )

    local selected = ComboBoxGetSelectedMenuItem( comboBox );

	if ( list[selected] ) then
		return( list[selected].key );
	end

	return( nil );

end

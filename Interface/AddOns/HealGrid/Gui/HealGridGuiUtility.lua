HealGridGuiUtility = {};

HealGridGuiUtility.showCareerLineIconList = 
	{ 
		[1] = {key='SKIN',		label=L"Use Skin default",	},
		[2] = {key='SHOW',		label=L"Show",				},
		[3] = {key='HIDE',		label=L"Hide",				},
	};

HealGridGuiUtility.gridGroupingList = 
	{ 
		[1] = {key='SKIN',			label=L"Use Skin default",	},
		[2] = {key='GROUP',			label=L"Groups",			},
		[3] = {key='ARCH',			label=L"Career Arches",		},
		[4] = {key='CAREER',		label=L"Careers",			},
	};

HealGridGuiUtility.gridOrientationList = 
	{ 
		[1] = {key='SKIN',			label=L"Use Skin default",	},
		[2] = {key='HORIZONTAL',	label=L"Horizontal",		},
		[3] = {key='VERTICAL',		label=L"Vertical",			},
	};

HealGridGuiUtility.gridGrowthList =
	{
		[1] = {key='SKIN',	label=L"Use Skin default",	},
		[2] = {key='DOWN',	label=L"Down / Right",		},
		[3] = {key='UP',	label=L"Up / Left",			},
	};

HealGridGuiUtility.debuffFlagsList =
	{
		[1] = {key="ALL",			label=L"All"		},
		[2] = {key="DISPELLABLE",	label=L"Dispellable"},
		[3] = {key="NONE",			label=L"None"		},
	};

HealGridGuiUtility.unitFrameBarDisplayList =
	{
		[1] = {key='SKIN',	label=L"Use Skin default",	},
		[2] = {key='SHOW',	label=L"Show the bar",		},
		[3] = {key='HIDE',	label=L"Hide the bar",		},
	};

-- =======================================================================================================================
-- AlternatingLineColors
-- =======================================================================================================================

function HealGridGuiUtility.GetAlternatingRowColor( row )

	if ( row == 1 ) then
		return( {r=51,g=51,b=51} );
	else
		return( {r=0,g=0,b=0} );
	end

end

-- =====================================================================================================
-- CheckButton
-- =====================================================================================================

function HealGridGuiUtility.CheckButtonInit( checkButtonName, labelText )

	LabelSetText( checkButtonName.."Label", labelText );
	ButtonSetStayDownFlag( checkButtonName.."Button", true );

end

function HealGridGuiUtility.CheckButtonActivate( checkButtonName, flag )

	ButtonSetPressedFlag( checkButtonName.."Button", flag );

end

function HealGridGuiUtility.CheckButtonToggle( checkButtonName, flag )

	ButtonSetPressedFlag( checkButtonName.."Button", flag );

end

function HealGridGuiUtility.CheckButtonIsPressed( checkButtonName )

	return( ButtonGetPressedFlag(checkButtonName.."Button") );

end

function HealGridGuiUtility.CheckButtonDisable( checkButtonName )

	ButtonSetDisabledFlag( checkButtonName.."Button", true );
	HealGridUtility.LabelSetTextColor( checkButtonName.."Label", 150, 150, 150 );

end

-- =====================================================================================================
-- SliderBar
-- =====================================================================================================

function HealGridGuiUtility.SliderInit( sliderFrameName, labelText, minLabelText, midLabelText, maxLabelText )

	if ( labelText ~= nil ) then
	    LabelSetText( sliderFrameName.."Label", labelText );
	end

    LabelSetText( sliderFrameName.."SliderMinLabel", minLabelText );
    LabelSetText( sliderFrameName.."SliderMidLabel", midLabelText);
    LabelSetText( sliderFrameName.."SliderMaxLabel", maxLabelText );

end

function HealGridGuiUtility.SetSliderValue( frameName, currVal, minVal, maxVal, labelFormat, divisor )

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

function HealGridGuiUtility.GetSliderValue( frameName, sliderPos, minVal, maxVal, labelFormat, divisor )

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

function HealGridGuiUtility.ComboBoxInit( comboBoxName, list, labelText )

	ComboBoxClearMenuItems( comboBoxName );

    for k,v in ipairs(list) do
        ComboBoxAddMenuItem( comboBoxName, v.label );
    end

	if ( labelText ~= nil ) then
		LabelSetText( comboBoxName.."Label", labelText );
	end

end

function HealGridGuiUtility.ComboBoxActivate( comboBoxName, list, selected )

    for k,v in ipairs(list) do
		if ( v.key == selected ) then
	        ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function HealGridGuiUtility.ComboBoxGetSelected( comboBox, list )

    local selected = ComboBoxGetSelectedMenuItem( comboBox );

	if ( list[selected] ) then
		return( list[selected].key );
	end

	return( nil );

end

function HealGridGuiUtility.ComboBoxDisable( comboBox, flag )

	if ( flag == nil ) then
		flag = true;
	end

    ComboBoxSetDisabledFlag( comboBox, flag );

end

-- =======================================================================================================================
-- Career Line Icon
-- =======================================================================================================================

function HealGridGuiUtility.ShowCareerLineIconInit( comboBoxName )

	HealGridGuiUtility.ComboBoxInit( comboBoxName, HealGridGuiUtility.showCareerLineIconList, L"Career watermark" );

end

function HealGridGuiUtility.ShowCareerLineIconActivate( comboBoxName, currentShowCareerLineIcon )

	HealGridGuiUtility.ComboBoxActivate( comboBoxName, HealGridGuiUtility.showCareerLineIconList, currentShowCareerLineIcon );

end

function HealGridGuiUtility.ShowCareerLineIconGetSelected( comboBoxName )

	return( HealGridGuiUtility.ComboBoxGetSelected(comboBoxName,HealGridGuiUtility.showCareerLineIconList) );

end

-- =======================================================================================================================
-- Grid Grouping
-- =======================================================================================================================

function HealGridGuiUtility.GridGroupingInit( comboBoxName )

	HealGridGuiUtility.ComboBoxInit( comboBoxName, HealGridGuiUtility.gridGroupingList, L"Unit Grouping" );

end

function HealGridGuiUtility.GridGroupingActivate( comboBoxName, currentGridGrouping )

	HealGridGuiUtility.ComboBoxActivate( comboBoxName, HealGridGuiUtility.gridGroupingList, currentGridGrouping );

end

function HealGridGuiUtility.GridGroupingGetSelected( comboBoxName )

	return( HealGridGuiUtility.ComboBoxGetSelected(comboBoxName,HealGridGuiUtility.gridGroupingList) );

end

-- =======================================================================================================================
-- Grid Orientation
-- =======================================================================================================================

function HealGridGuiUtility.GridOrientationInit( comboBoxName )

	HealGridGuiUtility.ComboBoxInit( comboBoxName, HealGridGuiUtility.gridOrientationList, L"Grid Orientation" );

end

function HealGridGuiUtility.GridOrientationActivate( comboBoxName, currentGridOrientation )

	HealGridGuiUtility.ComboBoxActivate( comboBoxName, HealGridGuiUtility.gridOrientationList, currentGridOrientation );

end

function HealGridGuiUtility.GridOrientationGetSelected( comboBoxName )

	return( HealGridGuiUtility.ComboBoxGetSelected(comboBoxName,HealGridGuiUtility.gridOrientationList) );

end

-- =======================================================================================================================
-- Grid Growth
-- ======================================================================================================================

function HealGridGuiUtility.GridGrowthInit( comboBoxName )

	HealGridGuiUtility.ComboBoxInit( comboBoxName, HealGridGuiUtility.gridGrowthList, L"Grid Growth" );

end

function HealGridGuiUtility.GridGrowthActivate( comboBoxName, currentGridGrowth )

	HealGridGuiUtility.ComboBoxActivate( comboBoxName, HealGridGuiUtility.gridGrowthList, currentGridGrowth );

end

function HealGridGuiUtility.GridGrowthGetSelected( comboBoxName )

	return( HealGridGuiUtility.ComboBoxGetSelected(comboBoxName,HealGridGuiUtility.gridGrowthList) );

end

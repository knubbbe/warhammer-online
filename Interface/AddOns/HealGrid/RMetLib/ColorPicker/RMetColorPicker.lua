RMetColorPicker = {};

RMetColorPicker.colorGroupIdx = 0;
RMetColorPicker.callbackObject = nil;
RMetColorPicker.callbackFunction = nil;
RMetColorPicker.callbackSelf = false;

-- =========================================================================================
-- Initialize
-- =========================================================================================

function RMetColorPicker.Initialize( )

	CreateWindow( "RMet_ColorPicker", false );

	LabelSetText( "RMet_ColorPickerTitleBarText", L"RMet Color Picker" );

	for k,_ in ipairs(RMetColorGroups) do
		RMetColorPicker.ColorButtonInit( "RMet_ColorPickerColorGroup"..k, RMetColorGroups[k].labelColor );
	end

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function RMetColorPicker.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function RMetColorPicker.Activate( cbObj, cbFunc, cbSelf )

	local k = 1;

	RMetColorPicker.colorGroupIdx = 0;
	RMetColorPicker.callbackObject = cbObj;
	RMetColorPicker.callbackFunction = cbFunc;
	RMetColorPicker.callbackSelf = (cbSelf or false);

	while ( DoesWindowExist("RMet_ColorPickerColor"..k) ) do
		WindowSetShowing( "RMet_ColorPickerColor"..k, false );
		k = k + 1;
	end

	WindowSetShowing( "RMet_ColorPicker", true );

end

-- =========================================================================================
-- CloseWindow
-- =========================================================================================

function RMetColorPicker.CloseWindow()

	WindowSetShowing( "RMet_ColorPicker", false );

end

-- =======================================================================================================================
-- ColorButton
-- =======================================================================================================================

function RMetColorPicker.ColorButtonInit( cbName, color )

	ButtonSetText( cbName..'Button', RMetColor[color].label );
	WindowSetTintColor( cbName..'Background', RMetColor[color].r, RMetColor[color].g, RMetColor[color].b );

end

-- =======================================================================================================================
-- Select Color Group
-- =======================================================================================================================

function RMetColorPicker.SelectColorGroup()

	local buttonName;
	local k = 1;
	local colorGroupIdx = WindowGetId( WindowGetParent(SystemData.ActiveWindow.name) );

	RMetColorPicker.colorGroupIdx = colorGroupIdx;

	while ( RMetColorGroups[colorGroupIdx].colors[k] ~= nil ) do
		buttonName = "RMet_ColorPickerColor"..k;
		if ( not DoesWindowExist(buttonName) ) then
			CreateWindowFromTemplate( buttonName, "RMet_ColorPickerColorButtonTemplate", "RMet_ColorPicker" );
			WindowSetId( buttonName, k );
			if ( k == 1 ) then
				WindowAddAnchor( buttonName, 'topleft', "RMet_ColorPicker", 'topleft', 10, 110 );
			elseif ( k % 5 == 1 ) then
				WindowAddAnchor( buttonName, 'bottomleft', "RMet_ColorPickerColor"..(k-5), 'topleft', 0, 0 );
			else
				WindowAddAnchor( buttonName, 'right', "RMet_ColorPickerColor"..(k-1), 'left', 0, 0 );
			end
		end
		RMetColorPicker.ColorButtonInit( buttonName, RMetColorGroups[colorGroupIdx].colors[k] );
		WindowSetShowing( buttonName, true );

		k = k + 1;
	end

	while ( DoesWindowExist("RMet_ColorPickerColor"..k) ) do
		WindowSetShowing( "RMet_ColorPickerColor"..k, false );
		k = k + 1;
	end

end

-- =======================================================================================================================
-- Select Color
-- =======================================================================================================================

function RMetColorPicker.SelectColor()

	local color;
	local colorIdx = WindowGetId( WindowGetParent(SystemData.ActiveWindow.name) );

	if ( RMetColorGroups[RMetColorPicker.colorGroupIdx] ) then
		color = RMetColorGroups[RMetColorPicker.colorGroupIdx].colors[colorIdx];
		if ( RMetColorPicker.callbackFunction ) then
			if ( RMetColorPicker.callbackObject and RMetColorPicker.callbackSelf ) then
				RMetColorPicker.callbackObject[RMetColorPicker.callbackFunction]( RMetColorPicker.callbackObject, color );
			elseif ( RMetColorPicker.callbackObject ) then
				RMetColorPicker.callbackObject[RMetColorPicker.callbackFunction]( color );
			else
				RMetColorPicker.callbackFunction( color );
			end
		end
		RMetColorPicker.CloseWindow();
	end

end

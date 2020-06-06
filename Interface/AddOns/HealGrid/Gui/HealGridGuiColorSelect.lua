HealGridGuiColorSelect = {};

HealGridGuiColorSelect.colorGroupIdx = 0;
HealGridGuiColorSelect.callbackObject = nil;
HealGridGuiColorSelect.callbackFunction = nil;

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiColorSelect.Initialize( )

	CreateWindow( "HGG_HealGridGuiColorSelect", false );

	LabelSetText( "HGG_HealGridGuiColorSelectTitleBarText", L"HealGrid Color Picker" );

	for k,_ in ipairs(RMetColorGroups) do
		HealGridGuiColorSelect.ColorButtonInit( "HGG_HealGridGuiColorSelectColorGroup"..k, RMetColorGroups[k].labelColor );
	end

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiColorSelect.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiColorSelect.Activate( cbObj, cbFunc )

	local k = 1;

	HealGridGuiColorSelect.colorGroupIdx = 0;
	HealGridGuiColorSelect.callbackObject = cbObj;
	HealGridGuiColorSelect.callbackFunction = cbFunc;

	while ( DoesWindowExist("HGG_HealGridGuiColorSelectColor"..k) ) do
		WindowSetShowing( "HGG_HealGridGuiColorSelectColor"..k, false );
		k = k + 1;
	end

	WindowSetShowing( "HGG_HealGridGuiColorSelect", true );

end

-- =========================================================================================
-- CloseWindow
-- =========================================================================================

function HealGridGuiColorSelect.CloseWindow()

	WindowSetShowing( "HGG_HealGridGuiColorSelect", false );

end

-- =======================================================================================================================
-- ColorButton
-- =======================================================================================================================

function HealGridGuiColorSelect.ColorButtonInit( cbName, color )

	local labelText = RMetColor[color].name:gsub( "([A-Z])", " %1" );

	labelText = labelText:sub( 2 );

	ButtonSetText( cbName..'Button', StringToWString(labelText) );
	HealGridUtility.WindowSetTintColor( cbName..'Background', color );

end

-- =======================================================================================================================
-- Select Color Group
-- =======================================================================================================================

function HealGridGuiColorSelect.SelectColorGroup()

	local buttonName;
	local k = 1;
	local colorGroupIdx = WindowGetId( WindowGetParent(SystemData.ActiveWindow.name) );

	HealGridGuiColorSelect.colorGroupIdx = colorGroupIdx;

	while ( RMetColorGroups[colorGroupIdx].colors[k] ~= nil ) do
		buttonName = "HGG_HealGridGuiColorSelectColor"..k;
		if ( not DoesWindowExist(buttonName) ) then
			CreateWindowFromTemplate( buttonName, "HGG_HealGridGuiColorSelectColorButtonTemplate", "HGG_HealGridGuiColorSelect" );
			WindowSetId( buttonName, k );
			if ( k == 1 ) then
				WindowAddAnchor( buttonName, 'topleft', "HGG_HealGridGuiColorSelect", 'topleft', 10, 110 );
			elseif ( k % 5 == 1 ) then
				WindowAddAnchor( buttonName, 'bottomleft', "HGG_HealGridGuiColorSelectColor"..(k-5), 'topleft', 0, 0 );
			else
				WindowAddAnchor( buttonName, 'right', "HGG_HealGridGuiColorSelectColor"..(k-1), 'left', 0, 0 );
			end
		end
		HealGridGuiColorSelect.ColorButtonInit( buttonName, RMetColorGroups[colorGroupIdx].colors[k] );
		WindowSetShowing( buttonName, true );

		k = k + 1;
	end

	while ( DoesWindowExist("HGG_HealGridGuiColorSelectColor"..k) ) do
		WindowSetShowing( "HGG_HealGridGuiColorSelectColor"..k, false );
		k = k + 1;
	end

end

-- =======================================================================================================================
-- Select Color
-- =======================================================================================================================

function HealGridGuiColorSelect.SelectColor()

	local color;
	local colorIdx = WindowGetId( WindowGetParent(SystemData.ActiveWindow.name) );

	if ( RMetColorGroups[HealGridGuiColorSelect.colorGroupIdx] ) then
		color = RMetColorGroups[HealGridGuiColorSelect.colorGroupIdx].colors[colorIdx];
		if ( HealGridGuiColorSelect.callbackFunction ) then
			if ( HealGridGuiColorSelect.callbackObject ) then
				HealGridGuiColorSelect.callbackObject[HealGridGuiColorSelect.callbackFunction]( color );
			else
				HealGridGuiColorSelect.callbackFunction( color );
			end
		end
		HealGridGuiColorSelect.CloseWindow();
	end

end

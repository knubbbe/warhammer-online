HealGridUnitTooltip = {};

HealGridUnitTooltip.unitObj = nil;						-- pointer to the unit-frame to be displayed
HealGridUnitTooltip.frameType = nil;					-- which frame-type the tooltip is shown for
HealGridUnitTooltip.frameObj = nil;						-- pointer to the frame for which tooltip is shown (if frametype != UNIT);
HealGridUnitTooltip.frameName = "HG_HealGridUnitTooltip";

-- ==============================================================================================
-- Trivials
-- ==============================================================================================

function HealGridUnitTooltip.GetUnit()

	return( HealGridUnitTooltip.unitObj );

end

function HealGridUnitTooltip.GetFrameObj()

	return( HealGridUnitTooltip.frameObj );

end

function HealGridUnitTooltip.GetFrameType()

	return( HealGridUnitTooltip.frameType );

end

function HealGridUnitTooltip.GetFrameName()

	return( HealGridUnitTooltip.frameName );

end

-- ==============================================================================================
-- Initialization
-- ==============================================================================================

function HealGridUnitTooltip.Initialize()

	RegisterEventHandler( SystemData.Events.L_BUTTON_DOWN_PROCESSED, "HealGridUnitTooltip.ButtonPressed" );
	RegisterEventHandler( SystemData.Events.M_BUTTON_DOWN_PROCESSED, "HealGridUnitTooltip.ButtonPressed" );
	RegisterEventHandler( SystemData.Events.R_BUTTON_DOWN_PROCESSED, "HealGridUnitTooltip.ButtonPressed" );

	CreateWindow( "HG_HealGridUnitTooltipAnchor", false );
	LayoutEditor.RegisterWindow( "HG_HealGridUnitTooltipAnchor", L"HealGrid (Tooltip)", L"HealGrid (Tooltip)",
      	                             false, false, true, nil );

	CreateWindowFromTemplate( HealGridUnitTooltip.GetFrameName(), "HG_HealGridUnitTooltipTemplate", "Root" );
	WindowSetShowing( HealGridUnitTooltip.GetFrameName(), false );
	WindowSetScale( HealGridUnitTooltip.GetFrameName(), WindowGetScale("HG_HealGridUnitTooltipAnchor") );
	HealGridUnitTooltip.SetAnchor();

	LabelSetText( HealGridUnitTooltip.GetFrameName()..'ActionsLMBLabel', L"LMB" );
	LabelSetText( HealGridUnitTooltip.GetFrameName()..'ActionsMMBLabel', L"MMB" );
	LabelSetText( HealGridUnitTooltip.GetFrameName()..'ActionsRMBLabel', L"RMB" );

end

-- ==============================================================================================
-- Shutdown
-- ==============================================================================================

function HealGridUnitTooltip.Shutdown()

end

-- ==============================================================================================
-- Populate Tooltip
-- ==============================================================================================

function HealGridUnitTooltip.PopulateUnitData( modifierKey )

	local icon, x, y, careerLine, color;
	local frameName = HealGridUnitTooltip.GetFrameName();

	LabelSetText( frameName..'UnitName', HealGridUnitTooltip.GetUnit():GetUnitName() );
	color = HealGridGlobals.UnitTargetTypeColor[HealGridUnitTooltip.GetUnit():GetTargetType()];
	HealGridUtility.WindowSetTintColor( frameName..'UnitNameBackground', color );
	WindowSetShowing( frameName..'UnitName', true );
	WindowSetShowing( frameName..'UnitNameBackground', true );

	LabelSetText( frameName..'UnitLevel', L""..HealGridUnitTooltip.GetUnit():GetUnitLevel() );
	color = DataUtils.GetTargetConColor( HealGridUnitTooltip.GetUnit():GetConType() );
	HealGridUtility.WindowSetTintColor( frameName.."UnitLevelBackground", color );
	WindowSetShowing( frameName..'UnitLevel', true );
	WindowSetShowing( frameName..'UnitLevelBackground', true );

	careerLine = HealGridUnitTooltip.GetUnit():GetCareerLine();
	if ( careerLine > 0 ) then
		icon,x,y = GetIconData( Icons.GetCareerIconIDFromCareerLine(careerLine) );
		DynamicImageSetTexture( frameName..'PCUnitCareerIcon', icon, x, y );
		LabelSetText( frameName..'PCUnitCareer', HealGridUnitTooltip.GetUnit():GetCareerName() );
		LabelSetText( frameName..'PCUnitRace', L"" ); --HealGridUnitTooltip.GetUnit():GetRaceName() );

		WindowSetShowing( frameName..'PC', true );

		WindowClearAnchors( frameName..'Actions' );
		WindowAddAnchor( frameName..'Actions', 'bottomleft', frameName..'PC', 'topleft', 0, 2 );
		WindowAddAnchor( frameName..'Actions', 'bottomright', frameName, 'bottomright', -1, -1 );

		WindowSetDimensions( frameName, 200, 106 );
	else
		WindowSetShowing( frameName..'PC', false );

		WindowClearAnchors( frameName..'Actions' );
		WindowAddAnchor( frameName..'Actions', 'topleft', frameName..'PC', 'topleft', 0, 0 );
		WindowAddAnchor( frameName..'Actions', 'bottomright', frameName, 'bottomright', -1, -1 );

		WindowSetDimensions( frameName, 200, 71 );
	end

	HealGridUnitTooltip.PopulateMouseClick( modifierKey );

end

function HealGridUnitTooltip.PopulateNonUnitData( modifierKey )

	local frameName = HealGridUnitTooltip.GetFrameName();

	WindowSetShowing( frameName..'UnitName', false );
	WindowSetShowing( frameName..'UnitNameBackground', false );
	WindowSetShowing( frameName..'UnitLevel', false );
	WindowSetShowing( frameName..'UnitLevelBackground', false );

	WindowSetShowing( frameName..'PC', false );

	WindowClearAnchors( frameName..'Actions' );
	WindowAddAnchor( frameName..'Actions', 'topleft', frameName, 'topleft', 1, 1 );
	WindowAddAnchor( frameName..'Actions', 'bottomright', frameName, 'bottomright', -1, -1 );

	WindowSetDimensions( frameName, 200, 51 );

	HealGridUnitTooltip.PopulateMouseClick( modifierKey );

end

function HealGridUnitTooltip.PopulateMouseClick( modifierKey )

	local unitType, targetType, lmbKey, mmbKey, rmbKey;
	local frameName = HealGridUnitTooltip.GetFrameName();
	local shiftPressed = HealGridUtility.IsShiftPressed( modifierKey );
	local ctrlPressed = HealGridUtility.IsControlPressed( modifierKey );
	local altPressed = HealGridUtility.IsAltPressed( modifierKey );

	if ( HealGridUnitTooltip.frameType == 'UNIT' ) then
		if ( HealGridUnitTooltip.GetUnit():UnitIsFriend() ) then
			targetType = 'FRIENDLY';
		else
			targetType = 'HOSTILE';
		end

		lmbKey = HealGridMouseClick.UnitClickedGetKeyToProcess( targetType, 'LMB', shiftPressed, ctrlPressed, altPressed );
		mmbKey = HealGridMouseClick.UnitClickedGetKeyToProcess( targetType, 'MMB', shiftPressed, ctrlPressed, altPressed );
		rmbKey = HealGridMouseClick.UnitClickedGetKeyToProcess( targetType, 'RMB', shiftPressed, ctrlPressed, altPressed );
	elseif ( HealGridUnitTooltip.frameType == 'PET' ) then
		if ( HealGridUnitTooltip.GetUnit():UnitIsFriend() ) then
			targetType = 'FRIENDLY';
		else
			targetType = 'HOSTILE';
		end

		lmbKey = HealGridMouseClick.PetClickedGetKeyToProcess( targetType, 'LMB', shiftPressed, ctrlPressed, altPressed );
		mmbKey = HealGridMouseClick.PetClickedGetKeyToProcess( targetType, 'MMB', shiftPressed, ctrlPressed, altPressed );
		rmbKey = HealGridMouseClick.PetClickedGetKeyToProcess( targetType, 'RMB', shiftPressed, ctrlPressed, altPressed );
	else
		lmbKey = HealGridMouseClick.NonUnitClickedGetKeyToProcess( HealGridUnitTooltip.GetFrameType(), 'LMB', shiftPressed, ctrlPressed, altPressed );
		mmbKey = HealGridMouseClick.NonUnitClickedGetKeyToProcess( HealGridUnitTooltip.GetFrameType(), 'MMB', shiftPressed, ctrlPressed, altPressed );
		rmbKey = HealGridMouseClick.NonUnitClickedGetKeyToProcess( HealGridUnitTooltip.GetFrameType(), 'RMB', shiftPressed, ctrlPressed, altPressed );
	end

	LabelSetText( frameName..'ActionsLMBAction', HealGridMouseClick.GetTooltipLabel(lmbKey) );
	LabelSetText( frameName..'ActionsMMBAction', HealGridMouseClick.GetTooltipLabel(mmbKey) );
	LabelSetText( frameName..'ActionsRMBAction', HealGridMouseClick.GetTooltipLabel(rmbKey) );

end

-- ==============================================================================================
-- Update
-- ==============================================================================================

function HealGridUnitTooltip.OnUpdate( a, b, c )

	if ( (HealGridUnitTooltip.frameType == 'UNIT' or HealGridUnitTooltip.frameType == 'PET') and 
         (HealGridUnitTooltip.GetUnit() == nil or (not HealGridUnitTooltip.GetUnit():UnitExists())) ) 
	then
		HealGridUnitTooltip.StopTooltip();
	end

end

-- ==============================================================================================
-- Anchoring
-- ==============================================================================================

function HealGridUnitTooltip.SetAnchor()

	WindowClearAnchors( HealGridUnitTooltip.GetFrameName() );
	WindowAddAnchor( HealGridUnitTooltip.GetFrameName(), 'right', 'HG_HealGridUnitTooltipAnchor', 'right', 0, 0 );

end

-- ==============================================================================================
-- button pressed (used to update modifier keys)
-- ==============================================================================================

function HealGridUnitTooltip.ButtonPressed( modifierKey )

	if ( HealGridUnitTooltip.GetUnit() ~= nil and (HealGridUnitTooltip.GetUnit():UnitExists()) ) then
		HealGridUnitTooltip.PopulateMouseClick( modifierKey );
		return;
	end

end

-- ==============================================================================================
-- Start tooltip showing
-- ==============================================================================================

function HealGridUnitTooltip.StartTooltip( modifierKey )

	if ( not HealGrid.SettingGet('unitTooltipShow') ) then
		return;
	end

	HealGridUnitTooltip.frameObj = nil;
	HealGridUnitTooltip.unitObj,HealGridUnitTooltip.frameType = HealGridUtility.FrameNameToUnit( SystemData.MouseOverWindow.name );

	if ( (HealGridUnitTooltip.frameType == 'UNIT' or HealGridUnitTooltip.frameType == 'PET') and 
         HealGridUnitTooltip.GetUnit() ~= nil and HealGridUnitTooltip.GetUnit():UnitExists() )
	then
		HealGridUnitTooltip.PopulateUnitData( modifierKey );
		WindowSetShowing( HealGridUnitTooltip.GetFrameName(), true );
		HealGridUnitTooltip.GetUnit():StartTooltip();
	elseif ( HealGridUnitTooltip.frameType == 'APBAR' or HealGridUnitTooltip.frameType == 'CPBAR' or
             HealGridUnitTooltip.frameType == 'MORALEBAR' or HealGridUnitTooltip.frameType == 'CASTBAR' )
	then
		HealGridUnitTooltip.PopulateNonUnitData( modifierKey );
		WindowSetShowing( HealGridUnitTooltip.GetFrameName(), true );
		HealGridUnitTooltip.frameObj = HealGridProgressBar.GetInstance( SystemData.MouseOverWindow.name );
		HealGridUnitTooltip.GetFrameObj():StartTooltip();
	else
		HealGridUnitTooltip.unitObj = nil;
		HealGridUnitTooltip.frameObj = nil;
		HealGridUnitTooltip.frameType = nil;
	end

end

-- ==============================================================================================
-- stop displaying a unit
-- ==============================================================================================

function HealGridUnitTooltip.StopTooltip()

	if ( HealGridUnitTooltip.GetFrameType() == 'UNIT' and HealGridUnitTooltip.GetUnit() ) then
		HealGridUnitTooltip.GetUnit():StopTooltip();
	elseif ( HealGridUnitTooltip.GetFrameType() == 'PET' and HealGridUnitTooltip.GetUnit() ) then
		HealGridUnitTooltip.GetUnit():StopTooltip();
	elseif ( HealGridUnitTooltip.GetFrameType() ~= 'UNIT' and HealGridUnitTooltip.GetFrameObj() ) then
		HealGridUnitTooltip.GetFrameObj():StopTooltip();
	end

	HealGridUnitTooltip.unitObj = nil;
	HealGridUnitTooltip.frameObj = nil;
	HealGridUnitTooltip.frameType = nil;
	WindowSetShowing( HealGridUnitTooltip.GetFrameName(), false );

end

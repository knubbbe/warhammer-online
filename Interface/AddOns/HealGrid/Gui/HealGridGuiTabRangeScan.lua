HealGridGuiTabRangeScan = {};

HealGridGuiTabRangeScan.isChoosingSpell = false;

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabRangeScan.Initialize()

    -- ----- Status ----------------------------
    obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanStatus",
                               settingObj='HealGrid', settingKey='rangeScanStatus',
                               label=L"Enable range scanning of units" };
    RMetGuiBroker.Add( obj );

	-- ----- RangeCheckingTitle ----------------
	LabelSetText( "HGG_HealGridTabRangeScanChooseSpellTitle", L"Range-scan spells" );

	-- ----- friendlySpell ---------------------
	LabelSetText( "HGG_HealGridTabRangeScanFriendlySpellLabel", L"Friendly Spell:" );
	ButtonSetText( "HGG_HealGridTabRangeScanFriendlySpellButton", L"Choose" );

	-- ----- hostileSpell ----------------------
	LabelSetText( "HGG_HealGridTabRangeScanHostileSpellLabel", L"Hostile Spell:" );
	ButtonSetText( "HGG_HealGridTabRangeScanHostileSpellButton", L"Choose" );

	-- ----- resurrectSpell --------------------
	LabelSetText( "HGG_HealGridTabRangeScanResurrectSpellLabel", L"Resurrect Spell:" );
	ButtonSetText( "HGG_HealGridTabRangeScanResurrectSpellButton", L"Choose" );

	-- ----- spellSelect -----------------------
	HealGridGuiSpellList.Initialize( "HGG_HealGridTabRangeScanSpellSelect", HGG_HealGridTabRangeScanSpellSelectList );

	-- ----- InRange ---------------------------
	LabelSetText( "HGG_HealGridTabRangeScanInRangeTitle", L"Unit in Range" );

	obj = RMetGuiSliderBar:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanInRangeTimePale", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_IN_RANGE:TIME_PALE',
                               label=L"Time to pale", minLabel=L"1 sec", maxLabel=L"30 sec", midLabel=L"10", midLabelFormat=L"%d sec",
                               minVal=0, maxVal=30 };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiSliderBar:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanInRangeTimeFade", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_IN_RANGE:TIME_FADE',
                               label=L"Time to fade", minLabel=L"1 sec", maxLabel=L"30 sec", midLabel=L"10", midLabelFormat=L"%d sec",
                               minVal=0, maxVal=30 };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiColorPickerButton:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanInRangeColorHard", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_IN_RANGE:COLOR_HARD',
                               label=L"Color Hard", sign=nil };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiColorPickerButton:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanInRangeColorSoft", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_IN_RANGE:COLOR_SOFT',
                               label=L"Color Soft", sign=nil };
	RMetGuiBroker.Add( obj );

	-- ----- OutOfRange ------------------------
	LabelSetText( "HGG_HealGridTabRangeScanOutOfRangeTitle", L"Unit out of Range" );

	obj = RMetGuiSliderBar:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfRangeTimePale", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_RANGE:TIME_PALE',
                               label=L"Time to pale", minLabel=L"1 sec", maxLabel=L"30 sec", midLabel=L"10", midLabelFormat=L"%d sec",
                               minVal=0, maxVal=30 };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiSliderBar:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfRangeTimeFade", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_RANGE:TIME_FADE',
                               label=L"Time to fade", minLabel=L"1 sec", maxLabel=L"30 sec", midLabel=L"10", midLabelFormat=L"%d sec",
                               minVal=0, maxVal=30 };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiColorPickerButton:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfRangeColorHard", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_RANGE:COLOR_HARD',
                               label=L"Color Hard", sign=nil };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiColorPickerButton:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfRangeColorSoft", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_RANGE:COLOR_SOFT',
                               label=L"Color Soft", sign=nil };
	RMetGuiBroker.Add( obj );

	-- ----- OutOfReach ------------------------
	LabelSetText( "HGG_HealGridTabRangeScanOutOfReachTitle", L"Unit out of Reach" );

	obj = RMetGuiSliderBar:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfReachTimePale", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_REACH:TIME_PALE',
                               label=L"Time to pale", minLabel=L"1 sec", maxLabel=L"30 sec", midLabel=L"10", midLabelFormat=L"%d sec",
                               minVal=0, maxVal=30 };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiSliderBar:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfReachTimeFade", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_REACH:TIME_FADE',
                               label=L"Time to fade", minLabel=L"1 sec", maxLabel=L"30 sec", midLabel=L"10", midLabelFormat=L"%d sec",
                               minVal=0, maxVal=30 };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiColorPickerButton:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfReachColorHard", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_REACH:COLOR_HARD',
                               label=L"Color Hard", sign=nil };
	RMetGuiBroker.Add( obj );

	obj = RMetGuiColorPickerButton:New{ paneID='HGG_HealGridTabRangeScan', frameName="HGG_HealGridTabRangeScanOutOfReachColorSoft", 
                               settingObj='HealGrid', settingKey='rangeScanData:UNIT_OUT_OF_REACH:COLOR_SOFT',
                               label=L"Color Soft", sign=nil };
	RMetGuiBroker.Add( obj );

	-- ----- now init the Broker -----------------
	RMetGuiBroker.InitializePane( 'HGG_HealGridTabRangeScan', HealGridGlobals.GUI_WIDGET_WIDTH );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabRangeScan.Shutdown()

	RMetGuiBroker.ShutdownPane( 'HGG_HealGridTabRangeScan' );

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabRangeScan.Activate()

	local abilityID;

	RMetGuiBroker.ActivatePane( 'HGG_HealGridTabRangeScan' );

	-- ----- friendlySpell ---------------------
	abilityID = HealGrid.SettingGet( 'rangeScanFriendlyAbility' );
	if ( abilityID ~= 0 ) then
		if ( GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID] == nil ) then
			LabelSetText( "HGG_HealGridTabRangeScanFriendlySpellName", L"Untrained spell ("..abilityID..L")" );
			HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanFriendlySpellName", "ORANGE" );
		else
			LabelSetText( "HGG_HealGridTabRangeScanFriendlySpellName", HealGridUtility.WStringChop(GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID].name) );
			HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanFriendlySpellName", "FOREST_GREEN" );
		end
	else
		LabelSetText( "HGG_HealGridTabRangeScanFriendlySpellName", L"no spell set" );
		HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanFriendlySpellName", "RED" );
	end

	-- ----- hostileSpell ---------------------
	abilityID = HealGrid.SettingGet( 'rangeScanHostileAbility' );
	if ( abilityID ~= 0 ) then
		if ( GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID] == nil ) then
			LabelSetText( "HGG_HealGridTabRangeScanFriendlySpellName", L"Untrained spell ("..abilityID..L")" );
			HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanFriendlySpellName", "ORANGE" );
		else
			LabelSetText( "HGG_HealGridTabRangeScanHostileSpellName", HealGridUtility.WStringChop(GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID].name) );
			HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanHostileSpellName", "FOREST_GREEN" );
		end
	else
		LabelSetText( "HGG_HealGridTabRangeScanHostileSpellName", L"not spell set" );
		HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanHostileSpellName", "RED" );
	end

	-- ----- resurrectSpell -------------------
	abilityID = HealGrid.SettingGet( 'rangeScanResurrectAbility' );
	if ( abilityID ~= 0 ) then
		if ( GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID] == nil ) then
			LabelSetText( "HGG_HealGridTabRangeScanFriendlySpellName", L"Untrained spell ("..abilityID..L")" );
			HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanFriendlySpellName", "ORANGE" );
		else
			LabelSetText( "HGG_HealGridTabRangeScanResurrectSpellName", HealGridUtility.WStringChop(GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID].name) );
			HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanResurrectSpellName", "FOREST_GREEN" );
		end
	else
		LabelSetText( "HGG_HealGridTabRangeScanResurrectSpellName", L"not spell set" );
		HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanResurrectSpellName", "RED" );
	end

	-- ----- spellSelect ----------------------
	WindowSetShowing( "HGG_HealGridTabRangeScanSpellSelect", false );
	HealGridGuiTabRangeScan.isChoosingSpell = false;

end

-- =========================================================================================
-- Friendly Spell
-- =========================================================================================

function HealGridGuiTabRangeScan.SetFriendlySpell( abilityID )

	if ( abilityID ~= nil and abilityID ~= 0 ) then
		HealGrid.SettingSet( 'rangeScanFriendlyAbility', abilityID );
		LabelSetText( "HGG_HealGridTabRangeScanFriendlySpellName", HealGridUtility.WStringChop(GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID].name) );
		HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanFriendlySpellName", "FOREST_GREEN" );

		HealGridGuiSpellList.isChoosingSpell = false;
		WindowSetShowing( "HGG_HealGridTabRangeScanSpellSelect", false );
	else
		abilityID = HealGrid.SettingGet( 'rangeScanFriendlyAbility' );
		HealGridGuiSpellList.Activate( "HGG_HealGridTabRangeScanSpellSelect", HGG_HealGridTabRangeScanSpellSelectList, abilityID, GameData.TargetTypes.TARGET_ALLY );
		HealGridGuiSpellList.SetCallBack( HealGridGuiTabRangeScan, "SetFriendlySpell" );

		HealGridGuiSpellList.isChoosingSpell = true;
		WindowSetShowing( "HGG_HealGridTabRangeScanSpellSelect", true );
	end

end

-- =========================================================================================
-- Hostile Spell
-- =========================================================================================

function HealGridGuiTabRangeScan.SetHostileSpell( abilityID )

	if ( abilityID ~= nil and abilityID ~= 0 ) then
		HealGrid.SettingSet( 'rangeScanHostileAbility', abilityID );
		LabelSetText( "HGG_HealGridTabRangeScanHostileSpellName", HealGridUtility.WStringChop(GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID].name) );
		HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanHostileSpellName", "FOREST_GREEN" );

		HealGridGuiSpellList.isChoosingSpell = false;
		WindowSetShowing( "HGG_HealGridTabRangeScanSpellSelect", false );
	else
		abilityID = HealGrid.SettingGet( 'rangeScanHostileAbility' );
		HealGridGuiSpellList.Activate( "HGG_HealGridTabRangeScanSpellSelect", HGG_HealGridTabRangeScanSpellSelectList, abilityID, GameData.TargetTypes.TARGET_ENEMY );
		HealGridGuiSpellList.SetCallBack( HealGridGuiTabRangeScan, "SetHostileSpell" );

		HealGridGuiSpellList.isChoosingSpell = true;
		WindowSetShowing( "HGG_HealGridTabRangeScanSpellSelect", true );
	end

end

-- =========================================================================================
-- Resurrect Spell
-- =========================================================================================

function HealGridGuiTabRangeScan.SetResurrectSpell( abilityID )

	if ( abilityID ~= nil and abilityID ~= 0 ) then
		HealGrid.SettingSet( 'rangeScanResurrectAbility', abilityID );
		LabelSetText( "HGG_HealGridTabRangeScanResurrectSpellName", HealGridUtility.WStringChop(GetAbilityTable(GameData.AbilityType.STANDARD)[abilityID].name) );
		HealGridUtility.LabelSetTextColor( "HGG_HealGridTabRangeScanResurrectSpellName", "FOREST_GREEN" );

		HealGridGuiSpellList.isChoosingSpell = false;
		WindowSetShowing( "HGG_HealGridTabRangeScanSpellSelect", false );
	else
		abilityID = HealGrid.SettingGet( 'rangeScanResurrectAbility' );
		HealGridGuiSpellList.Activate( "HGG_HealGridTabRangeScanSpellSelect", HGG_HealGridTabRangeScanSpellSelectList, abilityID, GameData.TargetTypes.TARGET_ALLY );
		HealGridGuiSpellList.SetCallBack( HealGridGuiTabRangeScan, "SetResurrectSpell" );

		HealGridGuiSpellList.isChoosingSpell = true;
		WindowSetShowing( "HGG_HealGridTabRangeScanSpellSelect", true );
	end

end

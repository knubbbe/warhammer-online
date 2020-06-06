HealGridGuiTabBattlegroup = {};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabBattlegroup.Initialize()

    -- ----- stayHidden ------------------------
    HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabBattlegroupStayHidden", L"Enable warband grid" );

    -- ----- hideWARWarbandFrames --------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabBattlegroupHideWARWarbandFrames", L"Hide WAR warband frames" )

	-- ----- showHUD ---------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabBattlegroupShowHUD", L"Show HUD" );

	-- ----- showDebuffFlags -------------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabBattlegroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList, L"Show Debuff Flags" );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabBattlegroupUpdateThrottle", L"Update Throttle", L"0 sec", L"", L"1 sec" );

	-- ----- buffUpdateThrottle-----------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabBattlegroupBuffUpdateThrottle", L"Buff Throttle", L"0 sec", L"", L"1 sec" );

	-- ----- preview ---------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabBattlegroupPreviewGrid", L"Preview grid" );

	-- ----- skin ------------------------------
	LabelSetText( "HGG_HealGridTabBattlegroupSkinLabel", L"Skin" );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconInit( "HGG_HealGridTabBattlegroupShowCareerLineIcon" );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabBattlegroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Health Bar" );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabBattlegroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Action Points Bar" );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabBattlegroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Morale Level Bar" );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabBattlegroupUnitFrameWidth", L"Frame Width", L"-50", L"0", L"+50" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabBattlegroupUnitFrameHeight", L"Frame Height", L"-50", L"0", L"+50" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabBattlegroupUnitFrameScale", L"Frame Scale", L"25%", L"100%", L"200%" );

	-- ----- gridOrientation -------------------
	HealGridGuiUtility.GridOrientationInit( "HGG_HealGridTabBattlegroupGridOrientation" );

	-- ----- gridGrowth ------------------------
	HealGridGuiUtility.GridGrowthInit( "HGG_HealGridTabBattlegroupGridGrowth" );

	-- ----- gridGrouping ----------------------
	HealGridGuiUtility.GridGroupingInit( "HGG_HealGridTabBattlegroupGridGrouping" );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabBattlegroup.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabBattlegroup.Activate()

    -- ----- stayHidden ------------------------
    HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabBattlegroupStayHidden", not HealGrid.SettingGet('battlegroupStayHidden') );

    -- ----- hideWARWarbandFrames --------------
    HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabBattlegroupHideWARWarbandFrames", HealGrid.SettingGet('battlegroupHideWARWarbandFrames') );

	-- ----- showHUD ---------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabBattlegroupShowHUD", HealGrid.SettingGet('battlegroupShowHUD') );

	-- ----- showDebuffFlags -------------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabBattlegroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList, HealGrid.SettingGet('battlegroupShowDebuffFlags') );

	-- ----- preview ---------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabBattlegroupPreviewGrid", HealGridGridFactory.UseDummyData('BG') );

	-- ----- skin ------------------------------
	HealGridSkin.ComboBoxSetChoices( "HGG_HealGridTabBattlegroupSkin", HealGrid.SettingGet('battlegroupSkin') );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabBattlegroupShowCareerLineIcon", HealGrid.SettingGet('battlegroupShowCareerLineIcon') );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabBattlegroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('battlegroupShowHealthPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabBattlegroupShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('battlegroupSkin'),'grid','unitFrame','healthPointsBar','isToggleable') );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabBattlegroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('battlegroupShowActionPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabBattlegroupShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('battlegroupSkin'),'grid','unitFrame','actionPointsBar','isToggleable') );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabBattlegroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('battlegroupShowMoraleLevelBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabBattlegroupShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('battlegroupSkin'),'grid','unitFrame','moraleLevelBar','isToggleable') );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabBattlegroupUnitFrameWidthSlider", 
                                       HealGrid.SettingGet('battlegroupUnitFrameWidthAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabBattlegroupUnitFrameHeightSlider", 
                                       HealGrid.SettingGet('battlegroupUnitFrameHeightAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabBattlegroupUnitFrameScaleSlider", 
                                       math.floor(WindowGetScale('HG_HealGridBattlegroup')*100+0.5), 25, 200, L"%d%%" );

	-- ----- gridOrientation -------------------
	HealGridGuiUtility.GridOrientationActivate( "HGG_HealGridTabBattlegroupGridOrientation", HealGrid.SettingGet('battlegroupGridOrientation') );

	-- ----- gridGrowth ------------------------
	HealGridGuiUtility.GridGrowthActivate( "HGG_HealGridTabBattlegroupGridGrowth", HealGrid.SettingGet('battlegroupGridGrowth') );

	-- ----- gridGrouping ----------------------
	HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabBattlegroupGridGrouping", HealGrid.SettingGet('battlegroupGridGrouping') );

	-- ----- gridGrowth ------------------------
	HealGridGuiUtility.GridGrowthActivate( "HGG_HealGridTabBattlegroupGridGrowth", HealGrid.SettingGet('battlegroupGridGrowth') );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabBattlegroupUpdateThrottleSlider", HealGrid.SettingGet('battlegroupUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

	-- ----- buffUpdateThrottle ----------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabBattlegroupBuffUpdateThrottleSlider", HealGrid.SettingGet('battlegroupBuffUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

end

-- =========================================================================================
-- stay hidden
-- =========================================================================================

function HealGridGuiTabBattlegroup.StayHiddenClicked()

    HealGrid.SettingSet( 'battlegroupStayHidden', not HealGrid.SettingGet('battlegroupStayHidden') );
    HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabBattlegroupStayHidden", not HealGrid.SettingGet('battlegroupStayHidden') );

end

-- =========================================================================================
-- hide WAR warband frames
-- =========================================================================================

function HealGridGuiTabBattlegroup.HideWARWarbandFramesClicked()

    HealGrid.SettingSet( 'battlegroupHideWARWarbandFrames', not HealGrid.SettingGet('battlegroupHideWARWarbandFrames') );
    HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabBattlegroupHideWARWarbandFrames", HealGrid.SettingGet('battlegroupHideWARWarbandFrames') );
	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabBattlegroupUpdateThrottleSlider", HealGrid.SettingGet('battlegroupUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

	-- ----- buffUpdateThrottle ----------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabBattlegroupBuffUpdateThrottleSlider", HealGrid.SettingGet('battlegroupBuffUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

end

-- =========================================================================================
-- stay hidden
-- =========================================================================================

function HealGridGuiTabBattlegroup.StayHiddenClicked()

    HealGrid.SettingSet( 'battlegroupStayHidden', not HealGrid.SettingGet('battlegroupStayHidden') );
    HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabBattlegroupStayHidden", not HealGrid.SettingGet('battlegroupStayHidden') );

end

-- =========================================================================================
-- hide WAR warband frames
-- =========================================================================================

function HealGridGuiTabBattlegroup.HideWARWarbandFramesClicked()

    HealGrid.SettingSet( 'battlegroupHideWARWarbandFrames', not HealGrid.SettingGet('battlegroupHideWARWarbandFrames') );
    HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabBattlegroupHideWARWarbandFrames", HealGrid.SettingGet('battlegroupHideWARWarbandFrames') );

	HealGridUtility.UpdateWARWarbandFramesVisibility();

end

-- =========================================================================================
-- show debuff flags
-- =========================================================================================

function HealGridGuiTabBattlegroup.ShowDebuffFlagsClicked()

    HealGrid.SettingSet( 'battlegroupShowDebuffFlags', not HealGrid.SettingGet('battlegroupShowDebuffFlags') );
    HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabBattlegroupShowDebuffFlags", HealGrid.SettingGet('battlegroupShowDebuffFlags') );

end

-- =========================================================================================
-- show HUD
-- =========================================================================================

function HealGridGuiTabBattlegroup.ShowHUDClicked()

	HealGrid.SettingSet( 'battlegroupShowHUD', not HealGrid.SettingGet('battlegroupShowHUD') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabBattlegroupShowHUD", HealGrid.SettingGet('battlegroupShowHUD') );

end

-- =========================================================================================
-- show debuff flags
-- =========================================================================================

function HealGridGuiTabBattlegroup.ChangeShowDebuffFlags()

	local showDebuffFlags = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabBattlegroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList );

	HealGrid.SettingSet( 'battlegroupShowDebuffFlags', showDebuffFlags );

end

-- =========================================================================================
-- preview grid
-- =========================================================================================

function HealGridGuiTabBattlegroup.PreviewGridClicked()

	HealGridGridFactory.ToggleUseDummyData( 'BG', false );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabBattlegroupPreviewGrid", HealGridGridFactory.UseDummyData('BG') );

end

-- =========================================================================================
-- skin
-- =========================================================================================

function HealGridGuiTabBattlegroup.ChangeSkin()

	newSkin = HealGridSkin.ComboBoxGetSelected( "HGG_HealGridTabBattlegroupSkin" );

	if ( newSkin ~= nil and newSkin ~= HealGrid.SettingGet('battlegroupSkin') ) then
		HealGrid.SettingSet( 'battlegroupShowCareerLineIcon', 'SKIN' );
		HealGrid.SettingSet( 'battlegroupShowHealthPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'battlegroupShowActionPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'battlegroupShowMoraleLevelBar', 'SKIN' );
		HealGrid.SettingSet( 'battlegroupGridOrientation', 'SKIN' );
		HealGrid.SettingSet( 'battlegroupGridGrowth', 'SKIN' );
		HealGrid.SettingSet( 'battlegroupGridGrouping', 'SKIN' );

		HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabBattlegroupShowCareerLineIcon", HealGrid.SettingGet('battlegroupShowCareerLineIcon') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabBattlegroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('battlegroupShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabBattlegroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('battlegroupShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabBattlegroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('battlegroupShowHealthPointsBar') );
		HealGridGuiUtility.GridOrientationActivate( "HGG_HealGridTabBattlegroupGridOrientation", HealGrid.SettingGet('battlegroupGridOrientation') );
		HealGridGuiUtility.GridGrowthActivate( "HGG_HealGridTabBattlegroupGridGrowth", HealGrid.SettingGet('battlegroupGridGrowth') );
		HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabBattlegroupGridGrouping", HealGrid.SettingGet('battlegroupGridGrouping') );

		HealGrid.SettingSet( 'battlegroupSkin', newSkin );
		HealGridBattlegroup.Instance():ApplySkin();

		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabBattlegroupShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('battlegroupSkin'),'grid','unitFrame','healthPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabBattlegroupShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('battlegroupSkin'),'grid','unitFrame','actionPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabBattlegroupShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('battlegroupSkin'),'grid','unitFrame','moraleLevelBar','isToggleable') );
	end

end

-- =========================================================================================
-- Show Career Line Icon
-- =========================================================================================

function HealGridGuiTabBattlegroup.ShowCareerLineIconChanged()

	local newKey = HealGridGuiUtility.ShowCareerLineIconGetSelected( "HGG_HealGridTabBattlegroupShowCareerLineIcon" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'battlegroupShowCareerLineIcon', newKey );
		HealGridBattlegroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- Show Health Points Bar
-- =========================================================================================

function HealGridGuiTabBattlegroup.ShowHealthPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabBattlegroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'battlegroupShowHealthPointsBar', newKey );

	HealGridBattlegroup.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Action Points Bar
-- =========================================================================================

function HealGridGuiTabBattlegroup.ShowActionPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabBattlegroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'battlegroupShowActionPointsBar', newKey );

	HealGridBattlegroup.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Morale Level Bar
-- =========================================================================================

function HealGridGuiTabBattlegroup.ShowMoraleLevelBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabBattlegroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'battlegroupShowMoraleLevelBar', newKey );

	HealGridBattlegroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame width
-- =========================================================================================

function HealGridGuiTabBattlegroup.UnitFrameWidthChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabBattlegroupUnitFrameWidthSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'battlegroupUnitFrameWidthAdjust', currVal );
	HealGridBattlegroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame height
-- =========================================================================================

function HealGridGuiTabBattlegroup.UnitFrameHeightChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabBattlegroupUnitFrameHeightSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'battlegroupUnitFrameHeightAdjust', currVal );
	HealGridBattlegroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame scale
-- =========================================================================================

function HealGridGuiTabBattlegroup.UnitFrameScaleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabBattlegroupUnitFrameScaleSlider", sliderPos, 25, 200, L"%d%%" );

	WindowSetScale( "HG_HealGridBattlegroup", currVal / 100 );

end

-- =========================================================================================
-- grid orientation
-- =========================================================================================

function HealGridGuiTabBattlegroup.GridOrientationChanged()

	local newKey = HealGridGuiUtility.GridOrientationGetSelected( "HGG_HealGridTabBattlegroupGridOrientation" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'battlegroupGridOrientation', newKey );
		HealGridBattlegroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- grid growth
-- =========================================================================================

function HealGridGuiTabBattlegroup.GridGrowthChanged()

	local newKey = HealGridGuiUtility.GridGrowthGetSelected( "HGG_HealGridTabBattlegroupGridGrowth" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'battlegroupGridGrowth', newKey );
		HealGridBattlegroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- grid grouping
-- =========================================================================================

function HealGridGuiTabBattlegroup.GridGroupingChanged()

	local newKey = HealGridGuiUtility.GridGroupingGetSelected( "HGG_HealGridTabBattlegroupGridGrouping" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'battlegroupGridGrouping', newKey );
		HealGridBattlegroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- update throttle
-- =========================================================================================

function HealGridGuiTabBattlegroup.UpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabBattlegroupUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'battlegroupUpdateThrottle', currVal );

end

-- =========================================================================================
-- buff update throttle
-- =========================================================================================

function HealGridGuiTabBattlegroup.BuffUpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabBattlegroupBuffUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'battlegroupBuffUpdateThrottle', currVal );

end

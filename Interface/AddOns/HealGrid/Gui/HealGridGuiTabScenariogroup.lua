HealGridGuiTabScenariogroup = {};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabScenariogroup.Initialize()

    -- ----- stayHidden ------------------------
    HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabScenariogroupStayHidden", L"Enable scenario grid" );

    -- ----- hideWARGroupFrame -----------------
    HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabScenariogroupHideWARGroupFrame", L"Hide WAR group frame" );

	-- ----- showHUD ---------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabScenariogroupShowHUD", L"Show HUD" );
	
	-- ----- forceShenario ---------------------------
	-- no more HealGridGuiUtility.CheckButtonInit( "HGG_HealGridForceScenariogroup", L"Force scenario" );

	-- ----- collapseGroups --------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabScenariogroupCollapseGroups", L"Collapse groups" );

	-- ----- showUngroupedPlayers --------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabScenariogroupShowUngroupedPlayers", L"Show ungrouped players (NOT YET IMPLEMENTED)" );

	-- ----- numGroupsDisplayed ----------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabScenariogroupNumGroupsDisplayed", L"Show Groups", L"1", L"5", L"10" );

	-- ----- showDebuffFlags -------------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabScenariogroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList, L"Show Debuff Flags" );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabScenariogroupUpdateThrottle", L"Update Throttle", L"0 sec", L"", L"1 sec" );

	-- ----- buffUpdateThrottle-----------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabScenariogroupBuffUpdateThrottle", L"Buff Throttle", L"0 sec", L"", L"1 sec" );

	-- ----- preview ---------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabScenariogroupPreviewGrid", L"Preview grid" );

	-- ----- skin ------------------------------
	LabelSetText( "HGG_HealGridTabScenariogroupSkinLabel", L"Skin" );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconInit( "HGG_HealGridTabScenariogroupShowCareerLineIcon" );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabScenariogroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Health Bar" );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabScenariogroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Action Points Bar" );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabScenariogroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Morale Level Bar" );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabScenariogroupUnitFrameWidth", L"Frame Width", L"-50", L"0", L"+50" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabScenariogroupUnitFrameHeight", L"Frame Height", L"-50", L"0", L"+50" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabScenariogroupUnitFrameScale", L"Frame Scale", L"25%", L"100%", L"200%" );

	-- ----- gridOrientation -------------------
	HealGridGuiUtility.GridOrientationInit( "HGG_HealGridTabScenariogroupGridOrientation" );

	-- ----- gridGrowth ------------------------
	HealGridGuiUtility.GridGrowthInit( "HGG_HealGridTabScenariogroupGridGrowth" );

	-- ----- gridGrouping ----------------------
	HealGridGuiUtility.GridGroupingInit( "HGG_HealGridTabScenariogroupGridGrouping" );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupUpdateThrottleSlider", HealGrid.SettingGet('scenariogroupUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

	-- ----- buffUpdateThrottle ----------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupBuffUpdateThrottleSlider", HealGrid.SettingGet('scenariogroupBuffUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabScenariogroup.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabScenariogroup.Activate()

    -- ----- stayHidden ------------------------
    HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabScenariogroupStayHidden", not HealGrid.SettingGet('scenariogroupStayHidden') );

    -- ----- hideWARGroupFrame -----------------
    HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabScenariogroupHideWARGroupFrame", HealGrid.SettingGet('scenariogroupHideWARGroupFrame') );

	-- ----- showHUD ---------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabScenariogroupShowHUD", HealGrid.SettingGet('scenariogroupShowHUD') );
	
	
	

	-- ----- collapseGroups --------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabScenariogroupCollapseGroups", HealGrid.SettingGet('scenariogroupCollapseGroups') );

	-- ----- showUngroupedPlayers --------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabScenariogroupShowUngroupedPlayers", HealGrid.SettingGet('scenariogroupShowUngroupedPlayers') );

	-- ----- showDebuffFlags -------------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabScenariogroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList, HealGrid.SettingGet('scenariogroupShowDebuffFlags') );

	-- ----- numGroupsDisplayed ----------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupNumGroupsDisplayedSlider", HealGrid.SettingGet('scenariogroupNumGroupsDisplayed'), 
										HealGridGlobals.FIRST_SCENARIOGROUP, HealGridGlobals.LAST_SCENARIOGROUP, L"%d" );

	-- ----- preview ---------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabScenariogroupPreviewGrid", HealGridGridFactory.UseDummyData('SG') );

	-- ----- skin ------------------------------
	HealGridSkin.ComboBoxSetChoices( "HGG_HealGridTabScenariogroupSkin", HealGrid.SettingGet('scenariogroupSkin') );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabScenariogroupShowCareerLineIcon", HealGrid.SettingGet('scenariogroupShowCareerLineIcon') );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabScenariogroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('scenariogroupShowHealthPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabScenariogroupShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('scenariogroupSkin'),'grid','unitFrame','healthPointsBar','isToggleable') );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabScenariogroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('scenariogroupShowActionPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabScenariogroupShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('scenariogroupSkin'),'grid','unitFrame','actionPointsBar','isToggleable') );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabScenariogroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('scenariogroupShowMoraleLevelBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabScenariogroupShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('scenariogroupSkin'),'grid','unitFrame','moraleLevelBar','isToggleable') );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupUnitFrameWidthSlider", 
                                       HealGrid.SettingGet('scenariogroupUnitFrameWidthAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupUnitFrameHeightSlider", 
                                       HealGrid.SettingGet('scenariogroupUnitFrameHeightAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupUnitFrameScaleSlider", 
                                       math.floor(WindowGetScale('HG_HealGridScenariogroup')*100+0.5), 25, 200, L"%d%%" );

	-- ----- gridOrientation -------------------
	HealGridGuiUtility.GridOrientationActivate( "HGG_HealGridTabScenariogroupGridOrientation", HealGrid.SettingGet('scenariogroupGridOrientation') );

	-- ----- gridGrowth ------------------------
	HealGridGuiUtility.GridGrowthActivate( "HGG_HealGridTabScenariogroupGridGrowth", HealGrid.SettingGet('scenariogroupGridGrowth') );

	-- ----- gridGrouping ----------------------
	HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabScenariogroupGridGrouping", HealGrid.SettingGet('scenariogroupGridGrouping') );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupUpdateThrottleSlider", HealGrid.SettingGet('scenariogroupUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

	-- ----- buffUpdateThrottle ----------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabScenariogroupBuffUpdateThrottleSlider", HealGrid.SettingGet('scenariogroupBuffUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

end

-- =========================================================================================
-- stay hidden
-- =========================================================================================

function HealGridGuiTabScenariogroup.StayHiddenClicked()

    HealGrid.SettingSet( 'scenariogroupStayHidden', not HealGrid.SettingGet('scenariogroupStayHidden') );
    HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabScenariogroupStayHidden", not HealGrid.SettingGet('scenariogroupStayHidden') );

end

-- =========================================================================================
-- hide WAR group frame
-- =========================================================================================

function HealGridGuiTabScenariogroup.HideWARGroupFrameClicked()

    HealGrid.SettingSet( 'scenariogroupHideWARGroupFrame', not HealGrid.SettingGet('scenariogroupHideWARGroupFrame') );
    HealGrid.SettingSet( 'groupHideWARGroupFrame', HealGrid.SettingGet('scenariogroupHideWARGroupFrame') );			-- sync
    HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabScenariogroupHideWARGroupFrame", HealGrid.SettingGet('scenariogroupHideWARGroupFrame') );

	HealGridUtility.UpdateWARGroupFrameVisibility();

end

-- =========================================================================================
-- show HUD
-- =========================================================================================

function HealGridGuiTabScenariogroup.ShowHUDClicked()

	HealGrid.SettingSet( 'scenariogroupShowHUD', not HealGrid.SettingGet('scenariogroupShowHUD') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabScenariogroupShowHUD", HealGrid.SettingGet('scenariogroupShowHUD') );

end


-- =========================================================================================
-- collapse Groups
-- =========================================================================================

function HealGridGuiTabScenariogroup.CollapseGroupsClicked()

	HealGrid.SettingSet( 'scenariogroupCollapseGroups', not HealGrid.SettingGet('scenariogroupCollapseGroups') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabScenariogroupCollapseGroups", HealGrid.SettingGet('scenariogroupCollapseGroups') );

end

-- =========================================================================================
-- show Ungrouped Players
-- =========================================================================================

function HealGridGuiTabScenariogroup.ShowUngroupedPlayersClicked()

	HealGrid.SettingSet( 'scenariogroupShowUngroupedPlayers', not HealGrid.SettingGet('scenariogroupShowUngroupedPlayers') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabScenariogroupShowUngroupedPlayers", HealGrid.SettingGet('scenariogroupShowUngroupedPlayers') );

end

-- =========================================================================================
-- num groups displayed
-- =========================================================================================

function HealGridGuiTabScenariogroup.NumGroupsDisplayedChanged( sliderPos )

	local ngd = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabScenariogroupNumGroupsDisplayedSlider", sliderPos, 
													HealGridGlobals.FIRST_SCENARIOGROUP, HealGridGlobals.LAST_SCENARIOGROUP, L"%d" );

	if ( ngd ~= nil ) then
		HealGrid.SettingSet( 'scenariogroupNumGroupsDisplayed', ngd );
		HealGridScenariogroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- show debuff flags
-- =========================================================================================

function HealGridGuiTabScenariogroup.ChangeShowDebuffFlags()

	local showDebuffFlags = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabScenariogroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList );

	HealGrid.SettingSet( 'scenariogroupShowDebuffFlags', showDebuffFlags );

end

-- =========================================================================================
-- preview grid
-- =========================================================================================

function HealGridGuiTabScenariogroup.PreviewGridClicked()

	HealGridGridFactory.ToggleUseDummyData( 'SG', false );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabScenariogroupPreviewGrid", HealGridGridFactory.UseDummyData('SG') );

end

-- =========================================================================================
-- skin
-- =========================================================================================

function HealGridGuiTabScenariogroup.ChangeSkin()

	local newSkin = HealGridSkin.ComboBoxGetSelected( "HGG_HealGridTabScenariogroupSkin" );

	if ( newSkin ~= nil and newSkin ~= HealGrid.SettingGet('scenariogroupSkin') ) then
		HealGrid.SettingSet( 'scenariogroupShowCareerLineIcon', 'SKIN' );
		HealGrid.SettingSet( 'scenariogroupShowHealthPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'scenariogroupShowActionPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'scenariogroupShowMoraleLevelBar', 'SKIN' );
		HealGrid.SettingSet( 'scenariogroupGridOrientation', 'SKIN' );
		HealGrid.SettingSet( 'scenariogroupGridGrowth', 'SKIN' );
		HealGrid.SettingSet( 'scenariogroupGridGrouping', 'SKIN' );

		HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabScenariogroupShowCareerLineIcon", HealGrid.SettingGet('scenariogroupShowCareerLineIcon') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabScenariogroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('scenariogroupShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabScenariogroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('scenariogroupShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabScenariogroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('scenariogroupShowHealthPointsBar') );
		HealGridGuiUtility.GridOrientationActivate( "HGG_HealGridTabScenariogroupGridOrientation", HealGrid.SettingGet('scenariogroupGridOrientation') );
		HealGridGuiUtility.GridGrowthActivate( "HGG_HealGridTabScenariogroupGridGrowth", HealGrid.SettingGet('scenariogroupGridGrowth') );
		HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabScenariogroupGridGrouping", HealGrid.SettingGet('scenariogroupGridGrouping') );

		HealGrid.SettingSet( 'scenariogroupSkin', newSkin );
		HealGridScenariogroup.Instance():ApplySkin();

		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabScenariogroupShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('scenariogroupSkin'),'grid','unitFrame','healthPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabScenariogroupShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('scenariogroupSkin'),'grid','unitFrame','actionPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabScenariogroupShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('scenariogroupSkin'),'grid','unitFrame','moraleLevelBar','isToggleable') );
	end

end

-- =========================================================================================
-- Show Career Line Icon
-- =========================================================================================

function HealGridGuiTabScenariogroup.ShowCareerLineIconChanged()

	local newKey = HealGridGuiUtility.ShowCareerLineIconGetSelected( "HGG_HealGridTabScenariogroupShowCareerLineIcon" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'scenariogroupShowCareerLineIcon', newKey );
		HealGridScenariogroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- Show Health Points Bar
-- =========================================================================================

function HealGridGuiTabScenariogroup.ShowHealthPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabScenariogroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'scenariogroupShowHealthPointsBar', newKey );

	HealGridScenariogroup.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Action Points Bar
-- =========================================================================================

function HealGridGuiTabScenariogroup.ShowActionPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabScenariogroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'scenariogroupShowActionPointsBar', newKey );

	HealGridScenariogroup.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Morale Level Bar
-- =========================================================================================

function HealGridGuiTabScenariogroup.ShowMoraleLevelBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabScenariogroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'scenariogroupShowMoraleLevelBar', newKey );

	HealGridScenariogroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame width
-- =========================================================================================

function HealGridGuiTabScenariogroup.UnitFrameWidthChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabScenariogroupUnitFrameWidthSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'scenariogroupUnitFrameWidthAdjust', currVal );
	HealGridScenariogroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame height
-- =========================================================================================

function HealGridGuiTabScenariogroup.UnitFrameHeightChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabScenariogroupUnitFrameHeightSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'scenariogroupUnitFrameHeightAdjust', currVal );
	HealGridScenariogroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame scale
-- =========================================================================================

function HealGridGuiTabScenariogroup.UnitFrameScaleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabScenariogroupUnitFrameScaleSlider", sliderPos, 25, 200, L"%d%%" );

	WindowSetScale( "HG_HealGridScenariogroup", currVal / 100 );

end

-- =========================================================================================
-- grid orientation
-- =========================================================================================

function HealGridGuiTabScenariogroup.GridOrientationChanged()

	local newKey = HealGridGuiUtility.GridOrientationGetSelected( "HGG_HealGridTabScenariogroupGridOrientation" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'scenariogroupGridOrientation', newKey );
		HealGridScenariogroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- grid growth
-- =========================================================================================

function HealGridGuiTabScenariogroup.GridGrowthChanged()

	local newKey = HealGridGuiUtility.GridGrowthGetSelected( "HGG_HealGridTabScenariogroupGridGrowth" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'scenariogroupGridGrowth', newKey );
		HealGridScenariogroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- grid grouping
-- =========================================================================================

function HealGridGuiTabScenariogroup.GridGroupingChanged()

	local newKey = HealGridGuiUtility.GridGroupingGetSelected( "HGG_HealGridTabScenariogroupGridGrouping" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'scenariogroupGridGrouping', newKey );
		HealGridScenariogroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- update throttle
-- =========================================================================================

function HealGridGuiTabScenariogroup.UpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabScenariogroupUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'scenariogroupUpdateThrottle', currVal );

end

-- =========================================================================================
-- buff update throttle
-- =========================================================================================

function HealGridGuiTabScenariogroup.BuffUpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabScenariogroupBuffUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'scenariogroupBuffUpdateThrottle', currVal );

end

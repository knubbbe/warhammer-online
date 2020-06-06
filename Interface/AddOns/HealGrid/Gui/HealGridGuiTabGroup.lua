HealGridGuiTabGroup = {};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabGroup.Initialize()

	-- ----- stayHidden ------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupStayHidden", L"Enable group grid" );

	-- ----- hideWARGroupFrame -----------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupHideWARGroupFrame", L"Hide WAR group frame" );

	-- ----- hideInBattlegroup -----------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupHideInBattlegroup", L"Hide group in warband" );

	-- ----- hideInScenariogroup ---------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupHideInScenariogroup", L"Hide group in scenario" );

	-- ----- showAvatar ------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupShowAvatar", L"Show Avatar" );

	-- ----- showPets --------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupShowPets", L"Show pets of group members" );

	-- ----- showHUD ---------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupShowHUD", L"Show HUD" );

	-- ----- showDebuffFlags -------------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabGroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList, L"Show Debuff Flags" );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabGroupUpdateThrottle", L"Update Throttle", L"0 sec", L"", L"1 sec" );

	-- ----- buffUpdateThrottle-----------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabGroupBuffUpdateThrottle", L"Buff Throttle", L"0 sec", L"", L"1 sec" );

	-- ----- preview ---------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabGroupPreviewGrid", L"Preview grid" );

	-- ----- skin ------------------------------
	LabelSetText( "HGG_HealGridTabGroupSkinLabel", L"Skin" );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconInit( "HGG_HealGridTabGroupShowCareerLineIcon" );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabGroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Health Bar" );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabGroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Action Points Bar" );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabGroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Morale Level Bar" );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabGroupUnitFrameWidth", L"Frame Width", L"-50", L"0", L"+50" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabGroupUnitFrameHeight", L"Frame Height", L"-50", L"0", L"+50" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabGroupUnitFrameScale", L"Frame Scale", L"25%", L"100%", L"200%" );

	-- ----- gridOrientation -------------------
	HealGridGuiUtility.GridOrientationInit( "HGG_HealGridTabGroupGridOrientation" );

	-- ----- gridGrowth ------------------------
	HealGridGuiUtility.GridGrowthInit( "HGG_HealGridTabGroupGridGrowth" );

	-- ----- gridGrouping ----------------------
	HealGridGuiUtility.GridGroupingInit( "HGG_HealGridTabGroupGridGrouping" );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabGroupGridGrouping", true );				-- GridGrouping: QUICKFIX

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabGroup.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabGroup.Activate()

	-- ----- stayHidde -------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupStayHidden", not HealGrid.SettingGet('groupStayHidden') );

	-- ----- hideWARGroupFrame -----------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupHideWARGroupFrame", HealGrid.SettingGet('groupHideWARGroupFrame') );

	-- ----- hideInBattlegroup -----------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupHideInBattlegroup", HealGrid.SettingGet('hideGroupInBattlegroup') );

	-- ----- hideInScenariogroup ---------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupHideInScenariogroup", HealGrid.SettingGet('hideGroupInScenariogroup') );

	-- ----- showAvatar ------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupShowAvatar", HealGrid.SettingGet('groupShowAvatar') );

	-- ----- showPets --------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupShowPets", HealGrid.SettingGet('groupShowPets') );

	-- ----- showHUD ---------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupShowHUD", HealGrid.SettingGet('groupShowHUD') );

	-- ----- showDebuffFlags -------------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabGroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList, HealGrid.SettingGet('groupShowDebuffFlags') );

	-- ----- preview ---------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabGroupPreviewGrid", HealGridGridFactory.UseDummyData('G') );

	-- ----- skin ------------------------------
	HealGridSkin.ComboBoxSetChoices( "HGG_HealGridTabGroupSkin", HealGrid.SettingGet('groupSkin') );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabGroupShowCareerLineIcon", HealGrid.SettingGet('groupShowCareerLineIcon') );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabGroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('groupShowHealthPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabGroupShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('groupSkin'),'grid','unitFrame','healthPointsBar','isToggleable') );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabGroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('groupShowActionPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabGroupShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('groupSkin'),'grid','unitFrame','actionPointsBar','isToggleable') );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabGroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('groupShowMoraleLevelBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabGroupShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('groupSkin'),'grid','unitFrame','moraleLevelBar','isToggleable') );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabGroupUnitFrameWidthSlider", HealGrid.SettingGet('groupUnitFrameWidthAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabGroupUnitFrameHeightSlider", HealGrid.SettingGet('groupUnitFrameHeightAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabGroupUnitFrameScaleSlider", math.floor(WindowGetScale('HG_HealGridGroup')*100+0.5), 25, 200, L"%d%%" );

	-- ----- gridOrientation -------------------
	HealGridGuiUtility.GridOrientationActivate( "HGG_HealGridTabGroupGridOrientation", HealGrid.SettingGet('groupGridOrientation') );

	-- ----- gridGrowth ------------------------
	HealGridGuiUtility.GridGrowthActivate( "HGG_HealGridTabGroupGridGrowth", HealGrid.SettingGet('groupGridGrowth') );

	-- ----- gridGrouping ----------------------
	--HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabGroupGridGrouping", HealGrid.SettingGet('groupGridGrouping') );
	HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabGroupGridGrouping", 'GROUP' ); 									-- GridGrouping: QUICKFIX

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabGroupUpdateThrottleSlider", HealGrid.SettingGet('groupUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

	-- ----- buffUpdateThrottle ----------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabGroupBuffUpdateThrottleSlider", HealGrid.SettingGet('groupBuffUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

end

-- =========================================================================================
-- stay Hidden
-- =========================================================================================

function HealGridGuiTabGroup.StayHiddenClicked()

	HealGrid.SettingSet( 'groupStayHidden', not HealGrid.SettingGet('groupStayHidden') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupStayHidden", not HealGrid.SettingGet('groupStayHidden') );

end

-- =========================================================================================
-- hide WAR group frame
-- =========================================================================================

function HealGridGuiTabGroup.HideWARGroupFrameClicked()

	HealGrid.SettingSet( 'groupHideWARGroupFrame', not HealGrid.SettingGet('groupHideWARGroupFrame') );
	HealGrid.SettingSet( 'scenariogroupHideWARGroupFrame', HealGrid.SettingGet('groupHideWARGroupFrame') );					-- sync
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupHideWARGroupFrame", HealGrid.SettingGet('groupHideWARGroupFrame') );

	HealGridUtility.UpdateWARGroupFrameVisibility();

end

-- =========================================================================================
-- hide in battlegroup
-- =========================================================================================

function HealGridGuiTabGroup.HideInBattlegroupClicked()

	HealGrid.SettingSet( 'hideGroupInBattlegroup', not HealGrid.SettingGet('hideGroupInBattlegroup') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupHideInBattlegroup", HealGrid.SettingGet('hideGroupInBattlegroup') );

end

-- =========================================================================================
-- hide in scenariogroup
-- =========================================================================================

function HealGridGuiTabGroup.HideInScenariogroupClicked()

	HealGrid.SettingSet( 'hideGroupInScenariogroup', not HealGrid.SettingGet('hideGroupInScenariogroup') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupHideInScenariogroup", HealGrid.SettingGet('hideGroupInScenariogroup') );

end

-- =========================================================================================
-- show Avatar
-- =========================================================================================

function HealGridGuiTabGroup.ShowAvatarClicked()

	HealGrid.SettingSet( 'groupShowAvatar', not HealGrid.SettingGet('groupShowAvatar') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupShowAvatar", HealGrid.SettingGet('groupShowAvatar') );

	HealGridGroup.Instance():ApplySkin();

end

-- =========================================================================================
-- show Pets
-- =========================================================================================

function HealGridGuiTabGroup.ShowPetsClicked()

	HealGrid.SettingSet( 'groupShowPets', not HealGrid.SettingGet('groupShowPets') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupShowPets", HealGrid.SettingGet('groupShowPets') );

	HealGridGroup.Instance():ApplySkin();

end

-- =========================================================================================
-- show HUD
-- =========================================================================================

function HealGridGuiTabGroup.ShowHUDClicked()

	HealGrid.SettingSet( 'groupShowHUD', not HealGrid.SettingGet('groupShowHUD') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupShowHUD", HealGrid.SettingGet('groupShowHUD') );

end

-- =========================================================================================
-- show debuff flags
-- =========================================================================================

function HealGridGuiTabGroup.ChangeShowDebuffFlags()

	local showDebuffFlags = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabGroupShowDebuffFlags", HealGridGuiUtility.debuffFlagsList );

	HealGrid.SettingSet( 'groupShowDebuffFlags', showDebuffFlags );

end

-- =========================================================================================
-- preview grid
-- =========================================================================================

function HealGridGuiTabGroup.PreviewGridClicked()

	HealGridGridFactory.ToggleUseDummyData( 'G', false );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabGroupPreviewGrid", HealGridGridFactory.UseDummyData('G') );

end

-- =========================================================================================
-- skin
-- =========================================================================================

function HealGridGuiTabGroup.ChangeSkin()

	local newSkin = HealGridSkin.ComboBoxGetSelected( "HGG_HealGridTabGroupSkin" );

	if ( newSkin ~= nil and newSkin ~= HealGrid.SettingGet('groupSkin') ) then
		HealGrid.SettingSet( 'groupShowCareerLineIcon', 'SKIN' );
		HealGrid.SettingSet( 'groupShowHealthPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'groupShowActionPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'groupShowMoraleLevelBar', 'SKIN' );
		HealGrid.SettingSet( 'groupGridOrientation', 'SKIN' );
		HealGrid.SettingSet( 'groupGridGrowth', 'SKIN' );
		HealGrid.SettingSet( 'groupGridGrouping', 'SKIN' );

		HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabGroupShowCareerLineIcon", HealGrid.SettingGet('groupShowCareerLineIcon') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabGroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('groupShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabGroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('groupShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabGroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('groupShowHealthPointsBar') );
		HealGridGuiUtility.GridOrientationActivate( "HGG_HealGridTabGroupGridOrientation", HealGrid.SettingGet('groupGridOrientation') );
		HealGridGuiUtility.GridGrowthActivate( "HGG_HealGridTabGroupGridGrowth", HealGrid.SettingGet('groupGridGrowth') );
		--HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabGroupGridGrouping", HealGrid.SettingGet('groupGridGrouping') );
		HealGridGuiUtility.GridGroupingActivate( "HGG_HealGridTabGroupGridGrouping", 'GROUP' ); 									-- GridGrouping: QUICKFIX

		HealGrid.SettingSet( 'groupSkin', newSkin );
		HealGridGroup.Instance():ApplySkin();

		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabGroupShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('groupSkin'),'grid','unitFrame','healthPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabGroupShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('groupSkin'),'grid','unitFrame','actionPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabGroupShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('groupSkin'),'grid','unitFrame','moraleLevelBar','isToggleable') );
	end

end

-- =========================================================================================
-- Show Career Line Icon
-- =========================================================================================

function HealGridGuiTabGroup.ShowCareerLineIconChanged()

	local newKey = HealGridGuiUtility.ShowCareerLineIconGetSelected( "HGG_HealGridTabGroupShowCareerLineIcon" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'groupShowCareerLineIcon', newKey );
		HealGridGroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- Show Health Points Bar
-- =========================================================================================

function HealGridGuiTabGroup.ShowHealthPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabGroupShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'groupShowHealthPointsBar', newKey );

	HealGridGroup.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Action Points Bar
-- =========================================================================================

function HealGridGuiTabGroup.ShowActionPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabGroupShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'groupShowActionPointsBar', newKey );

	HealGridGroup.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Morale Level Bar
-- =========================================================================================

function HealGridGuiTabGroup.ShowMoraleLevelBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabGroupShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'groupShowMoraleLevelBar', newKey );

	HealGridGroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame width
-- =========================================================================================

function HealGridGuiTabGroup.UnitFrameWidthChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabGroupUnitFrameWidthSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'groupUnitFrameWidthAdjust', currVal );
	HealGridGroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame height
-- =========================================================================================

function HealGridGuiTabGroup.UnitFrameHeightChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabGroupUnitFrameHeightSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'groupUnitFrameHeightAdjust', currVal );
	HealGridGroup.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame scale
-- =========================================================================================

function HealGridGuiTabGroup.UnitFrameScaleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabGroupUnitFrameScaleSlider", sliderPos, 25, 200, L"%d%%" );

	WindowSetScale( "HG_HealGridGroup", currVal / 100 );

end

-- =========================================================================================
-- grid orientation
-- =========================================================================================

function HealGridGuiTabGroup.GridOrientationChanged()

	local newKey = HealGridGuiUtility.GridOrientationGetSelected( "HGG_HealGridTabGroupGridOrientation" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'groupGridOrientation', newKey );
		HealGridGroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- grid growth
-- =========================================================================================

function HealGridGuiTabGroup.GridGrowthChanged()

	local newKey = HealGridGuiUtility.GridGrowthGetSelected( "HGG_HealGridTabGroupGridGrowth" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'groupGridGrowth', newKey );
		HealGridGroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- grid grouping
-- =========================================================================================

function HealGridGuiTabGroup.GridGroupingChanged()

	local newKey = HealGridGuiUtility.GridGroupingGetSelected( "HGG_HealGridTabGroupGridGrouping" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'groupGridGrouping', newKey );
		HealGridGroup.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- update throttle
-- =========================================================================================

function HealGridGuiTabGroup.UpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabGroupUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'groupUpdateThrottle', currVal );

end

-- =========================================================================================
-- buff update throttle
-- =========================================================================================

function HealGridGuiTabGroup.BuffUpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabGroupBuffUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'groupBuffUpdateThrottle', currVal );

end

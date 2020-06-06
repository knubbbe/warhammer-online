HealGridGuiTabHUD = {};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabHUD.Initialize()

	-- ----- stayHidden ------------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDStayHidden", L"Enable HUD" )

	-- ----- showHostileTargetName -------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDShowHostileTargetName", L"Show hostile target name" )

	-- ----- showPetFrames ---------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDShowPetFrames", L"Show pet frames" )

	-- ----- twoLineBars -----------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDTwoLineBars", L"Distribute bars over two lines" )

	-- ----- hideWARPlayerFrame ----------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDHideWARPlayerFrame", L"Hide WAR Player Frame" )

	-- ----- hideWARTargetFrame ----------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDHideWARTargetFrame", L"Hide WAR Target Frames" )

	-- ----- hideWARCastBar --------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDHideWARCastBar", L"Hide WAR CastBar" )

	-- ----- hideWARCareerPointsFrame ----------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabHUDHideWARCareerPointsFrame", L"Hide WAR CP Frame" )

	-- ----- DebuffFlags -----------------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDShowPlayerDebuffFlags", HealGridGuiUtility.debuffFlagsList, L"Player Dbf Flags" );
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDShowFriendlyTargetDebuffFlags", HealGridGuiUtility.debuffFlagsList, L"Fr. Tgt Dbf Flags" );
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDShowHostileTargetDebuffFlags", HealGridGuiUtility.debuffFlagsList, L"Hst. Tgt Dbf Flags" );

	-- ----- skin ------------------------------
	LabelSetText( "HGG_HealGridTabHUDSkinLabel", L"Skin" );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconInit( "HGG_HealGridTabHUDShowCareerLineIcon" );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Health Bar" );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Action Points Bar" );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, L"Morale Level Bar" );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabHUDUnitFrameWidth", L"Frame Width", L"-50", L"0", L"+50" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabHUDUnitFrameHeight", L"Frame Width", L"-50", L"0", L"+50" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabHUDUnitFrameScale", L"Frame Scale", L"25%", L"100%", L"200%" );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabHUDUpdateThrottle", L"Update Throttle", L"0 sec", L"", L"1 sec" );

	-- ----- buffUpdateThrottle-----------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabHUDBuffUpdateThrottle", L"Buff Throttle", L"0 sec", L"", L"1 sec" );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabHUD.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabHUD.Activate()

	-- ----- stayHidden ------------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDStayHidden", not HealGrid.SettingGet('hudStayHidden') );

	-- ----- showHostileTargetName -------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDShowHostileTargetName", HealGrid.SettingGet('hudShowHostileTargetName') );

	-- ----- showPetFrames ---------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDShowPetFrames", HealGrid.SettingGet('hudShowPetFrames') );

	-- ----- twoLineBars -----------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDTwoLineBars", HealGrid.SettingGet('hudTwoLineBars') );

	-- ----- hideWARPlayerFrame ----------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDHideWARPlayerFrame", HealGrid.SettingGet('hudHideWARPlayerFrame') );

	-- ----- hideWARTargetFrame-----------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDHideWARTargetFrame", HealGrid.SettingGet('hudHideWARTargetFrame') );

	-- ----- hideWARCastBar --------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDHideWARCastBar", HealGrid.SettingGet('hudHideWARCastBar') );

	-- ----- hideWARCareerPointsFrame ----------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabHUDHideWARCareerPointsFrame", HealGrid.SettingGet('hudHideWARCareerPointsFrame') );

	-- ----- debuffFlags -----------------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowPlayerDebuffFlags", HealGridGuiUtility.debuffFlagsList, HealGrid.SettingGet('hudShowPlayerDebuffFlags') );
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowFriendlyTargetDebuffFlags", HealGridGuiUtility.debuffFlagsList, HealGrid.SettingGet('hudShowFriendlyTargetDebuffFlags') );
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowHostileTargetDebuffFlags", HealGridGuiUtility.debuffFlagsList, HealGrid.SettingGet('hudShowHostileTargetDebuffFlags') );

	-- ----- skin ------------------------------
	HealGridSkin.ComboBoxSetChoices( "HGG_HealGridTabHUDSkin", HealGrid.SettingGet('hudSkin') );

	-- ----- careerLineIcon --------------------
	HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabHUDShowCareerLineIcon", HealGrid.SettingGet('hudShowCareerLineIcon') );

	-- ----- showHealthPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('hudShowHealthPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabHUDShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('hudSkin'),'hud','unitFrame','healthPointsBar','isToggleable') );

	-- ----- showActionPointsBar ---------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('hudShowActionPointsBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabHUDShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('hudSkin'),'hud','unitFrame','actionPointsBar','isToggleable') );

	-- ----- showMoraleLevelBar ----------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('hudShowMoraleLevelBar') );
	HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabHUDShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('hudSkin'),'hud','unitFrame','moraleLevelBar','isToggleable') );

	-- ----- unitFrameWidth --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabHUDUnitFrameWidthSlider", HealGrid.SettingGet('hudUnitFrameWidthAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameHeight -------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabHUDUnitFrameHeightSlider", HealGrid.SettingGet('hudUnitFrameHeightAdjust'), -50, 50, L"%d" );

	-- ----- unitFrameScale --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabHUDUnitFrameScaleSlider", math.floor(WindowGetScale('HG_HealGridHUDMain')*100+0.5), 25, 200, L"%d%%" );

	-- ----- updateThrottle --------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabHUDUpdateThrottleSlider", HealGrid.SettingGet('hudUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

	-- ----- buffUpdateThrottle ----------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabHUDBuffUpdateThrottleSlider", HealGrid.SettingGet('hudBuffUpdateThrottle'), 0, 1, L"%3.1f sec", 10 );

end

-- =========================================================================================
-- stay hidden
-- =========================================================================================

function HealGridGuiTabHUD.StayHiddenClicked()

	HealGrid.SettingSet( 'hudStayHidden', not HealGrid.SettingGet('hudStayHidden') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDStayHidden", not HealGrid.SettingGet('hudStayHidden') );

	HealGridHUDMain.Instance():ApplySkin();

end

-- =========================================================================================
-- show hostile target name
-- =========================================================================================

function HealGridGuiTabHUD.ShowHostileTargetNameClicked()

	HealGrid.SettingSet( 'hudShowHostileTargetName', not HealGrid.SettingGet('hudShowHostileTargetName') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDShowHostileTargetName", HealGrid.SettingGet('hudShowHostileTargetName') );

end

-- =========================================================================================
-- hide pet frames
-- =========================================================================================

function HealGridGuiTabHUD.ShowPetFramesClicked()

	HealGrid.SettingSet( 'hudShowPetFrames', not HealGrid.SettingGet('hudShowPetFrames') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDShowPetFrames", HealGrid.SettingGet('hudShowPetFrames') );

	HealGridHUDMain.Instance():ApplySkin();
	HealGridGroup.Instance():ApplySkin();
	HealGridBattlegroup.Instance():ApplySkin();
	HealGridScenariogroup.Instance():ApplySkin();

end

-- =========================================================================================
-- two line bars
-- =========================================================================================

function HealGridGuiTabHUD.TwoLineBarsClicked()

	HealGrid.SettingSet( 'hudTwoLineBars', not HealGrid.SettingGet('hudTwoLineBars') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDTwoLineBars", HealGrid.SettingGet('hudTwoLineBars') );

	HealGridHUDMain.Instance():ApplySkin();
	HealGridGroup.Instance():ApplySkin();
	HealGridBattlegroup.Instance():ApplySkin();
	HealGridScenariogroup.Instance():ApplySkin();

end

-- =========================================================================================
-- hide WAR player frame
-- =========================================================================================

function HealGridGuiTabHUD.HideWARPlayerFrameClicked()

	HealGrid.SettingSet( 'hudHideWARPlayerFrame', not HealGrid.SettingGet('hudHideWARPlayerFrame') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDHideWARPlayerFrame", HealGrid.SettingGet('hudHideWARPlayerFrame') );

	HealGridUtility.UpdateWARPlayerFrameVisibility();

end

-- =========================================================================================
-- hide WAR target frame
-- =========================================================================================

function HealGridGuiTabHUD.HideWARTargetFrameClicked()

	HealGrid.SettingSet( 'hudHideWARTargetFrame', not HealGrid.SettingGet('hudHideWARTargetFrame') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDHideWARTargetFrame", HealGrid.SettingGet('hudHideWARTargetFrame') );

	HealGridUtility.UpdateWARTargetFrameVisibility();

end

-- =========================================================================================
-- hide WAR cast bar
-- =========================================================================================

function HealGridGuiTabHUD.HideWARCastBarClicked()

	HealGrid.SettingSet( 'hudHideWARCastBar', not HealGrid.SettingGet('hudHideWARCastBar') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDHideWARCastBar", HealGrid.SettingGet('hudHideWARCastBar') );

	HealGridUtility.UpdateWARCastBarVisibility();

end

-- =========================================================================================
-- hide WAR career points frame
-- =========================================================================================

function HealGridGuiTabHUD.HideWARCareerPointsFrameClicked()

	HealGrid.SettingSet( 'hudHideWARCareerPointsFrame', not HealGrid.SettingGet('hudHideWARCareerPointsFrame') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabHUDHideWARCareerPointsFrame", HealGrid.SettingGet('hudHideWARCareerPointsFrame') );

	HealGridUtility.UpdateWARCareerPointsFrameVisibility();

end

-- =========================================================================================
-- show debuff flags
-- =========================================================================================

function HealGridGuiTabHUD.ChangeShowPlayerDebuffFlags()

	local showDebuffFlags = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabHUDShowPlayerDebuffFlags", HealGridGuiUtility.debuffFlagsList );

	HealGrid.SettingSet( 'hudShowPlayerDebuffFlags', showDebuffFlags );

end

function HealGridGuiTabHUD.ChangeShowFriendlyTargetDebuffFlags()

	local showDebuffFlags = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabHUDShowFriendlyTargetDebuffFlags", HealGridGuiUtility.debuffFlagsList );

	HealGrid.SettingSet( 'hudShowFriendlyTargetDebuffFlags', showDebuffFlags );

end

function HealGridGuiTabHUD.ChangeShowHostileTargetDebuffFlags()

	local showDebuffFlags = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabHUDShowHostileTargetDebuffFlags", HealGridGuiUtility.debuffFlagsList );

	HealGrid.SettingSet( 'hudShowHostileTargetDebuffFlags', showDebuffFlags );

end

-- =========================================================================================
-- skin
-- =========================================================================================

function HealGridGuiTabHUD.ChangeSkin()

	local newSkin = HealGridSkin.ComboBoxGetSelected( "HGG_HealGridTabHUDSkin" );

	if ( newSkin ~= nil and newSkin ~= HealGrid.SettingGet('hudSkin') ) then
		HealGrid.SettingSet( 'hudShowHealthPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'hudShowActionPointsBar', 'SKIN' );
		HealGrid.SettingSet( 'hudShowMoraleLevelBar', 'SKIN' );
		HealGrid.SettingSet( 'hudShowCareerLineIcon', 'SKIN' );

		HealGridGuiUtility.ShowCareerLineIconActivate( "HGG_HealGridTabHUDShowCareerLineIcon", HealGrid.SettingGet('hudShowCareerLineIcon') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('hudShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('hudShowHealthPointsBar') );
		HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList, HealGrid.SettingGet('hudShowHealthPointsBar') );

		HealGrid.SettingSet( 'hudSkin', newSkin );
		HealGridHUDMain.Instance():ApplySkin();

		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabHUDShowHealthPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('hudSkin'),'hud','unitFrame','healthPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabHUDShowActionPointsBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('hudSkin'),'hud','unitFrame','actionPointsBar','isToggleable') );
		HealGridGuiUtility.ComboBoxDisable( "HGG_HealGridTabHUDShowMoraleLevelBar", not HealGridSkin.GetSkinValue(HealGrid.SettingGet('hudSkin'),'hud','unitFrame','moraleLevelBar','isToggleable') );
	end

end

-- =========================================================================================
-- Show Career Line Icon
-- =========================================================================================

function HealGridGuiTabHUD.ShowCareerLineIconChanged()

	local newKey = HealGridGuiUtility.ShowCareerLineIconGetSelected( "HGG_HealGridTabHUDShowCareerLineIcon" );

	if ( newKey ~= nil ) then
		HealGrid.SettingSet( 'hudShowCareerLineIcon', newKey );
		HealGridHUDMain.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- Show Health Points Bar
-- =========================================================================================

function HealGridGuiTabHUD.ShowHealthPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabHUDShowHealthPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'hudShowHealthPointsBar', newKey );

	HealGridHUDMain.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Action Points Bar
-- =========================================================================================

function HealGridGuiTabHUD.ShowActionPointsBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabHUDShowActionPointsBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'hudShowActionPointsBar', newKey );

	HealGridHUDMain.Instance():ApplySkin();

end

-- =========================================================================================
-- Show Morale Level Bar
-- =========================================================================================

function HealGridGuiTabHUD.ShowMoraleLevelBarChanged()

	local newKey = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabHUDShowMoraleLevelBar", HealGridGuiUtility.unitFrameBarDisplayList );

	HealGrid.SettingSet( 'hudShowMoraleLevelBar', newKey );

	HealGridHUDMain.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame width
-- =========================================================================================

function HealGridGuiTabHUD.UnitFrameWidthChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabHUDUnitFrameWidthSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'hudUnitFrameWidthAdjust', currVal );
	HealGridHUDMain.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame height
-- =========================================================================================

function HealGridGuiTabHUD.UnitFrameHeightChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabHUDUnitFrameHeightSlider", sliderPos, -50, 50, L"%d" );

	HealGrid.SettingSet( 'hudUnitFrameHeightAdjust', currVal );
	HealGridHUDMain.Instance():ApplySkin();

end

-- =========================================================================================
-- unit frame scale
-- =========================================================================================

function HealGridGuiTabHUD.UnitFrameScaleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabHUDUnitFrameScaleSlider", sliderPos, 25, 200, L"%d%%" );

	WindowSetScale( "HG_HealGridHUDMain", currVal / 100 );

end

-- =========================================================================================
-- update throttle
-- =========================================================================================

function HealGridGuiTabHUD.UpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabHUDUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'hudUpdateThrottle', currVal );

end

-- =========================================================================================
-- buff update throttle
-- =========================================================================================

function HealGridGuiTabHUD.BuffUpdateThrottleChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabHUDBuffUpdateThrottleSlider", sliderPos, 0, 1, L"%3.1f sec", 10 );

	HealGrid.SettingSet( 'hudBuffUpdateThrottle', currVal );

end

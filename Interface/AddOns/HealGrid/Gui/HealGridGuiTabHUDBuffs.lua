HealGridGuiTabHUDBuffs = {};

HealGridGuiTabHUDBuffs.buffComboBoxList = {
	BUFF = {
		[1] = { key="ALL",			label=L"All" },
		[2] = { key="SELFCAST",		label=L"Cast by myself" },
		[3] = { key="NONE",			label=L"None" },
	},
	DEBUFF = {
		[1] = { key="ALL",			label=L"All" },
		[2] = { key="DISPELLABLE",	label=L"Dispellable" },
		[3] = { key="SELFCAST",		label=L"Cast by myself" },
		[4] = { key="NONE",			label=L"None" },
	},
};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabHUDBuffs.Initialize()

	-- ----- Player ----------------------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDBuffsPlayerBuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.BUFF, L"Player Buffs" );
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDBuffsPlayerDebuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.DEBUFF, L"Player Debuffs" );

	-- ----- Friendly Target -------------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDBuffsFriendlyTargetBuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.BUFF, L"Friendly Tgt Buffs" );
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDBuffsFriendlyTargetDebuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.DEBUFF, L"Fr. Tgt Debuffs" );

	-- ----- Hostile Target --------------------
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDBuffsHostileTargetBuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.BUFF, L"Hostile Tgt Buffs" );
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabHUDBuffsHostileTargetDebuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.DEBUFF, L"Hos. Tgt Debuffs" );

	-- ----- Max and Size ----------------------
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabHUDBuffsShowBuffsMax", L"Max (De)Buffs", L"1", L"5", L""..HealGridBuffTracker.MAX_BUFFS );
	HealGridGuiUtility.SliderInit( "HGG_HealGridTabHUDBuffsBuffFrameSizeAdjust", L"Buff Frame Size", L"-20", L"0", L"+20" );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabHUDBuffs.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabHUDBuffs.Activate()

	-- ----- Player ----------------------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDBuffsPlayerBuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.BUFF, HealGrid.SettingGet('hudPlayerBuffsFilter') );
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDBuffsPlayerDebuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.DEBUFF, HealGrid.SettingGet('hudPlayerDebuffsFilter') );

	-- ----- Friendly Target -------------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDBuffsFriendlyTargetBuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.BUFF, HealGrid.SettingGet('hudFriendlyTargetBuffsFilter') );
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDBuffsFriendlyTargetDebuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.DEBUFF, HealGrid.SettingGet('hudFriendlyTargetDebuffsFilter') );

	-- ----- Hostile Target --------------------
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDBuffsHostileTargetBuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.BUFF, HealGrid.SettingGet('hudHostileTargetBuffsFilter') );
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabHUDBuffsHostileTargetDebuffsFilter", HealGridGuiTabHUDBuffs.buffComboBoxList.DEBUFF, HealGrid.SettingGet('hudHostileTargetDebuffsFilter') );

	-- ----- Max and Size ----------------------
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabHUDBuffsShowBuffsMax", HealGrid.SettingGet('hudShowBuffsMax'), 1, HealGridBuffTracker.MAX_BUFFS, L"%d" );
	HealGridGuiUtility.SetSliderValue( "HGG_HealGridTabHUDBuffsBuffFrameSizeAdjust", HealGrid.SettingGet('hudBuffFrameSizeAdjust'), -20, 20, L"%d" );

end

-- =========================================================================================
-- (De)Buffs Helper
-- =========================================================================================

function HealGridGuiTabHUDBuffs.ChangeFilter( frameName, setting, buffType )

	local filter = HealGridGuiUtility.ComboBoxGetSelected( frameName, HealGridGuiTabHUDBuffs.buffComboBoxList[buffType] );

	if ( filter ~= nil and filter ~= HealGrid.SettingGet(setting) ) then
		HealGrid.SettingSet( setting, filter );
		HealGridHUDMain.Instance():ApplySkin();
	end

end

-- =========================================================================================
-- Player
-- =========================================================================================

function HealGridGuiTabHUDBuffs.ChangePlayerBuffsFilter()

	HealGridGuiTabHUDBuffs.ChangeFilter( "HGG_HealGridTabHUDBuffsPlayerBuffsFilter", 'hudPlayerBuffsFilter', 'BUFF' );

end

function HealGridGuiTabHUDBuffs.ChangePlayerDebuffsFilter()

	HealGridGuiTabHUDBuffs.ChangeFilter( "HGG_HealGridTabHUDBuffsPlayerDebuffsFilter", 'hudPlayerDebuffsFilter', 'DEBUFF' );

end

-- =========================================================================================
-- Friendly Target
-- =========================================================================================

function HealGridGuiTabHUDBuffs.ChangeFriendlyTargetBuffsFilter()

	HealGridGuiTabHUDBuffs.ChangeFilter( "HGG_HealGridTabHUDBuffsFriendlyTargetBuffsFilter", 'hudFriendlyTargetBuffsFilter', 'BUFF' );

end

function HealGridGuiTabHUDBuffs.ChangeFriendlyTargetDebuffsFilter()

	HealGridGuiTabHUDBuffs.ChangeFilter( "HGG_HealGridTabHUDBuffsFriendlyTargetDebuffsFilter", 'hudFriendlyTargetDebuffsFilter', 'DEBUFF' );

end

-- =========================================================================================
-- Hostile Target
-- =========================================================================================

function HealGridGuiTabHUDBuffs.ChangeHostileTargetBuffsFilter()

	HealGridGuiTabHUDBuffs.ChangeFilter( "HGG_HealGridTabHUDBuffsHostileTargetBuffsFilter", 'hudHostileTargetBuffsFilter', 'BUFF' );

end

function HealGridGuiTabHUDBuffs.ChangeHostileTargetDebuffsFilter()

	HealGridGuiTabHUDBuffs.ChangeFilter( "HGG_HealGridTabHUDBuffsHostileTargetDebuffsFilter", 'hudHostileTargetDebuffsFilter', 'DEBUFF' );

end

-- =========================================================================================
-- show buffs max
-- =========================================================================================

function HealGridGuiTabHUDBuffs.ShowBuffsMaxChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabHUDBuffsShowBuffsMax", sliderPos, 1, HealGridBuffTracker.MAX_BUFFS, L"%d" );

	HealGrid.SettingSet( 'hudShowBuffsMax', currVal );
	HealGridHUDMain.Instance():ApplySkin();

end

-- =========================================================================================
-- buff frame size adjust
-- =========================================================================================

function HealGridGuiTabHUDBuffs.BuffFrameSizeAdjustChanged( sliderPos )

	local currVal = HealGridGuiUtility.GetSliderValue( "HGG_HealGridTabHUDBuffsBuffFrameSizeAdjust", sliderPos, -20, 20, L"%d" );

	HealGrid.SettingSet( 'hudBuffFrameSizeAdjust', currVal );
	HealGridHUDMain.Instance():ApplySkin();

end

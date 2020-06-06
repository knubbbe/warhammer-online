HealGridGuiTabTooltip = {};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabTooltip.Initialize()

	-- ----- showTooltip -----------------------
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabTooltipShowTooltip", L"Show Tooltip" )

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabTooltip.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabTooltip.Activate()

	-- ----- showTooltip -----------------------
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabTooltipShowTooltip", HealGrid.SettingGet('unitTooltipShow') );

end

-- =========================================================================================
-- show tooltip
-- =========================================================================================

function HealGridGuiTabTooltip.ShowTooltipClicked()

	HealGrid.SettingSet( 'unitTooltipShow', not HealGrid.SettingGet('unitTooltipShow') );
	HealGridGuiUtility.CheckButtonToggle( "HGG_HealGridTabTooltipShowTooltip", HealGrid.SettingGet('unitTooltipShow') );

end

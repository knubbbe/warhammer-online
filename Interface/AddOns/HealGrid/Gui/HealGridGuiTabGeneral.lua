HealGridGuiTabGeneral = {};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabGeneral.Initialize()

	-- ----- play Career Point Sound -----------
	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralPlayCareerPointSound", 
                               settingObj='HealGrid', settingKey='playCareerPointSound',
                               label=L"Play sound at high CareerPoints" };
	RMetGuiBroker.Add( obj );

	-- ----- useColoredLabels ------------------
	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralUseColoredLabels", 
                               settingObj='HealGrid', settingKey='useColoredLabels',
                               label=L"Use Colored Labels" };
	RMetGuiBroker.Add( obj );

	-- ----- DispellableDebuffFlags ------------
	LabelSetText( "HGG_HealGridTabGeneralDispellableDebuffFlagsHeading", L"Dispellable Debuff Types" );

	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralDispellableDebuffFlagAilment", 
                               settingObj='HealGrid', settingKey='dispellableDebuffFlags:AILMENT',
                               label=L"Ailment" };
	obj:SetTotalWidth( 140 );
	obj:LockGeometry();
	RMetGuiBroker.Add( obj );

	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralDispellableDebuffFlagCripple", 
                               settingObj='HealGrid', settingKey='dispellableDebuffFlags:CRIPPLE',
                               label=L"Cripple" };
	obj:SetTotalWidth( 140 );
	obj:LockGeometry();
	RMetGuiBroker.Add( obj );

	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralDispellableDebuffFlagCurse", 
                               settingObj='HealGrid', settingKey='dispellableDebuffFlags:CURSE',
                               label=L"Curse" };
	obj:SetTotalWidth( 140 );
	obj:LockGeometry();
	RMetGuiBroker.Add( obj );

	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralDispellableDebuffFlagDamaging", 
                               settingObj='HealGrid', settingKey='dispellableDebuffFlags:DAMAGING',
                               label=L"Damaging" };
	obj:SetTotalWidth( 140 );
	obj:LockGeometry();
	RMetGuiBroker.Add( obj );

	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralDispellableDebuffFlagDebuff", 
                               settingObj='HealGrid', settingKey='dispellableDebuffFlags:DEBUFF',
                               label=L"Debuff" };
	obj:SetTotalWidth( 140 );
	obj:LockGeometry();
	RMetGuiBroker.Add( obj );

	obj = RMetGuiCheckButton:New{ paneID='HGG_HealGridTabGeneral', frameName="HGG_HealGridTabGeneralDispellableDebuffFlagHex", 
                               settingObj='HealGrid', settingKey='dispellableDebuffFlags:HEX',
                               label=L"Hex" };
	obj:SetTotalWidth( 140 );
	obj:LockGeometry();
	RMetGuiBroker.Add( obj );

	-- ----- now init the Broker -----------------
	RMetGuiBroker.InitializePane( 'HGG_HealGridTabGeneral', HealGridGlobals.GUI_WIDGET_WIDTH );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabGeneral.Shutdown()

	RMetGuiBroker.ShutdownPane( 'HGG_HealGridTabGeneral' );

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabGeneral.Activate()

	RMetGuiBroker.ActivatePane( 'HGG_HealGridTabGeneral' );

end

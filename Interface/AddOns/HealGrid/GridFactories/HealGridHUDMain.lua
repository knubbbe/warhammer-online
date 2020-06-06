-- ========================================================================================================
-- 
-- ========================================================================================================

HealGridHUDMain = HealGridHUD:New();

-- =====================================================================================================
-- New
-- =====================================================================================================

function HealGridHUDMain:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = 'HG_HealGridHUDMain';
	o.frameLabel = L"HealGrid (HUD)";
	o.templateName = 'HG_HealGridHUDMainTemplate';
	o.parentFrameName = 'Root';
	o.unitFrameSuffix = "_hud";
	o.skinID = HealGrid.SettingGet( 'hudSkin' );
	o.skinSection = 'hud';

    t = HealGridHUD:New( o );

    setmetatable( t, self );
    self.__index = self;

	t.playerBuffTracker = nil;											--- bufftracker player
	t.friendlyTargetBuffTracker = nil;									--- bufftracker friendly target
	t.hostileTargetBuffTracker = nil;									--- bufftracker hostile target

	HealGridHUDMain.myInstance = t;

    return( t );

end

-- =====================================================================================================
-- Initialization
-- =====================================================================================================

function HealGridHUDMain:Initialize()

	HealGridHUD.Initialize( self );

	CreateWindowFromTemplate( self:GetFrameName()..'LabelTarget', "HG_HealGridHUDMainLabelTargetTemplate", self:GetFrameName() );

	self.playerBuffTracker = HealGridBuffTracker:New( {unitObj=self.units[1][HealGridHUD.PLAYER], relativeTo=self:GetFrameName(), relativePoint="BOTTOM",
														settingBuffFilter='hudPlayerBuffsFilter', settingDebuffFilter='hudPlayerDebuffsFilter'} );
	self.friendlyTargetBuffTracker = HealGridBuffTracker:New( {unitObj=self.units[1][HealGridHUD.FRIENDLY_TARGET], relativeTo=self:GetFrameName(), relativePoint="LEFT", 
																settingBuffFilter='hudFriendlyTargetBuffsFilter', settingDebuffFilter='hudFriendlyTargetDebuffsFilter'} );
	self.hostileTargetBuffTracker = HealGridBuffTracker:New( {unitObj=self.units[1][HealGridHUD.HOSTILE_TARGET], relativeTo=self:GetFrameName(), relativePoint="RIGHT",
																settingBuffFilter='hudHostileTargetBuffsFilter', settingDebuffFilter='hudHostileTargetDebuffsFilter'} );

end

-- =====================================================================================================
-- Update handling
-- =====================================================================================================

function HealGridHUDMain:Update( timePassed )

	if ( HealGrid.SettingGet('hudStayHidden') ) then
		self:RootWindowSetShowing( false );
		return;
	end

	self:RootWindowSetShowing( true );
	HealGridHUD.Update( self, timePassed );

	if ( HealGrid.SettingGet('hudShowHostileTargetName') ) then
		LabelSetText( self:GetFrameName().."LabelTarget", TargetInfo:UnitName('selfhostiletarget') or L"" );
		WindowSetShowing( self:GetFrameName()..'LabelTarget', true );
	else
		WindowSetShowing( self:GetFrameName()..'LabelTarget', false );
	end

	-- update the buff trackers
	self.playerBuffTracker:Update();
	self.friendlyTargetBuffTracker:Update();
	self.hostileTargetBuffTracker:Update();

end

-- =====================================================================================
-- Skinning
-- =====================================================================================

function HealGridHUDMain:GetSkinID()

	return( HealGrid.SettingGet('hudSkin') );

end

function HealGridHUDMain:GetSkinSectionID()

	return( 'hud' );

end

function HealGridHUDMain:ApplySkin( skinID )

	local skinTargetFont;

	skinID = (skinID or self:GetSkinID());
	skinTargetFont = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'target', 'font' );

	HealGridHUD.ApplySkin( self, skinID );

	-- the target label
	LabelSetFont( self:GetFrameName().."LabelTarget", skinTargetFont, 10 );

	-- the buff trackers
	self.playerBuffTracker:ApplySkin( skinID );
	self.friendlyTargetBuffTracker:ApplySkin( skinID );
	self.hostileTargetBuffTracker:ApplySkin( skinID );

end

-- ===========================================================================================================
-- Visibility
-- ===========================================================================================================

function HealGridHUDMain:RootWindowSetShowing( doShow )

	if ( (not doShow) and WindowGetShowing(self:GetFrameName()) ) then
		self.playerBuffTracker:Hide();
		self.friendlyTargetBuffTracker:Hide();
		self.hostileTargetBuffTracker:Hide();
	end

	HealGridHUD.RootWindowSetShowing( self, doShow );

end

-- #####################################################################################################
-- static
-- #####################################################################################################

function HealGridHUDMain.Instance()

	return( HealGridHUDMain.myInstance );

end

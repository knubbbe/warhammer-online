HealGridUnitHUD = HealGridUnit:New();

function HealGridUnitHUD:New( o )

	if ( o ) then
		o.templateName = 'HG_HealGridUnitTemplate';
		o.placeholderTemplateName = 'HG_HealGridUnitPlaceholderTemplate';
		o.parentFrameName = (o.parentFrameName or "HG_HealGridHUDMain");
	end

	t = HealGridUnit:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitHUD:IsCareerLineIconVisible()

	local setting = HealGrid.SettingGet( 'hudShowCareerLineIcon' );

	if ( setting == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(self:Grid():GetSkinID(),'hud','unitFrame','careerLineIcon','isVisible') );
	elseif ( setting == 'HIDE' ) then
		return( false );
	else
		return( true );
	end

end

function HealGridUnitHUD:GetUnitFrameBarVisibility( barID )

	return( HealGrid.SettingGet('hud'..self.unitFrameBars[barID].settingKey) );

end

-- ===========================================================================================================================
-- (Pending) Targeting
-- ===========================================================================================================================

function HealGridUnitHUD:SetPendingTarget()

	-- HUD units are always targetable, so they do not "support" pendinTarget (and out-of-reach checks)
	self.isPendingTarget = false;

end

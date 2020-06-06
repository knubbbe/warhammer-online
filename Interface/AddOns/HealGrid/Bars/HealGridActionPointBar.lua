HealGridActionPointBar = HealGridProgressBar:New();

HealGridActionPointBar.eventsRegistered = false;
HealGridActionPointBar.eventListeners = {};

function HealGridActionPointBar:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = (o.frameName or "HG_HealGridActionPointBar");
	o.templateName = (o.templateName or "HG_HealGridActionPointBarTemplate");
	o.usesSkinLabels = true;

	t = HealGridProgressBar:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================================
-- Trivials
-- ========================================================================================================

-- ========================================================================================================
-- Initialization
-- ========================================================================================================

function HealGridActionPointBar:Initialize()

	HealGridProgressBar.Initialize( self );

	HealGridActionPointBar.eventListeners[self:GetFrameName()] = self;

	if ( not HealGridActionPointBar.eventsRegistered ) then
		RegisterEventHandler( SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, "HealGridActionPointBar.CallbackUpdateCurrentActionPoints" );
		RegisterEventHandler( SystemData.Events.PLAYER_MAX_ACTION_POINTS_UPDATED, "HealGridActionPointBar.CallbackUpdateMaximumActionPoints" );
		HealGridActionPointBar.eventsRegistered = true;
	end

end

-- ========================================================================================================
-- Shutdown
-- ========================================================================================================

function HealGridActionPointBar:Shutdown()

	HealGridActionPointBar.eventListeners[self:getFrameName()] = nil;
	HealGridProgressBar.Shutdown( self );

end

-- ========================================================================================================
-- Skinning and Layout
-- ========================================================================================================

function HealGridActionPointBar:GetFrameSpan()

	local frameSpan;

	if ( HealGridUtility.AvatarUsesCareerPoints() ) then
		if ( HealGrid.SettingGet('hudShowPetFrames') and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 2;
		elseif ( HealGrid.SettingGet('hudShowPetFrames') and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 1;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 1;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 1;
		end
	else
		if ( HealGrid.SettingGet('hudShowPetFrames') and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 3;
		elseif ( HealGrid.SettingGet('hudShowPetFrames') and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 2;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 2;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 1;
		end
	end

	return( frameSpan );

end

function HealGridActionPointBar:ApplySkin( skinID, skinSectionID, skinSubSectionID, factory )

	local skinHeight, skinBorderWidth, skinBorderHeight; 
	local ufw, ufh, frameSpan, anchorX, anchorY;

	skinSectionID = skinSectionID or 'hud';
	skinSubSectionID = skinSubSectionID or 'actionPointFrame';

	skinHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'height' );
	skinBorderWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'width' );
	skinBorderHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'height' );

	HealGridProgressBar.ApplySkin( self, skinID, skinSectionID, skinSubSectionID, factory );

	ufw,ufh = factory:UnitFrameGetSize( skinID );
	frameSpan = self:GetFrameSpan();

	if ( HealGrid.SettingGet('hudTwoLineBars') ) then
		anchorX = 0;
		anchorY = factory:GetCastBar():GetHeight( skinID, skinSectionID, skinSubSectionID ) * -1;
	else
		anchorX = 0;
		anchorY = 0;
	end

	WindowSetDimensions( self:GetFrameName(), ufw*frameSpan, skinHeight );
	self:SetAnchor( nil, 'bottomleft', nil, 'bottomleft', anchorX, anchorY );

	self:InitializeStatusBar( ufw*frameSpan, skinHeight, skinBorderWidth, skinBorderHeight );
	self:UpdateMaximumActionPoints();
	self:UpdateCurrentActionPoints();

end

-- ========================================================================================================
-- Progress Bar Handling
-- ========================================================================================================

function HealGridActionPointBar:UpdateCurrentActionPoints()

	self:SetCurrentValue( GameData.Player.actionPoints.current );

end

function HealGridActionPointBar:UpdateMaximumActionPoints()

	self:SetMaximumValue( GameData.Player.actionPoints.maximum );

end

-- #########################################################################################################
-- Statics (event handling)
-- #########################################################################################################

function HealGridActionPointBar.CallbackUpdateCurrentActionPoints()

	for k,_ in pairs(HealGridActionPointBar.eventListeners) do
		HealGridActionPointBar.eventListeners[k]:UpdateCurrentActionPoints();
	end

end

function HealGridActionPointBar.CallbackUpdateMaximumActionPoints()

	for k,_ in pairs(HealGridActionPointBar.eventListeners) do
		HealGridActionPointBar.eventListeners[k]:UpdateMaximumActionPoints();
	end

end

HealGridCareerBar = HealGridProgressBar:New();

HealGridCareerBar.eventsRegistered = false;
HealGridCareerBar.eventListeners = {};

function HealGridCareerBar:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = (o.frameName or "HG_HealGridCareerBar");
	o.templateName = (o.templateName or "HG_HealGridCareerBarTemplate");
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

function HealGridCareerBar:Initialize()

	HealGridProgressBar.Initialize( self );

	HealGridCareerBar.eventListeners[self:GetFrameName()] = self;

	if ( not HealGridCareerBar.eventsRegistered ) then
		RegisterEventHandler( SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "HealGridCareerBar.CallbackUpdateCareerPoints" );
		HealGridCareerBar.eventsRegistered = true;
	end

end

-- ========================================================================================================
-- Shutdown
-- ========================================================================================================

function HealGridCareerBar:Shutdown()

	HealGridCareerBar.eventListeners[self:getFrameName()] = nil;
	HealGridProgressBar.Shutdown( self );

end

-- ========================================================================================================
-- Skinning and Layout
-- ========================================================================================================

function HealGridCareerBar:GetFrameSpan()

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
		frameSpan = 1
	end

	return( frameSpan );

end

function HealGridCareerBar:ApplySkin( skinID, skinSectionID, skinSubSectionID, factory )

	local skinHeight, skinBorderWidth, skinBorderHeight; 
	local ufw, ufh, frameSpan, anchorX, anchorY;

	skinSectionID = skinSectionID or 'hud';
	skinSubSectionID = skinSubSectionID or 'careerFrame';

	skinHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'height' );
	skinBorderWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'width' );
	skinBorderHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'height' );

	HealGridProgressBar.ApplySkin( self, skinID, skinSectionID, skinSubSectionID, factory );

	ufw,ufh = factory:UnitFrameGetSize( skinID );
	frameSpan = self:GetFrameSpan();

	if ( HealGrid.SettingGet('hudTwoLineBars') ) then
		anchorX = ufw * factory:GetActionPointBar():GetFrameSpan();
		anchorY = factory:GetCastBar():GetHeight( skinID, skinSectionID, skinSubSectionID ) * -1;
	else
		anchorX = ufw * factory:GetActionPointBar():GetFrameSpan();
		anchorY = 0;
	end

	WindowSetDimensions( self:GetFrameName(), ufw*frameSpan, skinHeight );
	self:SetAnchor( nil, 'bottomleft', nil, 'bottomleft', anchorX, anchorY );

	self:InitializeStatusBar( ufw*frameSpan, skinHeight, skinBorderWidth, skinBorderHeight );
	
	self:UpdateMaximumCareerPoints();
	self:UpdateCareerPoints( HealGridUtility.AvatarGetMaxCareerPoints(), HealGridUtility.AvatarGetCareerPoints() );

	WindowSetShowing( self:GetFrameName(), HealGridUtility.AvatarUsesCareerPoints() );

end

-- ========================================================================================================
-- Progress Bar Handling
-- ========================================================================================================

function HealGridCareerBar:UpdateMaximumCareerPoints()

	local playerCareerLine = HealGridGlobals.careerMap[GameData.Player.career.id];
	local cpg = HealGridUtility.GetCareerPointGroups( playerCareerLine );

	if ( cpg == nil ) then
		self:SetMaximumValue( HealGridUtility.AvatarGetMaxCareerPoints() );
	else
		self:SetMaximumValue( cpg.max );
	end

end

function HealGridCareerBar:UpdateCareerPoints( previousCareerPoints, currentCareerPoints )

	self:SetCurrentValue( currentCareerPoints );

end

function HealGridCareerBar:ResizeStatusBar()

    local w, h, a, val;
	local playerCareerLine = HealGridGlobals.careerMap[GameData.Player.career.id];
	local cpg = HealGridUtility.GetCareerPointGroups( playerCareerLine );

	if ( cpg ~= nil ) then
		currVal = HealGridUtility.AdjustCareerPoints( self.statusBarCurrentValue, playerCareerLine );
		if ( self.statusBarMaximumValue == 0 or self.statusBarCurrentValue == 0 ) then
			a = 'TOP';
			w = 0;
		elseif ( self.statusBarCurrentValue > self.statusBarMaximumValue ) then
			a = 'TOP';
			w = self.statusBarMaximumWidth;
		elseif ( self.statusBarCurrentValue >= cpg[1].min and self.statusBarCurrentValue <= cpg[1].max ) then
			a = 'TOPLEFT';
			val = HealGridUtility.AdjustCareerPoints( self.statusBarCurrentValue, playerCareerLine );
			w = ( val / (cpg[1].max-cpg[1].min+1) ) * ( self.statusBarMaximumWidth / 2 );
			w = math.floor( w + 0.5 );
		elseif ( self.statusBarCurrentValue >= cpg[2].min and self.statusBarCurrentValue <= cpg[2].max ) then
			a = 'TOPRIGHT';
			val = HealGridUtility.AdjustCareerPoints( self.statusBarCurrentValue, playerCareerLine );
			w = ( val / (cpg[2].max-cpg[2].min+1) ) * ( self.statusBarMaximumWidth / 2 );
			w = math.floor( w + 0.5 );
		else
			a = 'TOP';
			w = 0;
		end

		h = self.statusBarMaximumHeight;

		WindowClearAnchors( self:GetFrameName().."StatusBar" );
		WindowAddAnchor( self:GetFrameName().."StatusBar", 'TOP', self:GetFrameName()..'Background', a, 0, 0 );

		WindowSetDimensions( self:GetFrameName().."StatusBar", w, h );
	else
		HealGridProgressBar.ResizeStatusBar( self );
	end

end

-- #########################################################################################################
-- Statics (event handling)
-- #########################################################################################################

function HealGridCareerBar.CallbackUpdateCareerPoints( previousCareerPoints, currentCareerPoints )

	for k,_ in pairs(HealGridCareerBar.eventListeners) do
		HealGridCareerBar.eventListeners[k]:UpdateCareerPoints( previousCareerPoints, currentCareerPoints );
	end

end

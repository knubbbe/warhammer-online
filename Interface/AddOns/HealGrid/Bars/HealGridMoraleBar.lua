--[[
	GameData.NUM_MORALE_LEVELS	= 4

	ChatWindow.Print( wstring.format( L"%d", GetPlayerMoraleLevel() ) );
	ChatWindow.Print( wstring.format( L"%d", GetMoralePercentForLevel(1) ) );
	ChatWindow.Print( wstring.format( L"%d", GetMoralePercentForLevel(2) ) );
]]

HealGridMoraleBar = HealGridProgressBar:New();

HealGridMoraleBar.eventsRegistered = false;
HealGridMoraleBar.eventListeners = {};

function HealGridMoraleBar:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = (o.frameName or "HG_HealGridMoraleBar");
	o.templateName = (o.templateName or "HG_HealGridMoraleBarTemplate");
	o.usesSkinLabels = true;

	o.labelColor = 'WHITE';

	t = HealGridProgressBar:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================================
-- Initialization
-- ========================================================================================================

function HealGridMoraleBar:Initialize()

	HealGridProgressBar.Initialize( self );

	HealGridMoraleBar.eventListeners[self:GetFrameName()] = self;

	if ( not HealGridMoraleBar.eventsRegistered ) then
		RegisterEventHandler( SystemData.Events.PLAYER_MORALE_UPDATED, "HealGridMoraleBar.CallbackUpdateMorale" );
		HealGridMoraleBar.eventsRegistered = true;
	end

end

-- ========================================================================================================
-- Shutdown
-- ========================================================================================================

function HealGridMoraleBar:Shutdown()

	HealGridMoraleBar.eventListeners[self:getFrameName()] = nil;
	HealGridProgressBar.Shutdown( self );

end

-- ========================================================================================================
-- Skinning and Layout
-- ========================================================================================================

function HealGridMoraleBar:GetFrameSpan()

	local frameSpan;

	if ( HealGridUtility.AvatarUsesCareerPoints() ) then
		if ( HealGrid.SettingGet('hudShowPetFrames') and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 1;
		elseif ( HealGrid.SettingGet('hudShowPetFrames') and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 1;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 1;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 1;
		end
	else
		if ( HealGrid.SettingGet('hudShowPetFrames') and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 2;
		elseif ( HealGrid.SettingGet('hudShowPetFrames') and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 1;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and HealGrid.SettingGet('hudTwoLineBars') ) then
			frameSpan = 1;
		elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
			frameSpan = 1;
		end
	end

	return( frameSpan );

end

function HealGridMoraleBar:ApplySkin( skinID, skinSectionID, skinSubSectionID, factory )

	local ufw, ufh, frameSpan, anchorX, anchorY, skinHeight, skinBorderWidth, skinBorderHeight;

	skinSectionID = skinSectionID or 'hud';
	skinSubSectionID = skinSubSectionID or 'moraleFrame';

	skinHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'height' );
	skinBorderWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'width' );
	skinBorderHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'height' );

	HealGridProgressBar.ApplySkin( self, skinID, skinSectionID, skinSubSectionID, factory );

	ufw,ufh = factory:UnitFrameGetSize( skinID );
	frameSpan = self:GetFrameSpan();

	if ( HealGridUtility.AvatarUsesCareerPoints() ) then
		if ( HealGrid.SettingGet('hudTwoLineBars') ) then
			anchorX = ufw * factory:GetActionPointBar():GetFrameSpan() + ufw * factory:GetCareerBar():GetFrameSpan();
			anchorY = factory:GetCastBar():GetHeight( skinID, skinSectionID, skinSubSectionID ) * -1;
		else
			anchorX = ufw * factory:GetActionPointBar():GetFrameSpan() + ufw * factory:GetCareerBar():GetFrameSpan();
			anchorY = 0;
		end
	else
		if ( HealGrid.SettingGet('hudTwoLineBars') ) then
			anchorX = ufw * factory:GetActionPointBar():GetFrameSpan();
			anchorY = factory:GetCastBar():GetHeight( skinID, skinSectionID, skinSubSectionID ) * -1;
		else
			anchorX = ufw * factory:GetActionPointBar():GetFrameSpan();
			anchorY = 0;
		end
	end

	WindowSetDimensions( self:GetFrameName(), ufw*frameSpan, skinHeight );
	self:SetAnchor( nil, 'bottomleft', nil, 'bottomleft', anchorX, anchorY );

	self:InitializeStatusBar( ufw*frameSpan, skinHeight, skinBorderWidth, skinBorderHeight );
	self:UpdateMorale( 0, 0 );

	-- morale bar doesn't fit if we are showing career bar on a single line, with no pet frames shown
	WindowSetShowing( self:GetFrameName(), not HealGridUtility.AvatarUsesCareerPoints() or HealGrid.SettingGet('hudTwoLineBars') or HealGrid.SettingGet('hudShowPetFrames') );

end

-- ========================================================================================================
-- Progress Bar Handling
-- ========================================================================================================

function HealGridMoraleBar:UpdateMorale( moralePercent, moraleLevel )

	local moraleLevelData = HealGridUtility.GetMoraleLevelData( moraleLevel );

	if ( moralePercent == 0 and moraleLevel == 0 ) then
		self:SetMaximumValue( moraleLevelData.barMax );
		self:SetCurrentValue( 0 );
	elseif ( moraleLevel >= GameData.NUM_MORALE_LEVELS ) then
		self:SetMaximumValue( 1 );
		self:SetCurrentValue( 1 );
	elseif ( moraleLevelData.low == moralePercent ) then				-- just enough for the level, fill the bar but dont spill over yet
		self:SetMaximumValue( 1 );
		self:SetCurrentValue( 1 );
	else
		self:SetMaximumValue( moraleLevelData.barMax );
		self:SetCurrentValue( moralePercent - moraleLevelData.low );
	end

end

-- #########################################################################################################
-- Statics (event handling)
-- #########################################################################################################

function HealGridMoraleBar.CallbackUpdateMorale( moralePercent, moraleLevel )

	for k,_ in pairs(HealGridMoraleBar.eventListeners) do
		HealGridMoraleBar.eventListeners[k]:UpdateMorale( moralePercent, moraleLevel );
	end

end

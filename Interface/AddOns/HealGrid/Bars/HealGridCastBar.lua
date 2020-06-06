HealGridCastBar = HealGridProgressBar:New();

HealGridCastBar.eventsRegistered = false;
HealGridCastBar.eventListeners = {};

HealGridCastBar.CANCEL_FADE_OUT_TIME = 1;
HealGridCastBar.GLOBAL_COOLDOWN_TIME = 1500;									-- in ms
HealGridCastBar.ACTIONBAR_SCAN_MAX_SLOT = 12;

function HealGridCastBar:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = (o.frameName or "HG_HealGridCastBar");
	o.templateName = (o.templateName or "HG_HealGridCastBarTemplate");
	o.usesSkinLabels = false;

	o.castBarCastTint = nil;
	o.castBarChannelTint = nil;
	o.castBarCancelTint = nil;
	o.castBarGlobalCooldownTint = nil;

	o.castTimerCurrent = 0;
	o.castTimerMaximum = 0;
	o.castTimerDesired = 0;
	o.castTimerSetBack = 0;
	o.castTimerActionID = 0;
	o.castTimerActionName = L"";
	o.castTimerIsChannel = false;
	o.castTimerIsCasting = false;
	o.castTimerFadeOutTime = 0;
	o.castTimerIsCancelled = false;

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

function HealGridCastBar:Initialize()

	HealGridProgressBar.Initialize( self );

	HealGridCastBar.eventListeners[self:GetFrameName()] = self;

	if ( not HealGridCastBar.eventsRegistered ) then
		RegisterEventHandler( SystemData.Events.PLAYER_START_INTERACT_TIMER,	"HealGridCastBar.CallbackStartInteract" );
		RegisterEventHandler( SystemData.Events.INTERACT_DONE,					"HealGridCastBar.CallbackEndCast" );
		RegisterEventHandler( SystemData.Events.PLAYER_BEGIN_CAST,				"HealGridCastBar.CallbackBeginCast" );
		RegisterEventHandler( SystemData.Events.PLAYER_END_CAST,				"HealGridCastBar.CallbackEndCast" );
		RegisterEventHandler( SystemData.Events.PLAYER_CAST_TIMER_SETBACK,		"HealGridCastBar.CallbackSetbackCast" );
		HealGridCastBar.eventsRegistered = true;
	end

end

-- ========================================================================================================
-- Shutdown
-- ========================================================================================================

function HealGridCastBar:Shutdown()

	HealGridCastBar.eventListeners[self:getFrameName()] = nil;
	HealGridProgressBar.Shutdown( self );

end

-- ========================================================================================================
-- Skinning
-- ========================================================================================================

function HealGridCastBar:GetFrameSpan()

	local frameSpan;

	if ( HealGrid.SettingGet('hudShowPetFrames') and HealGrid.SettingGet('hudTwoLineBars') ) then
		frameSpan = 5;
	elseif ( HealGrid.SettingGet('hudShowPetFrames') and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
		frameSpan = 2;
	elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and HealGrid.SettingGet('hudTwoLineBars') ) then
		frameSpan = 3;
	elseif ( (not HealGrid.SettingGet('hudShowPetFrames')) and (not HealGrid.SettingGet('hudTwoLineBars')) ) then
		frameSpan = 1;
	end

	return( frameSpan );

end

function HealGridCastBar:ApplySkin( skinID, skinSectionID, skinSubSectionID, factory )

	local height, borderWidth, borderHeight, barForegroundColor, barChannelColor, barFailureColor, barGlobalCooldownColor;
	local ufw, ufh, frameSpan, anchorX, anchorY; 

	skinSectionID = skinSectionID or 'hud';
	skinSubSectionID = skinSubSectionID or 'castFrame';

	height = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'height' );
	borderWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'width' );
	borderHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'height' );
	barForegroundColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'foreground', 'color' );
	barChannelColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'foreground', 'channelColor' );
	barFailureColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'foreground', 'failureColor' );
	barGlobalCooldownColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'foreground', 'globalCooldownColor' );

	HealGridProgressBar.ApplySkin( self, skinID, skinSectionID, skinSubSectionID, factory );

	ufw,ufh = factory:UnitFrameGetSize( skinID );
	frameSpan = self:GetFrameSpan();

	if ( HealGridUtility.AvatarUsesCareerPoints() ) then
		if ( HealGrid.SettingGet('hudTwoLineBars') ) then
			anchorX = 0;
			anchorY = 0;
		else
			if ( HealGrid.SettingGet('hudShowPetFrames') ) then
				anchorX = (factory:GetActionPointBar():GetFrameSpan()+factory:GetCareerBar():GetFrameSpan()+factory:GetMoraleBar():GetFrameSpan()) * ufw;
				anchorY = 0;
			else
				anchorX = (factory:GetActionPointBar():GetFrameSpan()+factory:GetCareerBar():GetFrameSpan()) * ufw;
				anchorY = 0;
			end
		end
	else
		if ( HealGrid.SettingGet('hudTwoLineBars') ) then
			anchorX = 0;
			anchorY = 0;
		else
			anchorX = (factory:GetActionPointBar():GetFrameSpan()+factory:GetMoraleBar():GetFrameSpan()) * ufw;
			anchorY = 0;
		end
	end

	WindowSetDimensions( self:GetFrameName(), ufw * frameSpan, height );
	self:SetAnchor( nil, 'bottomleft', nil, 'bottomleft', anchorX, anchorY );

	self:InitializeStatusBar( ufw*frameSpan, height, borderWidth, borderHeight );

	self.castBarCastTint = HealGridUtility.CopyVariable( barForegroundColor );
	self.castBarChannelTint = HealGridUtility.CopyVariable( barChannelColor );
	self.castBarCancelTint = HealGridUtility.CopyVariable( barFailureColor );
	self.castBarGlobalCooldownTint = HealGridUtility.CopyVariable( barGlobalCooldownColor );

	HealGridUtility.LabelSetTextColor( self:GetFrameName().."LabelLeft", 139, 0, 0 );

	self:EndCast( false );

end

-- ========================================================================================================
-- Progress Bar Handling (casting)
-- ========================================================================================================

function HealGridCastBar:Update( timePassed )

	HealGridProgressBar.Update( self, timePassed );

	-- fade out

	if ( self.castTimerIsCasting ) then
		self.castTimerCurrent = self.castTimerCurrent + timePassed;
		if ( self.castTimerCurrent > self.castTimerMaximum ) then
			self.castTimerCurrent = self.castTimerMaximum;
		end

		if ( self.castTimerIsChannel ) then	
			self:SetCurrentValue( self.castTimerMaximum - self.castTimerCurrent );
		else
			self:SetCurrentValue( self.castTimerCurrent );
		end

		if ( self.castTimerSetBack > 0 ) then
			LabelSetText( self:GetFrameName()..'LabelLeft', wstring.format(L"%4.1f",self.castTimerSetBack) );
		end
		LabelSetText( self:GetFrameName()..'LabelCenter', wstring.format(L"%4.1f",self.castTimerCurrent) );

	elseif ( self.castTimerIsCancelled and self.castTimerFadeOutTime > 0 ) then
		self.castTimerFadeOutTime = self.castTimerFadeOutTime - timePassed;
		if ( self.castTimerFadeOutTime <= 0 ) then
			self.castTimerIsCancelled = 0;
			self.castTimerFadeOutTime = 0;
			self:SetCurrMaxValue( 0, 0 );
			LabelSetText( self:GetFrameName()..'LabelCenter', L"" );
		end
	else
		self:GlobalCooldown();
	end

end

function HealGridCastBar:StartInteract()

	self.castTimerCurrent = 0;
	self.castTimerMaximum = GameData.InteractTimer.time;
	self.castTimerDesired = GameData.InteractTimer.time;
	self.castTimerActionID = 0;
	self.castTimerActionName = GameData.InteractTimer.objectName;
	self.castTimerIsChannel = false;
	self.castTimerIsCasting = true;
	self.castTimerFadeOutTime = 0;
	self.castTimerIsCancelled = false;

	self:SetStatusBarTint( self.castBarCastTint );
	self:SetCurrMaxValue( self.castTimerCurrent, self.castTimerMaximum );

	LabelSetText( self:GetFrameName()..'LabelCenter', wstring.format(L"%d",self.castTimerCurrent) );
	LabelSetText( self:GetFrameName()..'LabelRight', wstring.format(L"%d",self.castTimerMaximum) );

end

function HealGridCastBar:BeginCast( abilityID, isChannel, desiredCastTime, averageLatency )

	averageLatency = 0;									-- THIS NOW IS A BOOLEAN. so what does it mean ???????????

	if ( desiredCastTime == 0 ) then
		return;
	end

	self.castTimerCurrent = 0;
	self.castTimerMaximum = desiredCastTime;
	self.castTimerDesired = desiredCastTime;
	self.castTimerActionID = abilityID;
	self.castTimerActionName = (GetAbilityName(abilityID) or L"");
	self.castTimerIsChannel = isChannel;
	self.castTimerIsCasting = true;
	self.castTimerFadeOutTime = 0;
	self.castTimerIsCancelled = false;

	if ( isChannel ) then
		self.castTimerMaximum = desiredCastTime + averageLatency;
		self:SetStatusBarTint( self.castBarChannelTint );
		self:SetCurrMaxValue( self.castTimerMaximum - self.castTimerCurrent, self.castTimerMaximum );
	else
		self:SetStatusBarTint( self.castBarCastTint );
		self:SetCurrMaxValue( self.castTimerCurrent, self.castTimerMaximum );
	end

	LabelSetText( self:GetFrameName()..'LabelCenter', wstring.format(L"%d",self.castTimerCurrent) );
	LabelSetText( self:GetFrameName()..'LabelRight', wstring.format(L"%d",self.castTimerMaximum) );

end

function HealGridCastBar:EndCast( isCancel )

	self.castTimerCurrent = 0;
	self.castTimerMaximum = 0;
	self.castTimerDesired = 0;
	self.castTimerSetBack = 0;
	self.castTimerActionID = 0;
	self.castTimerActionName = L"";
	self.castTimerIsChannel = false;
	self.castTimerIsCasting = false;

	if ( isCancel ) then
		self:SetStatusBarTint( self.castBarCancelTint );
		self.castTimerIsCancelled = true;
		self.castTimerFadeOutTime = HealGridCastBar.CANCEL_FADE_OUT_TIME;
	else
		self.castTimerIsCancelled = false;
		self.castTimerFadeOutTime = 0;
		self:SetCurrMaxValue( 0, 0 );
	end

	LabelSetText( self:GetFrameName()..'LabelLeft', L"" );
	if ( isCancel ) then
		LabelSetText( self:GetFrameName()..'LabelCenter', L"INTR" );
	else
		LabelSetText( self:GetFrameName()..'LabelCenter', L"" );
	end
	LabelSetText( self:GetFrameName()..'LabelRight', L"" );

end

function HealGridCastBar:SetbackCast( newRemainingCastTime )

	local currRemainingCastTime;

	currRemainingCastTime = self.castTimerMaximum - self.castTimerCurrent;

	self.castTimerSetBack = self.castTimerSetBack + (newRemainingCastTime - currRemainingCastTime);
	self.castTimerCurrent = self.castTimerMaximum - newRemainingCastTime;
	if ( self.castTimerCurrent < 0 ) then
		self.castTimerCurrent = 0;
	end

end

-- ========================================================================================================
-- Global Cooldown
-- ========================================================================================================

function HealGridCastBar:GlobalCooldown()

	local i = 1;
	local cooldown,maxCooldown = GetMoraleCooldown( 1 );

	maxCooldown = math.floor( maxCooldown * 1000 + 0.5 );
	while ( i < HealGridCastBar.ACTIONBAR_SCAN_MAX_SLOT and maxCooldown ~= HealGridCastBar.GLOBAL_COOLDOWN_TIME ) do
		cooldown,maxCooldown = GetHotbarCooldown( i );
		maxCooldown = math.floor( maxCooldown * 1000 + 0.5 );
		i = i + 1;
	end

	cooldown = cooldown * 1000;		-- to milliseconds 

	if ( i < HealGridCastBar.ACTIONBAR_SCAN_MAX_SLOT and cooldown <= HealGridCastBar.GLOBAL_COOLDOWN_TIME ) then
		self:SetStatusBarTint( self.castBarGlobalCooldownTint );
		self:SetCurrMaxValue( cooldown, HealGridCastBar.GLOBAL_COOLDOWN_TIME );
	end

end

-- #########################################################################################################
-- Statics (event handling)
-- #########################################################################################################

function HealGridCastBar.CallbackStartInteract()

	for k,_ in pairs(HealGridCastBar.eventListeners) do
		HealGridCastBar.eventListeners[k]:StartInteract();
	end

end

function HealGridCastBar.CallbackBeginCast( abilityID, isChannel, desiredCastTime, averageLatency )

	for k,_ in pairs(HealGridCastBar.eventListeners) do
		HealGridCastBar.eventListeners[k]:BeginCast( abilityID, isChannel, desiredCastTime, averageLatency );
	end

end

function HealGridCastBar.CallbackEndCast( isCancel )

	for k,_ in pairs(HealGridCastBar.eventListeners) do
		HealGridCastBar.eventListeners[k]:EndCast( isCancel );
	end

end

function HealGridCastBar.CallbackSetbackCast( setbackTime )

	for k,_ in pairs(HealGridCastBar.eventListeners) do
		HealGridCastBar.eventListeners[k]:SetbackCast( setbackTime );
	end

end

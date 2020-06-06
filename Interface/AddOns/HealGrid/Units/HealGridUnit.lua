HealGridUnit = {};

HealGridUnit.CACHED_BUFF_GRACE_PERIOD = 0.6;				-- keep buffs cached for n second after acquiring a new valid bufftarget w/o buffs (e.g. FriendlyTarget)

function HealGridUnit:New( o )

	local t = {};
	
	if ( o ) then
		t.unit = o.unit;
		t.frameName = o.frameName;
		t.templateName = o.templateName;
		t.placeholderFrameName = o.placeholderFrameName;
		t.placeholderTemplateName = o.placeholderTemplateName;
		t.petFrameName = o.petFrameName;
		t.petTemplateName = o.petTemplateName;
		t.parentFrameName = o.parentFrameName;
		t.frameSuffix = (o.frameSuffix or "");

		t.memberIndex = (o.memberIndex or 1);
		t.groupIndex = (o.groupIndex or 1);

		t.gridPosX = t.memberIndex;						-- position of the cell in the grid
		t.gridPosY = t.groupIndex;

		t.previousRealUnitName = nil;					-- name of the unit, needed to check if unit changed (e.g. group4 <-> group3)

		t.grid = nil;									-- "pointer" to the grid this unit-cell is attached to

		t.unitFrameBackgroundColor = 'BLACK';
		t.unitFrameBackgroundCache = 'unknown';
		t.petLastHitPointsPercent = -2;
		t.petHealthFrameBackground = 'unknown';
		t.isUnitVisible = false;					-- depending on unit existance
		t.isPetVisible = false;						-- depending on unit and pet existance
		t.isHidden = false;							-- force hide

		t.isPendingTarget = false;					-- unit is about to be targeted

		t.labels = { TOPLEFT     = {label=L"",isVisible=true},
					 TOP         = {label=L"",isVisible=true},
					 TOPRIGHT    = {label=L"",isVisible=true},
					 LEFT        = {label=L"",isVisible=true},
					 CENTER      = {label=L"",isVisible=true},
					 RIGHT       = {label=L"",isVisible=true},
					 BOTTOMLEFT  = {label=L"",isVisible=true},
					 BOTTOM      = {label=L"",isVisible=true},
					 BOTTOMRIGHT = {label=L"",isVisible=true},
				   };

		t.debuffFlagData = { HEX =		{ active=false,
										  expires=0,
										},
							 DAMAGING = { active=false,
										  expires=0,
										},
							 DEBUFF	=	{ active=false,
										  expires=0,
										},
							 AILMENT =	{ active=false,
										  expires=0,
										},
							 CURSE =	{ active=false,
										  expires=0,
										},
							 CRIPPLE =	{ active=false,
										  expires=0,
										},
							};
		t.cachedBuffData = {};						-- only for units who cannot track buffs themselves!
		t.cachedBuffGracePeriod = 0;				-- how long to keep buffs in memory when acquiring a valid buff target w/o buffs
		t.buffLastScanHadUnit = false;				-- did i had a unit to scan in the last run
		t.trackedBuffs = {};

		t.unitFrameBars = { healthPointsBar	= { w=0, h=0, growth='BOTTOM_TOP', prevValue = 0, maxValue=100, isVisible=true,
												foregroundIsVisible=true, foregroundColor='GREEN', backgroundIsVisible=true, backgroundColor='BLACK',
												foregroundStatus='UNKNOWN',backgroundStatus='UNKNOWN',windowName='HealthPoints', settingKey='ShowHealthPointsBar', },
						   actionPointsBar	= { w=0, h=0, growth='BOTTOM_TOP', prevValue = 0, maxValue=100, isVisible=true,
												foregroundIsVisible=true, foregroundColor='GREEN', backgroundIsVisible=true, backgroundColor='BLACK',
												foregroundStatus='UNKNOWN',backgroundStatus='UNKNOWN',windowName='ActionPoints', settingKey='ShowActionPointsBar', },
						   moraleLevelBar	= { w=0, h=0, growth='BOTTOM_TOP', prevValue = 0, maxValue=GameData.NUM_MORALE_LEVELS, isVisible=true,
												foregroundIsVisible=true, foregroundColor='GREEN', backgroundIsVisible=true, backgroundColor='BLACK',
												foregroundStatus='UNKNOWN',backgroundStatus='UNKNOWN',windowName='MoraleLevel', settingKey='ShowMoraleLevelBar', },
						};

		t.rangeScanTimePassed = 0;
		t.rangeScanType = 'UNIT_UNKNOWN_RANGE';

		t.tooltipShown = false;						-- need this to trigger the OnMouseOver event (unfortunately)
	end

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnit:GetUnit()

	d( 'HealGridUnit:GetUnit() : DEPRECATED!' );
	return( self.unit );

end

function HealGridUnit:GetUnitType()

	return( self.unit );

end

function HealGridUnit:GetFrameName()

	return( self.frameName..self:GetFrameSuffix() );

end

function HealGridUnit:GetTemplateName()

	return( self.templateName );

end

function HealGridUnit:GetPlaceholderFrameName()

	if ( self.placeholderFrameName ~= nil ) then
		return( self.placeholderFrameName..self:GetFrameSuffix() );
	end

	return( nil );

end

function HealGridUnit:GetPlaceholderTemplateName()

	return( self.placeholderTemplateName );

end

function HealGridUnit:GetPetFrameName()

	if ( self.petFrameName ~= nil ) then
		return( self.petFrameName..self:GetFrameSuffix() );
	end

	return( nil );

end

function HealGridUnit:GetPetTemplateName()

	return( self.petTemplateName );

end

function HealGridUnit:GetParentFrameName()

	return( self.parentFrameName );

end

function HealGridUnit:GetFrameSuffix()

	return( self.frameSuffix );

end

function HealGridUnit:GetGroupIndex()

	return( self.groupIndex );

end

function HealGridUnit:GetMemberIndex()

	return( self.memberIndex );

end

function HealGridUnit:Grid()

	return( self.grid );

end

function HealGridUnit:GetUnitName()

	return( L"" );

end

function HealGridUnit:GetRealUnitName()

	return( HealGridUtility.WStringChop(self:GetUnitName()) );

end

function HealGridUnit:GetUnitLevel()

	return( 0 );

end

function HealGridUnit:GetCareerName()

	return( L"Unknown Career" );

end

function HealGridUnit:GetCareerLine()

	return( 0 );

end

function HealGridUnit:GetCareerArch()

	return( HealGridGlobals.arches[self:GetCareerLine()] );

end

function HealGridUnit:GetTargetType()

	return( HealGridGlobals.UnitTargetType.NONE );

end

function HealGridUnit:GetConType()

	return( HealGridGlobals.UnitConType.NO_LEVEL );

end

function HealGridUnit:GetUnitTier()

	return( 0 );

end

function HealGridUnit:IsInAvatarGroup()

	return( false );

end

function HealGridUnit:IsGroupLeader()

	return( false );

end

function HealGridUnit:IsMainAssist()

	return( false );

end

function HealGridUnit:GetAssistTarget()

	return( 'UNIT' );												-- UNIT / MAIN / NONE

end

function HealGridUnit:GetStance()

	return( -1 );

end

function HealGridUnit:GetStanceName()

	return( L"" );

end

function HealGridUnit:IsPet()

	return( false );

end

function HealGridUnit:UnitExists()

	return( true );

end

function HealGridUnit:PetExists()

	return( false );

end

function HealGridUnit:ShowPet()

	return( false );

end

function HealGridUnit:IsDead()

	return( false );

end

function HealGridUnit:PetIsDead()

	return( false );

end

function HealGridUnit:IsFar()

	return( false );

end

function HealGridUnit:UnitIsFriend()

	return( true );

end

function HealGridUnit:UnitIsHostile()

	return( false );

end

function HealGridUnit:HasUnitChanged()

	return( self.previousRealUnitName == nil or self:GetRealUnitName() ~= self.previousRealUnitName );

end

function HealGridUnit:IsCareerLineIconVisible()

	return( true );

end

function HealGridUnit:GetUnitFrameBarVisibility( barID )

	return( 'HIDE' );

end


-- ===========================================================================================================================
-- Initialization
-- ===========================================================================================================================

function HealGridUnit:Initialize( grid )

	CreateWindowFromTemplate( self:GetFrameName(), self:GetTemplateName(), self:GetParentFrameName() );

	self.grid = grid;

	HealGridUtility.WindowSetTintColor( self:GetFrameName().."Border", 0, 0, 0 );
	HealGridUtility.WindowSetTintColor( self:GetFrameName().."Background", 255, 0, 0 );
	WindowSetAlpha( self:GetFrameName(), 1 );
	WindowSetScale( self:GetFrameName(), WindowGetScale(self:GetParentFrameName()) );
	WindowSetShowing( self:GetFrameName(), false );

	if ( self:GetPlaceholderFrameName() ) then
		CreateWindowFromTemplate( self:GetPlaceholderFrameName(), self:GetPlaceholderTemplateName(), self:GetParentFrameName() );

		HealGridUtility.WindowSetTintColor( self:GetPlaceholderFrameName().."Border", 0, 0, 0 );
		HealGridUtility.WindowSetTintColor( self:GetPlaceholderFrameName().."Background", 63, 63, 63 );
		WindowSetAlpha( self:GetPlaceholderFrameName(), 0.5 );
		WindowSetScale( self:GetPlaceholderFrameName(), WindowGetScale(self:GetParentFrameName()) );
		WindowSetShowing( self:GetPlaceholderFrameName(), true );
	end

	if ( self:GetPetFrameName() ) then
		CreateWindowFromTemplate( self:GetPetFrameName(), self:GetPetTemplateName(), self:GetFrameName() );

		HealGridUtility.WindowSetTintColor( self:GetPetFrameName().."Border", 0, 0, 0 );
		HealGridUtility.WindowSetTintColor( self:GetPetFrameName().."Background", 63, 63, 63 );
		WindowSetScale( self:GetPetFrameName(), WindowGetScale(self:GetFrameName()) );
		WindowSetShowing( self:GetPetFrameName(), false );
	end

	self.isUnitVisible = false;
	self.isPetVisible = false;

--	LabelSetText( self:GetFrameName().."LabelCenter", StringToWString(self:GetUnit()) );
--	LabelSetText( self:GetFrameName().."LabelBottomLeft", L"" );
--	LabelSetText( self:GetFrameName().."LabelBottomRight", L"" );

	for k,v in pairs(HealGridGlobals.debuffFlagColor) do
		WindowSetShowing( self:GetFrameName().."LabelDebuffFlags"..k, false );
		HealGridUtility.WindowSetTintColor( self:GetFrameName().."LabelDebuffFlags"..k.."Background", v );
	end

	self.spellTrack1Label = HealGridColoredLabel:New( {frameName=self:GetFrameName().."LabelColoredTopLeft",parentFrameName=self:GetFrameName()..'Label',
                                                            frameLayer=Window.Layers.BACKGROUND} );
	self.spellTrack2Label = HealGridColoredLabel:New( {frameName=self:GetFrameName().."LabelColoredLeft",parentFrameName=self:GetFrameName()..'Label',
                                                         frameLayer=Window.Layers.BACKGROUND} );

end

-- ===========================================================================================================================
-- Destroy
-- ===========================================================================================================================

function HealGridUnit:Destroy()

	if ( DoesWindowExist(self:GetFrameName()) ) then
		WindowSetShowing( self:GetFrameName(), false );
		DestroyWindow( self:GetFrameName() );
	end

	if ( self:GetPlaceholderFrameName() ~= nil and DoesWindowExist(self:GetPlaceholderFrameName()) ) then
		WindowSetShowing( self:GetPlaceholderFrameName(), false );
		DestroyWindow( self:GetPlaceholderFrameName() );
	end

	if ( self:GetPetFrameName() ~= nil and DoesWindowExist(self:GetPetFrameName()) ) then
		WindowSetShowing( self:GetPetFrameName(), false );
		DestroyWindow( self:GetPetFrameName() );
	end

end

-- ===========================================================================================================================
-- OnUpdate
-- ===========================================================================================================================

function HealGridUnit:OnUpdate( timePassed )
    
	self:UpdateVisibility();

	if ( self:IsUnitVisible() ) then
	    -- Lorenzo d('On Update' ..WStringToString(self:GetRealUnitName()));
		self:UpdateFrameBackground( false );
		self:UpdateBar( 'healthPointsBar', self:HitPointsPercent() or 0, false );
		self:UpdateBar( 'actionPointsBar', self:ActionPointsPercent() or 0, false );
		self:UpdateBar( 'moraleLevelBar', self:MoraleLevel() or 0, false );
		self:UpdateRange( timePassed );

		self:UpdateLabels();

		self:UpdateLabelBuffFlags();
		self:UpdateLabelDebuffFlags();
		self:UpdateIconCareerLine();

		self:UpdatePetHitPoints( false );

		self:UpdateTooltip();
	end

	self.previousRealUnitName = self:GetRealUnitName();
	self:ClearPendingTarget();

end

-- ===========================================================================================================================
-- (Cell) Anchoring
-- ===========================================================================================================================

function HealGridUnit:GetGridPosX()

	return( self.gridPosX );

end

function HealGridUnit:GetGridPosY()

	return( self.gridPosY );

end

function HealGridUnit:SetGridPosX( gridPosX )

	if ( self.gridPosX == gridPosX ) then
		return( false );
	else
		self.gridPosX = gridPosX;
		return( true );
	end

end

function HealGridUnit:SetGridPosY( gridPosY )

	if ( self.gridPosY == gridPosY ) then
		return( false );
	else
		self.gridPosY = gridPosY;
		return( true );
	end

end

function HealGridUnit:SetGridPosXY( gridPosX, gridPosY )

	local rtcX, rtcY;

	rtcX = self:SetGridPosX( gridPosX );
	rtcY = self:SetGridPosY( gridPosY );

	return( rtcX or rtcY );

end

function HealGridUnit:AnchorCell( skinID )

	local anchorPoint, anchorRelativePoint, anchorX, anchorY;
	local frameWidth,frameHeight,totalFrameWidth,totalFrameHeight = self:Grid():UnitFrameGetSize( skinID );

	-- --- anchor calculations
	if ( self:Grid():GetOrientation() == 'HORIZONTAL' ) then
		anchorX = totalFrameWidth * math.max( (self:GetGridPosX()-1), 0 );
		anchorY = totalFrameHeight * math.max( (self:GetGridPosY()-1), 0 );
		if ( self:Grid():GetGrowth() == 'DOWN' ) then
			anchorPoint = 'topleft';
			anchorRelativePoint = 'topleft';
		else
			anchorPoint = 'bottomleft';
			anchorRelativePoint = 'bottomleft';
			if ( self:ShowPet() ) then
				anchorY = anchorY + self:Grid():PetFrameGetHeight();		-- offset to "fit" in box 
			end
			anchorY = anchorY * -1;
		end
	else
		anchorX = totalFrameWidth * math.max( (self:GetGridPosY()-1), 0 );
		anchorY = totalFrameHeight * math.max( (self:GetGridPosX()-1), 0 );
		if ( self:Grid():GetGrowth() == 'DOWN' ) then	-- RIGHT
			anchorPoint = 'topleft';
			anchorRelativePoint = 'topleft';
		else							-- LEFT
			anchorPoint = 'topright';
			anchorRelativePoint = 'topright';
			anchorX = anchorX * -1;
		end
	end

	-- --- unit frame and background
	self:SetAnchor( self:GetFrameName(), anchorPoint, nil, anchorRelativePoint, anchorX, anchorY );

	-- --- placeholder (if any)
	if ( self:GetPlaceholderFrameName() ) then
		self:SetAnchor( self:GetPlaceholderFrameName(), anchorPoint, nil, anchorRelativePoint, anchorX, anchorY );
	end

end

-- ===========================================================================================================================
-- Skinning / Layout
-- ===========================================================================================================================

function HealGridUnit:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, frameName, labelIndex, width, height )		-- final protected

	local offX, offY;
	local label = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'label' );
	local font = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'font' );
	local paddingX = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'paddingX' );
	local paddingY = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'paddingY' );
	local color = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'color' );
	local isTargeted = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'isTargeted' );
	local inAvatarGroup = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'inAvatarGroup' );

	self.labels[labelIndex].label = label;
	self.labels[labelIndex].isPrepared = false;
	self.labels[labelIndex].isVisible = true;
	self.labels[labelIndex].color = color;
	self.labels[labelIndex].isTargeted = isTargeted;
	self.labels[labelIndex].inAvatarGroup = inAvatarGroup;

	LabelSetFont( frameName, font, 10 );

	if ( RMetColor[color] ) then
		HealGridUtility.LabelSetTextColor( frameName, color );
	end

	offX = HealGridUtility.GetAbsAnchorOffset( paddingX, width );
	offY = HealGridUtility.GetAbsAnchorOffset( paddingY, height );
	WindowClearAnchors( frameName );
	WindowAddAnchor( frameName, 'CENTER', self:GetFrameName()..'Background', 'CENTER', offX, offY );
	WindowSetDimensions( frameName, width, height );

	WindowSetShowing( frameName, true );

end

function HealGridUnit:ApplySkinLabels( skinID, skinSectionID, skinSubSectionID, width, height )

	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelTopLeft', self:GetFrameName()..'LabelTopLeft', 'TOPLEFT', width, height );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelTop', self:GetFrameName()..'LabelTop', 'TOP', width, height );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelTopRight', self:GetFrameName()..'LabelTopRight', 'TOPRIGHT', width, height );

	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelLeft', self:GetFrameName()..'LabelLeft', 'LEFT', width, height );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelCenter', self:GetFrameName()..'LabelCenter', 'CENTER', width, height );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelRight', self:GetFrameName()..'LabelRight', 'RIGHT', width, height );

	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelBottomLeft', self:GetFrameName()..'LabelBottomLeft', 'BOTTOMLEFT', width, height );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelBottom', self:GetFrameName()..'LabelBottom', 'BOTTOM', width, height );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelBottomRight', self:GetFrameName()..'LabelBottomRight', 'BOTTOMRIGHT', width, height );

end

function HealGridUnit:ApplySkinSpellTrackLabels( skinID, skinSectionID, skinSubSectionID, frameWidth, frameBorderWidth )

	local textureData = nil;
	local spellTrack1Font = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'spellTrack1', 'font' );
	local spellTrack1Position = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'spellTrack1', 'position' );
	local spellTrack1MaxWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'spellTrack1', 'maxWidth' );
	local spellTrack2Font = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'spellTrack2', 'font' );
	local spellTrack2Position = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'spellTrack2', 'position' );
	local spellTrack2MaxWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'spellTrack2', 'maxWidth' );

	self.spellTrack1Label:SetAnchor( spellTrack1Position, self:GetFrameName()..'Background', spellTrack1Position );
	self.spellTrack1Label:SetMaxWidth( (frameWidth-frameBorderWidth*2) * spellTrack1MaxWidth / 100 );
	self.spellTrack1Label:SetFont( spellTrack1Font, 10 );

	self.spellTrack2Label:SetAnchor( spellTrack2Position, self:GetFrameName()..'Background', spellTrack2Position );
	self.spellTrack2Label:SetMaxWidth( (frameWidth - frameBorderWidth*2) * spellTrack2MaxWidth / 10 );
	self.spellTrack2Label:SetFont( spellTrack2Font, 10 );

end

function HealGridUnit:ApplySkinBar( skinID, skinSectionID, barID, parentWidth, parentHeight )

	local px, py, isVisible;
	local barAnchor1 = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'anchor1' );
	local barAnchor2 = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'anchor2' );
	local barGrowth = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'growth' );
	local barForegroundIsVisible = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'foreground', 'isVisible' );
	local barForegroundColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'foreground', 'color' );
	local barForegroundTexture = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'foreground', 'texture' );
	local barForegroundStyle = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'foreground', 'style' );
	local barBackgroundIsVisible = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'background', 'isVisible' );
	local barBackgroundColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'background', 'color' );
	local barBackgroundTexture = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'background', 'texture' );
	local barBackgroundStyle = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'background', 'style' );
	local barIsToggleable = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'isToggleable' );
	local barIsVisible = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', barID, 'isVisible' );
	local barWindowName = self:GetFrameName()..'Bar'..self.unitFrameBars[barID].windowName;

	-- anchor it
	WindowClearAnchors( barWindowName );
	WindowAddAnchor( barWindowName, barAnchor1.point, self:GetFrameName()..'Bar', barAnchor1.relativePoint, HealGridUtility.GetAbsAnchorOffset(barAnchor1.offsetX,parentWidth),
																											HealGridUtility.GetAbsAnchorOffset(barAnchor1.offsetY,parentHeight) );
	WindowAddAnchor( barWindowName, barAnchor2.point, self:GetFrameName()..'Bar', barAnchor2.relativePoint, HealGridUtility.GetAbsAnchorOffset(barAnchor2.offsetX,parentWidth),
																											HealGridUtility.GetAbsAnchorOffset(barAnchor2.offsetY,parentHeight) );

	-- growth and foreground (aka slider) dimensions
	WindowClearAnchors( barWindowName..'Foreground' );
	if ( barGrowth == 'BOTTOM_TOP' ) then
		WindowAddAnchor( barWindowName..'Foreground', 'BOTTOMLEFT', barWindowName, 'BOTTOMLEFT', 0, 0 );
	elseif ( barGrowth == 'TOP_BOTTOM' ) then
		WindowAddAnchor( barWindowName..'Foreground', 'TOPLEFT', barWindowName, 'TOPLEFT', 0, 0 );
	elseif ( barGrowth == 'LEFT_RIGHT' ) then
		WindowAddAnchor( barWindowName..'Foreground', 'BOTTOMLEFT', barWindowName, 'BOTTOMLEFT', 0, 0 );
	elseif ( barGrowth == 'RIGHT_LEFT' ) then
		WindowAddAnchor( barWindowName..'Foreground', 'BOTTOMRIGHT', barWindowName, 'BOTTOMRIGHT', 0, 0 );
	end

	px,py = WindowGetDimensions( barWindowName );
	px = math.floor( px + 0.5 );
	py = math.floor( py + 0.5 );
	WindowSetDimensions( barWindowName..'Foreground', px, py );

	-- foreground settings : HEALTHCOLOR / CLASSCOLOR / CONCOLOR / HIDDEN / {COLOR}
	WindowSetShowing( barWindowName..'Foreground', barForegroundIsVisible );

	HealGridUtility.DynamicImageSetTexture( barWindowName..'Foreground', barForegroundTexture,  barForegroundStyle );

	if ( RMetColor[barForegroundColor] ) then
		HealGridUtility.WindowSetTintColor( barWindowName..'Foreground', barForegroundColor );
	end

	-- background settings : HEALTHCOLOR / CLASSCOLOR / CONCOLOR / HIDDEN / {COLOR}
	WindowSetShowing( barWindowName..'Background', barBackgroundIsVisible );

	HealGridUtility.DynamicImageSetTexture( barWindowName..'Background', barBackgroundTexture,  barBackgroundStyle );

	if ( RMetColor[barBackgroundColor] ) then
		HealGridUtility.WindowSetTintColor( barWindowName..'Background', barBackgroundColor );
	end
		
	-- visibility
	if ( barIsToggleable == false ) then
		isVisible = barIsVisible;
	elseif ( self:GetUnitFrameBarVisibility(barID) == 'SHOW' ) then
		isVisible = true;
	elseif ( self:GetUnitFrameBarVisibility(barID) == 'HIDE' ) then
		isVisible = false;
	else
		isVisible = barIsVisible;
	end

	WindowSetShowing( barWindowName, isVisible );

	-- fill the 'cache'
	self.unitFrameBars[barID].w = px;
	self.unitFrameBars[barID].h = py;
	self.unitFrameBars[barID].growth = barGrowth;
	self.unitFrameBars[barID].foregroundIsVisible = barForegroundIsVisible;
	self.unitFrameBars[barID].foregroundColor = barForegroundColor;
	self.unitFrameBars[barID].backgroundIsVisible = barBackgroundIsVisible;
	self.unitFrameBars[barID].backgroundColor = barBackgroundColor;
	self.unitFrameBars[barID].isVisible = isVisible;

end

function HealGridUnit:ApplySkin( skinID, skinSectionID )

	local anchorPoint, anchorRelativePoint, anchorX, anchorY, cliOffX, cliOffY;
	local petFrameHeight, petFrameBorderWidth, petFrameBorderWidth, petFrameLabelCenterFont;
	local scale = 1;
	local frameWidth,frameHeight,totalFrameWidth,totalFrameHeight = self:Grid():UnitFrameGetSize( skinID );
	local frameBorderWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'borderWidth' );
	local frameBorderHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'borderHeight' );
	local frameBackgroundColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'background', 'color' );
	local frameBackgroundTexture = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'background', 'texture' );
	local frameBackgroundStyle = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'background', 'style' );
	local careerLineIconScale = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'careerLineIcon', 'scale' );
	local careerLineIconAlpha = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'careerLineIcon', 'alpha' );
	local careerLineIconPosition = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'careerLineIcon', 'position' );
	local careerLineIconPaddingX = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'careerLineIcon', 'paddingX' );
	local careerLineIconPaddingY = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'unitFrame', 'careerLineIcon', 'paddingY' );

	-- --- (re)anchor cell (e.g. new widht, height, ...)
	self:AnchorCell( skinID );

	-- --- unit frame and background
	WindowSetDimensions( self:GetFrameName(), frameWidth, frameHeight );
	self:SetAnchor( self:GetFrameName()..'Background', 'topleft', self:GetFrameName(), 'topleft', frameBorderWidth, frameBorderHeight,
                                           'bottomright', self:GetFrameName(), 'bottomright', frameBorderWidth*-1, frameBorderHeight*-1 );

	-- --- frame background
	HealGridUtility.DynamicImageSetTexture( self:GetFrameName()..'Background', frameBackgroundTexture,  frameBackgroundStyle );

	if ( RMetColor[frameBackgroundColor] ) then
		HealGridUtility.WindowSetTintColor( self:GetFrameName()..'Background', frameBackgroundColor );
	else
		HealGridUtility.WindowSetTintColor( self:GetFrameName()..'Background', 'BLACK' );
	end
	self.unitFrameBackgroundColor = frameBackgroundColor;

	self:UpdateFrameBackground( true );

	-- --- the bars (healthPoints / actionPoints / moraleLevel );
	WindowClearAnchors( self:GetFrameName()..'Bar' );																			-- adapt to FrameBackground ...
	WindowAddAnchor( self:GetFrameName()..'Bar', 'TOPLEFT', self:GetFrameName()..'Background', 'TOPLEFT', 0, 0 );				-- force the update of the ...
	WindowAddAnchor( self:GetFrameName()..'Bar', 'BOTTOMRIGHT', self:GetFrameName()..'Background', 'BOTTOMRIGHT', 0, 0 );		-- dimensions

	self:ApplySkinBar( skinID, skinSectionID, 'healthPointsBar', frameWidth-frameBorderWidth*2, frameHeight-frameBorderHeight*2 );
	self:ApplySkinBar( skinID, skinSectionID, 'actionPointsBar', frameWidth-frameBorderWidth*2, frameHeight-frameBorderHeight*2 );
	self:ApplySkinBar( skinID, skinSectionID, 'moraleLevelBar', frameWidth-frameBorderWidth*2, frameHeight-frameBorderHeight*2 );

	self:UpdateBar( 'healthPointsBar', self:HitPointsPercent() or 0, true );
	self:UpdateBar( 'actionPointsBar', self:ActionPointsPercent() or 0, true );
	self:UpdateBar( 'moraleLevelBar', self:MoraleLevel() or 0, true );

	-- --- placeholder (if any)
	if ( self:GetPlaceholderFrameName() ) then
		WindowSetDimensions( self:GetPlaceholderFrameName(), frameWidth, frameHeight );
		self:SetAnchor( self:GetPlaceholderFrameName()..'Background', 
                                          'topleft', self:GetPlaceholderFrameName(), 'topleft', frameBorderWidth, frameBorderHeight,
                                          'bottomright', self:GetPlaceholderFrameName(), 'bottomright', frameBorderWidth*-1, frameBorderHeight*-1 );
	end

	-- --- pet (if any)
	if ( self:GetPetFrameName() ) then
		petFrameHeight = self:Grid():PetFrameGetHeight( skinID );
		petFrameBorderWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'petFrame', 'borderWidth' );
		petFrameBorderHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'petFrame', 'borderHeight' );
		petFrameLabelCenterFont = HealGridSkin.GetSkinValue( skinID, skinSectionID, 'petFrame', 'labelCenter', 'font' );

		WindowSetDimensions( self:GetPetFrameName(), frameWidth, petFrameHeight );
		self:SetAnchor( self:GetPetFrameName(), 'bottomleft', self:GetFrameName(), 'topleft', 0, 0 );

		self:SetAnchor( self:GetPetFrameName()..'Background', 
                                          'topleft', self:GetPetFrameName(), 'topleft', petFrameBorderWidth, petFrameBorderHeight,
                                          'bottomright', self:GetPetFrameName(), 'bottomright', petFrameBorderWidth*-1, petFrameBorderHeight*-1 );
		
    	LabelSetFont( self:GetPetFrameName().."LabelCenter", petFrameLabelCenterFont, 10 );
	end

	-- --- the career line icon
   	WindowSetAlpha( self:GetFrameName()..'IconCareerLine', math.max(careerLineIconAlpha,1)/100 );

	scale = math.min( frameWidth - (frameBorderWidth*2), frameHeight - (frameBorderHeight*2) );				-- width or height?
	scale = scale * careerLineIconScale / 100;																-- fill to 80% (or whatever the skin says)
	scale = WindowGetScale( self:GetFrameName() ) * scale / 32;												-- calculate scale factor, consider parent scale
   	WindowSetScale( self:GetFrameName()..'IconCareerLine', scale );

	cliOffX = HealGridUtility.GetAbsAnchorOffset( careerLineIconPaddingX, frameWidth-frameBorderWidth*2 );
	cliOffY = HealGridUtility.GetAbsAnchorOffset( careerLineIconPaddingY, frameHeight-frameBorderHeight*2 );

	WindowClearAnchors( self:GetFrameName()..'IconCareerLine' );
	WindowAddAnchor( self:GetFrameName()..'IconCareerLine', careerLineIconPosition, self:GetFrameName()..'Background', careerLineIconPosition, cliOffX, cliOffY );

	-- --- the buff track labels geometry (not label content)
	self:ApplySkinSpellTrackLabels( skinID, skinSectionID, 'unitFrame', frameWidth, frameBorderWidth );

	-- --- the labels
	self:ApplySkinLabels( skinID, skinSectionID, 'unitFrame', frameWidth-frameBorderWidth*2, frameHeight-frameBorderHeight*2 );
	
end

function HealGridUnit:SetAnchor( frameName, point, relativeTo, relativePoint, x, y, point2, relativeTo2, relativePoint2, x2, y2 )

	point = (point or 'topleft');
	relativeTo = (relativeTo or self:GetParentFrameName());
	relativePoint = (relativePoint or 'topleft');
	x = (x or 0);
	y = (y or 0);

	WindowClearAnchors( frameName );
	WindowAddAnchor( frameName, point, relativeTo, relativePoint, x, y );

	if ( point2 ~= nil or relative2 ~= nil or relativePonit2 ~= nil or x2 ~= nil or y2 ~= nil ) then
		point2 = (point2 or 'topleft');
		relativeTo2 = (relativeTo2 or self:GetParentFrameName());
		relativePoint2 = (relativePoint2 or 'topleft');
		x2 = (x2 or 0);
		y2 = (y2 or 0);

		WindowAddAnchor( frameName, point2, relativeTo2, relativePoint2, x2, y2 );
	end 

end

-- ===========================================================================================================================
-- Visibility
-- ===========================================================================================================================

function HealGridUnit:IsHidden()

	return( self.isHidden );

end

function HealGridUnit:IsUnitVisible()

  return( self.isUnitVisible );

end

function HealGridUnit:IsPetVisible()

  return( self.isPetVisible );

end

function HealGridUnit:Hide()

	if ( self:IsHidden() ) then
		return;
	end

	WindowSetShowing( self:GetFrameName(), false );

	if ( self:GetPlaceholderFrameName() ) then
		WindowSetShowing( self:GetPlaceholderFrameName(), false );
	end

	if ( self:GetPetFrameName() and DoesWindowExist(self:GetPetFrameName()) ) then
		WindowSetShowing( self:GetPetFrameName(), false );
	end

	self.isHidden = true;

end

function HealGridUnit:UpdateVisibility()

	local unitExists = self:UnitExists();
	local petExists = self:PetExists();

	-- ----- unit
	if ( unitExists and ((not self:IsUnitVisible()) or self:IsHidden()) ) then						-- show cell
		WindowSetShowing( self:GetFrameName(), true );
		if ( self:GetPlaceholderFrameName() ) then
			WindowSetShowing( self:GetPlaceholderFrameName(), false );
		end
		self.isUnitVisible = true;
		self.isHidden = false;
	elseif ( (not unitExists) and (self:IsUnitVisible() or self:IsHidden()) ) then					-- hide cell
		WindowSetShowing( self:GetFrameName(), false );
		if ( self:GetPlaceholderFrameName() ) then
			WindowSetShowing( self:GetPlaceholderFrameName(), true );
		end
		self.isUnitVisible = false;
		self.isHidden = false;
	end

	-- ----- pet
	if ( self:GetPetFrameName() ) then
		if ( self:ShowPet() ) then
			if ( petExists and unitExists and self:IsUnitVisible() and (not self:IsHidden()) and (not self:IsPetVisible()) ) then
				WindowSetShowing( self:GetPetFrameName(), true );
				self.isPetVisible = true;
			elseif ( ((not unitExists) or (not petExists) or (not self:IsUnitVisible()) or (self:IsHidden())) and self:IsPetVisible() ) then
				WindowSetShowing( self:GetPetFrameName(), false );
				self.isPetVisible = false;
			end
		elseif ( WindowGetShowing(self:GetPetFrameName()) ) then
			WindowSetShowing( self:GetPetFrameName(), false );
			self.isPetVisible = false;
		end
	end

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnit:HitPoints()

	return( 0 );

end

function HealGridUnit:HitPointsMax()

	return( 0 );

end

function HealGridUnit:HitPointsPercent()

	return( 0 );

end

function HealGridUnit:PetHitPointsPercent()

	return( 0 );

end

function HealGridUnit:HitPointsPercentString( hpPerc )

	if ( hpPerc <= 0 ) then
		if ( self:IsFar() ) then
			return( L'FAR' );
		elseif ( self:IsDead() ) then
			return( L'DEAD' );
		end
	end

	return( wstring.format(L"%d",hpPerc) );

end

function HealGridUnit:HealthStatus( hpPerc )

	if ( hpPerc == 100 ) then
		return( 'healthy' );
	elseif ( hpPerc >= 80 ) then
		return( 'fair' );
	elseif ( hpPerc >= 60 ) then
		return( 'hurt' );
	elseif ( hpPerc >= 40 ) then
		return( 'wounded' );
	elseif ( hpPerc >= 20 ) then
		return( 'poor' );
	elseif ( hpPerc > 0 ) then
		return( 'critic' );
	elseif ( self:IsDead() ) then
		return( 'dead' );
	else
		return( 'critic' );
	end

end

-- private
function HealGridUnit:UpdateBarColor( barID, layer, windowName, forceRedraw )

	local healthStatus, careerLine;
	local visibilityKey = layer..'IsVisible';
	local colorKey = layer..'Color';
	local statusKey = layer..'Status';

	if ( self.unitFrameBars[barID][visibilityKey] == false ) then
		-- nop
	else
		self.unitFrameBars[barID][statusKey] = HealGridUtility.SetColorPlus( windowName, self, self.unitFrameBars[barID][colorKey], self.unitFrameBars[barID][statusKey], 'window', forceRedraw );
	end

end

function HealGridUnit:UpdateBar( barID, value, forceRedraw )

	local unitIsDead = self:IsDead();
	local resizeBar = false;
	local barWindowName = self:GetFrameName()..'Bar'..self.unitFrameBars[barID].windowName;

	-- not visible, bail out again
	if ( self.unitFrameBars[barID].isVisible == false ) then
		return;
	end

	-- ----- depleting bar (slider) -------------------------------------------
	if ( forceRedraw ) then
		resizeBar = true;
	elseif ( unitIsDead and self.unitFrameBars[barID].prevValue == -1 ) then
		resizeBar = false;
	elseif ( value == self.unitFrameBars[barID].prevValue and (not unitIsDead) ) then
		resizeBar = false;
	else
		resizeBar = true;
	end

	if ( resizeBar ) then
		if ( value >= self.unitFrameBars[barID].maxValue ) then
			WindowSetDimensions( barWindowName..'Foreground', self.unitFrameBars[barID].w, self.unitFrameBars[barID].h );
		elseif ( self.unitFrameBars[barID].growth == 'BOTTOM_TOP' or self.unitFrameBars[barID].growth == 'TOP_BOTTOM' ) then
			WindowSetDimensions( barWindowName..'Foreground', self.unitFrameBars[barID].w, math.floor(self.unitFrameBars[barID].h*value/self.unitFrameBars[barID].maxValue) );
		else
			WindowSetDimensions( barWindowName..'Foreground', math.floor(self.unitFrameBars[barID].w*value/self.unitFrameBars[barID].maxValue), self.unitFrameBars[barID].h );
		end
	end

	if ( unitIsDead ) then
		self.unitFrameBars[barID].prevValue = -1;
	else
		self.unitFrameBars[barID].prevValue = value;
	end

	-- ----- update colors of background and foreground (aka slider)
	self:UpdateBarColor( barID, 'background', barWindowName.."Background", forceRedraw );
	self:UpdateBarColor( barID, 'foreground', barWindowName.."Foreground", forceRedraw );

end

function HealGridUnit:UpdateFrameBackground( forceRedraw )

	local healthStatus, careerLine, mx, my;
	local unitIsDead = self:IsDead();
	local hpPerc = (self:HitPointsPercent() or 0);

	-- ----- background -------------------------------------------------------
	self.unitFrameBackgroundCache = HealGridUtility.SetColorPlus( self:GetFrameName().."Background", self, self.unitFrameBackgroundColor, self.unitFrameBackgroundCache, 'window', forceRedraw );

end

function HealGridUnit:UpdatePetHitPoints( forceRedraw )

	local healthStatus;
	local unitIsDead = self:PetIsDead();
	local hpPerc = self:PetHitPointsPercent();

	if ( not self:IsPetVisible() ) then
		self.petLastHitPointsPercent = -2;
		return;
	end

	if ( forceRedraw ) then
		-- nop;
	elseif ( unitIsDead and self.petLastHitPointsPercent == -1 ) then
		return;
	elseif ( hpPerc == self.petLastHitPointsPercent ) then
		return;
	end

	if ( unitIsDead ) then
		self.petLastHitPointsPercent = -1;
	else
		self.petLastHitPointsPercent = hpPerc;
	end

	LabelSetText( self:GetPetFrameName()..'LabelCenter', wstring.format(L"%d",hpPerc) );

	healthStatus = self:HealthStatus( hpPerc );
	if ( healthStatus ~= self.petHealthFrameBackground or forceRedraw ) then
		HealGridUtility.WindowSetTintColor( self:GetPetFrameName().."Background", HealGridGlobals.healthColor[healthStatus] );
		self.petHealthFrameBackground = healthStatus;
	end

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnit:ActionPoints()

	return( 0 );

end

function HealGridUnit:ActionPointsMax()

	return( 0 );

end

function HealGridUnit:ActionPointsPercent()

	return( 0 );

end

function HealGridUnit:ActionPointsPercentString( apPerc )

--	if ( apPerc <= 0 and self:IsFar() ) then
--		return( L'' );
--	end

	return( wstring.format(L"%d",apPerc) );

end

-- ===========================================================================================================================
-- Morale
-- ===========================================================================================================================

function HealGridUnit:Morale()

	return( 0 );

end

function HealGridUnit:MoraleLevel()

	return( 0 );

end

-- ===========================================================================================================================
-- Career Points
-- ===========================================================================================================================

function HealGridUnit:CareerPoints()

	return( 0 );

end

function HealGridUnit:CareerPointsMax()

	return( 0 );

end

-- ===========================================================================================================================
-- Labels
-- ===========================================================================================================================

function HealGridUnit:UpdateLabel( frameName, index )			-- final protected !

	local targetName;

	-- --- label is invisble ----------
	if ( self.labels[index].label == L"" ) then
		if ( self.labels[index].isVisible ) then
			WindowSetShowing( frameName, false );
		end 
	-- --- label is visble ------------
	else
		if ( not self.labels[index].isVisible ) then
			WindowSetShowing( frameName, false );
		end 
		LabelSetText( frameName, HealGridTags.Parse(self.labels[index],self) );

		if ( self:UnitIsFriend() ) then
			targetName = TargetInfo:UnitName( 'selffriendlytarget' );
		else
			targetName = TargetInfo:UnitName( 'selfhostiletarget' );
		end

		targetName = HealGridUtility.WStringChop( targetName );

		-- --- isTargeted ---
		if ( self.labels[index].isTargeted and targetName ~= nil and targetName ~= "" and targetName == self:GetRealUnitName() ) then
			if ( self.labels[index].cache ~= 'IS_TARGETED' ) then
				HealGridUtility.LabelSetTextColor( frameName, 'BLUE' );
				self.labels[index].cache = 'IS_TARGETED';
			end
		-- --- inAvatarGroup ---
		elseif ( self.labels[index].inAvatarGroup and self:IsInAvatarGroup() and self:GetUnitType() ~= 'group' and self:GetUnitType() ~= 'groupplayer' ) then
			if ( self.labels[index].cache ~= 'IN_AVATAR_GROUP' ) then
				HealGridUtility.LabelSetTextColor( frameName, 'SKY_BLUE' );
				self.labels[index].cache = 'IN_AVATAR_GROUP';
			end
		-- --- set the label color+ ---
		else
			self.labels[index].cache = HealGridUtility.SetColorPlus( frameName, self, self.labels[index].color, self.labels[index].cache, 'label', false );
		end
	end

end

function HealGridUnit:UpdateLabels()

	self:UpdateLabelTopLeft();
	self:UpdateLabelTop();
	self:UpdateLabelTopRight();

	self:UpdateLabelLeft();
	self:UpdateLabelCenter();
	self:UpdateLabelRight();

	self:UpdateLabelBottomLeft();
	self:UpdateLabelBottom();
	self:UpdateLabelBottomRight();

end

function HealGridUnit:UpdateLabelTopLeft()

	self:UpdateLabel( self:GetFrameName().."LabelTopLeft", 'TOPLEFT' );

end

function HealGridUnit:UpdateLabelTop()

	self:UpdateLabel( self:GetFrameName().."LabelTop", 'TOP' );

end

function HealGridUnit:UpdateLabelTopRight()

	self:UpdateLabel( self:GetFrameName().."LabelTopRight", 'TOPRIGHT' );

end

function HealGridUnit:UpdateLabelLeft()

	self:UpdateLabel( self:GetFrameName().."LabelLeft", 'LEFT' );

end

function HealGridUnit:UpdateLabelCenter()

	self:UpdateLabel( self:GetFrameName().."LabelCenter", 'CENTER' );

end

function HealGridUnit:UpdateLabelRight()

	self:UpdateLabel( self:GetFrameName().."LabelRight", 'RIGHT' );

end

function HealGridUnit:UpdateLabelBottomLeft()

	self:UpdateLabel( self:GetFrameName().."LabelBottomLeft", 'BOTTOMLEFT' );

end

function HealGridUnit:UpdateLabelBottom()

	self:UpdateLabel( self:GetFrameName().."LabelBottom", 'BOTTOM' );

end

function HealGridUnit:UpdateLabelBottomRight()

	self:UpdateLabel( self:GetFrameName().."LabelBottomRight", 'BOTTOMRIGHT' );

end

function HealGridUnit:UpdateLabelBuffFlags()

	local sign, color, backgroundColor, buffTrackEntry;

	self.spellTrack1Label:WipeText();
	self.spellTrack2Label:WipeText();

	for k,_ in pairs(self.trackedBuffs) do
		buffTrackEntry = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k];

		if ( self.trackedBuffs[k].selfCast ) then
			if ( self.trackedBuffs[k].selfDuration < buffTrackEntry.warnExpire ) then
				sign = buffTrackEntry.warnExpireSign;
			else
				sign = buffTrackEntry.sign;
			end
			if ( self.trackedBuffs[k].selfStackCount < buffTrackEntry.castSelfStackCount ) then
				color = buffTrackEntry.castSelfSignColor;
				backgroundColor = buffTrackEntry.castSelfBackgroundColor;
			else
				color = buffTrackEntry.castSelfMultipleSignColor;
				backgroundColor = buffTrackEntry.castSelfMultipleBackgroundColor;
			end
			if ( buffTrackEntry.labelIndex == 1 ) then
				self.spellTrack1Label:AddText( sign, color, backgroundColor );
			else
				self.spellTrack2Label:AddText( sign, color, backgroundColor );
			end
		end

		if ( self.trackedBuffs[k].otherCast ) then
			if ( self.trackedBuffs[k].otherDuration < buffTrackEntry.warnExpire ) then
				sign = buffTrackEntry.warnExpireSign;
			else
				sign = buffTrackEntry.sign;
			end
			if ( self.trackedBuffs[k].otherAggregateCount < buffTrackEntry.castOtherAggregateCount ) then
				color = buffTrackEntry.castOtherSignColor;
				backgroundColor = buffTrackEntry.castOtherBackgroundColor;
			else
				color = buffTrackEntry.castOtherMultipleSignColor;
				backgroundColor = buffTrackEntry.castOtherMultipleBackgroundColor;
			end
			if ( buffTrackEntry.labelIndex == 1 ) then
				self.spellTrack1Label:AddText( sign, color, backgroundColor );
			else
				self.spellTrack2Label:AddText( sign, color, backgroundColor );
			end
		end

	end

	self.spellTrack1Label:Display();
	self.spellTrack2Label:Display();

end

function HealGridUnit:UpdateLabelDebuffFlags()

	self:SetLabelDebuffFlags();

end

function HealGridUnit:UpdateIconCareerLine()

	local icon, x, y, scale;
	local careerLine = self:GetCareerLine();

	if ( careerLine == 0 or (not self:IsCareerLineIconVisible()) ) then
		WindowSetShowing( self:GetFrameName()..'IconCareerLine', false );
	else
		icon,x,y = GetIconData( Icons.GetCareerIconIDFromCareerLine(careerLine) );
		DynamicImageSetTexture( self:GetFrameName()..'IconCareerLine', icon, x, y );
		
		WindowSetShowing( self:GetFrameName()..'IconCareerLine', true );
	end

end

-- ===========================================================================================================================
-- Label helpers
-- ===========================================================================================================================

function HealGridUnit:SetLabelDebuffFlags()

	local frameName = self:GetFrameName().."LabelDebuffFlags";

	if ( self:ShouldShowDebuffFlags() ) then
		WindowSetShowing( frameName, true );
	
		for k,v in pairs(self.debuffFlagData) do
			if ( v.active and self:ShouldShowDebuffFlag(k) ) then
				WindowSetShowing( frameName..k, true );
				if ( v.expires < 5 ) then
					HealGridUtility.WindowSetTintColor( frameName..k.."Border", 'BLACK' );
				else
					HealGridUtility.WindowSetTintColor( frameName..k.."Border", 'WHITE' );
				end
			else
				WindowSetShowing( frameName..k, false );
			end
		end
	else
		WindowSetShowing( frameName, false );
	end

end

-- ===========================================================================================================================
-- Buffs / Debuffs
-- ===========================================================================================================================

function HealGridUnit:BuffTargetType()

	return( -1 );

end

function HealGridUnit:CanTrackBuffs()

	return( self:BuffTargetType() ~= -1 );

end

function HealGridUnit:ShouldShowDebuffFlags()

	return( true );

end

function HealGridUnit:ShouldShowDebuffFlag( flag )

	return( true );

end

-- order: reliability before accuracy !!! (better delayed data than no data at all)
-- returns: unitObj, delayedBuffInitializtion (true/false)
function HealGridUnit:BuffGetMasterUnit()

	return nil, false;

end

function HealGridUnit:UpdateBuffs( timePassed )

	local i, n;
	local buffName, trackedBuffsIndex;
	local unitToScan = nil;
	local wipeCache = false;
	local delayedBuffInitialization = false;

	-- scan "myself" or need a "master unit"
	if ( self:CanTrackBuffs() ) then
		unitToScan = self;
		delayedBuffInitialization = false;
	else
		unitToScan,delayedBuffInitialization = self:BuffGetMasterUnit();		-- can be NIL !!!!!!!!
	end

	-- wipe/update cache (if required)
	if ( self:HasUnitChanged() ) then											-- unit changed -> wipe cache
		wipeCache = true;
	elseif ( unitToScan ~= nil ) then											-- have a valid unit to get buffs -> wipe cache
		if ( delayedBuffInitialization ) then													-- delayed buff initialization on unit? (e.g. target)
			if ( self.cachedBuffGracePeriod <= 0 and self.buffLastScanHadUnit == true ) then
				wipeCache = true;
			elseif ( #GetBuffs(unitToScan:BuffTargetType()) > 0 ) then						
				wipeCache = true;
				self.cachedBuffGracePeriod = -999;												-- force entry above and to NOT check buffs
			elseif ( self.buffLastScanHadUnit == false ) then
				self.cachedBuffGracePeriod = HealGridUnit.CACHED_BUFF_GRACE_PERIOD;
				wipeCache = false;
			else																	
				self.cachedBuffGracePeriod = self.cachedBuffGracePeriod - timePassed;
				wipeCache = ( self.cachedBuffGracePeriod < 0 );
			end
		else																					-- no delayed buff init
			wipeCache = true;																		-- wipe buffs
		end
	elseif ( unitToScan == nil ) then											-- do not have a unit to scan
		wipeCache = false;															-- so dont wipe cache
	end

	for i,_ in pairs(self.cachedBuffData) do
		self.cachedBuffData[i].duration = self.cachedBuffData[i].duration - timePassed;
		if ( wipeCache or self.cachedBuffData[i].duration < 0 ) then					-- expired or wipe whole cache
			self.cachedBuffData[i] = nil;
		end
	end

	-- initialize the data
	for k,_ in pairs(self.debuffFlagData) do
		self.debuffFlagData[k].active = false;
		self.debuffFlagData[k].expires = 0;
	end

	for k,_ in pairs(self.trackedBuffs) do 
		self.trackedBuffs[k] = nil;
	end

	-- cache the buffs
	if ( unitToScan and wipeCache ) then
		HealGridUtility.CloneTable( GetBuffs(unitToScan:BuffTargetType()), self.cachedBuffData );
	end

	for k,v in pairs(self.cachedBuffData) do																-- TODO: sort this !!!!!!!!!!! (REALLY????)

		-- buff tracking
		buffName = HealGridUtility.WStringChop( v.name );
		trackedBuffsIndex = HealGridBuffTrack.trackedBuffsByName[buffName];
		if ( trackedBuffsIndex ~= nil and HealGridBuffTrack.ShouldTrack(trackedBuffsIndex,self,v.castByPlayer) ) then
			-- not known, create new entry
			if ( not self.trackedBuffs[trackedBuffsIndex] ) then
				self.trackedBuffs[trackedBuffsIndex] = {selfCast=false,selfDuration=0,selfAggregateCount=0,selfStackCount=0,
			                                        	otherCast=false,otherDuration=0,otherAggregateCount=0,otherStackCount=0};
			end

			-- set/update the data
			if ( v.castByPlayer ) then
				self.trackedBuffs[trackedBuffsIndex].selfCast = true;
				self.trackedBuffs[trackedBuffsIndex].selfDuration = math.max( self.trackedBuffs[trackedBuffsIndex].selfDuration, v.duration );
				self.trackedBuffs[trackedBuffsIndex].selfAggregateCount = self.trackedBuffs[trackedBuffsIndex].selfAggregateCount + 1;
				self.trackedBuffs[trackedBuffsIndex].selfStackCount = self.trackedBuffs[trackedBuffsIndex].selfStackCount + math.max( v.stackCount, 1 );
			else
				self.trackedBuffs[trackedBuffsIndex].otherCast = true;
				self.trackedBuffs[trackedBuffsIndex].otherDuration = math.max( self.trackedBuffs[trackedBuffsIndex].otherDuration, v.duration );
				self.trackedBuffs[trackedBuffsIndex].otherAggregateCount = self.trackedBuffs[trackedBuffsIndex].otherAggregateCount + 1;
				self.trackedBuffs[trackedBuffsIndex].otherStackCount = self.trackedBuffs[trackedBuffsIndex].otherStackCount + math.max( v.stackCount, 1 );
			end
		end

		-- debuff flags
		if ( HealGridUtility.GetBuffDebuffNeutral(v) ) then
			if ( v.isHex ~= nil and v.isHex == true ) then
				self.debuffFlagData.HEX.active = true;
				self.debuffFlagData.HEX.expires = math.max( self.debuffFlagData.HEX.expires, v.duration );
			end
			if ( v.isDamaging ~= nil and v.isDamaging == true ) then
				self.debuffFlagData.DAMAGING.active = true;
				self.debuffFlagData.DAMAGING.expires = math.max( self.debuffFlagData.DAMAGING.expires, v.duration );
			end
			if ( v.isDebuff ~= nil and v.isDebuff == true ) then
				self.debuffFlagData.DEBUFF.active = true;
				self.debuffFlagData.DEBUFF.expires = math.max( self.debuffFlagData.DEBUFF.expires, v.duration );
			end
			if ( v.isAilment ~= nil and v.isAilment == true ) then
				self.debuffFlagData.AILMENT.active = true;
				self.debuffFlagData.AILMENT.expires = math.max( self.debuffFlagData.AILMENT.expires, v.duration );
			end
			if ( v.isCurse ~= nil and v.isCurse == true ) then
				self.debuffFlagData.CURSE.active = true;
				self.debuffFlagData.CURSE.expires = math.max( self.debuffFlagData.CURSE.expires, v.duration );
			end
			if ( v.isCripple ~= nil and v.isCripple == true ) then
				self.debuffFlagData.CRIPPLE.active = true;
				self.debuffFlagData.CRIPPLE.expires = math.max( self.debuffFlagData.CRIPPLE.expires, v.duration );
			end
		end
	end

	self.buffLastScanHadUnit = (unitToScan ~= nil);

end

function HealGridUnit:HasDebuffFlag( debuffFlag )

	return( self.debuffFlagData[debuffFlag].active );

end

function HealGridUnit:ClearBuffCache()

	for k,_ in pairs(self.cachedBuffData) do
		self.cachedBuffData[k] = nil;
	end

end

-- ===========================================================================================================================
-- (Pending) Targeting
-- ===========================================================================================================================

function HealGridUnit:SetPendingTarget()

	local targetName = TargetInfo:UnitName( 'selffriendlytarget' );

	if ( targetName ~= nil and targetName ~= L"" ) then
		targetName = HealGridUtility.WStringChop( targetName );
	else
		targetName = L"";
	end

	if ( self:GetRealUnitName() ~= targetName ) then
		self.isPendingTarget = true;
	end

end

function HealGridUnit:ClearPendingTarget()

	self.isPendingTarget = false;

end

function HealGridUnit:IsPendingTarget()

	return( self.isPendingTarget );

end

-- ===========================================================================================================================
-- Range
-- NOTE: time passed can be 0 !!!
-- ===========================================================================================================================

function HealGridUnit:UpdateRange( timePassed )

	local valid, selected;
	local colorFade = 'COLOR_HARD';

	-- calculate range
	if ( HealGrid.SettingGet('rangeScanStatus') == false ) then
		self.rangeScanTimePassed = 0;
		self.rangeScanType = 'UNIT_UNKNOWN_RANGE';
	elseif ( self:UnitIsFriend() and HealGrid.SettingGet('rangeScanFriendlyAbility') == 0 ) then
		self.rangeScanTimePassed = 0;
		self.rangeScanType = 'UNIT_UNKNOWN_RANGE';
	elseif ( self:UnitIsHostile() and HealGrid.SettingGet('rangeScanHostileAbility') == 0 ) then
		self.rangeScanTimePassed = 0;
		self.rangeScanType = 'UNIT_UNKNOWN_RANGE';
	elseif ( self:IsDead() and (self:UnitIsHostile() or HealGrid.SettingGet('rangeScanResurrectAbility') == 0) ) then
		self.rangeScanTimePassed = 0;
		self.rangeScanType = 'UNIT_UNKNOWN_RANGE';
	elseif ( self:HasUnitChanged() ) then
		self.rangeScanTimePassed = 0;
		self.rangeScanType = 'UNIT_UNKNOWN_RANGE';
	elseif ( self:IsPendingTarget() and HealGrid.SettingGet('rangeScanFriendlyAbility') == 0 ) then						-- only if not ability, otherwise use check below (much faster!)
		if ( HealGridUtility.WStringChop(TargetInfo:UnitName('selffriendlytarget')) ~= self:GetRealUnitName() ) then
			self.rangeScanTimePassed = 0;
			self.rangeScanType = 'UNIT_OUT_OF_REACH';
		else
			-- nop: leave status and timers unchanged
		end
	else
		valid,selected = HealGrid.IsUnitInRange( self:GetUnitName(), self:UnitIsFriend(), self:IsDead() );

		if ( selected and valid ) then
			self.rangeScanTimePassed = 0;
			self.rangeScanType = 'UNIT_IN_RANGE';
		elseif ( selected and (not valid) ) then
			self.rangeScanTimePassed = 0;
			self.rangeScanType = 'UNIT_OUT_OF_RANGE';
		elseif ( (not selected) and valid ) then
			self.rangeScanTimePassed = 0;
			self.rangeScanType = 'UNIT_IN_RANGE';
		elseif ( (not selected) and (not valid) ) then
			if ( self:IsPendingTarget() ) then
				self.rangeScanTimePassed = 0;
				self.rangeScanType = 'UNIT_OUT_OF_REACH';
			else
				-- nop: leave status and timers unchanged
			end
		end
	end

	-- update faders
	if ( self.rangeScanType == 'UNIT_UNKNOWN_RANGE' ) then
		colorFade = 'COLOR_HARD';
	else
		self.rangeScanTimePassed = self.rangeScanTimePassed + timePassed;
		if ( self.rangeScanTimePassed > HealGrid.SettingGet('rangeScanData')[self.rangeScanType].TIME_FADE ) then
			colorFade = 'COLOR_HARD';
			self.rangeScanType = 'UNIT_UNKNOWN_RANGE';
		elseif ( self.rangeScanTimePassed > HealGrid.SettingGet('rangeScanData')[self.rangeScanType].TIME_PALE ) then
			colorFade = 'COLOR_SOFT';
		else
			colorFade = 'COLOR_HARD';
		end
	end

	-- color the border
	HealGridUtility.WindowSetTintColor( self:GetFrameName().."Border", HealGrid.SettingGet('rangeScanData')[self.rangeScanType][colorFade] );

end

function HealGridUnit:SetOutOfRange()

	local colorFade = 'COLOR_HARD';

	self.rangeScanTimePassed = 0;
	self.rangeScanType = 'UNIT_OUT_OF_RANGE';

	HealGridUtility.WindowSetTintColor( self:GetFrameName().."Border", HealGrid.SettingGet('rangeScanData')[self.rangeScanType][colorFade] );

end

-- ===========================================================================================================================
-- Tooltip
-- ===========================================================================================================================

function HealGridUnit:StartTooltip()

	self.tooltipShown = true;

end

function HealGridUnit:StopTooltip()
	
	self.tooltipShown = false;

end

function HealGridUnit:UpdateTooltip()

	if ( self:IsTooltipShown() and self:IsUnitVisible() ) then
		WindowSetShowing( self:GetFrameName(), false );
		WindowSetShowing( self:GetFrameName(), true );
	end

end

function HealGridUnit:IsTooltipShown()

	return( self.tooltipShown );

end

-- ===========================================================================================================================
-- Assisting
-- ===========================================================================================================================

function HealGridUnit:AssistUnit()

	if ( self:UnitExists() ) then
	   
	end

end

-- ===========================================================================================================================
-- Show the dropdown menu on right click
-- ===========================================================================================================================

function HealGridUnit:ShowDropdownMenu()

	-- nop;

end

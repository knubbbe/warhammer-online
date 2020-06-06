-- ========================================================================================================
-- 
-- ========================================================================================================

HealGridHUD = HealGridGridFactory:New();

HealGridHUD.PLAYER          = 1;
HealGridHUD.PET             = 2;
HealGridHUD.FRIENDLY_TARGET = 3;
HealGridHUD.HOSTILE_TARGET  = 4;
HealGridHUD.PET_TARGET      = 5;

-- =====================================================================================================
-- New
-- =====================================================================================================

function HealGridHUD:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.templateName = (o.templateName or 'HG_HealGridHUDTemplate');

    t = HealGridGridFactory:New( o );

	t.actionPointBar = nil;										-- pointer to the actionPointBar
	t.careerBar = nil;											-- pointer to the careerBar
	t.moraleBar = nil;											-- pointer to the moraleBar
	t.castBar = nil;											-- pointer to the castBar

    setmetatable( t, self );
    self.__index = self;

    return( t );

end

-- ========================================================================================================
-- trivials
-- ========================================================================================================

function HealGridHUD:GetUpdateThrottle()

	return( HealGrid.SettingGet('hudUpdateThrottle') );

end

function HealGridHUD:GetBuffUpdateThrottle()

	return( HealGrid.SettingGet('hudBuffUpdateThrottle') );

end

function HealGridHUD:GetActionPointBar()

	return( self.actionPointBar );

end

function HealGridHUD:GetCareerBar()

	return( self.careerBar );

end

function HealGridHUD:GetMoraleBar()

	return( self.moraleBar );

end

function HealGridHUD:GetCastBar()

	return( self.castBar );

end

-- =====================================================================================================
-- Initialization
-- =====================================================================================================

function HealGridHUD:Initialize()

	HealGridGridFactory.Initialize( self );

	self.units[1] = {};

	self.units[1][HealGridHUD.PLAYER] = HealGridUnitPlayer:New( {groupIndex=1,memberIndex=HealGridHUD.PLAYER,
                                                                 parentFrameName=self:GetUnitContainerFrameName(),frameSuffix=self:GetUnitFrameSuffix()} );
	self.units[1][HealGridHUD.PET] = HealGridUnitPet:New( {groupIndex=1,memberIndex=HealGridHUD.PET,
                                                           parentFrameName=self:GetUnitContainerFrameName(),frameSuffix=self:GetUnitFrameSuffix()} );
	self.units[1][HealGridHUD.FRIENDLY_TARGET] = HealGridUnitFriendlyTarget:New( {groupIndex=1,memberIndex=HealGridHUD.FRIENDLY_TARGET,
                                                                                  parentFrameName=self:GetUnitContainerFrameName(),frameSuffix=self:GetUnitFrameSuffix()} );
	self.units[1][HealGridHUD.HOSTILE_TARGET] = HealGridUnitHostileTarget:New( {groupIndex=1,memberIndex=HealGridHUD.HOSTILE_TARGET,
                                                                                parentFrameName=self:GetUnitContainerFrameName(),frameSuffix=self:GetUnitFrameSuffix()} );
	self.units[1][HealGridHUD.PET_TARGET] = HealGridUnitPetTarget:New( {groupIndex=1,memberIndex=HealGridHUD.PET_TARGET,
                                                                        parentFrameName=self:GetUnitContainerFrameName(),frameSuffix=self:GetUnitFrameSuffix()} );

	self.units[1][HealGridHUD.PLAYER]:Initialize( self );
	self.units[1][HealGridHUD.PLAYER]:ApplySkin( HealGrid.SettingGet('hudSkin'), 'hud' );
	self.units[1][HealGridHUD.PET]:Initialize( self );
	self.units[1][HealGridHUD.PET]:ApplySkin( HealGrid.SettingGet('hudSkin'), 'hud' );
	self.units[1][HealGridHUD.FRIENDLY_TARGET]:Initialize( self );
	self.units[1][HealGridHUD.FRIENDLY_TARGET]:ApplySkin( HealGrid.SettingGet('hudSkin'), 'hud' );
	self.units[1][HealGridHUD.HOSTILE_TARGET]:Initialize( self );
	self.units[1][HealGridHUD.HOSTILE_TARGET]:ApplySkin( HealGrid.SettingGet('hudSkin'), 'hud' );
	self.units[1][HealGridHUD.PET_TARGET]:Initialize( self );
	self.units[1][HealGridHUD.PET_TARGET]:ApplySkin( HealGrid.SettingGet('hudSkin'), 'hud' );

	self.actionPointBar = HealGridActionPointBar:New( {frameSuffix=self:GetUnitFrameSuffix(),parentFrameName=self:GetFrameName()} );
	self.actionPointBar:Initialize( self );

	self.careerBar = HealGridCareerBar:New( {frameSuffix=self:GetUnitFrameSuffix(),parentFrameName=self:GetFrameName()} );
	self.careerBar:Initialize( self );

	self.moraleBar = HealGridMoraleBar:New( {frameSuffix=self:GetUnitFrameSuffix(),parentFrameName=self:GetFrameName()} );
	self.moraleBar:Initialize( self );

	self.castBar = HealGridCastBar:New( {frameSuffix=self:GetUnitFrameSuffix(),parentFrameName=self:GetFrameName()} );
	self.castBar:Initialize( self );

end

-- =====================================================================================================
-- Update handling
-- =====================================================================================================

function HealGridHUD:Update( timePassed )

	self.units[1][HealGridHUD.PLAYER]:UpdateBuffs( timePassed );
	self.units[1][HealGridHUD.PLAYER]:OnUpdate( timePassed );

	if ( HealGrid.SettingGet('hudShowPetFrames') ) then
		self.units[1][HealGridHUD.PET]:UpdateBuffs( timePassed );
		self.units[1][HealGridHUD.PET]:OnUpdate( timePassed );
	else
		self.units[1][HealGridHUD.PET]:Hide();
	end

	self.units[1][HealGridHUD.FRIENDLY_TARGET]:UpdateBuffs( timePassed );
	self.units[1][HealGridHUD.FRIENDLY_TARGET]:OnUpdate( timePassed );

	self.units[1][HealGridHUD.HOSTILE_TARGET]:UpdateBuffs( timePassed );
	self.units[1][HealGridHUD.HOSTILE_TARGET]:OnUpdate( timePassed );

	if ( HealGrid.SettingGet('hudShowPetFrames') ) then
		self.units[1][HealGridHUD.PET_TARGET]:UpdateBuffs( timePassed );
		self.units[1][HealGridHUD.PET_TARGET]:OnUpdate( timePassed );
	else
		self.units[1][HealGridHUD.PET_TARGET]:Hide();
	end

end

-- =====================================================================================
-- Sizing
-- =====================================================================================

function HealGridHUD:UnitFrameGetSize( skinID )

	local ufw, ufh;

	skinID = (skinID or self:GetSkinID());
    ufw = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'width' ) + HealGrid.SettingGet( 'hudUnitFrameWidthAdjust' );
    ufh = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'height' ) + HealGrid.SettingGet( 'hudUnitFrameHeightAdjust' );

	return ufw, ufh, ufw, ufh;

end

function HealGridHUD:UnitContainerGetSize( skinID )

	local ufw, ufh, tufw, tufh, numFrames;

	skinID = (skinID or self:GetSkinID());

	ufw,ufh,tufw,tufh = self:UnitFrameGetSize( skinID );

	if ( HealGrid.SettingGet('hudShowPetFrames') ) then
		numFrames = 5;
	else
		numFrames = 3;
	end

	if ( self:GetOrientation() == 'HORIZONTAL' ) then
		return tufw * numFrames,
				tufh;
	else
		return tufw,
				tufh * numFrames;
	end

end

function HealGridHUD:RootWindowGetSize( skinID )

	local skinActionPointFrameHeight, skinCareerFrameHeight, skinMoraleFrameHeight, skinCastFrameHeight, uw, uh, barHeight;

	skinID = (skinID or self:GetSkinID());

    skinActionPointFrameHeight = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'actionPointFrame', 'height' );
    skinCareerFrameHeight = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'careerFrame', 'height' );
    skinMoraleFrameHeight = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'moraleFrame', 'height' );
    skinCastFrameHeight = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'castFrame', 'height' );

	uw,uh = self:UnitContainerGetSize( skinID );

	if ( HealGrid.SettingGet('hudTwoLineBars') ) then
    	barHeight = math.max( skinActionPointFrameHeight, skinMoraleFrameHeight ) +  skinCastFrameHeight;
	else
    	barHeight = math.max( skinActionPointFrameHeight, skinMoraleFrameHeight, skinCastFrameHeight );
	end

    return uw, uh + barHeight,
           uw, uh,
		   0, 0;

end

-- =====================================================================================
-- Skinning
-- =====================================================================================

function HealGridHUD:GetSkinSectionID()

	return( 'hud' );

end

function HealGridHUD:ApplySkin( skinID )

	skinID = (skinID or self:GetSkinID());

	HealGridGridFactory.ApplySkin( self, skinID );

	-- the bars
	self.actionPointBar:ApplySkin( skinID, 'hud', nil, self );
	self.careerBar:ApplySkin( skinID, 'hud', nil, self );
	self.moraleBar:ApplySkin( skinID, 'hud', nil, self );
	self.castBar:ApplySkin( skinID, 'hud', nil, self );

end

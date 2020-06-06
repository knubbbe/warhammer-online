--[[

GameData.Player.Pet = {
	healthPercent (number),
	conType (number),
	movement (number),
	name (wstring),
	tier (number),
	Target = {	type (number),
				name (wstring),
				tier (number),
				level (number),
				healthPercent (number),
				conType (number),
			},
	level (number),
	objNum (number),
	stance (number)
}

]]

HealGridUnitPetTarget = HealGridUnitHUD:New();

function HealGridUnitPetTarget:New( o )

	o.unit = 'pettarget';
	o.frameName = 'HG_HealGrid_PetTarget_0_0';
	o.placeholderFrameName = 'HG_HealGrid_PetTargetPlaceholder_0_0';

	t = HealGridUnitHUD:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitPetTarget:GetUnitName()

	return( L"" );

end

function HealGridUnitPetTarget:GetUnitLevel()

	return( GameData.Player.Pet.Target.level or 0 );

end

function HealGridUnitPetTarget:GetCareerName()

	return( L"" );

end

function HealGridUnitPetTarget:GetTargetType()

	return( HealGridGlobals.UnitTargetType.NONE );

end

function HealGridUnitPetTarget:GetConType()

	return( HealGridGlobals.UnitConType.NO_LEVEL );

end

function HealGridUnitPetTarget:UnitExists()

	return( GameData.Player.Pet.Target ~= nil and GameData.Player.Pet.Target.level ~= 0 );

end

function HealGridUnitPetTarget:IsDead()

	if ( self:UnitExists() ) then
		return( GameData.Player.Pet.Target.healthPercent <= 0 );
	end

	return( true );

end

function HealGridUnitPetTarget:UnitIsFriend()

	return( false );

end

function HealGridUnitPetTarget:UnitIsHostile()

	return( true );

end

-- ===========================================================================================================================
-- Skinning / Layout
-- ===========================================================================================================================

function HealGridUnitPetTarget:GetGridPosX()

	if ( HealGrid.SettingGet('hudShowPetFrames') ) then
		return( HealGridUnitHUD.GetGridPosX(self) );
	else
		return( 1 );
	end

end

function HealGridUnitPetTarget:ApplySkinLabels( skinID, skinSectionID, skinSubSectionID, width, height )

	HealGridUnitHUD.ApplySkinLabels( self, skinID, skinSectionID, 'petTargetFrame', width, height );

end

function HealGridUnitPetTarget:ApplySkinSpellTrackLabels( skinID, skinSectionID, skinSubSectionID, frameWidth, frameBorderWidth )

	HealGridUnitHUD.ApplySkinSpellTrackLabels( self, skinID, skinSectionID, 'petTargetFrame', frameWidth, frameBorderWidth );

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitPetTarget:HitPoints()

	if ( self:UnitExists() ) then
		return( GameData.Player.Pet.Target.healthPercent );
	end

	return( 0 );

end

function HealGridUnitPetTarget:HitPointsMax()

	return( 100 );

end

function HealGridUnitPetTarget:HitPointsPercent()

	if ( self:UnitExists() ) then
		return( GameData.Player.Pet.Target.healthPercent );
	end

	return( 0 );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitPetTarget:ActionPoints()

	return( 0 );

end

function HealGridUnitPetTarget:ActionPointsMax()

	return( 0 );

end

function HealGridUnitPetTarget:ActionPointsPercent()

	return( 0 );

end

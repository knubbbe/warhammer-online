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


HealGridUnitPet = HealGridUnitHUD:New();

function HealGridUnitPet:New( o )

	o.unit = 'pet';
	o.frameName = 'HG_HealGrid_Pet_0_0';
	o.placeholderFrameName = 'HG_HealGrid_PetPlaceholder_0_0';

	t = HealGridUnitHUD:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitPet:GetUnitName()

	return( GameData.Player.Pet.name or L"" );

end

function HealGridUnitPet:GetUnitLevel()

	return( GameData.Player.Pet.level or 0 );

end

function HealGridUnitPet:GetCareerName()

	return( "Pet" );

end

function HealGridUnitPet:GetTargetType()

	return( HealGridGlobals.UnitTargetType.ALLY_PET );

end

function HealGridUnitPet:GetConType()

	return( HealGridGlobals.UnitConType.FRIENDLY );

end

function HealGridUnitPet:GetStance()

	return( GameData.Player.Pet.stance );

end

function HealGridUnitPet:GetStanceName()

	local stance = self:GetStance();

	if ( stance == GameData.PetCommand.PASSIVE ) then
		return( L'passive' );
	elseif ( stance == GameData.PetCommand.DEFENSIVE ) then
		return( L'defensive' );
	elseif ( stance == GameData.PetCommand.AGGRESSIVE ) then
		return( L'aggressive' );
	else
		return( L'unknown' );
	end

end

function HealGridUnitPet:IsPet()

	return( true );

end

function HealGridUnitPet:UnitExists()

	return( GameData.Player.Pet.objNum ~= 0 and GameData.Player.Pet.name ~= L"" );

end

function HealGridUnitPet:IsDead()

	return( GameData.Player.Pet.healthPercent <= 0 );

end

-- ===========================================================================================================================
-- Skinning / Layout
-- ===========================================================================================================================

function HealGridUnitPet:GetGridPosX()

	if ( HealGrid.SettingGet('hudShowPetFrames') ) then
		return( HealGridUnitHUD.GetGridPosX(self) );
	else
		return( 1 );
	end

end

function HealGridUnitPet:ApplySkinLabels( skinID, skinSectionID, skinSubSectionID, width, height )

	HealGridUnitHUD.ApplySkinLabels( self, skinID, skinSectionID, 'petFrame', width, height );

end

function HealGridUnitPet:ApplySkinSpellTrackLabels( skinID, skinSectionID, skinSubSectionID, frameWidth, frameBorderWidth )

	HealGridUnitHUD.ApplySkinSpellTrackLabels( self, skinID, skinSectionID, 'petFrame', frameWidth, frameBorderWidth );

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitPet:HitPoints()

	return( GameData.Player.Pet.healthPercent );

end

function HealGridUnitPet:HitPointsMax()

	return( 100 );

end

function HealGridUnitPet:HitPointsPercent()

	return( GameData.Player.Pet.healthPercent );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitPet:ActionPoints()

	return( 0 );

end

function HealGridUnitPet:ActionPointsMax()

	return( 0 );

end

function HealGridUnitPet:ActionPointsPercent()

	return( 0 );

end

--[[

table = {
	isNpc (bool),
	type (number),
	healthPercent (number),
	entityId (number),
	difficultyMask (number),
	relationshipColor = { r=, g=, b= },
	name (wstring),
	tier (number),
	mapPinType (number),
	level (number),
	isPvp (bool),
	conType (number)
}

]]

HealGridUnitHostileTarget = HealGridUnitHUD:New();

function HealGridUnitHostileTarget:New( o )

	o.unit = 'selfhostiletarget';
	o.frameName = 'HG_HealGrid_HostileTarget_0_0';
	o.placeholderFrameName = 'HG_HealGrid_HostileTargetPlaceholder_0_0';

	t = HealGridUnitHUD:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitHostileTarget:GetUnitName()

	return( TargetInfo:UnitName('selfhostiletarget') );

end

function HealGridUnitHostileTarget:GetUnitLevel()

	return( TargetInfo:UnitLevel('selfhostiletarget') or 0 );

end

function HealGridUnitHostileTarget:GetCareerName()

	return( TargetInfo:UnitCareerName('selfhostiletarget') );

end

function HealGridUnitHostileTarget:GetCareerLine()

	return( TargetInfo:UnitCareer('selfhostiletarget') );

end

function HealGridUnitHostileTarget:GetTargetType()

	local rc;
	local unitType = TargetInfo:UnitType( 'selfhostiletarget' );

	if ( unitType == SystemData.TargetObjectType.ENEMY_NON_PLAYER ) then
		rc = TargetInfo:UnitRelationshipColor( 'selfhostiletarget' );
		if ( rc.r == 241 and rc.g == 122 and rc.b == 17 ) then
			return( HealGridGlobals.UnitTargetType.ENEMY_NON_PLAYER_NON_AGGRESSIVE );
		end
	end

	return( unitType );

end

function HealGridUnitHostileTarget:GetConType()

	return( TargetInfo:UnitConType('selfhostiletarget') );

end

function HealGridUnitHostileTarget:GetUnitTier()

	return( TargetInfo:UnitTier('selfhostiletarget') );

end

function HealGridUnitHostileTarget:GetAssistTarget()

    return( 'MAIN' );

end

function HealGridUnitHostileTarget:UnitExists()

	if ( TargetInfo:UnitName('selfhostiletarget') == L"" ) then
		return( false );
	end

	return( true );

end

function HealGridUnitHostileTarget:IsDead()

	return( TargetInfo:UnitHealth('selfhostiletarget') <= 0 );

end

function HealGridUnitHostileTarget:UnitIsFriend()

	return( false );

end

function HealGridUnitHostileTarget:UnitIsHostile()

	return( true );

end

-- ===========================================================================================================================
-- Skinning / Layout
-- ===========================================================================================================================

function HealGridUnitHostileTarget:GetGridPosX()

	if ( HealGrid.SettingGet('hudShowPetFrames') ) then
		return( HealGridUnitHUD.GetGridPosX(self) );
	else
		return( HealGridUnitHUD.GetGridPosX(self)-1 );
	end

end

function HealGridUnitHostileTarget:ApplySkinLabels( skinID, skinSectionID, skinSubSectionID, width, height )

	HealGridUnitHUD.ApplySkinLabels( self, skinID, skinSectionID, 'hostileTargetFrame', width, height );

end

function HealGridUnitHostileTarget:ApplySkinSpellTrackLabels( skinID, skinSectionID, skinSubSectionID, frameWidth, frameBorderWidth )

	HealGridUnitHUD.ApplySkinSpellTrackLabels( self, skinID, skinSectionID, 'hostileTargetFrame', frameWidth, frameBorderWidth );

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitHostileTarget:HitPoints()

	return( TargetInfo:UnitHealth('selfhostiletarget') );

end

function HealGridUnitHostileTarget:HitPointsMax()

	return( 100 );

end

function HealGridUnitHostileTarget:HitPointsPercent()

	return( TargetInfo:UnitHealth('selfhostiletarget') );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitHostileTarget:ActionPoints()

	return( 0 );

end

function HealGridUnitHostileTarget:ActionPointsMax()

	return( 0 );

end

function HealGridUnitHostileTarget:ActionPointsPercent()

	return( 0 );

end

-- ===========================================================================================================================
-- Debuffs
-- ===========================================================================================================================

function HealGridUnitHostileTarget:BuffTargetType()

    return( GameData.BuffTargetType.TARGET_HOSTILE );

end

function HealGridUnitHostileTarget:ShouldShowDebuffFlags()

	return( HealGrid.SettingGet('hudShowHostileTargetDebuffFlags') ~= 'NONE' );

end

function HealGridUnitHostileTarget:ShouldShowDebuffFlag( flag )

    return( HealGrid.SettingGet('hudShowHostileTargetDebuffFlags') == 'ALL' or
			(HealGrid.SettingGet('hudShowHostileTargetDebuffFlags') == 'DISPELLABLE' and HealGrid.SettingGet('dispellableDebuffFlags',flag))
          );

end

-- ===========================================================================================================================
-- Assisting
-- ===========================================================================================================================

function HealGridUnitHostileTarget:AssistUnit()

	local ma = HealGridUtility.GetMainAssist();

	if ( ma ~= L"" ) then
		
	end

end

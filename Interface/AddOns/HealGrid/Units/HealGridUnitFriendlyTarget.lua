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


HealGridUnitFriendlyTarget = HealGridUnitHUD:New();

function HealGridUnitFriendlyTarget:New( o )

	o.unit = 'selffriendlytarget';
	o.frameName = 'HG_HealGrid_FriendlyTarget_0_0';
	o.placeholderFrameName = 'HG_HealGrid_FriendlyTargetPlaceholder_0_0';

	t = HealGridUnitHUD:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitFriendlyTarget:GetUnitName()

	return( TargetInfo:UnitName('selffriendlytarget') );

end

function HealGridUnitFriendlyTarget:GetUnitLevel()

	return( TargetInfo:UnitLevel('selffriendlytarget') or 0 );

end

function HealGridUnitFriendlyTarget:GetCareerName()

	return( TargetInfo:UnitCareerName('selffriendlytarget') );

end

function HealGridUnitFriendlyTarget:GetCareerLine()

	return( TargetInfo:UnitCareer('selffriendlytarget') );

end

function HealGridUnitFriendlyTarget:GetTargetType()

	return( TargetInfo:UnitType('selffriendlytarget') );

end

function HealGridUnitFriendlyTarget:GetConType()

	return( TargetInfo:UnitConType('selffriendlytarget') );

end

function HealGridUnitFriendlyTarget:GetUnitTier()

	return( TargetInfo:UnitTier('selffriendlytarget') );

end

function HealGridUnitFriendlyTarget:IsInAvatarGroup()

    local gUnit = HealGridGroup.Instance():NameMapGetUnit( self:GetRealUnitName() );
    local bgUnit = HealGridBattlegroup.Instance():NameMapGetUnit( self:GetRealUnitName() );
    local sgUnit = HealGridBattlegroup.Instance():NameMapGetUnit( self:GetRealUnitName() );

	return(    (bgUnit and bgUnit:IsInAvatarGroup()) 
            or (sgUnit and sgUnit:IsInAvatarGroup()) 
            or (not bgUnit and gUnit and gUnit:IsInAvatarGroup()) );		-- only check group if not in bg

end

function HealGridUnitFriendlyTarget:IsMainAssist()

	return( HealGridUtility.GetMainAssist() == self:GetUnitName() );

end

function HealGridUnitFriendlyTarget:UnitExists()

	if ( TargetInfo:UnitName('selffriendlytarget') == L"" ) then
		return( false );
	end

	return( true );

end

function HealGridUnitFriendlyTarget:IsDead()

	return( TargetInfo:UnitHealth('selffriendlytarget') <= 0 );

end

-- ===========================================================================================================================
-- Skinning / Layout
-- ===========================================================================================================================

function HealGridUnitFriendlyTarget:GetGridPosX()

	if ( HealGrid.SettingGet('hudShowPetFrames') ) then
		return( HealGridUnitHUD.GetGridPosX(self) );
	else
		return( HealGridUnitHUD.GetGridPosX(self)-1 );
	end

end

function HealGridUnitFriendlyTarget:ApplySkinLabels( skinID, skinSectionID, skinSubSectionID, width, height )

	HealGridUnitHUD.ApplySkinLabels( self, skinID, skinSectionID, 'friendlyTargetFrame', width, height );

end

function HealGridUnitFriendlyTarget:ApplySkinSpellTrackLabels( skinID, skinSectionID, skinSubSectionID, frameWidth, frameBorderWidth )

	HealGridUnitHUD.ApplySkinSpellTrackLabels( self, skinID, skinSectionID, 'friendlyTargetFrame', frameWidth, frameBorderWidth );

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitFriendlyTarget:HitPoints()

	return( TargetInfo:UnitHealth('selffriendlytarget') );

end

function HealGridUnitFriendlyTarget:HitPointsMax()

	return( 100 );

end

function HealGridUnitFriendlyTarget:HitPointsPercent()

	return( TargetInfo:UnitHealth('selffriendlytarget') );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitFriendlyTarget:ActionPoints()

    return( 0 );				-- TODO: lookup via group/battlegroup/scenariogroup/player

end

function HealGridUnitFriendlyTarget:ActionPointsMax()

    return( 0 );				-- TODO: lookup via group/battlegroup/scenariogroup/player

end

function HealGridUnitFriendlyTarget:ActionPointsPercent()

    return( 0 );				-- TODO: lookup via group/battlegroup/scenariogroup/player

end

-- ===========================================================================================================================
-- Buffs / Debuffs
-- ===========================================================================================================================

function HealGridUnitFriendlyTarget:BuffTargetType()

    return( GameData.BuffTargetType.TARGET_FRIENDLY );

end

function HealGridUnitFriendlyTarget:ShouldShowDebuffFlags()

	return( HealGrid.SettingGet('hudShowFriendlyTargetDebuffFlags') ~= 'NONE' );

end

function HealGridUnitFriendlyTarget:ShouldShowDebuffFlag( flag )

    return( HealGrid.SettingGet('hudShowFriendlyTargetDebuffFlags') == 'ALL' or
			(HealGrid.SettingGet('hudShowFriendlyTargetDebuffFlags') == 'DISPELLABLE' and HealGrid.SettingGet('dispellableDebuffFlags',flag))
          );

end

-- ===========================================================================================================================
-- Show the dropdown menu on right click
-- ===========================================================================================================================

function HealGridUnitFriendlyTarget:ShowDropdownMenu()

	if ( not TargetInfo:UnitIsNPC('selffriendlytarget') ) then
		if ( self:GetRealUnitName() == HealGridUtility.WStringChop(GameData.Player.name) ) then
			HealGridHUDMain.Instance():GetUnit(1,HealGridHUD.PLAYER):ShowDropdownMenu();
		else
			PlayerMenuWindow.ShowMenu( self:GetUnitName(), TargetInfo:UnitEntityId('selffriendlytarget'), nil );
		end
	end

end

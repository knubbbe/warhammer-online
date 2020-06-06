--[[

{	[1] =	{
				healthPercent (number)
				moraleLevel (number)
				Pet {
						healthPercent(number)
					}
				zoneNum (number),
				isInSameRegion (bool)
				isRVRFlagged (bool)
				isGroupLeader (bool)
				name (wstring)
				actionPointPercent (number)
				worldObjNum (number)				always 0 ?
				level (number)
				careerLine (number)
				careerName (wstring)
				isGroupLeader (boolean)
				isAssistant (boolean)
				isMainAssist (boolean)
				isMasterLooter (boolean)
				isRVRFlagged (boolean)
				online (boolean)
			}
	[2] = ...
}


]]

HealGridUnitGroupMember = HealGridUnit:New();

function HealGridUnitGroupMember:New( o )

	o.unit = 'group';
	o.frameName = 'HG_HealGrid_GroupMember_';
	o.templateName = 'HG_HealGridUnitTemplate';
	o.placeholderFrameName = nil;
	o.placeholderTemplateName = nil;
	o.petFrameName = 'HG_HealGrid_GroupMemberPet_';
	o.petTemplateName = 'HG_HealGridUnitPetTemplate';
	o.parentFrameName = "HG_HealGridGroupUnitContainer";

	t = HealGridUnit:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitGroupMember:GetUnit()

	return( self.unit..self:GetMemberIndex() );

end

function HealGridUnitGroupMember:GetFrameName()

	return( self.frameName..self:GetMemberIndex()..'_0' );

end

function HealGridUnitGroupMember:GetPlaceholderFrameName()

	if ( self.placeholderFrameName ~= nil ) then
		return( self.placeholderFrameName..self:GetMemberIndex()..'_0' );
	end

	return( nil );

end

function HealGridUnitGroupMember:GetPetFrameName()

	if ( self.petFrameName ~= nil ) then
		return( self.petFrameName..self:GetMemberIndex()..'_0' );
	end

	return( nil );

end

function HealGridUnitGroupMember:GetUnitName()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'name') or L"" );

end

function HealGridUnitGroupMember:GetUnitLevel()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'level') or 0 );

end

function HealGridUnitGroupMember:GetCareerName()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'careerName') or L"" );

end

function HealGridUnitGroupMember:GetCareerLine()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'careerLine') or 0 );

end

function HealGridUnitGroupMember:GetTargetType()

	return( HealGridGlobals.UnitTargetType.ALLY_PLAYER );

end

function HealGridUnitGroupMember:GetConType()

	return( HealGridGlobals.UnitConType.FRIENDLY );

end

function HealGridUnitGroupMember:IsInAvatarGroup()

	return( true );

end

function HealGridUnitGroupMember:IsGroupLeader()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'isGroupLeader') or false );

end

function HealGridUnitGroupMember:IsMainAssist()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'isMainAssist') or false );

end

function HealGridUnitGroupMember:UnitExists()

	return( HealGridGroup.Instance():UnitDataIsValid(self:GetGroupIndex(),self:GetMemberIndex()) and self:GetUnitName() ~= L"" );

end

function HealGridUnitGroupMember:PetExists()

	return( HealGridGroup.Instance():UnitDataIsValid(self:GetGroupIndex(),self:GetMemberIndex()) and self:GetUnitName() ~= L"" and self:PetHitPointsPercent() > 0 );

end

function HealGridUnitGroupMember:ShowPet()

	return( HealGrid.SettingGet('groupShowPets') );

end

function HealGridUnitGroupMember:IsDead()

	return( (HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'healthPercent') or 0) <= 0 and
			(HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'moraleLevel') or 0) <= 0 );

end

function HealGridUnitGroupMember:IsFar()

	local isInSameRegion = HealGridGroup.Instance():GetUnitData( self:GetGroupIndex(), self:GetMemberIndex(), 'isInSameRegion' );

	if ( isInSameRegion ~= nil and isInSameRegion == true ) then
		return( false );
	end

	return( true );

end

function HealGridUnitGroupMember:IsCareerLineIconVisible()

	local setting = HealGrid.SettingGet( 'groupShowCareerLineIcon' );

	if ( setting == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(self:Grid():GetSkinID(),'grid','unitFrame','careerLineIcon','isVisible') );
	elseif ( setting == 'HIDE' ) then
		return( false );
	else
		return( true );
	end

end

function HealGridUnitGroupMember:GetUnitFrameBarVisibility( barID )

	return( HealGrid.SettingGet('group'..self.unitFrameBars[barID].settingKey) );

end

-- ===========================================================================================================================
-- Skinning
-- ===========================================================================================================================

function HealGridUnitGroupMember:GetGridPosX()

	if ( HealGrid.SettingGet('groupShowAvatar') ) then
		return( self:GetMemberIndex() + 1 );
	else
		return( self:GetMemberIndex() );
	end

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitGroupMember:HitPoints()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'healthPercent') or 0 );

end

function HealGridUnitGroupMember:HitPointsMax()

	return( 100 );

end

function HealGridUnitGroupMember:HitPointsPercent()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'healthPercent') or 0 );

end

function HealGridUnitGroupMember:PetHitPointsPercent()

	return( HealGridGroup.Instance():GetPetData(self:GetGroupIndex(),self:GetMemberIndex(),'healthPercent') or 0 );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitGroupMember:ActionPoints()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'actionPointPercent') or 0 );

end

function HealGridUnitGroupMember:ActionPointsMax()

	return( 100 );

end

function HealGridUnitGroupMember:ActionPointsPercent()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'actionPointPercent') or 0 );

end


-- ===========================================================================================================================
-- Morale
-- ===========================================================================================================================

function HealGridUnitGroupMember:MoraleLevel()

	return( HealGridGroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'moraleLevel') or 0 );

end

-- ===========================================================================================================================
-- Debuffs
-- ===========================================================================================================================

function HealGridUnitGroupMember:BuffTargetType()

    return( GameData.BuffTargetType.GROUP_MEMBER_START + (self:GetMemberIndex()-1) );

end

function HealGridUnitGroupMember:ShouldShowDebuffFlags()

	return( HealGrid.SettingGet('groupShowDebuffFlags') ~= 'NONE' );

end

function HealGridUnitGroupMember:ShouldShowDebuffFlag( flag )

    return( HealGrid.SettingGet('groupShowDebuffFlags') == 'ALL' or
			(HealGrid.SettingGet('groupShowDebuffFlags') == 'DISPELLABLE' and HealGrid.SettingGet('dispellableDebuffFlags',flag))
          );

end

-- ===========================================================================================================================
-- Show the dropdown menu on right click
-- ===========================================================================================================================

function HealGridUnitGroupMember:ShowDropdownMenu()

	 GroupWindow.ShowMenu( self:GetUnitName() );

end

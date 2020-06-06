HealGridUnitGroupMemberAvatar = HealGridUnitPlayer:New();

function HealGridUnitGroupMemberAvatar:New( o )

	o.unit = 'groupplayer';
	o.frameName = 'HG_HealGrid_GroupMember_';
	o.templateName = 'HG_HealGridUnitTemplate';
	o.placeholderFrameName = nil;
	o.placeholderTemplateName = nil;
	o.petFrameName = 'HG_HealGrid_GroupMemberPet_';
	o.petTemplateName = 'HG_HealGridUnitPetTemplate';
	o.parentFrameName = "HG_HealGridGroupUnitContainer";

	t = HealGridUnitPlayer:New( o );

	t.placeholderFrameName = nil;			-- reset settings of HealGridUnitPlayer

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitGroupMemberAvatar:GetFrameName()

	return( self.frameName..HealGridGroup.AVATAR..'_0' .. self:GetFrameSuffix() );

end

function HealGridUnitGroupMemberAvatar:GetPlaceholderFrameName()

	if ( self.placeholderFrameName ~= nil ) then
		return( self.placeholderFrameName..HealGridGroup.AVATAR..'_0' .. self:GetFrameSuffix() );
	end

	return( nil );

end

function HealGridUnitGroupMemberAvatar:GetPetFrameName()

	if ( self.petFrameName ~= nil ) then
		return( self.petFrameName..HealGridGroup.AVATAR..'_0' .. self:GetFrameSuffix() );
	end

	return( nil );

end

function HealGridUnitGroupMemberAvatar:IsInAvatarGroup()

	return( true );

end

function HealGridUnitGroupMemberAvatar:IsGroupLeader()

	return( HealGridGroup.Instance():GetGroupLeader() == self:GetUnitName() );

end

function HealGridUnitGroupMemberAvatar:IsMainAssist()

	return( HealGridGroup.Instance():GetMainAssist() == self:GetUnitName() );

end

function HealGridUnitGroupMemberAvatar:PetExists()

	return( GameData.Player.Pet.name ~= L"" );

end

function HealGridUnitGroupMemberAvatar:ShowPet()

	return( HealGrid.SettingGet('groupShowPets') );

end

function HealGridUnitGroupMemberAvatar:IsCareerLineIconVisible()

	local setting = HealGrid.SettingGet( 'groupShowCareerLineIcon' );

	if ( setting == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(self:Grid():GetSkinID(),'grid','unitFrame','careerLineIcon','isVisible') );
	elseif ( setting == 'HIDE' ) then
		return( false );
	else
		return( true );
	end

end

function HealGridUnitGroupMemberAvatar:GetUnitFrameBarVisibility( barID )

	return( HealGrid.SettingGet('group'..self.unitFrameBars[barID].settingKey) );

end

-- ===========================================================================================================================
-- Skinning
-- ===========================================================================================================================

function HealGridUnitGroupMemberAvatar:GetGridPosX()

	return( 1 );

end

function HealGridUnitGroupMemberAvatar:ApplySkinLabels( skinID, skinSectionID, skinSubSectionID, width, height )

	HealGridUnit.ApplySkinLabels( self, skinID, skinSectionID, 'unitFrame', width, height );

end

function HealGridUnitGroupMemberAvatar:ApplySkinSpellTrackLabels( skinID, skinSectionID, skinSubSectionID, frameWidth, frameBorderWidth )

	HealGridUnitHUD.ApplySkinSpellTrackLabels( self, skinID, skinSectionID, 'unitFrame', frameWidth, frameBorderWidth );

end

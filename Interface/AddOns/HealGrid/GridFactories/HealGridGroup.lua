-- ========================================================================================================
-- 
-- ========================================================================================================

HealGridGroup = HealGridGridFactory:New();

HealGridGroup.AVATAR = HealGridGlobals.LAST_GROUP_MEMBER + 1;

HealGridGroup.myInstance = false;

-- ========================================================================================================
-- New
-- ========================================================================================================

function HealGridGroup:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = 'HG_HealGridGroup';
	o.frameLabel = L"HealGrid (Group)";
	o.templateName = 'HG_HealGridGroupTemplate';
	o.parentFrameName = "Root";
	o.unitFrameSuffix = "_g";
	o.skinID = HealGrid.SettingGet( 'groupSkin' );
	o.skinSection = 'grid';

    t = HealGridGridFactory:New( o );

    setmetatable( t, self );
    self.__index = self;

	HealGridGroup.myInstance = t;

    return( t );

end

-- ========================================================================================================
-- trivials
-- ========================================================================================================

function HealGridGroup:GetOrientation( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('groupGridOrientation') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','orientation') );
	end

	return( HealGrid.SettingGet('groupGridOrientation') );

end

function HealGridGroup:GetGrowth( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('groupGridGrowth') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','growth') );
	end

	return( HealGrid.SettingGet('groupGridGrowth') );

end

function HealGridGroup:GetGrouping( skinID )

	return( 'GROUP' );
--	skinID = skinID or self:GetSkinID();

--	if ( HealGrid.SettingGet('groupGridGrouping') == 'SKIN' ) then
--		return( HealGridSkin.GetSkinValue(skinID,'grid','grouping') );
--	end

--	return( HealGrid.SettingGet('groupGridGrouping') );

end

function HealGridGroup:GetUpdateThrottle()

	return( HealGrid.SettingGet('groupUpdateThrottle') );

end

function HealGridGroup:GetBuffUpdateThrottle()

	return( HealGrid.SettingGet('groupBuffUpdateThrottle') );

end

function HealGridGroup:CanHavePets()

	return( true );

end

function HealGridGroup:ShowPets()

	return( HealGrid.SettingGet('groupShowPets') );

end

-- ========================================================================================================
-- Initialization
-- ========================================================================================================

function HealGridGroup:Initialize()

	HealGridGridFactory.Initialize( self );

end

-- ========================================================================================================
-- Update
-- ========================================================================================================

function HealGridGroup:Update( timePassed )

	local playerInBG, playerInSG, hideGroup;

	-- check if group needs to be handled
	if ( not HealGridGroup.IsPlayerInGroup() ) then
		self:RootWindowSetShowing( false );
		return( false );
	end

	playerInBG = HealGridBattlegroup.IsPlayerInBattlegroup();
	playerInSG = HealGridScenariogroup.IsPlayerInScenariogroup();

	hideGroup = ( (playerInBG and HealGrid.SettingGet('hideGroupInBattlegroup')) or
	              (playerInSG and HealGrid.SettingGet('hideGroupInScenariogroup')) or
                  (HealGrid.SettingGet('groupStayHidden') == true )
                );

	if ( hideGroup ) then
		self:RootWindowSetShowing( false );
	else
		self:RootWindowSetShowing( true );
	end

	-- do the update

	HealGridGridFactory.UpdateGroupData();

	for i=HealGridGlobals.FIRST_GROUP_MEMBER, HealGridGlobals.LAST_GROUP_MEMBER do
		if ( HealGridGridFactory.warGroupData[i] ~= nil and HealGridGridFactory.warGroupData[i].name ~= nil and HealGridGridFactory.warGroupData[i].name ~= L"" ) then
			if ( self.units[1] == nil ) then
				self.units[1] = {};
			end
			if ( self.units[1][i] == nil ) then
				self.units[1][i] = HealGridUnitGroupMember:New( {groupIndex=1,memberIndex=i,frameSuffix=self:GetUnitFrameSuffix()} );
				self.units[1][i]:Initialize( self );
				self.units[1][i]:ApplySkin( HealGrid.SettingGet('groupSkin'), 'grid' );
			end
			self:UnitDataInit( 1, i, HealGridGridFactory.warGroupData[i] );
			if ( not hideGroup ) then
				self.units[1][i]:UpdateBuffs( timePassed );
				self.units[1][i]:OnUpdate( timePassed );
			else
				self.units[1][i]:ClearBuffCache();
			end
			self:NameMapAdd( self.units[1][i]:GetRealUnitName(), 1, i );
		elseif ( self.units[1] and self.units[1][i] ) then
			self:UnitDataWipe( 1, i );
			self.units[1][i]:UpdateVisibility();
		end
	end

	-- avatar (if shown)
	if ( (not hideGroup) ) then
		if ( HealGrid.SettingGet('groupShowAvatar') ) then
			if ( self.units[1][HealGridGroup.AVATAR] == nil ) then
				self.units[1][HealGridGroup.AVATAR] = HealGridUnitGroupMemberAvatar:New( {groupIndex=1,memberIndex=HealGridGroup.AVATAR,frameSuffix=self:GetUnitFrameSuffix()} );
				self.units[1][HealGridGroup.AVATAR]:Initialize( self );
				self.units[1][HealGridGroup.AVATAR]:ApplySkin( HealGrid.SettingGet('groupSkin'), 'grid' );
			end

			self.units[1][HealGridGroup.AVATAR]:UpdateBuffs( timePassed );
			self.units[1][HealGridGroup.AVATAR]:OnUpdate( timePassed );
			-- do NOT add avatar to unit data !!!
			-- do NOT add avatar to name map!!!
		elseif ( self.units[1] and self.units[1][HealGridGroup.AVATAR] ~= nil ) then
			self.units[1][HealGridGroup.AVATAR]:Hide();
		end
	end

	return( true );

end

-- =====================================================================================
-- Sizing
-- =====================================================================================

function HealGridGroup:UnitFrameGetSize( skinID )

    local ufw, ufh, tufw, tufh;

    skinID = (skinID or self:GetSkinID());
    ufw = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'width' ) + HealGrid.SettingGet( 'groupUnitFrameWidthAdjust' );
    ufh = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'height' ) + HealGrid.SettingGet( 'groupUnitFrameHeightAdjust' );

	if ( self:ShowPets() ) then
		tufw = ufw;
	    tufh = ufh + self:PetFrameGetHeight();
	else
		tufw = ufw;
	    tufh = ufh;
	end

    return ufw, ufh, tufw, tufh;

end

function HealGridGroup:PetFrameGetHeight( skinID )

    local skinPetFrameHeight;

    skinID = (skinID or self:GetSkinID());
    skinPetFrameHeight = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'petFrame', 'height' );

    return( skinPetFrameHeight );

end

function HealGridGroup:UnitContainerGetSize( skinID )

	local ufw, ufh, tufw, tufh;
	local numUnitFrames = HealGridGlobals.LAST_GROUP_MEMBER;

	skinID = (skinID or self:GetSkinID());

	ufw,ufh,tufw,tufh = self:UnitFrameGetSize( skinID );

	if ( HealGrid.SettingGet('groupShowAvatar') ) then
		numUnitFrames = numUnitFrames + 1;
	end

	if ( self:GetOrientation(skinID) == 'HORIZONTAL' ) then
		return tufw * numUnitFrames,
				tufh;
	else
		return tufw,
				tufh * numUnitFrames;
	end

end

-- =====================================================================================
-- Skinning
-- =====================================================================================

function HealGridGroup:GetSkinID()

	return( HealGrid.SettingGet('groupSkin') );

end

function HealGridGroup:GetSkinSectionID()

	return( 'grid' );

end

-- ===========================================================================================================
-- group leader
--
-- NOTE: Player is NOT part of group. there MUST be a group leader in group.
--       so if none of the members is groupleader it is save to assume that Player is groupleader
-- ===========================================================================================================

function HealGridGroup:GetGroupLeader()

	local gl = HealGridGridFactory.GetGroupLeader( self );

	if ( gl == L"" ) then
		gl = GameData.Player.name;
	end

	return( gl );

end

-- ===========================================================================================================
-- main assist
--
-- NOTE: Player is NOT part of group. there MUST be a main assist in group.
--       so if none of the members is MA it is save to assume that Player is MA
-- ===========================================================================================================

function HealGridGroup:GetMainAssist()

	local ma = HealGridGridFactory.GetMainAssist( self );

	if ( ma == L"" ) then
		ma = GameData.Player.name;
	end

	return( ma );

end

-- =====================================================================================
-- HUD attaching
-- =====================================================================================

function HealGridGroup:ShouldShowHUD()

	return( HealGrid.SettingGet('groupShowHUD') );

end

-- #####################################################################################################
-- static
-- #####################################################################################################

function HealGridGroup.IsPlayerInGroup()

	HealGridGridFactory.UpdateGroupData();

	if ( HealGridGridFactory.warGroupData == nil ) then
		return( false );
	end

	for i=HealGridGlobals.FIRST_GROUP_MEMBER, HealGridGlobals.LAST_GROUP_MEMBER do
		if ( HealGridGridFactory.warGroupData[i] ~= nil and HealGridGridFactory.warGroupData[i].name ~= nil and HealGridGridFactory.warGroupData[i].name ~= L"" ) then
			return( true );
		end
	end

	return( false );

end

function HealGridGroup.Instance()

	return( HealGridGroup.myInstance );

end

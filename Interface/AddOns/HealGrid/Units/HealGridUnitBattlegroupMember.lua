--[[
{
  [g] = { players = { [m] = { 	worldObjNum (number)
								name (wstring)
								careerName (wstring)
								careerLine (number)
								level (number)
								healthPercent (number)
								actionPointsPercent (number)
								moraleLevel (number)
								isRvRFlagged (bool)
								isGroupLeader (bool)
								isMainAssist( bool)
								isMasterLooter (bool)
								isAssistant (bool)
								zoneNume (number)
								isInSameRegion (number)
								online (bool)
								Pet = { healthPercent (number)
									  }
                            }
                      [m] = ..
                    }
  [g] = ...

]]

HealGridUnitBattlegroupMember = HealGridUnit:New();

function HealGridUnitBattlegroupMember:New( o )

	o.unit = 'battlegroup';
	o.frameName = 'HG_HealGrid_BattlegroupMember_';
	o.templateName = 'HG_HealGridUnitTemplate';
	o.placeholderFrameName = nil;
	o.placeholderTemplateName = nil;
	o.parentFrameName = "HG_HealGridBattlegroupUnitContainer";

	t = HealGridUnit:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitBattlegroupMember:GetUnit()

	return( self.unit..self:GetGroupIndex()..'_'..self:GetMemberIndex() );

end

function HealGridUnitBattlegroupMember:GetFrameName()

	return( self.frameName..self:GetGroupIndex()..'_'..self:GetMemberIndex() );

end

function HealGridUnitBattlegroupMember:GetPlaceholderFrameName()

	if ( self.placeholderFrameName ~= nil ) then
		return( self.placeholderFrameName..self:GetGroupIndex()..'_'..self:GetMemberIndex() );
	end

	return( nil );

end

function HealGridUnitBattlegroupMember:GetPetFrameName()

	if ( self.petFrameName ~= nil ) then
		return( self.petFrameName..self:GetGroupIndex()..'_'..self:GetMemberIndex() );
	end

	return( nil );

end

function HealGridUnitBattlegroupMember:GetUnitName()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'name') or L"" );

end

function HealGridUnitBattlegroupMember:GetUnitLevel()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'level') or 0 );

end

function HealGridUnitBattlegroupMember:GetCareerName()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'careerName') or L"" );

end

function HealGridUnitBattlegroupMember:GetCareerLine()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'careerLine') or 0 );

end

function HealGridUnitBattlegroupMember:GetTargetType()

	return( HealGridGlobals.UnitTargetType.ALLY_PLAYER );

end

function HealGridUnitBattlegroupMember:GetConType()

	return( HealGridGlobals.UnitConType.FRIENDLY );

end

function HealGridUnitBattlegroupMember:IsInAvatarGroup()

    local playerUnit = HealGridBattlegroup.Instance():NameMapGetUnit( HealGridUtility.GetRealPlayerName() );

    return( playerUnit and playerUnit:GetGroupIndex() == self:GetGroupIndex() );

end

function HealGridUnitBattlegroupMember:IsGroupLeader()

    return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'isGroupLeader') or false );

end

function HealGridUnitBattlegroupMember:IsMainAssist()

    return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'isMainAssist') or false );

end

function HealGridUnitBattlegroupMember:UnitExists()

	return( HealGridBattlegroup.Instance():UnitDataIsValid(self:GetGroupIndex(),self:GetMemberIndex()) and self:GetUnitName() ~= L"" );

end

function HealGridUnitBattlegroupMember:IsDead()

	return( (HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'healthPercent') or 0) <= 0 and
			(HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'moralePercent') or 0) <= 0 );

end

function HealGridUnitBattlegroupMember:IsFar()

	return( false );

end

function HealGridUnitBattlegroupMember:IsCareerLineIconVisible()

	local setting = HealGrid.SettingGet( 'battlegroupShowCareerLineIcon' );

	if ( setting == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(self:Grid():GetSkinID(),'grid','unitFrame','careerLineIcon','isVisible') );
	elseif ( setting == 'HIDE' ) then
		return( false );
	else
		return( true );
	end

end

function HealGridUnitBattlegroupMember:GetUnitFrameBarVisibility( barID )

	return( HealGrid.SettingGet('battlegroup'..self.unitFrameBars[barID].settingKey) );

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitBattlegroupMember:HitPoints()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'healthPercent') or 0 );

end

function HealGridUnitBattlegroupMember:HitPointsMax()

	return( 100 );

end

function HealGridUnitBattlegroupMember:HitPointsPercent()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'healthPercent') or 0 );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitBattlegroupMember:ActionPoints()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'actionPointPercent') or 0 );

end

function HealGridUnitBattlegroupMember:ActionPointsMax()

	return( 100 );

end

function HealGridUnitBattlegroupMember:ActionPointsPercent()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'actionPointPercent') or 0 );

end

-- ===========================================================================================================================
-- Morale
-- ===========================================================================================================================

function HealGridUnitBattlegroupMember:MoraleLevel()

	return( HealGridBattlegroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'moraleLevel') or 0 );

end

-- ===========================================================================================================================
-- Buffs / Debuffs
-- ===========================================================================================================================

function HealGridUnitBattlegroupMember:ShouldShowDebuffFlags()

	return( HealGrid.SettingGet('battlegroupShowDebuffFlags') ~= 'NONE' );

end

function HealGridUnitBattlegroupMember:ShouldShowDebuffFlag( flag )

    return( HealGrid.SettingGet('battlegroupShowDebuffFlags') == 'ALL' or
			(HealGrid.SettingGet('battlegroupShowDebuffFlags') == 'DISPELLABLE' and HealGrid.SettingGet('dispellableDebuffFlags',flag))
          );

end

-- order: reliability before accuracy !!! (better delayed data than no data at all
function HealGridUnitBattlegroupMember:BuffGetMasterUnit()

    local unitObj;

	unitObj = HealGridGroup.Instance():NameMapGetUnit( self:GetRealUnitName() );
	if ( unitObj ~= nil ) then
		return unitObj, false;
	end

	unitObj = HealGridHUDMain.Instance():GetUnit( 1, HealGridHUD.PLAYER );
	if ( unitObj ~= nil and unitObj:GetRealUnitName() == self:GetRealUnitName() ) then
		return unitObj, false;
	end

	unitObj = HealGridHUDMain.Instance():GetUnit( 1, HealGridHUD.FRIENDLY_TARGET );
	if ( unitObj ~= nil and unitObj:GetRealUnitName() == self:GetRealUnitName() ) then
		return unitObj, true;
	end

	return nil, false;

end

-- ===========================================================================================================================
-- Show the dropdown menu on right click
-- ===========================================================================================================================

function HealGridUnitBattlegroupMember:ShowDropdownMenu()

	BattlegroupHUD.ShowMenu( self:GetUnitName() );

end

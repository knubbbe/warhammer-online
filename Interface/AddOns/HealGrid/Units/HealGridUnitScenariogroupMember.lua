--[[

{
	[1] = {	health,
			ap,
			morale,
			careerId,
			career,
			sgroupslotnum,
			sgroupindex,
			name,
			rank,
			isMainAssist,
			}
	[2] = ...

]]

HealGridUnitScenariogroupMember = HealGridUnit:New();

function HealGridUnitScenariogroupMember:New( o )

	o.unit = 'scenariogroup';
	o.frameName = 'HG_HealGrid_ScenariogroupMember_';
	o.templateName = 'HG_HealGridUnitTemplate';
	o.placeholderFrameName = nil;
	o.placeholderTemplateName = nil;
	o.parentFrameName = "HG_HealGridScenariogroupUnitContainer";

	t = HealGridUnit:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitScenariogroupMember:GetUnit()

	return( self.unit..self:GetGroupIndex()..'_'..self:GetMemberIndex() );

end

function HealGridUnitScenariogroupMember:GetFrameName()

	return( self.frameName..self:GetGroupIndex()..'_'..self:GetMemberIndex() );

end

function HealGridUnitScenariogroupMember:GetPlaceholderFrameName()

	if ( self.placeholderFrameName ~= nil ) then
		return( self.placeholderFrameName..self:GetGroupIndex()..'_'..self:GetMemberIndex() );
	end

	return( nil );

end

function HealGridUnitScenariogroupMember:GetPetFrameName()

	if ( self.petFrameName ~= nil ) then
		return( self.petFrameName..self:GetGroupIndex()..'_'..self:GetMemberIndex() );
	end

	return( nil );

end

function HealGridUnitScenariogroupMember:GetUnitName()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'name') or L"" );

end

function HealGridUnitScenariogroupMember:GetUnitLevel()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'rank') or 0 );

end

function HealGridUnitScenariogroupMember:GetCareerName()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'career') or L"" );

end

function HealGridUnitScenariogroupMember:GetCareerLine()

--	return( HealGridUtility.CareerNameToCareerLine( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'career') ) );
	return( HealGridGlobals.careerMap[HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'careerId')] or 0 );

end

function HealGridUnitScenariogroupMember:GetTargetType()

	return( HealGridGlobals.UnitTargetType.ALLY_PLAYER );

end

function HealGridUnitScenariogroupMember:GetConType()

	return( HealGridGlobals.UnitConType.FRIENDLY );

end

function HealGridUnitScenariogroupMember:IsInAvatarGroup()

    local playerUnit = HealGridScenariogroup.Instance():NameMapGetUnit( HealGridUtility.GetRealPlayerName() );

    return( playerUnit and playerUnit:GetGroupIndex() == self:GetGroupIndex() );

end

function HealGridUnitScenariogroupMember:IsMainAssist()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'isMainAssist') or false );

end

function HealGridUnitScenariogroupMember:UnitExists()

	return( HealGridScenariogroup.Instance():UnitDataIsValid(self:GetGroupIndex(),self:GetMemberIndex()) and self:GetUnitName() ~= L"" );

end

function HealGridUnitScenariogroupMember:IsDead()

--	return( (HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'health') or 0) <= 0 and
--			(HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'morale') or 0) <= 0 and
--			self.hasBuffsNotDead == false );

	return( (HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'health') or 0) <= 0 and
			(HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'morale') or 0) <= 0 );

end

function HealGridUnitScenariogroupMember:IsFar()

	return( false );

end

function HealGridUnitScenariogroupMember:IsCareerLineIconVisible()

	local setting = HealGrid.SettingGet( 'scenariogroupShowCareerLineIcon' );

	if ( setting == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(self:Grid():GetSkinID(),'grid','unitFrame','careerLineIcon','isVisible') );
	elseif ( setting == 'HIDE' ) then
		return( false );
	else
		return( true );
	end

end

function HealGridUnitScenariogroupMember:GetUnitFrameBarVisibility( barID )

	return( HealGrid.SettingGet('scenariogroup'..self.unitFrameBars[barID].settingKey) );

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitScenariogroupMember:HitPoints()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'health') or 0 );

end

function HealGridUnitScenariogroupMember:HitPointsMax()

	return( 100 );

end

function HealGridUnitScenariogroupMember:HitPointsPercent()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'health') or 0 );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitScenariogroupMember:ActionPoints()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'ap') );

end

function HealGridUnitScenariogroupMember:ActionPointsMax()

	return( 100 );

end

function HealGridUnitScenariogroupMember:ActionPointsPercent()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'ap') );

end

-- ===========================================================================================================================
-- Morale
-- ===========================================================================================================================

function HealGridUnitScenariogroupMember:Morale()

	return( HealGridScenariogroup.Instance():GetUnitData(self:GetGroupIndex(),self:GetMemberIndex(),'morale') or 0 );

end

function HealGridUnitScenariogroupMember:MoraleLevel()

	return( HealGridUtility.MoraleToMoraleLevel(self:Morale()) );

end

-- ===========================================================================================================================
-- Buffs / Debuffs
-- ===========================================================================================================================

function HealGridUnitScenariogroupMember:ShouldShowDebuffFlags()

    return( HealGrid.SettingGet('scenariogroupShowDebuffFlags') ~= 'NONE' );

end

function HealGridUnitScenariogroupMember:ShouldShowDebuffFlag( flag )

    return( HealGrid.SettingGet('scenariogroupShowDebuffFlags') == 'ALL' or
			(HealGrid.SettingGet('scenariogroupShowDebuffFlags') == 'DISPELLABLE' and HealGrid.SettingGet('dispellableDebuffFlags',flag))
          );

end

-- order: reliability before accuracy !!! (better delayed data than no data at all)
function HealGridUnitScenariogroupMember:BuffGetMasterUnit()

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

function HealGridUnitScenariogroupMember:ShowDropdownMenu()

	local enableMenuItem = false;

    HealGrid.MenuHookSetUnit( self:GetUnitName() );

    EA_Window_ContextMenu.CreateContextMenu( SystemData.ActiveWindow.name, EA_Window_ContextMenu.CONTEXT_MENU_1 )

	SystemData.UserInput.selectedGroupMember = self:GetUnitName();

	-- claim main assist
	enableMenuItem = ( HealGridUtility.WStringChop(HealGridUtility.GetMainAssist()) == L"" );
	EA_Window_ContextMenu.AddMenuItem( L"Claim Main Assist", 
                                       BattlegroupHUD.OnMenuClickMakeMainAssist, (not enableMenuItem), true, EA_Window_ContextMenu.CONTEXT_MENU_1 );

	-- reassign main assist
	enableMenuItem = ( HealGridUtility.WStringChop(HealGridUtility.GetMainAssist()) == HealGridUtility.WStringChop(GameData.Player.name) );
	EA_Window_ContextMenu.AddMenuItem( GetString(StringTables.Default.LABEL_MAKE_MAIN_ASSIST), 
                                       BattlegroupHUD.OnMenuClickMakeMainAssist, (not enableMenuItem), true, EA_Window_ContextMenu.CONTEXT_MENU_1 );

	-- show scenario window
	EA_Window_ContextMenu.AddMenuItem( L"Show Scenariogroup Window", 
                                       HealGrid.MenuHookShowScenariogroupWindow, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 );

	-- the rest
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_TELL ),
                                       HealGrid.MenuHookTellUnit, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 );
    EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_TARGET ),
                                       HealGrid.MenuHookTargetUnit, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 );
   

    EA_Window_ContextMenu.Finalize()

end

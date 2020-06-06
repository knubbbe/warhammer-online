-- ========================================================================================================
-- 
-- ========================================================================================================

HealGridBattlegroup = HealGridGridFactory:New();

HealGridBattlegroup.myInstance = nil;

-- ========================================================================================================
-- New
-- ========================================================================================================

function HealGridBattlegroup:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = 'HG_HealGridBattlegroup';
	o.frameLabel = L"HealGrid (Warband)";
	o.templateName = 'HG_HealGridBattlegroupTemplate';
	o.parentFrameName = "Root";
	o.unitFrameSuffix = "_bg";
	o.skinID = HealGrid.SettingGet( 'battlegroupSkin' );
	o.skinSection = 'grid';

    t = HealGridGridFactory:New( o );

    setmetatable( t, self );
    self.__index = self;

	HealGridBattlegroup.myInstance = t;

    return( t );

end

-- ========================================================================================================
-- trivials
-- ========================================================================================================

function HealGridBattlegroup:GetOrientation( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('battlegroupGridOrientation') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','orientation') );
	end

	return( HealGrid.SettingGet('battlegroupGridOrientation') );

end

function HealGridBattlegroup:GetGrowth( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('battlegroupGridGrowth') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','growth') );
	end

	return( HealGrid.SettingGet('battlegroupGridGrowth') );

end

function HealGridBattlegroup:GetGrouping( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('battlegroupGridGrouping') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','grouping') );
	end

	return( HealGrid.SettingGet('battlegroupGridGrouping') );

end

function HealGridBattlegroup:GetUpdateThrottle()

	return( HealGrid.SettingGet('battlegroupUpdateThrottle') );

end

function HealGridBattlegroup:GetBuffUpdateThrottle()

	return( HealGrid.SettingGet('battlegroupBuffUpdateThrottle') );

end

-- =====================================================================================================
-- Initialization
-- =====================================================================================================

function HealGridBattlegroup:Initialize()

	HealGridGridFactory.Initialize( self );

end

-- =====================================================================================================
-- Update
-- =====================================================================================================

function HealGridBattlegroup:Update( timePassed )

	local isInBG, isInSG, gridGroupIdx;
    local groupNum = 1;
	local gridGrouping = self:GetGrouping();
	local resizeRootWindow = false;
	local anchorCell = false;

	-- visibility
	isInBG = HealGridBattlegroup.IsPlayerInBattlegroup();
	isInSG = HealGridScenariogroup.IsPlayerInScenariogroup();

	if ( ((not isInBG) or isInSG) or HealGrid.SettingGet('battlegroupStayHidden') ) then
		self:RootWindowSetShowing( false );
		return( false );
	end

	self:RootWindowSetShowing( true );

	-- update unit data
	HealGridGridFactory.UpdateBattlegroupData();

    -- group units, if required
    if ( gridGrouping == 'CAREER' or gridGrouping == 'ARCH' ) then
		self.gridUnitGroups = {};
		for g=HealGridGlobals.FIRST_BATTLEGROUP, HealGridGlobals.LAST_BATTLEGROUP do
			for i=HealGridGlobals.FIRST_BATTLEGROUP_MEMBER, HealGridGlobals.LAST_BATTLEGROUP_MEMBER do
				if ( HealGridGridFactory.warBattlegroupData[g].players[i] ~= nil ) then
					if ( gridGrouping == 'CAREER' ) then
						gridGroupIdx = HealGridGridFactory.warBattlegroupData[g].players[i].careerLine;
						self.gridUnitGroups[gridGroupIdx] = {group=0,unit=1};
					else
						gridGroupIdx = HealGridGlobals.arches[ HealGridGridFactory.warBattlegroupData[g].players[i].careerLine ];
						self.gridUnitGroups[gridGroupIdx] = {group=0,unit=1};
					end
				end
			end
		end
		if ( gridGrouping == 'CAREER' ) then
			for _,gridGroupIdx in ipairs(HealGridGlobals.gridCareerOrder) do				-- CAREER
				if ( self.gridUnitGroups[gridGroupIdx] ) then
					self.gridUnitGroups[gridGroupIdx].group = groupNum;
					groupNum = groupNum + 1;
				end
			end
		else																				 -- ARCH
			for _,gridGroupIdx in ipairs(HealGridGlobals.gridArchOrder) do
				if ( self.gridUnitGroups[gridGroupIdx] ) then
					self.gridUnitGroups[gridGroupIdx].group = groupNum;
					groupNum = groupNum + 1;
				end
			end
		end
	end

	-- update the cells
	for g=HealGridGlobals.FIRST_BATTLEGROUP, HealGridGlobals.LAST_BATTLEGROUP do
		for i=HealGridGlobals.FIRST_BATTLEGROUP_MEMBER, HealGridGlobals.LAST_BATTLEGROUP_MEMBER do
			if ( HealGridGridFactory.warBattlegroupData[g].players[i] ~= nil ) then
				if ( self.units[g] == nil ) then
					self.units[g] = {};
				end
				if ( self.units[g][i] == nil ) then
					self.units[g][i] = HealGridUnitBattlegroupMember:New( {groupIndex=g,memberIndex=i,frameSuffix=self:GetUnitFrameSuffix()} );
					self.units[g][i]:Initialize( self );
					self.units[g][i]:ApplySkin( HealGrid.SettingGet('battlegroupSkin'), 'grid' );
				end
				self:UnitDataInit( g, i, HealGridGridFactory.warBattlegroupData[g].players[i] );
				if ( gridGrouping == 'CAREER' ) then
					gridGroupIdx = self.units[g][i]:GetCareerLine();
					anchorCell = self.units[g][i]:SetGridPosXY( self.gridUnitGroups[gridGroupIdx].unit, self.gridUnitGroups[gridGroupIdx].group );
					self.gridUnitGroups[gridGroupIdx].unit = self.gridUnitGroups[gridGroupIdx].unit + 1;
				elseif ( gridGrouping == 'ARCH' ) then
					gridGroupIdx = self.units[g][i]:GetCareerArch();
					anchorCell = self.units[g][i]:SetGridPosXY( self.gridUnitGroups[gridGroupIdx].unit, self.gridUnitGroups[gridGroupIdx].group );
					self.gridUnitGroups[gridGroupIdx].unit = self.gridUnitGroups[gridGroupIdx].unit + 1;
				elseif ( gridGrouping == 'GROUP' ) then
					anchorCell = self.units[g][i]:SetGridPosXY( self.units[g][i]:GetMemberIndex(), self.units[g][i]:GetGroupIndex() );
				else
					anchorCell = false;
				end
				if ( anchorCell ) then
					self.units[g][i]:AnchorCell();
					resizeRootWindow = true;
				end
				self.units[g][i]:UpdateBuffs( timePassed );
				self.units[g][i]:OnUpdate( timePassed );
				self:NameMapAdd( self.units[g][i]:GetRealUnitName(), g, i );
			elseif ( self.units[g] and self.units[g][i] ) then
				anchorCell = self.units[g][i]:SetGridPosXY( 0, 0 );
				if ( anchorCell ) then
					self.units[g][i]:AnchorCell();
					resizeRootWindow = true;
				end
				self:UnitDataWipe( g, i );
				self.units[g][i]:UpdateVisibility();
			end
		end
	end

	if ( resizeRootWindow ) then
		self:RootWindowResize();
	end

	return( true );

end

-- =====================================================================================
-- Sizing
-- =====================================================================================

function HealGridBattlegroup:UnitFrameGetSize( skinID )

    local ufw, ufh;

    skinID = (skinID or self:GetSkinID());
    ufw = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'width' ) + HealGrid.SettingGet( 'battlegroupUnitFrameWidthAdjust' );
    ufh = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'height' ) + HealGrid.SettingGet( 'battlegroupUnitFrameHeightAdjust' );

	return ufw, ufh, ufw, ufh;

end

function HealGridBattlegroup:UnitContainerGetSize( skinID )

	local ufw, ufh;
	local unit = nil;
	local mc = 0;
	local gc = 0;

	skinID = (skinID or self:GetSkinID());

	ufw,ufh,tufw,tufh = self:UnitFrameGetSize( skinID );

	if ( self:GetGrouping() == 'CAREER' or self:GetGrouping() == 'ARCH' ) then
		for g=HealGridGlobals.FIRST_BATTLEGROUP, HealGridGlobals.LAST_BATTLEGROUP do
			for m=HealGridGlobals.FIRST_BATTLEGROUP_MEMBER, HealGridGlobals.LAST_BATTLEGROUP_MEMBER do
				unit = self:GetUnit( g, m );
				if ( unit ) then
					mc = math.max( mc, unit:GetGridPosX() );
					gc = math.max( gc, unit:GetGridPosY() );
				end
			end
		end
	else
		mc = HealGridGlobals.LAST_BATTLEGROUP_MEMBER;
		gc = HealGridGlobals.LAST_BATTLEGROUP;
	end

	if ( self:GetOrientation(skinID) == 'HORIZONTAL' ) then
		return tufw * mc,
				tufh * gc;
	else
		return tufw * gc,
				tufh * mc;
	end

end

-- =====================================================================================
-- Skinning
-- =====================================================================================

function HealGridBattlegroup:GetSkinID()

	return( HealGrid.SettingGet('battlegroupSkin') );

end

function HealGridBattlegroup:GetSkinSectionID()

	return( 'grid' );

end

-- =====================================================================================
-- HUD attaching
-- =====================================================================================

function HealGridBattlegroup:ShouldShowHUD()

	return( HealGrid.SettingGet('battlegroupShowHUD') );

end

-- #####################################################################################################
-- static
-- #####################################################################################################

function HealGridBattlegroup.IsPlayerInBattlegroup()

	HealGridGridFactory.UpdateBattlegroupData();

	for g,_ in ipairs(HealGridGridFactory.warBattlegroupData) do
		for m,_ in ipairs(HealGridGridFactory.warBattlegroupData[g].players) do
			if ( HealGridGridFactory.warBattlegroupData[g].players[m] ~= nil ) then
				return( true );
			end
		end
	end

	return( false );

end

function HealGridBattlegroup.Instance()

	return( HealGridBattlegroup.myInstance );

end

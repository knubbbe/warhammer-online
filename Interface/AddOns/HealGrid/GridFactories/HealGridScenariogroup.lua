-- ========================================================================================================
-- 
-- ========================================================================================================

HealGridScenariogroup = HealGridGridFactory:New();

HealGridScenariogroup.myInstance = nil;


-- ========================================================================================================
-- New
-- ========================================================================================================

function HealGridScenariogroup:New( o )

	if ( o == nil ) then
		o = {};
	end

	o.frameName = 'HG_HealGridScenariogroup';
	o.frameLabel = L"HealGrid (Scenario)";
	o.templateName = 'HG_HealGridScenariogroupTemplate';
	o.parentFrameName = "Root";
	o.unitFrameSuffix = "_sg";
	o.skinID = HealGrid.SettingGet( 'scenariogroupSkin' );
	o.skinSection = 'grid';
    
    t = HealGridGridFactory:New( o );

    setmetatable( t, self );
    self.__index = self;

	t.unitDataIndexMap = {};

	HealGridScenariogroup.myInstance = t;

    return( t );

end

-- ========================================================================================================
-- trivials
-- ========================================================================================================

function HealGridScenariogroup:GetOrientation( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('scenariogroupGridOrientation') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','orientation') );
	end

	return( HealGrid.SettingGet('scenariogroupGridOrientation') );

end

function HealGridScenariogroup:GetGrowth( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('scenariogroupGridGrowth') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','growth') );
	end

	return( HealGrid.SettingGet('scenariogroupGridGrowth') );

end

function HealGridScenariogroup:GetGrouping( skinID )

	skinID = skinID or self:GetSkinID();

	if ( HealGrid.SettingGet('scenariogroupGridGrouping') == 'SKIN' ) then
		return( HealGridSkin.GetSkinValue(skinID,'grid','grouping') );
	end

	return( HealGrid.SettingGet('scenariogroupGridGrouping') );

end

function HealGridScenariogroup:GetUpdateThrottle()

	return( HealGrid.SettingGet('scenariogroupUpdateThrottle') );

end

function HealGridScenariogroup:GetBuffUpdateThrottle()

	return( HealGrid.SettingGet('scenariogroupBuffUpdateThrottle') );

end

-- ========================================================================================================
-- Initialization
-- ========================================================================================================

function HealGridScenariogroup:Initialize()

	HealGridGridFactory.Initialize( self );

end

-- ========================================================================================================
-- Update
-- 						!!!!!!!! This needs to be redone and optimized !!!!!!!!!
-- ========================================================================================================

function HealGridScenariogroup:Update( timePassed )

	local numGroupsDisplayed, gridGroupIndex;
	local groupNum = 1;
	local gridGrouping = self:GetGrouping();
	local resizeRootWindow = false;
	local anchorCell = false;
	local collapseCount = 0;
	local idx = 0;
	
	-- check if in scenario
	if ((not HealGridScenariogroup.IsPlayerInScenariogroup()) or HealGrid.SettingGet('scenariogroupStayHidden')  ) then
		self:RootWindowSetShowing( false );
		return( false );
	end

	self:RootWindowSetShowing( true );

	-- prepare table
	HealGridGridFactory.UpdateScenariogroupData();
	self.unitDataIndexMap = {};
	self.gridUnitGroups = {};
	for i,_ in ipairs(HealGridGridFactory.warScenariogroupData) do
		if ( HealGridGridFactory.warScenariogroupData[i].sgroupindex ~= 0 and HealGridGridFactory.warScenariogroupData[i].sgroupslotnum ~= 0 ) then
			if ( self.unitDataIndexMap[HealGridGridFactory.warScenariogroupData[i].sgroupindex] == nil ) then
				self.unitDataIndexMap[HealGridGridFactory.warScenariogroupData[i].sgroupindex] = {};
			end
			self.unitDataIndexMap[HealGridGridFactory.warScenariogroupData[i].sgroupindex][HealGridGridFactory.warScenariogroupData[i].sgroupslotnum] = i;
			if ( gridGrouping == 'CAREER' ) then
				gridGroupIdx = HealGridGlobals.careerMap[HealGridGridFactory.warScenariogroupData[i].careerId];
				self.gridUnitGroups[gridGroupIdx] = {group=0,unit=1};
			elseif ( gridGrouping == 'ARCH' ) then
				gridGroupIdx = HealGridGlobals.arches[ HealGridGlobals.careerMap[HealGridGridFactory.warScenariogroupData[i].careerId] ];
				self.gridUnitGroups[gridGroupIdx] = {group=0,unit=1};
			end
		end
	end

	-- update gridUnitGroups if required
	if ( gridGrouping == 'CAREER' ) then
		for _,gridGroupIdx in ipairs(HealGridGlobals.gridCareerOrder) do				-- CAREER
			if ( self.gridUnitGroups[gridGroupIdx] ) then
				self.gridUnitGroups[gridGroupIdx].group = groupNum;
				groupNum = groupNum + 1;
			end
		end
	elseif ( gridGrouping == 'ARCH' ) then												 -- ARCH
		for _,gridGroupIdx in ipairs(HealGridGlobals.gridArchOrder) do
			if ( self.gridUnitGroups[gridGroupIdx] ) then
				self.gridUnitGroups[gridGroupIdx].group = groupNum;
				groupNum = groupNum + 1;
			end
		end
	end

	-- adjust indexes for: collapse, show ungroup units
	if ( gridGrouping == 'GROUP' and HealGrid.SettingGet('scenariogroupCollapseGroups') ) then
		for g=HealGridGlobals.FIRST_SCENARIOGROUP, HealGridGlobals.LAST_SCENARIOGROUP do
			if ( self.unitDataIndexMap[g] ~= nil ) then
				if ( collapseCount > 0 ) then
					for i=HealGridGlobals.FIRST_SCENARIOGROUP_MEMBER, HealGridGlobals.LAST_SCENARIOGROUP_MEMBER do			-- update the unit data
						idx = self.unitDataIndexMap[g][i];
						if ( idx ~= nil ) then
							HealGridGridFactory.warScenariogroupData[idx].war_sgroupindex = HealGridGridFactory.warScenariogroupData[idx].sgroupindex;		-- store original index
							HealGridGridFactory.warScenariogroupData[idx].war_sgroupslotnum = HealGridGridFactory.warScenariogroupData[idx].sgroupslotnum;
							HealGridGridFactory.warScenariogroupData[idx].sgroupindex = g - collapseCount;													-- set new index
							HealGridGridFactory.warScenariogroupData[idx].sgroupindex = i;
						end
					end
					self.unitDataIndexMap[g-collapseCount] = self.unitDataIndexMap[g];										-- move whole row/line
					self.unitDataIndexMap[g] = nil;
				end
			elseif ( HealGrid.SettingGet('scenariogroupCollapseGroups') ) then
				collapseCount = collapseCount + 1;
			end
		end
	end

	-- do the update
	numGroupsDisplayed = math.min( HealGridGlobals.LAST_SCENARIOGROUP, HealGrid.SettingGet('scenariogroupNumGroupsDisplayed') );

	for g=HealGridGlobals.FIRST_SCENARIOGROUP, HealGridGlobals.LAST_SCENARIOGROUP do
		for i=HealGridGlobals.FIRST_SCENARIOGROUP_MEMBER, HealGridGlobals.LAST_SCENARIOGROUP_MEMBER do
			if ( self.unitDataIndexMap[g] ~= nil and self.unitDataIndexMap[g][i] ~= nil ) then
				if ( self.units[g] == nil ) then
					self.units[g] = {};
				end
				if ( self.units[g][i] == nil ) then
					self.units[g][i] = HealGridUnitScenariogroupMember:New( {groupIndex=g,memberIndex=i,frameSuffix=self:GetUnitFrameSuffix()} );
					self.units[g][i]:Initialize( self );
					self.units[g][i]:ApplySkin( HealGrid.SettingGet('scenariogroupSkin'), 'grid' );
				end

				idx = self.unitDataIndexMap[g][i];
				self:UnitDataInit( g, i, HealGridGridFactory.warScenariogroupData[idx] );

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

				if ( g <= numGroupsDisplayed or gridGrouping ~= 'GROUP' ) then
					self.units[g][i]:UpdateBuffs( timePassed );
					self.units[g][i]:OnUpdate( timePassed );
				else
					self.units[g][i]:Hide();
					self.units[g][i]:ClearBuffCache();
				end

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

function HealGridScenariogroup:UnitFrameGetSize( skinID )

    local ufw, ufh;

    skinID = skinID or self:GetSkinID();

    ufw = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'width' ) + HealGrid.SettingGet( 'scenariogroupUnitFrameWidthAdjust' );
    ufh = HealGridSkin.GetSkinValue( skinID, self:GetSkinSectionID(), 'unitFrame', 'height' ) + HealGrid.SettingGet( 'scenariogroupUnitFrameHeightAdjust' );

	return ufw, ufh, ufw, ufh;

end

function HealGridScenariogroup:UnitContainerGetSize( skinID )

	local ufw, ufh, tufw, tufh, numGroupsDisplayed;
	local unit = nil;
	local mc = 0;
	local gc = 0;

	skinID = (skinID or self:GetSkinID());

	ufw,ufh,tufw,tufh = self:UnitFrameGetSize( skinID );

	if ( self:GetGrouping() == 'CAREER' or self:GetGrouping() == 'ARCH' ) then
		for g=HealGridGlobals.FIRST_SCENARIOGROUP, HealGridGlobals.LAST_SCENARIOGROUP do
			for m=HealGridGlobals.FIRST_SCENARIOGROUP_MEMBER, HealGridGlobals.LAST_SCENARIOGROUP_MEMBER do
				unit = self:GetUnit( g, m );
				if ( unit ) then
					mc = math.max( mc, unit:GetGridPosX() );
					gc = math.max( gc, unit:GetGridPosY() );
				end
			end
		end
	else
		mc = HealGridGlobals.LAST_SCENARIOGROUP_MEMBER;
		gc = math.min( HealGridGlobals.LAST_SCENARIOGROUP, HealGrid.SettingGet('scenariogroupNumGroupsDisplayed') );
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

function HealGridScenariogroup:GetSkinID()

	return( HealGrid.SettingGet('scenariogroupSkin') );

end

function HealGridScenariogroup:GetSkinSectionID()

	return( 'grid' );

end

-- ===========================================================================================================
-- main assist
-- ===========================================================================================================

function HealGridScenariogroup:GetMainAssist()

	local ma = L"";
	local playerName = HealGridUtility.WStringChop( GameData.Player.name );
	local isPlayerGroup = false;

	if ( HealGridUtility.IsEmptyTable(self.unitData) ) then
		return( L"" );
	end

	for g,_ in pairs(self.unitData) do
		ma = L"";
		for m,_ in pairs(self.unitData[g]) do
			if ( self.unitData[g][m].healGridUnitIsValid == true and HealGridUtility.WStringChop(self.unitData[g][m].name) == playerName ) then
				isPlayerGroup = true;
			end
			if ( self.unitData[g][m].healGridUnitIsValid == true and self.unitData[g][m].isMainAssist ) then
				ma = self.unitData[g][m].name;
			end
		end
		if ( isPlayerGroup ) then
			return( ma );
		end
	end

	return( L"" );

end

-- =====================================================================================
-- HUD attaching
-- =====================================================================================

function HealGridScenariogroup:ShouldShowHUD()

	return( HealGrid.SettingGet('scenariogroupShowHUD') );

end


-- #####################################################################################################
-- static
-- #####################################################################################################

function HealGridScenariogroup.IsPlayerInScenariogroup()

	if ( HealGridGridFactory.UseDummyData('SG') ) then
		return( true );
	else
		 return( GameData.Player.isInScenario or GameData.Player.isInSiege );
		-- return( GameData.Player.isInScenario );
	end

end

function HealGridScenariogroup.Instance()

	return( HealGridScenariogroup.myInstance );

end





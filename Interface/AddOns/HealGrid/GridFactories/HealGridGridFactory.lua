-- ========================================================================================================
-- 
-- ========================================================================================================

local MAX_NAME_MAP_RUN = 10;

HealGridGridFactory = {};

HealGridGridFactory.UPDATE_THROTTLE = 0.2;
HealGridGridFactory.BUFF_UPDATE_THROTTLE = 0.2;

HealGridGridFactory.useDummyData = { 							-- dummy data usage for testing
	G  = false,
	BG = false,
	SG = false,
	};
HealGridGridFactory.isGroupDataDirty = true;					-- data is dirty, needs update
HealGridGridFactory.isBattlegroupDataDirty = true;				-- data is dirty, needs update
HealGridGridFactory.isScenariogroupDataDirty = true;			-- data is dirty, needs update
HealGridGridFactory.warGroupData = {};							-- static cache for the war data
HealGridGridFactory.warBattlegroupData = {};					-- static cache for the war data
HealGridGridFactory.warScenariogroupData = {};					-- static cache for the war data

-- ========================================================================================================
-- New
-- ========================================================================================================

function HealGridGridFactory:New( o )

    local t = {};

    setmetatable( t, self );
    self.__index = self;

	t.units = {};								-- array with [group][member]
	t.unitData = {};							-- data for the units (used for groups, battlegroups, scenariogroups)
	t.gridUnitGroups = {};						-- buffer for grouping units in the grid
	t.updateDelay = 0;
	t.wipeDone = false;							-- wipe done after becoming invis
	t.nameMap = {};								-- mapping name -> [g][m]
	t.nameMapRun = 1;

	t.hud = nil;								-- the attached HUD (if any)

	if ( o ) then 
		t.frameName = o.frameName;
		t.frameLabel = o.frameLabel;
		t.templateName = o.templateName;
		t.parentFrameName = o.parentFrameName;
		t.unitFrameSuffix = o.unitFrameSuffix;
	end

    return( t );

end

-- ========================================================================================================
-- trivials
-- ========================================================================================================

function HealGridGridFactory:GetFrameName()

	return( self.frameName );

end

function HealGridGridFactory:GetFrameLabel()

	return( self.frameLabel );

end

function HealGridGridFactory:GetTemplateName()

	return( self.templateName );

end

function HealGridGridFactory:GetParentFrameName()

	return( self.parentFrameName );

end

function HealGridGridFactory:GetUnitContainerFrameName()

	return( self:GetFrameName().."UnitContainer" );

end

function HealGridGridFactory:GetHUDContainerFrameName()

	return( self:GetFrameName().."HUDContainer" );

end

function HealGridGridFactory:GetUnitFrameSuffix()

	return( self.unitFrameSuffix );

end

function HealGridGridFactory:GetOrientation( skinID )

	return( 'HORIZONTAL' );

end

function HealGridGridFactory:GetGrowth( skinID )

	return( 'DOWN' );

end

function HealGridGridFactory:GetGrouping( skinID )

	return( 'GROUP' );

end

function HealGridGridFactory:GetUpdateThrottle()

	return( HealGridGridFactory.UPDATE_THROTTLE );

end

function HealGridGridFactory:GetBuffUpdateThrottle()

	return( HealGridGridFactory.BUFF_UPDATE_THROTTLE );

end

function HealGridGridFactory:CanHavePets()

	return( false );

end

function HealGridGridFactory:ShowPets()

	return( false );

end

-- ========================================================================================================
-- Initialization
-- ========================================================================================================

function HealGridGridFactory:Initialize()

	CreateWindowFromTemplate( self:GetFrameName(), self:GetTemplateName(), self:GetParentFrameName() );

	if ( self:GetFrameLabel() ~= nil ) then
    	LayoutEditor.RegisterWindow( self:GetFrameName(), self:GetFrameLabel(), self:GetFrameLabel(),
      	                             false, false, true, nil );
	else
		WindowClearAnchors( self:GetFrameName() );
		WindowAddAnchor( self:GetFrameName(), 'topleft', self:GetParentFrameName()..'HUDContainer', 'topleft', 0, 0 ); 
		WindowSetScale( self:GetFrameName(), WindowGetScale(self:GetParentFrameName()) );
	end

end

-- ========================================================================================================
-- Shutdown
-- ========================================================================================================

function HealGridGridFactory:Shutdown()

	self:NameMapWipe();
	self:WipeUnits();

end

-- ========================================================================================================
-- Update
-- ========================================================================================================

function HealGridGridFactory:OnUpdate( timePassed )

    local totalTimePassed;

    -- Update the grid, if necessary
    totalTimePassed = self:PreUpdate( timePassed );
    if ( totalTimePassed >= 0 ) then
		self:Update( totalTimePassed );
		self:PostUpdate();
	end

	-- need to update HUD?
	self:UpdateHUDVisibility();
	if ( self:IsHUDVisible() ) then
		self.hud:OnUpdate( timePassed );
	end

end

-- returns -1 if no updated required, otherwise total time passed since last update
function HealGridGridFactory:PreUpdate( timePassed )

	local totalTimePassed;

	-- check delay
	self.updateDelay = self.updateDelay - timePassed;
	if ( self.updateDelay > 0 ) then
		return( -1 );
	end

	totalTimePassed = self:GetUpdateThrottle() + self.updateDelay * -1;
	self.updateDelay = self:GetUpdateThrottle();

	return( totalTimePassed );

end

function HealGridGridFactory:Update()

	d( "HealGridGridFactory:Update() needs to be overriden" );

end

function HealGridGridFactory:PostUpdate()

	self:NameMapRun();

end

-- =====================================================================================
-- Sizing
-- =====================================================================================

function HealGridGridFactory:UnitFrameGetSize( skinID )

	d( 'ABSTRACT HealGridGridFactory:UnitFrameGetSize() called' );

	return 0, 0, 0, 0;

end

function HealGridGridFactory:PetFrameGetHeight( skinID )

	d( 'ABSTRACT HealGridGridFactory:PetFrameGetSize() called' );

	return( 0 );

end

function HealGridGridFactory:UnitContainerGetSize( skinID )

	d( 'ABSTRACT HealGridGridFactory:UnitContainerGetSize() called' );

	return 0, 0;

end

function HealGridGridFactory:RootWindowGetSize( skinID )

	local uw, uh, hw, hh, hudGap;

	uw,uh = self:UnitContainerGetSize( skinID );

	if ( self:ShouldShowHUD() and self:GetHUD() ) then
		hw,hh = self:GetHUD():RootWindowGetSize( skinID );
		hudGap = HealGridGlobals.HUD_GAP;
	else
		hw = 0;
		hh = 0;
		hudGap = 0;
	end

	return math.max(uw,hw), uh + hh + hudGap, 		-- total
           uw, uh,	 								-- unit container
           hw, hh;									-- hud

end

function HealGridGridFactory:RootWindowResize( skinID )

	local w, h, uw, uh, hw, hh;
	local uOff = 0;
	local hOff = 0;

	skinID = (skinID or self:GetSkinID());

	-- the root window
	w,h,uw,uh,hw,hh = self:RootWindowGetSize( skinID );
	WindowSetDimensions( self:GetFrameName(), w, h );

	-- the attached HUD
	if ( hw > 0 and hh > 0 ) then
		if ( self:GetGrowth(skinID) == 'UP' and self:GetOrientation(skinID) == 'HORIZONTAL' ) then			-- attach grid to bottom
			uOff = 0;
			hOff = uh + HealGridGlobals.HUD_GAP;
		else
			uOff = hh + HealGridGlobals.HUD_GAP;
			hOff = 0;
		end
		WindowSetDimensions( self:GetHUDContainerFrameName(), hw, hh );
		WindowClearAnchors( self:GetHUDContainerFrameName() );
		if ( self:GetGrowth(skinID) == 'UP' and self:GetOrientation(skinID) == 'VERTICAL' ) then
			WindowAddAnchor( self:GetHUDContainerFrameName(), 'topright', self:GetFrameName(), 'topright', 0, hOff );			-- right align
		else
			WindowAddAnchor( self:GetHUDContainerFrameName(), 'topleft', self:GetFrameName(), 'topleft', 0, hOff );				-- left align
		end
		WindowSetShowing( self:GetHUDContainerFrameName(), true );
	else
		WindowSetDimensions( self:GetHUDContainerFrameName(), 0, 0 );
		WindowClearAnchors( self:GetHUDContainerFrameName() );
		WindowAddAnchor( self:GetHUDContainerFrameName(), 'topleft', self:GetFrameName(), 'topleft', 0, 0 );
		WindowSetShowing( self:GetHUDContainerFrameName(), false );
		uOff = 0;
	end

	-- the unit container
	WindowSetDimensions( self:GetUnitContainerFrameName(), uw, uh );
	WindowClearAnchors( self:GetUnitContainerFrameName() );
	if ( self:GetGrowth(skinID) == 'UP' and self:GetOrientation(skinID) == 'VERTICAL' ) then
		WindowAddAnchor( self:GetUnitContainerFrameName(), 'topright', self:GetFrameName(), 'topright', 0, uOff ); 				-- right align
	else
		WindowAddAnchor( self:GetUnitContainerFrameName(), 'topleft', self:GetFrameName(), 'topleft', 0, uOff ); 				-- left align
	end

end

-- =====================================================================================
-- Skinning
-- =====================================================================================

function HealGridGridFactory:GetSkinID()

	return( nil );

end

function HealGridGridFactory:GetSkinSectionID()

	return( nil );

end

function HealGridGridFactory:ApplySkin( skinID )

	skinID = (skinID or self:GetSkinID());

	-- the root/anchor window
	self:RootWindowResize( skinID );

	-- the units
	for g,_ in pairs(self.units) do
		for m,_ in pairs(self.units[g]) do
			self.units[g][m]:ApplySkin( skinID, self:GetSkinSectionID() );
		end
	end

	if ( self.hud ) then
		self.hud:ApplySkin( skinID );
	end

end

-- ===========================================================================================================
-- Get data for the unit
-- ===========================================================================================================

function HealGridGridFactory:UnitDataIsValid( g, m )

	return( self.unitData[g] ~= nil and self.unitData[g][m] ~= nil and self.unitData[g][m].healGridUnitIsValid == true );

end

function HealGridGridFactory:UnitDataInit( g, m, data )

	if ( self.unitData[g] ~= nil and self.unitData[g][m] ~= nil ) then
		for k,_ in pairs(self.unitData[g][m]) do
			self.unitData[g][m][k] = nil;
		end
	elseif ( self.unitData[g] ) then
		self.unitData[g][m] = {};
	else
		self.unitData[g] = {};
		self.unitData[g][m] = {};
	end

	if ( data ) then
		HealGridUtility.CloneTable( data, self.unitData[g][m] );
	end

	self.unitData[g][m].healGridUnitIsValid = true;

end

function HealGridGridFactory:UnitDataWipe( g, m )

	local unitObj;

	if ( self.unitData[g] ~= nil and self.unitData[g][m] ~= nil ) then
		unitObj = self:GetUnit( g, m );
		if ( unitObj ) then
			unitObj:ClearBuffCache();
		end
		for k,_ in pairs(self.unitData[g][m]) do
			self.unitData[g][m][k] = nil;
		end
		self.unitData[g][m].healGridUnitIsValid = false;
	end

end

function HealGridGridFactory:UnitDataWipeAll()

	for g,_ in pairs(self.unitData) do
		for m,_ in pairs(self.unitData[g]) do
			self:UnitDataWipe();
		end
	end

end

function HealGridGridFactory:GetUnitData( g, m, idx )

	if ( self:UnitDataIsValid(g,m) ) then
		return( self.unitData[g][m][idx] );
	end

	return( nil );

end

function HealGridGridFactory:GetPetData( g, m, idx )

	-- MIGHT NEED TO BE OVERRIDEN IN CHILDS !!!!

	if ( self:UnitDataIsValid(g,m) ) then
		return( self.unitData[g][m].Pet[idx] );
	end

	return( nil );

end

-- ===========================================================================================================
-- Units
-- ===========================================================================================================

function HealGridGridFactory:GetUnit( g, m )

	if ( self.units[g] ~= nil and self.units[g][m] ~= nil and self.units[g][m]:UnitExists() ) then
		return( self.units[g][m] );
	end

end

function HealGridGridFactory:WipeUnits()

	for g,_ in pairs(self.units) do
		for m,_ in pairs(self.units[g]) do
			self.units[g][m]:Destroy();
			self.units[g][m] = nil;
		end
	end

end

-- ===========================================================================================================
-- group leader
-- ===========================================================================================================

function HealGridGridFactory:GetGroupLeader()

	if ( HealGridUtility.IsEmptyTable(self.unitData) ) then
		return( L"" );
	end

	for g,_ in pairs(self.unitData) do
		for m,_ in pairs(self.unitData[g]) do
			if ( self.unitData[g][m].healGridUnitIsValid == true and self.unitData[g][m].isGroupLeader ) then
				return( self.unitData[g][m].name );
			end
		end
	end

	return( L"" );

end

-- ===========================================================================================================
-- main assist
-- ===========================================================================================================

function HealGridGridFactory:GetMainAssist()

	if ( HealGridUtility.IsEmptyTable(self.unitData) ) then
		return( L"" );
	end

	for g,_ in pairs(self.unitData) do
		for m,_ in pairs(self.unitData[g]) do
			if ( self.unitData[g][m].healGridUnitIsValid == true and self.unitData[g][m].isMainAssist ) then
				return( self.unitData[g][m].name );
			end
		end
	end

	return( L"" );

end

-- ===========================================================================================================
-- Visibility
-- ===========================================================================================================

function HealGridGridFactory:RootWindowSetShowing( doShow )

	if ( doShow and (not WindowGetShowing(self:GetFrameName())) ) then
		WindowSetShowing( self:GetFrameName(), true );
		self.wipeDone = false;
	elseif ( (not doShow) and WindowGetShowing(self:GetFrameName()) ) then
		WindowSetShowing( self:GetFrameName(), false );
		if ( not self.wipeDone ) then
			self:UnitDataWipeAll();
			self:NameMapWipe();
			self.wipeDone = true;
		end
	end

end

function HealGridGridFactory:IsRootWindowVisible()

	return( WindowGetShowing(self:GetFrameName()) );

end

-- =====================================================================================================
-- Range Scanning
-- =====================================================================================================

function HealGridGridFactory:RangeUpdateTargeted( targetRealName, previousTargetRealName )

	local g, m;

	-- --- new target, update range and labels
	if ( targetRealName ~= nil ) then
		g,m = self:NameMapGet( targetRealName );
		if ( g ~= 0 and m ~= 0 and self.units[g] ~= nil and self.units[g][m] ~= nil and 
			 self.units[g][m]:UnitExists() and self.units[g][m]:GetRealUnitName() == targetRealName )
		then
			self.units[g][m]:UpdateRange( 0 );
			self.units[g][m]:UpdateLabels();
			self.units[g][m]:ClearPendingTarget();
		end
	end

	-- --- previous target, reset labels (isTargeted)
	if ( previousTargetRealName ~= nil and targetRealName ~= previousTargetRealName ) then
		g,m = self:NameMapGet( previousTargetRealName );
		if ( g ~= 0 and m ~= 0 and self.units[g] ~= nil and self.units[g][m] ~= nil and 
			 self.units[g][m]:UnitExists() and self.units[g][m]:GetRealUnitName() == previousTargetRealName )
		then
			self.units[g][m]:UpdateLabels();
		end
	end

end

function HealGridGridFactory:SetUnitOutOfRange( realUnitName )

	local g,m = self:NameMapGet( realUnitName );

	if ( g ~= 0 and m ~= 0 and self.units[g] ~= nil and self.units[g][m] ~= nil and self.units[g][m]:UnitExists() and
        self.units[g][m]:GetRealUnitName() == realUnitName ) 
	then
		self.units[g][m]:SetOutOfRange();
	end

end

-- ===========================================================================================================
-- Name Map
-- ===========================================================================================================

function HealGridGridFactory:NameMapAdd( realUnitName, g, m )

	if ( self.nameMap[realUnitName] == nil ) then
		self.nameMap[realUnitName] = {g=g,m=m,runNo=self.nameMapRun};
	else
		self.nameMap[realUnitName].g=g;
		self.nameMap[realUnitName].m=m;
		self.nameMap[realUnitName].runNo=self.nameMapRun;
	end

end

function HealGridGridFactory:NameMapGet( realUnitName )

	if ( self.nameMap[realUnitName] ) then
		return self.nameMap[realUnitName].g, self.nameMap[realUnitName].m;
	end

	return 0, 0;

end

function HealGridGridFactory:NameMapGetUnit( realUnitName )

	local g,m = self:NameMapGet( realUnitName );

	if ( g ~= 0 and m ~= 0 and self.units[g] ~= nil and self.units[g][m] ~= nil and self.units[g][m]:UnitExists() ) then
		return( self.units[g][m] );
	end

	return( nil );

end

function HealGridGridFactory:NameMapRun()

	if ( self.nameMapRun == MAX_NAME_MAP_RUN ) then
		self.nameMapRun = 1;

		for k,v in pairs(self.nameMap) do
			if ( v.runNo ~= MAX_NAME_MAP_RUN ) then
				self.nameMap[k] = nil;
			else
				self.nameMap[k].runNo = 0;
			end
		end
	else
		self.nameMapRun = self.nameMapRun + 1;
	end

end

function HealGridGridFactory:NameMapWipe()

	for k,v in pairs(self.nameMap) do
		self.nameMap[k] = nil;
	end

end

-- =====================================================================================
-- HUD attaching
-- =====================================================================================

function HealGridGridFactory:GetHUD()

	return( self.hud );

end

function HealGridGridFactory:ShouldShowHUD()

	return( false );

end

function HealGridGridFactory:IsHUDVisible()

	return( self.hud ~= nil and self:IsRootWindowVisible() and self.hud:IsRootWindowVisible() );

end

function HealGridGridFactory:UpdateHUDVisibility()

	local shouldShowHUD = self:ShouldShowHUD();

	if ( shouldShowHUD and self.hud == nil ) then
		self.hud = HealGridHUD:New( {frameName=self:GetFrameName()..'HUD',
                                     frameLabel=nil,
                                     parentFrameName=self:GetFrameName(),
                                     unitFrameSuffix = self:GetUnitFrameSuffix(),
                                     skinID = self:GetSkinID(),
                                     skinSection = self:GetSkinSectionID()} );
		self.hud:Initialize( self );
		self.hud:ApplySkin( self:GetSkinID() );
		self:RootWindowResize( self:GetSkinID() );
	end

	if ( shouldShowHUD and (not self.hud:IsRootWindowVisible()) ) then
		self.hud:RootWindowSetShowing( true );
		self:RootWindowResize( self:GetSkinID() );
	elseif ( (not shouldShowHUD) and self.hud ~= nil and self.hud:IsRootWindowVisible() ) then
		self.hud:RootWindowSetShowing( false );
		self:RootWindowResize( self:GetSkinID() );
	end

end

-- #########################################################################################################################################
-- STATIC GROUP DATA HANDLING
-- #########################################################################################################################################

function HealGridGridFactory.SetDataDirty()

	HealGridGridFactory.isGroupDataDirty = true;
	HealGridGridFactory.isBattlegroupDataDirty = true;
	HealGridGridFactory.isScenariogroupDataDirty = true;

end

function HealGridGridFactory.ToggleUseDummyData( grpKey, verbose )

	local onOff = 'Off';

	grpKey = string.upper( grpKey );

	if ( grpKey == 'G' or grpKey == 'BG' or grpKey == 'SG' ) then
		HealGridGridFactory.useDummyData[grpKey] = not HealGridGridFactory.useDummyData[grpKey];
		if ( verbose ) then
			if ( HealGridGridFactory.useDummyData[grpKey] ) then
				onOff = 'On';
			end
			d( 'Dummy data usage for '..grpKey..' now '..onOff );
		end
	elseif ( verbose ) then
		d( 'Invalid key, use G, BG or SG' );
	end

end

function HealGridGridFactory.SetUseDummyData( grpKey, flag )

	HealGridGridFactory.useDummyData[grpKey] = flag;

end

function HealGridGridFactory.UseDummyData( grpKey )

--	local data;

--	if ( HealGridGridFactory.useDummyData[grpKey] ) then					-- TODO: check to see if not in REAL group !!??
--		if ( GameData.Player.isInScenario ) then
--			HealGridGridFactory.useDummyData[grpKey] = false;
--		else
--			data = GetGroupData();
--		end
--	end

	return( HealGridGridFactory.useDummyData[grpKey] );

end

function HealGridGridFactory.UpdateGroupData()

	if ( HealGridGridFactory.UseDummyData('G') ) then
		HealGridGridFactory.warGroupData = HealGridDummyData.groupData;
	elseif ( HealGridGridFactory.isGroupDataDirty ) then
		HealGridGridFactory.warGroupData = GetGroupData();
		HealGridGridFactory.isGroupDataDirty = false;
	end

end

function HealGridGridFactory.UpdateBattlegroupData()

	if ( HealGridGridFactory.UseDummyData('BG') ) then
		HealGridGridFactory.warBattlegroupData = HealGridDummyData.battlegroupData;
	elseif ( HealGridGridFactory.isBattlegroupDataDirty ) then
		HealGridGridFactory.warBattlegroupData = GetBattlegroupMemberData();
		HealGridGridFactory.isBattlegroupDataDirty = false;
	end

end

function HealGridGridFactory.UpdateScenariogroupData()

	if ( HealGridGridFactory.UseDummyData('SG') ) then
		HealGridGridFactory.warScenariogroupData = HealGridDummyData.scenariogroupData;
	elseif ( HealGridGridFactory.isScenariogroupDataDirty ) then
		HealGridGridFactory.warScenariogroupData = GameData.GetScenarioPlayerGroups();
		HealGridGridFactory.isScenariogroupDataDirty = false;
	end

end

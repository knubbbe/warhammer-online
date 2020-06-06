-- ========================================================================================================
-- HealGrid by rmet0815
-- ========================================================================================================

HealGrid = {};

HealGrid.VERSION = 02000012;							-- vMM.RRR.mmm

HealGrid.settingsIndex = "";
HealGrid.restoreTargetName = nil;
HealGrid.restoreTargetMode = nil;
HealGrid.rangeScanUpdateDelay = 0;

HealGrid.currentFriendlyTargetRealName = nil;			-- name of the real target i have currently targeted

HealGrid.ticker = 0;

HealGrid.cachedCareerPoints = 0;						-- caching as there is no query method
HealGrid.lastCareerPointLevel = 'UNKNOWN';				-- for tracking sound effects

HealGrid.playerMoraleLevel = 0;							-- morale tracking for player (no function to get it direclty)

HealGrid.menuHookUnitName = nil;

-- =====================================================================================================
-- Initialization
-- =====================================================================================================

function HealGrid.Initialize()

	-- initialize and update the settings
	HealGrid.SettingsInitialize();

	-- initialize the Icon
	HealGridIcon.Initialize();

    -- initialize the tags
    HealGridTags.Initialize();

	-- initialize the buff tracker
	HealGridBuffTrack.Initialize();

	-- initialize the mouse click
	HealGridMouseClick.Initialize();

	-- event handler registrations
	RegisterEventHandler( SystemData.Events.PLAYER_TARGET_UPDATED, "HealGrid.OnPlayerTargetUpdated" );
	RegisterEventHandler( SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "HealGrid.CareerPointsUpdated" );
	RegisterEventHandler( SystemData.Events.PLAYER_MORALE_UPDATED, "HealGrid.MoraleUpdated" );

    RegisterEventHandler( SystemData.Events.LOADING_END, "HealGrid.OnLoadingEnd" );
    RegisterEventHandler( SystemData.Events.RELOAD_INTERFACE, "HealGrid.OnLoadingEnd" );

	-- Create the grid-factory singletons
	HealGridHUDMain:New();
	HealGridHUDMain.Instance():Initialize();
	HealGridHUDMain.Instance():ApplySkin();
	HealGridGroup:New();
	HealGridGroup.Instance():Initialize();
	HealGridGroup.Instance():ApplySkin();
	HealGridBattlegroup:New();
	HealGridBattlegroup.Instance():Initialize();
	HealGridBattlegroup.Instance():ApplySkin();
	HealGridScenariogroup:New();
	HealGridScenariogroup.Instance():Initialize();
	HealGridScenariogroup.Instance():ApplySkin();

end

-- =====================================================================================================
-- Shutdown
-- =====================================================================================================

function HealGrid.Shutdown()

	-- cleanup the grid-factory singletons
	HealGridHUDMain.Instance():Shutdown();
	HealGridGroup.Instance():Shutdown();
	HealGridBattlegroup.Instance():Shutdown();
	HealGridScenariogroup.Instance():Shutdown();

	-- cleanup the buff tracker
	HealGridBuffTrack.Shutdown();

	-- cleanup the mouse click
	HealGridMouseClick.Shutdown();

    -- shutdown the tags
    HealGridTags.Shutdown();

    -- shutdown the icon
    HealGridIcon.Shutdown();

	-- undo "hidings"
	HealGridUtility.UpdateWARPlayerFrameVisibility( true );
	HealGridUtility.UpdateWARTargetFrameVisibility( true );
	HealGridUtility.UpdateWARWarbandFramesVisibility( true );
	HealGridUtility.UpdateWARGroupFrameVisibility( true );
	HealGridUtility.UpdateWARCastBarVisibility( true );
	HealGridUtility.UpdateWARCareerPointsFrameVisibility( true );

end

-- =====================================================================================================
-- Event loading finsihed
-- =====================================================================================================

function HealGrid.OnLoadingEnd()

	-- register the slash cmd
	HealGrid.RegisterLibSlash();

	-- update frame visibility
	HealGridUtility.UpdateWARPlayerFrameVisibility();
	HealGridUtility.UpdateWARTargetFrameVisibility();
	HealGridUtility.UpdateWARWarbandFramesVisibility();
	HealGridUtility.UpdateWARGroupFrameVisibility();
	HealGridUtility.UpdateWARCastBarVisibility();
	HealGridUtility.UpdateWARCareerPointsFrameVisibility();

end

-- =====================================================================================================
-- Update handling
-- =====================================================================================================

function HealGrid.OnUpdate( timePassed )
    
	HealGrid.ticker = HealGrid.ticker + timePassed;

	-- set the data cace dirty to force update
	HealGridGridFactory.SetDataDirty();

	-- grid-factory singletons
	HealGridHUDMain.Instance():OnUpdate( timePassed );
	HealGridGroup.Instance():OnUpdate( timePassed );
	HealGridBattlegroup.Instance():OnUpdate( timePassed );
	HealGridScenariogroup.Instance():OnUpdate( timePassed );

	-- the bar(s), via singleton
	HealGridProgressBar.OnUpdate( timePassed );

end

-- =====================================================================================================
-- Career points sounds
-- =====================================================================================================

function HealGrid.CareerPointsUpdated( previousCareerPoints, currentCareerPoints )

    local cpLevel;

	HealGrid.cachedCareerPoints = currentCareerPoints;

	if ( HealGrid.SettingGet('playCareerPointSound') ) then
		cpLevel = HealGridUtility.GetCareerPointLevel( currentCareerPoints );
		if ( cpLevel ~= HealGrid.lastCareerPointLevel ) then
			if ( cpLevel == 'HIGH' ) then
				PlaySound( GameData.Sound.RVR_FLAG_OFF );
			end
			HealGrid.lastCareerPointLevel = cpLevel;
		end
	end

end

-- =====================================================================================================
-- Morale Tracking
-- =====================================================================================================

function HealGrid.MoraleUpdated( moralePercent, moraleLevel )

	HealGrid.playerMoraleLevel = moraleLevel;

end

function HealGrid.PlayerMoraleLevel()

	return( HealGrid.playerMoraleLevel );

end

-- =====================================================================================================
-- Player Target Update Event
-- =====================================================================================================

-- eg. 'mouseovertarget', 871, 4
function HealGrid.OnPlayerTargetUpdated( targetClassification, targetID, targetType )

	local friendlyTargetRealName;

    TargetInfo:UpdateFromClient();

	-- get new friendly target name
	friendlyTargetRealName = TargetInfo:UnitName('selffriendlytarget');
	if ( friendlyTargetRealName == nil or friendlyTargetRealName == L"" ) then
		friendlyTargetRealName = nil;
	else
		friendlyTargetRealName = HealGridUtility.WStringChop( friendlyTargetRealName );
	end

	-- process friendly target name changes
	if ( friendlyTargetRealName ~= HealGrid.currentFriendlyTargetRealName and (friendlyTargetRealName ~= nil or HealGrid.currentFriendlyTargetRealName ~= nil) ) then
		HealGrid.RangeScanTarget( friendlyTargetRealName, HealGrid.currentFriendlyTargetRealName );	
	end

	-- store values
	HealGrid.currentFriendlyTargetRealName = friendlyTargetRealName;

end

-- =====================================================================================================
-- Ticker
-- =====================================================================================================

function HealGrid.Ticker()

	return( HealGrid.ticker );

end

-- =====================================================================================================
-- Range 
-- =====================================================================================================

function HealGrid.IsUnitInRange( unitName, unitIsFriendly, unitIsDead )

    local valid = false;
    local selected = false;
    local abilityID = 0;
    local targetName = L"";

	unitIsFriendly = (unitIsFriendly or TargetInfo:UnitIsFriendly());
	unitName = HealGridUtility.WStringChop( unitName );

    if ( HealGridUtility.WStringChop(GameData.Player.name) == unitName ) then
        return true, (unitName == HealGridUtility.WStringChop(TargetInfo:UnitName('selffriendlytarget')));
	elseif ( unitIsDead ) then
        targetName = HealGridUtility.WStringChop( TargetInfo:UnitName('selffriendlytarget') );
        abilityID = HealGrid.SettingGet( 'rangeScanResurrectAbility' );
    elseif ( unitIsFriendly ) then
        targetName = HealGridUtility.WStringChop( TargetInfo:UnitName('selffriendlytarget') );
        abilityID = HealGrid.SettingGet( 'rangeScanFriendlyAbility' );
    else
        targetName = HealGridUtility.WStringChop( TargetInfo:UnitName('selfhostiletarget') );
        abilityID = HealGrid.SettingGet( 'rangeScanHostileAbility' );
    end

    if ( abilityID ~= 0 and unitName == targetName ) then
        valid,selected = IsTargetValid( abilityID );
    end

    return valid, selected;

end

function HealGrid.RangeScanTarget( targetName, previousTargetName )

	HealGridHUDMain.Instance():RangeUpdateTargeted( targetName, previousTargetName );
	HealGridGroup.Instance():RangeUpdateTargeted( targetName, previousTargetName );
	HealGridBattlegroup.Instance():RangeUpdateTargeted( targetName, previousTargetName );
	HealGridScenariogroup.Instance():RangeUpdateTargeted( targetName, previousTargetName );

end

function HealGrid.SetUnitOutOfRange( realUnitName )

	if ( realUnitName == nil or realUnitName == L"" ) then
		return;
	end

	HealGridHUDMain.Instance():SetUnitOutOfRange( realUnitName );
	HealGridGroup.Instance():SetUnitOutOfRange( realUnitName );
	HealGridBattlegroup.Instance():SetUnitOutOfRange( realUnitName );
	HealGridScenariogroup.Instance():SetUnitOutOfRange( realUnitName );

end

-- =====================================================================================================
-- Settings
-- =====================================================================================================

function HealGrid.SettingsInitialize()

	local saveFileVersion = nil;
	local playerCareerLine = HealGridGlobals.careerMap[GameData.Player.career.id];

	HealGrid.settingsIndex = WStringToString( HealGridUtility.WStringChop(GameData.Account.ServerName) ) .. ':' .. 
							 WStringToString( HealGridUtility.WStringChop(GameData.Player.name) );
--	HealGrid.settingsIndex = WStringToString( wstring.sub( GameData.Player.name, 1, wstring.len(GameData.Player.name)-2 ) );

	if ( HealGridSettings == nil ) then
		HealGridSettings = {};
	end

	if ( HealGridSettings[HealGrid.settingsIndex] == nil ) then
		HealGridSettings[HealGrid.settingsIndex] = {};
	end

	saveFileVersion = (HealGridSettings[HealGrid.settingsIndex].version or 01000000);

	-- ----- convert old playernamed based settings to server:player settings
	local oldSettingsIndex = WStringToString( wstring.sub( GameData.Player.name, 1, wstring.len(GameData.Player.name)-2 ) );
	if ( HealGridSettings ~= nil and HealGridSettings[oldSettingsIndex] ~= nil ) then
		HealGridSettings[HealGrid.settingsIndex] = HealGridUtility.CopyVariable( HealGridSettings[oldSettingsIndex] );
		HealGridSettings[oldSettingsIndex] = nil;
	end

	-- ----- pre-default: update version
	if ( saveFileVersion > 01000000 and (saveFileVersion < HealGrid.VERSION or saveFileVersion % 2 == 1) ) then
		if ( saveFileVersion < 01004012 ) then
			HealGridSettings[HealGrid.settingsIndex].mouseClickMap = nil;
		end
	end

	-- ----- init the career specific defaults
	for k,v in pairs(HealGridSettingsDefault._careers[playerCareerLine]) do
		if ( HealGridSettings[HealGrid.settingsIndex][k] == nil ) then
			if ( type(v) == 'table' ) then
				HealGridSettings[HealGrid.settingsIndex][k] = HealGridUtility.CopyTable( v );
			else
				HealGridSettings[HealGrid.settingsIndex][k] = v;
			end
		end
	end

	-- ----- init with defaults
	for k,v in pairs(HealGridSettingsDefault) do
		if ( k ~= '_careers' and HealGridSettings[HealGrid.settingsIndex][k] == nil ) then
			if ( type(v) == 'table' ) then
				HealGridSettings[HealGrid.settingsIndex][k] = HealGridUtility.CopyTable( v );
			else
				HealGridSettings[HealGrid.settingsIndex][k] = v;
			end
		end
	end

	-- ----- post-default: update version
	if ( (saveFileVersion <= HealGrid.VERSION and saveFileVersion > 01000000) ) then
		if ( saveFileVersion < 01004007 ) then
			WindowSetDimensions( 'HGG_HealGrid', 1000, 800 );
		end
		if ( saveFileVersion < 01004009 ) then
			HealGridSettings.trackedBuffs = nil;
			HealGridSettings.trackedDebuffs = nil;
		end
		if ( saveFileVersion < 01004012 ) then
			HealGridSettings[HealGrid.settingsIndex].retargetMode = HealGridSettings[HealGrid.settingsIndex].mouseOverCastRestoreTargetMode;
			HealGridSettings[HealGrid.settingsIndex].mouseOverCastRestoreTargetMode = nil;
		end
		if ( saveFileVersion < 01004014 ) then
			local mcm = HealGridUtility.CopyTable( HealGridSettings[HealGrid.settingsIndex].mouseClickMap );
			for k,_ in pairs(HealGridSettings[HealGrid.settingsIndex].mouseClickMap) do
				HealGridSettings[HealGrid.settingsIndex].mouseClickMap[k] = nil;
			end
			for k,_ in pairs(mcm) do
				HealGridSettings[HealGrid.settingsIndex].mouseClickMap['UNIT_'..k] = HealGridUtility.CopyTable( mcm[k] );
				HealGridSettings[HealGrid.settingsIndex].mouseClickMap['UNIT_'..k].frameType = 'UNIT';
			end
		end
		if ( saveFileVersion < 01004016 ) then
			for k,_ in pairs(HealGridSettings[HealGrid.settingsIndex].trackedBuffs) do
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castSelfStackCount = 2;
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castOtherAggregateCount = 2;
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].filterCastBySelf = true;
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].filterCastByOther = true;
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].filterCastOnFriendly = true;
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].filterCastOnHostile = true;
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castSelfSignColor = 'DEEP_SKY_BLUE';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castSelfBackgroundColor = 'TRANSPARENT';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castSelfMultipleSignColor = 'BLACK';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castSelfMultipleBackgroundColor = 'DEEP_SKY_BLUE';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castOtherSignColor = 'BLUE';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castOtherBackgroundColor = 'TRANSPARENT';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castOtherMultipleSignColor = 'WHITE';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].castOtherMultipleBackgroundColor = 'BLUE';
			end
		end
		if ( saveFileVersion < 01005004 ) then
			for k,_ in pairs(HealGridSettings[HealGrid.settingsIndex].trackedBuffs) do
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].positionInFrame = 'TOPLEFT';
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].filterCastBySelf = true;
				HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].filterCastByOther = true;
			end
		end
		if ( saveFileVersion < 01005005 ) then
			HealGridSettings[HealGrid.settingsIndex].hudShowPlayerDebuffFlags = 'ALL';
			HealGridSettings[HealGrid.settingsIndex].hudShowFriendlyTargetDebuffFlags = 'ALL';
			HealGridSettings[HealGrid.settingsIndex].hudShowHostileTargetDebuffFlags = 'ALL'
			HealGridSettings[HealGrid.settingsIndex].groupShowDebuffFlags = 'ALL';
			HealGridSettings[HealGrid.settingsIndex].battlegroupShowDebuffFlags = 'ALL';
			HealGridSettings[HealGrid.settingsIndex].scenariogroupShowDebuffFlags = 'ALL';
		end
		if ( saveFileVersion < 01005006 ) then
			if ( HealGridSettings[HealGrid.settingsIndex].showCareerLineIcon ~= nil ) then
				HealGridSettings[HealGrid.settingsIndex].hudShowCareerLineIcon = HealGridSettings[HealGrid.settingsIndex].showCareerLineIcon;
				HealGridSettings[HealGrid.settingsIndex].groupShowCareerLineIcon = HealGridSettings[HealGrid.settingsIndex].showCareerLineIcon;
				HealGridSettings[HealGrid.settingsIndex].battlegroupShowCareerLineIcon = HealGridSettings[HealGrid.settingsIndex].showCareerLineIcon;
				HealGridSettings[HealGrid.settingsIndex].scenariogroupShowCareerLineIcon = HealGridSettings[HealGrid.settingsIndex].showCareerLineIcon;
			end
			if ( HealGridSettings[HealGrid.settingsIndex].healthDisplayMode ~= nil ) then
				HealGridSettings[HealGrid.settingsIndex].hudHealthDisplayMode = HealGridSettings[HealGrid.settingsIndex].healthDisplayMode;
				HealGridSettings[HealGrid.settingsIndex].groupHealthDisplayMode = HealGridSettings[HealGrid.settingsIndex].healthDisplayMode;
				HealGridSettings[HealGrid.settingsIndex].battlegroupHealthDisplayMode = HealGridSettings[HealGrid.settingsIndex].healthDisplayMode;
				HealGridSettings[HealGrid.settingsIndex].scenariogroupHealthDisplayMode = HealGridSettings[HealGrid.settingsIndex].healthDisplayMode;
			end
			if ( HealGridSettings[HealGrid.settingsIndex].healthDisplayBarBackground ~= nil ) then
				HealGridSettings[HealGrid.settingsIndex].hudHealthDisplayBarBackground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarBackground;
				HealGridSettings[HealGrid.settingsIndex].groupHealthDisplayBarBackground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarBackground;
				HealGridSettings[HealGrid.settingsIndex].battlegroupHealthDisplayBarBackground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarBackground;
				HealGridSettings[HealGrid.settingsIndex].scenariogroupHealthDisplayBarBackground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarBackground;
			end
			if ( HealGridSettings[HealGrid.settingsIndex].healthDisplayBarForeground ~= nil ) then
				HealGridSettings[HealGrid.settingsIndex].hudHealthDisplayBarForeground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarForeground;
				HealGridSettings[HealGrid.settingsIndex].groupHealthDisplayBarForeground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarForeground;
				HealGridSettings[HealGrid.settingsIndex].battlegroupHealthDisplayBarForeground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarForeground;
				HealGridSettings[HealGrid.settingsIndex].scenariogroupHealthDisplayBarForeground = HealGridSettings[HealGrid.settingsIndex].healthDisplayBarForeground;
			end
		end
		if ( saveFileVersion < 01007002 ) then
			if ( HealGridSettings[HealGrid.settingsIndex].trackedBuffs ~= nil ) then
				for k,_ in pairs(HealGridSettings[HealGrid.settingsIndex].trackedBuffs) do
					if ( HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].positionInFrame == nil ) then
						-- nop;	
					elseif ( HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].positionInFrame == 'TOPLEFT' ) then
						HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].labelIndex = 1;
					elseif ( HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].positionInFrame == 'LEFT' ) then
						HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].labelIndex = 2;
					else
						HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].labelIndex = 1;
					end
					HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].positionInFrame = nil;
				end
			end
		end
		if ( saveFileVersion < 01007008 ) then
			HealGridSettings[HealGrid.settingsIndex].hudSkin = HealGridGlobals.DEFAULT_SKIN_ID;
			HealGridSettings[HealGrid.settingsIndex].groupSkin = HealGridGlobals.DEFAULT_SKIN_ID;
			HealGridSettings[HealGrid.settingsIndex].battlegroupSkin = HealGridGlobals.DEFAULT_SKIN_ID;
			HealGridSettings[HealGrid.settingsIndex].scenariogroupSkin = HealGridGlobals.DEFAULT_SKIN_ID;

			HealGridSettings[HealGrid.settingsIndex].hudShowCareerLineIcon = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].groupShowCareerLineIcon = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].groupGridOrientation = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].groupGridGrowth = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].battlegroupShowCareerLineIcon = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].battlegroupGridOrientation = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].battlegroupGridGrowth = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].scenariogroupShowCareerLineIcon = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].scenariogroupGridOrientation = 'SKIN';
			HealGridSettings[HealGrid.settingsIndex].scenariogroupGridGrowth = 'SKIN';

			HealGridSkinModification = {};
			HealGridSkinModification.skins = {};
		end
	end

	-- ----- cleanup "old", no longer used settings
	for k,_ in pairs(HealGridSettings[HealGrid.settingsIndex]) do
		if ( HealGridSettingsDefault[k] == nil ) then
			HealGridSettings[HealGrid.settingsIndex][k] = nil;
		end
	end

	-- ----- save current version
	HealGridSettings[HealGrid.settingsIndex].version = HealGrid.VERSION;

end

function HealGrid.SettingGet( i, i2, i3 )

	local isValid = false;

	if ( i == nil ) then
		isValid = false;
	elseif ( i ~= nil and HealGridSettings[HealGrid.settingsIndex][i] == nil ) then
		isValid = false;
	elseif ( i2 ~= nil and HealGridSettings[HealGrid.settingsIndex][i][i2] == nil ) then
		isValid = false;
	elseif ( i3 ~= nil and HealGridSettings[HealGrid.settingsIndex][i][i2][i3] == nil ) then
		isValid = false;
	else
		isValid = true;
	end

	if ( isValid == false ) then
		d( "HealGrid.SettingGet(): No such setting!" ); d( i or 'NIL' ); d( i2 or 'NIL' ); d( i3 or 'NIL' );
		return( nil );
	elseif ( i3 ~= nil ) then
		return( HealGridUtility.CopyVariable(HealGridSettings[HealGrid.settingsIndex][i][i2][i3]) );
	elseif ( i2 ~= nil ) then
		return( HealGridUtility.CopyVariable(HealGridSettings[HealGrid.settingsIndex][i][i2]) );
	elseif ( i ~= nil ) then
		return( HealGridUtility.CopyVariable(HealGridSettings[HealGrid.settingsIndex][i]) );
	end

	d( "HealGrid.SettingGet(): No such setting!" ); d( i or 'NIL' ); d( i2 or 'NIL' ); d( i3 or 'NIL' );

	return( nil );

end

function HealGrid.SettingSet( i, i2, i3, i4 )

	local isValid = false;
	local value = nil;

	if ( i == nil or i2 == nil ) then
		isValid = false;
	elseif ( i ~= nil and i2 ~= nil and HealGridSettingsDefault[i] == nil ) then
		isValid = false;
	elseif ( i2 ~= nil and i3 ~= nil and HealGridSettingsDefault[i][i2] == nil ) then
		isValid = false;
	elseif ( i3 ~= nil and i4 ~= nil and HealGridSettingsDefault[i][i2][i3] == nil ) then
		isValid = false;
	else
		isValid = true;
	end

	if ( isValid == false ) then
		d( "HealGrid.SettingSet(): No such setting!" ); d( i or 'NIL' ); d( i2 or 'NIL' ); d( i3 or 'NIL' ); d( i4 or 'NIL' );
	elseif ( i4 ~= nil ) then
		HealGridSettings[HealGrid.settingsIndex][i][i2][i3] = HealGridUtility.CopyVariable( i4 );
	elseif ( i3 ~= nil ) then
		HealGridSettings[HealGrid.settingsIndex][i][i2] = HealGridUtility.CopyVariable( i3 );
	elseif ( i2 ~= nil ) then
		HealGridSettings[HealGrid.settingsIndex][i] = HealGridUtility.CopyVariable( i2 );
	else
		d( "HealGrid.SettingSet(): No such setting!" ); d( i or 'NIL' ); d( i2 or 'NIL' ); d( i3 or 'NIL' ); d( i4 or 'NIL' );
	end

end

-- =====================================================================================================
-- Unit dropdown menu hooks
--
-- do not store the unit-object here, as it might get destructed in the meantime!!
-- =====================================================================================================

function HealGrid.MenuHookSetUnit( unitName )

	HealGrid.menuHookUnitName = unitName;

end

--function HealGrid.MenuHookShowBattlegroupWindow()
--
--	WindowSetShowing( "BattlegroupWindow", true );
--	HealGrid.menuHookUnitName = nil;
--
--end

function HealGrid.MenuHookShowScenariogroupWindow()

	WindowSetShowing( "ScenarioGroupWindow", true );
	HealGrid.menuHookUnitName = nil;

end

function HealGrid.MenuHookTargetUnit()

	if ( HealGrid.menuHookUnitName ~= nil ) then
	
	    message = L"/target " .. HealGrid.menuHookUnitName;
		SendChatText(towstring(message), L"")
	end

	HealGrid.menuHookUnitName = nil;

end

function HealGrid.MenuHookAssistUnit()

	if ( HealGrid.menuHookUnitName ~= nil ) then
	  
	end

	HealGrid.menuHookUnitName = nil;

end

function HealGrid.MenuHookTellUnit()

	local txt;

	if ( HealGrid.menuHookUnitName ~= nil ) then
		--txt = L"/tell " .. HealGrid.menuHookUnitName .. L" ";
		--ChatWindow.SwitchChannelWithExistingText( txt );
		warwhisperer.Command(WStringToString(HealGrid.menuHookUnitName));
		
	end

	HealGrid.menuHookUnitName = nil;

end

-- =====================================================================================================
-- Slash commands
-- =====================================================================================================

function HealGrid.RegisterLibSlash()

	if ( LibSlash and (not LibSlash.IsSlashCmdRegistered('healgrid')) ) then
		LibSlash.RegisterSlashCmd("healgrid",
			function(args)
				HealGridGui.OpenGui();
			end
		);
		LibSlash.RegisterSlashCmd("hgdd",
			function(args)
				HealGridGridFactory.ToggleUseDummyData( args, true );
			end
		);
	end

end

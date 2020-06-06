local PhantomLib = LibStub("PhantomLib");

HealGridUtility = {};

HealGridUtility.__index = HealGridUtility;
setmetatable( HealGridUtility, RMetUtility );

HealGridUtility.realPlayerName = nil;

HealGridUtility.moraleLevelData = nil;						-- data (mapping) for morale

HealGridUtility.avatarUsesCareerPoints = nil;
HealGridUtility.careerPointLevels = nil;

HealGridUtility.origFuncCastBarStartInteractTimer = nil;
HealGridUtility.origFuncCastBarShowCastBar = nil;

HealGridUtility.careerResourceIsUnregistered = false;

HealGridUtility.careerMap = nil;							-- mapping with career names to careerlines

-- =====================================================================================================
-- Get the real player name (^MF removed)
-- =====================================================================================================

function HealGridUtility.GetRealPlayerName()

	if ( HealGridUtility.realPlayerName ~= nil ) then
		return( HealGridUtility.realPlayerName );
	end

	if ( GameData.Player.name ~= nil and GameData.Player.name ~= L"" ) then
		HealGridUtility.realPlayerName = HealGridUtility.WStringChop( GameData.Player.name );
	end

	return( HealGridUtility.realPlayerName or GameData.Player.name );

end

-- =====================================================================================================
-- Get main assist
-- =====================================================================================================

function HealGridUtility.GetMainAssist( )

	local buffer, realName, playerName;
	local mainAssist = nil;
	local playerGroup = -1;
	local g = 1;
	local m = 1;

	-- ----- Scenario Group ----------------------------------------------------------------------
	if ( HealGridScenariogroup.IsPlayerInScenariogroup() ) then
		playerName = HealGridUtility.GetRealPlayerName();
		buffer = GameData.GetScenarioPlayerGroups();
		m = 1;
		while ( buffer[m] and playerGroup < 0 ) do						-- first find group of player
			if ( buffer[m].name ~= nil and buffer[m].name ~= L"" ) then
				realName = HealGridUtility.WStringChop( buffer[m].name );
				if ( realName == playerName ) then
					playerGroup = buffer[m].sgroupindex;
					if ( buffer[m].isMainAssist ) then					-- avatar is main assist
						mainAssist = realName;
					end
				end
			end
			m = m + 1;
		end
		if ( playerGroup > 0 ) then										-- player in a group, find group assist
			m = 1;
			while ( buffer[m] and mainAssist == nil ) do
				if ( buffer[m].sgroupindex == playerGroup and buffer[m].isMainAssist ) then
					mainAssist = HealGridUtility.WStringChop( buffer[m].name );
				end
				m = m + 1;
			end
		end
	-- ----- Battle Group ------------------------------------------------------------------------
	elseif ( HealGridBattlegroup.IsPlayerInBattlegroup() ) then
		buffer = GetBattlegroupMemberData();
		g = HealGridGlobals.FIRST_BATTLEGROUP;
        while ( g <= HealGridGlobals.LAST_BATTLEGROUP and mainAssist == nil ) do
			m = HealGridGlobals.FIRST_BATTLEGROUP_MEMBER;
			while ( m <= HealGridGlobals.LAST_BATTLEGROUP_MEMBER and mainAssist == nil ) do
				if ( buffer[g] and buffer[g][m] and buffer[g][m].isMainAssist ) then
					mainAssist = HealGridUtility.WStringChop( buffer[g][m].name or L"" );
				end
				m = m + 1;
			end
			g = g + 1;
		end
	-- ----- Group / Party -----------------------------------------------------------------------
	elseif ( HealGridGroup.IsPlayerInGroup() ) then
		buffer = GetGroupData();
    	m = HealGridGlobals.FIRST_GROUP_MEMBER;
		while ( m <= HealGridGlobals.LAST_GROUP_MEMBER and mainAssist == nil ) do
			if ( buffer[m] and buffer[m].isMainAssist ) then
				mainAssist = HealGridUtility.WStringChop( buffer[m].name or L"" );
			end
			m = m + 1;
		end

		if ( mainAssist == nil ) then
			mainAssist = HealGridUtility.GetRealPlayerName();
		end
	end

	return( mainAssist or L"" );

end

-- =====================================================================================================
-- GetAbilityData
-- =====================================================================================================

function HealGridUtility.GetAbilityData( lkp, abilityType )

	local abilityID = 0;
	local abilityData = GetAbilityTable( abilityType or GameData.AbilityType.STANDARD );

	if ( lkp == nil ) then
		abilityID = 0;
	elseif ( type(lkp) == 'number' ) then
		if ( abilityData[lkp] ~= nil ) then
			abilityID = lkp;
		end
	else
		for k,v in pairs(abilityData) do
			if ( v["name"]:lower()):find(lkp:lower()) then 
				abilityID = k;
			end
		end
	end

	if ( abilityID ~= 0 ) then
		return abilityID, abilityData[abilityID];
	else
		return 0, nil ;
	end

end

-- =====================================================================================================
-- Get Buff Type
-- =====================================================================================================

function HealGridUtility.GetBuffDebuffNeutral( buffData )

	local frame = DataUtils.GetAbilityTypeTextureAndColor( buffData );

	if ( frame == 'Debuff-Frame' ) then
		return( "DEBUFF" );
	elseif ( frame == 'Buff-Frame' ) then
		return( "BUFF" );
	elseif ( frame == 'Neutral-Frame' ) then
		return( "NEUTRAL" );
	end

	d( "HealGridUtility.GetBuffDebuffNeutral(): unknown frame : " );
	d( frame or 'NIL' );

	return( "NEUTRAL" );

end

-- =====================================================================================================
-- GetMoraleLevelData
-- =====================================================================================================

function HealGridUtility.GetMoraleLevelData( ml )

	local i;

	if ( HealGridUtility.moraleLevelData == nil ) then
		HealGridUtility.moraleLevelData = {};
		for i=0,GameData.NUM_MORALE_LEVELS-1 do
			HealGridUtility.moraleLevelData[i] = { low=GetMoralePercentForLevel(i),
													high=GetMoralePercentForLevel(i+1),
													barMax=GetMoralePercentForLevel(i+1)-GetMoralePercentForLevel(i) };
        end
		HealGridUtility.moraleLevelData[GameData.NUM_MORALE_LEVELS] = { low=GetMoralePercentForLevel(GameData.NUM_MORALE_LEVELS),
																		high=999,
																		barMax=999 };
    end

	return( HealGridUtility.moraleLevelData[ml] );

end

-- =====================================================================================================
-- MoraleToMoraleLevel
-- =====================================================================================================

function HealGridUtility.MoraleToMoraleLevel( morale )

	local ml = 0;

	if ( HealGridUtility.moraleLevelData == nil ) then						-- initialize if needed
		HealGridUtility.GetMoraleLevelData( 0 );
	end

	while ( ml <= GameData.NUM_MORALE_LEVELS ) do
		if ( morale < HealGridUtility.moraleLevelData[ml].high ) then		-- yes, < (see defininiton above for 'high')
			return( ml );
		end
		ml = ml + 1;
	end

	return( 0 );

end

-- =====================================================================================================
-- GetCarrerPointLevel
-- =====================================================================================================

function HealGridUtility.GetCareerPointLevel( currentCareerPoints )

	local playerCareerLine = HealGridGlobals.careerMap[GameData.Player.career.id];

    if ( EA_CareerResourceData[playerCareerLine] == nil or EA_CareerResourceData[playerCareerLine].maxPool <= 0 ) then
		return( "UNKNOWN" );
	end

	if ( not HealGridUtility.careerPointLevels ) then
        HealGridUtility.careerPointLevels = {};
        HealGridUtility.careerPointLevels[1] = {high=math.floor(EA_CareerResourceData[playerCareerLine].maxPool/2),   level='LOW'};
        HealGridUtility.careerPointLevels[2] = {high=math.floor(EA_CareerResourceData[playerCareerLine].maxPool*0.9), level='MEDIUM'};
        HealGridUtility.careerPointLevels[3] = {high=EA_CareerResourceData[playerCareerLine].maxPool,                 level='HIGH'};
	end

    if ( currentCareerPoints <= HealGridUtility.careerPointLevels[1].high ) then
        return( HealGridUtility.careerPointLevels[1].level );
    elseif ( currentCareerPoints <= HealGridUtility.careerPointLevels[2].high ) then
        return( HealGridUtility.careerPointLevels[2].level );
    else
        return( HealGridUtility.careerPointLevels[3].level );
    end

end

-- =====================================================================================================
-- Does Avatar Use Career Points
-- =====================================================================================================

function HealGridUtility.AvatarUsesCareerPoints( playerCareerLine )

	-- cache the results, as this will never change
	if ( HealGridUtility.avatarUsesCareerPoints == nil ) then
		playerCareerLine = playerCareerLine or HealGridGlobals.careerMap[GameData.Player.career.id];
    	HealGridUtility.avatarUsesCareerPoints = (EA_CareerResourceData[playerCareerLine] ~= nil 
													and EA_CareerResourceData[playerCareerLine].maxPool > 0 );
	end

	return( HealGridUtility.avatarUsesCareerPoints );
end

-- =====================================================================================================
-- Current career points of the avatar
-- =====================================================================================================

function HealGridUtility.AvatarGetCareerPoints()

	return( HealGrid.cachedCareerPoints );

end

-- =====================================================================================================
-- Max career points of the avatar
-- =====================================================================================================

function HealGridUtility.AvatarGetMaxCareerPoints()

	local playerCareerLine = HealGridGlobals.careerMap[GameData.Player.career.id];

	if ( EA_CareerResourceData[playerCareerLine] ~= nil ) then
		return( EA_CareerResourceData[playerCareerLine].maxPool );
	else
		return( 0 );
	end

end

-- =====================================================================================================
-- Get career point Groups
-- =====================================================================================================

function HealGridUtility.GetCareerPointGroups( careerLine )

    if ( careerLine == GameData.CareerLine.ARCHMAGE or careerLine == GameData.CareerLine.SHAMAN ) then
		return( { max=10, [1]={min=1,max=5}, [2]={min=6,max=10} } );
	end

	return( nil );

end

-- =====================================================================================================
-- Adjust the career points (if required)
-- =====================================================================================================

function HealGridUtility.AdjustCareerPoints( careerPoints, careerLine )

	local cpg = HealGridUtility.GetCareerPointGroups( careerLine );

	if ( careerPoints == 0 ) then
		return( 0 );
	elseif ( cpg == nil ) then
		return( careerPoints );
	elseif ( careerPoints >= cpg[1].min and careerPoints <= cpg[1].max ) then
		return( careerPoints );
	elseif ( careerPoints >= cpg[2].min and careerPoints <= cpg[2].max ) then
		return( careerPoints - cpg[2].min + 1 );
	end

end

-- =====================================================================================================
-- TierToSign
-- =====================================================================================================

function HealGridUtility.TierToSign( unitTier )

	if ( unitTier == 0 ) then
		return( L'' );
	elseif ( unitTier == 1 ) then
		return( L'+' );
	elseif ( unitTier == 2 ) then
		return( L'x' );
	elseif ( unitTier == 3 ) then
		return( L'*' );
	end

	return( L"?" );

end

-- =====================================================================================================
-- FrameNameToUnit
-- =====================================================================================================

function HealGridUtility.FrameNameToUnit( frameName )

	local frameType, unitObj;
	local mowFrameType,idx1,idx2 = frameName:match( "^HG_HealGrid_([A-Za-z0-9]+)_([0-9]+)_([0-9]+).*" );

	frameType = 'UNIT';
	if ( mowFrameType == nil ) then
		if ( frameName:match("^HG_HealGridActionPointBar.*") ) then
			frameType = 'APBAR';
		elseif ( frameName:match("^HG_HealGridCareerBar.*") ) then
			frameType = 'CPBAR';
		elseif ( frameName:match("^HG_HealGridMoraleBar.*") ) then
			frameType = 'MORALEBAR';
		elseif ( frameName:match("^HG_HealGridCastBar.*") ) then
			frameType = 'CASTBAR';
		end
		unitObj = nil;
	elseif ( mowFrameType == 'Player' ) then
		unitObj = HealGridHUDMain.Instance():GetUnit( 1, HealGridHUD.PLAYER );
	elseif ( mowFrameType == 'Pet' ) then
		unitObj = HealGridHUDMain.Instance():GetUnit( 1, HealGridHUD.PET );
		frameType = 'PET';
	elseif ( mowFrameType == 'FriendlyTarget' ) then
		unitObj = HealGridHUDMain.Instance():GetUnit( 1, HealGridHUD.FRIENDLY_TARGET );
	elseif ( mowFrameType == 'HostileTarget' ) then
		unitObj = HealGridHUDMain.Instance():GetUnit( 1, HealGridHUD.HOSTILE_TARGET );
	elseif ( mowFrameType == 'PetTarget' ) then
		unitObj = HealGridHUDMain.Instance():GetUnit( 1, HealGridHUD.PET_TARGET );
	elseif ( mowFrameType == 'GroupMember' ) then
		unitObj = HealGridGroup.Instance():GetUnit( 1, tonumber(idx1) );
	elseif ( mowFrameType == 'BattlegroupMember' ) then
		unitObj = HealGridBattlegroup.Instance():GetUnit( tonumber(idx1), tonumber(idx2) );
	elseif ( mowFrameType == 'ScenariogroupMember' ) then
		unitObj = HealGridScenariogroup.Instance():GetUnit( tonumber(idx1), tonumber(idx2) );
	end

	return unitObj, frameType;

end

-- =====================================================================================================
-- Get absolute offset for an anchor
-- =====================================================================================================

function HealGridUtility.GetAbsAnchorOffset( offset, parentSize )

	local absOffset;

	if ( string.sub(offset,-1) == '%' ) then
		absOffset = tonumber( string.sub(offset,1,-2) ) * parentSize / 100;
	else
		absOffset = tonumber( offset );
	end

	return( math.floor(absOffset+0.5) );

end

-- =====================================================================================================
-- WindowSetTintColorPlus
-- =====================================================================================================

function HealGridUtility.SetColorPlus( windowName, unitObj, colorKey, cacheValue, widget, forceRedraw )

	local cooldown, maxCooldown;
	local newValue = nil;
 	local color = nil;

	if ( colorKey == 'HEALTHCOLOR' ) then													-- health color
		newValue = unitObj:HealthStatus( unitObj:HitPointsPercent() );
		if ( newValue ~= cacheValue or forceRedraw ) then
			color = HealGridGlobals.healthColor[newValue];
			cacheValue = newValue;
		end
	elseif ( colorKey == 'CLASSCOLOR' ) then												-- career/class color
		newValue = unitObj:GetCareerLine();
		if ( newValue ~= cacheValue or forceRedraw ) then
			if ( newValue > 0 ) then
				color = HealGridGlobals.archColors[ HealGridGlobals.arches[newValue] ];
			else
				color = 'GRAY80';
			end
			cacheValue = newValue;
		end
	elseif ( colorKey == 'CONCOLOR' ) then													-- /consider color
		newValue = unitObj:GetConType();
		if ( newValue ~= cacheValue or forceRedraw ) then
 			color = DataUtils.GetTargetConColor( newValue );
			cacheValue = newValue;
		end
	elseif ( colorKey == 'MCDCOLOR' ) then													-- Morale Cooldown Color
		cooldown,maxCooldown = GetMoraleCooldown( 1 );
		if ( cooldown > 0 and cooldown < 1.6 ) then
			newValue = 'ORANGE';
		elseif ( cooldown > 0 ) then
			newValue = 'RED';
		elseif ( cooldown <= 0 ) then
			newValue = 'WHITE';
		end
		if ( newValue ~= cacheValue or forceRedraw ) then
 			color = newValue;
			cacheValue = newValue;
		end
	elseif ( RMetColor[colorKey] ) then														-- a color (of RMetColor[color])
		newValue = colorKey;
		if ( newValue ~= cacheValue or forceRedraw ) then
 			color = newValue;
			cacheValue = newValue;
		end
	else																					-- something else, give a warning
		d( 'HealGridUtility.SetColorPlus(): Unknown color key: '..(colorKey or 'NIL') );
	end

	if ( color ~= nil ) then
		if ( widget == 'window' ) then
			HealGridUtility.WindowSetTintColor( windowName, color );
		else
			HealGridUtility.LabelSetTextColor( windowName, color );
		end
	end

	return( cacheValue );

end

-- =====================================================================================================
-- Texture
-- =====================================================================================================

function HealGridUtility.DynamicImageSetTexture( windowName, textureID, style )

	local textureData = HealGridSkin.TextureGet( textureID );

	DynamicImageSetTexture( windowName, textureData.texture, 0, 0 );

	if ( style == 'TILE' ) then
		DynamicImageSetTextureDimensions( windowName, 0, 0 );
	elseif ( style == 'FILL' ) then
		DynamicImageSetTextureDimensions( windowName, textureData.dims.w, textureData.dims.h );
	else
		DynamicImageSetTextureDimensions( windowName, 0, 0 );
		d( 'HealGridUtility.DynamicImageSetTexture(): Unknown style: '..style );
	end

end

-- =====================================================================================================
-- Hide/Show WAR player frame
-- =====================================================================================================

function HealGridUtility.UpdateWARPlayerFrameVisibility( isShutdown )

	local hide = HealGrid.SettingGet( 'hudHideWARPlayerFrame' );

	if ( isShutdown ) then
		PhantomLib.SetWindowShowing( 'PlayerWindow' );
		PhantomLib.Enforce();
	-- ----- hide them ---------------------------------------------------
	elseif ( hide ) then
		PhantomLib.SetWindowHidden( 'PlayerWindow' );
		PhantomLib.Enforce();
	-- ----- show them ---------------------------------------------------
	elseif ( (not hide) ) then
		PhantomLib.SetWindowShowing( 'PlayerWindow' );
		PhantomLib.Enforce();
	end

end

-- =====================================================================================================
-- Hide/Show WAR target frame
-- =====================================================================================================

function HealGridUtility.UpdateWARTargetFrameVisibility( isShutdown )

	local hide = HealGrid.SettingGet( 'hudHideWARTargetFrame' );

	if ( isShutdown ) then
		PhantomLib.SetWindowShowing( 'TargetWindow' );
		PhantomLib.Enforce();
	-- ----- hide them ---------------------------------------------------
	elseif ( hide ) then
		PhantomLib.SetWindowHidden( 'TargetWindow' );
		PhantomLib.Enforce();
	-- ----- show them ---------------------------------------------------
	elseif ( (not hide) ) then
		PhantomLib.SetWindowShowing( 'TargetWindow' );
		PhantomLib.Enforce();
	end

end

-- =====================================================================================================
-- Hide/Show WAR warband frames
-- =====================================================================================================

function HealGridUtility.UpdateWARWarbandFramesVisibility( isShutdown )

	local hide = HealGrid.SettingGet( 'battlegroupHideWARWarbandFrames' );

	if ( isShutdown ) then
		PhantomLib.SetWindowShowing( 'BattlegroupHUD' );
		PhantomLib.Enforce();
	-- ----- hide them ---------------------------------------------------
	elseif ( hide ) then
		PhantomLib.SetWindowHidden( 'BattlegroupHUD' );
		PhantomLib.Enforce();
	-- ----- show them ---------------------------------------------------
	elseif ( (not hide) ) then
		PhantomLib.SetWindowShowing( 'BattlegroupHUD' );
		PhantomLib.Enforce();
	end

end

-- =====================================================================================================
-- Hide/Show WAR group frame
-- =====================================================================================================

function HealGridUtility.UpdateWARGroupFrameVisibility( isShutdown )

	local hide = HealGrid.SettingGet( 'groupHideWARGroupFrame' );

	-- ##### TODO: groupHideWARGroupFrame & scenariogroupHideWARGroupFrame not yet supported !!!!	##############

	if ( isShutdown ) then
		PhantomLib.SetWindowShowing( 'GroupWindow' );
		PhantomLib.Enforce();
	-- ----- hide them ---------------------------------------------------
	elseif ( hide ) then
		PhantomLib.SetWindowHidden( 'GroupWindow' );
		PhantomLib.Enforce();
	-- ----- show them ---------------------------------------------------
	elseif ( (not hide) ) then
		PhantomLib.SetWindowShowing( 'GroupWindow' );
		PhantomLib.Enforce();
	end

end

-- =====================================================================================================
-- Hide/Show WAR Cast Bar
-- =====================================================================================================

function HealGridUtility.UpdateWARCastBarVisibility( isShutdown )

	local hide = HealGrid.SettingGet( 'hudHideWARCastBar' );

	if ( isShutdown ) then
		WindowSetShowing( "LayerTimerWindow", true );
		HealGridUtility.warCastBarEnabled = true;
	-- ----- hide them ---------------------------------------------------
	elseif ( hide ) then
		HealGridUtility.origFuncCastBarStartInteractTimer = LayerTimerWindow.StartInteractTimer;
		HealGridUtility.origFuncCastBarShowCastBar = LayerTimerWindow.ShowCastBar;

		LayerTimerWindow.StartInteractTimer = function() return end;
		LayerTimerWindow.ShowCastBar = function() return end;

		WindowSetShowing( "LayerTimerWindow", false );
	-- ----- show them ---------------------------------------------------
	elseif ( (not hide) ) then
		if ( HealGridUtility.origFuncCastBarStartInteractTimer ) then
			LayerTimerWindow.StartInteractTimer = HealGridUtility.origFuncCastBarStartInteractTimer;
			LayerTimerWindow.ShowCastBar = HealGridUtility.origFuncCastBarShowCastBar;
		end

		WindowSetShowing( "LayerTimerWindow", true );
	end

end

-- =====================================================================================================
-- Hide/Show WAR Career Points Frame
-- =====================================================================================================

function HealGridUtility.UpdateWARCareerPointsFrameVisibility( isShutdown )

	local hide = HealGrid.SettingGet( 'hudHideWARCareerPointsFrame' );

	if ( not DoesWindowExist(CAREER_WINDOW_NAME) ) then
		-- nop
	elseif ( isShutdown ) then
		WindowSetShowing( CAREER_WINDOW_NAME, true );
		HealGridUtility.warCareerPointsFrameEnabled = true;
	elseif ( hide ) then
		UnregisterEventHandler( SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "CareerResource.UpdateResourceDisplay" );
		HealGridUtility.careerResourceIsUnregistered = true;
		WindowSetShowing( CAREER_WINDOW_NAME, false );
	elseif ( (not hide) ) then
		if ( HealGridUtility.careerResourceIsUnregistered ) then
			RegisterEventHandler( SystemData.Events.PLAYER_CAREER_RESOURCE_UPDATED, "CareerResource.UpdateResourceDisplay" );
		end
		WindowSetShowing( CAREER_WINDOW_NAME, true );
	end

end

-- =====================================================================================================
-- Career name -> Career line
-- =====================================================================================================

function HealGridUtility.CareerNameToCareerLine( careerName )

	local idx;

	d( "HealGridUtility.CareerNameToCareerLine(): DEPRECATED" );
	-- this method is actually no longer needed now that scenario-data returns a careerId

	if ( HealGridUtility.careerMap == nil ) then
		HealGridUtility.careerMap = {};
		for race,_ in pairs(GameData.Account.CharacterCreation.DestructionCareers) do
			for career,careerInfo in pairs(GameData.Account.CharacterCreation.DestructionCareers[race]) do
				idx = HealGridUtility.WStringChop( careerInfo.FemaleCareerName );
				HealGridUtility.careerMap[idx] = HealGridGlobals.careerMap[careerInfo.Career];
				idx = HealGridUtility.WStringChop( careerInfo.MaleCareerName );
				HealGridUtility.careerMap[idx] = HealGridGlobals.careerMap[careerInfo.Career];
			end
		end
		for race,_ in pairs(GameData.Account.CharacterCreation.OrderCareers) do
			for career,careerInfo in pairs(GameData.Account.CharacterCreation.OrderCareers[race]) do
				idx = HealGridUtility.WStringChop( careerInfo.FemaleCareerName );
				HealGridUtility.careerMap[idx] = HealGridGlobals.careerMap[careerInfo.Career];
				idx = HealGridUtility.WStringChop( careerInfo.MaleCareerName );
				HealGridUtility.careerMap[idx] = HealGridGlobals.careerMap[careerInfo.Career];
			end
		end
	end

	if ( careerName == nil ) then
		return( 0 );
	end

	if ( HealGridUtility.careerMap[careerName] ~= nil ) then
		return( HealGridUtility.careerMap[careerName] );
	end

	careerName = HealGridUtility.WStringChop( careerName );
	if ( HealGridUtility.careerMap[careerName] ~= nil ) then
		return( HealGridUtility.careerMap[careerName] );
	end

	return( 0 );

end

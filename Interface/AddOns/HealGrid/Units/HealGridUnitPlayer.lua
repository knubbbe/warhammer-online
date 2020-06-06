HealGridUnitPlayer = HealGridUnitHUD:New();

function HealGridUnitPlayer:New( o )

	if ( o ) then
		o.unit = (o.unit or 'player');
		o.frameName = (o.frameName or 'HG_HealGrid_Player_0_0');
		o.placeholderFrameName = (o.placeholderFrameName or 'HG_HealGrid_PlayerPlaceholder_0_0');
	end

	t = HealGridUnitHUD:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridUnitPlayer:GetUnitName()

	return( GameData.Player.name );

end

function HealGridUnitPlayer:GetUnitLevel()

	return( GameData.Player.level );

end

function HealGridUnitPlayer:GetCareerName()

	return( GameData.Player.career.name );

end

function HealGridUnitPlayer:GetCareerLine()

	return( HealGridGlobals.careerMap[GameData.Player.career.id] );

end

function HealGridUnitPlayer:GetTargetType()

	return( HealGridGlobals.UnitTargetType.SELF );

end

function HealGridUnitPlayer:GetConType()

	return( HealGridGlobals.UnitConType.FRIENDLY );

end

function HealGridUnitPlayer:IsDead()

	return( GameData.Player.hitPoints.current <= 0 );

end

function HealGridUnitPlayer:PetIsDead()

	return( GameData.Player.Pet.healthPercent <= 0 );

end

function HealGridUnitPlayer:IsMainAssist()

	return( HealGridUtility.GetMainAssist() == self:GetUnitName() );

end

function HealGridUnitPlayer:GetAssistTarget()

	return( 'MAIN' );

end

function HealGridUnitPlayer:PetExists()

	return( GameData.Player.Pet.objNum ~= 0 and GameData.Player.Pet.name ~= L"" );

end

-- ===========================================================================================================================
-- Skinning / Layout
-- ===========================================================================================================================

function HealGridUnitPlayer:ApplySkinLabels( skinID, skinSectionID, skinSubSectionID, width, height )

	HealGridUnitHUD.ApplySkinLabels( self, skinID, skinSectionID, 'avatarFrame', width, height );

end

function HealGridUnitPlayer:ApplySkinSpellTrackLabels( skinID, skinSectionID, skinSubSectionID, frameWidth, frameBorderWidth )

	HealGridUnitHUD.ApplySkinSpellTrackLabels( self, skinID, skinSectionID, 'avatarFrame', frameWidth, frameBorderWidth );

end

-- ===========================================================================================================================
-- Hit Points
-- ===========================================================================================================================

function HealGridUnitPlayer:HitPoints()

	return( GameData.Player.hitPoints.current );

end

function HealGridUnitPlayer:HitPointsMax()

	return( GameData.Player.hitPoints.maximum );

end

function HealGridUnitPlayer:HitPointsPercent()

	local hpPerc = 0;

	if ( GameData.Player.hitPoints.current <= 0 or GameData.Player.hitPoints.maximum <= 0 ) then
		hpPerc = 0;
	else
		hpPerc = math.floor( GameData.Player.hitPoints.current * 100 / GameData.Player.hitPoints.maximum );
	end

	return( hpPerc );

end

function HealGridUnitPlayer:PetHitPointsPercent()

	return( GameData.Player.Pet.healthPercent );

end

-- ===========================================================================================================================
-- Action Points
-- ===========================================================================================================================

function HealGridUnitPlayer:ActionPoints()

	return( GameData.Player.actionPoints.current );

end

function HealGridUnitPlayer:ActionPointsMax()

	return( GameData.Player.actionPoints.maximum );

end

function HealGridUnitPlayer:ActionPointsPercent()

	local apPerc = 0;

	if ( GameData.Player.actionPoints.current <= 0 or GameData.Player.actionPoints.maximum <= 0 ) then
		apPerc = 0;
	else
		apPerc = math.floor( GameData.Player.actionPoints.current * 100 / GameData.Player.actionPoints.maximum );
	end

	return( apPerc );

end

-- ===========================================================================================================================
-- Morale
-- ===========================================================================================================================

function HealGridUnitPlayer:MoraleLevel()

	return( HealGrid.PlayerMoraleLevel() );

end

-- ===========================================================================================================================
-- Career Points
-- ===========================================================================================================================

function HealGridUnit:CareerPoints()

	return( HealGridUtility.AvatarGetCareerPoints() );

end

function HealGridUnit:CareerPointsMax()

	return( HealGridUtility.AvatarGetMaxCareerPoints() );

end

-- ===========================================================================================================================
-- Debuffs
-- ===========================================================================================================================

function HealGridUnitPlayer:BuffTargetType()

    return( GameData.BuffTargetType.SELF );

end

function HealGridUnitPlayer:ShouldShowDebuffFlags()

	return( HealGrid.SettingGet('hudShowPlayerDebuffFlags') ~= 'NONE' );

end

function HealGridUnitPlayer:ShouldShowDebuffFlag( flag )

    return( HealGrid.SettingGet('hudShowPlayerDebuffFlags') == 'ALL' or
			(HealGrid.SettingGet('hudShowPlayerDebuffFlags') == 'DISPELLABLE' and HealGrid.SettingGet('dispellableDebuffFlags',flag))
          );

end

-- ===========================================================================================================================
-- Assisting
-- ===========================================================================================================================

function HealGridUnitHUD:AssistUnit()

    local ma;

    ma = HealGridUtility.GetMainAssist();

    if ( ma ~= L"" ) then
      
    end

end

-- ===========================================================================================================================
-- Show the dropdown menu on right click
--
-- EXACT Copy over from WAR code (except CreateContextMenu) PlayerWindow.ShowMenu()
-- ===========================================================================================================================

function HealGridUnitPlayer:ShowDropdownMenu()

	local enabled = false;
    local disableRvrUnflag = true;

    if (GameData.Player.rvrZoneFlagged == false and GameData.Player.rvrPermaFlagged == true) then
--        if (bRvrUnflagCountdownStarted == false) then
            disableRvrUnflag = false
--        end
    end

    EA_Window_ContextMenu.CreateContextMenu( self:GetFrameName() );
    EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_FLAG_PLAYER_RVR), 
                                       PlayerWindow.OnMenuClickFlagRvR, GameData.Player.rvrZoneFlagged or GameData.Player.rvrPermaFlagged, true );
    EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_UNFLAG_PLAYER_RVR), 
                                       PlayerWindow.OnMenuClickUnFlagRvR, disableRvrUnflag, true );
	EA_Window_ContextMenu.AddMenuItem( L"Show Open Party Window", EA_Window_OpenParty.ToggleFullWindow, false, true );		-- added

    -- Show the "Leave Party" option if the player is currently in a player-made party
    if( (HealGridGroup.IsPlayerInGroup() or HealGridBattlegroup.IsPlayerInBattlegroup()) and (not HealGridScenariogroup.IsPlayerInScenariogroup()) ) then
        EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_GROUP_OPTIONS ), 
                                           EA_Window_OpenParty.OpenToManageTab, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
        EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_LEAVE_GROUP), 
                                           PlayerWindow.OnMenuClickLeaveGroup, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
--		if ( GameData.Player.isGroupLeader ) then
			enabled = (GameData.Player.isGroupLeader and HealGridGroup.Instance():GetMainAssist() ~= self:GetRealUnitName());
			SystemData.UserInput.selectedGroupMember = GameData.Player.name;
			EA_Window_ContextMenu.AddMenuItem( GetString(StringTables.Default.LABEL_MAKE_MAIN_ASSIST), 
                                               GroupWindow.OnMakeMainAssist, not enabled, true, EA_Window_ContextMenu.CONTEXT_MENU_1 );
--		end

    end

    -- Show the "Leave Scenario Party" option if the player is in a scenario party
    if( GroupWindow.inScenarioGroup ) then
        EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_LEAVE_SCENARIO_GROUP), 
                                           PlayerWindow.OnMenuClickLeaveScenarioGroup, false, true )
    end

    EA_Window_ContextMenu.Finalize()

end

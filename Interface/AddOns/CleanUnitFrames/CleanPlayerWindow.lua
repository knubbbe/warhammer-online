--[[
    NOTE: THIS CODE IS ADAPTED FROM THE EAMYTHIC DEFAULT CODE FOR EA_PLAYERSTATUSWINDOW.
--]]

----------------------------------------------------------------
-- Global Variables
----------------------------------------------------------------

CleanPlayerWindow = {}

----------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------

local endLoading = false

CleanPlayerWindow.Settings = 
{
    alwaysShowHitPoints   = true,
    alwaysShowAPPoints    = true
}


local bUnflagCountdownStarted = false
local rvrFlagStartTimer     = 0

local isPlayerInAgroMode    = false

local prevHitpointLevel     = 1
local CleanPlayerWindow_TOOLTIP_ANCHOR = { Point = "bottom",  RelativeTo = "CleanPlayerWindow", RelativePoint = "top",   XOffset = 0, YOffset = 0 }

local c_MAX_BUFF_SLOTS      = 16
local c_BUFF_STRIDE         = 8

----------------------------------------------------------------
-- Local/Utility Functions
----------------------------------------------------------------


----------------------------------------------------------------
-- CleanPlayerWindow Functions
----------------------------------------------------------------

-- OnInitialize Handler
function CleanPlayerWindow.Initialize()

    -- Make sure we have the tables we need.
    if not CleanSettings then CleanSettingsSetDefaultTable() end

    -- Register this window for movement with the Layout Editor
    LayoutEditor.RegisterWindow( "CleanPlayerWindow",
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_PLAYER_WINDOW_NAME )..L" (Clean)",
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_PLAYER_WINDOW_DESC )..L" (Clean)",
                                false, false,
                                true, nil )

    -- Register open party button anchor with Layout Editor
    LayoutEditor.RegisterWindow( "CleanOPBAnchor",
                                L"Open Party Button (Clean)",
                                L"Open Party Button (Clean)",
                                false, false,
                                false, nil )
                                
    -- Register open party button anchor with Layout Editor
    LayoutEditor.RegisterWindow( "CleanPetAnchor",
                                L"Player's Pet (Clean)",
                                L"Player's Pet (Clean)",
                                false, false,
                                true, nil )

    --CreateWindowFromTemplate ("CleanPlayerWindowStatusContainer", "CleanPlayerWindowStatusContainer", "Root");
    
    -- Register for Player Status updates       
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_CUR_ACTION_POINTS_UPDATED, "CleanPlayerWindow.UpdateCurrentActionPoints")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_MAX_ACTION_POINTS_UPDATED, "CleanPlayerWindow.UpdateMaximumActionPoints")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_CUR_HIT_POINTS_UPDATED,    "CleanPlayerWindow.UpdateCurrentHitPoints")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_MAX_HIT_POINTS_UPDATED,    "CleanPlayerWindow.UpdateMaximumHitPoints")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_START_RVR_FLAG_TIMER,      "CleanPlayerWindow.OnStartRvRFlagTimer")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_RVR_FLAG_UPDATED,          "CleanPlayerWindow.OnRvRFlagUpdated")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_CAREER_RANK_UPDATED,       "CleanPlayerWindow.UpdatePlayer")
    --WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_CAREER_CATEGORY_UPDATED,   "CleanPlayerWindow.UpdateAdvancementNag" )
    --WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_MORALE_UPDATED,            "CleanPlayerWindow.OnMoraleUpdated")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_EFFECTS_UPDATED,           "CleanPlayerWindow.OnEffectsUpdated")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_AGRO_MODE_UPDATED,         "CleanPlayerWindow.OnAgroModeUpdated")
    --WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_KILLING_SPREE_UPDATED,     "CleanPlayerWindow.KillingSpreeUpdated")
    --WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_HEALTH_FADE_UPDATED,       "CleanPlayerWindow.UpdateBasedOnUserSettings")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.PLAYER_GROUP_LEADER_STATUS_UPDATED, "CleanPlayerWindow.UpdateCrown")
    WindowRegisterEventHandler( "CleanPlayerWindow", SystemData.Events.GROUP_UPDATED,                    "CleanPlayerWindow.UpdateCrown")
    
    -- Mouseover casting handler, thanks WarBagel
    WindowRegisterEventHandler ("CleanPlayerWindow", SystemData.Events.PLAYER_BEGIN_CAST, "CleanPlayerWindow.OnPlayerCast")
    WindowRegisterEventHandler ("CleanPlayerWindow", SystemData.Events.PLAYER_TARGET_UPDATED, "CleanPlayerWindow.OnTargetUpdated")
    
    -- Loading (for pet frame)
    WindowRegisterEventHandler("CleanPlayerWindow", SystemData.Events.LOADING_END, "CleanPlayerWindow.OnLoad")
    WindowRegisterEventHandler("CleanPlayerWindow", SystemData.Events.RELOAD_INTERFACE, "CleanPlayerWindow.OnLoad")

            
    -- Set up label colors where needed
    LabelSetTextColor( "CleanPlayerWindowLevelText", DefaultColor.XP_COLOR_FILLED.r, DefaultColor.XP_COLOR_FILLED.g, DefaultColor.XP_COLOR_FILLED.b )
    
    -- Initially hide some of the arbitrary indicator widgets until updates are processed
    --WindowSetShowing( "CleanPlayerWindowMoraleMini", false )
    --WindowSetShowing( "CleanPlayerWindowAdvancementIndicator", false )
    --WindowSetShowing( "CleanPlayerWindowRenownIndicator", false )
    WindowSetShowing( "CleanPlayerWindowGroupLeaderCrown", false )
    WindowSetShowing( "CleanPlayerWindowStatusContainerEnemyHealthPercentBar", false )
    WindowSetShowing( "CleanPlayerWindowWarbandLeaderCrown", false )
    --WindowSetShowing( "CleanPlayerWindowDeathPortrait", false )
    --WindowSetShowing( "CleanPlayerWindowKillingSpree", false )
    
    -- Set up the (initially hidden) XP bonus display window in the killing spree widget.
    --WindowSetTintColor( "CleanPlayerWindowKillingSpreeBoxInner", 0, 0, 0 )
    --WindowSetAlpha( "CleanPlayerWindowKillingSpreeBoxInner", 0.6 )
    
    -- Boolean used by function CleanPlayerWindow.KillingSpreeUpdated
    --CleanPlayerWindow.KillingSpreeIsShowing = false
    
    local buffAnchor = 
    {
        Point           = "bottomleft",
        RelativePoint   = "topleft",
        RelativeTo      = "CleanPlayerWindowStatusContainer", 
        XOffset         = 0,
        YOffset         = 4,
    }   
    
    CleanPlayerWindow.CleanPlayerBuffs = BuffTracker:Create ("CleanPlayerBuffs", "Root", buffAnchor, GameData.BuffTargetType.SELF, c_MAX_BUFF_SLOTS, c_BUFF_STRIDE, SHOW_BUFF_FRAME_TIMER_LABELS)
    
    -- Stop the regular player buffs from showing
    PlayerWindow.UpdateBuffs = function() return end
    PlayerWindow.OnEffectsUpdated = function() return end
    PlayerWindow.playerBuffs:ClearAllBuffs()
    
    CleanPlayerWindow.UpdatePlayer()
    CleanPlayerWindow.OnRvRFlagUpdated()
    CleanPlayerWindow.UpdateCurrentHitPoints()
    CleanPlayerWindow.UpdateMaximumHitPoints()
    CleanPlayerWindow.UpdateCurrentActionPoints()
    CleanPlayerWindow.UpdateMaximumActionPoints()
    
    -- Move the open party button to be at our custom anchor.
    WindowClearAnchors("OpenPartySearchButton")
    WindowAddAnchor("OpenPartySearchButton", "topleft", "CleanOPBAnchor", "topleft", 0, 0 )
    
end

function CleanPlayerWindow.OnLoad()
    CleanPlayerWindow.UpdateBuffs()
    
    -- Reanchor the pet bar to our frame and make it cleaner.
    if DoesWindowExist("PetHealthWindow") then
        WindowSetParent("PetHealthWindow", "CleanPetAnchor")
        WindowSetShowing("PetHealthWindowPortrait", false)
        WindowSetShowing("PetHealthWindowPortraitFrame", false)
        WindowSetShowing("PetHealthWindowLevelBackground", false)
        WindowClearAnchors("PetHealthWindowLevelText")
        WindowAddAnchor("PetHealthWindowLevelText", "bottomleft", "PetHealthWindowHealthBarFrame", "bottomleft", 0, 7)
        WindowClearAnchors("PetHealthWindow")
        WindowAddAnchor("PetHealthWindow", "topleft", "CleanPetAnchor", "topleft", 0, 0)
        WindowClearAnchors("PetHealthWindowName")
        WindowAddAnchor("PetHealthWindowName", "topleft", "PetHealthWindowHealthBarFrame", "bottomleft", 0, 0)
        LabelSetFont("PetHealthWindowName", "font_clear_small_bold", 20)
    end
    local texture, x, y = GetIconData( Icons.GetCareerIconIDFromCareerLine( GameData.Player.career.line ) )
    DynamicImageSetTexture( "CleanPlayerWindowCareerIcon", texture, x, y )
    WindowSetShowing( "CleanPlayerWindowCareerIcon", true )
end

-- OnShutdown Handler
function CleanPlayerWindow.Shutdown()
    WindowSetShowing("PlayerStatusWindow", true)
    WindowSetAlpha("PlayerStatusWindow", 1.0)
    
    CleanPlayerWindow.CleanPlayerBuffs:Shutdown ()
end

function CleanPlayerWindow.OnPlayerCast(spellId, isChannel, castTime)
    if CleanSettings.MouseOverCast and (SystemData.MouseOverWindow.name == "CleanPlayerWindow") then
        local abilityData = GetAbilityTable(GameData.AbilityType.STANDARD)
        if (abilityData[spellId]) and (abilityData[spellId].targetType == 2) then
            if TargetInfo:UnitName("selffriendlytarget") ~= GameData.Player.name and
            TargetInfo:UnitName("selffriendlytarget") ~= L"" then
                CleanPlayerWindow.oldTarget = TargetInfo:UnitName("selffriendlytarget")
                TargetPlayer(GameData.Player.name)
            end
        end
    end
end

function CleanPlayerWindow.OnTargetUpdated()
    if CleanPlayerWindow.oldTarget then
        if CleanPlayerWindow.oldTarget ~= L"" then TargetPlayer(CleanPlayerWindow.oldTarget) end
        CleanPlayerWindow.oldTarget = nil
    end
end

-- Updates the player's current amount of available action points
function CleanPlayerWindow.UpdateCurrentActionPoints()

    StatusBarSetCurrentValue( "CleanPlayerWindowStatusContainerAPPercentBar", GameData.Player.actionPoints.current )
    CleanPlayerWindow.UpdateAPTextLabel()
    local isStatusBarFull = ( GameData.Player.hitPoints.current == GameData.Player.hitPoints.maximum and 
                            GameData.Player.actionPoints.current == GameData.Player.actionPoints.maximum )
    if (isWindowAlphaZero == true) then
        if (isStatusBarFull == false or isPlayerInAgroMode == true) then
            CleanPlayerWindow.ShowHealthWindow()
            CleanPlayerWindow.PerformFadeIn()
        end
    else
        if (fadeOutAnimationDelay == 0 and
            isStatusBarFull == true and
            isPlayerInAgroMode == false) then
            fadeOutAnimationDelay = CleanPlayerWindow.FADE_OUT_ANIM_DELAY
        end
    end
end

-- Updates the maximum number of APs available to the player
function CleanPlayerWindow.UpdateMaximumActionPoints()

    StatusBarSetMaximumValue( "CleanPlayerWindowStatusContainerAPPercentBar", GameData.Player.actionPoints.maximum ) 
    CleanPlayerWindow.UpdateAPTextLabel()   
        
end

function CleanPlayerWindow.OnAgroModeUpdated( newAgroMode )
    isPlayerInAgroMode = newAgroMode
    -- we don't want to fade anything. maybe a banzai mod later.
end

-- Updates the AP text label
function CleanPlayerWindow.UpdateAPTextLabel()   
    -- This is disabled because there are no fonts small enough not to be cut-off by this miniscule window.
    -- Feel free to re-enable this label when the size of either the window or the font has been adjusted.
    --local apText = GameData.Player.actionPoints.current..L"/"..GameData.Player.actionPoints.maximum
    --LabelSetText( "CleanPlayerWindowStatusContainerAPText", apText )
end

function CleanPlayerWindow.UpdateBuffs ()
    if CleanSettings.ShowPlayerBuffs ~= false then
        CleanPlayerWindow.CleanPlayerBuffs:Refresh ()
    else
        CleanPlayerWindow.CleanPlayerBuffs:ClearAllBuffs ()
    end
    
    -- Make the stupid internal buffs window not screw up with mouseover
    if DoesWindowExist("EA_Window_InternalBuffs") then
        WindowSetHandleInput("EA_Window_InternalBuffs", false)
    end
end

function CleanPlayerWindow.OnEffectsUpdated( updatedEffects )
    if CleanSettings.ShowPlayerBuffs ~= false then
        CleanPlayerWindow.CleanPlayerBuffs:UpdateBuffs( updatedEffects )
    else
        CleanPlayerWindow.CleanPlayerBuffs:ClearAllBuffs ()
    end
end



-- Updates the player's current amount of available hit points
function CleanPlayerWindow.UpdateCurrentHitPoints()

    local text = wstring.format(L"%d/%d", GameData.Player.hitPoints.current, GameData.Player.hitPoints.maximum)

    StatusBarSetCurrentValue( "CleanPlayerWindowStatusContainerHealthPercentBar", GameData.Player.hitPoints.current )   
    
    if not ( GameData.Player.hitPoints.current == 0 ) then
        local isStatusBarFull = ( GameData.Player.hitPoints.current == GameData.Player.hitPoints.maximum and 
                                  GameData.Player.actionPoints.current == GameData.Player.actionPoints.maximum )
    end
    
    -- Cache the previous hitpoint level
    prevHitpointLevel = GameData.Player.hitPoints.current
    
    CleanPlayerWindow.UpdateHealthTextLabel()
    
end

-- Updates the maximum number of HPs available to the player
function CleanPlayerWindow.UpdateMaximumHitPoints()

    StatusBarSetMaximumValue( "CleanPlayerWindowStatusContainerHealthPercentBar", GameData.Player.hitPoints.maximum ) 
    CleanPlayerWindow.UpdateHealthTextLabel()
        
end

-- Updates the Health text label
function CleanPlayerWindow.UpdateHealthTextLabel()   
    local healthText = L""
    
    if ( GameData.Player.hitPoints.current == 0 ) then
        healthText = L"DEAD"
    else
        healthText = towstring(GameData.Player.hitPoints.current)
    end
    LabelSetText( "CleanPlayerWindowStatusContainerHealthText", healthText )
    
end

-- Opens the contextual right-click menu
function CleanPlayerWindow.ShowMenu()

    local disableUnflag = true
    if (GameData.Player.rvrZoneFlagged == false and GameData.Player.rvrPermaFlagged == true) then
        if (bUnflagCountdownStarted == false) then
            disableUnflag = false
        end
    end

    EA_Window_ContextMenu.CreateContextMenu( "CleanPlayerWindow" )
    EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_FLAG_PLAYER_RVR), PlayerWindow.OnMenuClickFlagRvR, GameData.Player.rvrZoneFlagged or GameData.Player.rvrPermaFlagged, true )
    EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_UNFLAG_PLAYER_RVR), PlayerWindow.OnMenuClickUnFlagRvR, disableUnflag, true )
    
    -- Show the "Leave Party" option if the player is currently in a player-made party
    if( ( GroupWindow.inWorldGroup or IsWarBandActive() ) and not GameData.Player.isInScenario ) then
        EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_GROUP_OPTIONS ), EA_Window_OpenParty.OpenToManageTab, false, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
        EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_LEAVE_GROUP), PlayerWindow.OnMenuClickLeaveGroup, false, true )
        if ( GameData.Player.isGroupLeader )
        then
            SystemData.UserInput.selectedGroupMember = GameData.Player.name
            EA_Window_ContextMenu.AddMenuItem( GetString( StringTables.Default.LABEL_MAKE_MAIN_ASSIST ), GroupWindow.OnMakeMainAssist, playerIsMainAssist, true, EA_Window_ContextMenu.CONTEXT_MENU_1 )
        end
    end
    
    -- Show the "Leave Scenario Party" option if the player is in a scenario party
    if( GroupWindow.inScenarioGroup ) then
        EA_Window_ContextMenu.AddMenuItem( GetStringFromTable("HUDStrings", StringTables.HUD.LABEL_LEAVE_SCENARIO_GROUP), PlayerWindow.OnMenuClickLeaveScenarioGroup, false, true )        
    end
    
    EA_Window_ContextMenu.Finalize()

end

function CleanPlayerWindow.OnMenuClickFlagRvR()
    SystemData.UserInput.ChatText = L"/rvr"
    BroadcastEvent( SystemData.Events.SEND_CHAT_TEXT )
end

function CleanPlayerWindow.OnMenuClickUnFlagRvR()
    bUnflagCountdownStarted = true
    SystemData.UserInput.ChatText = L"/rvr"
    WindowStartAlphaAnimation( "CleanPlayerWindowRvRFlagIndicator", Window.AnimationType.LOOP, 0.1, 1.0, 0.8, false, 0, 0 )
    BroadcastEvent( SystemData.Events.SEND_CHAT_TEXT )
end

function CleanPlayerWindow.OnMenuClickLeaveGroup()
    BroadcastEvent( SystemData.Events.GROUP_LEAVE )
end

function CleanPlayerWindow.OnMenuClickLeaveScenarioGroup()
    ScenarioGroupWindow.LeaveGroup()
end

function CleanPlayerWindow.OnMenuClickShowWarband()
    WindowSetShowing( "BattlegroupWindow", true )
end

-- OnUpdate Handler
function CleanPlayerWindow.Update( timePassed )    
    
    if not endLoading then
        CleanPlayerWindow.UpdatePlayer()
        endLoading = true
    end
    
    if( bUnflagCountdownStarted == true and GameData.Player.rvrPermaFlagged == false) then
        bUnflagCountdownStarted = false
    end
    
    if( rvrFlagStartTimer > 0 ) then
    
        rvrFlagStartTimer = rvrFlagStartTimer - timePassed
        if( rvrFlagStartTimer < 0 ) then
            rvrFlagStartTimer = 0
        end
        
        local time = wstring.format(L"%.0f", rvrFlagStartTimer + 0.5)           
        local text = GetStringFormat( StringTables.Default.TEXT_ENTERED_RVR_AREA, { time } )
    
        LabelSetText("CleanPlayerWindowRvRFlagCountDown", wstring.format(L"%.0f", rvrFlagStartTimer + 0.5) )
    end
    CleanPlayerWindow.CleanPlayerBuffs:Update (timePassed)
end

function CleanPlayerWindow.OnStartRvRFlagTimer( )
    
    rvrFlagStartTimer = 10
    WindowSetShowing( "CleanPlayerWindowRvRFlagCountDown", true )
    WindowSetShowing( "CleanPlayerWindowRvRFlagIndicator", true )
    WindowStartAlphaAnimation( "CleanPlayerWindowRvRFlagIndicator", Window.AnimationType.LOOP, 0.1, 1.0, 0.5, false, 0, 0 )
    
end

function CleanPlayerWindow.UpdateBasedOnUserSettings()
    --maybe we'll optionally allow health fading later, but for now, no.
end

function CleanPlayerWindow.PerformFadeOut()
    -- kept here only so we won't error if something else tries to call this. we ignore requests to fade either way.
end

function CleanPlayerWindow.PerformFadeIn()
    -- kept here only so we won't error if something else tries to call this. we ignore requests to fade either way.
end

function CleanPlayerWindow.HideHealthWindow()
    -- kept here only so we won't error if something else tries to call this. we ignore requests to hide either way.
end

function CleanPlayerWindow.ShowHealthWindow()
    -- Show bars
    WindowSetShowing( "CleanPlayerWindowStatusContainerHealthPercentBar", true )
    WindowSetShowing( "CleanPlayerWindowStatusContainerHealthBarFrame", true )
    WindowSetShowing( "CleanPlayerWindowStatusContainerHealthBarBG", true )
    WindowSetShowing( "CleanPlayerWindowStatusContainerAPPercentBar", true )
    WindowSetShowing( "CleanPlayerWindowStatusContainerAPBarFrame", true )
    WindowSetShowing( "CleanPlayerWindowStatusContainerAPBarBG", true )
    WindowSetShowing( "CleanPlayerWindowStatusContainerHealthText", true )
    
    -- Hiding the AP Text Label until something is done about the font size:
    -- See corresponding note in CleanPlayerWindow.UpdateAPTextLabel
    WindowSetShowing ("CleanPlayerWindowStatusContainerAPText", false)
end

function CleanPlayerWindow.OnRvRFlagUpdated()

    WindowSetShowing( "CleanPlayerWindowRvRFlagIndicator", GameData.Player.rvrPermaFlagged or GameData.Player.rvrZoneFlagged)
    
    if (bUnflagCountdownStarted == true) then
        if (GameData.Player.rvrPermaFlagged == false) then
            WindowStopAlphaAnimation( "CleanPlayerWindowRvRFlagIndicator" )
            bUnflagCountdownStarted = false
        end
    else
        WindowStopAlphaAnimation( "CleanPlayerWindowRvRFlagIndicator" )
    end
    WindowSetShowing( "CleanPlayerWindowRvRFlagCountDown", false )

end

function CleanPlayerWindow.UpdatePlayer()

    -- Name
    LabelSetText( "CleanPlayerWindowName", GameData.Player.name )
    WindowSetShowing( "CleanPlayerWindow", true )
    WindowSetShowing( "PlayerWindow", false )

    

    if CleanSettings.showNameColors then
        if CleanSettings.archColors[ CleanSettings.arches[GameData.Player.career.line] ] then
            LabelSetTextColor( "CleanPlayerWindowName", unpack( CleanSettings.archColors[ CleanSettings.arches[GameData.Player.career.line] ] ) )
        end
    else
        LabelSetTextColor( "CleanPlayerWindowName", 255, 255, 255 )
    end
    
    -- Level
    LabelSetText( "CleanPlayerWindowLevelText", L""..GameData.Player.level..L" / "..GameData.Player.Renown.curRank )
    --WindowSetShowing( "CleanPlayerWindowLevelBackground", true )    
    WindowSetShowing( "CleanPlayerWindowLevelText", true )
    
    --CleanPlayerWindow.UpdateAdvancementNag()
    CleanPlayerWindow.UpdateCrown()
    
    WindowSetShowing("PlayerWindow", false)    
end

function CleanPlayerWindow.Shutdown()
    -- set default player window back to showing
    WindowSetShowing( "PlayerWindow", true )
end

function CleanPlayerWindow.UpdateCrown()

    -- If the player is the Group Leader, hide/show the necessary crown
    WindowSetShowing("CleanPlayerWindowGroupLeaderCrown", GameData.Player.isGroupLeader == true)
end

-- OnMouseOver Handler for hit points
function CleanPlayerWindow.MouseoverHitPoints()
    if CleanSettings.MouseOverTarget then
        TargetPlayer(GameData.Player.name)
    else
        Tooltips.CreateTextOnlyTooltip( SystemData.ActiveWindow.name )
        Tooltips.SetTooltipText( 1, 1, GetString( StringTables.Default.LABEL_HIT_POINTS ))
        Tooltips.SetTooltipColorDef( 1, 1, Tooltips.COLOR_HEADING )
        Tooltips.SetTooltipText( 2, 1, GetString( StringTables.Default.TEXT_HP_BAR_DESC ))
        Tooltips.SetTooltipText( 3, 1, GetString( StringTables.Default.TEXT_STATUS_BAR_RIGHT_CLICK ))
        Tooltips.SetTooltipColorDef( 3, 1, Tooltips.COLOR_EXTRA_TEXT_DEFAULT )
        Tooltips.Finalize();
        Tooltips.AnchorTooltip( CleanPlayerWindow_TOOLTIP_ANCHOR )
    end
end

-- OnMouseOverEnd Handler for hit points
function CleanPlayerWindow.MouseoverEndHitPoints()
    
end

-- OnRButtonUp Handler for hit points
function CleanPlayerWindow.OnHitPointsRButtonUp()

    if( CleanPlayerWindow.Settings.alwaysShowHitPoints ) then
        CleanPlayerWindow.Settings.alwaysShowHitPoints = false
    else        
        CleanPlayerWindow.Settings.alwaysShowHitPoints = true
    end

end

-- OnMouseOver Handler for action points
function CleanPlayerWindow.MouseoverActionPoints()
    if CleanSettings.MouseOverTarget then
        TargetPlayer(GameData.Player.name)
    else            
        Tooltips.CreateTextOnlyTooltip( SystemData.ActiveWindow.name )
        Tooltips.SetTooltipText( 1, 1, GetString( StringTables.Default.LABEL_ACTION_POINTS ))
        Tooltips.SetTooltipColorDef( 1, 1, Tooltips.COLOR_HEADING )
        Tooltips.SetTooltipText( 2, 1, GetString( StringTables.Default.TEXT_AP_BAR_DESC ))
        Tooltips.SetTooltipText( 3, 1, GetString( StringTables.Default.TEXT_STATUS_BAR_RIGHT_CLICK ))
        Tooltips.SetTooltipColorDef( 3, 1, Tooltips.COLOR_EXTRA_TEXT_DEFAULT )
        Tooltips.Finalize();
        Tooltips.AnchorTooltip( CleanPlayerWindow_TOOLTIP_ANCHOR )
    end
end

function CleanPlayerWindow.OnMouseOver()
    if CleanSettings.MouseOverTarget then
        TargetPlayer(GameData.Player.name)
    end
end

-- OnMouseOverEnd Handler for action points
function CleanPlayerWindow.MouseoverEndActionPoints()
    
end

-- OnRButtonUp Handler for action points
function CleanPlayerWindow.OnAPPointsRButtonUp()

    if( CleanPlayerWindow.Settings.alwaysShowAPPoints ) then
        CleanPlayerWindow.Settings.alwaysShowAPPoints = false
    else        
        CleanPlayerWindow.Settings.alwaysShowAPPoints = true
    end
    
end

function CleanPlayerWindow.OnLButtonDown()

    -- Handle L Button Down so clicks don't go through to the world..
    -- And target Self
    BroadcastEvent( SystemData.Events.TARGET_SELF )
    
end

function CleanPlayerWindow.OnRButtonUp()

    CleanPlayerWindow.ShowMenu()

end

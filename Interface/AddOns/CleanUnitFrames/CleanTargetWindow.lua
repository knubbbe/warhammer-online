--------------------------------------------------------------------
-- Here's the mighty target window!  Fear its accurate description!
--------------------------------------------------------------------

CleanTargetWindow = { }

----------------------------------------------------------------
-- Local Variables
----------------------------------------------------------------

local c_PRIMARY_TARGET_LAYOUT_WINDOW   = "CleanEnemyTargetLayoutWindow"
local c_SECONDARY_TARGET_LAYOUT_WINDOW = "CleanFriendlyTargetLayoutWindow"

local c_PRIMARY_TARGET_LAYOUT_WINDOW_SCALE = 1.0
local c_SECONDARY_TARGET_LAYOUT_WINDOW_SCALE = 1.0

local c_PRIMARY_TARGET_ANCHOR  = 
{ 
    Point           = "topleft", 
    RelativeTo      = c_PRIMARY_TARGET_LAYOUT_WINDOW,
    RelativePoint   = "topleft", 
    XOffset         = 0,
    YOffset         = 0,
}

local c_SECONDARY_TARGET_ANCHOR  = 
{ 
    Point           = "topleft", 
    RelativeTo      = c_SECONDARY_TARGET_LAYOUT_WINDOW,
    RelativePoint   = "topleft", 
    XOffset         = 0,
    YOffset         = 0,
}


local c_HOSTILE_TARGET          = "selfhostiletarget"
local c_HOSTILE_TARGET_WINDOW   = "CleanEnemyTargetWindow"


local c_FRIENDLY_TARGET         = "selffriendlytarget"
local c_FRIENDLY_TARGET_WINDOW  = "CleanFriendlyTargetWindow"

local hostileCleanTargetFrame        = nil 
local friendlyCleanTargetFrame       = nil

local oldEscapeKeyProcessed = nil

----------------------------------------------------------------
-- CleanTargetWindow Functions
----------------------------------------------------------------

-- OnInitialize Handler
function CleanTargetWindow.Initialize()

    UnitFrames:AddFrameFactory ("CleanTargetUnitFrame", CleanTargetUnitFrame)
    
    CreateWindow("CleanEnemyTargetLayoutWindow", true)
    CreateWindow("CleanFriendlyTargetLayoutWindow", true)

    -- Hostile Target
    hostileCleanTargetFrame = UnitFrames:CreateNewFrame (c_HOSTILE_TARGET_WINDOW, "CleanTargetUnitFrame", c_HOSTILE_TARGET.."clean")

    hostileCleanTargetFrame:SetParent( c_PRIMARY_TARGET_LAYOUT_WINDOW )
    -- hostileCleanTargetFrame:SetScale( WindowGetScale( c_PRIMARY_TARGET_LAYOUT_WINDOW ) )
    hostileCleanTargetFrame:SetAnchor( c_PRIMARY_TARGET_ANCHOR )
    
    -- Friendly Target
    friendlyCleanTargetFrame = UnitFrames:CreateNewFrame (c_FRIENDLY_TARGET_WINDOW, "CleanTargetUnitFrame", c_FRIENDLY_TARGET.."clean")   
    friendlyCleanTargetFrame:SetParent( c_SECONDARY_TARGET_LAYOUT_WINDOW )
    -- friendlyCleanTargetFrame:SetScale( WindowGetScale( c_SECONDARY_TARGET_LAYOUT_WINDOW ) )
    friendlyCleanTargetFrame:SetAnchor( c_SECONDARY_TARGET_ANCHOR ) 

    -- Layout Windows
    WindowRegisterCoreEventHandler( c_SECONDARY_TARGET_LAYOUT_WINDOW, "OnInitializeCustomSettings", "CleanTargetWindow.InitializeSecondaryTargetLayout" )
    
    LayoutEditor.RegisterWindow( c_PRIMARY_TARGET_LAYOUT_WINDOW,
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_PRIMARY_TARGET_WINDOW_NAME )..L" (Clean)",
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_PRIMARY_TARGET_WINDOW_DESC )..L" (Clean)",
                                false, false,
                                true, nil )
       
    LayoutEditor.RegisterWindow( c_SECONDARY_TARGET_LAYOUT_WINDOW,
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_SECONDARY_TARGET_WINDOW_NAME )..L" (Clean)",
                                GetStringFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_EDIT_SECONDARY_TARGET_WINDOW_DESC )..L" (Clean)",
                                false, false,
                                true, nil )


    --WindowRegisterEventHandler (c_HOSTILE_TARGET_WINDOW, SystemData.Events.PLAYER_COMBAT_FLAG_UPDATED, "CleanTargetWindow.UpdateTargetCombat")
    WindowRegisterEventHandler (c_HOSTILE_TARGET_WINDOW, SystemData.Events.PLAYER_TARGET_UPDATED, "CleanTargetWindow.UpdateTarget")
    WindowRegisterEventHandler (c_HOSTILE_TARGET_WINDOW, SystemData.Events.PLAYER_TARGET_EFFECTS_UPDATED, "CleanTargetWindow.OnEffectsUpdated")
    
    RegisterEventHandler(SystemData.Events.LOADING_END, "CleanTargetWindow.UpdateTargetBuffs")
    RegisterEventHandler(SystemData.Events.RELOAD_INTERFACE, "CleanTargetWindow.UpdateTargetBuffs")
    
    CleanTargetWindow.UpdateTarget()    
    CleanTargetWindow.UpdateTargetBuffs()
    
    TargetUnitFrame.Update = function() return end
    
    -- Prevent the default target windows from displaying
    TargetWindow.UpdateLayoutForTargets = function() return end
    WindowSetShowing("TargetWindow", false)
    WindowSetShowing("FriendlyTargetWindow", false)
    
    
    local oldEscapeKeyProcessed = WindowUtils.EscapeKeyProcessed
    WindowUtils.EscapeKeyProcessed = function(...)
        if( SystemData.InputProcessed.EscapeKey == true ) then
            return
        end
        if( Player.CancelSpell() ) 
        then
            return;
        end 
        if( #WindowUtils.openWindowList > 0 ) then
            oldEscapeKeyProcessed(...)
            return
        end
        if( WindowGetShowing("CleanEnemyTargetWindow") or WindowGetShowing("CleanFriendlyTargetWindow") ) 
        then
            ClearTarget(GameData.TargetType.FRIENDLY)
            ClearTarget(GameData.TargetType.HOSTILE)
            return
        end
    
        oldEscapeKeyProcessed(...)
    end
--]]
end

function CleanTargetWindow.Shutdown()
    -- set target windows back to showing
    WindowSetShowing("TargetWindow", true)
    WindowSetShowing("FriendlyTargetWindow", true)
end

function CleanTargetWindow.InitializePrimaryTargetLayout()
    --WindowSetScale( c_PRIMARY_TARGET_LAYOUT_WINDOW, c_PRIMARY_TARGET_LAYOUT_WINDOW_SCALE*InterfaceCore.GetScale() )
end

function CleanTargetWindow.InitializeSecondaryTargetLayout()
    --WindowSetScale( c_SECONDARY_TARGET_LAYOUT_WINDOW, c_SECONDARY_TARGET_LAYOUT_WINDOW_SCALE*InterfaceCore.GetScale() )
end

function CleanTargetWindow.OnUpdate(elapsedTime)
    -- update target validity status
    if CleanSettings.hostileAbilityCheck then
        local valid, selected = IsTargetValid(CleanSettings.hostileAbilityCheck)
        if selected then
            if valid then
                WindowSetTintColor("CleanEnemyTargetWindow", 255, 255, 255)
                LabelSetTextColor("CleanEnemyTargetWindowStatusContainerHealthText", 255, 255, 255)
            else
                WindowSetTintColor("CleanEnemyTargetWindow", 160, 160, 160)
                LabelSetTextColor("CleanEnemyTargetWindowStatusContainerHealthText", 180, 180, 180)
            end
        end
    end
    
    if CleanSettings.friendlyAbilityCheck then
        local valid, selected = IsTargetValid(CleanSettings.friendlyAbilityCheck)
        if selected then
            if valid then
                WindowSetTintColor("CleanFriendlyTargetWindow", 255, 255, 255)
                LabelSetTextColor("CleanFriendlyTargetWindowStatusContainerHealthText", 255, 255, 255)
            else
                WindowSetTintColor("CleanFriendlyTargetWindow", 160, 160, 160)
                LabelSetTextColor("CleanFriendlyTargetWindowStatusContainerHealthText", 180, 180, 180)
            end
        end
    end
end

function CleanTargetWindow.UpdateTargetCombat()
    -- not implemented into cleanunitframe yet, TODO
    --hostileCleanTargetFrame:UpdateCombatState (GameData.Player.inCombat)
end

function CleanTargetWindow.UpdateTargetBuffs()
    if hostileCleanTargetFrame:IsShowing() then
        friendlyCleanTargetFrame:ClearBuffs()
        hostileCleanTargetFrame:RefreshBuffs()
    else
        hostileCleanTargetFrame:ClearBuffs()
    end
    if friendlyCleanTargetFrame:IsShowing() then
        friendlyCleanTargetFrame:ClearBuffs()
        friendlyCleanTargetFrame:RefreshBuffs()
    else
        friendlyCleanTargetFrame:ClearBuffs()
    end
end

function CleanTargetWindow.OnEffectsUpdated( updateType, updatedEffects )
    if ( updateType == GameData.BuffTargetType.TARGET_HOSTILE )
    then
        if CleanSettings.ShowTargetBuffs ~= false then
            hostileCleanTargetFrame.m_BuffTracker:UpdateBuffs( updatedEffects )
        else
            hostileCleanTargetFrame.m_BuffTracker:ClearAllBuffs()
        end
    elseif ( updateType == GameData.BuffTargetType.TARGET_FRIENDLY )
    then
        if CleanSettings.ShowTargetBuffs ~= false then
            friendlyCleanTargetFrame.m_BuffTracker:UpdateBuffs( updatedEffects )
        else
            friendlyCleanTargetFrame.m_BuffTracker:ClearAllBuffs()
        end
    end
end

function CleanTargetWindow.OnLoad()
    if CleanSettings.ShowTargetBuffs ~= false then
        hostileCleanTargetFrame.m_BuffTracker:Refresh()
    else
        hostileCleanTargetFrame.m_BuffTracker:ClearAllBuffs()
    end
    if CleanSettings.ShowTargetBuffs ~= false then
        friendlyCleanTargetFrame.m_BuffTracker:Refresh()
    else
        friendlyCleanTargetFrame.m_BuffTracker:ClearAllBuffs()
    end
end

local oldHostileEntityId
local oldFriendlyEntityId

function CleanTargetWindow.UpdateTarget( targetClassification, targetId, targetType )
    
    if( targetClassification ~= c_HOSTILE_TARGET and targetClassification ~= c_FRIENDLY_TARGET )
    then
        return
    end
    
    TargetInfo:UpdateFromClient()
    
    hostileCleanTargetFrame:UpdateUnit ()
    friendlyCleanTargetFrame:UpdateUnit ()

    local HostileEntityId = TargetInfo:UnitEntityId( c_HOSTILE_TARGET )
    local FriendlyEntityId = TargetInfo:UnitEntityId( c_FRIENDLY_TARGET )
    
    -- Show the layout frames when they are in-use
    if CleanSettings.ShowTargets ~= false then
        WindowSetShowing( c_PRIMARY_TARGET_LAYOUT_WINDOW, hostileCleanTargetFrame:IsShowing() )
        if hostileCleanTargetFrame:IsShowing() then
            if ( HostileEntityId ~= oldHostileEntityId ) then
                hostileCleanTargetFrame:ClearBuffs()
            end
        else
            hostileCleanTargetFrame:ClearBuffs()
        end
        WindowSetShowing( c_SECONDARY_TARGET_LAYOUT_WINDOW, friendlyCleanTargetFrame:IsShowing() )
        if friendlyCleanTargetFrame:IsShowing() then
            if ( FriendlyEntityId ~= oldFriendlyEntityId ) then
                friendlyCleanTargetFrame:ClearBuffs()
            end
        else
            friendlyCleanTargetFrame:ClearBuffs()
        end
    else
        WindowSetShowing( c_PRIMARY_TARGET_LAYOUT_WINDOW, false )
        WindowSetShowing( c_SECONDARY_TARGET_LAYOUT_WINDOW, false )
    end
    
    -- Make the default target frames stay hidden
    WindowSetShowing("PrimaryTargetLayoutWindow", false)
    WindowSetShowing("SecondaryTargetLayoutWindow", false)
    WindowSetShowing("TargetWindow", false)
    WindowSetShowing("FriendlyTargetWindow", false)
    
    oldHostileEntityId = HostileEntityId
    oldFriendlyEntityId = FriendlyEntityId
    
    --CleanTargetWindow.UpdateTargetBuffs()
end
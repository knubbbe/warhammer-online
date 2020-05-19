-----------------------------------------------------------------------------
--
-- Local utility functions and lookup tables
--
-----------------------------------------------------------------------------

local UnitIdToBuffTargetMapping =
{
    ["selfhostiletarget"]   = { buffTarget = GameData.BuffTargetType.TARGET_HOSTILE,    healthColor = { r = 255, g = 0, b = 0 } },
    ["selffriendlytarget"]  = { buffTarget = GameData.BuffTargetType.TARGET_FRIENDLY,   healthColor = { r = 0, g = 255, b = 0 } }
}

local FRIENDLY_UNIT     = true
local HOSTILE_UNIT      = false

local c_MAX_BUFF_COUNT  = 12
local c_BUFF_ROW_STRIDE = 6

--
-- The window for the entire unit frame.  Most of it is created dynamically (aside from the anchoring)
-- but the portrait remains as part of the window definition for CleanTargetUnitFrame.
--

CleanTargetUnitFrame = Frame:Subclass ("CleanTargetTemplate")

--
-- Create a new instance of a CleanTargetUnitFrame and initialize it.
-- 
function CleanTargetUnitFrame:Create (windowName, cleanUnitId)
    local unitId = cleanUnitId:match("([a-z]+)clean")
    
    local newUnitFrame = self:CreateFromTemplate (windowName)
        
    if (newUnitFrame == nil)
    then
        return nil
    end

    newUnitFrame.m_UnitId               = unitId
    newUnitFrame.m_Type                 = 0
    newUnitFrame.m_IsAStaticObject      = false
    newUnitFrame.m_IsThePlayer          = false 
    newUnitFrame.m_IsFriendly           = unitId == "selffriendlytarget"
    
    StatusBarSetMaximumValue( newUnitFrame:GetName().."StatusContainerHealthPercentBar", 100 )
    StatusBarSetMaximumValue( newUnitFrame:GetName().."StatusContainerEnemyHealthPercentBar", 100 )
    StatusBarSetMaximumValue( newUnitFrame:GetName().."StatusContainerAPPercentBar", 100 )
    
    if newUnitFrame.m_IsFriendly then
        WindowSetShowing(newUnitFrame:GetName().."StatusContainerEnemyHealthPercentBar", false)
        WindowSetShowing(newUnitFrame:GetName().."StatusContainerHealthPercentBar", true)
    else
        WindowSetShowing(newUnitFrame:GetName().."StatusContainerEnemyHealthPercentBar", true)
        WindowSetShowing(newUnitFrame:GetName().."StatusContainerHealthPercentBar", false)
    end
    
    WindowSetShowing(newUnitFrame:GetName().."StatusContainerAPBarFrame", false)
    WindowSetShowing(newUnitFrame:GetName().."StatusContainerAPBarBG", false)
    
    -- Initially hide some of the arbitrary indicator widgets until updates are processed
    WindowSetShowing( newUnitFrame:GetName().."GroupLeaderCrown", false)
    WindowSetShowing( newUnitFrame:GetName().."WarbandLeaderCrown", false)
    
    -- Create buffs...
   
    local buffAnchor = 
    {
        Point           = "bottomleft",
        RelativePoint   = "topleft",
        RelativeTo      = windowName.."StatusContainer", 
        XOffset         = 2,
        YOffset         = -4,
    }
    
    newUnitFrame.m_BuffTracker = BuffTracker:Create (windowName.."Buffs", "Root", buffAnchor, UnitIdToBuffTargetMapping[unitId].buffTarget, c_MAX_BUFF_COUNT, c_BUFF_ROW_STRIDE, SHOW_BUFF_FRAME_TIMER_LABELS)
    
    -- Make sure all the dynamically created windows were valid...destroy this frame if they weren't.
    if 
    (
        (newUnitFrame.m_BuffTracker == nil)
    )
    then
        self:Destroy ()
        return nil
    end
    
    -- Adjust anchors and status bar orientation accordingly depending on if
    -- the target is friendly or hostile

    LabelSetTextColor (windowName.."Name", 255, 255, 255)
    
    return newUnitFrame
end

--
-- CleanTargetUnitFrame event handlers.  These are the generic
-- handlers from the template.  They need to extract unique
-- window id's to know which CleanTargetUnitFrame to actually operate on
--

--
-- Generic RButtonUp event handler for CleanTargetUnitFrame
--
function CleanTargetUnitFrame.OnRButtonUp(flags, x, y)
    local unitFrame = FrameManager:GetActiveWindow ()
    
    if (unitFrame ~= nil)
    then
        local targetName = TargetInfo:UnitName (unitFrame.m_UnitId);
        local targetType = TargetInfo:UnitType (unitFrame.m_UnitId);

        if (targetName ~= GameData.Player.name and targetType == SystemData.TargetObjectType.ALLY_PLAYER) 
        then
            PlayerMenuWindow.ShowMenu(targetName) 
        end
    end
end

--
-- Time-based update function
--
function CleanTargetUnitFrame:Update(elapsedTime)
    self.m_BuffTracker:Update(elapsedTime)
end

--
-- Update a unit frame from its unitId information.
--
function CleanTargetUnitFrame:UpdateUnit()

    -- Using local variables because I removed the arguments...
    local unitId = self.m_UnitId

    -- Track these so the frame knows whether or not to show the con level (ie, not for static objects)
    -- Similar reasoning behind caching m_IsThePlayer.    
    self.m_Type = TargetInfo:UnitType (unitId);    

    self.m_IsAStaticObject  = (self.m_Type == SystemData.TargetObjectType.STATIC_ATTACKABLE or self.m_Type == SystemData.TargetObjectType.STATIC)
    self.m_IsThePlayer      = (self.m_Type == SystemData.TargetObjectType.SELF)
    
    -- Unit must have a name to show
    -- Unit must be a non-static, or attackable static object.
    local unitName      = TargetInfo:UnitName (unitId)
    local unitHasName   = unitName ~= L""
    local showUnitFrame = unitHasName -- and (self.m_Type ~= SystemData.TargetObjectType.STATIC)  -- Still showing static object frames, even though i hate it!
      
    -- Frame:Show returns the input parameter, to eliminate the need for another evaluation.
    if (self:Show (showUnitFrame) == false)
    then
        return
    end

    local unitTier  = TargetInfo:UnitTier (unitId)
    local unitLevel = TargetInfo:UnitLevel (unitId)
    local unitCon   = TargetInfo:UnitConType (unitId)
    local conColor  = DataUtils.GetTargetConColor (unitCon)
    
    self:UpdateLevel (unitLevel, conColor, unitTier)
    local nameText = unitName:match(L"([^\^]+).*")
    if wstring.len(nameText) > 25 then
        LabelSetText( self:GetName().."Name", wstring.sub(nameText, 1, 25)..L"..." )
    else
        LabelSetText( self:GetName().."Name", nameText )
    end
    if CleanSettings.archColors[ CleanSettings.arches[TargetInfo:UnitCareer(unitId)] ] then
        LabelSetTextColor(self:GetName().."Name", unpack( CleanSettings.archColors[ CleanSettings.arches[TargetInfo:UnitCareer(unitId)] ] ) )
        local texture, x, y = GetIconData( Icons.GetCareerIconIDFromCareerLine( TargetInfo:UnitCareer(unitId) ) )
        DynamicImageSetTexture( self:GetName().."CareerIcon", texture, x, y )
        WindowSetShowing( self:GetName().."CareerIcon", true )
    else
        LabelSetTextColor(self:GetName().."Name", 255, 255, 255)
        WindowSetShowing( self:GetName().."CareerIcon", false )
    end

    

    self:UpdateHealth()  
    WindowSetShowing(self:GetName().."RvRFlagIndicator", TargetInfo:UnitIsPvPFlagged(unitId))
    
end

function CleanTargetUnitFrame:RefreshBuffs ()
    if CleanSettings.ShowTargetBuffs ~= false then
        self.m_BuffTracker:Refresh ()
    else
        self.m_BuffTracker:ClearAllBuffs()
    end
end

function CleanTargetUnitFrame:ClearBuffs ()
    self.m_BuffTracker:ClearAllBuffs()
end

function CleanTargetUnitFrame:UpdateCombatState (isInCombat)
    --[[if (self.m_IsFriendly == false) then
        
        local windowName = self:GetName ()
        
        WindowSetShowing (windowName.."StatusSwordLeft", isInCombat)
        WindowSetShowing (windowName.."StatusSwordRight", isInCombat)
        
    end
    --]]
end

function CleanTargetUnitFrame:UpdateLevel (level, conColor, unitTier)
    local windowName = self:GetName ()

    local levelText = L""..level
    for i=1,unitTier do
        levelText = levelText..L"+"
    end
    
    LabelSetText        (windowName.."LevelText",        levelText)
    LabelSetTextColor   (windowName.."LevelText",        conColor.r, conColor.g, conColor.b)
    WindowSetShowing    (windowName.."LevelText",        self.m_IsAStaticObject == false)
end

function CleanTargetUnitFrame:UpdateHealth()   
    local showHealth = self.m_Type ~= SystemData.TargetObjectType.STATIC;
    
    newHealthVal = TargetInfo:UnitHealth(self.m_UnitId)
    
    StatusBarSetCurrentValue(self:GetName().."StatusContainerHealthPercentBar", newHealthVal)
    StatusBarSetCurrentValue(self:GetName().."StatusContainerEnemyHealthPercentBar", newHealthVal)
    StatusBarSetCurrentValue(self:GetName().."StatusContainerAPPercentBar", 0)
    
    local healthText = L""
    
    if not showHealth then
        healthText = L""
    elseif ( newHealthVal == 0 ) then
        healthText = L"DEAD"
    else
        healthText = towstring(newHealthVal)..L"%"
    end
    LabelSetText( self:GetName().."StatusContainerHealthText", healthText )
end

function CleanTargetUnitFrame:ShowBuffTimerLabels (showType)
    self.m_BuffTracker:ShowBuffTimerLabels (showType)
end
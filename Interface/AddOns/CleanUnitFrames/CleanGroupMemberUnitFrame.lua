-----------------------------------------------------------------------------
--
-- Local utility functions and lookup tables
--
-----------------------------------------------------------------------------

local UnitIdToCleanGroupMemberMapping =
{
    ["CleanGroupMember1"]  = { CleanGroupMemberIndex = 1 },
    ["CleanGroupMember2"]  = { CleanGroupMemberIndex = 2 },
    ["CleanGroupMember3"]  = { CleanGroupMemberIndex = 3 },
    ["CleanGroupMember4"]  = { CleanGroupMemberIndex = 4 },
    ["CleanGroupMember5"]  = { CleanGroupMemberIndex = 5 }
}

--
-- The window for the entire unit frame.  Most of it is created dynamically (aside from the anchoring)
-- but the portrait remains as part of the window definition for CleanGroupMemberUnitFrame.
--

CleanGroupMemberUnitFrame = Frame:Subclass ("CleanGroupMemberTemplate")


--
-- Create a new instance of a CleanGroupMemberUnitFrame and initialize it.
-- 
function CleanGroupMemberUnitFrame:Create (windowName, unitId)    
    local newUnitFrame = self:CreateFromTemplate (windowName)
        
    if (newUnitFrame == nil)
    then
        return nil
    end
    
    newUnitFrame.m_unitId = unitId
    --newUnitFrame.m_fadeOutAnimationDelay = 0
    --newUnitFrame.m_animationLengthTimer  = 0
    --newUnitFrame.m_fadeInAnimationDelay = 0
    --newUnitFrame.m_isWindowAlphaZero     = false
    --newUnitFrame.FADE_OUT_ANIM_DELAY = 2
    --newUnitFrame.FADE_IN_ANIM_DELAY = 1
    --newUnitFrame.ANIM_ALPHA_FADE_TIMER = 2
    
    StatusBarSetMaximumValue( newUnitFrame:GetName().."StatusContainerHealthPercentBar", 100 )
    StatusBarSetMaximumValue( newUnitFrame:GetName().."StatusContainerAPPercentBar", 100 )
    
    -- Initially hide some of the arbitrary indicator widgets until updates are processed
    WindowSetShowing( newUnitFrame:GetName().."GroupLeaderCrown", false)
    WindowSetShowing( newUnitFrame:GetName().."WarbandLeaderCrown", false)
    
  
    local buffAnchor = 
    {
        Point           = CleanSettings.Group.buffPoint or "bottomleft",
        RelativePoint   = CleanSettings.Group.buffRelPoint or "topleft",
        RelativeTo      = newUnitFrame:GetName().."StatusContainer", 
        XOffset         = CleanSettings.Group.buffX or 8,
        YOffset         = CleanSettings.Group.buffY or 4,
    }
    
    local groupIndex = UnitIdToCleanGroupMemberMapping[unitId].CleanGroupMemberIndex
    
    CleanGroupWindow.Buffs[groupIndex] = BuffTracker:Create ("CleanGroup"..groupIndex.."Buffs", "Root", buffAnchor, GameData.BuffTargetType.GROUP_MEMBER_START + (groupIndex - 1), 10, 10, HIDE_BUFF_FRAME_TIMER_LABELS)
    
    return newUnitFrame
end

function CleanGroupMemberUnitFrame:Show ( bShow )
    self:ParentShow (bShow)
    
    if (self.m_unitId == nil)
    then
        -- Early out since data is invalid
        return
    end
    
    WindowSetShowing(self:GetName().."StatusContainerEnemyHealthPercentBar", false)
    
    if (bShow == true)
    then
        if (CleanGroupWindow.groupData[UnitIdToCleanGroupMemberMapping[self.m_unitId].CleanGroupMemberIndex].isRVRFlagged == true)
        then
            WindowSetShowing(self:GetName().."RvRFlagIndicator", true)
        else
            WindowSetShowing(self:GetName().."RvRFlagIndicator", false)
        end
    else
        CleanGroupWindow.Buffs[UnitIdToCleanGroupMemberMapping[self.m_unitId].CleanGroupMemberIndex]:ClearAllBuffs()
        WindowSetShowing(self:GetName().."RvRFlagIndicator", false)
    end
end

function CleanGroupMemberUnitFrame:ShowHealthWindow ()
    local windowName = self:GetName()
    WindowSetShowing( windowName.."HealthPercentBar", true )
    WindowSetShowing( windowName.."HealthBarFrame", true )
    WindowSetShowing( windowName.."HealthBarBG", true )
    WindowSetShowing( windowName.."APPercentBar", true )
    WindowSetShowing( windowName.."APBarFrame", true )
    WindowSetShowing( windowName.."APBarBG", true )
    WindowSetShowing( windowName.."HealthText", true )
    --WindowSetShowing( windowName.."APText", true )
end
function CleanGroupMemberUnitFrame:HideHealthWindow ()
    local windowName = self:GetName()
    WindowSetShowing( windowName.."HealthPercentBar", false )
    WindowSetShowing( windowName.."HealthBarFrame", false )
    WindowSetShowing( windowName.."HealthBarBG", false )
    WindowSetShowing( windowName.."APPercentBar", false )
    WindowSetShowing( windowName.."APBarFrame", false )
    WindowSetShowing( windowName.."APBarBG", false )
    WindowSetShowing( windowName.."HealthText", false )
    --WindowSetShowing( windowName.."APText", false )
end

--
-- Update a unit frame from its unitId information.
--
function CleanGroupMemberUnitFrame:SetName (CleanGroupMemberName)
    LabelSetText( self:GetName().."Name", CleanGroupMemberName )
    local groupIndex = tonumber((self:GetName()):match("CleanGroupWindowPlayer([1-5])"))
    local playerName = CleanGroupWindow.groupData[groupIndex].name
    WindowSetGameActionData(self:GetName().."Action", GameData.PlayerActions.SET_TARGET, 0, playerName)
    WindowSetHandleInput(self:GetName().."Action", true)
end

function CleanGroupMemberUnitFrame:SetCareerIcon( careerLine )
    local texture, x, y = GetIconData( Icons.GetCareerIconIDFromCareerLine( careerLine ) )
    DynamicImageSetTexture( self:GetName().."CareerIcon", texture, x, y )
end

function CleanGroupMemberUnitFrame:UpdateHealth (newHealthVal)
   local CleanGroupMemberIndex = UnitIdToCleanGroupMemberMapping[self.m_unitId].CleanGroupMemberIndex
    CleanGroupWindow.groupData[CleanGroupMemberIndex].healthPercent = newHealthVal
    StatusBarSetCurrentValue( self:GetName().."StatusContainerHealthPercentBar", newHealthVal )
    
    local healthText = L""
    
    if ( newHealthVal == 0 ) then
        healthText = L"DEAD"
    else
        healthText = towstring(newHealthVal)..L"%"
    end
    LabelSetText( self:GetName().."StatusContainerHealthText", healthText )
    
end
function CleanGroupMemberUnitFrame:UpdateActionPoints (newActionPoints)
    local CleanGroupMemberIndex = UnitIdToCleanGroupMemberMapping[self.m_unitId].CleanGroupMemberIndex
    CleanGroupWindow.groupData[CleanGroupMemberIndex].actionPointPercent = newActionPoints
    StatusBarSetCurrentValue( self:GetName().."StatusContainerAPPercentBar", newActionPoints )
    
end

function CleanGroupMemberUnitFrame:UpdateInSameRegion (isInSameRegion, newHealthVal)
    local CleanGroupMemberIndex = UnitIdToCleanGroupMemberMapping[self.m_unitId].CleanGroupMemberIndex
    
    if( isInSameRegion == false ) then
        LabelSetText( self:GetName().."StatusContainerHealthText", L"FAR" )
    else
        self:UpdateHealth(newHealthVal)
    end
end

function CleanGroupMemberUnitFrame:UpdateLevel (level)
    local windowName = self:GetName ()
    
    LabelSetText        (windowName.."LevelText",        L""..level)
    LabelSetTextColor   (windowName.."LevelText",        DefaultColor.XP_COLOR_FILLED.r, DefaultColor.XP_COLOR_FILLED.g, DefaultColor.XP_COLOR_FILLED.b)
end

function CleanGroupMemberUnitFrame:UpdateRVRFlag (isFlagged)
    WindowSetShowing(self:GetName().."RvRFlagIndicator", isFlagged)
end

function CleanGroupMemberUnitFrame:Update (elapsedTime)
    if (elapsedTime == nil) then
        return
    end
    local CleanGroupMemberIndex = UnitIdToCleanGroupMemberMapping[self.m_unitId].CleanGroupMemberIndex
    
    if WindowGetShowing(self:GetName()) and WindowGetShowing("CleanGroupWindow") then
        CleanGroupWindow.Buffs[CleanGroupMemberIndex]:Update (elapsedTime)
    end
end

function CleanGroupMemberUnitFrame:PerformFadeIn()
    -- kept here only so we won't error if something else tries to call this. we ignore requests to fade either way.
end
function CleanGroupMemberUnitFrame:PerformFadeOut()
    -- kept here only so we won't error if something else tries to call this. we ignore requests to fade either way.
end
--
-- Generic RButtonUp event handler for TargetUnitFrame
--
function CleanGroupMemberUnitFrame.OnRButtonUp (flags, x, y)
    local unitFrame = FrameManager:GetActiveWindow ()
    if (unitFrame ~= nil)
    then
        local groupIndex = tonumber((unitFrame:GetName()):match("CleanGroupWindowPlayer([1-5])"))
        local CleanGroupMemberName = CleanGroupWindow.groupData[groupIndex].name
        -- Reuse the default group window's menu for now.
        GroupWindow.ShowMenu( CleanGroupMemberName ) 
    end
end

--
-- Generic LButtonUp event handler for TargetUnitFrame
--
function CleanGroupMemberUnitFrame.OnLButtonUp (flags, x, y)
    --[[
    local unitFrame = FrameManager:GetActiveWindow ()
    if (unitFrame ~= nil)
    then
        local groupIndex = tonumber((unitFrame:GetName()):match("CleanGroupWindowPlayer([1-5])"))
        local playerName = CleanGroupWindow.groupData[groupIndex].name
        if( TargetPlayer( playerName ) == false )
        then
            AlertTextWindow.AddLine (SystemData.AlertText.Types.DEFAULT, GetStringFormat(StringTables.Default.TEXT_TARGET_PLAYER_ERROR, { playerName } ) );
        end
    end
    --]]
end

--
-- Generic MouseOver event handler for TargetUnitFrame
--
function CleanGroupMemberUnitFrame.OnMouseOver (flags, x, y)
    local unitFrame = FrameManager:GetActiveWindow ()
    
    if (unitFrame ~= nil)
    then
        local groupIndex = (unitFrame:GetName()):match("CleanGroupWindowPlayer([1-6])")
        groupIndex = tonumber(groupIndex)
        if not groupIndex then return end
        local CleanGroupMemberName = CleanGroupWindow.groupData[groupIndex].name
        
        if CleanSettings.MouseOverTarget then
            TargetPlayer(CleanGroupMemberName)
        else
        
            local line1 = GetStringFormat( StringTables.Default.RANK_X_Y, { CleanGroupWindow.groupData[UnitIdToCleanGroupMemberMapping[unitFrame.m_unitId].CleanGroupMemberIndex].level, CleanGroupWindow.groupData[UnitIdToCleanGroupMemberMapping[unitFrame.m_unitId].CleanGroupMemberIndex].careerName } )      
            local actiontext = GetString( StringTables.Default.TEXT_R_CLICK_TO_OPEN_GROUP_MENU )    
            
            Tooltips.CreateTextOnlyTooltip( unitFrame:GetName() )
            Tooltips.SetTooltipText( 1, 1, line1)
            Tooltips.SetTooltipColorDef( 1, 1, Tooltips.COLOR_HEADING )
            
            -- Don't show right-click options for the player if he/she is in a scenario as these options aren't
            -- available in scenario group settings!
            if( GameData.Player.isInScenario == false and (GameData.Player.isInSiege == false) ) then
                Tooltips.SetTooltipActionText( actiontext )
            end
            
            Tooltips.Finalize()
            local anchor = { Point = "bottomright",  RelativeTo = unitFrame:GetName().."LevelText", RelativePoint = "topleft",   XOffset = -5, YOffset = -5 }
            Tooltips.AnchorTooltip( anchor )
        end
    end
end

function CleanGroupMemberUnitFrame.OnMouseOverEnd (flags, x, y)
    local unitFrame = FrameManager:GetActiveWindow ()
    -- no use atm
end

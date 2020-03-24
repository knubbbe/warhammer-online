--[[
	This application is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    The applications is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with the applications.  If not, see <http://www.gnu.org/licenses/>.
--]]

if not PureGroupUnitFrame then PureGroupUnitFrame = Frame:Subclass( "PureGroup_Default" ) end

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local min						= math.min
local DynamicImageSetTexture	= DynamicImageSetTexture
local DynamicImageSetTextureDimensions	= DynamicImageSetTextureDimensions
local LabelSetText 				= LabelSetText
local LabelSetTextColor 		= LabelSetTextColor
local WindowAddAnchor 			= WindowAddAnchor
local WindowClearAnchors 		= WindowClearAnchors
local WindowSetAlpha 			= WindowSetAlpha
local WindowSetDimensions 		= WindowSetDimensions
local WindowSetScale 			= WindowSetScale
local WindowSetShowing 			= WindowSetShowing
local WindowSetTintColor 		= WindowSetTintColor

local c_GROUP_MEMBER_NAME_LENGTH 	= 24

function PureGroupUnitFrame:Create( windowName, unitId )    
    local unitFrame = self:CreateFromTemplate( windowName )
    local unitIndex = tonumber( unitId:match( "group(.+)pure" ) )
    local unitEffectIndex = unitIndex
    
    if( unitFrame == nil ) then return nil end
    
    -- Effects are 0 through 4 for group members, and 6 for player
    if( unitEffectIndex < 6 ) then
    	unitEffectIndex = unitEffectIndex - 1
	end
	
	unitFrame.m_unitIndex			= unitIndex			
	unitFrame.m_unitEffectIndex		= unitEffectIndex
    unitFrame.m_unitId 				= unitId
    unitFrame.m_windowId			= windowName
	unitFrame.m_effectWindowId 		= windowName .. "Effects"
	unitFrame.m_unitName			= L""
	unitFrame.hitpointsDx			= 0
	unitFrame.hitpointsDy			= 0
	unitFrame.actionpointsDx		= 0
	unitFrame.actionpointsDy		= 0
	unitFrame.m_prevHitPoints		= -1
	unitFrame.m_prevActionPoints	= -1
	unitFrame.m_prevMoraleLevel 	= -1
	
	unitFrame:UpdateIsTarget( false )
	unitFrame:UpdateEffectsDispel( false )
	unitFrame:UpdateRvRFlag( false )
	unitFrame:UpdateIsInSameRegion( false )
	unitFrame:UpdateGroupLeader( false )
	unitFrame:UpdateMainAssist( false )
	unitFrame:UpdateAssistant( false )
	unitFrame:UpdateMasterLooter( false )
	unitFrame:UpdateOnline( false )
	
	LabelSetText( windowName .. "Offline", T["Offline"] )
	
	return unitFrame
end

function PureGroupUnitFrame:LoadUnitFrame()
	self:InitializeFrameElements()
	self:InitializeEffectTracker()
end

function PureGroupUnitFrame:UnloadUnitFrame()
	self:ShutdownEffectTracker()
end

function PureGroupUnitFrame:UpdateLayout()
	self:InitializeFrameElements()
end

function PureGroupUnitFrame:InitializeFrameElements()
	local windowId = self:GetName()
	
	--
	-- We set both of these to 1.0, as it seems when changing the font alpha to something higher than
	-- the window alpha, it defaults to the window alpha.
	--
	WindowSetAlpha( windowId, 1.0 )
	WindowSetFontAlpha( windowId, 1.0 )
	WindowSetHandleInput( windowId, Pure.Get( "group-frame-handleinput" ) )
	
	-- Reprocess the windows anchors
	self:ForceProcessAnchors()
	
	-- Load our bar textures
	local hitpointsTexture, hitpointsSize = Pure.GetHitPointsTextureAndSize()
	local actionpointsTexture, actionpointsSize = Pure.GetActionPointsTextureAndSize()
	
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatus", unpack( hitpointsSize ) )
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatusBackground", unpack( hitpointsSize ) )
	
	DynamicImageSetTextureDimensions( windowId.."ActionPointsStatus", unpack( actionpointsSize ) )
	DynamicImageSetTextureDimensions( windowId.."ActionPointsStatusBackground", unpack( actionpointsSize ) )
	
	DynamicImageSetTexture( windowId.."HitPointsStatus", hitpointsTexture, 0, 0 )
	DynamicImageSetTexture( windowId.."HitPointsStatusBackground", hitpointsTexture, 0, 0 )
	
	DynamicImageSetTexture( windowId.."ActionPointsStatus", actionpointsTexture, 0, 0 )
	DynamicImageSetTexture( windowId.."ActionPointsStatusBackground", actionpointsTexture, 0, 0 )
	
	WindowSetAlpha( windowId, Pure.Get( "group-frame-alpha" ) )
	WindowSetFontAlpha( windowId, Pure.Get( "group-frame-font-alpha" ) )
	
	-- Update our status color
	WindowSetTintColor( windowId .. "HitPointsStatus", unpack( Pure.Get( "group-hitpoints-status-color" ) ) )
	WindowSetTintColor( windowId .. "ActionPointsStatus", unpack( Pure.Get( "group-actionpoints-status-color" ) ) )
	
	WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( Pure.Get( "group-hitpoints-status-color" ) ) )
	WindowSetTintColor( windowId .. "ActionPointsStatusBackground", unpack( Pure.Get( "group-actionpoints-status-color" ) ) )
	
	WindowSetAlpha( windowId .. "HitPointsStatusBackground", .2 )
	WindowSetAlpha( windowId .. "ActionPointsStatusBackground", .2 )
	
	WindowSetTintColor( windowId .. "EffectsDispel", unpack( Pure.Get( "group-dispel-color" ) ) )
	WindowSetAlpha( windowId .. "EffectsDispel", Pure.Get( "group-dispel-alpha" ) )
	
	WindowSetTintColor( windowId .. "SelectedTarget", unpack( Pure.Get( "group-target-highlight-color" ) ) )
	WindowSetAlpha( windowId .. "SelectedTarget", Pure.Get( "group-target-highlight-alpha" ) )
	
	LabelSetTextColor( windowId .. "Morale", unpack( Pure.Get( "group-morale-color" ) ) )
	
	self.hitpointsDx, self.hitpointsDy = WindowGetDimensions( windowId .. "HitPointsStatusBackground" )
	self.actionpointsDx, self.actionpointsDy = WindowGetDimensions( windowId .. "ActionPointsStatusBackground" )
	
	self:UpdateRvRFlag( self.m_rvrFlagged )
	self:UpdateEffectsDispel( self.m_dispelFlagged )
	self:UpdateIsTarget( self.m_IsTarget )
	
	if( DoesWindowExist( self:GetName().."Sigil" ) ) then
		WindowSetShowing( self:GetName().."Sigil", false )
	end
end

function PureGroupUnitFrame:InitializeEffectTracker()
	-- If we already have a buff tracker, destroy it
	self:ShutdownEffectTracker()
	
	-- Only show if group effects are turned on
	local bShow = Pure.Get( "group-effects-show" )
	
	if( Pure.Get( "group-effects-show" ) ) then
		local location 			= Pure.Get( "group-effects-anchor" )
		local showLabels 		= Pure.Get( "group-effects-showlabels" )
		local totalCols		 	= Pure.Get( "group-effects-cols" )
		local totalRows			= Pure.Get( "group-effects-rows" )
		local rowOffset			= Pure.Get( "group-effects-row-offset" )
		local colOffset			= Pure.Get( "group-effects-col-offset" )
		local dx				= Pure.Get( "group-effects-dx" )
		local dy				= Pure.Get( "group-effects-dy" )
		local selfCastOnly		= Pure.Get( "group-effects-selfcastonly" )
		local initialAnchor		= Pure.GetEffectWindowAnchor( self.m_windowId, location )
		local effectsAlpha		= Pure.Get( "group-effects-alpha" )
		local effectsFontAlpha	= Pure.Get( "group-effects-font-alpha" )
		local effectsMBorder	= Pure.Get( "group-effects-mythicborder" )
		local handleInput		= Pure.Get( "group-frame-handleinput" )
		
		-- Create our effect tracker
		self.m_effectTracker = PureEffectTracker:Create( self.m_effectWindowId, "Root", self.m_unitEffectIndex, 
			PureEffectTracker.trackerType.ALL, totalRows, totalCols, initialAnchor, rowOffset, colOffset, location )
		self.m_effectTracker:Initialize( dx, dy, effectsAlpha, effectsFontAlpha, 10, effectsAlpha / 2, selfCastOnly, showLabels, true, effectsMBorder, handleInput )
	end
end

function PureGroupUnitFrame:UpdateUnit( name, careerLine, careerName )
	local windowId = self:GetName()
	
	self.m_unitName = towstring( name:match( L"([^^]+)^?([^^]*)" ) )
	
	local display = self.m_unitName
	
	if( display:len() > c_GROUP_MEMBER_NAME_LENGTH ) then
		display = display:sub( 1, c_TARGET_NAME_LENGTH ) .. L"..."
    end
    
	LabelSetText( windowId .. "Name", display )
end

function PureGroupUnitFrame:UpdateCareer( careerLine, careerName )
	local windowId = self:GetName()
	local color = {255,255,255}
	
	if( Pure.Get( "group-arch-color" ) ) then	
		color = Pure.GetCareerLineColor( careerLine )
	end
	LabelSetTextColor( windowId .. "Name", unpack( color ) )
	
	if( Pure.Get( "group-arch-color-hitpoints" ) ) then	
		color = Pure.GetCareerLineColor( careerLine )
		WindowSetTintColor( windowId .. "HitPointsStatus", unpack( color ) )
		WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( color ) )
	end
	
	if( Pure.Get( "group-classname-show" ) ) then
		LabelSetText( windowId .. "Career", careerName )
	else
		LabelSetText( windowId .. "Career", L"" )
	end
end

function PureGroupUnitFrame:Show( bShow )
	self:ParentShow( bShow )
	self:RefreshEffects()
end

function PureGroupUnitFrame:UpdateMorale( level )
	if( self.m_prevMoraleLevel ~= level ) then
		LabelSetText( self:GetName() .. "Morale", towstring( level ) )
		self.m_prevMoraleLevel = level
	end
end

function PureGroupUnitFrame:UpdateRvRFlag( flagged )
	local windowId = self:GetName()
	
	local color = { 255, 255, 255 }
	if( flagged ) then
		color = Pure.Get( "group-rvr-flag-color" )
	end
	self.m_rvrFlagged = flagged
	LabelSetTextColor( windowId .. "HitPoints", unpack( color ) )
end

function PureGroupUnitFrame:UpdateHitPoints( hitPercent )
	if( self.m_prevHitPoints == hitPercent ) then return end
	self.m_prevHitPoints = hitPercent
	
	local windowId = self:GetName()
	WindowSetDimensions( windowId .. "HitPointsStatus", min( self.hitpointsDx, self.hitpointsDx * ( hitPercent / 100 ) ), self.hitpointsDy )
	local display = wstring.format( L"%d%%", hitPercent )
	LabelSetText( windowId .. "HitPoints", display )
	
	if( hitPercent == 0 ) then
		self:UpdateEffectsDispel( false )
	end
end

function PureGroupUnitFrame:UpdateAssistant( assistant )
end

function PureGroupUnitFrame:UpdateGroupLeader( leader )
	local display = self.m_unitName
	
	if( display:len() > c_GROUP_MEMBER_NAME_LENGTH ) then
		display = display:sub( 1, c_TARGET_NAME_LENGTH ) .. L"..."
    end
	
	if( leader and not GameData.Player.isInScenarioGroup ) then
		LabelSetText( self:GetName() .. "Name", Pure.Get( "group-leader-indicator" ) .. display )
	else
		LabelSetText( self:GetName() .. "Name", display )
	end
end

function PureGroupUnitFrame:UpdateMainAssist( assist )
end

function PureGroupUnitFrame:UpdateOnline( online )
	local windowId = self:GetName()
	
	self.m_isOnline = online
	
	-- If the user is offline set their hp/ap to zero
	if( not online ) then
		self:UpdateHitPoints( 0 )
		self:UpdateActionPoints( 0 )
	end
	
	WindowSetShowing( windowId .. "HitPoints", online )
	WindowSetShowing( windowId .. "Offline", not online )
end

function PureGroupUnitFrame:UpdateMasterLooter( looter )
end

function PureGroupUnitFrame:UpdateActionPoints( actionPercent )
	if( self.m_prevActionPoints == actionPercent ) then return end
	self.m_prevActionPoints = actionPercent

	local windowId = self:GetName()
	WindowSetDimensions( windowId .. "ActionPointsStatus", self.actionpointsDx * ( actionPercent / 100 ), self.actionpointsDy )
	local display = wstring.format( L"%d%%", actionPercent )
	LabelSetText( windowId .. "ActionPoints", display )
end

function PureGroupUnitFrame:UpdateLevel( level )
	local levelText = L""..level
    LabelSetText( self:GetName() .. "Rank", levelText )
end

function PureGroupUnitFrame:UpdateIsInSameRegion( sameRegion )
	local windowId = self:GetName()
	
	self.m_isInSameRegion = true --sameRegion
	 
	-- Fade the frame based upon if the group member is in the same region
	if( self.m_isInSameRegion ) then
		WindowSetAlpha( windowId, Pure.Get( "group-frame-alpha" ) )
	else
		WindowSetAlpha( windowId, Pure.Get( "group-frame-alpha-outofrange" ) )
	end
	
	self:RefreshEffects()
end

function PureGroupUnitFrame:UpdateIsTarget( isTarget )
	self.m_IsTarget = isTarget
	if( Pure.Get( "group-target-highlight-show" ) ) then
		WindowSetShowing( self:GetName() .. "SelectedTarget", isTarget )
	else
		WindowSetShowing( self:GetName() .. "SelectedTarget", false )
	end
end

function PureGroupUnitFrame:UpdateEffectsDispel( dispel )
	self.m_dispelFlagged = dispel
	WindowSetShowing( self:GetName() .. "EffectsDispel", dispel )
end

function PureGroupUnitFrame:GetDispelFlag()
	return self.m_dispelFlagged
end

function PureGroupUnitFrame:Update( timeElapsed )
	if( self.m_effectTracker ~= nil and self:IsShowing() and self.m_isInSameRegion ) then
		self.m_effectTracker:Update( timeElapsed )
	end
end

function PureGroupUnitFrame:UpdateEffects( changedEffects, isFullList )
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:UpdateEffects( changedEffects, isFullList )
	end
end

function PureGroupUnitFrame:ClearEffects()
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:ClearEffects()
		self:UpdateEffectsDispel( false )
	end
end

function PureGroupUnitFrame:RefreshEffects()
	if( self.m_effectTracker ~= nil and self:IsShowing() and self.m_isInSameRegion ) then
		self.m_effectTracker:RefreshEffects()
	else
		self:ClearEffects()
	end
end

function PureGroupUnitFrame:ShutdownEffectTracker()
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:Destroy()
		self.m_effectTracker = nil 
	end
end

function PureGroupUnitFrame.OnLButtonUp( flags, x, y )
	-- Code pulled from Mythic code
	local unitFrame = FrameManager:GetActiveWindow()
    if( unitFrame ~= nil ) then
        PureGroup.OnLButtonUp( flags, x, y, unitFrame.m_unitIndex )
    end	
end

function PureGroupUnitFrame.OnRButtonUp( flags, x, y )	
	local unitFrame = FrameManager:GetActiveWindow()
    if( unitFrame ~= nil ) then
    	PureGroup.OnRButtonUp( flags, x, y, unitFrame.m_unitIndex )  
    end
end

function PureGroupUnitFrame:GetUnitName()
	return self.m_unitName
end
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

if not PurePlayerUnitFrame then PurePlayerUnitFrame = Frame:Subclass( "PurePlayer_Default" ) end

local min						= math.min
local DynamicImageSetTexture	= DynamicImageSetTexture
local DynamicImageSetTextureDimensions	= DynamicImageSetTextureDimensions
local LabelSetText 				= LabelSetText
local LabelSetTextColor 		= LabelSetTextColor
local WindowClearAnchors 		= WindowClearAnchors
local WindowSetAlpha 			= WindowSetAlpha
local WindowSetScale 			= WindowSetScale
local WindowSetShowing 			= WindowSetShowing
local WindowSetTintColor 		= WindowSetTintColor
local WindowSetDimensions		= WindowSetDimensions

local c_PLAYER_NAME_LENGTH 			= 15

function PurePlayerUnitFrame:Create( windowName, unitType )
	local unitFrame = self:CreateFromTemplate( windowName )
	
	if( unitFrame == nil ) then return nil end
	
	unitFrame.m_WindowId		= windowName
	unitFrame.m_EffectWindowId 	= windowName .. "Effects"
	
	unitFrame.hitpointsDx		= 0
	unitFrame.hitpointsDy		= 0
	unitFrame.actionpointsDx	= 0
	unitFrame.actionpointsDy	= 0
	
	unitFrame.m_unitName		= L""
	unitFrame.prevMoraleLevel	= -1
	
	return unitFrame
end

function PurePlayerUnitFrame:LoadUnitFrame()
	self:InitializeFrameElements()
	self:InitializeEffectTracker()
end

function PurePlayerUnitFrame:UnloadUnitFrame()
	self:ShutdownEffectTracker()
end

function PurePlayerUnitFrame:UpdateLayout()
	self:InitializeFrameElements()
end

function PurePlayerUnitFrame:InitializeEffectTracker()
	-- Uninitialize any tracker we may already have
	self:ShutdownEffectTracker()
		
	if( Pure.Get( "player-effects-show" ) ) then
		local location 			= Pure.Get( "player-effects-anchor" )
		local initialAnchor		= Pure.GetEffectWindowAnchor( self:GetName(), location )
		local showLabels 		= Pure.Get( "player-effects-showlabels" )
		local totalCols		 	= Pure.Get( "player-effects-cols" )
		local totalRows			= Pure.Get( "player-effects-rows" )
		local rowOffset			= Pure.Get( "player-effects-row-offset" )
		local colOffset			= Pure.Get( "player-effects-col-offset" )
		local dx				= Pure.Get( "player-effects-dx" )
		local dy				= Pure.Get( "player-effects-dy" )
		local selfCastOnly		= Pure.Get( "player-effects-selfcastonly" )
		local effectsAlpha		= Pure.Get( "player-effects-alpha" )
		local effectsFontAlpha	= Pure.Get( "player-effects-font-alpha" )
		local effectsMBorder	= Pure.Get( "player-effects-mythicborder" )
		local handleInput		= Pure.Get( "player-frame-handleinput" )
		
		-- Create our tracker
		self.m_effectTracker = PureEffectTracker:Create( self.m_EffectWindowId, "Root", GameData.BuffTargetType.SELF, 
			PureEffectTracker.trackerType.ALL, totalRows, totalCols, initialAnchor, rowOffset, colOffset, location )
		self.m_effectTracker:Initialize( dx, dy, effectsAlpha, effectsFontAlpha, 10, effectsAlpha / 2, selfCastOnly, showLabels, true, effectsMBorder, handleInput )
	end
end

function PurePlayerUnitFrame:ShutdownEffectTracker()
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:Destroy()
		self.m_effectTracker = nil 
	end
end

function PurePlayerUnitFrame:InitializeFrameElements()
	local windowId = self:GetName()
	
	--
	-- We set both of these to 1.0, as it seems when changing the font alpha to something higher than
	-- the window alpha, it defaults to the window alpha.
	--
	WindowSetAlpha( windowId, 1.0 )
	WindowSetFontAlpha( windowId, 1.0 )
	WindowSetHandleInput( windowId, Pure.Get( "player-frame-handleinput" ) )
	
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
	
	WindowSetAlpha( windowId, Pure.Get( "player-frame-alpha" ) )
	WindowSetFontAlpha( windowId, Pure.Get( "player-frame-font-alpha" ) )
	
	WindowSetTintColor( windowId .. "HitPointsStatus", unpack( Pure.Get( "player-hitpoints-status-color" ) ) )
	WindowSetTintColor( windowId .. "ActionPointsStatus", unpack( Pure.Get( "player-actionpoints-status-color" ) ) )
	
	WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( Pure.Get( "player-hitpoints-status-color" ) ) )
	WindowSetTintColor( windowId .. "ActionPointsStatusBackground", unpack( Pure.Get( "player-actionpoints-status-color" ) ) )
	
	WindowSetAlpha( windowId .. "HitPointsStatusBackground", .2 )
	WindowSetAlpha( windowId .. "ActionPointsStatusBackground", .2 )
	
	LabelSetTextColor( windowId .. "Morale", unpack( Pure.Get( "player-morale-color" ) ) )
	
	WindowSetTintColor( windowId .. "EffectsDispel", unpack( Pure.Get( "player-dispel-color" ) ) )
	WindowSetAlpha( windowId .. "EffectsDispel", Pure.Get( "player-dispel-alpha" ) )
	
	WindowSetTintColor( windowId .. "SelectedTarget", unpack( Pure.Get( "player-target-highlight-color" ) ) )
	WindowSetAlpha( windowId .. "SelectedTarget", Pure.Get( "player-target-highlight-alpha" ) )
	
	self.hitpointsDx, self.hitpointsDy = WindowGetDimensions( windowId .. "HitPointsStatusBackground" )
	self.actionpointsDx, self.actionpointsDy = WindowGetDimensions( windowId .. "ActionPointsStatusBackground" )
	
	if( DoesWindowExist( self:GetName().."Sigil" ) ) then
		WindowSetShowing( self:GetName().."Sigil", false )
	end
end

function PurePlayerUnitFrame:Show( bShow )
	if( self:IsShowing() == bShow ) then return end
	
	self:ParentShow( bShow )
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:Show( bShow )
	end
end
	
function PurePlayerUnitFrame:Update( timeElapsed )
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:Update( timeElapsed )
	end
end

function PurePlayerUnitFrame:UpdateEffects( changedEffects, isFullList )
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:UpdateEffects( changedEffects, isFullList )
	end
end

function PurePlayerUnitFrame:ClearEffects()
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:ClearEffects()
	end
end

function PurePlayerUnitFrame:RefreshEffects()
	if( self.m_effectTracker ~= nil and self:IsShowing() ) then
		self.m_effectTracker:RefreshEffects()
	else
		self:ClearEffects()
	end
end

function PurePlayerUnitFrame:UpdateName( name, careerLine, careerName )
	local windowId = self:GetName()
	local color = {255,255,255}
	
	self.m_unitName = name:match( L"([^\^]+).*" )
	
	if( self.m_unitName:len() > c_PLAYER_NAME_LENGTH ) then
		self.m_unitName  = wstring.sub( self.m_unitName, 1, c_PLAYER_NAME_LENGTH ) .. L"..."
    end

	LabelSetText( windowId .. "Name", self.m_unitName )
	
	if( Pure.Get( "player-arch-color" ) ) then
		color = Pure.GetCareerLineColor( careerLine )
	end
	LabelSetTextColor( windowId .. "Name", unpack( color ) )
	
	if( Pure.Get( "player-arch-color-hitpoints" ) ) then	
		color = Pure.GetCareerLineColor( careerLine )
		WindowSetTintColor( windowId .. "HitPointsStatus", unpack( color ) )
		WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( color ) )
	end
end

function PurePlayerUnitFrame:UpdateIsTarget( isTarget )
	WindowSetShowing( self:GetName() .. "SelectedTarget", isTarget and Pure.Get( "player-target-highlight-show" ) )
end

function PurePlayerUnitFrame:UpdateHitPoints( current, maximum )
	local windowId = self:GetName()
	WindowSetDimensions( windowId .. "HitPointsStatus", min( self.hitpointsDx, self.hitpointsDx * ( current / maximum  ) ), self.hitpointsDy )
	LabelSetText( windowId .. "HitPoints", towstring( PurePlayer.FormatHitPoints() ) )
end

function PurePlayerUnitFrame:UpdateActionPoints( current, maximum )
	local windowId = self:GetName()
	WindowSetDimensions( windowId .. "ActionPointsStatus", min( self.actionpointsDx * ( current / maximum ) ), self.actionpointsDy )
	LabelSetText( windowId .. "ActionPoints", towstring( PurePlayer.FormatActionPoints() ) )
end

function PurePlayerUnitFrame:UpdateRvRFlag( flagged )
	local color = { 255, 255, 255 }
	
	if( flagged ) then
		color = Pure.Get( "player-rvr-flag-color" )
	end
	
	LabelSetTextColor( self:GetName() .. "HitPoints", unpack( color ) )
end

function PurePlayerUnitFrame:UpdateMorale( moralePercent, moraleLevel )
	if( self.prevMoraleLevel ~= moraleLevel ) then
		LabelSetText( self:GetName() .. "Morale", towstring( moraleLevel ) )
		self.prevMoraleLevel = moraleLevel
	end
end

function PurePlayerUnitFrame:UpdateCareerResource( old, new )
end

function PurePlayerUnitFrame:UpdateIsGroupLeader( leader )
	if( leader and not GameData.Player.isInScenarioGroup ) then
		LabelSetText( self:GetName() .. "Name", Pure.Get( "group-leader-indicator" ) .. self.m_unitName )
	else
		LabelSetText( self:GetName() .. "Name", self.m_unitName )
	end
end

function PurePlayerUnitFrame:UpdateEffectsDispel( dispel )
	WindowSetShowing( self:GetName() .. "EffectsDispel", dispel )
end

function PurePlayerUnitFrame:UpdateLevel( careerLevel, renownRank )
	local display = wstring.format( L"%d - %d", careerLevel, renownRank )
	LabelSetText( self:GetName() .. "Rank", display )
end

function PurePlayerUnitFrame.OnLButtonDown(flags)
	PurePlayer.OnLButtonDown(flags)
end

function PurePlayerUnitFrame.OnRButtonUp(flags)
	PurePlayer.OnRButtonUp(flags)
end
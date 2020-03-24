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

if not PurePlayerPetUnitFrame then PurePlayerPetUnitFrame = Frame:Subclass( "PurePlayerPet_Default" ) end

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

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

local c_PLAYER_PET_NAME_LENGTH 	= 24

function PurePlayerPetUnitFrame:Create( windowName, unitType )
	local unitFrame = self:CreateFromTemplate( windowName )
	
	if( unitFrame == nil ) then return nil end
	
	unitFrame.m_WindowId		= windowName
	
	unitFrame.hitpointsDx		= 0
	unitFrame.hitpointsDy		= 0
	unitFrame.actionpointsDx 	= 0
	unitFrame.actionpointsDy 	= 0
	
	return unitFrame
end

function PurePlayerPetUnitFrame:LoadUnitFrame()
	self:InitializeFrameElements()
end

function PurePlayerPetUnitFrame:UnloadUnitFrame()
end

function PurePlayerPetUnitFrame:UpdateLayout()
	self:InitializeFrameElements()
end

function PurePlayerPetUnitFrame:InitializeFrameElements()
	local windowId = self:GetName()
	
	--
	-- We set both of these to 1.0, as it seems when changing the font alpha to something higher than
	-- the window alpha, it defaults to the window alpha.
	--
	WindowSetAlpha( windowId, 1.0 )
	WindowSetFontAlpha( windowId, 1.0 )
	WindowSetHandleInput( windowId, Pure.Get( "playerpet-frame-handleinput" ) )
	
	-- Reprocess the windows anchors
	self:ForceProcessAnchors()
	
	-- Load our bar textures
	local hitpointsTexture, hitpointsSize = Pure.GetHitPointsTextureAndSize()
	local actionpointsTexture, actionpointsSize = Pure.GetActionPointsTextureAndSize()
	
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatus", unpack( hitpointsSize ) )
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatusBackground", unpack( hitpointsSize ) )
	DynamicImageSetTexture( windowId.."HitPointsStatus", hitpointsTexture, 0, 0 )
	DynamicImageSetTexture( windowId.."HitPointsStatusBackground", hitpointsTexture, 0, 0 )
	
	WindowSetAlpha( windowId, Pure.Get( "playerpet-frame-alpha" ) )
	WindowSetFontAlpha( windowId, Pure.Get( "playerpet-frame-font-alpha" ) )
	
	-- Update our status color
	local color = Pure.Get( "playerpet-hitpoints-status-color" )
	WindowSetTintColor( windowId .. "HitPointsStatus", unpack( color ) )
	WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( color ) )
	WindowSetAlpha( windowId .. "HitPointsStatusBackground", .2 )
	
	self.hitpointsDx, self.hitpointsDy = WindowGetDimensions( windowId .. "HitPointsStatusBackground" )
end

function PurePlayerPetUnitFrame:Update( timeElapsed )
end

function PurePlayerPetUnitFrame:UpdateInformation( name )
	local windowId = self:GetName()
	name = name:match( L"([^\^]+).*" )
	if( name:len() > c_PLAYER_PET_NAME_LENGTH ) then
		name = wstring.sub( name, 1, c_PLAYER_PET_NAME_LENGTH ) .. L"..."
    end
	LabelSetText( windowId .. "Name", name )
end

function PurePlayerPetUnitFrame:UpdateHitPoints( percent )
	local windowId = self:GetName()
	WindowSetDimensions( windowId .. "HitPointsStatus", min( self.hitpointsDx, self.hitpointsDx * ( percent / 100 ) ), self.hitpointsDy )
	LabelSetText( windowId .. "HitPoints", wstring.format( L"%d%%", percent ) )
end

function PurePlayerPetUnitFrame:UpdateLevel( level )
	local windowId = self:GetName()
	LabelSetText( windowId .. "Rank", towstring( level ) )
    LabelSetTextColor( windowId .."Rank", DefaultColor.XP_COLOR_FILLED.r, DefaultColor.XP_COLOR_FILLED.g, DefaultColor.XP_COLOR_FILLED.b )
end

function PurePlayerPetUnitFrame.OnLButtonDown(flags)
	PurePlayerPet.OnLButtonDown(flags)
end

function PurePlayerPetUnitFrame.OnRButtonUp(flags)
	PurePlayerPet.OnRButtonUp(flags)
end
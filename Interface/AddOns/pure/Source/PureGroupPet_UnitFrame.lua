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

if not PureGroupPetUnitFrame then PureGroupPetUnitFrame = Frame:Subclass( "PurePetUnitFrame_Default" ) end

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

function PureGroupPetUnitFrame:Create( windowName, unitId )    
    local unitFrame = self:CreateFromTemplate( windowName )
    local unitIndex = tonumber( unitId:match( "grouppet(.+)pure" ) )
    
    if( unitFrame == nil ) then return nil end
    
    unitFrame.m_unitIndex		= unitIndex	
    unitFrame.m_unitId 			= unitId
    unitFrame.m_windowId		= windowName
    unitFrame.hitpointsDx		= 0
	unitFrame.hitpointsDy		= 0
	
	return unitFrame
end

function PureGroupPetUnitFrame:LoadUnitFrame()
	self:InitializeFrameElements()
	self:Show( false )
end

function PureGroupPetUnitFrame:UnloadUnitFrame()
	self:Show( false )
end

function PureGroupPetUnitFrame:UpdateLayout()
	self:InitializeFrameElements()
end

function PureGroupPetUnitFrame:InitializeFrameElements()
	local windowId = self:GetName()
	
	--
	-- We set both of these to 1.0, as it seems when changing the font alpha to something higher than
	-- the window alpha, it defaults to the window alpha.
	--
	WindowSetAlpha( windowId, 1.0 )
	WindowSetFontAlpha( windowId, 1.0 )
	WindowSetHandleInput( windowId, Pure.Get( "grouppet-frame-handleinput" ) )
	
	-- Reprocess the windows anchors
	self:ForceProcessAnchors()
	
	-- Load our bar textures
	local hitpointsTexture, hitpointsSize = Pure.GetHitPointsTextureAndSize()
	local actionpointsTexture, actionpointsSize = Pure.GetActionPointsTextureAndSize()
	
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatus", unpack( hitpointsSize ) )
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatusBackground", unpack( hitpointsSize ) )
	
	DynamicImageSetTexture( windowId.."HitPointsStatus", hitpointsTexture, 0, 0 )
	DynamicImageSetTexture( windowId.."HitPointsStatusBackground", hitpointsTexture, 0, 0 )
	
	WindowSetTintColor( windowId .. "HitPointsStatus", unpack( Pure.Get( "grouppet-hitpoints-status-color" ) ) )
	WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( Pure.Get( "grouppet-hitpoints-status-color" ) ) )
	
	WindowSetAlpha( windowId .. "HitPointsStatusBackground", .2 )
	WindowSetAlpha( windowId, Pure.Get( "grouppet-frame-alpha" ) )
	WindowSetFontAlpha( windowId, Pure.Get( "grouppet-frame-font-alpha" ) )
	
	self.hitpointsDx, self.hitpointsDy = WindowGetDimensions( windowId .. "HitPointsStatusBackground" )
end

function PureGroupPetUnitFrame:UpdateUnit( name, careerLine, careerName )
	local shortName = name:match( L"([^\^]+).*" )
	local color = {255,255,255}
	if( shortName:len() > c_GROUP_MEMBER_NAME_LENGTH ) then
		shortName = wstring.sub( shortName, 1, c_TARGET_NAME_LENGTH ) .. L"..."
    end
    LabelSetText( self:GetName() .. "Name", shortName )
end

function PureGroupPetUnitFrame:Show( bShow )
	self:ParentShow( bShow )
end

function PureGroupPetUnitFrame:UpdateHitPoints( hitPercent )
	local windowId = self:GetName()
	WindowSetDimensions( windowId .. "HitPointsStatus", min( self.hitpointsDx, self.hitpointsDx * ( hitPercent / 100 ) ), self.hitpointsDy )
	local display = wstring.format( L"%d%%", hitPercent )
	LabelSetText( windowId .. "HitPoints", display )
end

function PureGroupPetUnitFrame:UpdateIsInSameRegion( sameRegion )
end

function PureGroupPetUnitFrame:UpdateOnline( online )
end

function PureGroupPetUnitFrame:Update( timeElapsed )
end

function PureGroupPetUnitFrame.OnLButtonDown( flags, x, y )
	local frame = FrameManager:GetActiveWindow()
	
	if( frame ~= nil ) then
    	PureGroupPet.OnLButtonDown( flags, x, y, frame.m_unitIndex )
	end  
end
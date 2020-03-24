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

if not PureTargetHUDUnitFrame then PureTargetHUDUnitFrame = Frame:Subclass( "PureUnitFrameHUD_Default" ) end

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

local c_HOSTILE_TARGET          = "selfhostiletarget"
local c_FRIENDLY_TARGET         = "selffriendlytarget"
local c_TARGET_NAME_LENGTH 		= 40

local bRvRFlagged				= false
local bDispelFlagged			= false

local DEFAULT_COLOR				= {255,255,255}

function PureTargetHUDUnitFrame:Create( windowName, unitType )
	local baseUnitType = unitType:match("([a-z]+)hudpure")
	
	local unitFrame = self:CreateFromTemplate( windowName )
	
	if( unitFrame == nil ) then return nil end
	
	unitFrame.m_WindowId		= windowName
	unitFrame.m_UnitType		= baseUnitType
	unitFrame.m_IsFriendly		= baseUnitType == c_FRIENDLY_TARGET
	unitFrame.hitpointsDx		= 0
	unitFrame.hitpointsDy		= 0
	
	return unitFrame
end

function PureTargetHUDUnitFrame:LoadUnitFrame()
	self:InitializeFrameElements()
	self:UpdateUnit()
end

function PureTargetHUDUnitFrame:UpdateLayout()
	self:InitializeFrameElements()
end

function PureTargetHUDUnitFrame:InitializeFrameElements()
	local windowId = self:GetName()
	local hitColor, actionColor, dispelColor, dispelAlpha, windowAlpha, fontAlpha
	
	if( self.m_IsFriendly ) then
		hitColor 		= Pure.Get( "friendlyhud-hitpoints-status-color" )
		dispelColor 	= Pure.Get( "friendlyhud-dispel-color" )
		dispelAlpha 	= Pure.Get( "friendlyhud-dispel-alpha" )
		windowAlpha		= Pure.Get( "friendlyhud-frame-alpha" )
		fontAlpha		= Pure.Get( "friendlyhud-frame-font-alpha" )
	else
		hitColor 		= Pure.Get( "hostilehud-hitpoints-status-color" )
		dispelColor 	= Pure.Get( "hostilehud-dispel-color" )
		dispelAlpha 	= Pure.Get( "hostilehud-dispel-alpha" )
		windowAlpha		= Pure.Get( "hostilehud-frame-alpha" )
		fontAlpha		= Pure.Get( "hostilehud-frame-font-alpha" )
	end
	
	WindowSetLayer( windowId, Window.Layers.BACKGROUND )
	
	--
	-- We set both of these to 1.0, as it seems when changing the font alpha to something higher than
	-- the window alpha, it defaults to the window alpha.
	--
	WindowSetAlpha( windowId, 1.0 )
	WindowSetFontAlpha( windowId, 1.0 )
	
	-- Reprocess the windows anchors
	self:ForceProcessAnchors()
	
	-- Load our bar textures
	local hitpointsTexture, hitpointsSize = Pure.GetHitPointsTextureAndSize()
	
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatus", unpack( hitpointsSize ) )
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatusBackground", unpack( hitpointsSize ) )
	DynamicImageSetTexture( windowId.."HitPointsStatus", hitpointsTexture, 0, 0 )
	DynamicImageSetTexture( windowId.."HitPointsStatusBackground", hitpointsTexture, 0, 0 )
	
	WindowSetAlpha( windowId, windowAlpha )
	WindowSetFontAlpha( windowId, fontAlpha )
	
	-- Update our status color
	WindowSetTintColor( windowId .. "HitPointsStatus", unpack( hitColor ) )
	WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( hitColor ) )
	WindowSetAlpha( windowId .. "HitPointsStatusBackground", .3 )
	
	-- Update our dispel color
	WindowSetTintColor( windowId .. "EffectsDispel", unpack( dispelColor ) )
	WindowSetAlpha( windowId .. "EffectsDispel", dispelAlpha )

	self.hitpointsDx, self.hitpointsDy = WindowGetDimensions( windowId .. "HitPointsStatusBackground" )

	self:UpdateRvRFlag( false )
	self:UpdateEffectsDispel( false )
end

function PureTargetHUDUnitFrame:UnloadUnitFrame()
end

function PureTargetHUDUnitFrame:Update( timeElapsed )
end

function PureTargetHUDUnitFrame:UpdateUnit()
	local unitType = self.m_UnitType
	
	-- Show the window based upon the unit having a name
	local unitName = TargetInfo:UnitName( unitType )
	if( self:Show( unitName ~= L"" ) == false ) then
		return
	end
	
	local unitRvRFlag 		= TargetInfo:UnitIsPvPFlagged( unitType )
	local unitTier  		= TargetInfo:UnitTier( unitType )
	local tierDesc			= DataUtils.GetTargetTierDesc( unitTier )
    local unitLevel 		= TargetInfo:UnitLevel( unitType )
    local unitCon   		= TargetInfo:UnitConType( unitType )
    local conColor  		= DataUtils.GetTargetConColor( unitCon )
    local unitCareer		= TargetInfo:UnitCareerName( unitType )
    local unitCareerLine 	= TargetInfo:UnitCareer( unitType )
    
    -- Update the units primary left
	self:UpdateUnitName( unitName, unitCareerLine )
	
	-- Update the units rvr flag
	self:UpdateRvRFlag( unitRvRFlag )
	
	-- Update the units hit points
	self:UpdateHitPoints()
	
	-- Update the units level/con/tier display
	self:UpdateLevel( unitLevel, conColor, unitTier )
	
	-- Update the units career
	if( unitCareer:len() > 0 ) then
		self:UpdateCareer( unitCareer )
	else
		self:UpdateCareer( tierDesc )
	end
	
	-- Update the sigil display
	self:UpdateSigil()
end

function PureTargetHUDUnitFrame:UpdateUnitName( name, careerLine )
	local windowId = self:GetName()
	local shortName = name:match( L"([^\^]+).*" )
	local color = DEFAULT_COLOR
	if( shortName:len() > c_TARGET_NAME_LENGTH ) then
		shortName = wstring.sub( shortName, 1, c_TARGET_NAME_LENGTH ) .. L"..."
    end
    LabelSetText( windowId .. "Name", shortName )
    
    if( ( self.m_IsFriendly and Pure.Get( "friendlyhud-arch-color" ) ) or ( not self.m_IsFriendly and Pure.Get( "hostilehud-arch-color" ) ) ) then
		color = Pure.GetCareerLineColor( careerLine )
	end
	LabelSetTextColor( windowId .. "Name", unpack( color ) )
	
	if( ( self.m_IsFriendly and Pure.Get( "friendlyhud-arch-color-hitpoints" ) ) or ( not self.m_IsFriendly and Pure.Get( "hostilehud-arch-color-hitpoints" ) ) ) then
		color = Pure.GetCareerLineColor( careerLine )
		WindowSetTintColor( windowId .. "HitPointsStatus", unpack( color ) )
		WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( color ) )
	end
end

function PureTargetHUDUnitFrame:UpdateRvRFlag( flagged )
	local windowId = self:GetName()
	
	local color = DEFAULT_COLOR
	if( flagged ) then
		if( self.m_IsFriendly ) then
			color = Pure.Get( "friendlyhud-rvr-flag-color" )
		else
			color = Pure.Get( "hostilehud-rvr-flag-color" )
		end
	end
	bRvRFlagged = flagged
	LabelSetTextColor( windowId .. "HitPoints", unpack( color ) )
end

function PureTargetHUDUnitFrame:UpdateHitPoints()
	local windowId = self:GetName()
	local hits = TargetInfo:UnitHealth( self.m_UnitType )
	WindowSetDimensions( windowId .. "HitPointsStatus", self.hitpointsDx * ( hits / 100 ), self.hitpointsDy )
	local display = wstring.format( L"%d%%", hits )
	LabelSetText( windowId .. "HitPoints", display )
end

function PureTargetHUDUnitFrame:UpdateLevel( level, conColor, unitTier )
	local windowId = self:GetName()
	
	local levelText = L""..level
    for i=1,unitTier do
        levelText = levelText..L"+"
    end
    LabelSetText( windowId .. "Rank", levelText )
    LabelSetTextColor( windowId.."Rank", conColor.r, conColor.g, conColor.b )
end

function PureTargetHUDUnitFrame:UpdateSigil()
	self:SetSigil( TargetInfo:UnitSigilEntryId( self.m_UnitType ) )
end

function PureTargetHUDUnitFrame:SetSigil( sigilId )
	--
    -- Keep a similar display type as the default UI
    --
    if( sigilId ~= 0 ) then
       	sigilDisplayInfo =  TomeGetSigilDisplayInfo( sigilId )
       
       	if( sigilDisplayInfo ~= nil ) then
	    	local windowId = self:GetName().."Sigil"
	    	
			DynamicImageSetTexture( windowId, "EA_HUD_01", 17, 17 )	
			DynamicImageSetTextureSlice( windowId, sigilDisplayInfo.sliceName .. "-rollover" )
		end
    else
    	sigilDisplayInfo = nil
    end
    
    if( self.m_IsFriendly ) then
    	bShow = false
    else
    	bShow = Pure.Get( "hostilehud-sigil-show" )
    end
    
    WindowSetShowing( self:GetName().."Sigil", sigilId ~= 0 and sigilDisplayInfo ~= nil and bShow )
end

function PureTargetHUDUnitFrame:UpdateCareer( careerName )
	local windowId = self:GetName()
	local career = L""
	
	if( self.m_IsFriendly and Pure.Get( "friendlyhud-classname-show" ) ) then
		career = careerName
	elseif( not self.m_IsFriendly and Pure.Get( "hostilehud-classname-show" ) ) then
		career = careerName
	end
	
	LabelSetText( windowId .. "Career", career )
end

function PureTargetHUDUnitFrame:UpdateEffectsDispel( dispel )
	WindowSetShowing( self:GetName() .. "EffectsDispel", dispel )
end
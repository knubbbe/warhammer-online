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

if not PureTargetUnitFrame then PureTargetUnitFrame = Frame:Subclass( "PureUnitFrame_Default" ) end

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

local c_HOSTILE_TARGET          = "selfhostiletarget"
local c_FRIENDLY_TARGET         = "selffriendlytarget"
local c_TARGET_NAME_LENGTH 		= 24

local bRvRFlagged				= false
local bDispelFlagged			= false

local DEFAULT_COLOR				= {255,255,255}

function PureTargetUnitFrame:Create( windowName, unitType )
	local baseUnitType = unitType:match("([a-z]+)pure")
	
	local unitFrame = self:CreateFromTemplate( windowName )
	
	if( unitFrame == nil ) then return nil end
	
	unitFrame.m_WindowId		= windowName
	unitFrame.m_EffectWindowId 	= windowName .. "Effects"
	unitFrame.m_UnitType		= baseUnitType
	unitFrame.m_IsFriendly		= baseUnitType == c_FRIENDLY_TARGET
	
	unitFrame.hitpointsDx		= 0
	unitFrame.hitpointsDy		= 0
	unitFrame.actionpointsDx	= 0
	unitFrame.actionpointsDy	= 0
	unitFrame.sigilDisplayInfo	= nil
	return unitFrame
end

function PureTargetUnitFrame:LoadUnitFrame()
	self:InitializeFrameElements()
	self:InitializeEffectTracker()
end

function PureTargetUnitFrame:UpdateLayout()
	self:InitializeFrameElements()
end

function PureTargetUnitFrame:InitializeFrameElements()
	local windowId = self:GetName()
	local hitColor
	local actionColor
	local dispelColor
	local dispelAlpha
	local windowAlpha
	local handleInput
	
	if( self.m_IsFriendly ) then
		hitColor 		= Pure.Get( "friendly-hitpoints-status-color" )
		actionColor 	= Pure.Get( "friendly-actionpoints-status-color" )
		dispelColor 	= Pure.Get( "friendly-dispel-color" )
		dispelAlpha 	= Pure.Get( "friendly-dispel-alpha" )
		windowAlpha		= Pure.Get( "friendly-frame-alpha" )
		handleInput		= Pure.Get( "friendly-frame-handleinput" )
	else
		hitColor 		= Pure.Get( "hostile-hitpoints-status-color" )
		actionColor 	= Pure.Get( "hostile-actionpoints-status-color" )
		dispelColor 	= Pure.Get( "hostile-dispel-color" )
		dispelAlpha 	= Pure.Get( "hostile-dispel-alpha" )
		windowAlpha		= Pure.Get( "hostile-frame-alpha" )
		handleInput		= Pure.Get( "hostile-frame-handleinput" )
	end
	
	--
	-- We set both of these to 1.0, as it seems when changing the font alpha to something higher than
	-- the window alpha, it defaults to the window alpha.
	--
	WindowSetAlpha( windowId, 1.0 )
	WindowSetFontAlpha( windowId, 1.0 )
	WindowSetHandleInput( windowId, handleInput )
	
	-- Reprocess the windows anchors
	self:ForceProcessAnchors()
	
	-- Load our bar textures
	local hitpointsTexture, hitpointsSize = Pure.GetHitPointsTextureAndSize()
	local actionpointsTexture, actionpointsSize = Pure.GetActionPointsTextureAndSize()
	
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatus", unpack( hitpointsSize ) )
	DynamicImageSetTextureDimensions( windowId.."HitPointsStatusBackground", unpack( hitpointsSize ) )
	DynamicImageSetTextureDimensions( windowId.."ActionPointsStatusBackground", unpack( actionpointsSize ) )
	DynamicImageSetTexture( windowId.."HitPointsStatus", hitpointsTexture, 0, 0 )
	DynamicImageSetTexture( windowId.."HitPointsStatusBackground", hitpointsTexture, 0, 0 )
	DynamicImageSetTexture( windowId.."ActionPointsStatusBackground", actionpointsTexture, 0, 0 )
	
	WindowSetAlpha( windowId, windowAlpha )
	
	-- Update our status color
	WindowSetTintColor( windowId .. "HitPointsStatus", unpack( hitColor ) )
	WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( hitColor ) )
	WindowSetAlpha( windowId .. "HitPointsStatusBackground", .2 )
	
	-- We set the alpha to this to 0, as we still want to use it to anchor elements, but do not want to see it
	WindowSetTintColor( windowId .. "ActionPointsStatusBackground", unpack( actionColor ) )
	WindowSetAlpha( windowId .. "ActionPointsStatusBackground", .2 )

	-- Update our dispel color
	WindowSetTintColor( windowId .. "EffectsDispel", unpack( dispelColor ) )
	WindowSetAlpha( windowId .. "EffectsDispel", dispelAlpha )
	
	self.hitpointsDx, self.hitpointsDy = WindowGetDimensions( windowId .. "HitPointsStatusBackground" )
	self.actionpointsDx, self.actionpointsDy = WindowGetDimensions( windowId .. "ActionPointsStatusBackground" )
	
	WindowSetShowing( self:GetName() .. "SelectedTarget", false )
	
	self:UpdateRvRFlag( false )
	self:UpdateEffectsDispel( false )
end

function PureTargetUnitFrame:InitializeEffectTracker()
	-- If we already have a buff tracker, destroy it
	self:ShutdownEffectTracker()
	
	local bShow	= false
	
	if( self.m_IsFriendly and Pure.Get( "friendly-effects-show" ) ) then bShow = true end
	if( not self.m_IsFriendly and Pure.Get( "hostile-effects-show" ) ) then bShow = true end

	if( bShow ) then
		local location, initialAnchor, showLabels, totalCols, totalRows, rowOffset, colOffset, hideColors, buffTargetType
		local dx, dy, scale, selfCastOnly, effectsAlpha, effectsFontAlpha, effectsMBorder, handleInput
		
		if( self.m_IsFriendly ) then
			buffTargetType		= GameData.BuffTargetType.TARGET_FRIENDLY
			location 			= Pure.Get( "friendly-effects-anchor" )
			showLabels 			= Pure.Get( "friendly-effects-showlabels" )
			totalCols		 	= Pure.Get( "friendly-effects-cols" )
			totalRows			= Pure.Get( "friendly-effects-rows" )
			rowOffset			= Pure.Get( "friendly-effects-row-offset" )
			colOffset			= Pure.Get( "friendly-effects-col-offset" )
			dx					= Pure.Get( "friendly-effects-dx" )
			dy					= Pure.Get( "friendly-effects-dy" )
			selfCastOnly		= Pure.Get( "friendly-effects-selfcastonly" )
			effectsAlpha		= Pure.Get( "friendly-effects-alpha" )
			effectsFontAlpha	= Pure.Get( "friendly-effects-font-alpha" )
			effectsMBorder		= Pure.Get( "friendly-effects-mythicborder" )
			handleInput			= Pure.Get( "friendly-frame-handleinput" )
		else
			buffTargetType		= GameData.BuffTargetType.TARGET_HOSTILE
			location 			= Pure.Get( "hostile-effects-anchor" )
			showLabels 			= Pure.Get( "hostile-effects-showlabels" )
			totalCols		 	= Pure.Get( "hostile-effects-cols" )
			totalRows			= Pure.Get( "hostile-effects-rows" )
			rowOffset			= Pure.Get( "hostile-effects-row-offset" )
			colOffset			= Pure.Get( "hostile-effects-col-offset" )
			dx					= Pure.Get( "hostile-effects-dx" )
			dy					= Pure.Get( "hostile-effects-dy" )
			selfCastOnly		= Pure.Get( "hostile-effects-selfcastonly" )
			effectsAlpha		= Pure.Get( "hostile-effects-alpha" )
			effectsFontAlpha	= Pure.Get( "hostile-effects-font-alpha" )
			effectsMBorder		= Pure.Get( "hostile-effects-mythicborder" )
			handleInput			= Pure.Get( "hostile-frame-handleinput" )
		end
		
		initialAnchor		= Pure.GetEffectWindowAnchor( self.m_WindowId, location )
		
		self.m_effectTracker = PureEffectTracker:Create( self.m_EffectWindowId, "Root", buffTargetType, 
			PureEffectTracker.trackerType.ALL, totalRows, totalCols, initialAnchor, rowOffset, colOffset, location )
		self.m_effectTracker:Initialize( dx, dy, effectsAlpha, effectsFontAlpha, 10, effectsAlpha / 2, selfCastOnly, showLabels, true, effectsMBorder, handleInput )
	end
end

function PureTargetUnitFrame:UnloadUnitFrame()
	self:ShutdownEffectTracker()
end

function PureTargetUnitFrame:ShutdownEffectTracker()
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:Destroy()
		self.m_effectTracker = nil 
	end
end

function PureTargetUnitFrame:Update( timeElapsed )
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:Update( timeElapsed )
	end
end

function PureTargetUnitFrame:UpdateEffects( changedEffects, isFullList )
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:UpdateEffects( changedEffects, isFullList )
	end
end

function PureTargetUnitFrame:ClearAllEffects()
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:ClearEffects()
	end
end

function PureTargetUnitFrame:RefreshEffects()
	if( self.m_effectTracker ~= nil ) then
		self.m_effectTracker:RefreshEffects()
	end
end

function PureTargetUnitFrame:UpdateUnit()
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
	
	-- Update the units sigil information
	self:UpdateSigil()
end

function PureTargetUnitFrame:UpdateUnitName( name, careerLine )
	local windowId = self:GetName()
	local shortName = name:match( L"([^\^]+).*" )
	local color = DEFAULT_COLOR
	if( shortName:len() > c_TARGET_NAME_LENGTH ) then
		shortName = wstring.sub( shortName, 1, c_TARGET_NAME_LENGTH ) .. L"..."
    end
    
	LabelSetText( windowId .. "Name", shortName )
	
	if( ( self.m_IsFriendly and Pure.Get( "friendly-arch-color" ) ) or ( not self.m_IsFriendly and Pure.Get( "hostile-arch-color" ) ) ) then
		color = Pure.GetCareerLineColor( careerLine )
	end
	LabelSetTextColor( windowId .. "Name", unpack( color ) )
	
	if( ( self.m_IsFriendly and Pure.Get( "friendly-arch-color-hitpoints" ) ) or ( not self.m_IsFriendly and Pure.Get( "hostile-arch-color-hitpoints" ) ) ) then
		color = Pure.GetCareerLineColor( careerLine )
		WindowSetTintColor( windowId .. "HitPointsStatus", unpack( color ) )
		WindowSetTintColor( windowId .. "HitPointsStatusBackground", unpack( color ) )
	end
end

function PureTargetUnitFrame:UpdateRvRFlag( flagged )
	local windowId = self:GetName()
	
	local color = DEFAULT_COLOR
	if( flagged ) then
		if( self.m_IsFriendly ) then
			color = Pure.Get( "friendly-rvr-flag-color" )
		else
			color = Pure.Get( "hostile-rvr-flag-color" )
		end
	end
	bRvRFlagged = flagged
	LabelSetTextColor( windowId .. "HitPoints", unpack( color ) )
end

function PureTargetUnitFrame:UpdateHitPoints()
	local windowId = self:GetName()
	local hits = TargetInfo:UnitHealth( self.m_UnitType )
	WindowSetDimensions( windowId .. "HitPointsStatus", min( self.hitpointsDx, self.hitpointsDx * ( hits / 100 ) ), self.hitpointsDy )
	LabelSetText( windowId .. "HitPoints", wstring.format( L"%d%%", hits ) )
end

function PureTargetUnitFrame:UpdateLevel( level, conColor, unitTier )
	local windowId = self:GetName()
	
	local levelText = L""..level
    for i=1,unitTier do
        levelText = levelText..L"+"
    end
    
    LabelSetText( windowId .. "Rank", levelText )
    LabelSetTextColor( windowId.."Rank", conColor.r, conColor.g, conColor.b )
end

function PureTargetUnitFrame:UpdateSigil()
	self:SetSigil( TargetInfo:UnitSigilEntryId( self.m_UnitType ) )
end

function PureTargetUnitFrame:SetSigil( sigilId )
	--
    -- Keep a similar display type as the default UI
    --
    if( sigilId ~= 0 ) then
       	self.sigilDisplayInfo =  TomeGetSigilDisplayInfo( sigilId )
       
       	if( self.sigilDisplayInfo ~= nil ) then
	    	local buttonName = self:GetName().."Sigil"
	    	local normalSlice = self.sigilDisplayInfo.sliceName
	    	local rolloverSlice = self.sigilDisplayInfo.sliceName.."-rollover"
	
	    	ButtonSetTextureSlice( buttonName, Button.ButtonState.NORMAL, "EA_HUD_01", normalSlice )
	    	ButtonSetTextureSlice( buttonName, Button.ButtonState.HIGHLIGHTED, "EA_HUD_01", rolloverSlice)
	    	ButtonSetTextureSlice( buttonName, Button.ButtonState.PRESSED, "EA_HUD_01", normalSlice )
	    	ButtonSetTextureSlice( buttonName, Button.ButtonState.PRESSED_HIGHLIGHTED, "EA_HUD_01", rolloverSlice )
	    end
    else
    	self.sigilDisplayInfo = nil
    end
    
    if( self.m_IsFriendly ) then
    	bShow = false
    else
    	bShow = Pure.Get( "hostile-sigil-show" )
    end
    
    WindowSetShowing( self:GetName().."Sigil", sigilId ~= 0 and self.sigilDisplayInfo ~= nil and bShow )
end

function PureTargetUnitFrame:UpdateCareer( careerName )
	local windowId = self:GetName()
	local career = L""
	
	if( self.m_IsFriendly and Pure.Get( "friendly-classname-show" ) ) then
		career = careerName
	elseif( not self.m_IsFriendly and Pure.Get( "hostile-classname-show" ) ) then
		career = careerName
	end
	
	LabelSetText( windowId .. "Career", career )
end

function PureTargetUnitFrame:UpdateEffectsDispel( dispel )
	WindowSetShowing( self:GetName() .. "EffectsDispel", dispel )
end

function PureTargetUnitFrame.OnRButtonUp( flags, x, y )	
	local unitFrame = FrameManager:GetActiveWindow()
    if( unitFrame ~= nil ) then
    	PureTarget.OnRButtonUp( flags, x, y, unitFrame.m_UnitType )
    end
end

function PureTargetUnitFrame.OnLButtonUp( flags, x, y )
	local unitFrame = FrameManager:GetActiveWindow()
    if( unitFrame ~= nil ) then
    	PureTarget.OnLButtonUp( flags, x, y, unitFrame.m_UnitType )
    end
end

function PureTargetUnitFrame.OnLButtonUp_Sigil( flags, x, y )
	local unitFrame = FrameManager:GetActiveWindow()
	
	-- See if the windows parent is a unit frame
	if( unitFrame == nil ) then
		unitFrame = FrameManager:Get( WindowGetParent( SystemData.MouseOverWindow.name ) )	
	end
	
    if( unitFrame ~= nil ) then
    	PureTarget.OnLButtonUp_Sigil( flags, x, y, unitFrame.sigilDisplayInfo )
    end
end

function PureTargetUnitFrame.OnMouseOver_Sigil( flags, x, y )
	local unitFrame = FrameManager:GetActiveWindow()
	
	-- See if the windows parent is a unit frame
	if( unitFrame == nil ) then
		unitFrame = FrameManager:Get( WindowGetParent( SystemData.MouseOverWindow.name ) )	
	end
	
	if( unitFrame ~= nil ) then
    	PureTarget.OnMouseOver_Sigil( flags, x, y, unitFrame.sigilDisplayInfo )
    end
end

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

PureEffect = Frame:Subclass( "PureEffectIcon" )

local g_CurrentMouseOverEffect    = nil

local towstring					= towstring
local WindowSetDimensions 		= WindowSetDimensions
local WindowSetAlpha 			= WindowSetAlpha
local WindowSetFontAlpha		= WindowSetFontAlpha
local WindowStartAlphaAnimation	= WindowStartAlphaAnimation
local WindowStopAlphaAnimation	= WindowStopAlphaAnimation

local BORDER     	    = 0
local ICON          	= 1
local SPINNER			= 2
local TIMER				= 3

local stackOverride = {
	[8237] = true,				-- Supplication - receives a lot of bizarre stack information
}

function PureEffect:Create( windowName, parentWindow, effectTargetType )
	local frame = self:CreateFromTemplate( windowName, parentWindow )
    if( frame ~= nil ) then
    	local baseName = windowName
    	
    	frame.m_Windows					= 
		{
			[BORDER]				= DynamicImage:CreateFrameForExistingWindow( baseName  .. "Border" ),
			[ICON]					= DynamicImage:CreateFrameForExistingWindow( baseName  .. "Icon" ),
			[SPINNER]				= Frame:CreateFrameForExistingWindow( baseName .. "Spinner" ),
			[TIMER]    				= Label:CreateFrameForExistingWindow( baseName .. "SpinnerTimer" ),
		}
		
		frame.m_Windows[SPINNER]:SetTint( { 0, 0, 0, .5 } )
		frame.m_Windows[SPINNER]:SetAlpha( .5 )
    
    	frame.m_effectTargetType			= effectTargetType
        
        -- Initialization members
		frame.m_windowDx					= 32
    	frame.m_windowDy					= 32
	    frame.m_frameAlpha					= 1.0
		frame.m_fontAlpha					= 1.0 						
		frame.m_fadeStartTime				= 10
		frame.m_fadeMinAlpha				= .5
		frame.m_bShowEffectDurations		= true
		frame.m_bShowCooldownSpinner		= false
		frame.m_bShowEffectMythicBorder		= false
		frame.m_bHandleInput				= true
		
        -- Internal maintenance members
		frame.m_effectFlooredDuration		= 0
		frame.m_isFadingPulsing				= false
		
		-- These maintain what display state the current effect has
		frame.m_hasDurationDisplay			= false
		frame.m_hasStackDisplay				= false
		
		WindowSetAlpha( frame:GetName(), 1.0 )
    	WindowSetFontAlpha( frame:GetName(), 1.0 )
    end
    return frame
end

function PureEffect:Destroy()
	for slot, frame in pairs( self.m_Windows )
	do
		frame:Destroy()
	end
	
	self:ParentDestroy()
end

function PureEffect:Initialize( windowDx, windowDy, frameAlpha, fontAlpha, fadeStartTime, fadeMinAlpha, showEffectDurations, showCooldownSpinner, showEffectMBorder, handleInput )
	local windowId = self:GetName()
	
	self.m_windowDx						= windowDx
    self.m_windowDy						= windowDy
    self.m_frameAlpha					= frameAlpha
	self.m_fontAlpha					= fontAlpha				
	self.m_fadeStartTime				= fadeStartTime
	self.m_fadeMinAlpha					= fadeMinAlpha	
	self.m_bShowEffectDurations			= showEffectDurations
	self.m_bShowCooldownSpinner			= showCooldownSpinner
	self.m_bShowEffectMythicBorder		= showEffectMBorder
	self.m_bHandleInput					= handleInput
	
	self.m_Windows[BORDER]:Show( showEffectMBorder )
	
	--WindowSetDimensions( windowId, self.m_windowDx / InterfaceCore.GetScale(), self.m_windowDy / InterfaceCore.GetScale() )
	WindowSetDimensions( windowId, self.m_windowDx, self.m_windowDy )
    WindowSetAlpha( windowId, self.m_frameAlpha )
    WindowSetFontAlpha( windowId, self.m_fontAlpha )
    WindowSetHandleInput( windowId, handleInput )
end

function PureEffect:SetEffect( effect )
	self.m_effectData = effect
	
	if( self.m_effectData ~= nil ) then
		local texture, x, y = GetIconData( effect.iconNum )
        
        self.m_Windows[ICON]:SetTexture( texture, x, y )
        self.m_Windows[ICON]:SetDimensions( self.m_windowDx, self.m_windowDy )
        
        if( self.m_bShowEffectMythicBorder ) then
        	local _, _, _, red, green, blue = DataUtils.GetAbilityTypeTextureAndColor( effect )
        	
        	if( red and green and blue ) then
        		self.m_Windows[BORDER]:SetTintColor( red, green, blue )
        	else
        		self.m_Windows[BORDER]:SetTintColor( 255, 255, 255 )
        	end
        end
        
        if( self.m_bShowEffectDurations ) then

        	self.m_hasStackDisplay 		= effect.stackCount > 1 and stackOverride[self.m_effectData.abilityId] == nil
        	self.m_hasDurationDisplay 	= ( self.m_effectData.stackCount <= 1 and not self.m_effectData.permanentUntilDispelled  )
        	
	        if( self.m_hasStackDisplay ) then
	        	self.m_Windows[TIMER]:SetText( L"x" .. towstring( effect.stackCount ) )
	        end
		    
		    if( not self.m_hasStackDisplay and not self.m_hasDurationDisplay ) then 
				self.m_Windows[TIMER]:SetText( L"" )
				self:StopFadePulse( true ) 
			else
				self:UpdateDuration()
			end
		else
			self.m_Windows[TIMER]:SetText( L"" )
			self:StopFadePulse( true )
		end
	end
end

function PureEffect:StartFadePulse()
    if( not self.m_isFadingPulsing ) then
        WindowStartAlphaAnimation( self.m_Windows[ICON]:GetName(), Window.AnimationType.LOOP, self.m_frameAlpha, self.m_fadeMinAlpha, 1, true, 0, 0 )
        self.m_isFadingPulsing = true
    end
end

function PureEffect:StopFadePulse( override )
    if( self.m_isFadingPulsing or override == true ) then
        WindowStopAlphaAnimation( self.m_Windows[ICON]:GetName() )
        WindowSetAlpha( self.m_Windows[ICON]:GetName(), self.m_frameAlpha )
        self.m_isFadingPulsing = false
    end
end

function PureEffect:UpdateDuration()
	if( self.m_effectData ~= nil ) then
		if( self.m_hasDurationDisplay or self.m_hasStackDisplay ) then
			local flooredDuration = math.floor( self.m_effectData.duration )
		
			-- Only update our display when the floored durations change
			if( self.m_effectFlooredDuration ~= flooredDuration ) then

				if( self.m_hasDurationDisplay ) then 
					self.m_Windows[TIMER]:SetText( TimeUtils.FormatTimeCondensed( self.m_effectData.duration ) ) 
				end
				
				--
				-- Removed the cooldown display code for now, until there are more options on its display
				-- as it currently inverse of what I would like to see displayed.
				--
				--if( self.m_bShowCooldownSpinner and not self.m_effectData.permanentUntilDispelled ) then
					--CooldownDisplaySetCooldown( self.m_Windows[SPINNER]:GetName(), flooredDuration, self.m_effectData.m_maxDuration )
				--end
				
				if( self.m_fadeStartTime > 0 and not self.m_effectData.permanentUntilDispelled and self.m_effectData.duration <= self.m_fadeStartTime ) then
			        self:StartFadePulse()
			    else
			    	self:StopFadePulse()
		        end
				
				self.m_effectFlooredDuration = flooredDuration
			end
		end
	end
end

function PureEffect.OnMouseOver()
    local frame = FrameManager:GetMouseOverWindow()
    if( frame == nil or frame.effectData ~= nil ) then return end
    
    g_CurrentMouseOverEffect = frame

    Tooltips.CreateTextOnlyTooltip( SystemData.ActiveWindow.name, nil )
    Tooltips.SetTooltipColorDef( 1, 1, Tooltips.COLOR_HEADING )
    Tooltips.SetTooltipColorDef( 1, 2, Tooltips.COLOR_HEADING )
    Tooltips.SetTooltipActionText( GetString( StringTables.Default.TEXT_R_CLICK_TO_REMOVE_EFFECT ) )

    PureEffect.PopulateTooltipFields( frame.m_effectData, true )

    local tooltipAnchor = { Point = "bottom",  RelativeTo = SystemData.ActiveWindow.name, RelativePoint = "top",   XOffset = 0, YOffset = 20 }

    Tooltips.AnchorTooltip( tooltipAnchor )
    Tooltips.SetUpdateCallback( PureEffect.OnMouseOverUpdate )
end

function PureEffect.OnMouseOverEnd()
    g_CurrentMouseOverEffect = nil
end

function PureEffect.OnMouseOverUpdate()
    if( g_CurrentMouseOverEffect == nil ) then return end
	PureEffect.PopulateTooltipFields( g_CurrentMouseOverEffect.m_effectData, false )
end

function PureEffect.OnRButtonUp()
	if( g_CurrentMouseOverEffect == nil or g_CurrentMouseOverEffect.m_effectData == nil or
		g_CurrentMouseOverEffect.m_effectTargetType ~= GameData.BuffTargetType.SELF ) then return end
	RemoveEffect( g_CurrentMouseOverEffect.m_effectData.effectIndex )
end

function PureEffect.PopulateTooltipFields( effect, fullUpdate )
    if( fullUpdate ) then
        Tooltips.SetTooltipText( 1, 1, effect.name )
        Tooltips.SetTooltipText( 3, 1, effect.effectText )
		Tooltips.SetTooltipText( 1, 2, DataUtils.GetAbilityTypeText( effect ) )
    end

    if( not effect.permanentUntilDispelled ) then
        Tooltips.SetTooltipText( 2, 1, TimeUtils.FormatTimeCondensed( effect.duration ) )
    else
        Tooltips.SetTooltipText( 2, 1, L"" )
    end

    Tooltips.Finalize()
end
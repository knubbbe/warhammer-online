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

if not PureConfig then return end

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )
local LibGUI 	= LibStub( "LibGUI" )

local initialized		= false

local InitializeWindow, ApplyConfigSettings, RevertConfigSettings

local anchors		= PureConstants.Anchors
local anchorsLookup	= PureConstants.AnchorsLookup

local frameAlpha, fontAlpha
local dispelRed, dispelGreen, dispelBlue, dispelAlpha
local targetRed, targetGreen, targetBlue, targetAlpha
local hitRed, hitGreen, hitBlue
local actionRed, actionGreen, actionBlue
local moraleRed, moraleGreen, moraleBlue
local rvrRed, rvrGreen, rvrBlue

local window	= {
	Name		= T["Group Pet"],
	display		= {},
	W			= {},
}

local growthDirections				= PureConstants.GrowthDirections
local growthDirectionLookup			= PureConstants.GrowthDirectionsLookup

function InitializeWindow()
	-- If our window already exists, we are all set
	if initialized then return W end
	
	local w
	local e	
			
	-- General Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
	w:Resize( 400, 455 )
	w:Show( true )
	window.W.General = w
	
	-- Colors Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
    w:Resize( 400, 185 )
	w:Show( true )
	window.W.Colors = w
	
	-- This is the order the windows are displayed to the user
	table.insert( window.display, window.W.General )
	table.insert( window.display, window.W.Colors )
	
	--
	-- GENERAL WINDOW ELEMENTS
	--
	-- General - Subsection Title
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General, "topleft", "topleft", 15, 10 )
    e:Font( "font_clear_medium_bold" )
    e:SetText( T["General"] )
    window.W.General.Title_Label = e
    
	-- General - Enable Unit Frame Checkbox
	e = window.W.General( "Checkbox" )
	e:AnchorTo( window.W.General.Title_Label, "bottomleft", "topleft", 10, 5 )
	window.W.General.EnableUnitFrame_Checkbox = e
    
    -- General - Enable Unit Frame Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.EnableUnitFrame_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Enable Group Pet Unit Frame"] )
    window.W.General.EnableUnitFrame_Label = e
    
    -- General - Show In Scenarios Checkbox
	e = window.W.General( "Checkbox" )
	e:AnchorTo( window.W.General.EnableUnitFrame_Label, "bottomleft", "topleft", 0, 5 )
	window.W.General.ShowInScenario_Checkbox = e
    
    -- General - Show In Scenarios Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.ShowInScenario_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Show In Scenarios"] )
    window.W.General.ShowInScenario_Label = e
    
    -- General - Show In Siege Weapon Checkbox
	e = window.W.General( "Checkbox" )
	e:AnchorTo( window.W.General.ShowInScenario_Checkbox, "bottomleft", "topleft", 0, 5 )
	window.W.General.ShowInSiegeWeapon_Checkbox = e
    
    -- General - Show In Siege Weapon Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.ShowInSiegeWeapon_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Show When In Siege Engine"] )
    window.W.General.ShowInSiegeWeapon_Label = e
    
    -- General - Growth Direction Label
    e = window.W.General( "Label" )
    e:Resize( 300 )
    e:AnchorTo( window.W.General.ShowInSiegeWeapon_Checkbox, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:Align( "leftcenter" )
    e:SetText( T["Growth Direction:"] )
    window.W.General.GrowthDirection_Label = e
    
    -- General - Growth Direction Combo
    e = window.W.General( "Combobox" )
    e:AnchorTo( window.W.General.GrowthDirection_Label, "bottomleft", "topleft", 0, 0 )
    for _, direction in ipairs( growthDirections ) 
	do 
		e:Add( direction.locale )
	end
    window.W.General.GrowthDirection_Combo = e
    
    -- General - Vertical Growth Offset Label
    e = window.W.General( "Label" )
    e:Resize( 300 )
    e:AnchorTo( window.W.General.GrowthDirection_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:Align( "leftcenter" )
    e:SetText( T["Vertical Growth Offset:"] )
    window.W.General.VerticalGrowthOffset_Label = e
    
    -- General - Vertical Growth Offset Textbox
    e = window.W.General( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.General.VerticalGrowthOffset_Label, "right", "left", 10, 0 )
    window.W.General.VerticalGrowthOffset_Textbox = e
    
    -- General - Horizontal Growth Offset Label
    e = window.W.General( "Label" )
    e:Resize( 300 )
    e:AnchorTo( window.W.General.VerticalGrowthOffset_Label, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:Align( "leftcenter" )
    e:SetText( T["Horizontal Growth Offset:"] )
    window.W.General.HorizontalGrowthOffset_Label = e
    
    -- General - Horizontal Growth Offset Textbox
    e = window.W.General( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.General.HorizontalGrowthOffset_Label, "right", "left", 10, 0 )
    window.W.General.HorizontalGrowthOffset_Textbox = e
    
    -- General - Unit Frame Alpha Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "center" )
    e:AnchorTo( window.W.General, "top", "top", 0, 265 )
    e:Font( "font_chat_text" )
    e:SetText( T["Unit Frame Alpha"] )
    window.W.General.UnitFrameAlpha_Label = e
    
    -- General - Unit Frame Alpha Image
    e = window.W.General( "Image" )
    e:Resize( 100, 25 )
    e:AnchorTo( window.W.General.UnitFrameAlpha_Label, "bottom", "top", 0, 5 )
    e:Tint( 255, 255, 255 )
    e:UnregisterDefaultEvents()
    window.W.General.UnitFrameAlpha_Image = e
    
    -- General - Unit Frame Alpha Slider
    e = window.W.General( "Slider" )
    e:AnchorTo( window.W.General.UnitFrameAlpha_Image, "bottom", "top", 0, 5 )
    e:SetRange( 0, 1 )
    window.W.General.UnitFrameAlpha_Slider = e
    
    -- General - Unit Frame Alpha Label
    e = window.W.General( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.General.UnitFrameAlpha_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Alpha"] )
    window.W.General.UnitFrameAlpha_Label = e
    
    -- General - Unit Frame Alpha Textbox
    e = window.W.General( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.General.UnitFrameAlpha_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.General.UnitFrameAlpha_Textbox = e
    
    -- General - Unit Frame Font Alpha Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "center" )
    e:AnchorTo( window.W.General.UnitFrameAlpha_Slider, "bottom", "top", 0, 10 )
    e:Font( "font_chat_text" )
    e:SetText( T["Unit Frame Font Alpha"] )
    window.W.General.UnitFrameFontAlpha_Label = e
    
    -- General - Unit Frame Font Alpha Image
    e = window.W.General( "Image" )
    e:Resize( 100, 25 )
    e:AnchorTo( window.W.General.UnitFrameFontAlpha_Label, "bottom", "top", 0, 5 )
    e:Tint( 255, 255, 255 )
    e:UnregisterDefaultEvents()
    window.W.General.UnitFrameFontAlpha_Image = e
    
    -- General - Unit Frame Font Alpha Slider
    e = window.W.General( "Slider" )
    e:AnchorTo( window.W.General.UnitFrameFontAlpha_Image, "bottom", "top", 0, 5 )
    e:SetRange( 0, 1 )
    window.W.General.UnitFrameFontAlpha_Slider = e
    
    -- General - Unit Frame Font Alpha Label
    e = window.W.General( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.General.UnitFrameFontAlpha_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Alpha"] )
    window.W.General.UnitFrameFontAlpha_Label = e
    
    -- General - Unit Frame Font Alpha Textbox
    e = window.W.General( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.General.UnitFrameFontAlpha_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.General.UnitFrameFontAlpha_Textbox = e
    
    --
	-- COLORS WINDOW ELEMENTS
	--
	-- Colors - Subsection Title
    e = window.W.Colors( "Label" )
    e:Resize( 550 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Colors, "topleft", "topleft", 15, 10 )
    e:Font( "font_clear_medium_bold" )
    e:SetText( T["Colors"] )
    window.W.Colors.Title_Label = e

    -- Colors - Hit Points Texture Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 450 )
    e:Align( "center" )
    e:AnchorTo( window.W.Colors, "top", "top", 0, 30 )
    e:Font( "font_chat_text" )
    e:SetText( T["Hit Points Texture Color"] )
    window.W.Colors.HitPointsTextureColor_Label = e
        
    -- Colors - Hit Points Red Color Slider
    e = window.W.Colors( "Slider" )
    e:AnchorTo( window.W.Colors.HitPointsTextureColor_Label, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Colors.HitPointsRed_Slider = e
    
    -- Colors - Hit Points Red Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Colors.HitPointsRed_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Red"] )
    window.W.Colors.HitPointsRed_Label = e
    
    -- Colors - Hit Points Red Color Textbox
    e = window.W.Colors( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Colors.HitPointsRed_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Colors.HitPointsRed_Textbox = e
    
    -- Colors - Hit Points Green Color Slider
    e = window.W.Colors( "Slider" )
    e:AnchorTo( window.W.Colors.HitPointsRed_Slider, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Colors.HitPointsGreen_Slider = e
    
    -- Colors - Hit Points Green Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Colors.HitPointsGreen_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Green"] )
    window.W.Colors.HitPointsGreen_Label = e
    
    -- Colors - Hit Points Green Color Textbox
    e = window.W.Colors( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Colors.HitPointsGreen_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Colors.HitPointsGreen_Textbox = e
    
    -- Colors - Hit Points Blue Color Slider
    e = window.W.Colors( "Slider" )
    e:AnchorTo( window.W.Colors.HitPointsGreen_Slider, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Colors.HitPointsBlue_Slider = e
	
	-- Colors - Hit Points Blue Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Colors.HitPointsBlue_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Blue"] )
    window.W.Colors.HitPointsBlue_Label = e
    
    -- Colors - Hit Points Blue Color Textbox
    e = window.W.Colors( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Colors.HitPointsBlue_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Colors.HitPointsBlue_Textbox = e
	
	initialized = true
end

function ApplyConfigSettings()
	--
	-- General Settings
	--
	Pure.Set( "grouppet-frame-show", window.W.General.EnableUnitFrame_Checkbox:GetValue() )
	Pure.Set( "grouppet-frame-showinscenario", window.W.General.ShowInScenario_Checkbox:GetValue() )
	Pure.Set( "grouppet-frame-showinsiege", window.W.General.ShowInSiegeWeapon_Checkbox:GetValue() )
	Pure.Set( "grouppet-fill-direction", growthDirections[window.W.General.GrowthDirection_Combo:SelectedIndex()].config )
	Pure.Set( "grouppet-frame-vertical-offset", tonumber( window.W.General.VerticalGrowthOffset_Textbox:GetText() ) or Pure.GetDefault( "grouppet-frame-vertical-offset" ) )
	Pure.Set( "grouppet-frame-horizontal-offset", tonumber( window.W.General.HorizontalGrowthOffset_Textbox:GetText() ) or Pure.GetDefault( "grouppet-frame-horizontal-offset" ) )
	Pure.Set( "grouppet-frame-alpha", frameAlpha )
	Pure.Set( "grouppet-frame-font-alpha", fontAlpha )
	
	--
	-- Color Settings
	--
	Pure.Set( "grouppet-hitpoints-status-color", { hitRed, hitGreen, hitBlue } )
end

function RevertConfigSettings()
	--
	-- General Settings
	--
	window.W.General.EnableUnitFrame_Checkbox:SetValue( Pure.Get( "grouppet-frame-show" ) )
	window.W.General.ShowInScenario_Checkbox:SetValue( Pure.Get( "grouppet-frame-showinscenario" ) )
	window.W.General.ShowInSiegeWeapon_Checkbox:SetValue( Pure.Get( "grouppet-frame-showinsiege" ) )
	window.W.General.GrowthDirection_Combo:SelectIndex( growthDirectionLookup[Pure.Get( "grouppet-fill-direction" )] )
	window.W.General.VerticalGrowthOffset_Textbox:SetText( towstring( Pure.Get( "grouppet-frame-vertical-offset" ) ) )
	window.W.General.HorizontalGrowthOffset_Textbox:SetText( towstring( Pure.Get( "grouppet-frame-horizontal-offset" ) ) )
	frameAlpha							= Pure.Get( "grouppet-frame-alpha" )
	window.W.General.UnitFrameAlpha_Slider:SetValue( frameAlpha )
	window.W.General.UnitFrameAlpha_Textbox:SetText( wstring.format( L"%.2f", towstring( frameAlpha ) ) )
	window.W.General.UnitFrameAlpha_Image:Alpha( frameAlpha )
	fontAlpha							= Pure.Get( "grouppet-frame-font-alpha" )
	window.W.General.UnitFrameFontAlpha_Slider:SetValue( fontAlpha )
	window.W.General.UnitFrameFontAlpha_Textbox:SetText( wstring.format( L"%.2f", towstring( fontAlpha ) ) )
	window.W.General.UnitFrameFontAlpha_Image:Alpha( fontAlpha )
	
		--	
	-- Color Settings
	--
	hitRed, hitGreen, hitBlue = unpack( Pure.Get( "grouppet-hitpoints-status-color" ) )
	window.W.Colors.HitPointsTextureColor_Label:Color( hitRed, hitGreen, hitBlue )
	window.W.Colors.HitPointsRed_Slider:SetValue( hitRed )
	window.W.Colors.HitPointsRed_Textbox:SetText( towstring( hitRed ) )
	window.W.Colors.HitPointsGreen_Slider:SetValue( hitGreen )
    window.W.Colors.HitPointsGreen_Textbox:SetText( towstring( hitGreen ) )
    window.W.Colors.HitPointsBlue_Slider:SetValue( hitBlue )
    window.W.Colors.HitPointsBlue_Textbox:SetText( towstring( hitBlue ) )
end

function PureConfig_GroupPet_OnUpdate()
	-- Only update if pure config is showing and we are the active panel
	if( PureConfig.IsShowing() and ( PureConfig.GetActiveConfigWindowIndex() ==  window.Index ) and initialized ) then
		local updated = false
		local ret = false
		
		--
		-- General
		--
		ret, frameAlpha = PureConfig.UpdateAlphaSelection( frameAlpha, window.W.General.UnitFrameAlpha_Slider, window.W.General.UnitFrameAlpha_Textbox )
		updated = updated or ret
		
		if( updated ) then
			window.W.General.UnitFrameAlpha_Image:Alpha( frameAlpha )
			updated = false
		end
		
		ret, fontAlpha = PureConfig.UpdateAlphaSelection( fontAlpha, window.W.General.UnitFrameFontAlpha_Slider, window.W.General.UnitFrameFontAlpha_Textbox )
		updated = updated or ret
		
        if( updated ) then
			window.W.General.UnitFrameFontAlpha_Image:Alpha( fontAlpha )
			updated = false
		end
		
		--
		-- Color Colors
		--
		-- 	Get the slider values
		ret, hitRed = PureConfig.UpdateColorSelection( hitRed, window.W.Colors.HitPointsRed_Slider, window.W.Colors.HitPointsRed_Textbox )
		updated = updated or ret
		
		ret, hitGreen = PureConfig.UpdateColorSelection( hitGreen, window.W.Colors.HitPointsGreen_Slider, window.W.Colors.HitPointsGreen_Textbox )
		updated = updated or ret
		
		ret, hitBlue = PureConfig.UpdateColorSelection( hitBlue, window.W.Colors.HitPointsBlue_Slider, window.W.Colors.HitPointsBlue_Textbox )
		updated = updated or ret
		
		-- Update our preview color
		if( updated ) then
			window.W.Colors.HitPointsTextureColor_Label:Color( hitRed, hitGreen, hitBlue )
			updated = false
		end
	end	
end


window.Initialize	= InitializeWindow
window.Apply		= ApplyConfigSettings
window.Revert		= RevertConfigSettings
window.Index		= PureConfig.RegisterWindow( window )
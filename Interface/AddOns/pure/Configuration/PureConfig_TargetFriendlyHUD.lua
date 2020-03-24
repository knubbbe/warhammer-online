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

local frameAlpha, fontAlpha, distanceFromTarget
local dispelRed, dispelGreen, dispelBlue, dispelAlpha
local hitRed, hitGreen, hitBlue
local rvrRed, rvrGreen, rvrBlue

local window	= {
	Name		= T["Friendly Target HUD"],
	display		= {},
	W			= {},
}

function InitializeWindow()
	-- If our window already exists, we are all set
	if initialized then return W end
	
	local w
	local e	
			
	-- General Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
	w:Resize( 400, 520 )
	w:Show( true )
	window.W.General = w
	
	-- Dispel Highlighting Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
    w:Resize( 400, 275 )
	w:Show( true )
	window.W.Dispel = w
	
	-- Colors Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
    w:Resize( 400, 350 )
	w:Show( true )
	window.W.Colors = w
	
	-- This is the order the windows are displayed to the user
	table.insert( window.display, window.W.General )
	table.insert( window.display, window.W.Dispel )
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
    e:SetText( T["Enable Friendly Target HUD"] )
    window.W.General.EnableUnitFrame_Label = e
    
    -- General - Enable Class Archtype Coloring - Name Checkbox
	e = window.W.General( "Checkbox" )
	e:AnchorTo( window.W.General.EnableUnitFrame_Label, "bottomleft", "topleft", 0, 5 )
	window.W.General.EnableClassArchtypeColoringName_Checkbox = e
    
    -- General - Enable Class Archtype Coloring - Name Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.EnableClassArchtypeColoringName_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Enable Class Archtype Coloring - Name"] )
    window.W.General.EnableClassArchtypeColoringName_Label = e
    
    -- General - Enable Class Archtype Coloring - Hitpoints Checkbox
	e = window.W.General( "Checkbox" )
	e:AnchorTo( window.W.General.EnableClassArchtypeColoringName_Checkbox, "bottomleft", "topleft", 0, 5 )
	window.W.General.EnableClassArchtypeColoringHitpoints_Checkbox = e
    
    -- General - Enable Class Archtype Coloring - Hitpoints Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.EnableClassArchtypeColoringHitpoints_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Enable Class Archtype Coloring - Hitpoints"] )
    window.W.General.EnableClassArchtypeColoringHitpoints_Label = e
    
    -- General - Show Class Name Checkbox
	e = window.W.General( "Checkbox" )
	e:AnchorTo( window.W.General.EnableClassArchtypeColoringHitpoints_Checkbox, "bottomleft", "topleft", 0, 5 )
	window.W.General.ShowClassName_Checkbox = e
    
    -- General - Show Class Name Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.ShowClassName_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Show Class Names"] )
    window.W.General.ShowClassName_Label = e
    
    -- General - Direction From Target Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.ShowClassName_Label, "bottomleft", "topleft", 0, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Direction From Target"] )
    window.W.General.DirectionFromTarget_Label = e
    
    -- General - Direction From Target Combo
    e = window.W.General( "Combobox" )
    e:AnchorTo( window.W.General.DirectionFromTarget_Label, "bottomleft", "topleft", 0, 0 )
    for _, anchor in ipairs( anchors ) 
	do 
		e:Add( anchor.locale )
	end
    window.W.General.DirectionFromTarget_Combo = e
    
    -- General - Distance From Target Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "center" )
    e:AnchorTo( window.W.General, "top", "top", 0, 220 )
    e:Font( "font_chat_text" )
    e:SetText( T["Distance From Target"] )
    window.W.General.DistanceFromTarget_Label = e
    
    -- General - Distance From Target Slider
    e = window.W.General( "Slider" )
    e:AnchorTo( window.W.General.DistanceFromTarget_Label, "bottom", "top", 0, 5 )
    e:SetRange( 0, 1000 )
    window.W.General.DistanceFromTarget_Slider = e
    
    -- General - Distance From Target Label
    e = window.W.General( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.General.DistanceFromTarget_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Distance"] )
    window.W.General.DistanceFromTarget_Label = e
    
    -- General - Distance From Target Textbox
    e = window.W.General( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.General.DistanceFromTarget_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.General.DistanceFromTarget_Textbox = e
    
    -- General - Unit Frame Alpha Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "center" )
    e:AnchorTo( window.W.General.DistanceFromTarget_Slider, "bottom", "top", 0, 0 )
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
    -- DISPEL WINDOW ELEMENTS
    --
	-- Dispel - Subsection Title
    e = window.W.Dispel( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Dispel, "topleft", "topleft", 15, 10 )
    e:Font( "font_clear_medium_bold" )
    e:SetText( T["Dispel Highlighting"] )
    window.W.Dispel.Title_Label = e
    
    -- Dispel - Enable Dispel Highlighting Checkbox
	e = window.W.Dispel( "Checkbox" )
	e:AnchorTo( window.W.Dispel.Title_Label, "bottomleft", "topleft", 10, 5 )
	window.W.Dispel.EnableDispelHighlighting_Checkbox = e
    
    -- Dispel - Enable Dispel Highlighting Label
    e = window.W.Dispel( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Dispel.EnableDispelHighlighting_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Enable Dispel Highlighting"] )
    window.W.Dispel.EnableDispelHighlighting_Label = e
    
    -- Dispel - Color Preview Image
    e = window.W.Dispel( "Image" )
    e:Resize( 100, 25 )
    e:AnchorTo( window.W.Dispel, "top", "top", 0, 75 )
    e:Tint( 255, 255, 255 )
    e:UnregisterDefaultEvents()
    window.W.Dispel.ColorPreview_Image = e
    
    -- Dispel - Red Color Slider
    e = window.W.Dispel( "Slider" )
    e:AnchorTo( window.W.Dispel.ColorPreview_Image, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Dispel.Red_Slider = e
    
    -- Dispel - Red Color Label
    e = window.W.Dispel( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Dispel.Red_Slider, "left", "right", -15, 0 )
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Red"] )
    window.W.Dispel.Red_Label = e
    
    -- Dispel - Red Color Textbox
    e = window.W.Dispel( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Dispel.Red_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Dispel.Red_Textbox = e
    
    -- Dispel - Green Color Slider
    e = window.W.Dispel( "Slider" )
    e:AnchorTo( window.W.Dispel.Red_Slider, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Dispel.Green_Slider = e
    
    -- Dispel - Green Color Label
    e = window.W.Dispel( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Dispel.Green_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Green"] )
    window.W.Dispel.Green_Label = e
    
    -- Dispel - Green Color Textbox
    e = window.W.Dispel( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Dispel.Green_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Dispel.Green_Textbox = e
    
    -- Dispel - Blue Color Slider
    e = window.W.Dispel( "Slider" )
    e:AnchorTo( window.W.Dispel.Green_Slider, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Dispel.Blue_Slider = e
	
	-- Dispel - Blue Color Label
    e = window.W.Dispel( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Dispel.Blue_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Blue"] )
    window.W.Dispel.Blue_Label = e
    
    -- Dispel - Blue Color Textbox
    e = window.W.Dispel( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Dispel.Blue_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Dispel.Blue_Textbox = e
    
    -- Dispel - Alpha Slider
    e = window.W.Dispel( "Slider" )
    e:AnchorTo( window.W.Dispel.Blue_Slider, "bottom", "top", 0, 5 )
    e:SetRange( 0,1 )
    window.W.Dispel.Alpha_Slider = e
	
	-- Dispel - Alpha Label
    e = window.W.Dispel( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Dispel.Alpha_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Alpha"] )
    window.W.Dispel.Alpha_Label = e
    
    -- Dispel - Alpha Textbox
    e = window.W.Dispel( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Dispel.Alpha_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Dispel.Alpha_Textbox = e
    
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
    
    -- Colors - RvR Flag Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 450 )
    e:Align( "center" )
    e:AnchorTo( window.W.Colors.HitPointsBlue_Slider, "bottom", "top", 0, 10 )
    e:Font( "font_chat_text" )
    e:SetText( T["RvR Flag Color"] )
    window.W.Colors.RvRFlagColor_Label = e
        
    -- Colors - RvR Flag Red Color Slider
    e = window.W.Colors( "Slider" )
    e:AnchorTo( window.W.Colors.RvRFlagColor_Label, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Colors.RvRFlagRed_Slider = e
    
    -- Colors - RvR Flag Red Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Colors.RvRFlagRed_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Red"] )
    window.W.Colors.RvRFlagRed_Label = e
    
    -- Colors - RvR Flag Red Color Textbox
    e = window.W.Colors( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Colors.RvRFlagRed_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Colors.RvRFlagRed_Textbox = e
    
    -- Colors - RvR Flag Green Color Slider
    e = window.W.Colors( "Slider" )
    e:AnchorTo( window.W.Colors.RvRFlagRed_Slider, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Colors.RvRFlagGreen_Slider = e
    
    -- Colors - RvR Flag Green Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Colors.RvRFlagGreen_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Green"] )
    window.W.Colors.RvRFlagGreen_Label = e
    
    -- Colors - RvR Flag Green Color Textbox
    e = window.W.Colors( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Colors.RvRFlagGreen_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Colors.RvRFlagGreen_Textbox = e
    
    -- Colors - RvR Flag Blue Color Slider
    e = window.W.Colors( "Slider" )
    e:AnchorTo( window.W.Colors.RvRFlagGreen_Slider, "bottom", "top", 0, 5 )
    e:SetRange( 0,255 )
    window.W.Colors.RvRFlagBlue_Slider = e
	
	-- Colors - RvR Flag Blue Color Label
    e = window.W.Colors( "Label" )
    e:Resize( 200 )
    e:AnchorTo( window.W.Colors.RvRFlagBlue_Slider, "left", "right", -15, 0)
    e:Font( "font_chat_text" )
    e:Align( "rightcenter" )
    e:SetText( T["Blue"] )
    window.W.Colors.RvRFlagBlue_Label = e
    
    -- Colors - RvR Flag Blue Color Textbox
    e = window.W.Colors( "Textbox" )
    e:Resize( 65 )
    e:AnchorTo( window.W.Colors.RvRFlagBlue_Slider, "right", "left", 10, 0 )
    e:SetText( 255 )
    window.W.Colors.RvRFlagBlue_Textbox = e
    
    initialized = true
end

function ApplyConfigSettings()
	--
	-- General Settings
	--
	Pure.Set( "friendlyhud-frame-show", window.W.General.EnableUnitFrame_Checkbox:GetValue() )
	Pure.Set( "friendlyhud-arch-color", window.W.General.EnableClassArchtypeColoringName_Checkbox:GetValue() )
	Pure.Set( "friendlyhud-arch-color-hitpoints", window.W.General.EnableClassArchtypeColoringHitpoints_Checkbox:GetValue() )
	Pure.Set( "friendlyhud-classname-show", window.W.General.ShowClassName_Checkbox:GetValue() )
	Pure.Set( "friendlyhud-window-anchor", anchors[window.W.General.DirectionFromTarget_Combo:SelectedIndex()].config )
	Pure.Set( "friendlyhud-window-dy", distanceFromTarget )
	Pure.Set( "friendlyhud-frame-alpha", frameAlpha )
	Pure.Set( "friendlyhud-frame-font-alpha", fontAlpha )
	
	--
	-- Dispel Settings
	--
	Pure.Set( "friendlyhud-dispel-show", window.W.Dispel.EnableDispelHighlighting_Checkbox:GetValue() )
	Pure.Set( "friendlyhud-dispel-color", { dispelRed, dispelGreen, dispelBlue } )
	Pure.Set( "friendlyhud-dispel-alpha", dispelAlpha )
	
	--
	-- Color Settings
	--
	Pure.Set( "friendlyhud-hitpoints-status-color", { hitRed, hitGreen, hitBlue } )
	Pure.Set( "friendlyhud-rvr-flag-color", { rvrRed, rvrGreen, rvrBlue } )
end

function RevertConfigSettings()
	--
	-- General Settings
	--
	window.W.General.EnableUnitFrame_Checkbox:SetValue( Pure.Get( "friendlyhud-frame-show" ) )
	window.W.General.EnableClassArchtypeColoringName_Checkbox:SetValue( Pure.Get( "friendlyhud-arch-color" ) )
	window.W.General.EnableClassArchtypeColoringHitpoints_Checkbox:SetValue( Pure.Get( "friendlyhud-arch-color-hitpoints" ) )
	window.W.General.ShowClassName_Checkbox:SetValue( Pure.Get( "friendlyhud-classname-show" ) )
	distanceFromTarget							= Pure.Get( "friendlyhud-window-dy" )
	window.W.General.DistanceFromTarget_Slider:SetValue( distanceFromTarget )
	window.W.General.DistanceFromTarget_Textbox:SetText( towstring( distanceFromTarget ) )
	frameAlpha							= Pure.Get( "friendlyhud-frame-alpha" )
	window.W.General.UnitFrameAlpha_Slider:SetValue( frameAlpha )
	window.W.General.UnitFrameAlpha_Textbox:SetText( wstring.format( L"%.2f", towstring( frameAlpha ) ) )
	window.W.General.UnitFrameAlpha_Image:Alpha( frameAlpha )
	window.W.General.DirectionFromTarget_Combo:SelectIndex( anchorsLookup[Pure.Get( "friendlyhud-window-anchor" )] )
	fontAlpha							= Pure.Get( "friendlyhud-frame-font-alpha" )
	window.W.General.UnitFrameFontAlpha_Slider:SetValue( fontAlpha )
	window.W.General.UnitFrameFontAlpha_Textbox:SetText( wstring.format( L"%.2f", towstring( fontAlpha ) ) )
	window.W.General.UnitFrameFontAlpha_Image:Alpha( fontAlpha )
	
	--
	-- Dispel Settings
	--
	dispelRed, dispelGreen, dispelBlue 	= unpack( Pure.Get( "friendlyhud-dispel-color" ) )
	dispelAlpha							= Pure.Get( "friendlyhud-dispel-alpha" )
	window.W.Dispel.EnableDispelHighlighting_Checkbox:SetValue( Pure.Get( "friendlyhud-dispel-show" ) )
	window.W.Dispel.ColorPreview_Image:Tint( dispelRed, dispelGreen, dispelBlue )
	window.W.Dispel.ColorPreview_Image:Alpha( dispelAlpha )
	window.W.Dispel.Red_Slider:SetValue( dispelRed )
	window.W.Dispel.Red_Textbox:SetText( towstring( dispelRed ) )
	window.W.Dispel.Green_Slider:SetValue( dispelGreen )
    window.W.Dispel.Green_Textbox:SetText( towstring( dispelGreen ) )
    window.W.Dispel.Blue_Slider:SetValue( dispelBlue )
    window.W.Dispel.Blue_Textbox:SetText( towstring( dispelBlue ) )
    window.W.Dispel.Alpha_Slider:SetValue( dispelAlpha )
	window.W.Dispel.Alpha_Textbox:SetText( wstring.format( L"%.2f", towstring( dispelAlpha ) ) )
	
	--	
	-- Color Settings
	--
	hitRed, hitGreen, hitBlue = unpack( Pure.Get( "friendlyhud-hitpoints-status-color" ) )
	window.W.Colors.HitPointsTextureColor_Label:Color( hitRed, hitGreen, hitBlue )
	window.W.Colors.HitPointsRed_Slider:SetValue( hitRed )
	window.W.Colors.HitPointsRed_Textbox:SetText( towstring( hitRed ) )
	window.W.Colors.HitPointsGreen_Slider:SetValue( hitGreen )
    window.W.Colors.HitPointsGreen_Textbox:SetText( towstring( hitGreen ) )
    window.W.Colors.HitPointsBlue_Slider:SetValue( hitBlue )
    window.W.Colors.HitPointsBlue_Textbox:SetText( towstring( hitBlue ) )
    rvrRed, rvrGreen, rvrBlue = unpack( Pure.Get( "friendlyhud-rvr-flag-color" ) )
	window.W.Colors.RvRFlagColor_Label:Color( rvrRed, rvrGreen, rvrBlue )
	window.W.Colors.RvRFlagRed_Slider:SetValue( rvrRed )
	window.W.Colors.RvRFlagRed_Textbox:SetText( towstring( rvrRed ) )
	window.W.Colors.RvRFlagGreen_Slider:SetValue( rvrGreen )
    window.W.Colors.RvRFlagGreen_Textbox:SetText( towstring( rvrGreen ) )
    window.W.Colors.RvRFlagBlue_Slider:SetValue( rvrBlue )
    window.W.Colors.RvRFlagBlue_Textbox:SetText( towstring( rvrBlue ) )
end

function PureConfig_TargetFriendlyHUD_OnUpdate()
	-- Only update if pure config is showing and we are the active panel
	if( PureConfig.IsShowing() and ( PureConfig.GetActiveConfigWindowIndex() ==  window.Index ) and initialized ) then
		local updated = false
		local ret = false
		
		--
		-- General Sliders
		--
		_, distanceFromTarget = PureConfig.UpdateColorSelection( distanceFromTarget, window.W.General.DistanceFromTarget_Slider, window.W.General.DistanceFromTarget_Textbox )
		
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
		-- Dispel Colors
		--
		-- 	Get the slider values
		ret, dispelRed = PureConfig.UpdateColorSelection( dispelRed, window.W.Dispel.Red_Slider, window.W.Dispel.Red_Textbox )
		updated = updated or ret
		
		ret, dispelGreen = PureConfig.UpdateColorSelection( dispelGreen, window.W.Dispel.Green_Slider, window.W.Dispel.Green_Textbox )
		updated = updated or ret
		
		ret, dispelBlue = PureConfig.UpdateColorSelection( dispelBlue, window.W.Dispel.Blue_Slider, window.W.Dispel.Blue_Textbox )
		updated = updated or ret
		
		ret, dispelAlpha = PureConfig.UpdateAlphaSelection( dispelAlpha, window.W.Dispel.Alpha_Slider, window.W.Dispel.Alpha_Textbox )
		updated = updated or ret
		
		-- Update our preview color
		if( updated ) then
			window.W.Dispel.ColorPreview_Image:Tint( dispelRed, dispelGreen, dispelBlue )
			window.W.Dispel.ColorPreview_Image:Alpha( dispelAlpha )
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
		
		-- 	Get the slider values
		ret, rvrRed = PureConfig.UpdateColorSelection( RvRFlagRed, window.W.Colors.RvRFlagRed_Slider, window.W.Colors.RvRFlagRed_Textbox )
		updated = updated or ret
		
		ret, rvrGreen = PureConfig.UpdateColorSelection( RvRFlagGreen, window.W.Colors.RvRFlagGreen_Slider, window.W.Colors.RvRFlagGreen_Textbox )
		updated = updated or ret
		
		ret, rvrBlue = PureConfig.UpdateColorSelection( RvRFlagBlue, window.W.Colors.RvRFlagBlue_Slider, window.W.Colors.RvRFlagBlue_Textbox )
		updated = updated or ret
		
		-- Update our preview color
		if( updated ) then
			window.W.Colors.RvRFlagColor_Label:Color( rvrRed, rvrGreen, rvrBlue )
			updated = false
		end
	end	
end

window.Initialize	= InitializeWindow
window.Apply		= ApplyConfigSettings
window.Revert		= RevertConfigSettings
window.Index		= PureConfig.RegisterWindow( window )
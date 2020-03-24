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
local window	= {
	Name		= T["General"],
	display		= {},
	W			= {},
}
local textures			= PureConstants.Textures
local textureNames		= PureConstants.TextureNames

function InitializeWindow()
	-- If our window already exists, we are all set
	if initialized then return end
	
	local w
	local e	
	
	-- General Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
	w:ClearAnchors()
	w:Resize( 400, 80 )
	w:Show( true )
	window.W.General = w
	
	-- Texture Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
    w:ClearAnchors()
	w:Resize( 400, 160 )
	w:Show( true )
	window.W.Texture = w
	
	-- Archtype Window
	--[[
	w = LibGUI( "window", nil, "PureWindowDefault" )
    w:ClearAnchors()
	w:Resize( 400, 300 )
	w:Show( true )
	window.W.Archtype = w
	--]]
	
	-- This is the order the windows are displayed to the user
	table.insert( window.display, window.W.General )
	table.insert( window.display, window.W.Texture )
	--table.insert( window.display, window.W.Archtype )
	
	
	--
	-- GENERAL WINDOW
	--
	-- General - Subsection Title
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General, "topleft", "topleft", 15, 10 )
    e:Font( "font_clear_medium_bold" )
    e:SetText( T["General"] )
    window.W.General.Title_Label = e
    
    -- General - Enable Pure Checkbox
	e = window.W.General( "Checkbox" )
	e:AnchorTo( window.W.General.Title_Label, "bottomleft", "topleft", 10, 5 )
	window.W.General.EnablePure_Checkbox = e
    
    -- General - Enable Pure Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.EnablePure_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Enable Pure"] )
    window.W.General.EnablePure_Label = e
    
    --
    -- TEXTURE WINDOW
    --
    -- Texture - Subsection Title
    e = window.W.Texture( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Texture, "topleft", "topleft", 15, 0 )
    e:Font( "font_clear_medium_bold" )
    e:SetText( T["Textures"] )
    window.W.Texture.Title_Label = e
    
    -- Texture - Hit Point Texture Label
    e = window.W.Texture( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Texture.Title_Label, "bottomleft", "topleft", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Hit Point Texture:"] )
    window.W.Texture.HitPointTexture_Label = e
    
    -- Texture - Hit Point Texture Combo
    e = window.W.Texture( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.Texture.HitPointTexture_Label, "bottomleft", "topleft", 0, 0 )
    for _, texture in ipairs( textureNames ) 
	do 
		e:Add( texture )
	end
    window.W.Texture.HitPointTexture_Combo = e
    
    -- Texture - Action Point Texture Label
    e = window.W.Texture( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Texture.HitPointTexture_Combo, "bottomleft", "topleft", 0, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Action Point Texture:"] )
    window.W.Texture.ActionPointTexture_Label = e
    
    -- Texture - Action Point Texture Combo
    e = window.W.Texture( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.Texture.ActionPointTexture_Label, "bottomleft", "topleft", 0, 0 )
    for _,texture in ipairs( textureNames ) 
	do 
		e:Add( texture ) 
	end
	window.W.Texture.ActionPointTexture_Combo = e
    
    --[[
     
    --
	-- ARCHTYPE WINDOW
	--
	-- Archtype - Subsection Title
    e = window.W.Archtype( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Archtype, "topleft", "topleft", 15, 10 )
    e:Font( "font_clear_medium_bold" )
    e:SetText( T["Archtypes"] )
    window.W.Archtype.Title_Label = e
    
    -- Archtype - Use Squared Archtype Coloring Checkbox
	e = window.W.Archtype( "Checkbox" )
	e:AnchorTo( window.W.Archtype.Title_Label, "bottomleft", "topleft", 10, 5 )
	window.W.Archtype.UseSquaredArchtypeColoring_Checkbox = e
    
    -- Archtype - Use Squared Archtype Coloring Label
    e = window.W.Archtype( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Archtype.UseSquaredArchtypeColoring_Checkbox, "right", "left", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Use Squared archtype coloring (Requires Squared)"] )
    window.W.Archtype.UseSquaredArchtypeColoring_Label = e
    
   	-- Archtype - Configure Class/Archtypes Label
    e = window.W.Archtype( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Archtype.UseSquaredArchtypeColoring_Label, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Configure Class/Archtypes:"] )
    window.W.Archtype.ConfigureClassArchtypes_Label = e
    
    -- Archtype - Class Label
    e = window.W.Archtype( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Archtype.ConfigureClassArchtypes_Label, "bottomleft", "topleft", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Class:"] )
    window.W.Archtype.ConfigureClassArchtypes_Class_Label = e
    
    -- Archtype - Class Combo
    e = window.W.Archtype( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.Archtype.ConfigureClassArchtypes_Class_Label, "bottomleft", "topleft", 0, 0 )
    for _, texture in ipairs( textureNames ) 
	do 
		--e:Add( texture )
	end
    window.W.Archtype.ConfigureClassArchtypes_Class_Combo = e
    
    -- Archtype - Archtype Label
    e = window.W.Archtype( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.Archtype.ConfigureClassArchtypes_Class_Combo, "bottomleft", "topleft", 0, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Archtype:"] )
    window.W.Archtype.ConfigureClassArchtypes_Archtype_Label = e
    
    -- Archtype - Archtype Combo
    e = window.W.Archtype( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.Archtype.ConfigureClassArchtypes_Archtype_Label, "bottomleft", "topleft", 0, 0 )
    for _, texture in ipairs( textureNames ) 
	do 
		--e:Add( texture )
	end
    window.W.Archtype.ConfigureClassArchtypes_Archtype_Combo = e
    --]]
    
    initialized = true
end

function ApplyConfigSettings()
	Pure.Set( "general-enable-addon", window.W.General.EnablePure_Checkbox:GetValue() )
	Pure.Set( "general-hitpoints-texture", textures[window.W.Texture.HitPointTexture_Combo:SelectedIndex()] )
	Pure.Set( "general-actionpoints-texture", textures[window.W.Texture.ActionPointTexture_Combo:SelectedIndex()] )
end

function RevertConfigSettings()
	window.W.General.EnablePure_Checkbox:SetValue( Pure.Get( "general-enable-addon" ) )
	window.W.Texture.HitPointTexture_Combo:SelectIndex( textures[Pure.Get( "general-hitpoints-texture" )] )
	window.W.Texture.ActionPointTexture_Combo:SelectIndex( textures[Pure.Get( "general-actionpoints-texture" )] )
end

window.Initialize	= InitializeWindow
window.Apply		= ApplyConfigSettings
window.Revert		= RevertConfigSettings
window.Index		= PureConfig.RegisterWindow( window )
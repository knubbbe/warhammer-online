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
	Name		= T["About Pure"],
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
	w = LibGUI( "window" )
	w:ClearAnchors()
	w:Resize( 400, 80 )
	w:Show( true )
	window.W.General = w
	
	-- This is the order the windows are displayed to the user
	table.insert( window.display, window.W.General )
	
	--
	-- GENERAL WINDOW
	--
	-- General - Subsection Title
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General, "topleft", "topleft", 15, 10 )
    e:Font( "font_clear_medium_bold" )
    e:SetText( T["Coming Soon!"] )
    window.W.General.Title_Label = e
    
    initialized = true
end

function ApplyConfigSettings()
	--Pure.Set( "general-enable-addon", W.EnablePure_Checkbox:GetValue() )
end

function RevertConfigSettings()
	--W.EnablePure_Checkbox:SetValue( Pure.Get( "general-enable-addon" ) )
end

window.Initialize	= InitializeWindow
window.Apply		= ApplyConfigSettings
window.Revert		= RevertConfigSettings
window.Index		= PureConfig.RegisterWindow( window )
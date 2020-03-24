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

local T 		= LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )
local LibGUI 	= LibStub( "LibGUI" )

local initialized		= false

local InitializeWindow, ApplyConfigSettings, RevertConfigSettings

local window	= {
	Name		= T["Profiles"],
	display		= {},
	W			= {},
}

local activeProfileLookup		= {}
local copyProfileLookup			= {}

local function stringComparator( a, b )	return( StringsCompare( a, b ) == -1 ) end
local function pairsByKeys (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      -- iterator variable
  local iter = function ()   -- iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end


function InitializeWindow()
	-- If our window already exists, we are all set
	if initialized then return end
	
	local w
	local e	
	
	-- General Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
	w:ClearAnchors()
	w:Resize( 400, 390 )
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
    e:SetText( T["Profiles"] )
    window.W.General.Title_Label = e
    
    -- General - Current Profile Desc Label
    e = window.W.General( "Label" )
    e:Resize( 450, 25 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.Title_Label, "bottomleft", "topleft", 5, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Current Profile:"] )
    window.W.General.CurrentProfileDesc_Label = e
    
    -- General - Current Profile Label
    e = window.W.General( "Label" )
    e:Resize( 450, 25 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.CurrentProfileDesc_Label, "bottomleft", "topleft", 10, 0 )
    e:Font( "font_clear_small_bold" )
    e:Color( 255, 255, 255 )
    window.W.General.CurrentProfile_Label = e
    
    -- General - Set Active Profile Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.CurrentProfileDesc_Label, "bottomleft", "topleft", 0, 25 )
    e:Font( "font_chat_text" )
    e:SetText( T["Set Active Profile:"] )
    window.W.General.SetActiveProfile_Label = e
    
    -- General - Set Active Profile Combo
    e = window.W.General( "combobox", nil, "PureProfileComboBox_ActiveProfile" )
    e:AnchorTo( window.W.General.SetActiveProfile_Label, "bottomleft", "topleft", 10, 0 )
    window.W.General.SetActiveProfile_Combo = e
    
    -- General - Copy Settings From Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.SetActiveProfile_Label, "bottomleft", "topleft", 0, 30 )
    e:Font( "font_chat_text" )
    e:SetText( T["Copy Settings From:"] )
    window.W.General.CopySettingsFrom_Label = e
    
    -- General - Copy Settings Combo
    e = window.W.General( "combobox", nil, "PureProfileComboBox_CopyProfile" )
    e:AnchorTo( window.W.General.CopySettingsFrom_Label, "bottomleft", "topleft", 10, 0 )
    window.W.General.CopySettingsFrom_Combo = e
    
    -- General - Note Label
    e = window.W.General( "Label" )
    e:Resize( 500, 40 )
    e:Align( "center" )
    e:AnchorTo( window.W.General.CopySettingsFrom_Label, "bottomleft", "topleft", 0, 35 )
    e:Font( "font_chat_text" )
    e:Color( 255, 255, 255 )
    e:WordWrap( true )
    e:SetText( T["NOTE: Profile changes take effect immediately!"] )
    window.W.General.Note_Label = e

    -- Reset - Reset Configuration Button
    e = window.W.General( "Button", nil, "EA_Button_DefaultResizeable" )
    e:Resize( 350 )
    e:Show( true )
    e:AnchorTo( window.W.General, "top", "top", 0, 340 )
    e:SetText( T["Reset Profile"] )
    e.OnLButtonUp = 
		function()
			DialogManager.MakeTwoButtonDialog(  T["Are you sure?"], 
                                            GetString( StringTables.Default.LABEL_YES ), PureConfig_Profiles_OnResetProfile, 
                                            GetString( StringTables.Default.LABEL_NO ),  nil,
											nil, nil, nil, nil, DialogManager.TYPE_MODAL )
		end
    window.W.General.ResetConfiguration_Button = e
    
    -- General - Warning Label
    e = window.W.General( "Label" )
    e:Resize( 500, 90 )
    e:Align( "center" )
    e:AnchorTo( window.W.General.ResetConfiguration_Button, "top", "bottom", 0, 0 )
    e:Font( "font_chat_text" )
    e:Color( 255, 0, 0 )
    e:WordWrap( true )
    e:SetText( T["WARNING: Clicking this button will restore the current profile back to default values!"] )
    window.W.General.Warning_Label = e
    
    initialized = true
end

function ApplyConfigSettings()
end

function RevertConfigSettings()
	local dbOpt 			= PureConfig.GetDBOptions()
	local availProfiles		= dbOpt:ListProfiles( { arg="both" } )
	local copyProfiles		= dbOpt:ListProfiles( { arg="nocurrent" } )
	local idx				= 0
	local currentProfile	= dbOpt:GetCurrentProfile()
	local wCurrentProfile	= dbOpt:GetProfileDisplayName( currentProfile ) 
	--
	-- House keeping
	--
	activeProfileLookup = {}
	copyProfileLookup = {}
	
	--
	-- General Settings
	--
	window.W.General.CurrentProfile_Label:SetText( wCurrentProfile or currentProfile )
	
	--
	-- SET ACTIVE PROFILE SECTION
	--
	idx = 1
	window.W.General.SetActiveProfile_Combo:Clear()
	window.W.General.SetActiveProfile_Combo:Add( wCurrentProfile or currentProfile )
	activeProfileLookup[idx] = wCurrentProfile or currentProfile
	for k,v in pairsByKeys( availProfiles, stringComparator ) 
	do 
		idx = idx + 1
		activeProfileLookup[idx] = k
		window.W.General.SetActiveProfile_Combo:Add( dbOpt:GetProfileDisplayName( v ) or v )
	end
	window.W.General.SetActiveProfile_Combo:SelectIndex( 1 )
	
	--
	-- COPY SETTINGS
	--
	idx = 0
	window.W.General.CopySettingsFrom_Combo:Clear()
	for k,v in pairsByKeys( copyProfiles ) 
	do 
		idx = idx + 1
		copyProfileLookup[idx] = k
		window.W.General.CopySettingsFrom_Combo:Add( dbOpt:GetProfileDisplayName( v ) or v )
	end
	window.W.General.CopySettingsFrom_Combo:SelectIndex( 0 )
end

function PureConfig_Profiles_OnActiveProfileChanged()
	-- Get the selected index
	local idx = window.W.General.SetActiveProfile_Combo:SelectedIndex()
	
	if( idx == 0 or idx == 1 ) then return end
	
	-- Sanity check
	if( activeProfileLookup == nil or activeProfileLookup[idx] == nil ) then 
		d( "Error changing active profile.  activeProfileLookup is not valid." )
		return
	end
	
	local dbOpt 			= PureConfig.GetDBOptions()
	
	-- Set the new configuration active
	dbOpt:SetProfile( nil, activeProfileLookup[idx] )
end

function PureConfig_Profiles_OnCopyProfileChanged()
	-- Get the selected index
	local idx = window.W.General.CopySettingsFrom_Combo:SelectedIndex()
	
	if( idx == 0 ) then return end
	
	-- Sanity check
	if( copyProfileLookup == nil or copyProfileLookup[idx] == nil ) then 
		d( "Error copying to active profile.  copyProfileLookup is not valid." )
		return
	end
	
	local dbOpt 			= PureConfig.GetDBOptions()
	
	-- Copy the settings to the current profile
	dbOpt:CopyProfile( nil, copyProfileLookup[idx] )
end

function PureConfig_Profiles_OnResetProfile()
	PureConfig.GetDBOptions():Reset()
end

window.Initialize	= InitializeWindow
window.Apply		= ApplyConfigSettings
window.Revert		= RevertConfigSettings
window.Index		= PureConfig.RegisterWindow( window )
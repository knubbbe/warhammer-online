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
	Name		= T["Templates"],
	display		= {},
	W			= {},
}

local playerItoN, playerNtoI, playerpetItoN, playerpetNtoI, playerpettargetItoN, playerpettargetNtoI
local friendlyItoN, friendlyNtoI, friendlyhudItoN, friendlyhudNtoI, hostileItoN, hostileNtoI, hostilehudItoN, hostilehudNtoI
local groupItoN, groupNtoI

function InitializeWindow()
	-- If our window already exists, we are all set
	if initialized then return end
	
	playerItoN, playerNtoI 							= PureTemplates.GetTemplatesForType( PureTemplates.Types.PLAYER )
	playerpetItoN, playerpetNtoI 					= PureTemplates.GetTemplatesForType( PureTemplates.Types.PLAYER_PET )
	playerpettargetItoN, playerpettargetNtoI 		= PureTemplates.GetTemplatesForType( PureTemplates.Types.PLAYER_PET_TARGET )
	friendlyItoN, friendlyNtoI 						= PureTemplates.GetTemplatesForType( PureTemplates.Types.TARGET_FRIENDLY )
	friendlyhudItoN, friendlyhudNtoI 				= PureTemplates.GetTemplatesForType( PureTemplates.Types.TARGET_FRIENDLY_HUD )
	hostileItoN, hostileNtoI 						= PureTemplates.GetTemplatesForType( PureTemplates.Types.TARGET_HOSTILE )
	hostilehudItoN, hostilehudNtoI 					= PureTemplates.GetTemplatesForType( PureTemplates.Types.TARGET_HOSTILE_HUD )
	groupItoN, groupNtoI 							= PureTemplates.GetTemplatesForType( PureTemplates.Types.GROUP )
	grouphudItoN, grouphudNtoI 						= PureTemplates.GetTemplatesForType( PureTemplates.Types.GROUP_HUD )
	grouppetItoN, grouppetNtoI 						= PureTemplates.GetTemplatesForType( PureTemplates.Types.GROUP_PET )
	
	local w
	local e	
	
	-- General Window
	w = LibGUI( "window", nil, "PureWindowDefault" )
	w:ClearAnchors()
	w:Resize( 400, 825 )
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
    e:SetText( T["Unit Frame Templates"] )
    window.W.General.Title_Label = e
    
    -- General - Player Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.Title_Label, "bottomleft", "topleft", 10, 0 )
    e:Font( "font_chat_text" )
    e:SetText( T["Player:"] )
    window.W.General.Player_Label = e
    
    -- General - Player Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.Player_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( playerItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.Player_Combo = e
    
    -- General - Player Pet Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.Player_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Player Pet:"] )
    window.W.General.PlayerPet_Label = e
    
    -- General - Player Pet Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.PlayerPet_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( playerpetItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.PlayerPet_Combo = e
    
    -- General - Player Pet Target Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.PlayerPet_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Player Pet Target:"] )
    window.W.General.PlayerPetTarget_Label = e
    
    -- General - Player Pet Target Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.PlayerPetTarget_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( playerpettargetItoN ) 
    do 
		e:Add( name )
	end
    window.W.General.PlayerPetTarget_Combo = e
    
    -- General - Target Friendly Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.PlayerPetTarget_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Friendly Target:"] )
    window.W.General.FriendlyTarget_Label = e
    
    -- General - Target Friendly Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.FriendlyTarget_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( friendlyItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.FriendlyTarget_Combo = e
    
    -- General - Target Friendly HUD Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.FriendlyTarget_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Friendly Target HUD:"] )
    window.W.General.FriendlyTargetHUD_Label = e
    
    -- General - Target Friendly HUD Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.FriendlyTargetHUD_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( friendlyhudItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.FriendlyTargetHUD_Combo = e
    
    -- General - Target Hostile Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.FriendlyTargetHUD_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Hostile Target:"] )
    window.W.General.HostileTarget_Label = e
    
    -- General - Target Hostile Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.HostileTarget_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( hostileItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.HostileTarget_Combo = e
    
    -- General - Target Hostile HUD Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.HostileTarget_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Hostile Target HUD:"] )
    window.W.General.HostileTargetHUD_Label = e
    
    -- General - Target Hostile HUD Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.HostileTargetHUD_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( hostilehudItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.HostileTargetHUD_Combo = e
    
    -- General - Group Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.HostileTargetHUD_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Group:"] )
    window.W.General.Group_Label = e
    
    -- General - Group Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.Group_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( groupItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.Group_Combo = e
    
   -- General - Group Pet Label
    e = window.W.General( "Label" )
    e:Resize( 450 )
    e:Align( "leftcenter" )
    e:AnchorTo( window.W.General.Group_Combo, "bottomleft", "topleft", 0, 5 )
    e:Font( "font_chat_text" )
    e:SetText( T["Group Pet:"] )
    window.W.General.GroupPet_Label = e
    
    -- General - Group Pet Combo
    e = window.W.General( "combobox", nil, "PureComboBox" )
    e:AnchorTo( window.W.General.GroupPet_Label, "bottomleft", "topleft", 0, 0 )
    for _, name in ipairs( grouppetItoN ) 
	do 
		e:Add( name )
	end
    window.W.General.GroupPet_Combo = e
    
	initialized = true
end

function ApplyConfigSettings()
	Pure.Set( "player-frame-template", playerItoN[window.W.General.Player_Combo:SelectedIndex()] )
	Pure.Set( "playerpet-frame-template", playerpetItoN[window.W.General.PlayerPet_Combo:SelectedIndex()] )
	Pure.Set( "playerpettarget-frame-template", playerpettargetItoN[window.W.General.PlayerPetTarget_Combo:SelectedIndex()] )
	Pure.Set( "friendly-frame-template", friendlyItoN[window.W.General.FriendlyTarget_Combo:SelectedIndex()] )
	Pure.Set( "friendlyhud-frame-template", friendlyhudItoN[window.W.General.FriendlyTargetHUD_Combo:SelectedIndex()] )
	Pure.Set( "hostile-frame-template", hostileItoN[window.W.General.HostileTarget_Combo:SelectedIndex()] )
	Pure.Set( "hostilehud-frame-template", hostilehudItoN[window.W.General.HostileTargetHUD_Combo:SelectedIndex()] )
	Pure.Set( "group-frame-template", groupItoN[window.W.General.Group_Combo:SelectedIndex()] )
	Pure.Set( "grouppet-frame-template", grouppetItoN[window.W.General.GroupPet_Combo:SelectedIndex()] )
end

function RevertConfigSettings()
	window.W.General.Player_Combo:SelectIndex( playerNtoI[Pure.Get( "player-frame-template" )] )
	window.W.General.PlayerPet_Combo:SelectIndex( playerpetNtoI[Pure.Get( "playerpet-frame-template" )] )
	window.W.General.PlayerPetTarget_Combo:SelectIndex( playerpettargetNtoI[Pure.Get( "playerpettarget-frame-template" )] )
	window.W.General.FriendlyTarget_Combo:SelectIndex( friendlyNtoI[Pure.Get( "friendly-frame-template" )] )
	window.W.General.FriendlyTargetHUD_Combo:SelectIndex( friendlyhudNtoI[Pure.Get( "friendlyhud-frame-template" )] )
	window.W.General.HostileTarget_Combo:SelectIndex( hostileNtoI[Pure.Get( "hostile-frame-template" )] )
	window.W.General.HostileTargetHUD_Combo:SelectIndex( hostilehudNtoI[Pure.Get( "hostilehud-frame-template" )] )
	window.W.General.Group_Combo:SelectIndex( groupNtoI[Pure.Get( "group-frame-template" )] )
	window.W.General.GroupPet_Combo:SelectIndex( grouppetNtoI[Pure.Get( "grouppet-frame-template" )] )
end

window.Initialize	= InitializeWindow
window.Apply		= ApplyConfigSettings
window.Revert		= RevertConfigSettings
window.Index		= PureConfig.RegisterWindow( window )
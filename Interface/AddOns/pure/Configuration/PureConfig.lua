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

if not PureConfig then PureConfig = {} end

local debug = false
--[===[@debug@
debug = true
--@end-debug@]===]

local T = LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure", debug )

local windowId 					= "PureConfig"

local configWindowScroll		= windowId .. "Scroll"
local configWindowScrollChild	= configWindowScroll .. "Child"
local MAX_VISIBLE_ROWS 			= 15

-- Our list of registered windows
local configuredWindows			= {}

local displayOrder 				= {}		
PureConfig.displayData 			= {}

local currentDisplayedConfig	= 1

local dbOptions

function PureConfig.GetWindowName() return windowId end
function PureConfig.IsShowing() return WindowGetShowing( windowId ) end
function PureConfig.GetActiveConfigWindowIndex() return currentDisplayedConfig end
function PureConfig.GetDBOptions() return dbOptions.handler end

function PureConfig.OnLoad( options )
	-- Store our db options
	dbOptions = options

	-- Set our configuration title
	LabelSetText( windowId .. "TitleBarText", T["Pure - Configuration"] )
	
	-- Set our highlighting for the listbox
	DataUtils.SetListRowAlternatingTints( windowId .. "List", MAX_VISIBLE_ROWS )
	
	-- Create our window display data
	PureConfig.CreateDisplayData()
	
	-- Display the window list
	PureConfig.UpdateConfigList()
	
	-- Initialize our configuration windows
	for index, window in ipairs( configuredWindows )
    do
    	-- Create and store our window
    	window:Initialize()
    	
    	-- Hide the config dialog
    	PureConfig.HideConfig( index )
    end
    
    -- Display our initial window
    PureConfig.UpdateDisplayedConfig( currentDisplayedConfig )
    
    -- Revert all of our windows to set their settings
	PureConfig.RevertDialog()
	
	-- Set our close button title
	LabelSetText( windowId .. "Version", towstring( Pure.GetVersion() ) )
	
	-- Set our close button title
	ButtonSetText( windowId .. "CloseButton", T["Close"] )	 
	
	-- Set our revert button title
	ButtonSetText( windowId .. "RevertButton", T["Revert"] )
	
	-- Set our apply button title
	ButtonSetText( windowId .. "ApplyButton", T["Apply"] )
end

function PureConfig.CreateDisplayData()
	-- Clear any existing data
	PureConfig.displayData = {}
	
	-- Create our list of configuration pages
	for slotNum, window in pairs( configuredWindows ) 
	do
		local listDisplayItem = {}
		
		listDisplayItem.slotNum 	= slotNum
		listDisplayItem.Name		= window.Name
    
    	PureConfig.displayData[slotNum] = listDisplayItem
	end
end

function PureConfig.UpdateConfigList()
	-- Clear our current display data
	displayOrder = {}
    
    -- Create the list we will use to display
    for index,_ in ipairs( PureConfig.displayData )
    do
    	-- Add this to the end of our display
    	table.insert( displayOrder, index )
    end
    
    -- Display the data
    ListBoxSetDisplayOrder( windowId .. "List", displayOrder )
end

function PureConfig.PopulateDisplay()
	local slotNum, config
	 
	for row, data in ipairs( PureConfigList.PopulatorIndices ) 
	do
		PureConfig.UpdateListRow( PureConfig.displayData[data], windowId .. "ListRow".. row )
	end 
end

function PureConfig.UpdateListRow( config, rowName )
	if( config.slotNum == currentDisplayedConfig ) then
		LabelSetTextColor( rowName .. "Name", DefaultColor.GREEN.r, DefaultColor.GREEN.g, DefaultColor.GREEN.b )
	else
		LabelSetTextColor( rowName .. "Name", 255 ,255 ,255 )
	end
end

function PureConfig.OnLButtonUpConfigList()
	local slotNumber, rowNumber, config = PureConfig.GetSlotRowNumForActiveListRow()
	
	if( rowNumber ~= currentDisplayedConfig ) then
		PureConfig.UpdateDisplayedConfig( rowNumber )	
	end
end

function PureConfig.UpdateDisplayedConfig( newConfig )
	local prevWindow = configWindowScrollChild
	
	-- Hide the old config
	PureConfig.HideConfig( currentDisplayedConfig )
	
	-- Clear the old config parent
	PureConfig.SetConfigParent( currentDisplayedConfig, "Root" )
	
	-- Set the new config parent
	PureConfig.SetConfigParent( newConfig, configWindowScrollChild )
	
	-- Anchor the configs children
	PureConfig.ReanchorConfigDisplay( newConfig, configWindowScrollChild )
	
	-- Display the new config
	PureConfig.ShowConfig( newConfig )
	
	-- Update our current displayed config
	currentDisplayedConfig = newConfig
	
	-- Tell our scroll window to update its scroll window
	ScrollWindowSetOffset( configWindowScroll, 0 )
	ScrollWindowUpdateScrollRect( configWindowScroll )

	-- Repopulate our display
	PureConfig.PopulateDisplay()
end

function PureConfig.GetSlotRowNumForActiveListRow()
	local rowNumber, slowNumber, config
	
	-- Get the row within the window
	rowNumber = WindowGetId( SystemData.ActiveWindow.name ) 

	-- Get the data index from the list box
    local dataIndex = ListBoxGetDataIndex( windowId .. "List" , rowNumber )
    
    -- Get the slot from the data
    if( dataIndex ~= nil ) then
    	
    	slotNumber = PureConfig.displayData[dataIndex].slotNum
    
	    -- Get the data
	    if( slotNumber ~= nil ) then
	    	config = configuredWindows[slotNumber]
	    end
	end
    
	return slotNumber, rowNumber, config
end

function PureConfig.SaveDialog()
	-- Revert all of our windows to set their settings
	for index, window in ipairs( configuredWindows )
    do
    	window:Apply()
    end
end

function PureConfig.RevertDialog()
	-- Revert all of our windows to set their settings
	for index, window in ipairs( configuredWindows )
    do
    	window:Revert()
    end
end

function PureConfig.OnClose()
	WindowSetShowing( windowId, false )
end

function PureConfig.OnApply()
	-- Save the dialog
	PureConfig.SaveDialog()
	
	-- Refresh the unit frames
	Pure.RefreshUnitFrames()
end

function PureConfig.OnRevert()
	PureConfig.RevertDialog()
end

function PureConfig.RegisterWindow( window )
	table.insert( configuredWindows, window )
	return #configuredWindows
end

function PureConfig.OnResizeBegin()
    WindowUtils.BeginResize( windowId, "topleft", 800, 500, PureConfig.OnResizeEnd )
end

function PureConfig.OnResizeEnd()
	PureConfig.UpdateDisplayedConfig( currentDisplayedConfig )
end

function PureConfig.ShowConfig( index )
	if( configuredWindows[index] ~= nil and configuredWindows[index].display ~= nil ) then
		for k,v in ipairs( configuredWindows[index].display )
		do
			v:Show()
		end
	end
end

function PureConfig.HideConfig( index )
	if( configuredWindows[index] ~= nil and configuredWindows[index].display ~= nil ) then
		for k,v in ipairs( configuredWindows[index].display )
		do
			v:Hide()
		end
	end
end

function PureConfig.SetConfigParent( index, parent )
	if( configuredWindows[index] ~= nil and configuredWindows[index].display ~= nil ) then
		for k,v in ipairs( configuredWindows[index].display )
		do
			v:Parent( parent )
		end
	end
end

function PureConfig.ReanchorConfigDisplay( index, initialParent )
	local prevWindow	= initialParent
	local leftAnchor 	= "topleft"
	local rightAnchor 	= "topright"

	if( configuredWindows[index] ~= nil and configuredWindows[index].display ~= nil ) then
		for k,v in ipairs( configuredWindows[index].display )
		do
			v:ClearAnchors()
			v:AddAnchor( prevWindow, leftAnchor, "topleft", 0, 0 )
			v:AddAnchor( prevWindow, rightAnchor, "topright", 0, 0 )
			
			prevWindow = v.name
			leftAnchor = "bottomleft"
			rightAnchor = "bottomright"
		end
	end
end

function PureConfig.UpdateColorSelection( currentValue, slider, text )
	local changed 		= false
	local sliderColor 	= math.floor( slider:GetValue() )
	local textColor 	= tonumber( text:GetText() ) or sliderColor
	
	if( sliderColor ~= currentValue ) then
		currentValue = sliderColor
		text:SetText( towstring( currentValue ) )
		changed = true
	elseif( textColor ~= currentValue ) then
		currentValue = textColor
		slider:SetValue( currentValue )
		changed = true
	end
		
	return changed, currentValue
end

function PureConfig.UpdateAlphaSelection( currentValue, slider, text )
	local changed 		= false
	local sliderColor 	= slider:GetValue()
	local textColor 	= tonumber( text:GetText() ) or sliderColor
	
	if( sliderColor ~= currentValue ) then
		currentValue = sliderColor
		text:SetText( wstring.format( L"%.2f", towstring( currentValue ) ) )
		changed = true
	elseif( textColor ~= currentValue ) then
		currentValue = textColor
		slider:SetValue( currentValue )
		changed = true
	end
	
	return changed, currentValue
end
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

if not PureConstants then PureConstants = {} end

local PureConstants = PureConstants
local pairs 		= pairs
local ipairs		= ipairs
local tsort			= table.sort
local tinsert		= table.insert
local string_format = string.format

local T 	= LibStub( "WAR-AceLocale-3.0" ) : GetLocale( "Pure" )
local LSA 	= LibStub( "LibSharedAssets" )

PureConstants.Layers		= {}
PureConstants.Layers[1]	= { value=Window.Layers.BACKGROUND, 	locale=T["Background"] }
PureConstants.Layers[2]	= { value=Window.Layers.DEFAULT, 		locale=T["Default"] }
PureConstants.Layers[3]	= { value=Window.Layers.SECONDARY, 		locale=T["Secondary"] }
PureConstants.Layers[4]	= { value=Window.Layers.POPUP, 			locale=T["Popup"] }
PureConstants.Layers[5]	= { value=Window.Layers.OVERLAY, 		locale=T["Overlay"] }

-- Texture Configuration Information
PureConstants.Textures		= {}
PureConstants.TextureNames	= {}

if LSA then
	-- Retrieve the textures from LSA
	PureConstants.Textures = LSA:GetTextureList() or {}
	
	-- Sort the textures
	tsort( PureConstants.Textures )
	
	-- Build the texture name table
	for index, texture in ipairs( PureConstants.Textures )
	do
		-- Reverse the lookup
		PureConstants.Textures[texture] = index
		
		-- Attempt to retrieve any meta data for the texture
		local meta = LSA:GetMetadata( texture )
		
		if( meta and meta.displayname ) then
			PureConstants.TextureNames[index] = meta.displayname
		else
			PureConstants.TextureNames[index] = towstring( texture )
		end
	end
end

-- Anchor Configuration Information    ( "top", "bottom", "left", "right" )
PureConstants.Anchors		= {}
PureConstants.Anchors[1]	= { config="top", 		locale=T["Top"] }
PureConstants.Anchors[2]	= { config="bottom", 	locale=T["Bottom"] }
PureConstants.Anchors[3]	= { config="left", 		locale=T["Left"] }
PureConstants.Anchors[4]	= { config="right", 	locale=T["Right"] }

PureConstants.AnchorsLookup	= {}
for k,v in ipairs( PureConstants.Anchors )
do
	PureConstants.AnchorsLookup[v.config] = k
end

-- Growth Direction Configuration Information ( "up", "down", "left", "right" )
PureConstants.GrowthDirections		= {}
PureConstants.GrowthDirections[1]	= { config="up", 		locale=T["Up"] }
PureConstants.GrowthDirections[2]	= { config="down", 		locale=T["Down"] }
PureConstants.GrowthDirections[3]	= { config="left", 		locale=T["Left"] }
PureConstants.GrowthDirections[4]	= { config="right", 	locale=T["Right"] }

PureConstants.GrowthDirectionsLookup	= {}
for k,v in ipairs( PureConstants.GrowthDirections )
do
	PureConstants.GrowthDirectionsLookup[v.config] = k
end

-- Player value replacement definitions
PureConstants.PlayerHitPointReplacement = {
	["curhp"] = {
		func = function()
			return string_format( "%s",GameData.Player.hitPoints.current )
		end,		
	},
	
	["curhpf"] = {
		func = function()
			return Pure.FormatLargeValue( GameData.Player.hitPoints.current )
		end,		
	},
	["maxhp"] = {
		func = function()
			return string_format( "%s",GameData.Player.hitPoints.maximum )
		end,		
	},
	["maxhpf"] = {
		func = function()
			return Pure.FormatLargeValue( GameData.Player.hitPoints.maximum )
		end,		
	},
	["ndefhp"] = {
		func = function()
			local def = GameData.Player.hitPoints.maximum - GameData.Player.hitPoints.current
			if( def == 0 ) then	return "" end
			return string_format( "%s", def * -1 )
		end,		
	},
	["ndefhpf"] = {
		func = function()
			local def = GameData.Player.hitPoints.maximum - GameData.Player.hitPoints.current
			if( def == 0 ) then return "" end
			return "-" .. Pure.FormatLargeValue( GameData.Player.hitPoints.maximum - GameData.Player.hitPoints.current )
		end,		
	},
	["defhp"] = {
		func = function()
			local def = GameData.Player.hitPoints.maximum - GameData.Player.hitPoints.current
			if( def == 0 ) then	return "" end
			return string_format( "%s", def )
		end,		
	},
	["defhpf"] = {
		func = function()
			local def = GameData.Player.hitPoints.maximum - GameData.Player.hitPoints.current
			if( def == 0 ) then return "" end
			return Pure.FormatLargeValue( GameData.Player.hitPoints.maximum - GameData.Player.hitPoints.current )
		end,		
	},
	["perhp"] = {
	func = function()
		return string_format( "%1.0f", ( GameData.Player.hitPoints.current / GameData.Player.hitPoints.maximum ) * 100 )
	end,		
	},
}

PureConstants.PlayerActionPointReplacement = {
	["curap"] = {
		func = function()
			return string_format( "%s",GameData.Player.actionPoints.current )
		end,		
	},
	
	["maxap"] = {
		func = function()
			return string_format( "%s",GameData.Player.actionPoints.maximum )
		end,		
	},
	["ndefap"] = {
		func = function()
			local def = GameData.Player.actionPoints.maximum - GameData.Player.actionPoints.current 
			if( def == 0 ) then	return "" end
			return string_format( "%s", def * -1 )
		end,		
	},
	["defap"] = {
		func = function()
			return string_format( "%s", GameData.Player.actionPoints.maximum - GameData.Player.actionPoints.current )
		end,		
	},
}
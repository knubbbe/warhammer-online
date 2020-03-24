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

if not PureTemplates then PureTemplates = {} end

local PureTemplates 			= PureTemplates

local pairs 		= pairs
local ipairs		= ipairs
local tinsert		= table.insert
local tremove		= table.remove
local tsort			= table.sort

--
-- Define the types of templates we will handle
--
PureTemplates.Types = {
	PLAYER				= "PurePlayer",
	PLAYER_PET			= "PurePlayerPet",
	PLAYER_PET_TARGET 	= "PurePlayerPetTarget",
	GROUP				= "PureGroup",
	GROUP_HUD			= "PureGroupHUD",
	GROUP_PET			= "PureGroupPet",
	TARGET_FRIENDLY		= "PureTargetFriendly",
	TARGET_HOSTILE		= "PureTargetHostile",
	TARGET_FRIENDLY_HUD	= "PureTargetFriendlyHUD",
	TARGET_HOSTILE_HUD	= "PureTargetHostileHUD",
}

local templatesByType = {}
local templatesByName = {}
local templateIndexToNameLookup = {}
local templateNameToIndexLookup	= {}
local templateTypeCounter = {}

--
-- templateType - specifies one of the PureTemplates.Types
-- frameType - This is the subclass type of the frameObject
-- frameObject - This is the object that is used to manage the frame
-- displayName - This is the name used when displaying this templates information to a user.
--
function PureTemplates.RegisterTemplate( templateType, frameType, frameObject, displayName )
	
	-- Make sure its a valid type
	if( templateType == nil or frameType == nil or frameType == L"" or 
		frameObject == nil or displayName == nil or displayName == L"" ) then return false end

	-- Create our type holder
	if( templatesByType[templateType] == nil ) then 
		templatesByType[templateType] = {}
		templatesByName[templateType] = {}
		templateIndexToNameLookup[templateType] = {}
		templateNameToIndexLookup[templateType] = {}
		templateTypeCounter[templateType] = 1
	end
	
	local template = 
	{
		m_Type 			= templateType,
		m_FrameType		= frameType,
		m_Frame 		= frameObject,
		m_Name			= displayName,
	}
	
	local index = templateTypeCounter[templateType]
	
	-- Add the template to our template name list
	templatesByName[templateType][displayName] = template
	
	-- Add the template to the name to index lookup
	templateNameToIndexLookup[templateType][displayName] = index
	
	-- Add the template to the index to name lookup
	templateIndexToNameLookup[templateType][index] = displayName
	
	-- Increment our index
	templateTypeCounter[templateType] = templateTypeCounter[templateType] + 1
	
	return true
end

--
-- This is used by the configuration windows to get the data it needs to
-- populate the display
-- 
function PureTemplates.GetTemplatesForType( type )
	return templateIndexToNameLookup[type], templateNameToIndexLookup[type]
end

--
-- This is used by the manager for each unit frame type for lookup
--
function PureTemplates.GetTemplateByName( type, name )
	if( templatesByName[type] == nil or templatesByName[type][name] == nil ) then return nil end 
	return templatesByName[type][name]
end
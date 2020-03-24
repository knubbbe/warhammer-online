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

if( PureTemplates ~= nil ) then 
	PureTemplates.RegisterTemplate( PureTemplates.Types.PLAYER, 			"PurePlayer_Free", 			PurePlayerUnitFrame, 			L"Pure - Free" ) 
	PureTemplates.RegisterTemplate( PureTemplates.Types.TARGET_FRIENDLY, 	"PureTargetFriendly_Free", 	PureTargetUnitFrame, 			L"Pure - Free" )
	PureTemplates.RegisterTemplate( PureTemplates.Types.TARGET_HOSTILE, 	"PureTargetHostile_Free", 	PureTargetUnitFrame, 			L"Pure - Free" )
	PureTemplates.RegisterTemplate( PureTemplates.Types.GROUP, 				"PureGroup_Free", 			PureGroupUnitFrame, 			L"Pure - Free" )
	PureTemplates.RegisterTemplate( PureTemplates.Types.GROUP_PET, 			"PureGroupPet_Free",		PureGroupPetUnitFrame,	 		L"Pure - Free" )
	PureTemplates.RegisterTemplate( PureTemplates.Types.PLAYER_PET, 		"PurePlayerPet_Free",		PurePlayerPetUnitFrame, 		L"Pure - Free" )
	PureTemplates.RegisterTemplate( PureTemplates.Types.PLAYER_PET_TARGET, 	"PurePlayerPetTarget_Free",	PurePlayerPetTargetUnitFrame, 	L"Pure - Free" )
end
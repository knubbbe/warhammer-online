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

local LSA = LibStub( "LibSharedAssets" )

if not LSA then return end

local textures = 
{
	[1]						= "PureBar",
	[2]						= "FoghladhaBar",
}

local displaynames = 
{
    [1]						= "Pure Bar",
    [2]						= "Foghladha Bar",
}

local dims = 
{
    ["PureBar"]				= { 256, 32 },
    ["FoghladhaBar"]				= { 256, 32 },
}

local tiled = {}

local tags = 
{
    ["PureBar"]				= { statusbar = true },
    ["FoghladhaBar"]		= { statusbar = true },
}

for k,texName in ipairs( textures ) 
do
	local metadata = 
	{
		displayname 	= displaynames[k],
		size 			= dims[texName],
		tiled 			= tiled[texName] or false,
		tags 			= tags[texName],
	}
	
	local result = LSA:RegisterTexture( texName, metadata )
	
	if( not result ) then
		LSA:AddMetadata( texName, { displayname = displaynames[k] } )
	end
end

d( "SharedAssetsPure loaded." )
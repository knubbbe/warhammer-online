
MothHelpers = { }

function MothHelpers.RemoveGenderGrammarMarkup( input ) -- | pattern courtesy of Aiiane

	if type( input ) == "string" then
		pattern = ( "([^^]+)^?([^^]*)" )
	end
	
	if type( input ) == "wstring" then
		pattern = ( L"([^^]+)^?([^^]*)" )
	end
	
	local normal, control = input:match( pattern )
	
	if control then
		return normal
	else
		return input
	end
end

function MothHelpers.DefaultColorConvert( color )
	return color.r, color.g, color.b
end

function MothHelpers.ColorRankToCon( unitRank )

	if unitRank == 0 then
		return
	end
	
	local unitCon = 8
	local playerRank = GameData.Player.level
	
	return DataUtils.GetTargetConColor( unitCon )
end

function MothHelpers.CapitalizeWString( wstr )
	return wstring.upper( wstring.sub( wstr, 1, 1 ) )..wstring.lower( wstring.sub( wstr, 2 ) )
end

function BoolToWString( bool )

	local wstr = L"false"
	
	if bool then
		wstr = L"true"
	end
	
	return wstr
end


function MothHelpers.SizeImageForIcon( cellName, cellType, iconSize, iconId )
	--[[
	local texture, x, y, textureX, textureY, sizeX, sizeY, colorR, colorG, colorB

	texture, textureX, textureY, sizeX, sizeY, colorR, colorG, colorB = GetMapIconData( iconId )
	DynamicImageSetTexture( iconWindow, texture, textureX, textureY )
	WindowSetTintColor( iconWindow, colorR, colorG, colorB )
	
	DynamicImageSetTextureDimensions( iconWindow, sizeX, sizeY )
	
	local xScale = iconSize / sizeX
	local yScale = iconSize / sizeY
	
	if xScale > yScale then
		WindowSetDimensions( iconWindow, iconSize, iconSize * ( xScale / yScale ) )
	else
		WindowSetDimensions( iconWindow, iconSize * ( yScale / xScale ), iconSize )
	end
	--]]
end

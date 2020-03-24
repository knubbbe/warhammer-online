
Moth = { }

Moth.Profile		= MothProfiles[MothSettings.Profile]
Moth.Global			= Moth.Profile.Global
Moth.Structure		= Moth.Profile.Structure
Moth.Settings		= MothSettings
Moth.Helpers		= MothHelpers
Moth.Plugins		= MothPlugins

local old_targetId	= 0
local rowPrefix		= "MothRow"
local cellPrefix	= "MothCell"

function Moth.CreateFramework( Structure )

	local rowNum	= 0
	local cellNum	= 0
	
	for rowIdx = 1, #Structure do
	
		rowNum = rowNum + 1
		local rowName = rowPrefix..rowNum
		
		if DoesWindowExist( rowName ) then
			DestroyWindow( rowName )
		end
		
		CreateWindowFromTemplate( rowName, rowPrefix.."Template", "Moth" )
		WindowSetScale( rowName, WindowGetScale( "Moth" ) )
		WindowClearAnchors( rowName )
		
		if rowIdx == 1 then
			WindowAddAnchor( rowName, "topleft", "MothBackground", "topleft", Moth.Global.xOffset + ( Moth.Global.rowSpacing / 2 ), Moth.Global.yOffset - ( Moth.Global.rowSpacing / 2 ) )
		elseif rowIdx > 1 then
			WindowAddAnchor( rowName, "bottomleft", rowPrefix..( rowNum - 1 ), "topleft", 0, 0 )
		end
		
		for cellIdx = 1, #Structure[rowIdx] do
		
			cellNum = cellNum + 1
			local thisCell = Structure[rowIdx][cellIdx]
			local cellName = cellPrefix..cellNum
			local cellText = cellName.."Text"
			local cellType = thisCell.type
			
			if DoesWindowExist( cellName ) then
				DestroyWindow( cellName )
			end
			
			CreateWindowFromTemplate( cellName, cellPrefix.."Template", "Moth" )
			WindowSetScale( cellName, WindowGetScale( "Moth" ) )
			WindowClearAnchors( cellName )
			
			if cellIdx == 1 then
				WindowAddAnchor( cellName, "left", rowName, "left", 0, 0 )
			elseif cellIdx > 1 then
				WindowAddAnchor( cellName, "right", cellPrefix..( cellNum - 1 ), "left", 0, 0 )
			end
			
			if cellType == "CareerIcon" then
			
				local point, relativePoint, relativeTo, xOffset, yOffset = WindowGetAnchor( cellText, 1 )
				
				WindowClearAnchors( cellText )
				WindowAddAnchor( cellText, point, relativeTo, relativePoint, xOffset, yOffset - 1 )
				-- | WindowSetScale( cellName, 1.01 )
			end
			
			Moth.HideTemplateElements( cellName )
			
			-- | WindowSetAlpha( cellName.."Background", 1 )
		end
		
		-- | WindowSetAlpha( rowName.."Background", 1 )
	end
	
	Moth.HideBorders()
	Moth.HealthBar()
	
	-- | WindowSetScale( "Moth", InterfaceCore.GetResolutionScale() * Moth.Global.scale )
	WindowSetAlpha( "MothBackground", Moth.Global.backgroundAlpha )
	WindowSetShowing( "MothBorder"..Moth.Global.borderStyle, true )
end

function Moth.ShrinkWrap( Structure )

	local rowNum, cellNum = 0, 0
	local finalWidth, finalHeight = 0, 0
	
	for rowIdx = 1, #Structure do
	
		rowNum = rowNum + 1
		local rowName = rowPrefix..rowNum
		local rowWidth, rowHeight = 0, 0
		
		for cellIdx = 1, #Structure[rowIdx] do
		
			cellNum = cellNum + 1
			local thisCell = Structure[rowIdx][cellIdx]
			local cellName = cellPrefix..cellNum
			local cellText = cellName.."Text"
			local cellType = thisCell.type
			local cellIcon = cellType == "NPCIcon"
			
			local cellWidth, cellHeight = WindowGetDimensions( cellName )
			
			if cellWidth > 0 and cellHeight > 0 then
				if not cellIcon then
					cellWidth = cellWidth + Moth.Global.cellSpacing
				end
				rowWidth = rowWidth + cellWidth
				
				if cellHeight > rowHeight then
					-- | if not cellIcon then
						cellHeight = cellHeight + Moth.Global.rowSpacing
					-- | end
					rowHeight = cellHeight
				end
				
				WindowSetDimensions( cellName, cellWidth, rowHeight )
			end
			
			WindowSetShowing( cellName, true )
		end
		
		if rowWidth > finalWidth then
			finalWidth = rowWidth
		end
		
		if rowHeight > 0 then
			WindowSetDimensions( rowName, rowWidth, rowHeight )
		end
		
		finalHeight = finalHeight + rowHeight
	end
	
	rowNum = 0
	
	for rowIdx = 1, #Structure do
	
		rowNum = rowNum + 1
		local rowName = rowPrefix..rowNum
		local _, rowHeight = WindowGetDimensions( rowName )
		WindowSetDimensions( rowName, finalWidth - Moth.Global.xOffset, rowHeight )
	end
	
	if WindowGetShowing( "MothRvRFlagIndicator" ) then
	
		local rvrFlagIndicatorWidth, _ = WindowGetDimensions( "MothRvRFlagIndicator" )
		
		finalWidth = finalWidth + ( rvrFlagIndicatorWidth / 3 ) + Moth.Global.cellSpacing
	end
	
	finalWidth = finalWidth + ( Moth.Global.xOffset * 2 ) - Moth.Global.cellSpacing + ( Moth.Global.rowSpacing )
	finalHeight = finalHeight + ( Moth.Global.yOffset * 2 ) - ( Moth.Global.rowSpacing / 2 )
	
	if finalHeight > finalWidth then
		finalWidth = finalHeight
	end
	
	Moth.Anchor()
	WindowSetDimensions( "Moth", finalWidth, finalHeight )
	WindowSetShowing( "Moth", true )
end

function Moth.Clear( Structure )
	
	WindowSetShowing( "Moth", false )
	WindowSetShowing( "MothHealthBar", false )
	
	local rowNum = 0
	local cellNum = 0
	
	for rowIdx = 1, #Structure do
	
		rowNum = rowNum + 1
		local rowName = rowPrefix..rowNum
		local rowBackground = rowName.."Background"
		
		WindowSetDimensions( rowBackground, 0, 0 )
		WindowSetDimensions( rowName, 0, 0 )
				
		for cellIdx = 1, #Structure[rowIdx] do
		
			cellNum = cellNum + 1
			local cellName = cellPrefix..cellNum
			local cellBackground = cellName.."Background"
			local cellText = cellName.."Text"
			
			WindowSetShowing( cellName, false )
			WindowSetDimensions( cellBackground, 0, 0 )
			WindowSetDimensions( cellName, 0, 0 )
			LabelSetText( cellText, L"" )
			LabelSetTextColor( cellText, 0, 0, 0 )
			Moth.HideTemplateElements( cellName )
		end
		-- | WindowSetShowing( rowName, false )
	end
	
	WindowSetDimensions( "Moth", 123, 123 )
	WindowSetDimensions( "MothHealthBar", 0, 0 )
end

function Moth.Anchor()

	if Moth.Global.anchor ~= "cursor" then
		return
	end
	
	WindowClearAnchors( "Moth" )
	WindowAddAnchor( "Moth", "bottomleft", "CursorWindow", "topleft", 0, 0 )
end

function Moth.SetCellText( cellName, text, color, cellFont )

	local cellText = cellName.."Text"
	
	LabelSetText( cellText, L"" )
	LabelSetText( cellText, text )
	LabelSetTextColor( cellText, color.r, color.g, color.b )
	LabelSetFont( cellText, cellFont, WindowUtils.FONT_DEFAULT_TEXT_LINESPACING )
	
	WindowSetDimensions( cellName, LabelGetTextDimensions( cellText ) )
end

function Moth.SetCellTextIcon( cellName, text, color, cellFont )

	local cellText = cellName.."Text"
	
	LabelSetText( cellText, L"" )
	
	local careerIconId,x,y = GetIconData( Icons.GetCareerIconIDFromCareerLine( text ) )
	DynamicImageSetTexture(cellName.."CareerIcon", careerIconId, 0, 0)
	
	LabelSetTextColor( cellText, color.r, color.g, color.b )
	LabelSetFont( cellText, cellFont, WindowUtils.FONT_DEFAULT_TEXT_LINESPACING )
	
	WindowSetDimensions( cellName, 32, 32 )
end

function Moth.IsAPlayer()

	local targetType	= TargetInfo:UnitType( "mouseovertarget" )
	local isSelf		= SystemData.TargetObjectType.SELF
	local isFriendlyPC	= SystemData.TargetObjectType.ALLY_PLAYER
	local isEnemyPC		= SystemData.TargetObjectType.ENEMY_PLAYER
	
	return targetType == isSelf or targetType == isFriendlyPC or targetType == isEnemyPC
end

function Moth.UpdateName( cellName, cellFont )

	local unitName		= GetStringFormatFromTable( "HUDStrings", StringTables.HUD.LABEL_HUD_MOUSEOVER_TARGET_UNIT_NAME, { TargetInfo:UnitName( "mouseovertarget" ) } )
	local careerLine	= TargetInfo:UnitCareer( "mouseovertarget" )
	local nameColor		= TargetInfo:UnitRelationshipColor( "mouseovertarget" )
	local colorType		= Moth.Global.unitNameColor
	local careerColor	= GuidanceCounselor.Color( careerLine, colorType )
	
	if Moth.IsAPlayer() and Moth.UnitHealth() then
		nameColor = careerColor
	end
	
	Moth.SetCellText( cellName, unitName, nameColor, cellFont )
end

function Moth.UpdateLevel( cellName, cellFont )

	if not Moth.UnitHealth() then
		return
	end
	
	local unitLevel		= TargetInfo:UnitLevel( "mouseovertarget" )
	local unitCon		= TargetInfo:UnitConType( "mouseovertarget" )
	local unitTier		= TargetInfo:UnitTier( "mouseovertarget" )
	local unitDiff		= TargetInfo:UnitDifficultyMask( "mouseovertarget" )
	local isFriendly	= TargetInfo:UnitIsFriendly( "mouseovertarget" )
	local isStatic		= TargetInfo:UnitType( "mouseovertarget" ) == SystemData.TargetObjectType.STATIC
	local isStaticAttackable = TargetInfo:UnitType( "mouseovertarget" ) == SystemData.TargetObjectType.STATIC_ATTACKABLE
	local unitConColor	= DataUtils.GetTargetConColor( unitCon )
	local unitTierDesc	= DataUtils.GetTargetTierDesc( unitTier )
	local profile		= MothSettings.Profile
	local shortTier		= Moth.Global.shortTier
	
	if profile == "Warhammer" then
		
		if isFriendly then
			unitConColor = DefaultColor.XP_COLOR_FILLED
			
		else
			WindowSetTintColor( cellName.."RankBackgroundTint", Moth.Helpers.DefaultColorConvert( unitConColor ) )
			unitConColor = DefaultColor.BLACK
		end
		
		WindowSetShowing( cellName.."RankBackgroundTint", not isFriendly )
		WindowSetShowing( cellName.."RankBackground", true ) -- | and not isStaticAttackable )
	end
	
	if shortTier then
		
		if unitLevel > 0 then
		
			if unitTierDesc ~= "" then
				unitLevel = unitLevel..wstring.sub( unitTierDesc, 1, 1 )
			end
			
			--[[
			if unitDiff ~= 0 then
			
				for idx = 1, unitDiff do
					unitLevel = unitLevel..L"+"
				end
			end
			]]
			
		end
	end
	
	if unitLevel ~= 0 then
		Moth.SetCellText( cellName, L""..unitLevel, unitConColor, cellFont )
	end
end

function Moth.UpdateCon( cellName, cellFont )

	if not Moth.UnitHealth() then
		return
	end
	
	local unitType		= TargetInfo:UnitType( "mouseovertarget" )
	local unitCon		= TargetInfo:UnitConType( "mouseovertarget" )
	local isFriendly	= TargetInfo:UnitIsFriendly( "mouseovertarget" )
	local unitConDesc	= DataUtils.GetTargetConDesc( unitCon )
	local unitConColor	= DataUtils.GetTargetConColor( unitCon )
	local isSelf		= unitType == SystemData.TargetObjectType.SELF
	
	if unitConDesc == L"" and isFriendly then
		unitConDesc = L"Friendly"
	end
	
	if MothSettings.Profile == "Warhammer" then
	
		unitConColor = DefaultColor.WHITE
		
		if isSelf then
			unitConDesc = L""
		end
	end
	
	if unitConDesc ~= L"" then
		Moth.SetCellText( cellName, unitConDesc, unitConColor, cellFont )
	end
end

function Moth.UpdateTier( cellName, cellFont )

	if not Moth.UnitHealth() then
		return
	end
	
	local unitCon		= TargetInfo:UnitConType( "mouseovertarget" )
	local unitTier		= TargetInfo:UnitTier( "mouseovertarget" )
	local unitConColor	= DataUtils.GetTargetConColor( unitCon )
	local unitTierDesc	= Moth.Helpers.CapitalizeWString( DataUtils.GetTargetTierDesc( unitTier ) )
	
	if Moth.Settings.Profile == "Warhammer" then
		unitTierDesc = DataUtils.GetTargetTierDesc( unitTier )
		unitConColor = DefaultColor.WHITE
	end
	
	if unitTierDesc ~= "" then
		Moth.SetCellText( cellName, unitTierDesc, unitConColor, cellFont )
	end
end

function Moth.UpdateTitle( request, cellName, cellFont )

	if not Moth.UnitHealth() then
		return
	end
	
	local targetId		= TargetInfo:UnitEntityId( "mouseovertarget" )
	local npcTitle		= TargetInfo:UnitNPCTitle( "mouseovertarget" )
	local mapPinType	= TargetInfo:UnitMapPinType( "mouseovertarget" )
	local npcTitleColor	= DefaultColor.YELLOW
	local petId			= GameData.Player.Pet.objNum
	
	if npcTitle == L"" then
		npcTitle = GetStringFromTable("MapPointTypes", mapPinType) --GetMapPointTypeName( mapPinType )
	end
	
	if targetId == petId then
		
		if petName == L"Pink Horror" then
			npcTitleColor = DefaultColor.ChatTextColors[113]	-- | Pink
		end
		
		npcTitle = L"Pet"
	end
	
	if npcTitle ~= L"Yourself" and npcTitle ~= L"" then
		Moth.SetCellText( cellName, npcTitle, npcTitleColor, cellFont )
	end
end

local pinToMapFilter = nil;
local function SetupMapFilterPins()
	if (pinToMapFilter == nil) then
		pinToMapFilter = {};
		for index, filterData in ipairs(EA_Window_OverheadMap.mapPinFilters) do
			for index, pinType in ipairs(filterData.pins) do
				pinToMapFilter[pinType] = filterData;
			end
		end
	end
end

function Moth.UpdateNPCIcon( request, cellNum, cellName, iconSize )
	SetupMapFilterPins();
	
	local mapPinType	= TargetInfo:UnitMapPinType( "mouseovertarget" )
	
	local filterData = pinToMapFilter[mapPinType];
	if (not filterData) then return end
	
	local iconWindow = cellName.."NPCIcon"
	
	DynamicImageSetTexture(iconWindow, "map_markers01", 32, 32)
	DynamicImageSetTextureScale(iconWindow, filterData.scale)
	DynamicImageSetTextureSlice(iconWindow, filterData.slice)
	
	--[[
	local iconId		= GetDefaultMapPointIcon( mapPinType )
	
	if iconId == 0 or iconId == 1 or iconId == nil then
		return
	end
	
	Moth.Helpers.SizeImageForIcon( cellName, "NPCIcon", iconSize, iconId )
	--]]
	
	WindowSetDimensions( cellName, WindowGetDimensions( cellName.."NPCIcon" ) )
	WindowSetShowing( cellName.."NPCIcon", true )
end

function Moth.UpdateCareerName( cellName, cellFont )

	if not Moth.IsAPlayer() or not Moth.UnitHealth() then
		return
	end
	
	local careerName = TargetInfo:UnitCareerName( "mouseovertarget" )
	local careerLine = TargetInfo:UnitCareer( "mouseovertarget" )
	local colorType = Moth.Global.careerNameColor
	local careerColor = GuidanceCounselor.Color( careerLine, colorType )
	
	Moth.SetCellText( cellName, careerName, careerColor, cellFont )
end

function Moth.UpdateCareerIcon( cellName, cellFont )

	if not Moth.IsAPlayer() or not Moth.UnitHealth()then
		WindowSetShowing(cellName.."CareerIcon", false)
		return
	end
	
	local careerLine = TargetInfo:UnitCareer( "mouseovertarget" )
	local careerColor = DefaultColor.WHITE
	
	WindowSetShowing(cellName.."CareerIcon", true)
	
	Moth.SetCellTextIcon( cellName, careerLine, careerColor, cellFont )
end

function Moth.ProcessQuestTracking( unitName )

	local unitName = Moth.Helpers.RemoveGenderGrammarMarkup( unitName )
	local questComplete, questName, questObjectiveName, questCurrentCounter, questMaxCounter, questCounterDivider
	
	for _, quest in ipairs( DataUtils.GetQuests() ) do
	
		for _, objective in ipairs( quest.conditions ) do
		
			if wstring.find( objective.name, unitName, 1, true ) or wstring.find( quest.journalDesc, unitName, 1, true ) then
			
				questComplete 		= quest.complete
				questName			= quest.name
				questObjectiveName	= objective.name
				questCurrentCounter	= objective.curCounter
				questMaxCounter		= objective.maxCounter
				questCounterDivider	= L"/"
				
				if questMaxCounter == 0 then
					questMaxCounter = 1
				end
				
				if not questComplete then
					return questName..L":", L""..questCurrentCounter, questCounterDivider, L""..questMaxCounter
				end
			end
		end
	end
end

function Moth.UpdateQuestName( cellName, cellFont )

	if not Moth.UnitHealth() then
		return
	end
	
	local unitName = TargetInfo:UnitName( "mouseovertarget" )
	
	if Moth.ProcessQuestTracking( unitName ) then
	
		local questName, _, _, _ = Moth.ProcessQuestTracking( unitName )
		
		Moth.SetCellText( cellName, questName, DefaultColor.ORANGE, cellFont )
	end
end

function Moth.UpdateQuestCounters( cellName, cellFont )

	if not Moth.UnitHealth() then
		return
	end
	
	local unitName = TargetInfo:UnitName( "mouseovertarget" )
	
	if Moth.ProcessQuestTracking( unitName ) then
	
		local _, questCurrentCounter, questCounterDivider, questMaxCounter = Moth.ProcessQuestTracking( unitName )
		
		Moth.SetCellText( cellName, questCurrentCounter..questCounterDivider..questMaxCounter, DefaultColor.WHITE, cellFont )
	end
end

function Moth.UnitHealth()

	local health	= TargetInfo:UnitHealth( "mouseovertarget" )
	local isAlive	= false
	
	if health > 0 then
		isAlive = health
	end
	
	return isAlive
end

function Moth.UpdateHealth( cellName, cellFont )

	if not Moth.UnitHealth() then
		return
	end
	
	local health		= Moth.UnitHealth()
	local healthColor	= DefaultColor.GREEN
	
	if health <= 100  and health >= 75 then
		healthColor = DefaultColor.GREEN
	elseif health <= 74  and health >= 50 then
		healthColor = DefaultColor.YELLOW
	elseif health <= 49 and health >= 25 then
		healthColor = DefaultColor.ORANGE
	elseif health <= 24 then
		healthColor = DefaultColor.RED 
	end
	
	local isStatic = TargetInfo:UnitType( "mouseovertarget" ) == SystemData.TargetObjectType.STATIC
	
	if not isStatic then
		Moth.SetCellText( cellName, health..L"%", healthColor, cellFont )
	end
end

function Moth.HealthBar()
	
	local point, relativeTo, relativePoint, xOffset, yOffset = WindowGetAnchor( "MothHealthBar", 1 )
	
	if Moth.Global.borderStyle == "off" then
		yOffset = 0
	end
	
	WindowClearAnchors( "MothHealthBar" )
	WindowAddAnchor( "MothHealthBar", "bottomleft", "MothBackground", "topleft", 0, yOffset )
	WindowSetShowing( "MothHealthBar", false )
end

function Moth.UpdateHealthBar()

	local doNotShowHealthBar = Moth.Global.healthBar == "off"
	
	if doNotShowHealthBar then
		WindowSetShowing( "MothHealthBar", false )
		return
	end
	
	local health = Moth.UnitHealth()
	
	if health <= 100  and health >= 75 then
		WindowSetTintColor( "MothHealthBar", Moth.Helpers.DefaultColorConvert( DefaultColor.GREEN ) )
	elseif health <= 74  and health >= 50 then
		WindowSetTintColor( "MothHealthBar", Moth.Helpers.DefaultColorConvert( DefaultColor.YELLOW ) )
	elseif health <= 49 and health >= 25 then
		WindowSetTintColor( "MothHealthBar", Moth.Helpers.DefaultColorConvert( DefaultColor.ORANGE ) )
	elseif health <= 24 then
		WindowSetTintColor( "MothHealthBar", Moth.Helpers.DefaultColorConvert( DefaultColor.RED ) )
	end
	
	local backgroundWidth, _ = WindowGetDimensions( "MothBackground" )
	local healthWidth = backgroundWidth * ( health / 100 )
	
	WindowSetDimensions( "MothHealthBar", healthWidth, Moth.Global.healthBar )
	WindowSetShowing( "MothHealthBar", true )
end

function Moth.ShowDefaultMouseOverTargetWindows( bool )
	WindowSetShowing( "MouseOverTargetWindow", bool )
	WindowSetShowing( "DefaultTooltip", bool )
	
	--[[
	WindowSetShowing( "MouseOverTargetUnitWindow", bool )
	WindowSetShowing( "MouseOverTargetUnitWindowBackground", bool )
	WindowSetShowing( "MouseOverTargetUnitWindowName", bool )
	WindowSetShowing( "MouseOverTargetUnitWindowTierLabel", bool )
	WindowSetShowing( "MouseOverTargetUnitWindowConLabel", bool )
	WindowSetShowing( "MouseOverTargetUnitWindowLevelBackground", bool )
	WindowSetShowing( "MouseOverTargetUnitWindowLevelBackgroundTint", bool )
	WindowSetShowing( "MouseOverTargetUnitWindowLevelText", bool )
	WindowSetShowing( "DefaultTooltip", bool )
	]]
end

function Moth.HideBorders()
	WindowSetShowing( "MothBordertronned", false )
	WindowSetShowing( "MothBorderDark", false )
	WindowSetShowing( "MothBorderGold", false )
	WindowSetShowing( "MothBorderSilver", false )
	WindowSetShowing( "MothBorderTan", false )
	WindowSetShowing( "MothBorderDecorative", false )
end

function Moth.HideTemplateElements( cellName )
	WindowSetShowing( cellName.."MapPinIconSlice", false )
	WindowSetShowing( cellName.."NPCIcon", false )
	WindowSetShowing( cellName.."DiffMaskIcon", false )
	-- | WindowSetShowing( cellName.."CareerIcon", false )
	WindowSetShowing( cellName.."RankBackground", false )
end

function Moth.Populate( Structure )

	local rowNum = 0
	local cellNum = 0
	
	for rowIdx = 1, #Structure do
	
		rowNum = rowNum + 1
		rowName = rowPrefix..rowNum
		
		for cellIdx = 1, #Structure[rowIdx] do
		
			cellNum = cellNum + 1
			local thisCell = Structure[rowIdx][cellIdx]
			local cellName = cellPrefix..cellNum
			local cellText = cellName.."Text"
			local cellType = thisCell.type
			local cellFont = thisCell.font
			local iconSize = thisCell.iconSize
			
			if cellType == "Name" then
				Moth.UpdateName( cellName, cellFont )
				
			elseif cellType == "Level" then
				Moth.UpdateLevel( cellName, cellFont )
				
			elseif cellType == "Con" then
				Moth.UpdateCon( cellName, cellFont )
				
			elseif cellType == "Tier" then
				Moth.UpdateTier( cellName, cellFont )
				
			elseif cellType == "Title" then
				Moth.UpdateTitle( cellType, cellName, cellFont )
				
			elseif cellType == "QuestName" then
				Moth.UpdateQuestName( cellName, cellFont )
				
			elseif cellType == "QuestCounters" then
				Moth.UpdateQuestCounters( cellName, cellFont )
				
			elseif cellType == "Health" then
				Moth.UpdateHealth( cellName, cellFont )
				
			elseif cellType == "CareerName" then
				Moth.UpdateCareerName( cellName, cellFont )
				
			elseif cellType == "Guild" then
				-- | 
				
			elseif cellType == "NPCIcon" then
				Moth.UpdateNPCIcon( cellType, cellNum, cellName, iconSize )
				
			elseif cellType == "DiffMaskIcon" then
				-- | 
				
			elseif cellType == "CareerIcon" then
				Moth.UpdateCareerIcon( cellName, cellFont )
			end
		end
	end
end

function Moth.Initialize()
	CreateWindow( "Moth", true )
	LayoutEditor.RegisterWindow( "Moth", L"Moth", L"Mouse Over Target Hover", false, false, false, nil )
	WindowRegisterEventHandler( "Moth", SystemData.Events.PLAYER_TARGET_UPDATED, "Moth.UpdateTarget" )
	Moth.CreateFramework( Moth.Structure )
end

function Moth.UpdateTarget( targetClassification, targetId, targetType )

	if targetClassification ~= "mouseovertarget" then
		return
	end
	
	Moth.ShowDefaultMouseOverTargetWindows( false )
	
	local isSelf = targetType == SystemData.TargetObjectType.SELF
	
	if isSelf then
	
		old_targetId = targetId
		
		--[[
		if WindowGetShowing( "Moth" ) then
			Moth.Clear( Moth.Structure )
		end
		
		return
		]]
		
	end
	
	local isAlive = Moth.UnitHealth()
	local isNPC = TargetInfo:UnitIsNPC( "mouseovertarget" )
	local isInScenario = GameData.Player.isInScenario
	local isPvPFlagged = TargetInfo:UnitIsPvPFlagged( "mouseovertarget" )
	
	WindowSetShowing( "MothRvRFlagIndicator", isAlive and not isNPC and not isInScenario and isPvPFlagged )
	
	local isUpdatingMouseOverTarget = old_target ~= 0 and targetId ~= 0 and old_targetId == targetId
	local fromRootToMouseOverTarget = old_targetId == 0 and targetId ~= 0
	local fromMouseOverTargetToRoot = old_targetId ~= 0 and targetId == 0
	local fromMouseOverTargetToMouseOverTarget = old_targetId ~= 0 and targetId ~=0 and old_targetId ~= targetId
	
	if isUpdatingMouseOverTarget then
		-- | d( "Current Mouseover Target Update... Updating Moth + Health..." )
		
		--[[
		if not isAlive then
			d( "Current Mouseover Target Has Died... Updating Moth..." )
		end
		]]
		
		old_targetId = targetId
		TargetInfo:UpdateFromClient()
		Moth.Clear( Moth.Structure )
		Moth.Populate( Moth.Structure )
		Moth.ShrinkWrap( Moth.Structure )
	end
	
	if fromMouseOverTargetToMouseOverTarget then
		-- | d( "Mouseover Target <-> Mouseover Target... Rebuilding Moth..." )
		old_targetId = targetId
		TargetInfo:UpdateFromClient()
		Moth.Clear( Moth.Structure )
		Moth.Populate( Moth.Structure )
		Moth.ShrinkWrap( Moth.Structure )
	end
	
	if fromRootToMouseOverTarget then
		-- | d( "Root -> Mouseover Target... Building Moth..." )
		old_targetId = targetId
		TargetInfo:UpdateFromClient()
		Moth.Populate( Moth.Structure )
		Moth.ShrinkWrap( Moth.Structure )
	end
	
	if fromMouseOverTargetToRoot then
		-- | d( "Mouseover Target -> Root... Clearing Moth..." )
		old_targetId = targetId
		Moth.Clear( Moth.Structure )
	end
	
	local isMouseOverTarget = targetId ~= 0
	local isStatic = targetType == SystemData.TargetObjectType.STATIC
	
	if isMouseOverTarget and not isStatic and isAlive then
		Moth.UpdateHealthBar()
	end
end

function Moth.Update( timePassed )
	-- | <3 Aiiance
	if SystemData.MouseOverWindow.name ~= "Root" then
		Moth.Clear( Moth.Structure )
	end
end

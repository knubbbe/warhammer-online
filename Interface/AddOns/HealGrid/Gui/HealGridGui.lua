HealGridGui = {};

HealGridGui.ROOT_WINDOW_WIDTH = 1200;
HealGridGui.ROOT_WINDOW_HEIGHT = 800;

HealGridGui.menuData = {
	[1]  = { label=L"General",
             frameName="HGG_HealGridTabGeneral",
             templateName = "HGG_TabGeneralWindowTemplate",
             objName="HealGridGuiTabGeneral",
             obj=nil
           },
    [2]  = { label=L"HUD",
             frameName="HGG_HealGridTabHUD",
             templateName = "HGG_TabHUDWindowTemplate",
             objName="HealGridGuiTabHUD",
             obj=nil
           },
    [3]  = { label=L"HUD Buffs",
             frameName="HGG_HealGridTabHUDBuffs",
             templateName = "HGG_TabHUDBuffsWindowTemplate",
             objName="HealGridGuiTabHUDBuffs",
             obj=nil
           },
    [4]  = { label=L"Group",
             frameName="HGG_HealGridTabGroup",
             templateName = "HGG_TabGroupWindowTemplate",
             objName="HealGridGuiTabGroup",
             obj=nil
           },
    [5]  = { label=L"Warband",
             frameName="HGG_HealGridTabBattlegroup",
             templateName = "HGG_TabBattlegroupWindowTemplate",
             objName="HealGridGuiTabBattlegroup",
             obj=nil
           },
    [6]  = { label=L"Scenariogroup",
             frameName="HGG_HealGridTabScenariogroup",
             templateName = "HGG_TabScenariogroupWindowTemplate",
             objName="HealGridGuiTabScenariogroup",
             obj=nil
           },
    [7]  = { label=L"Range Scanning",
             frameName="HGG_HealGridTabRangeScan",
             templateName = "HGG_TabRangeScanWindowTemplate",
             objName="HealGridGuiTabRangeScan",
             obj=nil
           },
    [8]  = { label=L"(De)Buff Track",
             frameName="HGG_HealGridTabSpellTrack",
             templateName = "HGG_TabSpellTrackWindowTemplate",
             objName="HealGridGuiTabSpellTrack",
             obj=nil
           },
    [9]  = { label=L"Mouse Click",
             frameName="HGG_HealGridTabMouseClick",
             templateName = "HGG_TabMouseClickWindowTemplate",
             objName="HealGridGuiTabMouseClick",
             obj=nil
           },
    [10] = { label=L"Tooltip",
             frameName="HGG_HealGridTabTooltip",
             templateName = "HGG_TabTooltipWindowTemplate",
             objName="HealGridGuiTabTooltip",
             obj=nil
           },
   };

HealGridGui.menuOrder = {};
HealGridGui.selectedMenuItem = 1;

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGui.Initialize()

	WindowSetDimensions( 'HGG_HealGrid', HealGridGui.ROOT_WINDOW_WIDTH, HealGridGui.ROOT_WINDOW_HEIGHT );
	LabelSetText( "HGG_HealGridTitleBarText", L"HealGrid "..HealGridUtility.WFormatVersion(HealGrid.VERSION) );

	-- initialize the menu
	for i,_ in ipairs(HealGridGui.menuData) do
		CreateWindowFromTemplate( HealGridGui.menuData[i].frameName, HealGridGui.menuData[i].templateName, 'HGG_HealGrid' );
		WindowSetShowing( HealGridGui.menuData[i].frameName, false );

		HealGridGui.menuData[i].obj = _G[HealGridGui.menuData[i].objName];
		HealGridGui.menuData[i].obj.Initialize();

		HealGridGui.menuOrder[i] = i;
	end

	ListBoxSetDisplayOrder( "HGG_HealGridMenu", HealGridGui.menuOrder );

	-- initialize the color selector
	HealGridGuiColorSelect.Initialize();

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGui.Shutdown()

	for i,_ in ipairs(HealGridGui.menuData) do
		HealGridGui.menuData[i].obj.Shutdown();
	end
end

-- =========================================================================================
-- Open
-- =========================================================================================

function HealGridGui.OpenGui()

	WindowSetShowing( "HGG_HealGrid", true );
	HealGridGui.MenuItemSelected( HealGridGui.selectedMenuItem );

end

-- =========================================================================================
-- Close button
-- =========================================================================================

function HealGridGui.CloseGui()

	WindowSetShowing( "HGG_HealGrid", false );

end

-- =========================================================================================
-- Toggle Gui open/close
-- =========================================================================================

function HealGridGui.ToggleGui()

	if ( WindowGetShowing("HGG_HealGrid") ) then
		HealGridGui.CloseGui();
	else
		HealGridGui.OpenGui();
	end

end


-- =========================================================================================
-- Add Conent Pane
-- =========================================================================================

function HealGridGui.AddContentPane( label, frameName, templateName, objName )

	local newIdx;

	table.insert( HealGridGui.menuData, {label=label,frameName=frameName,templateName=templateName,objName=objName} );

	newIdx = #HealGridGui.menuData;

	CreateWindowFromTemplate( frameName, templateName, 'HGG_HealGrid' );
	WindowSetShowing( frameName, false );

	HealGridGui.menuData[newIdx].obj = _G[objName];
--	HealGridGui.menuData[newIdx].obj.Initialize();

	HealGridGui.menuOrder[newIdx] = newIdx;

	ListBoxSetDisplayOrder( "HGG_HealGridMenu", HealGridGui.menuOrder );

end

-- =========================================================================================
-- Populate the menu
-- =========================================================================================

function HealGridGui.PopulateMenu()

	local color;

	-- highlight selected (and reset others)
	for row,menuItem in ipairs(HGG_HealGridMenu.PopulatorIndices) do
		if ( menuItem == HealGridGui.selectedMenuItem ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			-- color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
			color = 'BLACK';
		end
		HealGridUtility.WindowSetTintColor( 'HGG_HealGridMenuRow'..row..'Background', color );
	end

end

-- =========================================================================================
-- Menu Item got selected
-- =========================================================================================

function HealGridGui.MenuItemSelected( menuItem )

	local rowNum; --, menuItem;

	if ( (not menuItem) or menuItem == 0 ) then
		rowNum = WindowGetId( SystemData.ActiveWindow.name );
		menuItem = HGG_HealGridMenu.PopulatorIndices[rowNum];
	end

	WindowSetShowing( HealGridGui.menuData[HealGridGui.selectedMenuItem].frameName, false );

	HealGridGui.selectedMenuItem = menuItem;

	HealGridGui.menuData[HealGridGui.selectedMenuItem].obj.Activate();
	WindowSetShowing( HealGridGui.menuData[HealGridGui.selectedMenuItem].frameName, true );

	HealGridGui.PopulateMenu();

end

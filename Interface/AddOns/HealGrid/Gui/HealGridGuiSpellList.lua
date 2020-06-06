HealGridGuiSpellList = {};

HealGridGuiSpellList.frameName = nil;
HealGridGuiSpellList.listObj = nil;
HealGridGuiSpellList.callBackObj = nil;
HealGridGuiSpellList.callBackFunc = nil;
HealGridGuiSpellList.listData = {};
HealGridGuiSpellList.listOrder = {};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiSpellList.Initialize( frameName, listObj )		-- name of the listWinow; the list

	HealGridGuiSpellList.selectedSpellID = -1;

	-- Labels for Search Buttons
	ButtonSetText( frameName.."SortButtonBarIconButton", L"Icon" );
	ButtonSetText( frameName.."SortButtonBarNameButton", L"Spell-Name" );

	-- colored row backgrouns
	for row=1, listObj.numVisibleRows do
		color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		HealGridUtility.WindowSetTintColor( frameName.."ListRow"..row..'Background', color );
	end

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiSpellList.Shutdown()

end

-- =========================================================================================
-- Get selected spell
-- =========================================================================================

function HealGridGuiSpellList.GetSelectedSpellID()

	return( HealGridGuiSpellList.selectedSpellID );

end

-- =========================================================================================
-- Set Callback
-- =========================================================================================

function HealGridGuiSpellList.SetCallBack( obj, func )

	HealGridGuiSpellList.callBackObj = obj;
	HealGridGuiSpellList.callBackFunc = func;

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiSpellList.Activate( frameName, listObj, selectedSpellID, targetType, abilityType )

	local i = 1;

	if ( abilityType == nil ) then
		abilityType = GameData.AbilityType.STANDARD;
	end

	HealGridGuiSpellList.frameName = frameName;
	HealGridGuiSpellList.listObj = listObj;
	HealGridGuiSpellList.callBackObj = nil;
	HealGridGuiSpellList.callBackFunc = nil;

	HealGridGuiSpellList.selectedSpellID = (selectedSpellID or -1);

	HealGridGuiSpellList.listData = {};
	HealGridGuiSpellList.listOrder = {};

	for k,v in pairs(GetAbilityTable(abilityType)) do
		if ( targetType == nil or targetType == v.targetType ) then
			HealGridGuiSpellList.listData[k] = {};
			HealGridGuiSpellList.listData[k].abilityID = k;
			HealGridGuiSpellList.listData[k].iconNum = v.iconNum;
			HealGridGuiSpellList.listData[k].name = v.name;

			HealGridGuiSpellList.listOrder[i] = k;

			i = i + 1;
		end
	end

	HealGridGuiSpellList.SortList();

end

-- =========================================================================================
-- Sort the list
-- =========================================================================================

function HealGridGuiSpellList.ListCompareData( idx1, idx2 )

	if ( idx2 == nil ) then
		return( false );
	end

	return(  HealGridGuiSpellList.listData[idx1].name < HealGridGuiSpellList.listData[idx2].name );

end

function HealGridGuiSpellList.SortList()

	table.sort( HealGridGuiSpellList.listOrder, HealGridGuiSpellList.ListCompareData );
	ListBoxSetDisplayOrder( HealGridGuiSpellList.frameName.."List", HealGridGuiSpellList.listOrder );

end

-- =========================================================================================
-- Call from the list
-- =========================================================================================

function HealGridGuiSpellList.Populate()

	local color;

	-- highlight selected (and reset others)
	for row,spellID in ipairs(HealGridGuiSpellList.listObj.PopulatorIndices) do
		if ( spellID == HealGridGuiSpellList.selectedSpellID ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		end
		HealGridUtility.WindowSetTintColor( HealGridGuiSpellList.frameName.."ListRow"..row..'Background', color );
	end

end

-- =========================================================================================
-- callback from the list
-- =========================================================================================

function HealGridGuiSpellList.ListSelectRow()

	local rowNum = WindowGetId( SystemData.ActiveWindow.name );
	local dataIndex = HealGridGuiSpellList.listObj.PopulatorIndices[rowNum];		-- index of 'original' list

	HealGridGuiSpellList.selectedSpellID = dataIndex;
	HealGridGuiSpellList.Populate();

	if ( HealGridGuiSpellList.callBackObj ~= nil ) then
		HealGridGuiSpellList.callBackObj[HealGridGuiSpellList.callBackFunc]( HealGridGuiSpellList.selectedSpellID );
	end

end

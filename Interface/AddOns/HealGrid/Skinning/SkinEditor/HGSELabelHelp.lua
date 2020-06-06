HGSELabelHelp = {};

HGSELabelHelp.TAG_LIST_COLUMN_TAG = 1;
HGSELabelHelp.TAG_LIST_COLUMN_DESCRIPTION = 2;

HGSELabelHelp.tagListListData = {};
HGSELabelHelp.tagListListOrder = {};
HGSELabelHelp.tagListSortColumn = HGSELabelHelp.SKIN_TREE_COLUMN_NODE;

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HGSELabelHelp.Initialize()

	local color;

	CreateWindow( "HGSE_LabelHelp", false );

	-- SkinTree/SkinNode: Buttons
	ButtonSetText( "HGSE_LabelHelpSortButtonBarTag", L"Tag" );
	ButtonSetText( "HGSE_LabelHelpSortButtonBarDescription", L"Description" );

	-- form buttons
	ButtonSetText( "HGSE_LabelHelpCloseButton", L"Close" );

	-- SkinTree/SkinNode: colored row backgrouns
	for row=1, HGSE_SkinTreeList.numVisibleRows do
		color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		WindowSetTintColor( "HGSE_LabelHelpTagListRow"..row..'Background', color.r, color.g, color.b );
	end

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HGSELabelHelp.Shutdown()

end

-- =========================================================================================
-- Open
-- =========================================================================================

function HGSELabelHelp.Open()

	HGSELabelHelp.TagListActivate();
 	WindowSetShowing( 'HGSE_LabelHelp', true );

end

-- =========================================================================================
-- Close
-- =========================================================================================

function HGSELabelHelp.Close()

 	WindowSetShowing( 'HGSE_LabelHelp', false );

end

-- =========================================================================================
-- TagList: Activate
-- =========================================================================================

function HGSELabelHelp.TagListActivate()

	local i = 1;

--	HGSELabelHelp.skinTreeSelectedDataIndex = 0;
--	HGSELabelHelp.skinTreeSelectedNodePath = nil;

	HGSELabelHelp.skinTreeListData = {};
	HGSELabelHelp.skinTreeListOrder = {};

	for _,k in ipairs( HealGridTags.tagsGUI ) do
		HGSELabelHelp.tagListListData[i] = {};
		HGSELabelHelp.tagListListData[i].tag = L"["..HealGridTags.tags[k].label..L"]";
		HGSELabelHelp.tagListListData[i].description = HealGridTags.tags[k].description;
		HGSELabelHelp.tagListListData[i].key = k;

		HGSELabelHelp.tagListListOrder[i] = i;
		i = i + 1;
	end

	ListBoxSetDisplayOrder( "HGSE_LabelHelpTagList", HGSELabelHelp.tagListListOrder );

end

-- =========================================================================================
-- TagList: Populate
-- =========================================================================================

function HGSELabelHelp.TagListPopulate()

--[[
	local color;

	if ( HGSE_SkinTreeList.PopulatorIndices == nil ) then
		return;
	end

	for row,idx in ipairs(HGSE_SkinTreeList.PopulatorIndices) do
		-- highlight selected (and reset others)
		if ( idx == HGSELabelHelp.skinTreeSelectedDataIndex ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		end
		HealGridUtility.WindowSetTintColor( "HGSE_SkinTreeListRow"..row..'Background', color );
	end
]]

end

-- =========================================================================================
-- TagList: SelectRow
-- =========================================================================================

function HGSELabelHelp.TagListSelectRow()

--[[
	local rowNum = WindowGetId( SystemData.ActiveWindow.name );
	local dataIndex = HGSE_SkinTreeList.PopulatorIndices[rowNum];						-- index of 'original' list

	HGSELabelHelp.skinTreeSelectedDataIndex = dataIndex;
	HGSELabelHelp.skinTreeSelectedNodePath = HGSELabelHelp.skinTreeListData[HGSELabelHelp.skinTreeSelectedDataIndex].path;

	HGSELabelHelp.SkinTreePopulate();

	HGSELabelHelp.SkinNodeActivate();
]]

end

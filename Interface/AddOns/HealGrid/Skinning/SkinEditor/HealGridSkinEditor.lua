HealGridSkinEditor = {};

HealGridSkinEditor.SKIN_TREE_COLUMN_COLLAPSE = 1;
HealGridSkinEditor.SKIN_TREE_COLUMN_NODE = 2;

HealGridSkinEditor.SKIN_NODE_COLUMN_ATTRIBUTE = 1;
HealGridSkinEditor.SKIN_NODE_COLUMN_VALUE = 2;
HealGridSkinEditor.SKIN_NODE_COLUMN_TYPE = 3;

HealGridSkinEditor.attributeHandlers = {
	['empty']		= 'HGSESkinAttributeEmpty',
	['int']			= 'HGSESkinAttributeInt',
	['uint']		= 'HGSESkinAttributeUInt',
	['font']		= 'HGSESkinAttributeFont',
	['list']		= 'HGSESkinAttributeDropDownList',
	['anchorpoint']	= 'HGSESkinAttributeAnchorPoint',
	['anchor']		= 'HGSESkinAttributeAnchor',
	['string']		= 'HGSESkinAttributeString',
	['wstring']		= 'HGSESkinAttributeWString',
	['color']		= 'HGSESkinAttributeColor',
	['color+']		= 'HGSESkinAttributeColorPlus',
	['label']		= 'HGSESkinAttributeLabel',
	['boolean']		= 'HGSESkinAttributeBoolean',
	['slider']		= 'HGSESkinAttributeSlider',
	['texture']		= 'HGSESkinAttributeTexture',
	['offset']		= 'HGSESkinAttributeOffset',
};

HealGridSkinEditor.skinTreeListData = {};												-- the flattened tree, only nodes, no leaves
HealGridSkinEditor.skinTreeListOrder = {};												-- the order and subselection of what is shown
HealGridSkinEditor.skinTreeSelectedDataIndex = 0;
HealGridSkinEditor.skinTreeSelectedNodePath = nil;
HealGridSkinEditor.skinTreeSortColumn = HealGridSkinEditor.SKIN_TREE_COLUMN_NODE;

HealGridSkinEditor.skinNodeList = {};													-- the complete list of leaf-nodes
HealGridSkinEditor.skinNodeListData = {};												-- the current selection of the list in the window, enriched with skin-values
HealGridSkinEditor.skinNodeListOrder = {};												-- the order of the list
HealGridSkinEditor.skinNodeSelectedDataIndex = 0;
HealGridSkinEditor.skinNodeSortColumn = HealGridSkinEditor.SKIN_NODE_COLUMN_ATTRIBUTE;

HealGridSkinEditor.skinAttributeHandler = HGSESkinAttributeEmpty;						-- which handler is active

HealGridSkinEditor.buttonHandler = nil;													-- Load / Save / Reset button (frames)

HealGridSkinEditor.skinID = HealGridGlobals.DEFAULT_SKIN_ID;

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridSkinEditor.Initialize()

	local color;

	HealGridGui.AddContentPane( L'Skin Editor', 'HGSE_Root', 'HGSE_RootTemplate', 'HealGridSkinEditor' );

	-- SkinTree/SkinNode: Buttons
	ButtonSetText( "HGSE_SkinTreeSortButtonBarCollapseSign", L"Collapse" );
	ButtonSetText( "HGSE_SkinTreeSortButtonBarNode", L"Node" );
	ButtonSetText( "HGSE_SkinTreeSortButtonBarAttributeCount", L"Attr" );

	ButtonSetText( "HGSE_SkinNodeSortButtonBarAttribute", L"Attribute" );
	ButtonSetText( "HGSE_SkinNodeSortButtonBarValue", L"Value" );
	ButtonSetText( "HGSE_SkinNodeSortButtonBarDataType", L"DataType" );

	-- form buttons
	ButtonSetText( "HGSE_RootLoadSkin", L"Load" );
	ButtonSetText( "HGSE_RootResetSkin", L"Defaults" );
	ButtonSetText( "HGSE_RootSaveSkin", L"Save" );

	-- SkinTree/SkinNode: colored row backgrouns
	for row=1, HGSE_SkinTreeList.numVisibleRows do
		color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		WindowSetTintColor( "HGSE_SkinTreeListRow"..row..'Background', color.r, color.g, color.b );
	end

	for row=1, HGSE_SkinNodeList.numVisibleRows do
		color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		WindowSetTintColor( "HGSE_SkinNodeListRow"..row..'Background', color.r, color.g, color.b );
	end

	-- prepare the button panes
	HGSESkinLoad.Initialize();
	HGSESkinSave.Initialize();
	HGSESkinReset.Initialize();
	
	-- prepare the attribute panes
	HGSESkinAttribute.Initialize();
	for k,v in pairs(HealGridSkinEditor.attributeHandlers) do
		_G[v].Initialize();
	end

	-- prepare the label tag help window
	HGSELabelHelp.Initialize();

	-- prepare the lists and load default skin
	HealGridSkinEditor.CreateLists( HealGridSkinDefinition, 0, '' );
	HealGridSkinEditor.LoadSkin( HealGridSkinEditor.skinID, true );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridSkinEditor.Shutdown()

	HGSESkinAttribute.Shutdown();
	for k,v in pairs(HealGridSkinEditor.attributeHandlers) do
		_G[v].Shutdown();
	end

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridSkinEditor.Activate()

	HealGridSkinEditor.SkinTreeActivate();

end

-- =========================================================================================
-- Get Attribute Value
-- =========================================================================================

function HealGridSkinEditor.GetAttributeValue( nodePath, attrIndex )

	local skinPath, attributeValue;

	if ( HealGridSkinEditor.skinNodeList[nodePath][attrIndex] == nil ) then
		return( nil );
	end

	attributeValue = HealGridSkinEditor.skinNodeList[nodePath][attrIndex].modificationValue;
	if ( attributeValue == nil ) then
		skinPath = HealGridSkinEditor.skinNodeList[nodePath][attrIndex].path;
		attributeValue = HealGridSkin.GetSkinValueByPath( HealGridSkinEditor.skinID, skinPath );
	end

	return( attributeValue );

end

-- =========================================================================================
-- Create and prepare lists for Tree and Nodes
-- =========================================================================================

function HealGridSkinEditor.CreateLists( tree, level, path )

    local i = 1;
	local indent = '';
	local j = 1;
	local canCollapse = false;
	local rtc = nil;
	local tableIndex = 0;

    if ( tree._type == 'node' ) then
		indent = '';
		for j=1,level*4 do
			indent = indent .. ' ';
		end
        table.insert( HealGridSkinEditor.skinTreeListData, {node=StringToWString(indent..' '..tree._key), collapseSign=L'+', attributeCount=nil,
                                                            isCollapsed=true, level=level, canCollapse=true, path=path..'.'..tree._key} );
		tableIndex = #HealGridSkinEditor.skinTreeListData;

        while ( tree[i] ) do
			rtc = HealGridSkinEditor.CreateLists( tree[i], level+1, path..'.'..tree._key );
            canCollapse = canCollapse or rtc;
            i = i + 1;
        end

		HealGridSkinEditor.skinTreeListData[tableIndex].canCollapse = canCollapse;

		return( true );
		
    else
        if ( HealGridSkinEditor.skinNodeList[path] == nil ) then
            HealGridSkinEditor.skinNodeList[path] = {};
        end
        table.insert( HealGridSkinEditor.skinNodeList[path], {attribute=tree._key, dataType=tree._type, dataTypeSpec=tree._spec or {},
															  descr=StringToWString(tree._descr), path=path..'.'..tree._key, modificationValue=nil} );

		return( false );
    end

end

-- =========================================================================================
-- SkinTree: Activate
-- =========================================================================================

function HealGridSkinEditor.SkinTreeActivate( keepPanel )

	local collapseLevel = -1;
	local i = 1;

	HealGridSkinEditor.skinTreeSelectedDataIndex = 0;
	HealGridSkinEditor.skinTreeSelectedNodePath = nil;

--	HealGridSkinEditor.skinTreeListData = {};						do NOT reset this
	HealGridSkinEditor.skinTreeListOrder = {};

	for k,v in ipairs( HealGridSkinEditor.skinTreeListData ) do
		-- update/cache the number of attributes per node
		if ( v.path and v.attributeCount == nil ) then
			if ( HealGridSkinEditor.skinNodeList[v.path] ) then
				v.attributeCount = L'' .. #HealGridSkinEditor.skinNodeList[v.path];
			else
				v.attributeCount = L'';
			end
		end
		-- collapse level
		if ( collapseLevel ~= -1 and collapseLevel < v.level ) then
			-- nop;									-- could set isCollapsed to true here
		else
			collapseLevel = -1;
			if ( v.canCollapse == false ) then
				HealGridSkinEditor.skinTreeListData[k].collapseSign = L"";
			elseif ( v.isCollapsed ) then
				collapseLevel = v.level;
				HealGridSkinEditor.skinTreeListData[k].collapseSign = L"+";
			else
				HealGridSkinEditor.skinTreeListData[k].collapseSign = L"-";
			end

			HealGridSkinEditor.skinTreeListOrder[i] = k;
			i = i + 1;
		end
	end

	ListBoxSetDisplayOrder( "HGSE_SkinTreeList", HealGridSkinEditor.skinTreeListOrder );

	HealGridSkinEditor.SkinNodeActivate( keepPanel );

end

-- =========================================================================================
-- SkinTree: Populate
-- =========================================================================================

function HealGridSkinEditor.SkinTreePopulate()

	local color;

	if ( HGSE_SkinTreeList.PopulatorIndices == nil ) then
		return;
	end

	for row,idx in ipairs(HGSE_SkinTreeList.PopulatorIndices) do
		-- highlight selected (and reset others)
		if ( idx == HealGridSkinEditor.skinTreeSelectedDataIndex ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		end
		HealGridUtility.WindowSetTintColor( "HGSE_SkinTreeListRow"..row..'Background', color );
	end

end

-- =========================================================================================
-- SkinTree: SelectRow
-- =========================================================================================

function HealGridSkinEditor.SkinTreeSelectRow()

	local rowNum = WindowGetId( SystemData.ActiveWindow.name );
	local dataIndex = HGSE_SkinTreeList.PopulatorIndices[rowNum];						-- index of 'original' list

	HealGridSkinEditor.skinTreeSelectedDataIndex = dataIndex;
	HealGridSkinEditor.skinTreeSelectedNodePath = HealGridSkinEditor.skinTreeListData[HealGridSkinEditor.skinTreeSelectedDataIndex].path;

	HealGridSkinEditor.SkinTreePopulate();

	HealGridSkinEditor.SkinNodeActivate();

end

-- =========================================================================================
-- SkinTree: CollapseNode
-- =========================================================================================

function HealGridSkinEditor.SkinTreeCollapseNode()

	local rowNum = WindowGetId( SystemData.ActiveWindow.name );
	local dataIndex = HGSE_SkinTreeList.PopulatorIndices[rowNum];						-- index of 'original' list

	HealGridSkinEditor.skinTreeListData[dataIndex].isCollapsed = (not HealGridSkinEditor.skinTreeListData[dataIndex].isCollapsed);

	HealGridSkinEditor.SkinTreeActivate();

end

-- =========================================================================================
-- SkinNode: Activate
-- =========================================================================================

function HealGridSkinEditor.SkinNodeActivate( keepPanel )

	local attrValue;
	local nodePath = HealGridSkinEditor.skinTreeSelectedNodePath;

	HealGridSkinEditor.skinNodeSelectedDataIndex = 0;

	HealGridSkinEditor.skinNodeListData = {};
	HealGridSkinEditor.skinNodeListOrder = {};

	-- ----- only if a node in the tree is selected, otherwise leave empty
	if ( nodePath ~= nil and HealGridSkinEditor.skinNodeList[nodePath] ) then
		for k,v in ipairs( HealGridSkinEditor.skinNodeList[nodePath] ) do
			HealGridSkinEditor.skinNodeListData[k] = {};
			HealGridSkinEditor.skinNodeListData[k].attribute = StringToWString( v.attribute );
			HealGridSkinEditor.skinNodeListData[k].dataType = StringToWString( v.dataType );

			attrValue = HealGridSkinEditor.GetAttributeValue( nodePath, k );
			HealGridSkinEditor.SkinNodeSetListValue( k, attrValue );
	
			HealGridSkinEditor.skinNodeListOrder[k] = k;
		end
	end

	ListBoxSetDisplayOrder( "HGSE_SkinNodeList", HealGridSkinEditor.skinNodeListOrder );

	HealGridSkinEditor.SkinAttributeActivate( keepPanel );

end

-- =========================================================================================
-- SkinNode: SetListValue
-- =========================================================================================

function HealGridSkinEditor.SkinNodeSetListValue( idx, attrValue )

	local dataType = HealGridSkinEditor.skinNodeList[HealGridSkinEditor.skinTreeSelectedNodePath][idx].dataType;
	local attributeHandlerString = HealGridSkinEditor.attributeHandlers[dataType];

	if ( attributeHandlerString ~= nil ) then
		attrValue = _G[attributeHandlerString].ValueToWString( attrValue );
	else
		d( "HealGridSkinEditor.SkinNodeSetListValue(): Unknown dataType "..dataType );
		attributeHandlerString = HealGridSkinEditor.attributeHandlers.empty;
		attrValue = _G[attributeHandlerString].ValueToWString( attrValue );
	end

	HealGridSkinEditor.skinNodeListData[idx].value = attrValue;

end

-- =========================================================================================
-- SkinNode: Populate
-- =========================================================================================

function HealGridSkinEditor.SkinNodePopulate()

	local color;

	if ( HGSE_SkinNodeList.PopulatorIndices == nil ) then
		return;
	end

	for row,idx in ipairs(HGSE_SkinNodeList.PopulatorIndices) do
		-- highlight selected (and reset others)
		if ( idx == HealGridSkinEditor.skinNodeSelectedDataIndex ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		end
		HealGridUtility.WindowSetTintColor( "HGSE_SkinNodeListRow"..row..'Background', color );
	end

end

-- =========================================================================================
-- SkinNode: SelectRow
-- =========================================================================================

function HealGridSkinEditor.SkinNodeSelectRow()

	local rowNum = WindowGetId( SystemData.ActiveWindow.name );
	local dataIndex = HGSE_SkinNodeList.PopulatorIndices[rowNum];						-- index of 'original' list

	HealGridSkinEditor.skinNodeSelectedDataIndex = dataIndex;

	HealGridSkinEditor.SkinNodePopulate();
	HealGridSkinEditor.SkinAttributeActivate();

end

-- =========================================================================================
-- SkinAttribute: Activate
-- =========================================================================================

function HealGridSkinEditor.SkinAttributeActivate( keepPanel )

	local attributeHanderString = nil;
	local attrValue = nil;
	local dataType = 'empty';
	local dataTypeSpec = {};
	local path = HealGridSkinEditor.skinTreeSelectedNodePath;
	local attrIndex = HealGridSkinEditor.skinNodeSelectedDataIndex;

	if ( path ~= nil and attrIndex ~= 0 ) then
		dataType = HealGridSkinEditor.skinNodeList[path][attrIndex].dataType;
		dataTypeSpec = HealGridSkinEditor.skinNodeList[path][attrIndex].dataTypeSpec;
		attrValue = HealGridSkinEditor.GetAttributeValue( path, attrIndex );
	end

	if ( HealGridSkinEditor.buttonHandler and (not keepPanel) ) then
		HealGridSkinEditor.buttonHandler.DeActivate();
		HealGridSkinEditor.buttonHandler = nil;
	end

	HealGridSkinEditor.skinAttributeHandler.DeActivate();

	attributeHandlerString = HealGridSkinEditor.attributeHandlers[dataType];
	HealGridSkinEditor.skinAttributeHandler = _G[attributeHandlerString];

	if ( not keepPanel ) then
		HealGridSkinEditor.skinAttributeHandler.Activate( path, attrIndex, attrValue, dataTypeSpec );
	end

end

-- =========================================================================================
-- callback from form: Reset Attribute (Defaults)
-- =========================================================================================

function HealGridSkinEditor.ResetAttribute()

	local attributeValue = nil;
	local attributePath = nil;
	local nodePath = HealGridSkinEditor.skinTreeSelectedNodePath;
	local attrIndex = HealGridSkinEditor.skinNodeSelectedDataIndex;

	if ( nodePath == nil or attrIndex == 0 ) then
		return;
	end

	attributePath = HealGridSkinEditor.skinNodeList[nodePath][attrIndex].path;
	attributeValue = HealGridSkin.GetSkinValueRawByPath( HealGridSkinEditor.skinID, attributePath );
	HealGridSkinEditor.skinNodeList[nodePath][attrIndex].modificationValue = attributeValue;
	HealGridSkinEditor.SkinNodeSetListValue( HealGridSkinEditor.skinNodeSelectedDataIndex, attributeValue );
	ListBoxSetDisplayOrder( "HGSE_SkinNodeList", HealGridSkinEditor.skinNodeListOrder );

	HealGridSkinEditor.SkinAttributeActivate();

end

-- =========================================================================================
-- callback from form: Set Attribute
-- =========================================================================================

function HealGridSkinEditor.SetAttribute()

	local editable = false;
	local value = nil;
	local nodePath = HealGridSkinEditor.skinTreeSelectedNodePath;
	local attrIndex = HealGridSkinEditor.skinNodeSelectedDataIndex;

	if ( nodePath == nil or attrIndex == 0 ) then
		return;
	end

	editable = HealGridSkinEditor.skinNodeList[nodePath][attrIndex].dataTypeSpec.editable;

	if ( (editable == nil or editable == true) and HealGridSkinEditor.skinAttributeHandler.CheckValue() == true ) then
		value = HealGridSkinEditor.skinAttributeHandler.GetValue();
		HealGridSkinEditor.skinNodeList[nodePath][attrIndex].modificationValue = value;
		HealGridSkinEditor.SkinNodeSetListValue( HealGridSkinEditor.skinNodeSelectedDataIndex, value );
		ListBoxSetDisplayOrder( "HGSE_SkinNodeList", HealGridSkinEditor.skinNodeListOrder );
	end

	HealGridSkinEditor.SkinAttributeActivate();

end

-- =========================================================================================
-- callback from form: Load Skin
-- =========================================================================================

function HealGridSkinEditor.OpenLoadSkin()

	if ( HealGridSkinEditor.buttonHandler ) then
		HealGridSkinEditor.buttonHandler.DeActivate();
	end
	HealGridSkinEditor.skinAttributeHandler.DeActivate();

	HealGridSkinEditor.buttonHandler = HGSESkinLoad;
	HealGridSkinEditor.buttonHandler.Activate();

end

function HealGridSkinEditor.LoadSkin( skinID, silent )

	local skinNodePath, attrIdx, attr, modificationValue;
	local count = 1;
	local total = 1;

	HGSESkinLoad.Start( silent );

	-- --- store global and set title
	HealGridSkinEditor.skinID = skinID;

	-- --- set the "modificationValue" in the leaves
	HGSESkinLoad.SectionStart( 'Mods', silent );
	for skinNodePath,_ in pairs(HealGridSkinEditor.skinNodeList) do
		for attrIdx,attr in pairs(HealGridSkinEditor.skinNodeList[skinNodePath]) do
			modificationValue = HealGridSkin.GetSkinModificationValueByPath( HealGridSkinEditor.skinID, attr.path );
			HealGridSkinEditor.skinNodeList[skinNodePath][attrIdx].modificationValue = modificationValue;

			if ( modificationValue ~= nil ) then
				count = count + 1;
			end
			total = total + 1;
			HGSESkinLoad.SectionUpdate( 'Mods', count, total, false );
		end
	end
	HGSESkinLoad.SectionEnd( 'Mods', silent );

	HGSESkinLoad.End( silent );

--	HealGridSkinEditor.skinTreeListData[1].node = StringToWString( skinID );
	HealGridSkinEditor.skinTreeListData[1].node = HealGridSkin.GetSkinValue( skinID, 'skin', 'name' );
	LabelSetText( "HGSE_RootSkinName", L"Skin: "..HealGridSkin.GetSkinValue(skinID,'skin','name') );

	HealGridSkinEditor.SkinTreeActivate( true );

end

-- =========================================================================================
-- callback from form: Save Skin
-- =========================================================================================

function HealGridSkinEditor.OpenSaveSkin()

	if ( HealGridSkinEditor.buttonHandler ) then
		HealGridSkinEditor.buttonHandler.DeActivate();
	end
	HealGridSkinEditor.skinAttributeHandler.DeActivate();

	HealGridSkinEditor.buttonHandler = HGSESkinSave;
	HealGridSkinEditor.buttonHandler.Activate();

end

function HealGridSkinEditor.SaveSkin()

	local skinNodePath, attrIdx, attr;
	local total = 0;

	-- --- check if a skin is loaded
	if ( HealGridSkinEditor.skinID == nil ) then
		return;
	end

	HGSESkinSave.Start();

	-- --- remove the whole modification
	HGSESkinSave.SectionStart( 'Wipe' );
	HealGridSkin.RemoveSkinModification( HealGridSkinEditor.skinID );
	HGSESkinSave.SectionEnd( 'Wipe' );

	-- --- and create all values new
	HGSESkinSave.SectionStart( 'Mods' );

	for skinNodePath,_ in pairs(HealGridSkinEditor.skinNodeList) do
		for attrIdx,attr in pairs(HealGridSkinEditor.skinNodeList[skinNodePath]) do
			if ( attr.modificationValue ~= nil ) then
				HealGridSkin.ModifySkinValueByPath( HealGridSkinEditor.skinID, attr.modificationValue, attr.path );
			end
			total = total + 1;
			HGSESkinSave.SectionUpdate( 'Mods', total );
		end
	end

	HGSESkinSave.SectionEnd( 'Mods' );

	-- --- apply changes to current skin, if neccessary
	HGSESkinSave.SectionStart( 'Apply' );

	if ( HealGridHUDMain.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridHUDMain.Instance():ApplySkin();
	end
	HGSESkinSave.SectionUpdate( 'Apply', 1 );

	if ( HealGridGroup.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridGroup.Instance():ApplySkin();
	end
	HGSESkinSave.SectionUpdate( 'Apply', 2 );

	if ( HealGridBattlegroup.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridBattlegroup.Instance():ApplySkin();
	end
	HGSESkinSave.SectionUpdate( 'Apply', 3 );

	if ( HealGridScenariogroup.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridScenariogroup.Instance():ApplySkin();
	end
	HGSESkinSave.SectionUpdate( 'Apply', 4 );

	HGSESkinSave.SectionEnd( 'Apply' );

	HGSESkinSave.End();

end

-- =========================================================================================
-- callback from form: Reset Skin (to defaults)
-- =========================================================================================

function HealGridSkinEditor.OpenResetSkin()

	if ( HealGridSkinEditor.buttonHandler ) then
		HealGridSkinEditor.buttonHandler.DeActivate();
	end
	HealGridSkinEditor.skinAttributeHandler.DeActivate();

	HealGridSkinEditor.buttonHandler = HGSESkinReset;
	HealGridSkinEditor.buttonHandler.Activate();

end

function HealGridSkinEditor.ResetSkin()

	local skinNodePath, attrIdx;

	-- --- check if a skin is loaded
	if ( HealGridSkinEditor.skinID == nil ) then
		return;
	end

	HGSESkinReset.Start();

	-- --- remove the skin
	HGSESkinReset.SectionStart( 'Clear' );
	HealGridSkin.RemoveSkinModification( HealGridSkinEditor.skinID );
	HGSESkinReset.SectionEnd( 'Clear' );

	-- --- reload/wipe the values
	HGSESkinReset.SectionStart( 'Wipe' );
	for skinNodePath,_ in pairs(HealGridSkinEditor.skinNodeList) do
		for attrIdx,_ in pairs(HealGridSkinEditor.skinNodeList[skinNodePath]) do
			HealGridSkinEditor.skinNodeList[skinNodePath][attrIdx].modificationValue = nil;
		end
	end
	HGSESkinReset.SectionEnd( 'Wipe' );

	-- --- apply changes to current skin, if neccessary
	HGSESkinReset.SectionStart( 'Apply' );

	if ( HealGridHUDMain.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridHUDMain.Instance():ApplySkin();
	end
	HGSESkinReset.SectionUpdate( 'Apply', 1 );

	if ( HealGridGroup.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridGroup.Instance():ApplySkin();
	end
	HGSESkinReset.SectionUpdate( 'Apply', 2 );

	if ( HealGridBattlegroup.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridBattlegroup.Instance():ApplySkin();
	end
	HGSESkinReset.SectionUpdate( 'Apply', 3 );

	if ( HealGridScenariogroup.Instance():GetSkinID() == HealGridSkinEditor.skinID ) then
		HealGridScenariogroup.Instance():ApplySkin();
	end
	HGSESkinReset.SectionUpdate( 'Apply', 4 );

	HGSESkinReset.SectionEnd( 'Apply' );

	HGSESkinReset.End();

	HealGridSkinEditor.SkinTreeActivate( true );

end

-- =========================================================================================
-- Helper: OpenColorPicker
-- =========================================================================================

function HealGridSkinEditor.EditColor()

	if ( HealGridSkinEditor.skinAttributeHandler and HealGridSkinEditor.skinAttributeHandler.EditColor ) then
		HealGridSkinEditor.skinAttributeHandler.EditColor();
	end

end

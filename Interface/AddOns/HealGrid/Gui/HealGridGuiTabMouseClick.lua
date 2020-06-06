HealGridGuiTabMouseClick = {};

HealGridGuiTabMouseClick.SORT_COLUMN_FRAME_TYPE = 1;
HealGridGuiTabMouseClick.SORT_COLUMN_TARGET_TYPE = 2;
HealGridGuiTabMouseClick.SORT_COLUMN_MOUSE_BUTTON = 3;
HealGridGuiTabMouseClick.SORT_COLUMN_MODIFIER_KEY = 4;
HealGridGuiTabMouseClick.SORT_COLUMN_ACTION = 5;
HealGridGuiTabMouseClick.SORT_COLUMN_ACTION_DETAIL = 6;
HealGridGuiTabMouseClick.MAX_SORT_COLUMN = 6;

HealGridGuiTabMouseClick.listData = {};
HealGridGuiTabMouseClick.listOrder = {};
HealGridGuiTabMouseClick.currentDataIndex = 0;
HealGridGuiTabMouseClick.sortColumn = HealGridGuiTabMouseClick.SORT_COLUMN_FRAME_TYPE;

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabMouseClick.Initialize()

	local color;

	-- Labels for Action Buttons
	ButtonSetText( "HGG_HealGridTabMouseClickListAdd", L"New" );
	ButtonSetText( "HGG_HealGridTabMouseClickListRemove", L"Remove" );

	-- Labels for Search Buttons
	ButtonSetText( "HGG_HealGridTabMouseClickSortButtonBarFrameTypeButton", L"Frame" );
	ButtonSetText( "HGG_HealGridTabMouseClickSortButtonBarTargetTypeButton", L"Target" );
	ButtonSetText( "HGG_HealGridTabMouseClickSortButtonBarMouseButtonButton", L"Mouse Button" );
	ButtonSetText( "HGG_HealGridTabMouseClickSortButtonBarModifierKeyButton", L"Modifier Key" );
	ButtonSetText( "HGG_HealGridTabMouseClickSortButtonBarActionButton", L"Action" );
	ButtonSetText( "HGG_HealGridTabMouseClickSortButtonBarActionDetailButton", L"Info" );

	-- colored row backgrouns
	for row=1, HGG_HealGridTabMouseClickList.numVisibleRows do
		color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		HealGridUtility.WindowSetTintColor( "HGG_HealGridTabMouseClickListRow"..row..'Background', color );
	end

	-- Edit section
	LabelSetText( "HGG_HealGridTabMouseClickComboBoxFrameTypeLabel", L"Frame Type" );
	HealGridMouseClick.ComboBoxFrameTypeInitChoices( "HGG_HealGridTabMouseClickComboBoxFrameType" );

	LabelSetText( "HGG_HealGridTabMouseClickComboBoxTargetTypeLabel", L"Target Type" );
	HealGridMouseClick.ComboBoxTargetTypeInitChoices( "HGG_HealGridTabMouseClickComboBoxTargetType" );

	LabelSetText( "HGG_HealGridTabMouseClickComboBoxMouseButtonLabel", L"Mouse Button" );
	HealGridMouseClick.ComboBoxMouseButtonInitChoices( "HGG_HealGridTabMouseClickComboBoxMouseButton" );

	LabelSetText( "HGG_HealGridTabMouseClickModifierKeyLabel", L"Modifier Key" );
	LabelSetText( "HGG_HealGridTabMouseClickCheckButtonModifierKeyShiftLabel", L"Shift" );
	ButtonSetStayDownFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyShiftButton", true );
	LabelSetText( "HGG_HealGridTabMouseClickCheckButtonModifierKeyCtrlLabel", L"Ctrl" );
	ButtonSetStayDownFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyCtrlButton", true );
	LabelSetText( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAltLabel", L"Alt" );
	ButtonSetStayDownFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAltButton", true );
	LabelSetText( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAnyLabel", L"doesn't matter" );
	ButtonSetStayDownFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAnyButton", true );

	LabelSetText( "HGG_HealGridTabMouseClickComboBoxActionLabel", L"Action" );
	HealGridMouseClick.ComboBoxActionInitChoices( "HGG_HealGridTabMouseClickComboBoxAction" );

	LabelSetText( "HGG_HealGridTabMouseClickActionDetailLabel", L"Action Detail" );

	ButtonSetText( "HGG_HealGridTabMouseClickEditCommit", L"Commit" );

	-- Initialize the spell list
	HealGridGuiSpellList.Initialize( "HGG_HealGridTabMouseClickActionDetailSpellList", HGG_HealGridTabMouseClickActionDetailSpellListList );

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabMouseClick.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabMouseClick.Activate()

	HealGridGuiTabMouseClick.ListUnselectRow();
	HealGridGuiTabMouseClick.ActivateList();

	HealGridGuiSpellList.Activate( "HGG_HealGridTabMouseClickActionDetailSpellList", HGG_HealGridTabMouseClickActionDetailSpellListList );

end

-- =========================================================================================
-- Mouse Click List
-- =========================================================================================

function HealGridGuiTabMouseClick.ActivateList()

	local i = 1;

	HealGridGuiTabMouseClick.listData = {};
	HealGridGuiTabMouseClick.listOrder = {};

	for k,v in pairs( HealGridSettings[HealGrid.settingsIndex].mouseClickMap ) do
		HealGridGuiTabMouseClick.listData[i] = {};
		HealGridGuiTabMouseClick.listData[i].mouseClickMapKey = k;
		HealGridGuiTabMouseClick.listData[i].frameType = HealGridMouseClick.GetFrameTypeLabel( k );
		HealGridGuiTabMouseClick.listData[i].targetType = HealGridMouseClick.GetTargetTypeLabel( k );
		HealGridGuiTabMouseClick.listData[i].mouseButton = HealGridMouseClick.GetMouseButtonLabel( k );
		HealGridGuiTabMouseClick.listData[i].modifierKey = HealGridMouseClick.GetModifierKeyLabel( k );
		HealGridGuiTabMouseClick.listData[i].action = HealGridMouseClick.GetActionLabel( k );
		HealGridGuiTabMouseClick.listData[i].actionDetail = HealGridMouseClick.GetActionDetailLabel( k );

		HealGridGuiTabMouseClick.listOrder[i] = i;

		i = i + 1;
	end

	HealGridGuiTabMouseClick.SortList();

end

-- =========================================================================================
-- Call from the list to populate it
-- =========================================================================================

function HealGridGuiTabMouseClick.Populate()

	local color;

	if ( HGG_HealGridTabMouseClickList.PopulatorIndices == nil ) then
		return;
	end

	for row,idx in ipairs(HGG_HealGridTabMouseClickList.PopulatorIndices) do
		-- highlight selected (and reset others)
		if ( idx == HealGridGuiTabMouseClick.currentDataIndex ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		end
		HealGridUtility.WindowSetTintColor( "HGG_HealGridTabMouseClickListRow"..row..'Background', color );
	end

end

-- =========================================================================================
-- Sort the list
-- =========================================================================================

function HealGridGuiTabMouseClick.ListCompareData( idx1, idx2 )

	local key1, key2;

	if ( idx2 == nil ) then
		return( false );
	end

	if ( HealGridGuiTabMouseClick.listData[idx1] ~= nil ) then
 		key1 = HealGridGuiTabMouseClick.listData[idx1].mouseClickMapKey;
	end

	if ( HealGridGuiTabMouseClick.listData[idx2] ~= nil ) then
 		key2 = HealGridGuiTabMouseClick.listData[idx2].mouseClickMapKey;
	end

	if ( key1 == nil or key2 == nil ) then
		return( false );
	end

	-- ----- Sort by FrameType ----------
	if ( HealGridGuiTabMouseClick.sortColumn == HealGridGuiTabMouseClick.SORT_COLUMN_FRAME_TYPE ) then
		return( HealGridMouseClick.CompareFrameType(key1,key2) );

	-- ----- Sort by TargetType ----------
	elseif ( HealGridGuiTabMouseClick.sortColumn == HealGridGuiTabMouseClick.SORT_COLUMN_TARGET_TYPE ) then
		return( HealGridMouseClick.CompareTargetType(key1,key2) );

	-- ----- Sort by MouseButton ----------
	elseif ( HealGridGuiTabMouseClick.sortColumn == HealGridGuiTabMouseClick.SORT_COLUMN_MOUSE_BUTTON ) then
		return( HealGridMouseClick.CompareMouseButton(key1,key2) );

	-- ----- Sort by ModifierKey ----------
	elseif ( HealGridGuiTabMouseClick.sortColumn == HealGridGuiTabMouseClick.SORT_COLUMN_MODIFIER_KEY ) then
		return( HealGridMouseClick.CompareModifierKey(key1,key2) );

	-- ----- Sort by Action ---------------
	elseif ( HealGridGuiTabMouseClick.sortColumn == HealGridGuiTabMouseClick.SORT_COLUMN_ACTION ) then
		return( HealGridMouseClick.CompareAction(key1,key2) );

	-- ----- Sort by ActionDetail ---------
	elseif ( HealGridGuiTabMouseClick.sortColumn == HealGridGuiTabMouseClick.SORT_COLUMN_ACTION_DETAIL ) then
		return( HealGridMouseClick.CompareActionDetail(key1,key2) );
	
	-- ----- Something else ---------------
	else
		return( false );
	end

end

function HealGridGuiTabMouseClick.SortList()

	table.sort( HealGridGuiTabMouseClick.listOrder, HealGridGuiTabMouseClick.ListCompareData );
	ListBoxSetDisplayOrder( "HGG_HealGridTabMouseClickList", HealGridGuiTabMouseClick.listOrder );

	-- SocialWindowTabFriends.UpdateSortButtons()					TODO (the arrows)

end

function HealGridGuiTabMouseClick.OnSortList()

	HealGridGuiTabMouseClick.sortColumn = WindowGetId( SystemData.ActiveWindow.name );
	HealGridGuiTabMouseClick.SortList();

end

-- =========================================================================================
-- Buff List, row selected
-- =========================================================================================

function HealGridGuiTabMouseClick.ListSelectRow()

	local rowNum = WindowGetId( SystemData.ActiveWindow.name );
	local dataIndex = HGG_HealGridTabMouseClickList.PopulatorIndices[rowNum];		-- index of 'original' list
	local mouseClickMapKey = HealGridGuiTabMouseClick.listData[dataIndex].mouseClickMapKey;
	local action = HealGridMouseClick.GetAction( mouseClickMapKey );

	HealGridGuiTabMouseClick.currentDataIndex = dataIndex;

	HealGridMouseClick.ComboBoxFrameTypeActivateChoices( "HGG_HealGridTabMouseClickComboBoxFrameType", HealGridMouseClick.GetFrameType(mouseClickMapKey) );

	HealGridMouseClick.ComboBoxTargetTypeActivateChoices( "HGG_HealGridTabMouseClickComboBoxTargetType", HealGridMouseClick.GetTargetType(mouseClickMapKey) );

	HealGridMouseClick.ComboBoxMouseButtonActivateChoices( "HGG_HealGridTabMouseClickComboBoxMouseButton", HealGridMouseClick.GetMouseButton(mouseClickMapKey) );

	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyShiftButton", HealGridMouseClick.NeedModifierKey(mouseClickMapKey,'SHIFT') );
	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyCtrlButton", HealGridMouseClick.NeedModifierKey(mouseClickMapKey,'CTRL') );
	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAltButton", HealGridMouseClick.NeedModifierKey(mouseClickMapKey,'ALT') );
	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAnyButton", HealGridMouseClick.IsAnyKey(mouseClickMapKey) );

	HealGridMouseClick.ComboBoxActionActivateChoices( "HGG_HealGridTabMouseClickComboBoxAction", action );

	HealGridGuiTabMouseClick.ActionChanged( nil, action, HealGridMouseClick.GetActionDetail(mouseClickMapKey) );

	ButtonSetText( "HGG_HealGridTabMouseClickEditCommit", L"Change" );

	ButtonSetDisabledFlag( "HGG_HealGridTabMouseClickListRemove", false );

	WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", false );

	HealGridGuiTabMouseClick.Populate();

end

-- =========================================================================================
-- Buff List, unselect the row
-- =========================================================================================

function HealGridGuiTabMouseClick.ListUnselectRow()

	HealGridGuiTabMouseClick.currentDataIndex = 0;

	HealGridMouseClick.ComboBoxFrameTypeActivateChoices( "HGG_HealGridTabMouseClickComboBoxFrameType", nil );

	HealGridMouseClick.ComboBoxTargetTypeActivateChoices( "HGG_HealGridTabMouseClickComboBoxTargetType", nil );

	HealGridMouseClick.ComboBoxMouseButtonActivateChoices( "HGG_HealGridTabMouseClickComboBoxMouseButton", nil );

	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyShiftButton", false );
	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyCtrlButton", false );
	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAltButton", false );
	ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAnyButton", false );

	HealGridMouseClick.ComboBoxActionActivateChoices( "HGG_HealGridTabMouseClickComboBoxAction", nil );

	WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailLabel", false );
	WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailEdit", false );
	WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailSpellList", false );
	WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailComboBox", false );

	ButtonSetText( "HGG_HealGridTabMouseClickEditCommit", L"Add" );

	ButtonSetDisabledFlag( "HGG_HealGridTabMouseClickListRemove", true );

	WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", false );

	HealGridGuiTabMouseClick.Populate();

end

-- =========================================================================================
-- Buff List, remove the selected row
-- =========================================================================================

function HealGridGuiTabMouseClick.ListRemoveRow()

	local currentMouseClickMapKey;

	if ( HealGridGuiTabMouseClick.currentDataIndex == 0 ) then
		return;
	end

	currentMouseClickMapKey = HealGridGuiTabMouseClick.listData[HealGridGuiTabMouseClick.currentDataIndex].mouseClickMapKey;
	HealGridMouseClick.Remove( currentMouseClickMapKey );

	HealGridGuiTabMouseClick.Activate();

end

-- =========================================================================================
-- Commit the addition/changes
-- =========================================================================================

function HealGridGuiTabMouseClick.EditCommit()

	local abilityID;
	local currentMouseClickMapKey, newMouseClickMapKey, modifierKey;
	local frameType = HealGridMouseClick.ComboBoxFrameTypeGetSelected( "HGG_HealGridTabMouseClickComboBoxFrameType" );
	local targetType = HealGridMouseClick.ComboBoxTargetTypeGetSelected( "HGG_HealGridTabMouseClickComboBoxTargetType" );
	local mouseButton = HealGridMouseClick.ComboBoxMouseButtonGetSelected( "HGG_HealGridTabMouseClickComboBoxMouseButton" );
	local modifierKeyShift = ButtonGetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyShiftButton" );
	local modifierKeyCtrl = ButtonGetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyCtrlButton" );
	local modifierKeyAlt = ButtonGetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAltButton" );
	local modifierKeyAny = ButtonGetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAnyButton" );
	local action = HealGridMouseClick.ComboBoxActionGetSelected( "HGG_HealGridTabMouseClickComboBoxAction" );
	local actionDetail = nil;

	-- check valid frameType
	if ( frameType == nil ) then
		LabelSetText( "HGG_HealGridTabMouseClickEditErrorLabel", L"You must select a frame type" );
		WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", true );
		return;
	end

	-- check valid targetType
	if ( targetType == nil ) then
		LabelSetText( "HGG_HealGridTabMouseClickEditErrorLabel", L"You must select a target type" );
		WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", true );
		return;
	end

	-- check valid mouseButton
	if ( mouseButton == nil ) then
		LabelSetText( "HGG_HealGridTabMouseClickEditErrorLabel", L"You must select a mouse button" );
		WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", true );
		return;
	end

	-- check valid action
	if ( action == nil ) then
		LabelSetText( "HGG_HealGridTabMouseClickEditErrorLabel", L"You must select an action" );
		WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", true );
		return;
	end

	if ( HealGridMouseClick.ActionIsLmbOnly(action) and mouseButton ~= 'LMB' ) then
		LabelSetText( "HGG_HealGridTabMouseClickEditErrorLabel", L"The WAR API only allows left button for this action" );
		WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", true );
		return;
	end

	-- get the action Detail
	if ( action == 'ABILITY' ) then
		actionDetail = HealGridGuiSpellList.GetSelectedSpellID();
	elseif ( action == 'PETABILITY' ) then
		actionDetail = HealGridGuiSpellList.GetSelectedSpellID();
	elseif ( action == 'MORALE' ) then
		actionDetail = HealGridMouseClick.ComboBoxMoraleGetSelected( "HGG_HealGridTabMouseClickActionDetailComboBox" );
	elseif ( action == 'COMMANDPET' ) then
		actionDetail = HealGridMouseClick.ComboBoxCommandPetGetSelected( "HGG_HealGridTabMouseClickActionDetailComboBox" );
	elseif ( action == 'SLASHCMD' ) then
		actionDetail = TextEditBoxGetText( "HGG_HealGridTabMouseClickActionDetailEdit" );
	else
		actionDetail = nil;
	end

--d( 'actionDetail = '..(actionDetail or 'NIL') );

	-- check valid actionDetail
	if ( HealGridMouseClick.actions[action].needDetail and (actionDetail == nil or actionDetail == L"" or tonumber(actionDetail) < 0) ) then
		LabelSetText( "HGG_HealGridTabMouseClickEditErrorLabel", L"You must give action details" );
		WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", true );
		return;
	end

	-- calculate new data
	modifierKey = HealGridMouseClick.BuildModifierKey( modifierKeyShift, modifierKeyCtrl, modifierKeyAlt, modifierKeyAny );
	newMouseClickMapKey = HealGridMouseClick.BuildKey( frameType, targetType, mouseButton, modifierKey );
	if ( HealGridGuiTabMouseClick.currentDataIndex == 0 ) then
		currentMouseClickMapKey = nil;
	else
		currentMouseClickMapKey = HealGridGuiTabMouseClick.listData[HealGridGuiTabMouseClick.currentDataIndex].mouseClickMapKey;
	end

	-- already existing?
	if ( HealGridMouseClick.DoesKeyExist(newMouseClickMapKey) and (currentMouseClickMapKey == nil or currentMouseClickMapKey ~= newMouseClickMapKey) ) then
		LabelSetText( "HGG_HealGridTabMouseClickEditErrorLabel", L"This combination is already in use" );
		WindowSetShowing( "HGG_HealGridTabMouseClickEditErrorLabel", true );
		return;
	end

	-- all checks done, now update/add it
	if ( currentMouseClickMapKey ~= nil and currentMouseClickMapKey ~= newMouseClickMapKey ) then					-- got new ID, remove old one
		HealGridMouseClick.Remove( currentMouseClickMapKey );
	end

	HealGridMouseClick.AddOrReplace( frameType, targetType, mouseButton, modifierKey, action, actionDetail );

	-- all done, rebuild list (so small, not worried about performance)
	HealGridGuiTabMouseClick.Activate()

end

-- =========================================================================================
-- modifier key clicked, update "sanity"
-- =========================================================================================

function HealGridGuiTabMouseClick.ModifierKeyClicked()

	local mow = SystemData.MouseOverWindow.name;
	local wid = WindowGetId( mow );

	ButtonSetPressedFlag( mow..'Button', not ButtonGetPressedFlag(mow..'Button') );

	if ( wid == 2 ) then
		ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyShiftButton", false );
		ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyCtrlButton", false );
		ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAltButton", false );
	else
		ButtonSetPressedFlag( "HGG_HealGridTabMouseClickCheckButtonModifierKeyAnyButton", false );
	end

end

-- =========================================================================================
-- action changed, need to display detail box?
-- =========================================================================================

function HealGridGuiTabMouseClick.ActionChanged( clickedAction, action, actionDetail )

	if ( action == nil ) then
		action = HealGridMouseClick.ComboBoxActionGetSelected( "HGG_HealGridTabMouseClickComboBoxAction" );
		actionDetail = nil;
	end

	if ( action ~= nil and HealGridMouseClick.actions[action] and HealGridMouseClick.actions[action].needDetail ) then
		if ( action == 'ABILITY' ) then
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailLabel", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailEdit", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailSpellList", true );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailComboBox", false );
			HealGridGuiSpellList.Activate( "HGG_HealGridTabMouseClickActionDetailSpellList", HGG_HealGridTabMouseClickActionDetailSpellListList, actionDetail );
		elseif ( action == 'PETABILITY' ) then
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailLabel", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailEdit", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailSpellList", true );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailComboBox", false );
			HealGridGuiSpellList.Activate( "HGG_HealGridTabMouseClickActionDetailSpellList", HGG_HealGridTabMouseClickActionDetailSpellListList, actionDetail, 
                                                                                             nil, GameData.AbilityType.PET );
		elseif ( action == 'MORALE' ) then
			HealGridMouseClick.ComboBoxMoraleInitChoices( "HGG_HealGridTabMouseClickActionDetailComboBox" );
			HealGridMouseClick.ComboBoxMoraleActivateChoices( "HGG_HealGridTabMouseClickActionDetailComboBox", actionDetail );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailLabel", true );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailEdit", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailSpellList", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailComboBox", true );
		elseif ( action == 'COMMANDPET' ) then
			HealGridMouseClick.ComboBoxCommandPetInitChoices( "HGG_HealGridTabMouseClickActionDetailComboBox" );
			HealGridMouseClick.ComboBoxCommandPetActivateChoices( "HGG_HealGridTabMouseClickActionDetailComboBox", actionDetail );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailLabel", true );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailEdit", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailSpellList", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailComboBox", true );
		else
			TextEditBoxSetText( "HGG_HealGridTabMouseClickActionDetailEdit", actionDetail or L"" );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailLabel", true );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailEdit", true );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailSpellList", false );
			WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailComboBox", false );
		end
	else
		WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailLabel", false );
		WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailEdit", false );
		WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailSpellList", false );
		WindowSetShowing( "HGG_HealGridTabMouseClickActionDetailComboBox", false );
	end

end

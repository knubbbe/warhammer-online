HealGridGuiTabSpellTrack = {};

HealGridGuiTabSpellTrack.SORT_COLUMN_BUFF_NAME = 1;
HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_SELF = 2;
HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_SELF_MULTIPLE = 3;
HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_OTHER = 4;
HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_OTHER_MULTIPLE = 5;
HealGridGuiTabSpellTrack.SORT_COLUMN_DURATION = 6;
HealGridGuiTabSpellTrack.SORT_COLUMN_WARN_EXPIRE = 7;
HealGridGuiTabSpellTrack.SORT_COLUMN_WARN_EXPIRE_SIGN = 8;
HealGridGuiTabSpellTrack.SORT_COLUMN_POSITION_IN_FRAME = 9;
HealGridGuiTabSpellTrack.MAX_SORT_COLUMN = 9;

HealGridGuiTabSpellTrack.currentTab = 1;

HealGridGuiTabSpellTrack.listData = {};
HealGridGuiTabSpellTrack.listOrder = {};
HealGridGuiTabSpellTrack.currentDataIndex = 0;
HealGridGuiTabSpellTrack.sortColumn = HealGridGuiTabSpellTrack.SORT_COLUMN_BUFF_NAME;

HealGridGuiTabSpellTrack.changingColorSetting = nil;
HealGridGuiTabSpellTrack.currentColorSettings = {};

HealGridGuiTabSpellTrack.labelIndexList =
	{
		[1] = {key=1,		label=L"1 (default: topleft)"},
		[2] = {key=2,		label=L"2 (default: left)"},
	};

HealGridGuiTabSpellTrack.selfCastStackCountList =
	{
		[1] = {key=2,		label=L"2x"},
		[2] = {key=3,		label=L"3x"},
		[3] = {key=4,		label=L"4x"},
		[4] = {key=5,		label=L"5x"},
	};

HealGridGuiTabSpellTrack.otherCastAggregateCountList = 
	{
		[1] = {key=2,		label=L"2 players"},
		[2] = {key=3,		label=L"3 players"},
		[3] = {key=4,		label=L"4 players"},
		[4] = {key=5,		label=L"5 players"},

	};

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabSpellTrack.Initialize()

	local color;

	-- Labels for Action Buttons
	ButtonSetText( "HGG_HealGridTabSpellTrackListAdd", L"New" );
	ButtonSetText( "HGG_HealGridTabSpellTrackListRemove", L"Remove" );

	-- Labels for Search Buttons
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarNameButton", L"Spell Name" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarSignSelfButton", L"S" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarSignSelfMultipleButton", L"SS" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarSignOtherButton", L"O" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarSignOtherMultipleButton", L"OS" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarDurationButton", L"Du" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarWarnExpireButton", L"WE" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarWarnExpireSignButton", L"WS" );
	ButtonSetText( "HGG_HealGridTabSpellTrackSortButtonBarLabelIndexButton", L"Pos" );

	-- colored row backgrouns
	for row=1, HGG_HealGridTabSpellTrackList.numVisibleRows do
		color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		HealGridUtility.WindowSetTintColor( "HGG_HealGridTabSpellTrackListRow"..row.."Background", color );
	end

	-- tab labels
	ButtonSetText( "HGG_HealGridTabSpellTrackTabSelectGeneral", L"General" );
	ButtonSetStayDownFlag( "HGG_HealGridTabSpellTrackTabSelectGeneral", true );
	ButtonSetText( "HGG_HealGridTabSpellTrackTabSelectColor", L"Display" );
	ButtonSetStayDownFlag( "HGG_HealGridTabSpellTrackTabSelectColor", true );
	ButtonSetText( "HGG_HealGridTabSpellTrackTabSelectFilter", L"Filters" );
	ButtonSetStayDownFlag( "HGG_HealGridTabSpellTrackTabSelectFilter", true );

	-- shared commit button
	ButtonSetText( "HGG_HealGridTabSpellTrackEditCommit", L"Commit" );

	-- Initialize the tabs
	HealGridGuiTabSpellTrack.TabGeneralInitialize();
	HealGridGuiTabSpellTrack.TabColorInitialize();
	HealGridGuiTabSpellTrack.TabFilterInitialize();

end

-- =========================================================================================
-- Shutdown
-- =========================================================================================

function HealGridGuiTabSpellTrack.Shutdown()

end

-- =========================================================================================
-- Activate
-- =========================================================================================

function HealGridGuiTabSpellTrack.Activate()

	HealGridGuiTabSpellTrack.ListUnselectRow();
	HealGridGuiTabSpellTrack.ActivateList();
	HealGridGuiTabSpellTrack.SwitchTab( 1 );

end


-- #############################################################################################################################################################################
-- List Handling
-- #############################################################################################################################################################################

-- =========================================================================================
-- Create the list
-- =========================================================================================

function HealGridGuiTabSpellTrack.ActivateList()

	local labelIndex;
	local i = 1;

	HealGridGuiTabSpellTrack.listData = {};
	HealGridGuiTabSpellTrack.listOrder = {};

	for k,v in pairs( HealGridSettings[HealGrid.settingsIndex].trackedBuffs ) do
		for k1,v1 in pairs(HealGridGuiTabSpellTrack.labelIndexList) do
			if ( v1.key == v.labelIndex ) then
				labelIndex = v1.label;
			end
		end

		HealGridGuiTabSpellTrack.listData[i] = {};
		HealGridGuiTabSpellTrack.listData[i].trackedBuffsIndex = k;
		HealGridGuiTabSpellTrack.listData[i].name = v.buffName;
		HealGridGuiTabSpellTrack.listData[i].signSelf = v.sign;
		HealGridGuiTabSpellTrack.listData[i].signSelfMultiple = v.sign;
		HealGridGuiTabSpellTrack.listData[i].signOther = v.sign;
		HealGridGuiTabSpellTrack.listData[i].signOtherMultiple = v.sign;
		HealGridGuiTabSpellTrack.listData[i].duration = wstring.format( L"%d", v.duration );
		HealGridGuiTabSpellTrack.listData[i].warnExpire = wstring.format( L"%d", v.warnExpire );
		HealGridGuiTabSpellTrack.listData[i].warnExpireSign = v.warnExpireSign;
		HealGridGuiTabSpellTrack.listData[i].labelIndex = labelIndex;

		HealGridGuiTabSpellTrack.listOrder[i] = i;

		i = i + 1;
	end

	HealGridGuiTabSpellTrack.SortList();

end

-- =========================================================================================
-- Call from the list
-- =========================================================================================

function HealGridGuiTabSpellTrack.ColorSignColumn( buffIdx, colorIdx, bgColorIdx, row, colSign )

	local color, bgColor;
	local frameName = "HGG_HealGridTabSpellTrackListRow"..row..colSign;

	color = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx][colorIdx];
	bgColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx][bgColorIdx];

	HealGridUtility.LabelSetTextColor( frameName, color );

	if ( bgColor == 'TRANSPARENT' ) then
		HealGridUtility.WindowSetTintColor( frameName..'Background', HealGridGlobals.healthColor['healthy'] );
	else
		HealGridUtility.WindowSetTintColor( frameName..'Background', bgColor );
	end

end

function HealGridGuiTabSpellTrack.Populate( selectRow )

	local color, buffIdx;

	if ( HGG_HealGridTabSpellTrackList.PopulatorIndices == nil ) then
		return;
	end

	for row,idx in ipairs(HGG_HealGridTabSpellTrackList.PopulatorIndices) do
		if ( type(selectRow) ~= 'boolean' or selectRow == true ) then							-- only at "external" calls and select
			buffIdx = HealGridGuiTabSpellTrack.listData[idx].trackedBuffsIndex;

			-- color the signs
			HealGridGuiTabSpellTrack.ColorSignColumn( buffIdx, 'castSelfSignColor', 'castSelfBackgroundColor', row, 'SignSelf' );
			HealGridGuiTabSpellTrack.ColorSignColumn( buffIdx, 'castSelfMultipleSignColor', 'castSelfMultipleBackgroundColor', row, 'SignSelfMultiple' );
			HealGridGuiTabSpellTrack.ColorSignColumn( buffIdx, 'castOtherSignColor', 'castOtherBackgroundColor', row, 'SignOther' );
			HealGridGuiTabSpellTrack.ColorSignColumn( buffIdx, 'castOtherMultipleSignColor', 'castOtherMultipleBackgroundColor', row, 'SignOtherMultiple' );
		end

		-- highlight selected (and reset others)
		if ( idx == HealGridGuiTabSpellTrack.currentDataIndex ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		end
		HealGridUtility.WindowSetTintColor( "HGG_HealGridTabSpellTrackListRow"..row..'Background', color );
	end

end

-- =========================================================================================
-- Sort the list
-- =========================================================================================

function HealGridGuiTabSpellTrack.ListCompareDataSingle( buffIdx1, buffIdx2, dataIdx )

	if ( HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx1][dataIdx] == HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx2][dataIdx] ) then
		return( HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx1].buffName < HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx2].buffName );
	else
		return( HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx1][dataIdx] < HealGridSettings[HealGrid.settingsIndex].trackedBuffs[buffIdx2][dataIdx] );
	end

end

function HealGridGuiTabSpellTrack.ListCompareData( idx1, idx2 )

	local buffIdx1, buffIdx;

	if ( idx2 == nil ) then
		return( false );
	end

	if ( HealGridGuiTabSpellTrack.listData[idx1] ~= nil ) then
		buffIdx1 = HealGridGuiTabSpellTrack.listData[idx1].trackedBuffsIndex;
	end

	if ( HealGridGuiTabSpellTrack.listData[idx2] ~= nil ) then
		buffIdx2 = HealGridGuiTabSpellTrack.listData[idx2].trackedBuffsIndex;
	end

	if ( buffIdx1 == nil or buffIdx2 == nil ) then
		return( false );
	end

	-- ----- Sort by BuffName -----------
	if ( HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_BUFF_NAME ) then
		return( HealGridGuiTabSpellTrack.ListCompareDataSingle(buffIdx1,buffIdx2,'buffName') );

	-- ----- Sort by Sign ----------------
	elseif ( HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_SELF or
	         HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_SELF_MULTIPLE or
	         HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_OTHER or
	         HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_SIGN_OTHER_MULTIPLE )
	then
		return( HealGridGuiTabSpellTrack.ListCompareDataSingle(buffIdx1,buffIdx2,'sign') );

	-- ----- Sort by Duration -----------
	elseif ( HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_DURATION ) then
		return( HealGridGuiTabSpellTrack.ListCompareDataSingle(buffIdx1,buffIdx2,'duration') );

	-- ----- Sort by WarnExpire ---------
	elseif ( HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_WARN_EXPIRE ) then
		return( HealGridGuiTabSpellTrack.ListCompareDataSingle(buffIdx1,buffIdx2,'warnExpire') );

	-- ----- Sort by WarnExpireSign -----
	elseif ( HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_WARN_EXPIRE_SIGN ) then
		return( HealGridGuiTabSpellTrack.ListCompareDataSingle(buffIdx1,buffIdx2,'warnExpireSign') );

	-- ----- Sort by LabelIndex ---------
	elseif ( HealGridGuiTabSpellTrack.sortColumn == HealGridGuiTabSpellTrack.SORT_COLUMN_POSITION_IN_FRAME ) then
		return( HealGridGuiTabSpellTrack.ListCompareDataSingle(buffIdx1,buffIdx2,'labelIndex') );

	-- ----- Something else ---------------
	else
		return( false );
	end

end

function HealGridGuiTabSpellTrack.SortList()

	table.sort( HealGridGuiTabSpellTrack.listOrder, HealGridGuiTabSpellTrack.ListCompareData );
	ListBoxSetDisplayOrder( "HGG_HealGridTabSpellTrackList", HealGridGuiTabSpellTrack.listOrder );

	-- SocialWindowTabFriends.UpdateSortButtons()					TODO (the arrows)

end

function HealGridGuiTabSpellTrack.OnSortList()

	HealGridGuiTabSpellTrack.sortColumn = WindowGetId( SystemData.ActiveWindow.name );
	HealGridGuiTabSpellTrack.SortList();

end

-- =========================================================================================
-- Buff List, row selected
-- =========================================================================================

function HealGridGuiTabSpellTrack.ListSelectRow()

	local rowNum = WindowGetId( SystemData.ActiveWindow.name );
	local dataIndex = HGG_HealGridTabSpellTrackList.PopulatorIndices[rowNum];		-- index of 'original' list
	local idx = HealGridGuiTabSpellTrack.listData[dataIndex].trackedBuffsIndex;

	HealGridGuiTabSpellTrack.currentDataIndex = dataIndex;

	HealGridGuiTabSpellTrack.TabGeneralSelectRow( idx );
	HealGridGuiTabSpellTrack.TabColorSelectRow( idx );
	HealGridGuiTabSpellTrack.TabFilterSelectRow( idx );
	
	ButtonSetText( "HGG_HealGridTabSpellTrackEditCommit", L"Change" );
	ButtonSetDisabledFlag( "HGG_HealGridTabSpellTrackListRemove", false );
	WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", false );

	HealGridGuiTabSpellTrack.Populate( true );

end

-- =========================================================================================
-- Buff List, unselect the row
-- =========================================================================================

function HealGridGuiTabSpellTrack.ListUnselectRow()

	HealGridGuiTabSpellTrack.currentDataIndex = 0;

	HealGridGuiTabSpellTrack.TabGeneralUnselectRow();
	HealGridGuiTabSpellTrack.TabColorUnselectRow();
	HealGridGuiTabSpellTrack.TabFilterUnselectRow();
	
	ButtonSetText( "HGG_HealGridTabSpellTrackEditCommit", L"Add" );
	ButtonSetDisabledFlag( "HGG_HealGridTabSpellTrackListRemove", true );
	WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", false );

	HealGridGuiTabSpellTrack.Populate( false );

end

-- =========================================================================================
-- Buff List, remove the selected row
-- =========================================================================================

function HealGridGuiTabSpellTrack.ListRemoveRow()

	local currentTrackedBuffsIndex;

	if ( HealGridGuiTabSpellTrack.currentDataIndex == 0 ) then
		return;
	end

	currentTrackedBuffsIndex = HealGridGuiTabSpellTrack.listData[HealGridGuiTabSpellTrack.currentDataIndex].trackedBuffsIndex;

	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[currentTrackedBuffsIndex] = nil;

	HealGridGuiTabSpellTrack.Activate();

end

-- =========================================================================================
-- Buff List, commit changes
-- =========================================================================================

function HealGridGuiTabSpellTrack.EditCommit()

	local len = 0;
	local newTrackedBuffsIndex = nil;
	local currentTrackedBuffsIndex = nil;
	local data = {};

	-- collect the data
	if ( not (HealGridGuiTabSpellTrack.TabGeneralCommit(data) and HealGridGuiTabSpellTrack.TabColorCommit(data) and HealGridGuiTabSpellTrack.TabFilterCommit(data)) ) then
		return;
	end

	-- calculate the indexes
	newTrackedBuffsIndex = WStringToString( data.buffName );
	if ( HealGridGuiTabSpellTrack.currentDataIndex == 0 ) then
		currentTrackedBuffsIndex = nil;
	else
		currentTrackedBuffsIndex = HealGridGuiTabSpellTrack.listData[HealGridGuiTabSpellTrack.currentDataIndex].trackedBuffsIndex;
	end

	-- already tracking this buff
	if ( HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex] ~= nil and 
		 (currentTrackedBuffsIndex == nil or currentTrackedBuffsIndex ~= newTrackedBuffsIndex) )
    then
		LabelSetText( "HGG_HealGridTabSpellTrackEditErrorLabel", L"This buff is already tracked, select to change it" );
		WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", true );
		return;
	end

	-- all checks done, now update/add it
	if ( currentTrackedBuffsIndex == nil ) then										-- add new one
		HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex] = {};
	elseif ( currentTrackedBuffsIndex ~= newTrackedBuffsIndex ) then
		HealGridSettings[HealGrid.settingsIndex].trackedBuffs[currentTrackedBuffsIndex] = nil;
		HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex] = {};
	end

	-- tab general data
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].buffName = data.buffName;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].sign = data.sign;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].duration = data.duration;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].warnExpire = data.warnExpire;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].warnExpireSign = data.warnExpireSign;

	-- tab color data
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].labelIndex = data.labelIndex;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castSelfStackCount = data.castSelfStackCount;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castOtherAggregateCount = data.castOtherAggregateCount;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castSelfSignColor = data.castSelfSignColor;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castSelfBackgroundColor = data.castSelfBackgroundColor;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castSelfMultipleSignColor = data.castSelfMultipleSignColor;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castSelfMultipleBackgroundColor = data.castSelfMultipleBackgroundColor;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castOtherSignColor = data.castOtherSignColor;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castOtherBackgroundColor = data.castOtherBackgroundColor;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castOtherMultipleSignColor = data.castOtherMultipleSignColor;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].castOtherMultipleBackgroundColor = data.castOtherMultipleBackgroundColor;

	-- tab filter data
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].filterCastBySelf = data.filterCastBySelf;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].filterCastByOther = data.filterCastByOther;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].filterCastOnFriendly = data.filterCastOnFriendly;
	HealGridSettings[HealGrid.settingsIndex].trackedBuffs[newTrackedBuffsIndex].filterCastOnHostile = data.filterCastOnHostile;

	-- update the buff tracker mapping
	HealGridBuffTrack.CreateBuffMap();

	-- all done, rebuild list (so small, not worried about performance)
	HealGridGuiTabSpellTrack.Activate()

end

-- #############################################################################################################################################################################
-- Tab Handling
-- #############################################################################################################################################################################

-- =========================================================================================
-- Switch Tabs
-- =========================================================================================

function HealGridGuiTabSpellTrack.SwitchTab( newTab )

	if ( newTab == nil or newTab == 0 ) then
		newTab = WindowGetId( SystemData.ActiveWindow.name );
	end

	HealGridGuiTabSpellTrack.ToggleTabContent( HealGridGuiTabSpellTrack.currentTab, false );
	HealGridGuiTabSpellTrack.currentTab = newTab;
	HealGridGuiTabSpellTrack.ToggleTabContent( HealGridGuiTabSpellTrack.currentTab, true );

end

function HealGridGuiTabSpellTrack.ToggleTabContent( tab, state )

	if ( tab == 1 ) then
		WindowSetShowing( "HGG_HealGridTabSpellTrackTabGeneral", state );
		ButtonSetPressedFlag( "HGG_HealGridTabSpellTrackTabSelectGeneral", state );
	elseif ( tab == 2 ) then
		WindowSetShowing( "HGG_HealGridTabSpellTrackTabColor", state );
		ButtonSetPressedFlag( "HGG_HealGridTabSpellTrackTabSelectColor", state );
	elseif ( tab == 3 ) then
		WindowSetShowing( "HGG_HealGridTabSpellTrackTabFilter", state );
		ButtonSetPressedFlag( "HGG_HealGridTabSpellTrackTabSelectFilter", state );
	end

end

-- #############################################################################################################################################################################
-- Tab: General
-- #############################################################################################################################################################################

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabGeneralInitialize()

	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralNameLabel", L"Spellname" );
	ButtonSetText( "HGG_HealGridTabSpellTrackTabGeneralNameButtonLookup", L"lookup" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralSignLabel", L"Sign" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralDurationLabel", L"Duration" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralDurationSecondsLabel", L"seconds" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralWarnExpireLabel", L"Warn Expire" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralWarnExpireSecondsLabel", L"seconds" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralWarnExpireSignLabel", L"Expire Sign" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabGeneralLabelIndexLabel", L"Position in Frame" );

	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabSpellTrackTabGeneralLabelIndex", HealGridGuiTabSpellTrack.labelIndexList, nil );

	WindowSetShowing( "HGG_HealGridTabSpellTrackTabGeneral", false );

end

-- =========================================================================================
-- Lookup a spellname
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabGeneralLookupSpellName()

	local abilityID, abilityData;
	local spellName = HGG_HealGridTabSpellTrackTabGeneralName.Text;

	if ( spellName == nil or spellName == L"" ) then
		return;
	end

	abilityID,abilityData = HealGridUtility.GetAbilityData( spellName );

	if ( abilityID > 0 ) then
		TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralName", HealGridUtility.WStringChop(abilityData.name) );
	end

end

-- =========================================================================================
-- Select a row
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabGeneralSelectRow( idx )

	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralName", HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].buffName);
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralSign", HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].sign );
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralDuration", wstring.format(HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].duration,L"%d") );
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralWarnExpire", wstring.format(HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].warnExpire,L"%d") );
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralWarnExpireSign", HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].warnExpireSign );

	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabSpellTrackTabGeneralLabelIndex", HealGridGuiTabSpellTrack.labelIndexList, 
																								HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].labelIndex );
	
end

-- =========================================================================================
-- Unselect a row
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabGeneralUnselectRow()

	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralName", L"" );
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralSign", L"" );
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralDuration", L"" );
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralWarnExpire", L"" );
	TextEditBoxSetText( "HGG_HealGridTabSpellTrackTabGeneralWarnExpireSign", L"" );

	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabSpellTrackTabGeneralLabelIndex", HealGridGuiTabSpellTrack.labelIndexList, 'TOPLEFT' );
	
end

-- =========================================================================================
-- Commit the addition/changes
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabGeneralCommit( data )

	local len = 0;
	local spellName = HGG_HealGridTabSpellTrackTabGeneralName.Text;
	local sign = HGG_HealGridTabSpellTrackTabGeneralSign.Text;
	local duration = HGG_HealGridTabSpellTrackTabGeneralDuration.Text;
	local warnExpire = HGG_HealGridTabSpellTrackTabGeneralWarnExpire.Text;
	local warnExpireSign = HGG_HealGridTabSpellTrackTabGeneralWarnExpireSign.Text;

	-- check spell
	if ( spellName == nil or spellName == L"" ) then
		LabelSetText( "HGG_HealGridTabSpellTrackEditErrorLabel", L"Please give the name of the spell (exact spelling!)" );
		WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", true );
		return( false );
	end

	-- check sign
	if ( sign == nil or sign == L"" ) then
		LabelSetText( "HGG_HealGridTabSpellTrackEditErrorLabel", L"You must give a sign" );
		WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", true );
		return( false );
	end

	-- check duration
	if ( duration == nil or duration == L"" or tonumber(duration) == nil ) then
		LabelSetText( "HGG_HealGridTabSpellTrackEditErrorLabel", L"You must give the duration (in seconds)" );
		WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", true );
		return( false );
	end

	-- check warnExpire
	if ( warnExpire == nil or warnExpire == L"" or tonumber(warnExpire) == nil ) then
		LabelSetText( "HGG_HealGridTabSpellTrackEditErrorLabel", L"You must give an expire warning time (in seconds)" );
		WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", true );
		return( false );
	end

	-- check warnExpireSign
	if ( warnExpireSign == nil or warnExpireSign == L"" ) then
		LabelSetText( "HGG_HealGridTabSpellTrackEditErrorLabel", L"You must give a sign for the expire warning" );
		WindowSetShowing( "HGG_HealGridTabSpellTrackEditErrorLabel", true );
		return( false );
	end

	-- "normalize" spellname if needed
	if ( SystemData.Settings.Language.active == SystemData.Settings.GERMAN ) then
		len = wstring.len( spellName );
		for i=1,len do
			if ( wstring.sub(spellName,i,i) == L"'" ) then
				spellName = wstring.sub(spellName,1,i-1)..wstring.char(8217)..wstring.sub(spellName,i+1);
			end
		end
	end

	data.buffName = HealGridUtility.WStringChop( spellName );
	data.sign = sign;
	data.duration = tonumber(duration);
	data.warnExpire = tonumber(warnExpire);
	data.warnExpireSign = warnExpireSign;
    data.labelIndex = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabSpellTrackTabGeneralLabelIndex", HealGridGuiTabSpellTrack.labelIndexList );

	return( true );

end

-- #############################################################################################################################################################################
-- Tab: Color  
-- #############################################################################################################################################################################

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorInitialize()

	LabelSetText( "HGG_HealGridTabSpellTrackTabColorSelfCastColorLabel", L"cast by yourself" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabColorSelfCastMultipleColorLabel", L"stacks" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabColorOtherCastColorLabel", L"cast by someone else" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabColorOtherCastMultipleColorLabel", L"aggregated" );

	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabSpellTrackTabColorSelfCastStackCount", HealGridGuiTabSpellTrack.selfCastStackCountList, nil );
	HealGridGuiUtility.ComboBoxInit( "HGG_HealGridTabSpellTrackTabColorOtherCastAggregateCount", HealGridGuiTabSpellTrack.otherCastAggregateCountList, nil );

	LabelSetText( "HGG_HealGridTabSpellTrackTabColorInfo1", L"Left click: Change sign color" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabColorInfo2", L"Right click: Change background color" );
	LabelSetText( "HGG_HealGridTabSpellTrackTabColorInfo3", L"SHIFT-right click: Transparent Background" );

	WindowSetShowing( "HGG_HealGridTabSpellTrackTabColor", false );

end

-- =========================================================================================
-- Change the sign color
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorChangeSignColor()

	local id = WindowGetId( WindowGetParent(WindowGetParent(SystemData.ActiveWindow.name)) );

	if ( id == 1 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castSelfSignColor';
	elseif ( id == 2 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castSelfMultipleSignColor';
	elseif ( id == 3 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castOtherSignColor';
	elseif ( id == 4 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castOtherMultipleSignColor';
	end

	HealGridGuiColorSelect.Activate( HealGridGuiTabSpellTrack, "TabColorColorSelected" );

end

-- =========================================================================================
-- Change the background color
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorChangeBackgroundColor( modifierKey )

	local id = WindowGetId( WindowGetParent(WindowGetParent(SystemData.ActiveWindow.name)) );

	if ( id == 1 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castSelfBackgroundColor';
	elseif ( id == 2 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castSelfMultipleBackgroundColor';
	elseif ( id == 3 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castOtherBackgroundColor';
	elseif ( id == 4 ) then
		HealGridGuiTabSpellTrack.changingColorSetting = 'castOtherMultipleBackgroundColor';
	end

	if ( modifierKey == SystemData.ButtonFlags.SHIFT ) then
		HealGridGuiTabSpellTrack.currentColorSettings[HealGridGuiTabSpellTrack.changingColorSetting] = 'TRANSPARENT';
		HealGridGuiTabSpellTrack.TabColorUpdateColors();
	else
		HealGridGuiColorSelect.Activate( HealGridGuiTabSpellTrack, "TabColorColorSelected" );
	end

end

-- =========================================================================================
-- Callback from the color picker
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorColorSelected( color )

	HealGridGuiTabSpellTrack.currentColorSettings[HealGridGuiTabSpellTrack.changingColorSetting] = color;

	HealGridGuiTabSpellTrack.TabColorUpdatePane();

end

-- =========================================================================================
-- Update the colors
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorUpdateColorButton( frameName, signColor, bgColor )

	local hc;

	for k,v in ipairs({"Healthy","Fair","Hurt","Wounded","Poor","Critic"}) do
		LabelSetText( frameName..v.."Sign", L'X' );
		HealGridUtility.LabelSetTextColor( frameName..v.."Sign", signColor );
		if ( bgColor == 'TRANSPARENT' ) then
			hc = v:lower();
			HealGridUtility.WindowSetTintColor( frameName..v.."Background", HealGridGlobals.healthColor[hc] );
		else
			HealGridUtility.WindowSetTintColor( frameName..v.."Background", bgColor );
		end
	end

end

function HealGridGuiTabSpellTrack.TabColorUpdatePane()

	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabSpellTrackTabColorSelfCastStackCount", HealGridGuiTabSpellTrack.selfCastStackCountList, 
                                                                                                HealGridGuiTabSpellTrack.currentColorSettings.castSelfStackCount );
	HealGridGuiUtility.ComboBoxActivate( "HGG_HealGridTabSpellTrackTabColorOtherCastAggregateCount", HealGridGuiTabSpellTrack.otherCastAggregateCountList, 
                                                                                                     HealGridGuiTabSpellTrack.currentColorSettings.castOtherAggregateCount );

	HealGridGuiTabSpellTrack.TabColorUpdateColorButton( "HGG_HealGridTabSpellTrackTabColorSelfCastColor", 
                                                        HealGridGuiTabSpellTrack.currentColorSettings.castSelfSignColor,
														HealGridGuiTabSpellTrack.currentColorSettings.castSelfBackgroundColor );
	HealGridGuiTabSpellTrack.TabColorUpdateColorButton( "HGG_HealGridTabSpellTrackTabColorSelfCastMultipleColor", 
                                                        HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleSignColor,
														HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleBackgroundColor );
	HealGridGuiTabSpellTrack.TabColorUpdateColorButton( "HGG_HealGridTabSpellTrackTabColorOtherCastColor", 
                                                        HealGridGuiTabSpellTrack.currentColorSettings.castOtherSignColor,
														HealGridGuiTabSpellTrack.currentColorSettings.castOtherBackgroundColor );
	HealGridGuiTabSpellTrack.TabColorUpdateColorButton( "HGG_HealGridTabSpellTrackTabColorOtherCastMultipleColor", 
                                                        HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleSignColor,
														HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleBackgroundColor );

end

-- =========================================================================================
-- Select a row
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorSelectRow( idx )

	HealGridGuiTabSpellTrack.currentColorSettings.castSelfStackCount = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castSelfStackCount;
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherAggregateCount = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castOtherAggregateCount;

	HealGridGuiTabSpellTrack.currentColorSettings.castSelfSignColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castSelfSignColor;
	HealGridGuiTabSpellTrack.currentColorSettings.castSelfBackgroundColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castSelfBackgroundColor;
	HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleSignColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castSelfMultipleSignColor;
	HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleBackgroundColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castSelfMultipleBackgroundColor;
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherSignColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castOtherSignColor;
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherBackgroundColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castOtherBackgroundColor;
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleSignColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castOtherMultipleSignColor;
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleBackgroundColor = HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].castOtherMultipleBackgroundColor;

	HealGridGuiTabSpellTrack.TabColorUpdatePane();

end

-- =========================================================================================
-- Unselect a row
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorUnselectRow()

	HealGridGuiTabSpellTrack.currentColorSettings.castSelfStackCount = 2;
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherAggregateCount = 2;

	HealGridGuiTabSpellTrack.currentColorSettings.castSelfSignColor = 'DEEP_SKY_BLUE';
	HealGridGuiTabSpellTrack.currentColorSettings.castSelfBackgroundColor = 'TRANSPARENT';
	HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleSignColor = 'BLACK';
	HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleBackgroundColor = 'DEEP_SKY_BLUE';
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherSignColor = 'BLUE';
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherBackgroundColor = 'TRANSPARENT';
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleSignColor = 'WHITE';
	HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleBackgroundColor = 'BLUE';

	HealGridGuiTabSpellTrack.TabColorUpdatePane();

end

-- =========================================================================================
-- Commit the addition/changes
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabColorCommit( data )

    data.castSelfStackCount = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabSpellTrackTabColorSelfCastStackCount", HealGridGuiTabSpellTrack.selfCastStackCountList );
    data.castOtherAggregateCount = HealGridGuiUtility.ComboBoxGetSelected( "HGG_HealGridTabSpellTrackTabColorOtherCastAggregateCount", HealGridGuiTabSpellTrack.otherCastAggregateCountList );

	data.castSelfSignColor = HealGridGuiTabSpellTrack.currentColorSettings.castSelfSignColor;
	data.castSelfBackgroundColor = HealGridGuiTabSpellTrack.currentColorSettings.castSelfBackgroundColor;
	data.castSelfMultipleSignColor = HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleSignColor;
	data.castSelfMultipleBackgroundColor = HealGridGuiTabSpellTrack.currentColorSettings.castSelfMultipleBackgroundColor;
	data.castOtherSignColor = HealGridGuiTabSpellTrack.currentColorSettings.castOtherSignColor;
	data.castOtherBackgroundColor = HealGridGuiTabSpellTrack.currentColorSettings.castOtherBackgroundColor;
	data.castOtherMultipleSignColor = HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleSignColor;
	data.castOtherMultipleBackgroundColor = HealGridGuiTabSpellTrack.currentColorSettings.castOtherMultipleBackgroundColor;

	return( true );

end

-- #############################################################################################################################################################################
-- Tab: Filter  
-- #############################################################################################################################################################################

-- =========================================================================================
-- Initialize
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabFilterInitialize()

	LabelSetText( "HGG_HealGridTabSpellTrackTabFilterCastByLabel", L"Cast by" );
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabSpellTrackTabFilterCastBySelf", L"self" );
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabSpellTrackTabFilterCastByOther", L"other" );

	LabelSetText( "HGG_HealGridTabSpellTrackTabFilterCastOnLabel", L"Cast onto" );
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabSpellTrackTabFilterCastOnFriendly", L"friendly" );
	HealGridGuiUtility.CheckButtonInit( "HGG_HealGridTabSpellTrackTabFilterCastOnHostile", L"hostile" );

	WindowSetShowing( "HGG_HealGridTabSpellTrackTabFilter", false );

end

-- =========================================================================================
-- Select a row
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabFilterSelectRow( idx )

	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastBySelf", HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].filterCastBySelf );
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastByOther", HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].filterCastByOther );

	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastOnFriendly", HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].filterCastOnFriendly );
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastOnHostile", HealGridSettings[HealGrid.settingsIndex].trackedBuffs[idx].filterCastOnHostile );

end

-- =========================================================================================
-- Unselect a row
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabFilterUnselectRow()

	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastBySelf", true );
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastByOther", true );

	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastOnFriendly", true );
	HealGridGuiUtility.CheckButtonActivate( "HGG_HealGridTabSpellTrackTabFilterCastOnHostile", true );

end

-- =========================================================================================
-- Commit the addition/changes
-- =========================================================================================

function HealGridGuiTabSpellTrack.TabFilterCommit( data )

	data.filterCastBySelf = HealGridGuiUtility.CheckButtonIsPressed( "HGG_HealGridTabSpellTrackTabFilterCastBySelf" );
	data.filterCastByOther = HealGridGuiUtility.CheckButtonIsPressed( "HGG_HealGridTabSpellTrackTabFilterCastByOther" );

	data.filterCastOnFriendly = HealGridGuiUtility.CheckButtonIsPressed( "HGG_HealGridTabSpellTrackTabFilterCastOnFriendly" );
	data.filterCastOnHostile = HealGridGuiUtility.CheckButtonIsPressed( "HGG_HealGridTabSpellTrackTabFilterCastOnHostile" );

	return( true );

end

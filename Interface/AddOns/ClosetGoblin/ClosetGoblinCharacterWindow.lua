--[[
Copyright (c) 2008, Naeru@Ulthuan
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation  
and/or other materials provided with the distribution.
Neither the name of the Candymancer Coding Company nor the names of its contributors may be used to endorse or promote products derived from 
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

ClosetGoblinCharacterWindow = {}

ClosetGoblinCharacterWindow.selectedSetDataIndex = nil
ClosetGoblinCharacterWindow.pendingDeleteSet = nil
ClosetGoblinCharacterWindow.activeMenuRow = nil
ClosetGoblinCharacterWindow.copySetIndex = nil
ClosetGoblinCharacterWindow.show = false;

ClosetGoblinCharacterWindow.COLOR_ACTIVE_SLOT = DefaultColor.GREEN
ClosetGoblinCharacterWindow.COLOR_INACTIVE_SLOT = DefaultColor.YELLOW
ClosetGoblinCharacterWindow.COLOR_INVALID_SLOT = DefaultColor.RED
ClosetGoblinCharacterWindow.COLOR_EMPTY_SLOT = DefaultColor.ZERO_TINT

--[[
   Character Window Event Handlers
 ]]

function ClosetGoblinCharacterWindow.OnInitialize()
	WindowSetShowing("ClosetGoblinCharacterWindow", false)
	ClosetGoblinCharacterWindow.show = false;

	ButtonSetText("ClosetGoblinCharacterWindowContentsSortNameButton", cgL["Set_Name"])
	ButtonSetText("ClosetGoblinCharacterWindowContentsSortTacticsButton", cgL["Tactics"])
	ButtonSetText("ClosetGoblinCharacterWindowContentsNewSet", cgL["New_Set"])
	ButtonSetText("ClosetGoblinCharacterWindowContentsDeleteSet", cgL["Delete_Set"])
	ButtonSetText("ClosetGoblinCharacterWindowContentsZoneConfig", cgL["Zone_Configuration"])
	LabelSetText("ClosetGoblinCharacterWindowContentsLabelUseItemRack", L"ItemRack:")
	
	LabelSetText("ClosetGoblinCharacterWindowTitleBarText", L"ClosetGoblin " .. towstring(ClosetGoblin.version))
--	LabelSetText("ClosetGoblinCharacterWindowContentsEquipmentSlot9Talisman1", cgL["talisman_skill_4"])
--	LabelSetText("ClosetGoblinCharacterWindowContentsEquipmentSlot7Talisman1", cgL["talisman_skill_5"])
--	LabelSetText("ClosetGoblinCharacterWindowContentsEquipmentSlot7Talisman2", cgL["talisman_skill_7"])

	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsLabel", L"Change ActionBar")
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsLabelAB1", L"1")
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsLabelAB2", L"2")
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsLabelAB3", L"3")
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsLabelAB4", L"4")
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsLabelAB5", L"5")
	
	WindowSetShowing("ClosetGoblinCharacterWindowContentsSortTacticsUpArrow", false)
	WindowSetShowing("ClosetGoblinCharacterWindowContentsSortTacticsDownArrow", false)
	
	WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowHelm", false)
	WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloak", false)
	WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", false)
end

function ClosetGoblinCharacterWindow.OnShow()
	ClosetGoblinCharacterWindow.show = true
	--WindowUtils.AddToOpenList( "ClosetGoblinCharacterWindow", ClosetGoblinCharacterWindow.OnHide, WindowUtils.Cascade.MODE_AUTOMATIC )
	WindowUtils.OnShown(ClosetGoblinCharacterWindow.OnHide, WindowUtils.Cascade.MODE_AUTOMATIC )

	if ClosetGoblin.HasSets() then
		ClosetGoblinCharacterWindow.selectedSetDataIndex = 1
	end
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsCheckboxUseItemRack", ClosetGoblin.settings.useItemRackOnCharacterWindow)
	ClosetGoblinCharacterWindow.RefreshList()
end

function ClosetGoblinCharacterWindow.OnHide()
	ClosetGoblinCharacterWindow.show = false;
	WindowUtils.OnHidden()
end

function ClosetGoblinCharacterWindow.OnShutdown()
end

function ClosetGoblinCharacterWindow.OnClickSortNameButton()
	if ClosetGoblin.sortOrder == ClosetGoblin.SORT_ORDER_UP then
		ClosetGoblin.sortOrder = ClosetGoblin.SORT_ORDER_DOWN
	else
		ClosetGoblin.sortOrder = ClosetGoblin.SORT_ORDER_UP
	end
	
	ClosetGoblinCharacterWindow.SortSetList()
	ClosetGoblinCharacterWindow.UpdateSetList()
	ClosetGoblinCharacterWindow.UpdateSortButtonIcon()	
end

function ClosetGoblinCharacterWindow.OnClickSortTacticsButton()
--	if ClosetGoblin.sortOrder == ClosetGoblin.SORT_ORDER_UP then
--		ClosetGoblin.sortOrder = ClosetGoblin.SORT_ORDER_DOWN
--	else
--		ClosetGoblin.sortOrder = ClosetGoblin.SORT_ORDER_UP
--	end
	
--	ClosetGoblinCharacterWindow.SortSetList()
--	ClosetGoblinCharacterWindow.UpdateSetList()
--	ClosetGoblinCharacterWindow.UpdateSortButtonIcon()	
end

function ClosetGoblinCharacterWindow.OnClickSetRow()
	local rowIndex = WindowGetId(SystemData.ActiveWindow.name)
	local dataIndex = ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices[rowIndex]
	ClosetGoblinCharacterWindow.selectedSetDataIndex = dataIndex
	
	ClosetGoblinCharacterWindow.UpdateSetList()
	ClosetGoblinCharacterWindow.UpdateSlotIcons()
	ClosetGoblinCharacterWindow.UpdateActionBarSettings()
end

function ClosetGoblinCharacterWindow.OnSetRowContextMenu()
	ClosetGoblinCharacterWindow.activeMenuRow = WindowGetId(SystemData.ActiveWindow.name)
	local dataIndex = ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices[ClosetGoblinCharacterWindow.activeMenuRow]
	ClosetGoblinCharacterWindow.selectedSetDataIndex = dataIndex
	local set = ClosetGoblinCharacterWindow.GetCurrentSet();
	
	ClosetGoblinCharacterWindow.UpdateSetList()
	ClosetGoblinCharacterWindow.UpdateSlotIcons()
	
	EA_Window_ContextMenu.CreateContextMenu(SystemData.ActiveWindow.name)	
	EA_Window_ContextMenu.AddMenuItem(cgL["Rename_Set"], ClosetGoblinCharacterWindow.OnRowMenuRenameSetClick, false, true)
	EA_Window_ContextMenu.AddMenuItem(cgL["Import_Current"], ClosetGoblinCharacterWindow.OnRowMenuImportCurrentClick, false, true)
	EA_Window_ContextMenu.AddMenuItem(cgL["Copy"], ClosetGoblinCharacterWindow.OnRowMenuCopyClick, false, true)
	EA_Window_ContextMenu.AddMenuItem(cgL["Paste"], ClosetGoblinCharacterWindow.OnRowMenuPasteClick, not ClosetGoblinCharacterWindow.IsValidPasteTarget(dataIndex), true)
	EA_Window_ContextMenu.AddMenuItem(cgL["Associate_with_Zone"], ClosetGoblinZoneWindow.Show, false, true);
	EA_Window_ContextMenu.AddMenuItem(cgL["Link_with_tactics_set"]:gsub(L"#1#", L"1"), ClosetGoblinCharacterWindow.OnRowMenuLinkTactics, set.tactics == L"1", true);
	EA_Window_ContextMenu.AddMenuItem(cgL["Link_with_tactics_set"]:gsub(L"#1#", L"2"), ClosetGoblinCharacterWindow.OnRowMenuLinkTactics, set.tactics == L"2", true);
	EA_Window_ContextMenu.AddMenuItem(cgL["Link_with_tactics_set"]:gsub(L"#1#", L"3"), ClosetGoblinCharacterWindow.OnRowMenuLinkTactics, set.tactics == L"3", true);
	EA_Window_ContextMenu.AddMenuItem(cgL["Link_with_tactics_set"]:gsub(L"#1#", L"4"), ClosetGoblinCharacterWindow.OnRowMenuLinkTactics, set.tactics == L"4", true);
	EA_Window_ContextMenu.AddMenuItem(cgL["Link_with_tactics_set"]:gsub(L"#1#", L"5"), ClosetGoblinCharacterWindow.OnRowMenuLinkTactics, set.tactics == L"5", true);
	EA_Window_ContextMenu.AddMenuItem(cgL["Unlink_with_tactics_set"], ClosetGoblinCharacterWindow.OnRowMenuLinkTactics, set.tactics == L"x", true);
	EA_Window_ContextMenu.Finalize()
end

function ClosetGoblinCharacterWindow.OnRowMenuRenameSetClick()
	local rowIndex = ClosetGoblinCharacterWindow.activeMenuRow;
	local dataIndex = ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices[rowIndex];
	local set = ClosetGoblin.GetSet(dataIndex);
	DialogManager.MakeTextEntryDialog(cgL["New_set_name"], cgL["Enter_set_name"], set.name, ClosetGoblinCharacterWindow.OnSubmitSetRename, nil);
end;

function ClosetGoblinCharacterWindow.OnSubmitSetRename(name)
	local rowIndex = ClosetGoblinCharacterWindow.activeMenuRow;
	local dataIndex = ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices[rowIndex];
	local res = ClosetGoblin.RenameSet(ClosetGoblin.GetSet(dataIndex), name);
	if res ~= ClosetGoblin.NAME_OK then
		if res == ClosetGoblin.NAME_EMPTY then
			ClosetGoblin.Alert(cgL["Set_name_empty"]);
		else
			ClosetGoblin.Alert(cgL["Set_name_unique"]);
		end;
		DialogManager.MakeTextEntryDialog(cgL["New_set_name"], cgL["Enter_set_name"], name, ClosetGoblinCharacterWindow.OnSubmitSetRename, nil);
	else	-- Rename of set succesfull
		ClosetGoblin.UpdateListSets();
		ClosetGoblinCharacterWindow.RefreshList();
		ClosetGoblinCharacterWindow.activeMenuRow = nil	;
	end;
end;

function ClosetGoblinCharacterWindow.OnRowMenuImportCurrentClick()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	ClosetGoblin.ImportCurrentSet(set)
	ClosetGoblinCharacterWindow.UpdateSlotIcons()
	ClosetGoblinCharacterWindow.activeMenuRow = nil
end

function ClosetGoblinCharacterWindow.OnRowMenuCopyClick()
	local rowIndex = ClosetGoblinCharacterWindow.activeMenuRow	
	local dataIndex = ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices[rowIndex]
	ClosetGoblinCharacterWindow.copySetIndex = dataIndex
end

function ClosetGoblinCharacterWindow.OnRowMenuPasteClick()
	local rowIndex = ClosetGoblinCharacterWindow.activeMenuRow	
	local dataIndex = ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices[rowIndex]
	
	local srcSet = ClosetGoblin.GetSet(ClosetGoblinCharacterWindow.copySetIndex)
	local targetSet = ClosetGoblin.GetSet(dataIndex)
	
	if srcSet and targetSet then
		ClosetGoblin.CopySet(srcSet, targetSet)
		ClosetGoblinCharacterWindow.UpdateSlotIcons()
	end
	
	ClosetGoblinCharacterWindow.copySetIndex = nil
end

function ClosetGoblinCharacterWindow.OnRowMenuLinkTactics()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet();
	local idContextMenu = towstring(WindowGetId(SystemData.MouseOverWindow.name) - 5 );

	if idContextMenu == L"6" then -- case of unlink tactics to set
		idContextMenu = L"x";
	end;
	
	ClosetGoblin.LinkTactics(idContextMenu, set.name);
	ClosetGoblinCharacterWindow.RefreshList();
end;

function ClosetGoblinCharacterWindow.OnClickNewSetButton()
	DialogManager.MakeTextEntryDialog(cgL["Set_Name"], cgL["Enter_set_name"], L"", ClosetGoblinCharacterWindow.OnSubmitNewSetName, nil)
end

function ClosetGoblinCharacterWindow.OnClickDeleteSetButton()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	if set then
	    local confirmYes = GetGuildString( StringTables.Guild.BUTTON_CONFIRM_YES)
		local confirmNo = GetGuildString( StringTables.Guild.BUTTON_CONFIRM_NO)
		ClosetGoblinCharacterWindow.pendingDeleteSet = ClosetGoblinCharacterWindow.selectedSetDataIndex
		DialogManager.MakeTwoButtonDialog(
			cgL["confirm_delete_set"]:gsub(L"#1#", set.name),
			confirmYes, ClosetGoblinCharacterWindow.OnConfirmDeleteSet,
			confirmNo, nil
		)
	end
end

function ClosetGoblinCharacterWindow.OnClickZoneConfigButton()
	ClosetGoblinZoneWindow.Show();
end;

function ClosetGoblinCharacterWindow.OnSubmitNewSetName(name)
	if name then
		local res = ClosetGoblin.AddNewSet(name)
		if res ~= ClosetGoblin.NAME_OK then
			if res == ClosetGoblin.NAME_EMPTY then
				ClosetGoblin.Alert(cgL["Set_name_empty"]);
			else
				ClosetGoblin.Alert(cgL["Set_name_unique"]);
			end;
			DialogManager.MakeTextEntryDialog(cgL["Set name"], L"Enter set name :", name, ClosetGoblinCharacterWindow.OnSubmitNewSetName, nil)
		else	-- New set created succesfully
			ClosetGoblin.UpdateListSets();
			ClosetGoblinCharacterWindow.selectedSetDataIndex = table.getn(ClosetGoblin.GetProfileSets())
			ClosetGoblinCharacterWindow.RefreshList()
		end
	end
end

function ClosetGoblinCharacterWindow.OnConfirmDeleteSet()
	if ClosetGoblinCharacterWindow.pendingDeleteSet then
		ClosetGoblin.DeleteSet(ClosetGoblinCharacterWindow.pendingDeleteSet)
		ClosetGoblinCharacterWindow.pendingDeleteSet = nil
		
		if ClosetGoblin.HasSets() then
			ClosetGoblinCharacterWindow.selectedSetDataIndex = 1
		else
			ClosetGoblinCharacterWindow.selectedSetDataIndex = nil
		end
		ClosetGoblin.UpdateListSets();
		ClosetGoblinCharacterWindow.RefreshList()
	end
end

function ClosetGoblinCharacterWindow.EquipmentLButtonUp(flags)
	local slot = WindowGetId(SystemData.ActiveWindow.name)
	if not ClosetGoblinCharacterWindow.HandleDrag() then
		local altPressed = flags == SystemData.ButtonFlags.ALT
		local set = ClosetGoblinCharacterWindow.GetCurrentSet()
		if altPressed and set then
			ClosetGoblin.ToggleSlot(set, slot)
			ClosetGoblinCharacterWindow.UpdateSlotIcons()
		end
	end
end

function ClosetGoblinCharacterWindow.EquipmentLButtonDown()
	ClosetGoblinCharacterWindow.HandleDrag()
end

function ClosetGoblinCharacterWindow.EquipmentRButtonUp(flags)
	local slot = WindowGetId(SystemData.ActiveWindow.name)
	local altPressed = flags == SystemData.ButtonFlags.ALT
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	if altPressed and set then
		ClosetGoblin.ClearSlot(set, slot)
		ClosetGoblinCharacterWindow.UpdateSlotIcons()
	end
end

--[[function ClosetGoblinCharacterWindow.EquipmentMouseOver()
	ClosetGoblinCharacterWindow.OnEquipmentMouseOver()
	--CG_ItemRack.OnCGEquipmentMouseOver()
end]]--
function ClosetGoblinCharacterWindow.EquipmentMouseOver()
	local slot = WindowGetId(SystemData.ActiveWindow.name)
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	
	local item = nil
	if set and set.slots[slot].id then
		item = ClosetGoblin.FindItem(set.slots[slot].id)
	end
	
	if not item then
		ClosetGoblinCharacterWindow.CreateTextOnlyTooltip("ClosetGoblinCharacterWindowContentsEquipmentSlot" .. slot, CharacterWindow.EquipmentSlotInfo[slot].name, nil, { r=123, g=172, b=220 })
	else
		Tooltips.CreateItemTooltip(item, "ClosetGoblinCharacterWindowContentsEquipmentSlot" .. slot, Tooltips.ANCHOR_WINDOW_RIGHT, true)
		if DataUtils.ItemHasEnhancementTimer(item) then
			Tooltips.SetUpdateCallback(Tooltips.TemporaryItemEnhancementCallback)
		end
	end

	--[[CG_ItemRack.DoPreHookMouseOverSlot(slot, item)
	-- Todo Remove Item if it´s actually the setitem in the backpack
	-- Todo Add The item that is worn if it is not the setitem
	-- set.slots[slot].id should be the id of the item in the closetgoblin set
	-- ClosetGoblin.FindItemInSet(set, item) would be an alternative...
	-- uses table search but would catch stuff that is equipable in multiple slots...
	for k,v in ipairs(CG_ItemRack.equipmentData) do
		--ClosetGoblin.FindItemInSet(set, item)
		--if v.uniqueid
	end
	
	CG_ItemRack.ShowItemRackWindowAt("ClosetGoblinCharacterWindowContentsEquipmentSlot", slot)]]--
end

function ClosetGoblinCharacterWindow.EquipmentMouseOverEnd()

end

--[[
  Character window member functions
]]

function ClosetGoblinCharacterWindow.Show()
	WindowSetShowing("ClosetGoblinCharacterWindow", true)
end

function ClosetGoblinCharacterWindow.Hide()
	WindowSetShowing("ClosetGoblinCharacterWindow", false)
end

function ClosetGoblinCharacterWindow.ShowOrHide()
	if(ClosetGoblinCharacterWindow.show == false) then
		ClosetGoblinCharacterWindow.Show();
	else
		ClosetGoblinCharacterWindow.Hide();
	end;
end;

function ClosetGoblinCharacterWindow.BuildDisplayOrder()
	ClosetGoblin.setDisplayOrder = {}
	local dispIndex = 1
	for index, setData in ipairs(ClosetGoblin.GetProfileSets()) do
		ClosetGoblin.setDisplayOrder[dispIndex] = index
		dispIndex = dispIndex + 1
	end
end

function ClosetGoblinCharacterWindow.RefreshList()
	ClosetGoblinCharacterWindow.UpdateSlotIcons()
	ClosetGoblinCharacterWindow.BuildDisplayOrder()
	ClosetGoblinCharacterWindow.SortSetList()
	ClosetGoblinCharacterWindow.UpdateSetList()
	ClosetGoblinCharacterWindow.UpdateSortButtonIcon()
	ClosetGoblinCharacterWindow.UpdateActionBarSettings()
end

function ClosetGoblinCharacterWindow.SortSetList()
    table.sort(ClosetGoblin.setDisplayOrder, ClosetGoblin.CompareSets)
end

function ClosetGoblinCharacterWindow.UpdateSetList()
	ListBoxSetDisplayOrder("ClosetGoblinCharacterWindowContentsSetList", ClosetGoblin.setDisplayOrder)
end

function ClosetGoblinCharacterWindow.UpdateSortButtonIcon()
	WindowSetShowing("ClosetGoblinCharacterWindowContentsSortUpArrow", ClosetGoblin.sortOrder == ClosetGoblin.SORT_ORDER_UP)
	WindowSetShowing("ClosetGoblinCharacterWindowContentsSortDownArrow", ClosetGoblin.sortOrder == ClosetGoblin.SORT_ORDER_DOWN)
end

function ClosetGoblinCharacterWindow.UpdateSlotIcon(set, slot, defaultIcon)
	local texture = nil
	local tint = DefaultColor.ZERO_TINT
	local invalidSlot = false
	
	if set.slots[slot].id then
		local item = ClosetGoblin.FindItem(set.slots[slot].id)
		invalidSlot = (not item) and true or false
		
		local iconNum = set.slots[slot].icon
		if not iconNum and item then
			iconNum = item.iconNum
			set.slots[slot].icon = iconNum
		end
		
		if iconNum then
			texture, x, y = GetIconData(iconNum)
		end
	end
	
	if invalidSlot then
		tint = ClosetGoblinCharacterWindow.COLOR_INVALID_SLOT
	elseif not set.slots[slot].enabled then
		tint = ClosetGoblinCharacterWindow.COLOR_INACTIVE_SLOT
	end
	
	if not texture then
		if type(defaultIcon) ~= "table" then
			texture, x, y = GetIconData(defaultIcon)
		else
			texture, x, y = defaultIcon.texture, defaultIcon.x, defaultIcon.y
		end
	end
	
	if texture then
		DynamicImageSetTexture("ClosetGoblinCharacterWindowContentsEquipmentSlot" .. slot .. "IconBase", texture, x, y)
	end
	
	WindowSetTintColor("ClosetGoblinCharacterWindowContentsEquipmentSlot" .. slot, tint.r, tint.g, tint.b)
	
	LabelSetText("ClosetGoblinCharacterWindowContentsEquipmentSlot".. tostring(slot) .."Talisman1", L"")
	LabelSetText("ClosetGoblinCharacterWindowContentsEquipmentSlot".. tostring(slot) .."Talisman2", L"")
	if set.slots[slot].talisman then
		for k, v in ipairs(set.slots[slot].talisman) do
			LabelSetText("ClosetGoblinCharacterWindowContentsEquipmentSlot".. tostring(slot) .."Talisman".. tostring(k), cgL["talisman_skill_".. tostring(v or L"")] or L"")
		end
	end
end

function ClosetGoblinCharacterWindow.UpdateSlotIcons()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	
	if not set then
		WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipment", false)
	else
		WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipment", true)
		for slotName, slot in pairs(GameData.EquipSlots) do
			if slot ~= GameData.EquipSlots.EITHER_HAND then
				ClosetGoblinCharacterWindow.UpdateSlotIcon(set, slot, CharacterWindow.EquipmentSlotInfo[slot].iconNum)
			end
		end
		
		for slot = 1, GameData.Player.c_NUM_TROPHIES do
			ClosetGoblinCharacterWindow.UpdateSlotIcon(set, slot + CharacterWindow.NUM_EQUIPMENT_SLOTS, CharacterWindow.TROPHY_EMPTY_ICON)
		end
		--d(set.showHelm)
		--d(set.showCloak)
		--d(set.showCloakHeraldry)
		ButtonSetPressedFlag( "ClosetGoblinCharacterWindowContentsEquipmentShowHelm", set.showHelm )
		ButtonSetPressedFlag( "ClosetGoblinCharacterWindowContentsEquipmentShowCloak", set.showCloak )
		ButtonSetPressedFlag( "ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", set.showCloakHeraldry )
		
		if( set.showCloak )
		then
			ButtonSetDisabledFlag("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", false)
		else
			ButtonSetDisabledFlag("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", true)
		end
	end
end

function ClosetGoblinCharacterWindow.UpdateSetRow()
	if ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices ~= nil then
		for rowIndex, dataIndex in ipairs(ClosetGoblinCharacterWindowContentsSetList.PopulatorIndices) do
			local set = ClosetGoblin.GetSet(dataIndex)
			local rowMod = math.mod(rowIndex, 2)
			local rowColor = DataUtils.GetAlternatingRowColor(rowMod)
			
			WindowSetTintColor("ClosetGoblinCharacterWindowContentsSetListRow" .. rowIndex .. "BackgroundName", rowColor.r, rowColor.g, rowColor.b)
			WindowSetAlpha("ClosetGoblinCharacterWindowContentsSetListRow" .. rowIndex .. "BackgroundName", rowColor.a)
			
			ClosetGoblinCharacterWindow.UpdateHighlightOnRow(rowIndex, dataIndex == ClosetGoblinCharacterWindow.selectedSetDataIndex)
		end
	end
	
	if not ClosetGoblinCharacterWindow.selectedSetDataIndex then
		ButtonSetDisabledFlag("ClosetGoblinCharacterWindowContentsDeleteSet", true)
	else
		ButtonSetDisabledFlag("ClosetGoblinCharacterWindowContentsDeleteSet", false)
	end
end

function ClosetGoblinCharacterWindow.UpdateHighlightOnRow(rowIndex, highlight)
	local color = DefaultColor.WHITE
	if highlight then
		color = DefaultColor.GOLD
	end
	
	LabelSetTextColor("ClosetGoblinCharacterWindowContentsSetListRow" .. rowIndex .. "Name", color.r, color.g, color.b)
	WindowSetShowing("ClosetGoblinCharacterWindowContentsSetListRow" .. rowIndex .. "SelectionBorder", highlight)
end

function ClosetGoblinCharacterWindow.FindCursorItem(data)
	if data.Source == Cursor.SOURCE_INVENTORY then
		return ClosetGoblin.FindItemInList(data.ObjectId, DataUtils.GetItems());
	elseif data.Source == Cursor.SOURCE_EQUIPMENT then
		local slot, item = ClosetGoblin.FindItemInList(data.ObjectId, DataUtils.GetEquipmentData());
		if not item then
			slot, item = ClosetGoblin.FindItemInList(data.ObjectId, DataUtils.GetTrophyData());
		end;
		
		return slot, item;
	else
		ClosetGoblin.Alert(cgL["Item_dragged"]);
		return nil, nil;
	end;
end;

function ClosetGoblinCharacterWindow.HandleDrag()
	local slot = WindowGetId(SystemData.ActiveWindow.name)
	if Cursor.IconOnCursor() then
		local currSlot, item = ClosetGoblinCharacterWindow.FindCursorItem(Cursor.Data)
		if not item then
			return
		end
		
		if ClosetGoblin.CanEquip(item, slot) then
--			ClosetGoblin.SetSlot(ClosetGoblin.GetSet(ClosetGoblinCharacterWindow.selectedSetDataIndex), slot, item)
			ClosetGoblin.SetSlot(ClosetGoblin.GetSet(ClosetGoblinCharacterWindow.selectedSetDataIndex), slot, Cursor.Data.Source, Cursor.Data.SourceSlot)
			ClosetGoblinCharacterWindow.UpdateSlotIcons()
			Tooltips.ClearTooltip()
			ClosetGoblinCharacterWindow.EquipmentMouseOver()
		end
		
		Cursor.Clear()
		return true
	end
	
	return false
end


function ClosetGoblinCharacterWindow.CreateTextOnlyTooltip(window, line1, line2, color)
    if line1 == nil then
        return
    end
    
	if not color then
		color = Tooltips.COLOR_HEADING
	end
	
	Tooltips.CreateTextOnlyTooltip(window)
    Tooltips.SetTooltipText(1, 1, line1)
    Tooltips.SetTooltipColorDef(1, 1, color)
    
	if line2 ~= nil then
        Tooltips.SetTooltipText(2, 1, line2)
    end
	
    Tooltips.Finalize()
    Tooltips.AnchorTooltip(Tooltips.ANCHOR_WINDOW_RIGHT)
end

function ClosetGoblinCharacterWindow.IsValidPasteTarget(dataIndex)
	if not ClosetGoblinCharacterWindow.copySetIndex then
		return false
	end
	
	return dataIndex ~= ClosetGoblinCharacterWindow.copySetIndex
end

function ClosetGoblinCharacterWindow.GetCurrentSet()
	return ClosetGoblin.GetSet(ClosetGoblinCharacterWindow.selectedSetDataIndex)
end

--
-- ActionBar Stuff
--
function ClosetGoblinCharacterWindow.UpdateActionBarSettings()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	if not set then return end
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB1CurrentPageText", L""..set.AbSettings[1])
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB2CurrentPageText", L""..set.AbSettings[2])
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB3CurrentPageText", L""..set.AbSettings[3])
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB4CurrentPageText", L""..set.AbSettings[4])
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB5CurrentPageText", L""..set.AbSettings[5])
	
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB1", set.AbEnabled[1])
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB2", set.AbEnabled[2])
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB3", set.AbEnabled[3])
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB4", set.AbEnabled[4])
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB5", set.AbEnabled[5])
end

local function GetActionBarNumberFromWindowName(windowName)
	if windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB1Up"
	or windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB1Down" then
		return 1
	elseif windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB2Up"
	or windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB2Down" then
		return 2
	elseif windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB3Up"
	or windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB3Down" then
		return 3
	elseif windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB4Up"
	or windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB4Down" then
		return 4
	elseif windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB5Up"
	or windowName == "ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB5Down" then
		return 5
	end
end

function ClosetGoblinCharacterWindow.HotbarPageUpProxy()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local actionBarNumber = GetActionBarNumberFromWindowName(SystemData.MouseOverWindow.name)
	local setting = set.AbSettings[actionBarNumber]
	if setting == 5 then
		setting = 1
	else
		setting = setting + 1
	end
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB"..actionBarNumber.."CurrentPageText", L""..setting)
	set.AbSettings[actionBarNumber] = setting
end

function ClosetGoblinCharacterWindow.HotbarPageDownProxy()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local actionBarNumber = GetActionBarNumberFromWindowName(SystemData.MouseOverWindow.name)
	local setting = set.AbSettings[actionBarNumber]
	if setting == 1 then
		setting = 5
	else
		setting = setting - 1
	end
	LabelSetText("ClosetGoblinCharacterWindowContentsActionBarSettingsPSAB"..actionBarNumber.."CurrentPageText", L""..setting)
	set.AbSettings[actionBarNumber] = setting
end

function ClosetGoblinCharacterWindow.HotbarChangeToggled1()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.AbEnabled[1]
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB1", setting)
	set.AbEnabled[1] = setting
end

function ClosetGoblinCharacterWindow.HotbarChangeToggled2()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.AbEnabled[2]
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB2", setting)
	set.AbEnabled[2] = setting
end

function ClosetGoblinCharacterWindow.HotbarChangeToggled3()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.AbEnabled[3]
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB3", setting)
	set.AbEnabled[3] = setting
end

function ClosetGoblinCharacterWindow.HotbarChangeToggled4()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.AbEnabled[4]
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB4", setting)
	set.AbEnabled[4] = setting
end

function ClosetGoblinCharacterWindow.HotbarChangeToggled5()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.AbEnabled[5]
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsActionBarSettingsCheckboxAB5", setting)
	set.AbEnabled[5] = setting
end

--
--	Show Helm, Guild Heraldry; keeping the same insane naming scheme of the EA CharacterWindow
--
function ClosetGoblinCharacterWindow.ShowCloak()
    --local showCloak = ButtonGetPressedFlag("CharacterWindowContentsEquipmentShowCloak")
    --SetEquippedItemVisible(GameData.EquipSlots.BACK, showCloak)
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.showCloak
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsEquipmentShowCloak", setting)
    if( setting )
    then
        ButtonSetDisabledFlag("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", false)
    else
        ButtonSetDisabledFlag("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", true)
    end
	set.showCloak = setting
	d(L"Toggled Show Cloak setting for "..towstring(set.name)..L" to:", setting)
end

function ClosetGoblinCharacterWindow.ShowCloakHeraldry()
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.showCloakHeraldry
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", setting)
	set.showCloakHeraldry = setting
    d(L"Toggled Show Cloak Heraldry setting for "..towstring(set.name)..L" to:", setting)
end

function ClosetGoblinCharacterWindow.ShowShowCloakOnly()
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloak", true)
    CharacterWindow.CreateTooltip("ClosetGoblinCharacterWindowContentsEquipmentShowCloak", GetString( StringTables.Default.TOOLTIP_SHOW_ITEM ) )
end

function ClosetGoblinCharacterWindow.ShowShowCloakHeraldryOnly()
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", true)
    CharacterWindow.CreateTooltip("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", GetString( StringTables.Default.TOOLTIP_SHOW_HERALDRY ) )
end

function ClosetGoblinCharacterWindow.ShowCloakOptions()
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloak", true)
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", true)
    ClosetGoblinCharacterWindow.EquipmentMouseOver()
end

function ClosetGoblinCharacterWindow.HideCloakOptions()
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloak", false)
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowCloakHeraldry", false)
    ClosetGoblinCharacterWindow.EquipmentMouseOverEnd()
end

function ClosetGoblinCharacterWindow.ShowHelm()			-- on lbutton up
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	local setting = not set.showHelm
    ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsEquipmentShowHelm", setting)
	set.showHelm = setting
    --d(L"Toggled Show Helm setting for "..towstring(set.name)..L" to:", setting)
end

function ClosetGoblinCharacterWindow.ShowShowHelmOnly()	-- on mouseover
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowHelm", true)
    CharacterWindow.CreateTooltip("ClosetGoblinCharacterWindowContentsEquipmentShowHelm", GetString( StringTables.Default.TOOLTIP_SHOW_ITEM ) )
end

function ClosetGoblinCharacterWindow.ShowShowHelm()		-- on mouseover helm
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowHelm", true)
    ClosetGoblinCharacterWindow.EquipmentMouseOver()
end

function ClosetGoblinCharacterWindow.HideShowHelm()		-- on mouseover end
    WindowSetShowing("ClosetGoblinCharacterWindowContentsEquipmentShowHelm", false)
    ClosetGoblinCharacterWindow.EquipmentMouseOverEnd()
end

--
-- ItemRack Setting
--
function ClosetGoblinCharacterWindow.UseItemRackToggled()
	ClosetGoblin.settings.useItemRackOnCharacterWindow = not ClosetGoblin.settings.useItemRackOnCharacterWindow
	ButtonSetPressedFlag("ClosetGoblinCharacterWindowContentsCheckboxUseItemRack", ClosetGoblin.settings.useItemRackOnCharacterWindow)
end
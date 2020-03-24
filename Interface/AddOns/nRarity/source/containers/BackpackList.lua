local BackpackList = nRarity.Container:new("BackpackList", "EA_BackpackWindow")

--~ added this so it'll only set borders when in list view
function BackpackList:EA_Window_Backpack_OnShown()
	if (EA_Window_Backpack.currentlyInListView) then
		self:showBorders()
	end
end

-- setup the function hooks for standard UI actions
function BackpackList:initHooks()

	--~ added hook for when the backpack changes to list view style
	local oldUpdateViewStyle = EA_Window_Backpack.UpdateViewStyle;
	EA_Window_Backpack.UpdateViewStyle = function(...)	
		oldUpdateViewStyle(...);
		
		if (EA_Window_Backpack.currentlyInListView) then
			self:showBorders()
		end
	end

	self:hook("EA_Window_Backpack", "OnShown", BackpackList.EA_Window_Backpack_OnShown, true) --~ original below
	--~ original: self:hook("EA_Window_Backpack", "OnShown", self.showBorders, true)
	self:hook("EA_Window_Backpack", "PopulateListDisplayData", self.setRarity, true)
end

-- create borders for each of the backpack list view slots
function BackpackList:initIcons()

	local anchorName

	-- create borders for item slots, disabling input handling for the items
	for slot = 1, EA_Window_Backpack.MAX_VISIBLE_ROWS do
		anchorName = "EA_Window_BackpackListViewListRow"..slot.."ItemPic"
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.borders
function BackpackList:getItemData(slot)

	if EA_Window_Backpack.displayData and EA_Window_BackpackListViewList.PopulatorIndices then
		local rowIdx = EA_Window_BackpackListViewList.PopulatorIndices[slot]
		if rowIdx then
			local displayData = EA_Window_Backpack.displayData[rowIdx]
			if displayData then
				local slotNum = displayData.slotNum
				if slotNum then
					if EA_Window_Backpack.currentMode == EA_Window_Backpack.TYPE_INVENTORY then
						return DataUtils.GetItems()[slotNum]
					elseif EA_Window_Backpack.currentMode == EA_Window_Backpack.TYPE_CURRENCY then
						return DataUtils.GetCurrencyItems()[slotNum]
					elseif EA_Window_Backpack.currentMode == EA_Window_Backpack.TYPE_CRAFTING then
						return DataUtils.GetCraftingItems()[slotNum]
					end
				end
			end
		end
	end
	
	return nil
end

-- set event handlers for a border
function BackpackList:setEventHandlers(border)
	border:registerCoreEventHandler("OnMouseOver", "EA_Window_Backpack.ListViewInventoryMouseOver")
	border:registerCoreEventHandler("OnMouseOverEnd", "EA_Window_Backpack.MouseOverEquipmentSlotEnd")
	border:registerCoreEventHandler("OnLButtonDown", "BackpackList_EA_Window_Backpack_ListViewInventoryLButtonDown")
	border:registerCoreEventHandler("OnLButtonUp", "EA_Window_Backpack.ListViewInventoryLButtonUp")
	border:registerCoreEventHandler("OnRButtonUp", "EA_Window_Backpack.ListViewInventoryRButtonUp")
end

-- unpress the button as it stays pressed after a shift-click
function BackpackList_EA_Window_Backpack_ListViewInventoryLButtonDown(...)
	EA_Window_Backpack.ListViewInventoryLButtonDown(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

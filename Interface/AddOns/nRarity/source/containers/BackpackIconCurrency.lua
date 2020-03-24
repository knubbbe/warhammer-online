local BackpackIconCurrency = nRarity.Container:new("BackpackIconCurrency", "EA_BackpackWindow")

--~ added this so it'll only update this mode if it's active
function BackpackIconCurrency:EA_Window_Backpack_OnShown()
	if (EA_Window_Backpack.currentlyInListView == false and EA_Window_Backpack.currentMode == EA_Window_Backpack.VIEW_MODE_CURRENCY) then
		self:showBorders()
	end
end

-- setup the function hooks for standard UI actions
function BackpackIconCurrency:initHooks()

	--~ added a hook to show borders when this mode is being set
	local oldUpdateViewStyle = EA_Window_Backpack.UpdateViewStyle;
	EA_Window_Backpack.UpdateViewStyle = function(...)
		local backpackType = ...;		
		oldUpdateViewStyle(...);
		
		if (EA_Window_Backpack.currentlyInListView == false and backpackType == EA_Window_Backpack.currentMode and backpackType == EA_Window_Backpack.VIEW_MODE_CURRENCY) then
			self:showBorders()
		end
	end

	self:hook("EA_Window_Backpack", "OnShown", BackpackIconCurrency.EA_Window_Backpack_OnShown, true) --~ original below
	--~ original: self:hook("EA_Window_Backpack", "OnShown", self.showBorders, true)
	self:hook("EA_Window_Backpack", "OnCurrencySlotUpdated", self.EA_Window_Backpack_OnInventorySlotUpdated)
end

-- create borders for each of the backpack icon view slots
function BackpackIconCurrency:initIcons()

	local pocket, pocketName, buttonIndex, anchorName
	for slot = 1, EA_Window_Backpack.numberOfSlots[EA_Window_Backpack.TYPE_CURRENCY] do

		-- determine the name of the icon button
		pocket = EA_Window_Backpack.GetPocketNumberForSlot(EA_Window_Backpack.TYPE_CURRENCY, slot)
		pocketName = EA_Window_Backpack.GetPocketName(pocket)
		buttonIndex = slot - EA_Window_Backpack.pockets[pocket].firstSlotID  + 1
		anchorName = pocketName.."ButtonsButton"..tostring(buttonIndex)

		-- set the icon
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.borders
function BackpackIconCurrency:getItemData(slot)
	return DataUtils.GetCurrencyItems()[slot]
end

--~ added to return all item data
function BackpackIconCurrency:getAllItemData()
	return DataUtils.GetCurrencyItems()
end

-- post hook for bag changes
function BackpackIconCurrency:EA_Window_Backpack_OnInventorySlotUpdated(updatedSlots, ...)

	-- process the updates
	self:setRarity(updatedSlots)
end

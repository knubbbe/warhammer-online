local BackpackIconInventory = nRarity.Container:new("BackpackIconInventory", "EA_BackpackWindow", "1.3.0")

-- HACK: have we shown the backpack for the first time?
local onShownCalled = false

-- HACK
-- post hook for backpack show - reinit when we show the backpack for the first time
function BackpackIconInventory:EA_Window_Backpack_OnShown()
	if (EA_Window_Backpack.currentMode == EA_Window_Backpack.VIEW_MODE_INVENTORY) then --~ added this if to only update when in this mode
		if onShownCalled then
			self:showBorders()
		else
			onShownCalled = true
			self:reInitShowBorders()
		end
	end
end

-- setup the function hooks for standard UI actions
function BackpackIconInventory:initHooks()

	--~ added a hook to show borders when this mode is being set
	local oldUpdateViewStyle = EA_Window_Backpack.UpdateViewStyle;
	EA_Window_Backpack.UpdateViewStyle = function(...)
		local backpackType = ...;		
		oldUpdateViewStyle(...);
		
		if (EA_Window_Backpack.currentlyInListView == false and backpackType == EA_Window_Backpack.currentMode and backpackType == EA_Window_Backpack.VIEW_MODE_INVENTORY) then
			self:EA_Window_Backpack_OnShown()
		end
	end

	self:hook("EA_Window_Backpack", "OnShown", BackpackIconInventory.EA_Window_Backpack_OnShown, true)
	self:hook("EA_Window_Backpack", "GrowBackpack", self.EA_Window_Backpack_GrowBackpack)
	self:hook("EA_Window_Backpack", "OnInventorySlotUpdated", self.EA_Window_Backpack_OnInventorySlotUpdated)
end

-- create borders for each of the backpack icon view slots
function BackpackIconInventory:initIcons()

	local pocket, pocketName, buttonIndex, anchorName
	for slot = 1, EA_Window_Backpack.numberOfSlots[EA_Window_Backpack.TYPE_INVENTORY] do

		-- determine the name of the icon button
		pocket = EA_Window_Backpack.GetPocketNumberForSlot(EA_Window_Backpack.TYPE_INVENTORY, slot)
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
function BackpackIconInventory:getItemData(slot)
	return DataUtils.GetItems()[slot]
end

--~ added to return all item data
function BackpackIconInventory:getAllItemData()
	return DataUtils.GetItems()
end

-- post hook for bag changes
function BackpackIconInventory:EA_Window_Backpack_OnInventorySlotUpdated(updatedSlots, ...)

	-- process the updates
	self:setRarity(updatedSlots)
end

-- post hook for backpack growth
function BackpackIconInventory:EA_Window_Backpack_GrowBackpack(backpackType, newNumberOfSlots, ...)

	if backpackType == EA_Window_Backpack.TYPE_INVENTORY then
		self:reInitShowBorders()
	end
end

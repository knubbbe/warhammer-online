local BackpackIconCrafting = nRarity.Container:new("BackpackIconCrafting", "EA_BackpackWindow")


-- HACK: have we shown the BackpackIconCrafting for the first time?
local onShownCalled = false

-- HACK
-- post hook for BackpackIconCrafting show - reinit when we show the BackpackIconCrafting for the first time
function BackpackIconCrafting:EA_BackpackWindow_OnShown()
	if (EA_Window_Backpack.currentlyInListView == false and EA_Window_Backpack.currentMode == EA_Window_Backpack.VIEW_MODE_CRAFTING) then --~ added this if to only update when in this mode
		if onShownCalled then
			self:showBorders()
		else
			onShownCalled = true
			self:reInitShowBorders()
		end
	end
end

-- setup the function hooks for standard UI actions
function BackpackIconCrafting:initHooks()

	--~ added a hook to show borders when this mode is being set
	local oldUpdateViewStyle = EA_Window_Backpack.UpdateViewStyle;
	EA_Window_Backpack.UpdateViewStyle = function(...)
		local backpackType = ...;		
		oldUpdateViewStyle(...);
		
		if (EA_Window_Backpack.currentlyInListView == false and backpackType == EA_Window_Backpack.currentMode and backpackType == EA_Window_Backpack.VIEW_MODE_CRAFTING) then
			self:EA_BackpackWindow_OnShown()
		end
	end

	self:hook("EA_Window_Backpack", "OnShown", BackpackIconCrafting.EA_BackpackWindow_OnShown, true)
	self:hook("EA_Window_Backpack", "GrowBackpack", self.EA_Window_Backpack_GrowBackpack)
	self:hook("EA_Window_Backpack", "OnCraftingSlotUpdated", self.EA_Window_Backpack_OnInventorySlotUpdated)
end

-- create borders for each of the backpack icon view slots
function BackpackIconCrafting:initIcons()

	local pocket, pocketName, buttonIndex, anchorName
	for slot = 1, EA_Window_Backpack.numberOfSlots[EA_Window_Backpack.TYPE_CRAFTING] do

		-- determine the name of the icon button
		pocket = EA_Window_Backpack.GetPocketNumberForSlot(EA_Window_Backpack.TYPE_CRAFTING, slot)
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
function BackpackIconCrafting:getItemData(slot)
	return DataUtils.GetCraftingItems()[slot]
end

--~ added to return all item data
function BackpackIconCrafting:getAllItemData()
	return DataUtils.GetCraftingItems()
end

-- post hook for bag changes
function BackpackIconCrafting:EA_Window_Backpack_OnInventorySlotUpdated(updatedSlots, ...)

	-- process the updates
	self:setRarity(updatedSlots)
end

-- post hook for backpack growth
function BackpackIconCrafting:EA_Window_Backpack_GrowBackpack(backpackType, newNumberOfSlots, ...)

	if backpackType == EA_Window_Backpack.TYPE_CRAFTING then
		self:reInitShowBorders()
	end
end
local LootRollWindow = nRarity.Container:new("LootRollWindow", "EA_LootWindow")

-- initialise loot hooks
function LootRollWindow:initHooks()

	self:hook("EA_Window_LootRoll", "PopulateLootData", self.showBorders, true)
end

-- create borders for each of the loot roll window slots
function LootRollWindow:initIcons()

	local anchorName

	-- create borders for item slots
	for row = 1, EA_Window_LootRollList.numVisibleRows do

		anchorName = "EA_Window_LootRollListRow"..row.."Icon"
		if DoesWindowExist(anchorName) then
			self.icons[row] = anchorName
		end
	end
end

-- return item info for an index of self.border
function LootRollWindow:getItemData(slot)

	if EA_Window_LootRoll.lootData and EA_Window_LootRollList.PopulatorIndices and EA_Window_LootRollList.PopulatorIndices[slot] then
		return EA_Window_LootRoll.lootData[EA_Window_LootRollList.PopulatorIndices[slot]].itemData
	end

	return nil
end

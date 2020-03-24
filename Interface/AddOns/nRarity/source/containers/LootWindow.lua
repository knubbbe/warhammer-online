local LootWindow = nRarity.Container:new("LootWindow", "EA_LootWindow")

-- initialise loot hooks
function LootWindow:initHooks()

	self:hook("EA_Window_Loot", "OnShown", self.showBorders, true)
	self:hook("EA_Window_Loot", "PopulateLootData", self.setRarity, true)
end

-- create borders for each of the loot window slots
function LootWindow:initIcons()

	local anchorName

	-- create borders for item slots
	for row = 1, EA_Window_LootList.numVisibleRows do
		anchorName = "EA_Window_LootListRow"..row.."Icon"
		if DoesWindowExist(anchorName) then
			self.icons[row] = anchorName
		end
	end
end

-- return item info for an index of self.border
function LootWindow:getItemData(slot)

	if EA_Window_Loot.lootData and EA_Window_LootList.PopulatorIndices then
		return EA_Window_Loot.lootData[EA_Window_LootList.PopulatorIndices[slot]]
	end

	return nil
end

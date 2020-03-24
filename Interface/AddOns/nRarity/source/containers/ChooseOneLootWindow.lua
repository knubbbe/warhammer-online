local ChooseOneLoot = nRarity.Container:new("ChooseOneLoot", "EA_LootWindow")

-- initialise loot hooks
function ChooseOneLoot:initHooks()

	self:hook("EA_Window_ChooseOneLoot", "PopulateLootData", self.showBorders, true)
end

-- create borders for each of the loot chooser window slots
function ChooseOneLoot:initIcons()

	local anchorName

	-- create borders for item slots
	for row = 1, EA_Window_ChooseOneLootList.numVisibleRows do

		anchorName = "EA_Window_ChooseOneLootListRow"..row.."Icon"
		if DoesWindowExist(anchorName) then
			self.icons[row] = anchorName
		end
	end
end

-- return item info for an index of self.border
function ChooseOneLoot:getItemData(slot)

	if EA_Window_ChooseOneLoot.lootData and EA_Window_ChooseOneLootList.PopulatorIndices and EA_Window_ChooseOneLootList.PopulatorIndices[slot] then
		return EA_Window_ChooseOneLoot.lootData[EA_Window_ChooseOneLootList.PopulatorIndices[slot]]
	end

	return nil
end

local CvBackpackIcon = nRarity.Container:new("CvBackpackIcon", "CharactersViewer")

-- initialise CV hooks
function CvBackpackIcon:initHooks()

	self:hook("CvEA_Window_Backpack", "UpdateBackpackSlots", self.reInitShowBorders, true)
end

-- create borders for each of the character view slots
function CvBackpackIcon:initIcons()
	local pocket, pocketName, buttonIndex, anchorName

	for slot = 1, CvEA_Window_Backpack.NUM_INVENTORY_SLOTS do

		-- determine the name of the icon button
		pocket = CvEA_Window_Backpack.GetPocketNumberForSlot(slot)
		pocketName = CvEA_Window_Backpack.GetPocketName(pocket)
		buttonIndex = slot - CvEA_Window_Backpack.pockets[pocket].firstSlotID  + 1
		anchorName = pocketName.."ButtonsButton"..tostring(buttonIndex)

		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function CvBackpackIcon:getItemData(slot)
	return CharactersViewer.LiveData.GetItems[slot]
end

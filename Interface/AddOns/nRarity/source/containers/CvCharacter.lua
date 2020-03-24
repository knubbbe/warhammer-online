local CvCharacter = nRarity.Container:new("CvCharacter", "CharactersViewer")
CvCharacter:setParentFrameName("CvCharacterWindowContents")

-- initialise CV hooks
function CvCharacter:initHooks()

	self:hook("CvCharacterWindow", "OnShown", self.showBorders, true)
	self:hook("CvCharacterWindow", "Update", self.setRarity, true)
end

-- create borders for each of the character view slots
function CvCharacter:initIcons()

	local anchorName

	-- create borders for equipment only
	for slot, _ in pairs(CvCharacterWindow.EquipmentSlotInfo) do
		anchorName = "CvCharacterWindowContentsEquipmentSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function CvCharacter:getItemData(slot)
	return CvCharacterWindow.GetItem(slot)
end

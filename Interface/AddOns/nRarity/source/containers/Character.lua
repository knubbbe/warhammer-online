local Character = nRarity.Container:new("Character", "EA_CharacterWindow")
Character:setParentFrameName("CharacterWindowContents")

-- initialise equipment/trophy update hooks
function Character:initHooks()

	self:hook("CharacterWindow", "OnShown", self.showBorders, true)
	self:hook("CharacterWindow", "UpdateEquipmentSlot", self.CharacterWindow_UpdateEquipmentSlot)
	self:hook("CharacterWindow", "UpdateTrophySlot", self.CharacterWindow_UpdateTrophySlot)
end

-- create borders for each of the character view slots
function Character:initIcons()

	local anchorName

	-- create borders for equipment only
	for slot, _ in pairs(CharacterWindow.EquipmentSlotInfo) do

		if slot <= CharacterWindow.NUM_EQUIPMENT_SLOTS then
			anchorName = "CharacterWindowContentsEquipmentSlot"..slot
			if DoesWindowExist(anchorName) then
				self.icons[slot] = anchorName
			end
		end
	end

	-- force create borders for trophy slots - these don't exist in CharacterWindow.EquipmentSlotInfo on startup, but do on reload
	for slot = CharacterWindow.NUM_EQUIPMENT_SLOTS + 1, CharacterWindow.NUM_TROPHY_SLOTS + CharacterWindow.NUM_EQUIPMENT_SLOTS do
		anchorName = "CharacterWindowContentsEquipmentSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.borders
function Character:getItemData(slot)
	return CharacterWindow.GetItem(slot)
end

-- post hook for trophy changes
function Character:CharacterWindow_UpdateTrophySlot(updatedSlots, ...)

	if updatedSlots then
		for i, slot in ipairs(updatedSlots) do
			-- the slots passed in updatedSlots need an offset applied to relate them to character screen slots
			updatedSlots[i] = slot + CharacterWindow.NUM_EQUIPMENT_SLOTS
		end
	end

	-- process the updates
	self:setRarity(updatedSlots)
end

-- post hook for equipment changes
function Character:CharacterWindow_UpdateEquipmentSlot(updatedSlots, ...)

	-- process the updates
	self:setRarity(updatedSlots)
end

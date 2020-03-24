local ClosetGob = nRarity.Container:new("ClosetGoblin", "CM_ClosetGoblin")
ClosetGob:setParentFrameName("ClosetGoblinCharacterWindowContents")

-- initialise CG hooks
function ClosetGob:initHooks()

	self:hook("ClosetGoblinCharacterWindow", "Show", self.showBorders, true)
	self:hook("ClosetGoblinCharacterWindow", "UpdateSlotIcons", self.setRarity, true)
end

-- create borders for each of the CG view slots
function ClosetGob:initIcons()

	local anchorName

	-- create borders for equipment only
	for _, slot in pairs(GameData.EquipSlots) do

		anchorName = "ClosetGoblinCharacterWindowContentsEquipmentSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end

	-- create borders for trophy slots
	for slot = GameData.Player.c_TROPHY_START_INDEX, GameData.Player.c_TROPHY_START_INDEX + GameData.Player.c_NUM_TROPHIES do
		anchorName = "ClosetGoblinCharacterWindowContentsEquipmentSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.borders
function ClosetGob:getItemData(slot)
	local set = ClosetGoblinCharacterWindow.GetCurrentSet()
	if set then
		local id = set.slots[slot].id
		if id then
			return ClosetGoblin.FindItem(id)
		end
	end

	return nil
end

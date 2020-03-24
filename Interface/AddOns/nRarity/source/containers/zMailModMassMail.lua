--nRarity.zMailModMassMail = nRarity.Container:new("MailWindow", "OnOpen")
--local zMailModMassMail = nRarity.zMailModMassMail
local zMailModMassMail = nRarity.Container:new("zMailModMassMail", "zMailMod")

-- setup the function hooks for zmailmod mass mail UI actions
function zMailModMassMail:initHooks()

	self:hook("MailWindow", "OnOpen", self.showBorders, true)
	self:hook("MassMailWindow", "QueueAddItem", self.setRarity, true)
	self:hook("MassMailWindow", "QueueRemoveItem", self.setRarity, true)
	self:hook("MassMailWindow", "QueueScrollUp", self.setRarity, true)
	self:hook("MassMailWindow", "QueueScrollDown", self.setRarity, true)
	self:hook("MassMailWindow", "FixSlotsId", self.fixSlotsId, true)
end

-- create borders for each of the mass mail icon slots
function zMailModMassMail:initIcons()

	local anchorName

	-- mass mail icons
	for slot = 1, zMailModData.DEFAULT_SLOTS do
		anchorName = "zMailModMassMailSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function zMailModMassMail:getItemData(slot)

	if zMailModData and zMailModData.OFFSET and zMailModData.SLOTS_IN_ROW and zMailModData.QUEUE then
		slot = zMailModData.OFFSET * zMailModData.SLOTS_IN_ROW + slot
		if zMailModData.QUEUE[slot] then
			return zMailModData.QUEUE[slot].itemData
		end
	end

	return nil
end

-- set event handlers for a border
function zMailModMassMail:setEventHandlers(border)
	border:registerCoreEventHandler("OnLButtonUp", "MassMailWindow.OnSlotLButtonUp")
	border:registerCoreEventHandler("OnRButtonDown", "MassMailWindow.OnSlotRButtonDown")
	border:registerCoreEventHandler("OnMouseOver", "MassMailWindow.OnSlotMouseOver")
	border:registerCoreEventHandler("OnMouseWheel", "MassMailWindow.OnMouseWheel")
end

-- update the window id for each of the borders
function zMailModMassMail:fixSlotsId()
	local border
	for slot, icon in pairs(self.icons) do
		border = self.borders[slot]
		if border and DoesWindowExist(icon) then
			border:setId(WindowGetId(icon))
		end
	end
end

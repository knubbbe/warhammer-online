local MailSend = nRarity.Container:new("MailSend", "EA_MailWindow")

-- initialise mail hooks
function MailSend:initHooks()
	self:hook("MailWindow", "OnOpen", self.showBorders, true)
	self:hook("MailWindowTabSend", "SetItemAttachment", self.setRarity, true)
end

-- create borders for each of the attachment slots
function MailSend:initIcons()

	local anchorName

	-- attachment slots
	for slot = 1, MailWindow.ATTACHMENTS_MAX_ROWS * MailWindow.ATTACHMENTS_MAX_COLS do
		anchorName = "MailWindowTabSendAttachmentSlotsButton"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function MailSend:getItemData(slot)
	local mailItem = MailWindowTabSend.attachments[slot]
	if mailItem then
		if mailItem.backpack == EA_Window_Backpack.TYPE_QUEST then
			return DataUtils.GetQuestItems()[mailItem.slot]
		elseif mailItem.backpack == EA_Window_Backpack.TYPE_INVENTORY then
			return DataUtils.GetItems()[mailItem.slot]
		elseif mailItem.backpack == EA_Window_Backpack.TYPE_CURRENCY then
			return DataUtils.GetCurrencyItems()[mailItem.slot]
		elseif mailItem.backpack == EA_Window_Backpack.TYPE_CRAFTING then
			return DataUtils.GetCraftingItems()[mailItem.slot]
		end
	else
		return nil
	end
end

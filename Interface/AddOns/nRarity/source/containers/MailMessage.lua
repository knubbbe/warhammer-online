local MailMessage = nRarity.Container:new("MailMessage", "EA_MailWindow")

-- initialise mail hooks
function MailMessage:initHooks()
	self:hook("MailWindowTabMessage", "OnOpen", self.showBorders, true)
	self:hook("MailWindowTabMessage", "UpdateMessageAttachments", self.setRarity, true)
end

-- create borders for each of the attachment slots
function MailMessage:initIcons()

	local anchorName

	-- attachment slots
	for slot = 1, MailWindow.ATTACHMENTS_MAX_ROWS * MailWindow.ATTACHMENTS_MAX_COLS do
		anchorName = "MailWindowTabMessageAttachmentSlotsButton"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function MailMessage:getItemData(slot)
	if MailWindowTabMessage.messageBodyTable and MailWindowTabMessage.messageBodyTable.attachments then
		return MailWindowTabMessage.messageBodyTable.attachments[slot]
	end
	return nil
end

local CvBank = nRarity.Container:new("CvBank", "CharactersViewer")
CvBank:setParentFrameName("CvBankWindow")

-- setup the bank hooks
function CvBank:initHooks()
	self:hook("CvCharacterWindow", "OnShown", self.showBorders, true)
	self:hook("CvBankWindow", "UpdateAllBankSlots", self.setRarity, true)
end

-- create borders for each of the character view slots
function CvBank:initIcons()

	local anchorName

	for row = 1, BankWindow.NUM_ROWS do
		for col = 1, BankWindow.NUM_COLS do

			anchorName = "CvBankWindowSlotsRow"..row.."Col"..col
			if DoesWindowExist(anchorName) then
				self.icons[(row - 1) * CvBankWindow.NUM_COLS + col] = anchorName
			end
		end
	end
end

-- return item info for an index of self.border
function CvBank:getItemData(slot)
	return CharactersViewer.LiveData.GetBankData[slot]
end

-- set event handlers for a border
function CvBank:setEventHandlers(border)
	border:registerCoreEventHandler("OnMouseOver", "CvBankWindow.EquipmentMouseOver")
end

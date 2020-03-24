local CvBackpackList = nRarity.Container:new("CvBackpackList", "CharactersViewer")

-- initialise CV hooks
function CvBackpackList:initHooks()

	self:hook("CvEA_Window_Backpack", "OnShown", self.showBorders, true)
	self:hook("CvEA_Window_Backpack", "PopulateListDisplayData", self.setRarity, true)
end

-- create borders for each of the character view slots
function CvBackpackList:initIcons()

	local anchorName

	-- create borders for item slots
	for row = 1, CvEA_Window_Backpack.MAX_VISIBLE_ROWS do
		anchorName = "CvEA_Window_BackpackListViewListRow"..row.."ItemPic"
		if DoesWindowExist(anchorName) then
			self.icons[row] = anchorName
		end
	end
end

-- return rarity for an index of self.border
function CvBackpackList:getItemData(slot)
	local dataIdx = ListBoxGetDataIndex(CvEA_Window_Backpack.windowName.."ListViewList", slot)
	if dataIdx and CvEA_Window_Backpack.displayData and CvEA_Window_Backpack.displayData[dataIdx] then
		local slotNum = CvEA_Window_Backpack.displayData[dataIdx].slotNum
		if slotNum and CharactersViewer.LiveData.GetItems then
			return CharactersViewer.LiveData.GetItems[slotNum]
		end
	end

	return nil
end

-- set event handlers for a border
function CvBackpackList:setEventHandlers(border)
	border:registerCoreEventHandler("OnMouseOver", "CvEA_Window_Backpack.ListViewInventoryMouseOver")
	border:registerCoreEventHandler("OnMouseOverEnd", "CvEA_Window_Backpack.MouseOverEquipmentSlotEnd")
end

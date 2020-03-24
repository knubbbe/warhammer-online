local nLL = nRarity.Container:new("nLL", "nLootLink")

-- setup the function hooks for lootlink actions
function nLL:initHooks()

	self:hook("nLootLinkGUI", "init", self.initIconsLate, true)
	self:hook("nLootLinkGUI", "onShown", self.showBorders, true)
	self:hook("nLootLinkGUI", "populateListDisplayData", self.setRarity, true)
end

-- create borders for each of the nLootLink list view slots
function nLL:initIconsLate()

	local anchorName

	-- create borders for item slots, disabling input handling for the items
	if nLootLinkGUIList then
		for row = 1, nLootLinkGUIList.numVisibleRows do
			anchorName = "nLootLinkGUIListRow"..row.."ItemPic"
			if DoesWindowExist(anchorName) then
				self.icons[row] = anchorName
			end
		end
	end
end

-- return item info for an index of self.border
function nLL:getItemData(slot)
	if nLootLinkData.listData and nLootLinkGUIList.PopulatorIndices and nLootLinkGUIList.PopulatorIndices[slot] then
		return nLootLinkData.listData[nLootLinkGUIList.PopulatorIndices[slot]]
	end
	
	return nil
end

-- set event handlers for a border
function nLL:setEventHandlers(border)
	border:registerCoreEventHandler("OnMouseOver", "nLootLinkGUI.itemMouseOver")
	border:registerCoreEventHandler("OnLButtonDown", "nLL_nLootLinkGUI_itemMouseDownL")
end

-- unpress the button as it stays pressed after a shift-click
function nLL_nLootLinkGUI_itemMouseDownL(...)
	nLootLinkGUI.itemMouseDownL(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

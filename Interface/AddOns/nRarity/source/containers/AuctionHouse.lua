local AuctionHouse = nRarity.Container:new("AuctionHouse", "EA_AuctionHouseWindow")

-- setup the function hooks for auction actions
function AuctionHouse:initHooks()

	self:hook("AuctionWindow", "OnShown", self.showBorders, true)
	self:hook("AuctionWindow", "PopulateSearchResults", self.setRarity, true)
end

-- create borders for the auctioned item
function AuctionHouse:initIcons()

	local anchorName

	-- create borders for item slots
	for row = 1, 7 do
		anchorName = "AuctionWindowListRow"..row.."Icon"
		if DoesWindowExist(anchorName) then
			self.icons[row] = anchorName
		end
	end
end

-- return item info for an index of self.border
function AuctionHouse:getItemData(slot)
	local currentWindowData = AuctionWindowListDataManager.GetCurrentWindowData()

	if currentWindowData and currentWindowData.searchResultsData and AuctionWindowList.PopulatorIndices then
		local itemIndex = AuctionWindowList.PopulatorIndices[slot]
		if itemIndex then
			local searchData = currentWindowData.searchResultsData[itemIndex]
			if searchData then
				return searchData.itemData
			end
		end
	end

	return nil
end

-- set event handlers for a border
function AuctionHouse:setEventHandlers(border)
	border:registerCoreEventHandler("OnMouseOver", "AuctionWindow.OnMouseOverResultsIcon")
end

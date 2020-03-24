local AuctionHouseItem = nRarity.Container:new("AuctionHouseItem", "EA_AuctionHouseWindow")

-- constants
local ICON_NAME = "AuctionWindowSellControlsItemImage"

-- locals
local itemData

-- setup the function hooks for auction actions
function AuctionHouseItem:initHooks()

	self:hook("AuctionWindow", "OnShown", self.showBorders, true)
	self:hook("AuctionWindowSellControls", "UpdateForItem", self.updateForItem, false)
	self:hook("AuctionWindowSellControls", "Clear", self.clear, false)
end

-- create borders for the auctioned item
function AuctionHouseItem:initIcons()

	self.icons[1] = ICON_NAME
end

-- return item info for an index of self.border
function AuctionHouseItem:getItemData(slot)
	return itemData
end

-- item data changed
function AuctionHouseItem:updateForItem(itemDataPassed)
	itemData = itemDataPassed

	self:setRarity()
end

-- item data removed
function AuctionHouseItem:clear()
	itemData = nil

	self:setRarity()
end

-- set event handlers for a border
function AuctionHouseItem:setEventHandlers(border)
	border:registerCoreEventHandler("OnLButtonDown", "AuctionWindowSellControls.ItemSlotLButtonDown")
	border:registerCoreEventHandler("OnLButtonUp", "AuctionWindowSellControls.ItemSlotLButtonUp")
	border:registerCoreEventHandler("OnRButtonUp", "AuctionWindowSellControls.ItemSlotRButtonUp")
	border:registerCoreEventHandler("OnMouseOver", "AuctionWindowSellControls.ItemSlotMouseOver")
end

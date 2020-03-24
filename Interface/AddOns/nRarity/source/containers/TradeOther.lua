local TradeOther = nRarity.Container:new("TradeOther", "EA_TradeWindow")

-- initialise trade hooks
function TradeOther:initHooks()

	self:hook("EA_Window_Trade", "OnShown", self.showBorders, true)
	self:hook("EA_Window_Trade", "DisplayOtherPlayersOffer", self.setRarity, true)
end

-- create borders for each of the Trade slots
function TradeOther:initIcons()

	local anchorName

	-- other's items
	for slot = 1, EA_Window_Trade.NUM_TRADE_SLOTS do
		anchorName = "EA_Window_TradeOtherTradeOfferSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function TradeOther:getItemData(slot)
	return EA_Window_Trade.otherOfferItemData[slot]
end

-- set event handlers for a border
function TradeOther:setEventHandlers(border)
	border:registerCoreEventHandler("OnLButtonDown", "EA_Window_Trade.ItemSlotLButtonDown")
	border:registerCoreEventHandler("OnLButtonUp", "EA_Window_Trade.ItemSlotLButtonUp")
	border:registerCoreEventHandler("OnRButtonUp", "EA_Window_Trade.ItemSlotRButtonUp")
	border:registerCoreEventHandler("OnMouseOver" ,"EA_Window_Trade.ItemSlotMouseOver")
end

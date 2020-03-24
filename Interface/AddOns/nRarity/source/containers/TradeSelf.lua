local TradeSelf = nRarity.Container:new("TradeSelf", "EA_TradeWindow")

-- initialise trade hooks
function TradeSelf:initHooks()

	self:hook("EA_Window_Trade", "OnShown", self.showBorders, true)
	self:hook("EA_Window_Trade", "DisplayMyOffer", self.setRarity, true)
end

-- create borders for each of the Trade slots
function TradeSelf:initIcons()

	local anchorName

	-- own items
	for slot = 1, EA_Window_Trade.NUM_TRADE_SLOTS do
		anchorName = "EA_Window_TradeUserTradeOfferSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function TradeSelf:getItemData(slot)
	return EA_Window_Trade.myOfferItemData[slot]
end

-- set event handlers for a border
function TradeSelf:setEventHandlers(border)
	border:registerCoreEventHandler("OnLButtonDown", "EA_Window_Trade.ItemSlotLButtonDown")
	border:registerCoreEventHandler("OnLButtonUp", "EA_Window_Trade.ItemSlotLButtonUp")
	border:registerCoreEventHandler("OnRButtonUp", "EA_Window_Trade.ItemSlotRButtonUp")
	border:registerCoreEventHandler("OnMouseOver" ,"EA_Window_Trade.ItemSlotMouseOver")
end

local Bank = nRarity.Container:new("Bank", "EA_BankWindow")
Bank:setParentFrameName("BankWindow")

-- setup the bank hooks
function Bank:initHooks()

	--~ added these hooks so that slots are only updated when needed
	local bankUpdatesToSkip = nil;
	local oldSwitchTabs = BankWindow.SwitchTabs;
	BankWindow.SwitchTabs = function(...)
		oldSwitchTabs(...);
		
		self:setRarity();
	end
	
	local oldUpdateBankSlots = BankWindow.UpdateBankSlots;
	BankWindow.UpdateBankSlots = function(updatedSlots, ...)
		oldUpdateBankSlots(updatedSlots, ...);
		
		-- all slots are updated when the bank is first shown, so skip all updates until the last item is updated
		if (bankUpdatesToSkip) then
			bankUpdatesToSkip = bankUpdatesToSkip - 1;
			if (bankUpdatesToSkip > 0) then
				return;
			else
				bankUpdatesToSkip = nil;
			end
		end
		
		self:setRarity(updatedSlots);
	end
	
	local oldOnShown = BankWindow.OnShown;
	BankWindow.OnShown = function(...)
		oldOnShown(...);
		
		bankUpdatesToSkip = #DataUtils.GetBankData();
		self:showBorders();
	end

	--self:hook("BankWindow", "OnShown", self.showBorders, true)
	--self:hook("BankWindow", "UpdateBankSlots", self.setRarity, true)
	--self:hook("BankWindow", "SwitchTabs", self.setRarity, true)
end

-- create borders for each of the bank slots
function Bank:initIcons()
	local anchorName
	for slot = 1, 80 do
			anchorName = "BankWindowSlotsButton"..slot
			if DoesWindowExist(anchorName) then
				WindowSetId(anchorName, slot)
				self.icons[slot] = anchorName
			end
	end
end

function BankWindow_EquipmentMouseOver( )
	local buttonIndex = WindowGetId(SystemData.MouseOverWindow.name)
	local slot        = BankWindow.GetSlotNumberForButtonIndex( buttonIndex )  
    local itemData    = BankWindow.GetItem( slot ) 
	
    if not DataUtils.IsValidItem( itemData ) then
        Tooltips.ClearTooltip()
    else 
        Tooltips.CreateAndTintItemTooltip( itemData, 
                                           SystemData.MouseOverWindow.name,
                                           Tooltips.ANCHOR_WINDOW_RIGHT, 
                                           Tooltips.ENABLE_COMPARISON )
    end
end

-- return item info for an index of self.border
function Bank:getItemData(slot)
	return DataUtils.GetBankData()[((BankWindow.currentTabNumber - 1)* 80) + slot]
end

--~ added to return all item data
function Bank:getAllItemData()
	local itemData = {};
	local bankData = DataUtils.GetBankData();
	
	for slot = 1, 80 do
		local item = bankData[(BankWindow.currentTabNumber - 1) * 80 + slot];
		if (not item) then -- if the item is nil, all further items are also nil (basically means the slots havn't been purchased yet)
			break;
		end
		itemData[slot] = item;
	end
	
	return itemData;
end

-- set event handlers for a border
function Bank:setEventHandlers(border)
	border:registerCoreEventHandler("OnMouseOver", "BankWindow_EquipmentMouseOver")
end

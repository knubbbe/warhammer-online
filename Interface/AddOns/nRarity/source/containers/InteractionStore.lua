local InteractionStore = nRarity.Container:new("InteractionStore", "EA_InteractionWindow")

-- setup the function hooks for standard UI actions
function InteractionStore:initHooks()
	self:hook("EA_Window_InteractionStore", "OnShown", self.showBorders, true)
	self:hook("EA_Window_InteractionStore", "PopulateStoreItemData", self.setRarity, true)
end

-- create borders for each of the InteractionStore view slots
function InteractionStore:initIcons()

	local anchorName

	-- create borders for item slots
	for row = 1, EA_Window_InteractionStore.MAX_VISIBLE_ROWS do
		anchorName = "EA_Window_InteractionStoreListRow"..row.."ItemPic"
		if DoesWindowExist(anchorName) then
			self.icons[row] = anchorName
		end
	end
end

-- return item info for an index of self.border
function InteractionStore:getItemData(slot)
	if EA_Window_InteractionStore.displayData and EA_Window_InteractionStoreList.PopulatorIndices and EA_Window_InteractionStoreList.PopulatorIndices[slot] then
		return EA_Window_InteractionStore.displayData[EA_Window_InteractionStoreList.PopulatorIndices[slot]]
	end
	
	return nil
end

-- set event handlers for a border
function InteractionStore:setEventHandlers(border)
	border:registerCoreEventHandler("OnMouseOver", "EA_Window_InteractionStore.MouseOverStoreItem")
	border:registerCoreEventHandler("OnLButtonUp", "EA_Window_InteractionStore.OnItemLButtonUp")
	border:registerCoreEventHandler("OnLButtonDown", "InteractionStore_EA_Window_InteractionStore_OnItemLButtonDown")
	border:registerCoreEventHandler("OnRButtonUp", "EA_Window_InteractionStore.OnItemRButtonUp")
end

-- unpress the button as it stays pressed after a shift-click
function InteractionStore_EA_Window_InteractionStore_OnItemLButtonDown(...)
	EA_Window_InteractionStore.OnItemLButtonDown(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

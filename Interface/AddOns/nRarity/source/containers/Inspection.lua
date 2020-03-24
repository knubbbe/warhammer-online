local Inspection = nRarity.Container:new("Inspection", "EA_InspectionWindow")
Inspection:setParentFrameName("EA_Window_InspectionContents")

-- initialise inspection hooks
function Inspection:initHooks()

	self:hook("EA_Window_Inspection", "OnShown", self.showBorders, true)
	self:hook("EA_Window_Inspection", "RefreshContents", self.setRarity, true)
end

-- create borders for each of the inspection view slots
function Inspection:initIcons()

	local anchorName

	-- create borders for equipment only
	for slot, _ in pairs(EA_Window_Inspection.EquipmentSlotInfo) do

		if slot <= EA_Window_Inspection.NUM_EQUIPMENT_SLOTS then
			anchorName = "EA_Window_InspectionContentsEquipmentSlot"..slot
			if DoesWindowExist(anchorName) then
				self.icons[slot] = anchorName
			end
		end
	end

	-- force create borders for trophy slots - these don't exist in inspectionWindow.EquipmentSlotInfo on startup, but do on reload
	for slot = EA_Window_Inspection.NUM_EQUIPMENT_SLOTS + 1, EA_Window_Inspection.NUM_TROPHY_SLOTS + EA_Window_Inspection.NUM_EQUIPMENT_SLOTS do
		anchorName = "EA_Window_InspectionContentsEquipmentSlot"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function Inspection:getItemData(slot)
	-- EA_Window_Inspection.GetItem is broken; access the data directly
	if EA_Window_Inspection.equipmentData then
		return EA_Window_Inspection.equipmentData[slot]
	end

	return nil
end

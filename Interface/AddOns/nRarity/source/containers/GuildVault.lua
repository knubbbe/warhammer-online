local GuildVault = nRarity.Container:new("GuildVault", "EA_GuildVaultWindow")

-- HACK: have we shown the guildvault for the first time?
local onShownCalled = false

-- HACK
-- post hook for guildvault show - reinit when we show the guildvault for the first time
function GuildVault:EA_GuildVaultWindow_OnGuildVaultOpened()
	if onShownCalled then
		self:showBorders()
	else
		onShownCalled = true
		self:reInitShowBorders()
	end
end

-- setup the function hooks for standard UI actions
function GuildVault:initHooks()

	self:hook("GuildVaultWindow", "OnGuildVaultOpened", GuildVault.EA_GuildVaultWindow_OnGuildVaultOpened, true)
	self:hook("GuildVaultWindow", "UpdateVaultSlots", self.setRarity, true)
	self:hook("GuildVaultWindow", "UpdateItemsInVault", self.setRarity, true)
	self:hook("GuildVaultWindow", "SelectTab", self.setRarity, true)
end

-- create borders for each of the guild vault slots
function GuildVault:initIcons()
	local anchorName

	-- vault slots
	for slot = 1, 60 do
		anchorName = "GuildVaultWindowSlotsButton"..slot
		if DoesWindowExist(anchorName) then
			self.icons[slot] = anchorName
		end
	end
end

-- return item info for an index of self.border
function GuildVault:getItemData(slot)

	if GuildVaultWindow.SelectedVault then
		return GuildVaultWindow.GetItemDataFromVaultSlot(GuildVaultWindow.SelectedVault, slot)
	else
		return nil
	end
end

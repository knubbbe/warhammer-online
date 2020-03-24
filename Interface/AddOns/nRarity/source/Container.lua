nRarity.Container = {}
local Container = nRarity.Container

-- referenced classes
local Border = nRarity.Border

-- constructor
function Container:new(name, addonName)

	-- OO init
	local o = {}
	setmetatable(o, self)
	self.__index = self

	-- members
	o.icons = {}
	o.borders = {}
	o.hooked = {}
	o.initialised = false
	o.name = name
	o.addonName = addonName

	-- add the container to the list
	nRarity.containers[o.name] = o 

	return o
end

-- initialise the class
function Container:init()
	if not self.initialised then
		self:initIcons()
		self:initHooks()
		self.initialised = true
	end
end

-- abstract: initialise icons for the container
function Container:initIcons()
end

-- abstract: initialise hooks specific to the container
function Container:initHooks()
end

-- abstract: return item info for an index of self.icons
function Container:getItemData(slot)
	return nil
end

--~ used by the backpacks to get all item data at once
function Container:getAllItemData()
	return nil
end

-- delete existing borders then build new ones
function Container:reInitShowBorders()

	-- get rid of all the existing borders
	self:deleteIcons()

	-- recreate the icons and show them
	self:initIcons()
	self:showBorders()
end

-- hook a function by function reference
function Container:hook(curOwner, curName, hookFn, noArgs)
	if _G[curOwner] and _G[curOwner][curName] then
		table.insert(self.hooked, _G[curOwner][curName])
		local id = table.maxn(self.hooked)
		if noArgs then
			_G[curOwner][curName] = function(...)
				self.hooked[id](...)
				hookFn(self)
			end
		else
			_G[curOwner][curName] = function(...)
				self.hooked[id](...)
				hookFn(self, ...)
			end
		end
	end
end

-- clear all icons
function Container:deleteIcons()
	self.icons = {}
	self:deleteBorders()
end

-- delete all borders
function Container:deleteBorders()
	for _, border in pairs(self.borders) do
		border:delete()
	end
	self.borders = {}
end

-- set the frame to parent borders to
function Container:setParentFrameName(parentFrameName)
	self.parentFrameName = parentFrameName
end

-- apply the item info to all or some icons
function Container:setRarity(updatedSlots)
	local border
	local itemData = self:getAllItemData(slot) --~ used by the backpacks to get all the data at once. all the nested loop calls seemed to cause a 0.3s lag
	
	if updatedSlots then
		local icon
		for _, slot in ipairs(updatedSlots) do
			if slot ~= 0 then
				icon = self.icons[slot]
				if icon then
					border = self.borders[slot]
					if border then
						if (itemData) then --~ for all items
							border:setRarity(itemData[slot]);
						else
							border:setRarity(self:getItemData(slot)); --~ original
						end
					end
				end
			end
		end
	else
		for slot, icon in pairs(self.icons) do
			border = self.borders[slot]
			if border then
				if (itemData) then --~ for all items
					border:setRarity(itemData[slot]);
				else
					border:setRarity(self:getItemData(slot)); --~ original
				end
			end
		end
	end
end

-- show each of the borders, creating them if necessary
function Container:showBorders()

	local border

	for slot, icon in pairs(self.icons) do

		-- create the border if necessary
		if not self.borders[slot] and DoesWindowExist(icon) then
			border = Border:new(icon, self.parentFrameName or icon)
			if self.setEventHandlers then
				-- have the border take over input from the icon
				border:setId(WindowGetId(icon))
				border:setParent(WindowGetParent(icon))
				--~ commented out the below, because they're not used for anything
				--WindowSetHandleInput(icon, false)
				--border:setHandleInput(true)
				--self:setEventHandlers(border, slot)
			end
			self.borders[slot] = border
		end
	end

	self:setRarity()
end

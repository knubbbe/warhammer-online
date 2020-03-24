nRarity.Border = {}
local Border = nRarity.Border

-- constants
local COLOUR_HIGHLIGHT = { r = 255, g = 255, b = 0 }

-- local (static)
local nextBorderId = 1

-- constructor
function Border:new(anchorName, parentName)

	-- OO init
	local o = {}
	setmetatable(o, self)
	self.__index = self

	-- initialise members
	o.name = "nRarity"..nextBorderId
	nextBorderId = nextBorderId + 1

	if not DoesWindowExist(o.name) and DoesWindowExist(anchorName) and DoesWindowExist(parentName) then
		-- create the window
		CreateWindowFromTemplate(o.name, "nRarityBorderButton", parentName)
		WindowAddAnchor(o.name, "center", anchorName, "center", 0, 0)
		WindowSetScale(o.name, WindowGetDimensions(anchorName) / WindowGetDimensions(o.name) * WindowGetScale(anchorName))
		WindowSetLayer(o.name, WindowGetLayer(anchorName) + 1) --~ added +1 so that the border is always shown above the original
		WindowSetShowing(o.name, true)
		--WindowSetHandleInput(o.name, false) --~ commented this because setting handled input is no longer needed (false by default)
	end

	return o
end

-- destructor
function Border:delete()
	if DoesWindowExist(self.name) then
		DestroyWindow(self.name)
	end
end

-- set the colour to rarity
function Border:setRarity(itemData)
	local id = (itemData and itemData.id) or -1; --~ added these 3 lines to not update the color when this border is already set to the item
	if (self.itemId == id) then return end
	self.itemData = id;
	
	if DoesWindowExist(self.name) then
		local colour = DataUtils.GetItemRarityColor(itemData)
		WindowSetTintColor(self.name, colour.r, colour.g, colour.b)
	end
end

-- set the colour to highlighted or rarity
function Border:setHighlight()
	WindowSetTintColor(self.name, COLOUR_HIGHLIGHT.r, COLOUR_HIGHLIGHT.g, COLOUR_HIGHLIGHT.b)
end

-- set the handle input property on the border
function Border:setHandleInput(handleInput)
	WindowSetHandleInput(self.name, handleInput)
end

-- set window id
function Border:setId(id)
	WindowSetId(self.name, id)
end

-- register a core event handler
function Border:registerCoreEventHandler(event, handler)
	WindowUnregisterCoreEventHandler(self.name, event)
	WindowRegisterCoreEventHandler(self.name, event, handler)
end

-- set the border's parent
function Border:setParent(parentName)
	WindowSetParent(self.name, parentName)
end

-- set the border's visibility
function Border:setShowing(showing)
	WindowSetShowing(self.name, showing)
end

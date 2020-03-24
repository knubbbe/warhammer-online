local InteractionInfluenceRewards = nRarity.Container:new("InteractionInfluenceRewards", "EA_InteractionWindow")

-- calculate the level and reward based on slot
local function calculateLevelReward(slot)
	local level = math.floor((slot - 1) / TomeWindow.MAX_REWARDS_PER_LEVEL) + 1
	local reward = math.fmod(slot - 1, TomeWindow.MAX_REWARDS_PER_LEVEL) + 1

	return level, reward
end

-- calculate the anchor name based on level and reward
local function calculateAnchorName(level, reward)
	return "EA_Window_InteractionInfluenceRewardsLevel"..tostring(level).."Reward"..tostring(reward)
end

-- calculate the slot number based on level and reward
local function calculateSlot(level, reward)
	return (level - 1) * TomeWindow.MAX_REWARDS_PER_LEVEL + reward
end

-- setup the function hooks for standard UI actions
function InteractionInfluenceRewards:initHooks()

	self:hook("EA_Window_InteractionInfluenceRewards", "Show", self.showHideBorders, true)
	self:hook("EA_Window_InteractionInfluenceRewards", "OnSelectInfluenceReward", self.selectInfluenceReward, true)
end

-- create borders for each of the InteractionInfluenceRewards view slots
function InteractionInfluenceRewards:initIcons()

	local anchorName

	for level = 1, TomeWindow.NUM_REWARD_LEVELS do
		for reward = 1, TomeWindow.MAX_REWARDS_PER_LEVEL do
			anchorName = calculateAnchorName(level, reward)
			if DoesWindowExist(anchorName) then
				self.icons[calculateSlot(level, reward)] = anchorName
			end
		end
	end
end

-- show the borders for the rewards that are shown
function InteractionInfluenceRewards:showHideBorders()
	self:showBorders()

	local anchorName, border

	for level = 1, TomeWindow.NUM_REWARD_LEVELS do
		for reward = 1, TomeWindow.MAX_REWARDS_PER_LEVEL do
			anchorName = calculateAnchorName(level, reward)
			border = self.borders[calculateSlot(level, reward)]
			if border and DoesWindowExist(anchorName) then
				border:setShowing(WindowGetShowing(anchorName))
			else
				border:setShowing(false)
			end
		end
	end
end

-- return item info for an index of self.border
function InteractionInfluenceRewards:getItemData(slot)

	local level, reward = calculateLevelReward(slot)

	-- retrieve the item, after finding the reward number
	if level and EA_Window_InteractionInfluenceRewards.rewardData then
		local rewardData = EA_Window_InteractionInfluenceRewards.rewardData[level]
		if rewardData then
			return rewardData[reward]
		end
	end

	return nil
end

-- set event handlers for a border
function InteractionInfluenceRewards:setEventHandlers(border)

	border:registerCoreEventHandler("OnMouseOver", "EA_Window_InteractionInfluenceRewards.OnMouseOverInfluenceReward")
	border:registerCoreEventHandler("OnLButtonUp", "EA_Window_InteractionInfluenceRewards.OnSelectInfluenceReward")
end

-- highlight the border if the button has been pressed
function InteractionInfluenceRewards:selectInfluenceReward()

	local anchorName, border

	-- reset rarity colours
	self:setRarity()

	-- highlight pressed items
	for level = 1, TomeWindow.NUM_REWARD_LEVELS do
		for reward = 1, TomeWindow.MAX_REWARDS_PER_LEVEL do
			border = self.borders[calculateSlot(level, reward)]
			anchorName = calculateAnchorName(level, reward)
			if border and DoesWindowExist(anchorName) and ButtonGetPressedFlag(anchorName) and not ButtonGetDisabledFlag(anchorName) then
				border:setHighlight()
			end
		end
	end
end

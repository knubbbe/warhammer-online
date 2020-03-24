local TomeWarJournal = nRarity.Container:new("TomeWarJournal", "EA_TomeOfKnowledge")

-- calculate the level and reward based on slot
local function calculateLevelReward(slot)
	local level = math.floor((slot - 1) / TomeWindow.MAX_REWARDS_PER_LEVEL) + 1
	local reward = math.fmod(slot - 1, TomeWindow.MAX_REWARDS_PER_LEVEL) + 1

	return level, reward
end

-- calculate the anchor name based on level and reward
local function calculateAnchorName(level, reward)
	return "WarJournalEntryLevel"..tostring(level).."Reward"..tostring(reward)
end

-- calculate the slot number based on level and reward
local function calculateSlot(level, reward)
	return (level - 1) * TomeWindow.MAX_REWARDS_PER_LEVEL + reward
end

-- setup the function hooks for standard UI actions
function TomeWarJournal:initHooks()

	-- rewards updated
	self:hook("TomeWindow", "UpdateWarJournalEntry", self.showHideBorders, true)
end

-- create borders for each of the TomeWarJournal view slots
function TomeWarJournal:initIcons()

	local anchorName

	for level = 1, TomeWindow.NUM_REWARD_LEVELS do
		for reward = 1, TomeWindow.MAX_REWARDS_PER_LEVEL do
			anchorName = calculateAnchorName(level, reward)
			self.icons[calculateSlot(level, reward)] = anchorName
		end
	end
end

-- return item info for an index of self.border
function TomeWarJournal:getItemData(slot)

	local level, reward = calculateLevelReward(slot)

	if TomeWindow.WarJournal and TomeWindow.WarJournal.CurEntryData then
		local influenceRewards = GameData.GetInfluenceRewards(TomeWindow.WarJournal.CurEntryData.influenceId)
		if influenceRewards then
			local levelRewards = influenceRewards[level]
			if levelRewards then
				return levelRewards[reward]
			end
		end
	end

	return nil
end

-- show the borders for the rewards that are shown
function TomeWarJournal:showHideBorders()
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

-- set event handlers for a border
function TomeWarJournal:setEventHandlers(border, slot)
	local level = calculateLevelReward(slot)

	border:registerCoreEventHandler("OnMouseOver", "TomeWindow.OnMouseOverInfluenceRewardLevel"..tostring(level))
	border:registerCoreEventHandler("OnLButtonDown", "TomeWarJournal_TomeWindow_OnLButtonDownInfluenceRewardLevel"..tostring(level))
end

-- unpress the button as it stays pressed after a shift-click
function TomeWarJournal_TomeWindow_OnLButtonDownInfluenceRewardLevel1(...)
	TomeWindow.OnLButtonDownInfluenceRewardLevel1(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

-- unpress the button as it stays pressed after a shift-click
function TomeWarJournal_TomeWindow_OnLButtonDownInfluenceRewardLevel2(...)
	TomeWindow.OnLButtonDownInfluenceRewardLevel2(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

-- unpress the button as it stays pressed after a shift-click
function TomeWarJournal_TomeWindow_OnLButtonDownInfluenceRewardLevel3(...)
	TomeWindow.OnLButtonDownInfluenceRewardLevel3(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

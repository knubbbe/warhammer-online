local InteractionQuest = nRarity.Container:new("InteractionQuest", "EA_InteractionWindow")

-- setup the function hooks for standard UI actions
function InteractionQuest:initHooks()

	self:hook("EA_Window_InteractionQuest", "OnShown", self.showHideBorders, true)
	self:hook("EA_Window_InteractionQuest", "SelectRewardChoice", self.selectRewardChoice, true)
end

-- create borders for each of the InteractionQuest view slots
function InteractionQuest:initIcons()

	local anchorName

	-- create borders for reward choices
	for reward = 1, EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS do

		anchorName = "EA_Window_InteractionQuestInfoScrollChildChoiceReward"..reward

		--self:addIcon(reward, "nRarity_Button_DefaultIconFrame", anchorName, "EA_Window_InteractionQuestInfoScrollChild")
		if DoesWindowExist(anchorName) then
			self.icons[reward] = anchorName
		end
	end

	-- create a border for the given rewards
	for reward = 1, EA_Window_InteractionQuest.NUM_GIVEN_REWARD_SLOTS do

		anchorName = "EA_Window_InteractionQuestInfoScrollChildRewards"..reward

		--self:addIcon(reward + EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS, "nRarity_Button_DefaultIconFrame", anchorName, "EA_Window_InteractionQuestInfoScrollChild")
		if DoesWindowExist(anchorName) then
			self.icons[reward + EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS] = anchorName
		end
	end
end

-- return item info for an index of self.border
function InteractionQuest:getItemData(slot)

	-- given reward
	if slot > EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS then

		if TomeWindow.QuestJournal and TomeWindow.QuestJournal.visibleQuestRewardItems then
			-- take away the money reward if it's there
			if TomeWindow.QuestJournal.visibleQuestRewardItems.money and TomeWindow.QuestJournal.visibleQuestRewardItems.money > 0 then
				slot = slot - 1
			end
	
			-- take away the XP reward if it's there
			if TomeWindow.QuestJournal.visibleQuestRewardItems.xp and TomeWindow.QuestJournal.visibleQuestRewardItems.xp > 0 then
				slot = slot - 1
			end
			if EA_Window_InteractionQuest.givenRewardsData then
				return EA_Window_InteractionQuest.givenRewardsData[slot - EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS]
			end
		end

	-- choice reward
	else
		if EA_Window_InteractionQuest.choiceRewardsData then
			return EA_Window_InteractionQuest.choiceRewardsData[slot]
		end
	end

	return nil
end

-- show the borders for the rewards that are shown
function InteractionQuest:showHideBorders()
	self:showBorders()

	local anchorName, border

	-- reward choices
	for reward = 1, EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS do

		anchorName = "EA_Window_InteractionQuestInfoScrollChildChoiceReward"..reward
		border = self.borders[reward]

		if border and DoesWindowExist(anchorName) then
			border:setShowing(WindowGetShowing(anchorName))
		else
			border:setShowing(false)
		end
	end

	-- given rewards
	for reward = 1, EA_Window_InteractionQuest.NUM_GIVEN_REWARD_SLOTS do

		anchorName = "EA_Window_InteractionQuestInfoScrollChildRewards"..reward
		border = self.borders[reward + EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS]

		if border and DoesWindowExist(anchorName) then
			border:setShowing(WindowGetShowing(anchorName))
		else
			border:setShowing(false)
		end
	end
end

-- set event handlers for a border
function InteractionQuest:setEventHandlers(border, slot)

	if slot > EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS then
		border:registerCoreEventHandler("OnMouseOver", "EA_Window_InteractionQuest.OnMouseOverGivenReward")
	else
		border:registerCoreEventHandler("OnMouseOver", "InteractionQuest_EA_Window_InteractionQuest_OnMouseOverChoiceReward")
		border:registerCoreEventHandler("OnLButtonUp", "EA_Window_InteractionQuest.SelectRewardChoice")
	end
end

-- highlight the border if the button has been pressed
function InteractionQuest:selectRewardChoice()

	local anchorName, border

	-- reset rarity colours
	self:setRarity()

	-- highlight pressed items
	for reward = 1, EA_Window_InteractionQuest.NUM_CHOICE_REWARD_SLOTS do

		anchorName = "EA_Window_InteractionQuestInfoScrollChildChoiceReward"..reward
		border = self.borders[reward]

		if border and DoesWindowExist(anchorName) and ButtonGetPressedFlag(anchorName) then
			border:setHighlight()
		end
	end
end

-- override EA_Window_InteractionQuest.OnMouseOverChoiceReward as it uses a dodgey anchor for the tooltip
function InteractionQuest_EA_Window_InteractionQuest_OnMouseOverChoiceReward()
	local reward = WindowGetId(SystemData.ActiveWindow.name)
	local tempReward = EA_Window_InteractionQuest.choiceRewardsData

	if tempReward and reward and tempReward[reward]	then
		Tooltips.CreateItemTooltip(tempReward[reward], SystemData.ActiveWindow.name, Tooltips.ANCHOR_WINDOW_RIGHT)
	end
end

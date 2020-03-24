local TomeQuest = nRarity.Container:new("TomeQuest", "EA_TomeOfKnowledge")
TomeQuest:setParentFrameName("TomeWindowQuestInfoPageWindowContentsChild")

-- setup the function hooks for standard UI actions
function TomeQuest:initHooks()

	-- quest opened via tome list
	self:hook("TomeWindow", "SelectQuest", self.reInitShowBorders, true)

	-- quest opened via tracker
	self:hook("TomeWindow", "OpenToQuest", self.reInitShowBorders, true)

	-- quest opened via map click
	self:hook("MapUtils", "openTomeCallback", self.reInitShowBorders, true)
end

-- create borders for each of the TomeQuest view slots
function TomeQuest:initIcons()

	local anchorName

	-- create borders for reward choices
	for reward = 1, TomeWindow.NUM_CHOICE_REWARD_SLOTS do

		anchorName = "TomeWindowQuestInfoChoiceReward"..reward
		if DoesWindowExist(anchorName) and WindowGetShowing(anchorName) then
			self.icons[reward] = anchorName
		end
	end

	-- create a border for the given rewards
	for reward = 1, TomeWindow.NUM_GIVEN_REWARD_SLOTS do

		anchorName = "TomeWindowQuestInfoGivenReward"..reward
		if DoesWindowExist(anchorName) and WindowGetShowing(anchorName) then
			self.icons[reward + TomeWindow.NUM_CHOICE_REWARD_SLOTS] = anchorName
		end
	end
end

-- return item info for an index of self.border
function TomeQuest:getItemData(slot)

	-- given reward
	if slot > TomeWindow.NUM_CHOICE_REWARD_SLOTS then

		if TomeWindow.QuestJournal and TomeWindow.QuestJournal.visibleQuestRewardItems then
			-- take away the money reward if it's there
			if TomeWindow.QuestJournal.visibleQuestRewardItems.money and TomeWindow.QuestJournal.visibleQuestRewardItems.money > 0 then
				slot = slot - 1
			end
	
			-- take away the XP reward if it's there
			if TomeWindow.QuestJournal.visibleQuestRewardItems.xp and TomeWindow.QuestJournal.visibleQuestRewardItems.xp > 0 then
				slot = slot - 1
			end
			return TomeWindow.QuestJournal.visibleQuestRewardItems.given[slot - TomeWindow.NUM_CHOICE_REWARD_SLOTS]
		end

	-- choice reward
	else
		
		if TomeWindow.QuestJournal and TomeWindow.QuestJournal.visibleQuestRewardItems and TomeWindow.QuestJournal.visibleQuestRewardItems.choice then
			return TomeWindow.QuestJournal.visibleQuestRewardItems.choice[slot]
		end
	end

	return nil
end

-- set event handlers for a border
function TomeQuest:setEventHandlers(border, slot)
	if slot <= TomeWindow.NUM_CHOICE_REWARD_SLOTS then
		border:registerCoreEventHandler("OnMouseOver", "TomeWindow.OnMouseOverChoiceReward")
		border:registerCoreEventHandler("OnLButtonDown", "TomeQuest_TomeWindow_OnLButtonDownChoiceReward")
	else
		border:registerCoreEventHandler("OnMouseOver", "TomeWindow.OnMouseOverGivenReward")
		border:registerCoreEventHandler("OnLButtonDown", "TomeQuest_TomeWindow_OnLButtonDownGivenReward")
	end
end

-- unpress the button as it stays pressed after a shift-click
function TomeQuest_TomeWindow_OnLButtonDownChoiceReward(...)
	TomeWindow.OnLButtonDownChoiceReward(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

-- unpress the button as it stays pressed after a shift-click
function TomeQuest_TomeWindow_OnLButtonDownGivenReward(...)
	TomeWindow.OnLButtonDownGivenReward(...)
	ButtonSetPressedFlag(SystemData.ActiveWindow.name, false)
end

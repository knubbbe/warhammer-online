-- TargetsUnitFrame.lua

TargetsUnitFrame = Frame:Subclass("TargetsUnitFrame")


TargetsUnitFrame.priority_color = {
	[TargetList.PRIO_DEFAULT] = { 200, 200, 200 },
	[TargetList.PRIO_LOCKED] = { 200, 0, 0 },
	[TargetList.PRIO_FAV] = { 200, 0, 200 },
}


function TargetsUnitFrame:new(groupname, id)
	local wndname = "TargetsList_" .. groupname .. "_" .. id
	local unitframe
	if (DoesWindowExist(wndname)) then
		unitframe = GetFrame(wndname)
	else
		unitframe = self:CreateFromTemplate(wndname)
	end
	if (not unitframe) then
		return nil	-- wth ?!
	end

	StatusBarSetMaximumValue(wndname .. "HPBar", 100)
	unitframe:Show(false)
	unitframe.slash_targeting = false
	unitframe.visible = true
	return unitframe
end


function TargetsUnitFrame.UnitRClick(flag)
	local wndname = SystemData.MouseOverWindow.name
	local framename = wndname:sub(1, wndname:find("Action") - 1)
	local unitframe = GetFrame(framename)

	if (unitframe.player.prio == TargetList.PRIO_DEFAULT) then
		unitframe.player.prio = TargetList.PRIO_LOCKED
	else
		unitframe.player.prio = TargetList.PRIO_DEFAULT
	end

	-- add to the global favorites list
	if (flag == SystemData.ButtonFlags.SHIFT) then
		if (Targets.saved.favorites[unitframe.player.name]) then
			Targets.saved.favorites[unitframe.player.name] = nil
		else
			Targets.saved.favorites[unitframe.player.name] = true
			unitframe.player.prio = TargetList.PRIO_FAV
		end
	end
end


function TargetsUnitFrame.UnitLClick()
	local wndname = SystemData.MouseOverWindow.name
	local unitframe = GetFrame(wndname:sub(1, wndname:find("Action") - 1))
	if (unitframe.slash_targeting) then
		SystemData.UserInput.ChatText = L"/target " .. LabelGetText(unitframe:GetName() .. "LabelName")
		BroadcastEvent(SystemData.Events.SEND_CHAT_TEXT)
	end
end


function TargetsUnitFrame:update(player)
	local show = (player ~= nil) and self.visible
	self:Show(show)
	if (show) then
		local wndname = self:GetName()
		if (not self.slash_targeting) then
			WindowSetGameActionData(wndname .. "Action", GameData.PlayerActions.SET_TARGET, 0, player.name)
		end
		LabelSetText(wndname .. "LabelName", towstring(player.name))
		LabelSetText(wndname .. "LabelHealth", towstring(player.hp) .. L"%")
		LabelSetText(wndname .. "LabelRank", towstring(player.rank))
		StatusBarSetCurrentValue(wndname .. "HPBar", player.hp)
		local texture, x, y = GetIconData(Icons.GetCareerIconIDFromCareerLine(player.career))
		DynamicImageSetTexture(wndname .."CareerIcon", texture, x, y)
		WindowSetAlpha(wndname .. "HPBar", player.decay / TargetList.DEFAULT_DECAY)

		local color = TargetsUnitFrame.priority_color[player.prio]
		LabelSetTextColor(wndname .. "LabelName", color[1], color[2], color[3])
		self.player = player	-- hack !
	end
end
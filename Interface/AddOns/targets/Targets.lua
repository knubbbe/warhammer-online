-- Targets

Targets = {}
Targets.VERSION = "0.75-beta"
Targets.UPDATE_PERIOD = 0.2


function Targets.init()
	-- persistent data
	Targets.saved = Targets.saved or {}
	Targets.saved.allies = Targets.saved.allies or {}
	Targets.saved.allies.filters = Targets.saved.allies.filters or {}
	Targets.saved.enemies = Targets.saved.enemies or {}
	Targets.saved.enemies.filters = Targets.saved.enemies.filters or {}
	Targets.saved.favorites = Targets.saved.favorites or {}


	-- our main event
	RegisterEventHandler(SystemData.Events.PLAYER_TARGET_UPDATED, "Targets.on_target_updated")

	Targets.update_timeout = Targets.UPDATE_PERIOD

	-- list of targets
	Targets.targets = {}

	-- create friendly players
	Targets.allies = Targets.create_playerlist("Friendly", SystemData.TargetObjectType.ALLY_PLAYER, Targets.saved.allies.max_players)
	Targets.allies.filters = {
		{ id = "keymod", desc = "Key modifier", f = Targets.filter_key_modifier, enabled = false },
		{ id = "group", desc = "Group", f = Targets.filter_group, enabled = true },
		{ id = "wb", desc = "Warband", f = Targets.filter_warband, enabled = true },
		{ id = "sc", desc = "Scenario", f = Targets.filter_scenario, enabled = true }
	}
	Targets.allies.list.remove_full_hp = true
	Targets.restore("allies")

	-- create enemy players
	Targets.enemies = Targets.create_playerlist("Enemy", SystemData.TargetObjectType.ENEMY_PLAYER, Targets.saved.enemies.max_players)
	Targets.enemies.filters = {}
	Targets.enemies.list.remove_dead = true
	for _, fr in ipairs(Targets.enemies.frames) do
		 fr.slash_targeting = true
	end
	Targets.restore("enemies")

	Targets.label_ptype = { [SystemData.TargetObjectType.ALLY_PLAYER] = "Ally", [SystemData.TargetObjectType.ENEMY_PLAYER] = "Enemy" }

	-- register anchor
	LayoutEditor.RegisterWindow("TargetsAnchor", L"Targets", L"Targets Window", false, false, true, nil)

	-- register slash commands
	TargetsSlashCmd.register()

	d("Targets " .. Targets.VERSION .. " loaded")
end


function Targets.playerlist_by_name(name)
	if ((name == "allies") or (name == "a")) then
		return Targets.allies, Targets.saved.allies
	elseif ((name == "enemies") or (name == "e")) then
		return Targets.enemies, Targets.saved.enemies
	end
	d("targetlist not found " .. name)
	return nil
end


-- ugly as hell
function Targets.restore(side)
	local plist, saved = Targets.playerlist_by_name(side)
	if (saved.filters ~= nil) then
		for _, filter in ipairs(plist.filters) do
			if (saved.filters[filter.id] ~= nil) then
				filter.enabled = saved.filters[filter.id]
			end
		end
	end
	if (saved.visible ~= nil) then
		plist.visible = saved.visible
		for _, frame in ipairs(plist.frames) do
			frame.visible = plist.visible
		end
	end
	if (saved.sort_players ~= nil) then
		plist.list.sort_players = saved.sort_players
	end
	if (saved.remove_dead ~= nil) then
		plist.list.remove_dead = saved.remove_dead
	end
	if (saved.remove_full_hp ~= nil) then
		plist.list.remove_full_hp = saved.remove_full_hp
	end
	plist.list.max_players = saved.max_players or TargetList.DEFAULT_MAXPLAYERS
end


function  Targets.filter_scenario(_list, _name)
	if (GameData.Player.isInScenario) then
		local scdata = GameData.GetScenarioPlayerGroups()	-- get scenario wb
		for _, player in ipairs(scdata) do
			local scname = player.name:sub(1, player.name:len() - 2)	-- remove 2 extra chars from the end
			if ((scname == _name) and (player.sgroupindex > 0)) then
				return true	-- filter players in groups only
			end
		end
	end
	return false
end


function Targets.filter_warband(_list, _name)
	if (GameData.Player.isInScenario) or (not IsWarBandActive()) then
		return false
	end

	local wb = GetBattlegroupMemberData()
	for _, grp in ipairs(wb) do
		for _, player in ipairs(grp.players) do
			if (player.name == _name) then
				return true
			end
		end
	end
	return false
end


function Targets.filter_group(_list, _name)
	if (GameData.Player.isInScenario) then
		return false
	end
	local group = GetGroupData()
	if (not group) then
		return false
	end

	for _, player in ipairs(group) do
		if (player.name == _name) then
			return true
		end
	end
	return false
end


function Targets.filter_key_modifier(_list, _name)
--	if (_list.require_key) then
--		return  SystemData.ButtonFlags.SHIFT == ???
--	else
		return false
--	end
end


function Targets.update(_elapsed)
	Targets.update_timeout = Targets.update_timeout + _elapsed
	if (Targets.update_timeout >= Targets.UPDATE_PERIOD) then
		-- update GUI elements
		for _, targetgroup in ipairs(Targets.targets) do
			targetgroup.list:update(Targets.update_timeout) -- first organize current list
			for i, frame in ipairs(targetgroup.frames) do
				frame:update(targetgroup.list.players[i])
			end
		end
		-- reset
		Targets.update_timeout = 0
	end
end


function Targets.on_target_updated(_unit, _id, _type)
	TargetInfo:UpdateFromClient()
	local name = TargetInfo:UnitName(_unit)
	local hp = TargetInfo:UnitHealth(_unit)
	local career = TargetInfo:UnitCareer(_unit)
	local rank = TargetInfo:UnitLevel(_unit)

	name = name:sub(1, name:len() - 2)	-- remove 2 extra chars from the end

	for _, targetgroup in ipairs(Targets.targets) do
		-- add/update this player
		if (targetgroup.ptype == _type) then
			local filtered = false
			for _, filter in ipairs(targetgroup.filters) do
				if (filter.enabled) then
					filtered = filter.f(targetgroup, name)
					if (filtered) then
						break
					end
				end
			end
			if (not filtered) then
				targetgroup.list:put_player(name, hp, career, rank)
			end
		end
	end
end


function Targets.alert(_text, _type)
	if (not _type) then
		_type = SystemData.AlertText.Types.DEFAULT
	end
	AlertTextWindow.AddLine(_type, towstring(_text))
	PlaySound(Sound.RVR_FLAG_OFF)
end


function Targets.create_playerlist(_name, _player_type, _maxplayers)
	local tl = {}
	tl.list = TargetList:new()
	tl.list.max_players = _maxplayers
	tl.ptype = _player_type
	tl.name = _name
	tl.frames = {}
	tl.filters = {}
	tl.visible = true

	local anchor = { Point = "bottomleft", RelativeTo = "TargetsAnchor", RelativePoint = "topleft", XOffset = (#Targets.targets * 110), YOffset = 0 }
	local frame
	for i = 1, TargetList.MAX_PLAYERS do
		frame = TargetsUnitFrame:new(_name, i)
		frame:SetAnchor(anchor)
		anchor.RelativeTo = frame:GetName()
		anchor.XOffset = 0
		table.insert(tl.frames, frame)
	end

	table.insert(Targets.targets, tl)
	return tl
end

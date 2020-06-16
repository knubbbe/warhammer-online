-- TargetsSlashCmd

TargetsSlashCmd = {}


function TargetsSlashCmd.register()
	TargetsSlashCmd.list = {}
	TargetsSlashCmd.list["help"] = { f = TargetsSlashCmd.cmd_usage, argc = 0, help = "- show command list" }
	TargetsSlashCmd.list[""] = { f = TargetsSlashCmd.cmd_usage, argc = 0, help = "" }

	TargetsSlashCmd.list["toggle"] = { f = TargetsSlashCmd.cmd_toggle, argc = 1, help = "<allies/a|enemies/e> - toggle list" }
	TargetsSlashCmd.list["max"] = { f = TargetsSlashCmd.cmd_maxplayers, argc = 2, help = "<allies/a|enemies/e> <count> - set max players per list" }
	TargetsSlashCmd.list["maxplayers"] = { f = TargetsSlashCmd.cmd_maxplayers, argc = 0, help = "" }
	TargetsSlashCmd.list["sorted"] = { f = TargetsSlashCmd.cmd_toggle_sort, argc = 1, help = "<allies/a|enemies/e> - toggle player sorting" }
	TargetsSlashCmd.list["removedead"] = { f = TargetsSlashCmd.cmd_toggle_removedead, argc = 1, help = "<allies/a|enemies/e> - toggle removing dead players" }
	TargetsSlashCmd.list["removefullhp"] = { f = TargetsSlashCmd.cmd_toggle_removefullhp, argc = 1, help = "<allies/a|enemies/e> - toggle removing players with full health" }

	TargetsSlashCmd.list["addfav"] = { f = TargetsSlashCmd.cmd_add_favorites, argc = 1, help = "<name> - add a player to your favorites" }
	TargetsSlashCmd.list["delfav"] = { f = TargetsSlashCmd.cmd_del_favorites, argc = 1, help = "<name> - remove player from your favorites" }
	TargetsSlashCmd.list["listfav"] = { f = TargetsSlashCmd.cmd_list_favorites, argc = 0, help = " - list your favorites (both enemies and allies)" }
	TargetsSlashCmd.list["clearfav"] = { f = TargetsSlashCmd.cmd_clear_favorites, argc = 0, help = " - clear all your favorites" }

	TargetsSlashCmd.list["decay"] = { f = TargetsSlashCmd.cmd_decay, argc = 1, help = "<value> - sets decay timeout for removing players from the list (sec)" }

	TargetsSlashCmd.list["filter"] = { f = TargetsSlashCmd.cmd_filter, argc = 2, help = "<allies/a|enemies/e> <sc|wb|group> - toggle filter" }

	LibSlash.RegisterSlashCmd("targets", function (msg) TargetsSlashCmd.parse_cmd(msg) end)
end


function TargetsSlashCmd.print(text)
	EA_ChatWindow.Print(L"[Targets] " .. towstring(text))
end


function TargetsSlashCmd.parse_cmd(msg)
--	msg = msg:lower()
	local args = StringSplit(msg)
	cmd_name = table.remove(args, 1):lower()
	local cmd = TargetsSlashCmd.list[cmd_name]
	if (cmd ~= nil) then
		if (cmd.argc <= #args) then
			cmd.f(args)
		else
			TargetsSlashCmd.print("Use: /targets " .. cmd_name .. " " .. cmd.help)
		end
	else
		TargetsSlashCmd.print("Unknown command: " .. msg)
	end
end


function TargetsSlashCmd.cmd_usage(args)
	TargetsSlashCmd.print("[Commands]")
	for key, cmd in pairs(TargetsSlashCmd.list) do
		if (cmd.help ~= "") then
			TargetsSlashCmd.print("/targets " .. key .. " " .. cmd.help)
		end
	end
end


function TargetsSlashCmd.cmd_toggle(args)
	local plist, saved = Targets.playerlist_by_name(args[1])
	if (plist) then
		plist.visible = not plist.visible
		saved.visible = plist.visible
		for _, frame in ipairs(plist.frames) do
			frame.visible = plist.visible
		end
	end
end


function TargetsSlashCmd.cmd_toggle_sort(args)
	local plist, saved = Targets.playerlist_by_name(args[1])
	if (plist) then
		plist.list.sort_players = not plist.list.sort_players
		saved.sort_players = plist.list.sort_players
		TargetsSlashCmd.print(args[1] .. " sorting = " .. tostring(plist.sort_players))
	end
end


function TargetsSlashCmd.cmd_toggle_removedead(args)
	local plist, saved = Targets.playerlist_by_name(args[1])
	if (plist) then
		plist.list.remove_dead = not plist.list.remove_dead
		saved.remove_dead = plist.list.remove_dead
		TargetsSlashCmd.print(args[1] .. " removing dead players = " .. tostring(plist.list.remove_dead))
	end
end


function TargetsSlashCmd.cmd_toggle_removefullhp(args)
	local plist, saved = Targets.playerlist_by_name(args[1])
	if (plist) then
		plist.list.remove_full_hp = not plist.list.remove_full_hp
		saved.remove_full_hp = plist.list.remove_full_hp
		TargetsSlashCmd.print(args[1] .. " removing players with full life = " .. tostring(plist.list.remove_full_hp))
	end
end


function TargetsSlashCmd.cmd_maxplayers(args)
	local count = math.min(math.abs(tonumber(args[2])), TargetList.MAX_PLAYERS)
	local plist, saved = Targets.playerlist_by_name(args[1])
	if (plist) then
		plist.list.max_players = count
		saved.max_players = count
		TargetsSlashCmd.print(args[1] .. " max player size = " .. count)
	end
end


function TargetsSlashCmd.cmd_add_favorites(args)
	local name = towstring(args[1])
	Targets.saved.favorites[name] = true
	TargetsSlashCmd.print("Added " .. args[1] .. " to favorites")
end


function TargetsSlashCmd.cmd_del_favorites(args)
	local name = towstring(args[1])
	if (Targets.saved.favorites[name]) then
		Targets.saved.favorites[name] = nil
		TargetsSlashCmd.print("Removed " .. args[1] .. " from favorites")
	else
		TargetsSlashCmd.print("Player " .. args[1] .. " not found")
	end
end


function TargetsSlashCmd.cmd_list_favorites(args)
	TargetsSlashCmd.print("[Favorites]")
	local str = L""
	for name in pairs(Targets.saved.favorites) do
		str = str .. name .. L" "
	end
	TargetsSlashCmd.print(str)
end


function TargetsSlashCmd.cmd_clear_favorites(args)
	Targets.saved.favorites = {}
	TargetsSlashCmd.print("Favorties cleared")
end


function TargetsSlashCmd.cmd_decay(args)
	if (#args > 1) then
		TargetList.DEFAULT_DECAY = math.abs( tonumber(args[1]) )
	end
	TargetsSlashCmd.print("Decay: " .. TargetList.DEFAULT_DECAY .. " sec")
end

function TargetsSlashCmd.cmd_filter(args)
	local plist, saved = Targets.playerlist_by_name(args[1])
	local fn = args[2]

	local filter = nil
	for _, f in ipairs(plist.filters) do
		if (f.id == fn) then
			filter = f
			break
		end
	end
	if (filter) then
		filter.enabled = not filter.enabled
		saved.filters[fn] = filter.enabled
		TargetsSlashCmd.print("Filter " .. fn .. " enabled = " .. tostring(filter.enabled))
	else
		TargetsSlashCmd.print("Filter " .. fn .. " not found")
	end
end
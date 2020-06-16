-- TargetList maintains a sorted list of players
-- Each player contains: name, hp, career, rank and decay

TargetList = {}
TargetList.DEFAULT_DECAY = 60
TargetList.DEFAULT_MAXPLAYERS = 6
TargetList.MAX_PLAYERS = 16

TargetList.PRIO_DEFAULT = 0
TargetList.PRIO_LOCKED = 1
TargetList.PRIO_FAV = 2


-- default ctor
function TargetList:new(t)
	t = t or {}
	setmetatable(t, self)
	self.__index = self
	t.players = {}
	t.max_players = TargetList.DEFAULT_MAXPLAYERS
	t.remove_dead = false		-- remove dead players
	t.remove_full_hp = false	-- remove players with full hp
	t.sort_players = true
	t.require_key = false
	return t
end


-- returns false if the player was already inserted
function TargetList:put_player(_name, _hp, _career, _rank)
	for _, p in ipairs(self.players) do
		if (p.name == _name) then
			-- player found just update its data
			p.hp = _hp
			p.decay = TargetList.DEFAULT_DECAY
			return false
		end
	end
	-- locks the player if he is in favorites
	local pprio = TargetList.PRIO_DEFAULT
	if (Targets.saved.favorites[_name]) then
		pprio = TargetList.PRIO_FAV
		Targets.alert(_name .. L" spotted !")
	end
	-- new player (name, hp, career, rank ...)
	table.insert(self.players, 1, { name = _name, hp = _hp, career = _career, rank = _rank, decay = TargetList.DEFAULT_DECAY, prio = pprio })
	return true
end


function TargetList:update(_elapsed)
	-- fix id's
	for i, p in ipairs(self.players) do
		p.id = i
	end
	if (self.sort_players) then
		-- sort
		table.sort(self.players,
			function(a, b)
				if (a.prio == b.prio) then
					if (a.hp == b.hp) then
						return a.id < b.id
					else
						return a.hp < b.hp
					end
				else
					return a.prio > b.prio
				end
			end
		)
	else
		-- move up all locked
		table.sort(self.players,
			function(a, b)
				if (a.prio == b.prio) then
					return a.id < b.id
				else
					return a.prio > b.prio
				end
			end
		)
	end

	local i = 1
	while (i <= #self.players) do
		local p = self.players[i]
		if (p.prio == TargetList.PRIO_DEFAULT) then
			p.decay = p.decay - _elapsed
		end
		if (p.decay <= 0)
		or (self.remove_dead and p.hp == 0 and p.prio == TargetList.PRIO_DEFAULT)
		or (self.remove_full_hp and p.hp == 100 and p.prio == TargetList.PRIO_DEFAULT) then
			table.remove(self.players, i)	-- only remove normal dead players
		else
			i = i + 1
		end
	end

	-- remove extras
	while (#self.players > self.max_players) do
		table.remove(self.players)
	end
end
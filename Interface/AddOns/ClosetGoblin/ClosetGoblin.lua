--[[
Copyright (c) 2008, Naeru@Ulthuan
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation  
and/or other materials provided with the distribution.
Neither the name of the Candymancer Coding Company nor the names of its contributors may be used to endorse or promote products derived from 
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE 
USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]
-- version 2 by belga@Athel loren (fury_belgarion@curseforge)

ClosetGoblin = {};
ClosetGoblin.version = "v2.5.6"

ClosetGoblin.setData = {}
ClosetGoblin.languageData = {}
ClosetGoblin.settings = {
	activeSet = nil,
	outputMessages = true,
	zoneChange = true,
	toolTips = true,
};
ClosetGoblin.itemList = {}
ClosetGoblin.matchingItem = {}
ClosetGoblin.removedLastItemSlot = 0

ClosetGoblin.SORT_ORDER_UP = 1
ClosetGoblin.SORT_ORDER_DOWN = 2
ClosetGoblin.sortOrder = ClosetGoblin.SORT_ORDER_UP

ClosetGoblin.NAME_OK = 1
ClosetGoblin.NAME_EMPTY = 0
ClosetGoblin.NAME_NOT_UNIQUE = -1

ClosetGoblin.CHAT_LOG_FILTER = 1205
ClosetGoblin.CHAT_LOG_COLOR = DefaultColor.YELLOW
ClosetGoblin.ALERT_LOG_FILTER = 1206
ClosetGoblin.ALERT_LOG_COLOR = DefaultColor.ORANGE

ClosetGoblin.firstloadingGame = true
ClosetGoblin.lastZone = 0

-- This is used in our very reudamentary per-character profile support, until Mythic or a mod author gives us a
-- better system
ClosetGoblin.currentProfile = nil

local tonumber = tonumber

-- do it ourself because the EA implementation is...
local isHelmShown  = true
local isCloakShown = true
local isCloakHeraldryShown = true

ClosetGoblin.TIME_DELAY = 0.2
ClosetGoblin.timeLeft = ClosetGoblin.TIME_DELAY
ClosetGoblin.IsUpdating = false
ClosetGoblin.UpDateName = nil
ClosetGoblin.UpdateTimes = 0

--[[
   ClosetGoblin event handlers
]]

function ClosetGoblin.OnInitialize()
	RegisterEventHandler(SystemData.Events.LOADING_END, "ClosetGoblin.Initialize")
	if ClosetGoblin.firstloadingGame then
		ClosetGoblin.firstloadingGame = nil
	else
		UnregisterEventHandler(SystemData.Events.RELOAD_INTERFACE, "ClosetGoblin.Initialize")
	end
	RegisterEventHandler(SystemData.Events.RELOAD_INTERFACE, "ClosetGoblin.Initialize")
	RegisterEventHandler(SystemData.Events.ALL_MODULES_INITIALIZED,	"ClosetGoblin.OnAllModulesInitialized")
	RegisterEventHandler(SystemData.Events.VISIBLE_EQUIPMENT_UPDATED, "ClosetGoblin.OnVisibleEquipmentUpdated")
end

function ClosetGoblin.Initialize()
	UnregisterEventHandler(SystemData.Events.LOADING_END, "ClosetGoblin.Initialize")
	LibToolkit.NewChatFilter(ClosetGoblin.CHAT_LOG_FILTER, ClosetGoblin.CHAT_LOG_COLOR)
	LibToolkit.NewChatFilter(ClosetGoblin.ALERT_LOG_FILTER, ClosetGoblin.ALERT_LOG_COLOR)
	-- check if yakUI has created window (temp solution) yakuiWHL
	if not DoesWindowExist("yClosetGoblinButton") then
		CreateWindow("yClosetGoblinButton",true)
		WindowSetParent("yClosetGoblinButton", "CharacterWindow")
	end
	ClosetGoblin.LoadLanguage()
	ClosetGoblin.SetupProfile()
	ClosetGoblin.UpdateSettings()
	d(L"Initialize")
	--ClosetGoblin.OnVisibleEquipmentUpdated( GetEquippedItemVisible( GameData.EquipSlots.HELM ), GetEquippedItemVisible( GameData.EquipSlots.BACK ), IsShowingCloakHeraldry() )
	ClosetGoblin.UpdateListSets()
	ClosetGoblinCharacterWindow.OnInitialize()
	ClosetGoblinZoneWindow.OnInitialize()
	
	-- If the "zone change sets" is activated we launch the function to activate it
	if(ClosetGoblin.settings.zoneChange) then ClosetGoblin.ZoneChangeInit() end

	if(ClosetGoblin.settings.toolTips) then
		ClosetGoblin.CreateItemTooltipOLD = Tooltips.CreateItemTooltip
		Tooltips.CreateItemTooltip = ClosetGoblin.CreateItemTooltip
	end
	
	ClosetGoblin.Message(cgL["loaded"], towstring(ClosetGoblin.version))
	LibSlash.RegisterSlashCmd("cg", ClosetGoblin.OnSlashCommand)
end

function ClosetGoblin.OnAllModulesInitialized()
	--d(L"OnAllModulesInitialized")
	--ClosetGoblin.OnVisibleEquipmentUpdated( GetEquippedItemVisible( GameData.EquipSlots.HELM ), GetEquippedItemVisible( GameData.EquipSlots.BACK ), IsShowingCloakHeraldry() )
end

function ClosetGoblin.OnShutdown()
	if(ClosetGoblin.settings.zoneChange) then
		ClosetGoblin.ZoneChangeShutdown()
	end;
end;

function ClosetGoblin.OnSlashCommand(what)
	what = string.lower(what);
	if what == "show" then
		ClosetGoblinCharacterWindow.Show()
		return
	elseif what == "hide" then
		ClosetGoblinCharacterWindow.Hide()
		return;
	end;
	
	local set = what:match("activate[ ]?(.*)")
	if set then
		ClosetGoblin.ActivateSet(set)
		return
	end
	
	local opt, val = what:match("set[ ]?([a-z0-9\-]+)[ ]?(.*)")
	if opt and val then
		if opt == "output" then
			-- We dump the message twice because if you just turned it off, you'll see it before it goes off, if you just turned it on, you'll see it after
			local flag = (val == "on") and true or false;
			ClosetGoblin.Message(cgL["Setting_message_output"] .. ClosetGoblin.ToEnabled(flag))
			ClosetGoblin.settings.outputMessages = flag
			ClosetGoblin.Message(cgL["Setting_message_output"] .. ClosetGoblin.ToEnabled(flag))
		elseif opt == "tooltips" or opt == "tooltip" then
			local flag = (val == "on") and true or false
			ClosetGoblin.Message(cgL["Setting_tooltips"] .. ClosetGoblin.ToEnabled(flag))
			ClosetGoblin.Message(cgL["reloadui"])
			ClosetGoblin.settings.toolTips = flag
		elseif opt == "zones-to-sets" then
			local flag = (val == "on") and true or false
			if(flag == true) then
				ClosetGoblin.ZoneChangeEnabled()
			else
				ClosetGoblin.ZoneChangeDisabled()
			end;
		elseif opt == "remove-to-first" then
			local flag = (val == "on") and true or false
			ClosetGoblin.Message(cgL["Setting_remove_to_first"] .. ClosetGoblin.ToEnabled(flag));
			ClosetGoblin.settings.removeToFirst = flag
		end;
	end;
	
	local zone, set = what:match("zone[ ]?([A-Za-z0-9\-]+)[ ]?(.*)")
	if zone and set then
		ClosetGoblin.AssociateZoneToSet(zone, towstring(set))
	end;
end;

function ClosetGoblin.PlayerZoneChanged()
	ClosetGoblin.lastZone = GameData.Player.zone
	if(ClosetGoblin.loadingGame == false and ClosetGoblin.zoneType[ClosetGoblin.lastZone] ~= ClosetGoblin.zoneType[GameData.Player.zone]) then
		ClosetGoblin.ZoneChangeSet()
	end;
	ClosetGoblin.lastZone = GameData.Player.zone
end;

function ClosetGoblin.LoadingBegin()
	ClosetGoblin.loadingGame = true
end;

function ClosetGoblin.LoadingEnd()
	ClosetGoblin.ZoneChangeSet()
	ClosetGoblin.loadingGame = false
	--d(L"LoadingEnd")
	--ClosetGoblin.OnVisibleEquipmentUpdated( GetEquippedItemVisible( GameData.EquipSlots.HELM ), GetEquippedItemVisible( GameData.EquipSlots.BACK ), IsShowingCloakHeraldry() )
end;
	
function ClosetGoblin.OnVisibleEquipmentUpdated( showHelm, showCloak, showCloakHeraldry )
	isHelmShown = showHelm
	isCloakShown = showCloak
	isCloakHeraldryShown = showCloakHeraldry
	--d(L"OnVisibleEquipmentUpdated:", L"Helm: ", isHelmShown, L"Cloak: ", isCloakShown, L" Cloak Heraldry: ", isCloakHeraldryShown)
end
--[[
   ClosetGoblin member functions
]]

function ClosetGoblin.UpdateSettings()
	if not ClosetGoblin.settings.savedSettingsVersion then
		ClosetGoblin.settings.savedSettingsVersion = 0
	end
	if ClosetGoblin.settings.savedSettingsVersion < 240 then
		for k,v in ipairs(ClosetGoblin.setData) do
			for l,w  in ipairs(v.characters) do
				for m, set in ipairs(w.sets) do
					if not set.AbEnabled then
						ClosetGoblin.setData[k].characters[l].sets[m].AbEnabled = {false, false, false, false, false}
					end
					if not set.AbSettings then
						ClosetGoblin.setData[k].characters[l].sets[m].AbSettings = {1,2,3,4,5}
					end
				end
			end
		end
	end
	if ClosetGoblin.settings.savedSettingsVersion < 242 then
		for k,v in ipairs(ClosetGoblin.setData) do
			for l,w  in ipairs(v.characters) do
				for m, set in ipairs(w.sets) do
					if set.showHelmet ~= nil then	-- might be pedantic, but the Variable name consistency might be useful in the future
						ClosetGoblin.setData[k].characters[l].sets[m].showHelmet = nil
					end
					if set.showGuildHeraldry ~= nil then
						ClosetGoblin.setData[k].characters[l].sets[m].showGuildHeraldry = nil
					end
					-- use the current user setting as a guess on the users general preference if the function actually was able to return sth. already...holy frag, mythic
					if set.showHelm == nil then
						ClosetGoblin.setData[k].characters[l].sets[m].showHelm = isHelmShown
					end
					-- overwrite the old "always true" variable with the current user setting
					ClosetGoblin.setData[k].characters[l].sets[m].showCloak = isCloakShown
					if set.showCloakHeraldry == nil then
						ClosetGoblin.setData[k].characters[l].sets[m].showCloakHeraldry = isCloakHeraldryShown
					end
				end
			end
		end
	end
	if ClosetGoblin.settings.savedSettingsVersion < 251 then
		if type(ClosetGoblin.settings.outputMessages) ~= "boolean" then
			ClosetGoblin.settings.outputMessages = true;
		end;
		
		if type(ClosetGoblin.settings.zoneChange) ~= "boolean" then
			ClosetGoblin.settings.zoneChange = true;
		end;

		if type(ClosetGoblin.settings.toolTips) ~= "boolean" then
			ClosetGoblin.settings.toolTips = true
		end	
		
		if type(ClosetGoblin.settings.useItemRackOnCharacterWindow) ~= "boolean" then
			ClosetGoblin.settings.useItemRackOnCharacterWindow = true
		end
	end
	ClosetGoblin.settings.savedSettingsVersion = 251
end

function ClosetGoblin.LoadLanguage()
	local activeL = SystemData.Settings.Language.active
	for k, v in pairs(SystemData.Settings.Language) do
		if k ~= "active" and v == activeL then
			ClosetGoblin.language = string.lower(k)
		end
	end
	
	--ClosetGoblin.language = CoreLanguageDirectories[SystemData.Settings.Language.active];
	
	cgL = ClosetGoblin.languageData[ClosetGoblin.language];
end;

function ClosetGoblin.FindItem(id)
	local i, item = ClosetGoblin.FindItemInList(id, DataUtils.GetItems())
	if not item then
		i, item = ClosetGoblin.FindItemInList(id, DataUtils.GetEquipmentData())
		if not item then
			i, item = ClosetGoblin.FindItemInList(id, DataUtils.GetTrophyData())
		end
	end
	return item
end

function ClosetGoblin.UpdateListSets()
	ClosetGoblin.sortedSetsList = {};
	if ClosetGoblin.HasSets() then
		for i, set in ipairs(ClosetGoblin.GetProfileSets()) do
			ClosetGoblin.sortedSetsList[i] = set.name;
		end;
		table.sort(ClosetGoblin.sortedSetsList);
	else
		ClosetGoblin.sortedSetsList = nil;
	end
end;

function ClosetGoblin.FindItemInList(id, list)
	for i,v in pairs(list) do
		if v.uniqueID == id and not v.broken then
			return i, v
		end
	end
	return nil, nil
end

function ClosetGoblin.FindAllItemInList(id, list)
	local itemFound = {};
	for i,v in pairs(list) do
		if v.uniqueID == id and not v.broken then
			itemFound[i] = v;
		end
	end
	return itemFound
end;

--function ClosetGoblin.FindAnotherItemInList(id, list, numberWanted)
--	local itemNumber = 1;
--	for i,v in pairs(list) do
--		if v.uniqueID == id and not v.broken then
--			if itemNumber == numberWanted then
--				return i, v	;
--			else
--				itemNumber = itemNumber + 1;
--			end;
--		end;
--	end;
	
--	return nil, nil
--end

function ClosetGoblin.Message(txt, variable1, variable2)
	if ClosetGoblin.settings.outputMessages then
		if variable1 then
			txt = txt:gsub(L"#1#", variable1);
			if variable2 then
				txt = txt:gsub(L"#2#", variable2);
			end;
		end;
		TextLogAddEntry("Chat", ClosetGoblin.CHAT_LOG_FILTER, L"[ClosetGoblin]: " .. towstring(txt));
	end;
end;

function ClosetGoblin.Alert(txt, variable1, variable2)
	if variable1 then
		txt = txt:gsub(L"#1#", variable1);
		if variable2 then
			txt = txt:gsub(L"#2#", variable2);
		end;
	end;
	TextLogAddEntry("Chat", ClosetGoblin.ALERT_LOG_FILTER, L"[ClosetGoblin]: " .. towstring(txt));
end;

function ClosetGoblin.SetupProfile()
	local serverName = GameData.Account.ServerName:lower()
	-- Strip the ^m, ^f gender specifier
	local name = GameData.Player.name:lower():match(L"([^^]*)")
	
	local server = ClosetGoblin.FindServerProfile(serverName)
	if not server then
		server = ClosetGoblin.CreateServerProfile(serverName)
	end
	
	local char = ClosetGoblin.FindCharacterProfile(server, name)
	if not char then
		char = ClosetGoblin.CreateCharacterProfile(server, name)
	end
	
	ClosetGoblin.currentProfile = char
end

function ClosetGoblin.FindServerProfile(server)
	for i,v in ipairs(ClosetGoblin.setData) do
		if v.name == server then
			return v
		end
	end
	
	return nil
end

function ClosetGoblin.FindCharacterProfile(serverProfile, name)
	for i,v in ipairs(serverProfile.characters) do
		if v.name == name then
			return v
		end
	end
	return nil
end

function ClosetGoblin.CreateServerProfile(server)
	table.insert(ClosetGoblin.setData, {
		name = server,
		characters = {}
	})
	return ClosetGoblin.setData[table.getn(ClosetGoblin.setData)]
end

function ClosetGoblin.CreateCharacterProfile(server, name)
	table.insert(server.characters, {
		name = name,
		sets = {},
		zoneToSet = {
			t1 = L"",
			t2 = L"",
			t3 = L"",
			t4 = L"",
			capital = L"",
			instance = L"",
			fortress = L"",
			scenario = L"",
			}
	})
	return server.characters[table.getn(server.characters)]
end

function ClosetGoblin.GetProfileSets()
	if(ClosetGoblin.currentProfile == nil) then
		ClosetGoblin.SetupProfile()
	end
	return ClosetGoblin.currentProfile.sets
end

function ClosetGoblin.GetSet(idx)
	if not idx or (idx < 1 or idx > table.getn(ClosetGoblin.GetProfileSets())) then
		return nil
	end
	return ClosetGoblin.GetProfileSets()[idx]
end

function ClosetGoblin.GetSetByName(name)	-- not a pointer
	for i, v in ipairs(ClosetGoblin.GetProfileSets()) do
		if wstring.lower(v.name) == wstring.lower(towstring(name)) then
			return v
		end
	end
	return nil
end

function ClosetGoblin.CompareSets(index1, index2)
	local set1 = ClosetGoblin.GetProfileSets()[index1]
	local set2 = ClosetGoblin.GetProfileSets()[index2]
	return StringUtils.SortByString(set1.name, set2.name, ClosetGoblin.sortOrder)
end

function ClosetGoblin.CompareZones(index1, index2)
	local zone1 = ClosetGoblinZoneWindow.associationTable[index1]
	local zone2 = ClosetGoblinZoneWindow.associationTable[index2]
	return StringUtils.SortByString(zone1.zone, zone2.zone, ClosetGoblin.sortOrder)
end

function ClosetGoblin.CreateSetData(name)
	local set = {};
	set.name = name;
	set.tactics = L"x";			-- x = No tactics Sets change
	
	set.slots = {};

	-- All Equipment item slot except trophy
	for slotName, slot in pairs(GameData.EquipSlots) do
		if slot ~= GameData.EquipSlots.EITHER_HAND then
			set.slots[slot] = {
				enabled = true,
			}
		end
	end
	
	-- Trophy slot disable by default
	for slot = 1, GameData.Player.c_NUM_TROPHIES do
		set.slots[slot + CharacterWindow.NUM_EQUIPMENT_SLOTS] = {
			enabled = false,
		}
	end

	-- ActionBars
	set.AbEnabled = {false, false, false, false, false}
	set.AbSettings = {1,2,3,4,5}
	
	-- Visibility options; initialize with the current settings
	set.showHelm = isHelmShown
	set.showCloak = isCloakShown
	set.showCloakHeraldry = isCloakHeraldryShown
	
	return set;
end

function ClosetGoblin.AddNewSet(name)
	local check = ClosetGoblin.CheckName(name)
	if check == ClosetGoblin.NAME_OK then
		local set = ClosetGoblin.CreateSetData(name)
		table.insert(ClosetGoblin.GetProfileSets(), set)
	end
	
	return check
end

function ClosetGoblin.DeleteSet(idx)
	if idx and (idx >= 1 and idx <= table.getn(ClosetGoblin.GetProfileSets())) then
		local tempSet = ClosetGoblin.GetSet(idx);
		table.remove(ClosetGoblin.GetProfileSets(), idx)
		-- Removing association with zone.
		for k, v in pairs(ClosetGoblinZoneWindow.associationTable) do
			if v.set == tempSet.name then
				ClosetGoblin.Alert(v.zone);
				ClosetGoblin.AssociateZoneToSet(tostring(v.zone), L"");
				ClosetGoblinZoneWindow.RefreshList();				
			end;
		end;
	end
end

function ClosetGoblin.HasSets()
	return table.getn(ClosetGoblin.GetProfileSets()) > 0
end

local SetHotbarPage = SetHotbarPage
function ClosetGoblin.ActivateSet(name)
	local set = ClosetGoblin.GetSetByName(name)
	local badTalisman
	


--ClosetGoblin.ActivateSet(ClosetGoblin.UpDateName)


if ClosetGoblin.IsUpdating == false then 
ClosetGoblin.Message(cgL["Equiping_set"], towstring(set.name))
ClosetGoblin.Update(name)
end
	
	
	if set then
		if set then
			if not GameData.Player.inCombat then
				ClosetGoblin.activatingSet = true			
				ClosetGoblin.BuildItemList()
--				ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT] = DataUtils.GetEquipmentData();
--				local trophyData = DataUtils.GetTrophyData();
--				for k = 1, GameData.Player.c_NUM_TROPHIES do
--					ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][k + GameData.Player.c_TROPHY_START_INDEX - 1] = trophyData[k];
--				end;
--				ClosetGoblin.itemList[Cursor.SOURCE_INVENTORY] = DataUtils.GetItems();

				-- We are checking in first place if we need to remove shield or off hand. We do this firstly  to properly remove it before equiping a 2 hand weapon
				if set.slots[2] and set.slots[2].enabled and not set.slots[2].id and ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][2].name ~= L"" then
					ClosetGoblin.RequestRemoveItem(Cursor.SOURCE_EQUIPMENT, 2)
				end
				-- For each item in the set
				for k = 1, GameData.Player.c_TROPHY_START_INDEX + GameData.Player.c_NUM_TROPHIES - 1 do
					local itemPositioned = false;
					local v = set.slots[k];
					if v and v.id then
						if ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][k].uniqueID == v.id then	-- item already at his place
							if (ClosetGoblin.CheckTalisman(ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][k], v, Cursor.SOURCE_EQUIPMENT, k )) then
								itemPositioned = true;
							end;
						end;
						-- Searching if it's an accesories and it's in another accesories slot.
						if not itemPositioned and (k == 17 or k == 18 or k == 19) then
								for x = k+1, 20 do
									if ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][x].uniqueID == v.id then	-- item already in an other equiped slot
										if (ClosetGoblin.CheckTalisman(ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][x], v, Cursor.SOURCE_EQUIPMENT, x )) then
											ClosetGoblin.RequestMoveItem(Cursor.SOURCE_EQUIPMENT, x, Cursor.SOURCE_EQUIPMENT, k);
											itemPositioned = true;
										end;
									end;
								end;
							-- Searching if it's a pocket item and it's in another pocjet slot.
							elseif k == 11 and not itemPositioned and ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][12].uniqueID == v.id  then
								if (ClosetGoblin.CheckTalisman(ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][12], v, Cursor.SOURCE_EQUIPMENT, 12 )) then
									ClosetGoblin.RequestMoveItem(Cursor.SOURCE_EQUIPMENT, 12, Cursor.SOURCE_EQUIPMENT, 11);
									itemPositioned = true;
								end;
							-- Searching if it's a weapon and it's in the off hand (dual wield).
							elseif k == 1 and not itemPositioned and ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][2].uniqueID == v.id  then
								if (ClosetGoblin.CheckTalisman(ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][2], v, Cursor.SOURCE_EQUIPMENT, 2 )) then
									ClosetGoblin.RequestMoveItem(Cursor.SOURCE_EQUIPMENT, 2, Cursor.SOURCE_EQUIPMENT, 1);
									itemPositioned = true;
								end;
							-- Searching if it's a trophy and it's in another trophy slot.
							elseif not itemPositioned and k >= GameData.Player.c_TROPHY_START_INDEX and k <= GameData.Player.c_TROPHY_START_INDEX + GameData.Player.c_NUM_TROPHIES - 2 then
								for x = k+1, GameData.Player.c_TROPHY_START_INDEX + GameData.Player.c_NUM_TROPHIES - 1 do
									if not itemPositioned and ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][x].uniqueID == v.id then	-- item already in an other equiped slot
										ClosetGoblin.RequestMoveItem(Cursor.SOURCE_EQUIPMENT, x, Cursor.SOURCE_EQUIPMENT, k);
										itemPositioned = true;
									end;
								end;
							end;
							if not itemPositioned then
--								local slot, item = ClosetGoblin.FindItemInList(v.id, ClosetGoblin.itemList[Cursor.SOURCE_INVENTORY])
--								if slot and v.enabled then
--									ClosetGoblin.RequestMoveItem(Cursor.SOURCE_INVENTORY, slot, Cursor.SOURCE_EQUIPMENT, k);
--								end;
--							end;
--						end;
--					elseif v and v.enabled and ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][k].name ~= L"" then
--						-- Attempt to remove the item				
--						ClosetGoblin.RequestRemoveItem(Cursor.SOURCE_EQUIPMENT, k);
--					end;
--				end;
								if v.enabled then
								for slot, item in pairs(ClosetGoblin.FindAllItemInList(v.id, ClosetGoblin.itemList[Cursor.SOURCE_INVENTORY])) do
									if (not itemPositioned and ClosetGoblin.CheckTalisman(item, v, Cursor.SOURCE_INVENTORY, slot ) and ClosetGoblin.CheckBind(item, Cursor.SOURCE_INVENTORY, slot )) then
											ClosetGoblin.RequestMoveItem(Cursor.SOURCE_INVENTORY, slot, Cursor.SOURCE_EQUIPMENT, k);
											itemPositioned = true;
									end;
								end;
							end;
						end;
						if not itemPositioned and ClosetGoblin.matchingItem[1] then
							DEBUG(L"Searching for best item in matching item !")
							-- first we check for the first item with a talisman
							for k, v in ipairs(ClosetGoblin.matchingItem) do
								if v.matchingTalisman == true then
									ClosetGoblin.RequestMoveItem(v.list, v.slot, Cursor.SOURCE_EQUIPMENT, k);
									itemPositioned = true;
									ClosetGoblin.Alert(L"Warning the wanted talisman of ".. v.name .. L" was not found. The same item with another Talisman is equiped instead ! ");
								end;
							end;
							-- if we don't have we check for the first bind item
							if not itemPositioned then
								for k, v in ipairs(ClosetGoblin.matchingItem) do
									if v.bind == true then
										ClosetGoblin.RequestMoveItem(v.list, v.slot, Cursor.SOURCE_EQUIPMENT, k);
										itemPositioned = true;
										ClosetGoblin.Alert(L"Warning the wanted talisman of ".. v.name .. L" was not found. The same item with no Talisman is equiped instead ! ");
									end;
								end;
							end;
							-- And at the end we equip the first one.
							if not itemPositioned then
								ClosetGoblin.RequestMoveItem(ClosetGoblin.matchingItem[1].list, ClosetGoblin.matchingItem[1].slot, Cursor.SOURCE_EQUIPMENT, k);
								itemPositioned = true;
							end;
						end;
					elseif v and v.enabled and ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][k].name ~= L"" then
						-- Attempt to remove the item				
						ClosetGoblin.RequestRemoveItem(Cursor.SOURCE_EQUIPMENT, k);
					end;
					-- Empty table with matching item.
					ClosetGoblin.matchingItem = {};
				end;

				-- visibility: helm, cloak, guild heraldry
				if set.showHelm ~= isHelmShown then --ButtonGetPressedFlag("CharacterWindowContentsEquipmentShowHelm") then --GetEquippedItemVisible( GameData.EquipSlots.HELM ) then
					d(L"Showing helmet: ", set.showHelm)
					SetEquippedItemVisible(GameData.EquipSlots.HELM, set.showHelm)
				end
				if set.showCloak ~= isCloakShown then --ButtonGetPressedFlag("CharacterWindowContentsEquipmentShowCloak") then --GetEquippedItemVisible( GameData.EquipSlots.BACK ) then
					d(L"Showing cloak: ", set.showCloak)
					SetEquippedItemVisible(GameData.EquipSlots.BACK, set.showCloak)
				end
				if set.showCloak and set.showCloakHeraldry ~= isCloakHeraldryShown then --ButtonGetPressedFlag("CharacterWindowContentsEquipmentShowCloakHeraldry") then --IsShowingCloakHeraldry() then
					d(L"Showing cloak heraldry: ", set.showCloakHeraldry)
					SendChatText( L"/togglecloakheraldry", L"" )
				end
				
				-- Changing tactics set if  needed
				local setTactics = tonumber(set.tactics)				
				-- we test if the variable have the good format and if the player isn't in combat.
				if(setTactics == 1 or setTactics == 2 or setTactics == 3 or setTactics == 4 or setTactics == 5) then
					TacticsEditor.OnSetMenuSelectionChanged(setTactics);
				end;

				-- ActionBar stuff; would work in combat too...
				for i = 1,5 do
					if set.AbEnabled[i] then
						SetHotbarPage(i, set.AbSettings[i])
					end
				end
				
				ClosetGoblin.settings.activeSet = set.name
				ClosetGoblin.activatingSet = nil
			else
				ClosetGoblin.Alert(cgL["player_in_combat"])
			end
		else
			ClosetGoblin.Alert(cgL["already_activating_set"])
		end
	else
	--	ClosetGoblin.Alert(cgL["setnotfound"], name)
	end
	--ClosetGoblin.itemList = {}
	ClosetGoblin.DestroyItemList()
end

function ClosetGoblin.BuildItemList()
	ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT] = DataUtils.GetEquipmentData();
	local trophyData = DataUtils.GetTrophyData();
	for k = 1, GameData.Player.c_NUM_TROPHIES do
		ClosetGoblin.itemList[Cursor.SOURCE_EQUIPMENT][k + GameData.Player.c_TROPHY_START_INDEX - 1] = trophyData[k];
	end;
	ClosetGoblin.itemList[Cursor.SOURCE_INVENTORY] = DataUtils.GetItems();
end;

function ClosetGoblin.DestroyItemList()
	ClosetGoblin.itemList = {};
end;

function ClosetGoblin.CheckTalisman(item, wantedItem, list, slot)
	local goodItem = true;
	local itemWithTalisman = false;
	if item.numEnhancementSlots > 0 then	-- if item have talisman slot
		for i = 1, item.numEnhancementSlots do	-- for each talisman slot
		-- si un des slot de talisman est vide		
			if not item.enhSlot[i] and wantedItem.talisman and wantedItem.talisman[i] then
				goodItem = false;
			elseif item.enhSlot[i] and (not wantedItem.talisman or not wantedItem.talisman[i]) then
				itemWithTalisman = true;
				goodItem = false;
		-- si on a un mauvais talisman
			elseif item.enhSlot[i] and wantedItem.talisman and wantedItem.talisman[i] and item.enhSlot[i].bonus[1].reference ~= wantedItem.talisman[i] then
				itemWithTalisman = true;
				goodItem = false;
			end;
			
			if goodItem == false then
				DEBUG(L"Mauvais Talisman pour l'item ".. item.name .. L" talisman numero ".. towstring(i));
				ClosetGoblin.matchingItem[ClosetGoblin.FindMatchingItemplace()] = {
				slot = slot,
				list = list,
				matchingTalisman = itemWithTalisman,
				bind = item.boundToPlayer,
				name = item.name;
				}
			end;
		end;
	end;
	return goodItem;
end;

function ClosetGoblin.CheckBind(item, list, slot)
item.boundToPlayer = true
	if item.boundToPlayer == false then
		local itemWithTalisman = false;
		if item.numEnhancementSlots > 0 then	-- if item have talisman slot
			for i = 1, item.numEnhancementSlots do	-- for each talisman slot
				if item.enhSlot[i] then
					itemWithTalisman = true;
				end;
			end;
		end;
				
	--	DEBUG(item.name .. L" isn't bind to you.");
		ClosetGoblin.matchingItem[ClosetGoblin.FindMatchingItemplace()] = {
			slot = slot,
			list = list,
			matchingTalisman = itemWithTalisman,
			bind = item.boundToPlayer,
			name = item.name;
		}
	end;
	return item.boundToPlayer;
end;

function ClosetGoblin.FindMatchingItemplace()
	local id = 1;
	for k, v in ipairs(ClosetGoblin.matchingItem) do
		id = k+1;
	end;
	return id;
end;

function ClosetGoblin.FindPlaceInBackpack()
	local slot;
	for k = 1, GameData.Player.numBackpackSlots do
		if not ClosetGoblin.settings.removeToFirst then
			slot = GameData.Player.numBackpackSlots + 1 - k;
		else
			slot = k;
		end;
		if ClosetGoblin.itemList[Cursor.SOURCE_INVENTORY][slot].name == L"" then
			return slot;
		end;
	end;
	return nil;
end;

function ClosetGoblin.RequestRemoveItem(source, sourceSlot)
	local destinationSlot = ClosetGoblin.FindPlaceInBackpack()
	if destinationSlot then
		ClosetGoblin.RequestMoveItem(source, sourceSlot, Cursor.SOURCE_INVENTORY, destinationSlot);
		ClosetGoblin.removedLastItemSlot = destinationSlot;
		return true;
	else
		ClosetGoblin.Alert(cgL["bag_full_set_problem"]);
		return false;
	end;

end;

function ClosetGoblin.RequestMoveItem(source, sourceSlot, destination, destinationSlot)
	-- If item already in place we do nothing.
	--DEBUG(L"try to move from ".. towstring(source) .. L" slot ".. towstring(sourceSlot) .. L" to ".. towstring(destination) .. L" slot ".. towstring(destinationSlot));
	if (source == destination and sourceSlot == destinationSlot) then
		return;
	end;
	
	if (source == Cursor.SOURCE_EQUIPMENT and destination == Cursor.SOURCE_EQUIPMENT and (sourceSlot == 17 or sourceSlot == 18 or sourceSlot == 19 or sourceSlot == 20)) then
		if (ClosetGoblin.RequestRemoveItem(source, sourceSlot)) then
			RequestMoveItem(Cursor.SOURCE_INVENTORY, ClosetGoblin.removedLastItemSlot, destination, destinationSlot, 1);
		end;
	else
		RequestMoveItem(source, sourceSlot, destination, destinationSlot, 1);
	end;

	local tempSlot = ClosetGoblin.itemList[destination][destinationSlot];
	ClosetGoblin.itemList[destination][destinationSlot] = ClosetGoblin.itemList[source][sourceSlot];
	ClosetGoblin.itemList[source][sourceSlot] = tempSlot;
end;

function ClosetGoblin.ImportCurrentSet(targetSet)
	local tempSet = ClosetGoblin.CreateSetData("TempCopySet")
	local equipData = DataUtils.GetEquipmentData()
	local trophyData = DataUtils.GetTrophyData()
	
	for slotName, slot in pairs(GameData.EquipSlots) do
		if slot ~= GameData.EquipSlots.EITHER_HAND then
			if equipData[slot].uniqueID ~= 0 then
				tempSet.slots[slot].id = equipData[slot].uniqueID
				tempSet.slots[slot].icon = equipData[slot].iconNum
				tempSet.slots[slot].talisman = {};
				for k, v in ipairs(equipData[slot].enhSlot) do
					tempSet.slots[slot].talisman[k] = v.bonus[1].reference;
				end;
			else
				tempSet.slots[slot].id = nil
				tempSet.slots[slot].icon = nil
				tempSet.slots[slot].talisman = {};
			end
			
			tempSet.slots[slot].enabled = targetSet.slots[slot].enabled
		end
	end
	
	for slot = 1, GameData.Player.c_NUM_TROPHIES do
		--local uiSlot = slot + CharacterWindow.NUM_EQUIPMENT_SLOTS
		local uiSlot = slot + GameData.Player.c_TROPHY_START_INDEX - 1
		if trophyData[slot].uniqueID ~= 0 then
			tempSet.slots[uiSlot].id = trophyData[slot].uniqueID
			tempSet.slots[uiSlot].icon = trophyData[slot].icon
			tempSet.slots[uiSlot].talisman = {};
			for k, v in ipairs(trophyData[slot].enhSlot) do
				tempSet.slots[uiSlot].talisman[k] = v.bonus[1].reference;
			end;
		else
			tempSet.slots[uiSlot].id = nil
			tempSet.slots[uiSlot].icon = nil
			tempSet.slots[uiSlot].talisman = {};
		end
		
		tempSet.slots[uiSlot].enabled = targetSet.slots[uiSlot].enabled
	end
	
	-- I guess...
	tempSet.tactics = targetSet.tactics;
	
	ClosetGoblin.CopySet(tempSet, targetSet)
	tempSet = nil
end

function ClosetGoblin.CopySet(srcSet, targetSet)
	for slotName, slot in pairs(GameData.EquipSlots) do
		if slot ~= GameData.EquipSlots.EITHER_HAND then
			targetSet.slots[slot].id = srcSet.slots[slot].id
			targetSet.slots[slot].enabled = srcSet.slots[slot].enabled
			targetSet.slots[slot].icon = srcSet.slots[slot].icon
			targetSet.slots[slot].talisman = srcSet.slots[slot].talisman;
		end
	end
	
	for slot = 1, GameData.Player.c_NUM_TROPHIES do
		--local uiSlot = slot + CharacterWindow.NUM_EQUIPMENT_SLOTS
		local uiSlot = slot + GameData.Player.c_TROPHY_START_INDEX - 1;
		targetSet.slots[uiSlot].id = srcSet.slots[uiSlot].id;
		targetSet.slots[uiSlot].enabled = srcSet.slots[uiSlot].enabled;
		targetSet.slots[uiSlot].icon = srcSet.slots[uiSlot].icon;
		targetSet.slots[uiSlot].talisman = srcSet.slots[uiSlot].talisman;
	end
	
	-- Copy Tactics
	targetSet.tactics = srcSet.tactics;
	-- Update character windows
	ClosetGoblinCharacterWindow.RefreshList();
end

function ClosetGoblin.FindItemInSet(set, item)
	for k, v in pairs(set.slots) do
		if v.id == item.uniqueID then
			return k
		end
	end
	
	return nil
end

function ClosetGoblin.CountItemInSet(set, item, slot)
	local count = 0
	for k, v in pairs(set.slots) do
		if v.id == item.uniqueID and k ~= slot then
			count = count + 1
		end
	end
	
	return count
end

function ClosetGoblin.CountItemInList(item, list)
	local count = 0
	for k, v in pairs(list) do
		if v.uniqueID == item.uniqueID then
			count = count + 1
		end
	end
	
	return count
end

function ClosetGoblin.CountItemInPossession(item)
	return (
		ClosetGoblin.CountItemInList(item, DataUtils.GetItems()) + 
		ClosetGoblin.CountItemInList(item, DataUtils.GetEquipmentData()) +
		ClosetGoblin.CountItemInList(item, DataUtils.GetTrophyData())
	)
end

function ClosetGoblin.ItemIsUniqueToSet(set, item, slot)
	if ClosetGoblin.CountItemInSet(set, item, slot) >= ClosetGoblin.CountItemInPossession(item) then
		return false
	end
	
	return true
end

function ClosetGoblin.SetSlot(set, slot, sourceList, sourceSlot)
	ClosetGoblin.BuildItemList();
	local item = ClosetGoblin.itemList[sourceList][sourceSlot];
	if set and slot and item and ClosetGoblin.CanEquip(item, slot) then
		if not ClosetGoblin.ItemIsUniqueToSet(set, item, slot) then
			ClosetGoblin.Alert(cgL["Warning_not_enough_item"], item.name);
		end
		set.slots[slot].id = item.uniqueID;
		set.slots[slot].icon = item.iconNum;
		set.slots[slot].talisman = {};
		for k, v in ipairs(item.enhSlot) do
			set.slots[slot].talisman[k] = v.bonus[1].reference;
		end;
	end;
	ClosetGoblin.DestroyItemList();
end;

--[[
function ClosetGoblin.SetSlot(set, slot, item)
	if set and slot and item then
		if not ClosetGoblin.ItemIsUniqueToSet(set, item, slot) then
			-- For now, this is just a warning, because the algorithm is not perfect
			ClosetGoblin.Alert(cgL["Warning_not_enough_item"], item.name)
		end
		set.slots[slot].id = item.uniqueID
		set.slots[slot].icon = item.iconNum
	end
end
]]

function ClosetGoblin.ToggleSlot(set, slot)
	if set and slot and set.slots[slot] then
		set.slots[slot].enabled = not set.slots[slot].enabled
	end
end

function ClosetGoblin.ClearSlot(set, slot)
	if set and slot and set.slots[slot] then
		set.slots[slot].id = nil;
		set.slots[slot].icon = nil;
		set.slots[slot].talisman = nil;
	end
end

function ClosetGoblin.RenameSet(set, name)
	local check = ClosetGoblin.NAME_OK;
	if set then
		local setOldName = set.name;
		check = ClosetGoblin.CheckName(name);
		if check == ClosetGoblin.NAME_OK then
			set.name = towstring(name);
			-- Modifying association with zone.
			for k, v in pairs(ClosetGoblinZoneWindow.associationTable) do
				if v.set == setOldName then
					ClosetGoblin.AssociateZoneToSet(tostring(v.zone), towstring(name));
					ClosetGoblinZoneWindow.RefreshList();				
				end;
			end;
		end;
	end;
	
	return check;
end;

function ClosetGoblin.CheckName(name)
	if ClosetGoblin.TrimWString(name) == L"" then
		return ClosetGoblin.NAME_EMPTY
	elseif not ClosetGoblin.IsNameUnique(name) then
		return ClosetGoblin.NAME_NOT_UNIQUE
	end
	
	return ClosetGoblin.NAME_OK
end

function ClosetGoblin.IsNameUnique(name)
	for i, v in ipairs(ClosetGoblin.GetProfileSets()) do
		if wstring.lower(v.name) == wstring.lower(towstring(name)) then
			return false
		end
	end
	
	return true
end

function ClosetGoblin.ValidSlot(item, slot)
	if item.equipSlot == slot then
		return true;
	end;
	
	-- If this item is an accessory, it can fit in several slots
	if item.equipSlot == 17 and (
		slot == 17 or
		slot == 18 or
		slot == 19 or
		slot == 20
	) then
		return true;
	end;
	
	-- If this is a pocket item, it can fit in both pocket slots
	if item.equipSlot == 12 and (
		slot == 11 or
		slot == 12
	) then
		return true;
	end;
	
	-- Handle slot 4 (either hand)
	if item.equipSlot == 4 then
		if slot == 1 then
			return true;
		elseif GameData.Player.Skills[GameData.SkillType.DUAL_WIELD] and slot == 2 then
			return true;
		end;
	end;
	
	-- Is this a trophy?
	if item.type == GameData.ItemTypes.TROPHY then
		if slot >= GameData.Player.c_TROPHY_START_INDEX and slot <= GameData.Player.c_TROPHY_START_INDEX + GameData.Player.c_NUM_TROPHIES -1 then
			return true;
		end;
	end;
	
	ClosetGoblin.Message(cgL["bad_slot"]);
	return false;
end

function ClosetGoblin.ValidRace(item)
	-- Check if the item has race restrictions
	if table.getn(item.races) < 1 then
		return true;
	end;
	
	for i,v in ipairs(item.races) do
		if v == GameData.Player.race.id then
			return true;
		end;
	end;
	
	ClosetGoblin.Message(cgL["bad_race"]);
	return false;
end

function ClosetGoblin.ValidCareer(item)
	-- Check if the item has career restrictions
	if table.getn(item.careers) < 1 then
		return true;
	end;
	
	for i,v in ipairs(item.careers) do
		if v == GameData.Player.career.line then
			return true;
		end;
	end;
	
	ClosetGoblin.Message(cgL["bad_career"]);
	return false;
end

function ClosetGoblin.ValidSkills(item)
	-- Check for skill restrictions
	if table.getn(item.skills) < 1 then
		return true;
	end;
	
	for i,v in ipairs(item.skills) do
		if GameData.Player.Skills[v] then
			return true;
		end;
	end;
	
	ClosetGoblin.Message(cgL["bad_skill"]);
	return false;
end

function ClosetGoblin.ValidRank(item)
	local ret = item.level <= GameData.Player.level;
	if not ret then
		ClosetGoblin.Message(cgL["bad_rank"]);
	end;
	return ret
end

function ClosetGoblin.ValidRenownRank(item)
	local ret = item.renown <= GameData.Player.Renown.curRank;
	if not ret then
		ClosetGoblin.Message(cgL["bad_rank"]);
	end;
	return ret;
end

function ClosetGoblin.CanEquip(item, slot)
	return (
		ClosetGoblin.ValidSlot(item, slot) and 
		ClosetGoblin.ValidRace(item) and 
		ClosetGoblin.ValidCareer(item) and 
		ClosetGoblin.ValidSkills(item) and 
		ClosetGoblin.ValidRank(item) and 
		ClosetGoblin.ValidRenownRank(item)
	)
end

function ClosetGoblin.TrimWString(wstr)
	-- This is a terrible, ugly, hack because currently Mythic's implementation does not match [ ] or %s to spaces
	-- in wide strings, for any function...gsub, gmatch, match, nothing.
	if type(wstr) ~= "wstring" then
		wstr = towstring(wstr)
	end
	
	local len = 0
	while wstr:sub(len + 1, len + 1) == L" " and len < wstr:len() do
		len = len + 1
	end	
	wstr = wstr:sub(len + 1)
	
	len = 0
	while wstr:sub(len - 1, len - 1) == L" " and math.abs(len) < wstr:len() do
		len = len - 1
	end	
	wstr = wstr:sub(-wstr:len(), len - 1)

	return wstr
end

function ClosetGoblin.ZoneChangeChange()
	if(ClosetGoblin.settings.zoneChange == false) then
		ClosetGoblin.ZoneChangeEnabled();
	else
		ClosetGoblin.ZoneChangeDisabled();
	end;
end;

function ClosetGoblin.ZoneChangeEnabled()
	ClosetGoblin.Message(cgL["Setting_zones_to_sets"] .. cgL["Enabled"]);
	ClosetGoblin.settings.zoneChange = true;
	ClosetGoblin.ZoneChangeInit();
end;

function ClosetGoblin.ZoneChangeDisabled()
	ClosetGoblin.Message(cgL["Setting_zones_to_sets"] .. cgL["Disabled"]);
	ClosetGoblin.settings.zoneChange = false;
	ClosetGoblin.ZoneChangeShutdown();
end;

function ClosetGoblin.ZoneChangeInit()
	ClosetGoblin.zoneType = {
		[0] = "loading",		-- Sometime you "enter" the zone number 0 when you are loading
		-- Ork
		[1]	= "t2",				--"Marais de la Folie^m",
		[2]	= "t3",				--"Terres arides^pf,in",
		[3]	= "t4",				--"Rocher noir^m,in",
		[4]	= "fortress",		--"Col du boucher^m",
		[5]	= "t4",				--"Mont du tonnerre^m,in",
		[6]	= "t1",				--"Ekrund^m",
		[7]	= "t2",				--"Barak Varr^m",
		[8]	= "t3",				--"Col du Feu Noir^m",
		[9]	= "t4",				--"Vallée de Kadrin^f",
		[10] = "fortress",		--"Guet de pierre^m",
		[11] = "t1",			--"Mont de la Corne sanglante^m,in", 
		[26] = "t4",			--"Chutes cendrines^pf,in",
		[27] = "t4",			--"Pic des morts^m",
		-- scenario Ork
		[30] = "scenario",		--"Portes d\x19Ekrund^pf",
		[31] = "scenario",		--"temple de Morgheim^m",			T2
		[33] = "scenario",		--"Cratère du Poing du destin^m,in",
		[34] = "scenario",		--"Vallée du tonnerre^f,in",
		[38] = "scenario",		--"Bassin du feu noir",
		[39] = "scenario",		--"Forge de Logrin^f",
		[43] = "scenario",		--"Croisée du Gromril^f,at",
		[44] = "scenario",		--"Défilé de Hurlevent^m",
		[45] = "scenario",		--"Ekrund v2",
		[37] = "scenario", 	-- black crag keep
		-- CHAOS
		[100] = "t1",			--"Norsca^f",
		[101] = "t2",			--"Pays des trolls^m",
		[102] = "t3",			--"Haut col^m,in",
		[103] = "t4",			--"Désolations du Chaos^pm",
		[104] = "fortress",		--"La Gueule^F",
		[105] = "t4",			--"Praag^F",
		[106] = "t1",			--"Nordland^m",
		[107] = "t2",			--"Ostland^m",
		[108] = "t3",			--"talabecland^m",
		[109] = "t4",			--"Reikland^m",
		[110] = "fortress",		--"Reikwald^f",
		[120] = "t4",			--"Ouest de Praag^m",
		-- scenario chaos
		[130] = "scenario",		--"Guet du nord^m",
		[131] = "scenario",		--"Carrefour des trolls de pierre^m,in",
		[132] = "scenario",		--"Barrage de talabec^f,in",
		[133] = "scenario",		--"Gueule de la folie^f,in",
		[134] = "scenario",		--"Collines du Reikland^pf",
		[135] = "scenario",		--"Tour Chaotique^f,in",
		[136] = "scenario",		--"Bataille pour Praag^f,in",
		[137] = "scenario",		--"Cavernes de Grovod^pf",
		[138] = "scenario",		--"Manufacture du Reikland^f",
		[139] = "scenario",		--"Cimetiére du haut col",
		-- ELF
		[200] = "t1",			--"L\x19Ile blafarde^F,in",
		[201] = "t2",			--"Le Pays des ombres^M,in",
		[202] = "t3",			--"Avelorn^F",
		[203] = "t4",			--"Caledor^M",
		[204] = "fortress",		--"Débarcadère sauvage^m",
		[205] = "t4",			--"Veille des dragons^f",
		[206] = "t1",			--"Chrace^F",
		[207] = "t2",			--"Ellyrion^M",
		[208] = "t3",			--"Saphery^M",
		[209] = "t4",			--"Eataine^M",
		[210] = "fortress",		--"Voie étincelante^f",
		[220] = "t4",			--"Ile des Morts^f",
		-- scenario elf
		[230] = "scenario",		--"Etreinte de Khaine^f",
		[231] = "scenario",		--"Porte du Phénix^f",
		[232] = "scenario",		--"Tor Anroc^N",
		[234] = "scenario",		--"Passage du serpent^m",
		[235] = "scenario",		--"Fléau du dragon^m",
		[236] = "scenario",		--"Temple d\x19Isha^m",
		[237] = "scenario",		--"Bois de Caledor^pm",
		[238] = "scenario",		--"Sang de Noir-tumulus^m",
		-- Instance
		[41] = "instance",		--"Altdorf War Sewers (Map 41)",
		[60] = "instance",		--"Mont Gunbad^m",
		[69] = "instance",		--"Mont Gunbad^m"
		[152] = "instance",		--"Egout d'altdorf",
		[153] = "instance",		--"Egout d'altdorf",
		[155] = "instance",		--"Donjons de Sacellum^pm",
		[156] = "instance",		--"Donjons de Sacellum^pm",
		[160] = "instance",		--"Escalier du bastion^m,in",
		[173] = "instance",		--"Donjons de Sacellum^pm",
		[179] = "instance",		-- Tomb of the Vulture Lord,
		[195] = "instance",		--"Enclave Forgesang^f,in",
		[196] = "instance",		--"Tunnel Bile\x19pourrie^m",	
		[260] = "instance",		--"La Vallée perdue^F",
		-- mini-instance
		-- like the boss of gunbad. for these one we will not change equipment because when player enter in it he is already in an instance.
		[64] = "nochange",		--"Mont Gunbad boss",
		[65] = "nochange",		--"Mont Gunbad boss",
		-- capital
		[161] = "capital",		--"La Cité inexorable^F", paix
		[162] = "capital",		--"Altdorf^f",
		[167] = "capital",		--"La Cité inexorable^F",
		[168] = "capital",		--"Altdorf^f",
		[178] = "capital",		--"La Fosse aux vipères^F,in",
		[190] = "capital",		--"Collége magie flamboyante",
		[198] = "capital",		--"Marteau de Sigmar^m",
		-- capital scenario
		[42] = "scenario",		--"The Undercroft (Map 42) capital scenario",
		-- other
		[191] = "t4",  			-- necropole
	};
	RegisterEventHandler(SystemData.Events.PLAYER_ZONE_CHANGED, "ClosetGoblin.PlayerZoneChanged");
	RegisterEventHandler(SystemData.Events.LOADING_BEGIN, "ClosetGoblin.LoadingBegin");
	RegisterEventHandler(SystemData.Events.LOADING_END, "ClosetGoblin.LoadingEnd");
end;

function ClosetGoblin.ZoneChangeShutdown()
	UnregisterEventHandler(SystemData.Events.PLAYER_ZONE_CHANGED, "ClosetGoblin.PlayerZoneChanged");
	UnregisterEventHandler(SystemData.Events.LOADING_BEGIN, "ClosetGoblin.LoadingBegin");
	UnregisterEventHandler(SystemData.Events.LOADING_END, "ClosetGoblin.LoadingEnd");
end;

function ClosetGoblin.ZoneChangeSet()
	local idzone = GameData.Player.zone;
	local typeZone = "";

	if(ClosetGoblin.zoneType[idzone]) then
		typeZone = ClosetGoblin.zoneType[idzone];
		if(ClosetGoblin.currentProfile.zoneToSet[typeZone] ~= L"") then
			ClosetGoblin.ActivateSet(ClosetGoblin.currentProfile.zoneToSet[typeZone]);
		end;
	else
		ClosetGoblin.Alert(cgL["Map_Unknown"], GetZoneName(idzone), towstring(idzone));
	end;
end;

function ClosetGoblin.AssociateZoneToSet(zone, set)
	if zone == "t1" or zone == "t2" or zone == "t3" or zone == "t4" or zone == "capital" or zone == "instance" or zone == "fortress" or zone == "scenario" then
		if(set == nil or set == L"") then
			ClosetGoblin.Message(cgL["Unassociating_zone_with_set"], towstring(zone));
			ClosetGoblin.currentProfile.zoneToSet[zone] = L"";
			ClosetGoblinZoneWindow.RefreshList();
		else
			if(ClosetGoblin.GetSetByName(set) == nil) then
			--	ClosetGoblin.Alert(cgL["setnotfound"], set);
			else
				ClosetGoblin.Message(cgL["Associating_zone_with_set"], towstring(zone), set);
				ClosetGoblin.currentProfile.zoneToSet[zone] = set;
				ClosetGoblinZoneWindow.RefreshList();
			end;
		end;
	elseif zone == "list" then
		ClosetGoblin.Message(cgL["Setting_zones_to_sets"], ClosetGoblin.ToEnabled(ClosetGoblin.settings.zoneChange));
		for z,s in pairs(ClosetGoblin.currentProfile.zoneToSet) do
			ClosetGoblin.Message(cgL["Zone_List"], towstring(z), towstring(s));
		end
	end
end;

function ClosetGoblin.LinkTactics(tacticsset, setname)
	local set = ClosetGoblin.GetSetByName(setname);
	set.tactics = tacticsset;
	if(tacticsset ~= L"x") then
		ClosetGoblin.Message(cgL["Set_link_to_tactics"], set.name, tacticsset);
	else
		ClosetGoblin.Message(cgL["Set_unlink_to_tactics"], set.name);
	end;
end;

function ClosetGoblin.Show()
	ClosetGoblinCharacterWindow.Show();
end;

function ClosetGoblin.Hide()
	ClosetGoblinCharacterWindow.Show();
end;

function ClosetGoblin.ToEnabled(option)
	if(option == true) then
		return cgL["Enabled"];
	else
		return cgL["Disabled"];
	end;
end;

--[[
   ClosetGoblin Tooltip function
]]
function ClosetGoblin.CreateItemTooltip( itemData, mouseoverWindow, anchor, disableComparison, extraText, extraTextColor, ignoreBroken )
	local info, found = ClosetGoblin.GetSetNamesForItem(itemData.uniqueID)
	if found then
		info = cgL["iteminset"] .. L"\n" .. info .. L"\n"
	end
	if extraText then
		return ClosetGoblin.CreateItemTooltipOLD( itemData, mouseoverWindow, anchor, disableComparison, info..extraText, extraTextColor, ignoreBroken )
	elseif found then
		return ClosetGoblin.CreateItemTooltipOLD( itemData, mouseoverWindow, anchor, disableComparison, info, extraTextColor, ignoreBroken )
	else
		return ClosetGoblin.CreateItemTooltipOLD( itemData, mouseoverWindow, anchor, disableComparison, extraText, extraTextColor, ignoreBroken )
	end
end


function ClosetGoblin.GetSetNamesForItem(itemID)
	local setNames = L""
	local found = false

	for i, set in ipairs(ClosetGoblin.GetProfileSets()) do
		for k, v in pairs(set.slots) do
			if v.id == itemID then
			setNames = setNames..L"["..set.name..L"] "
				if not found then
					found = true
				end
			end
		end
	end

	return setNames, found
end



function ClosetGoblin.OnUpdate(timeElapsed)
if ClosetGoblin.IsUpdating == true then
ClosetGoblin.timeLeft = ClosetGoblin.timeLeft - timeElapsed
   if ClosetGoblin.timeLeft <= 0.1 then
   
   if ClosetGoblin.UpdateTimes <= 20 then
   LabelSetText( "ClosetGoblinLoadWindowText",L"Equiping: "..towstring(ClosetGoblin.UpdateTimes*5)..L"%")
   WindowSetShowing("ClosetGoblinLoadWindow",true)
 --  d(ClosetGoblin.UpdateTimes)
 --  ClosetGoblin.ActivateSet(ClosetGoblin.UpDateName)
	ClosetGoblin.ActivateSet(ClosetGoblin.sortedSetsList[DoTheSet]);
 
 
   ClosetGoblin.UpdateTimes = ClosetGoblin.UpdateTimes +1
   ClosetGoblin.timeLeft = ClosetGoblin.TIME_DELAY
   else
   WindowSetShowing("ClosetGoblinLoadWindow",false)
   ClosetGoblin.UpdateTimes = 0
   ClosetGoblin.IsUpdating = false

   
    end	
	end
     -- reset to TIME_DELAY seconds

end
end


function ClosetGoblin.Update(name)

--ClosetGoblin.ActivateSet(ClosetGoblin.UpDateName)
ClosetGoblin.UpdateTimes = 0

ClosetGoblin.IsUpdating = true
ClosetGoblin.UpDateName = name
end




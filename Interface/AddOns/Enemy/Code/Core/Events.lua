local Enemy = Enemy
local select = select


function Enemy.EventsInitialize ()

	Enemy.events = {}
	Enemy.TriggerEvent ("EventsInitialized")
end


function Enemy.AddEventHandler (key, name, callback)

	if (not callback)
	then
		d ("Wrong arguments for Enemy.AddEventHandler: "..key..", "..name..", "..type (callback))
	end

	Enemy.RemoveEventHandler (key, name)
	
	local e = Enemy.events[name]
	if (e == nil)
	then
		e = EnemyLinkedList.New ()
		Enemy.events[name] = e
	end
	
	e:Add (key, callback)
end


function Enemy.TriggerEvent (name, ...)

	local e = Enemy.events[name]
	if (e == nil) then return end
	
	local item = e.first
	while (item)
	do
		item.data (select (1, ...))
		item = item.next
	end
end


function Enemy.RemoveEventHandler (key, name)

	local e = Enemy.events[name]
	if (e == nil) then return end
	e:Remove (key)
end
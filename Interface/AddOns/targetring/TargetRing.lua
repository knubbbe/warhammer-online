LibConfig = LibStub("LibConfig")

TargetRing = {}

DEFAULTSETTINGS = {
	version = 1.3,
	FriendlyTarget = { enabled = true,
						sound = false,
						color = {0, 255, 0},
						scale = 1,
						alpha = 0.5,
						dx = 0,
						dy = -10,
					},
	EnemyTarget =	{ enabled = true,
						sound = false,
						color = {255, 0, 0},
						scale = 1,
						alpha = 0.5,
						dx = 0,
						dy = -10,
						},
					}

local cur_eid = nil
local cur_fid = nil
local GUI

function TargetRing.CreateRing(unit)
	ring = unit.."Ring"
	anchor = ring.."Anchor"
	settings = TargetRing.Settings[unit]

	if (DoesWindowExist(anchor)) then
		DestroyWindow(ring)
	else
		CreateWindowFromTemplate(anchor, "EA_DynamicImage_DefaultSeparatorRight", "Root")
		WindowSetDimensions(anchor, 1, 1)
		WindowRegisterCoreEventHandler(anchor, "OnShown", "TargetRing.PlaySound_"..unit)
	end
	
	CreateWindowFromTemplate(ring, "EA_DynamicImage_DefaultSeparatorRight", anchor)
	WindowClearAnchors(ring)
	WindowAddAnchor(ring, "top", anchor, "top", settings.dx, settings.dy)
	DynamicImageSetTexture(ring, "TargetRing", 0, 0)
	DynamicImageSetTextureDimensions(ring, 256, 256)
	WindowSetDimensions(ring,100,100)
	WindowSetScale(ring, settings.scale)
	WindowSetAlpha(ring, settings.alpha)
	WindowSetShowing(ring, false)
	WindowSetTintColor(ring, unpack(settings.color))
end

function TargetRing.PlaySound_FriendlyTarget()
	if (TargetRing.Settings.FriendlyTarget.sound) then
		PlaySound(8)
	end
end

function TargetRing.PlaySound_EnemyTarget()
	if (TargetRing.Settings.EnemyTarget.sound) then
		PlaySound(8)
	end
end

function TargetRing.Recreate()
	for unit, _ in pairs(TargetRing.Settings) do
		if (unit ~= "version") then
			TargetRing.CreateRing(unit)
		end
	end 
end

function TargetRing.Initialize()
	RegisterEventHandler(SystemData.Events.PLAYER_TARGET_UPDATED, "TargetRing.UpdateTargets")
	
	LibSlash.RegisterSlashCmd("tr",function(msg) TargetRing.Slash(msg) end)
	LibSlash.RegisterSlashCmd("targetring",function(msg) TargetRing.Slash(msg) end)
	
	if (not TargetRing.Settings) then
		TargetRing.Settings = DEFAULTSETTINGS
	elseif (TargetRing.Settings.version ~= DEFAULTSETTINGS.version) then
		if (TargetRing.Settings.version == 1.2) then
			TargetRing.Settings.FriendlyTarget.sound = false
			TargetRing.Settings.EnemyTarget.sound = false
			TargetRing.Settings.version = 1.3
		else
			TargetRing.Settings = DEFAULTSETTINGS
		end
	end
	
	TargetRing.Recreate()
end

function TargetRing.Slash(msg)
	if (not GUI) then
		GUI = LibConfig("TargetRing Settings", TargetRing.Settings, true, TargetRing.Recreate)

		for unit, _ in pairs(TargetRing.Settings) do
			if (unit ~= "version") then
				GUI:AddTab(unit)
				GUI("checkbox", "enabled", {unit, "enabled"})
				GUI("checkbox", "play sound on showing", {unit, "sound"})
				GUI("color", "color", {unit, "color"})
				GUI("textbox", "scale", {unit, "scale"}, function(i) return math.max(math.min(i, 10), 0.1) end)
				GUI("textbox", "alpha", {unit, "alpha"})
				GUI("textbox", "x offset", {unit, "dx"})
				GUI("textbox", "y offset", {unit, "dy"})
			end
		end
	end
	
	GUI:Show()
end

function TargetRing.UpdateTargets()
	TargetInfo:UpdateFromClient()

	local fid = TargetInfo:UnitEntityId("selffriendlytarget")
	if (fid ~= cur_fid) then
		if (cur_fid) then
			DetachWindowFromWorldObject("FriendlyTargetRingAnchor", cur_fid)
		end
		WindowSetShowing("FriendlyTargetRing",false)
		if (fid > 0 and fid ~= GameData.Player.worldObjNum) then
			MoveWindowToWorldObject("FriendlyTargetRingAnchor",fid,1)
			AttachWindowToWorldObject("FriendlyTargetRingAnchor",fid)
			if (TargetRing.Settings.FriendlyTarget.enabled) then
				WindowSetShowing("FriendlyTargetRing",true)
			else
				WindowSetShowing("FriendlyTargetRing",false)
			end
		end
		cur_fid = fid
	end

	local eid = TargetInfo:UnitEntityId("selfhostiletarget")
	if (eid ~= cur_eid) then
		if (cur_eid) then
			DetachWindowFromWorldObject("EnemyTargetRingAnchor", cur_eid)
		end
		WindowSetShowing("EnemyTargetRing",false)
		if (eid > 0) then
			MoveWindowToWorldObject("EnemyTargetRingAnchor",eid,1)
			AttachWindowToWorldObject("EnemyTargetRingAnchor",eid)
			if (TargetRing.Settings.EnemyTarget.enabled) then
				WindowSetShowing("EnemyTargetRing",true)
			else
				WindowSetShowing("EnemyTargetRing",false)
			end
		end
		cur_eid = eid
	end

end
local WSCT = WSCT
local db

local WSCT_MAX_TIME = 10
local WSCT_CRIT_FADEINTIME = 0.3
local WSCT_CRIT_HOLDTIME = 2.0
local WSCT_CRIT_FADEOUTTIME = 0.5
local WSCT_CRIT_Y_OFFSET = 10
local WSCT_CRIT_SIZE_PERCENT = 1.25
local WSCT_CRIT_FLASH_SIZE_PERCENT = 2
local WSCT_CRIT_MAX_COUNT = 7
local WSCT_MAX_SPEED = .025
local WSCT_MIN_UPDATE_SPEED = .01
local WSCT_SIDE_POINT = 210
local WSCT_MAX_DISTANCE = 150
local WSCT_HUD_DIST = 50
local WSCT_DIRECTION = 1
local WSCT_SPRINKLER_START = 18
local WSCT_SPRINKLER_STEP = -3
local WSCT_SPRINKLER_RADIUS = 20
local WSCT_SPRINKLER = WSCT_SPRINKLER_START
local WSCT_ANIMATION_FRAME = "WSCT_ANIMATION_FRAME"
local WSCT_TEXTSIZE_BASE = 24

--Animation System variables
local WSCT_TEXTCOUNT = 50       -- Number of text that can animate
local arrAlign = {[1] = "left", [2] = "center", [3] = "right"}
local animations                -- animation mapping table
local arrFrameTexts = {}
local arrAniData = {
  [WSCT.FRAME1] = {},
  [WSCT.FRAME2] = {},
  [WSCT.FRAME3] = {},
}
local arrAniCritData = {
  [WSCT.FRAME1] = {},
  [WSCT.FRAME2] = {},
  [WSCT.FRAME3] = {},
}

--LUA calls
local pairs = pairs
local math_sqrt = math.sqrt
local math_abs = math.abs
local math_fmod = math.fmod
local math_ceil = math.ceil
local random = math.random
local floor = math.floor
local tremove = table.remove
local tinsert = function(t,v)
  t[#t+1] = v
end

--Window Calls
local LabelSetFont = LabelSetFont
local LabelSetTextColor = LabelSetTextColor
local LabelSetText = LabelSetText
local WindowAddAnchor = WindowAddAnchor
local WindowClearAnchors = WindowClearAnchors
local WindowSetFontAlpha = WindowSetFontAlpha
local WindowSetScale = WindowSetScale
local WindowSetShowing = WindowSetShowing
local WindowGetShowing = WindowGetShowing
local WindowGetScreenPosition = WindowGetScreenPosition
local WindowSetDimensions = WindowSetDimensions
local AttachWindowToWorldObject = AttachWindowToWorldObject
local DetachWindowFromWorldObject = DetachWindowFromWorldObject
local MoveWindowToWorldObject = MoveWindowToWorldObject
local GetScreenResolution = GetScreenResolution
local CreateWindowFromTemplate = CreateWindowFromTemplate
local DestroyWindow = DestroyWindow
local DoesWindowExist = DoesWindowExist

for i=1, WSCT_TEXTCOUNT do
  local frame, frameText, frameName, frameTextName, frameIconName
  frameName = "WSCTAnimationFrame" .. i
  frameTextName = frameName.."Text"
  frameIconName = frameName.."Icon"
  frame = {}
  frame.name = frameName
  frame.textname = frameTextName
  frame.iconname = frameIconName
  arrFrameTexts[i] = frame
end

----------------------
--Calculate Circle X pos based on current settings
local function CalculateCircleCordX(adat)
  local max = (adat.toppoint - adat.bottompoint)/2
  local top =  adat.toppoint - max
  local cY = adat.posY - top
  local cX = math_ceil(math_sqrt((max ^ 2) - math_abs(cY ^ 2)))
  return math_ceil(adat.offsetX - (adat.sidedir * (cX + adat.gap)))
end

----------------------
--Calculate Angled X pos based on current settings
local function CalculateAngleCordX(adat)
  local max = adat.toppoint - adat.bottompoint
  local cY = adat.posY - adat.toppoint
  local cX = max + math_ceil(cY*.3)
  return math_ceil(adat.offsetX - (adat.sidedir * (cX + adat.gap)))
end

----------------------
--Display the Text
function WSCT:DisplayText(msg, color, iscrit, etype, frame, anitype, objectID, icon)
  --Set up  text animation
  local adat = self:GetNextAniObj(frame)

  --set override animation
  adat.anitype = anitype or adat.anitype

  --set anchor
  if objectID and adat.atobject then
    self:ObjectIDAnimation(adat, objectID)
  else
    WindowAddAnchor(adat.name, "center", "WSCTContainer", "center",  0, 0)
  end

  --If its a crit hit, increase the size
  if (iscrit) then
    self:CritInit(adat)
  end

  --if its not a sticky critm set up normal text start position
  if (not adat.crit) then
    --get direction type
    self:SideInit(adat, etype)
    --perform init function
    adat.anim = animations[adat.anitype].anim or animations[1].anim
    adat.init = animations[adat.anitype].init or animations[1].init
    adat.init(self, adat)
  end

  --set default color if none
  color = color or {r = 255, g = 255, b = 255}

  --set up text
  LabelSetFont(adat.textname, WSCT.LOCALS.FONTS[adat.font].font, WindowUtils.FONT_DEFAULT_TEXT_LINESPACING)
  LabelSetTextColor(adat.textname, color.r, color.g, color.b)
  LabelSetText(adat.textname, msg)
  LabelSetTextAlign(adat.textname, arrAlign[adat.align])
  local x, y = LabelGetTextDimensions(adat.textname)
  WindowSetDimensions(adat.textname, x+5, y)

  --set up window settings
  WindowAddAnchor(adat.textname, arrAlign[2], adat.name, arrAlign[adat.align], adat.posX, -adat.posY)
  WindowSetScale(adat.textname, adat.uiscale * (adat.textsize/WSCT_TEXTSIZE_BASE))
  WindowSetFontAlpha(adat.textname, adat.alpha)
  WindowSetShowing(adat.name, true)
  tinsert(arrAniData[adat.frame], adat)

  --setup icon
  if (adat.icon and icon) then
    self:IconInit(adat, icon)
  end

  --Start up onUpdate
  --if (not WindowGetShowing(WSCT_ANIMATION_FRAME)) then
  --  WindowSetShowing(WSCT_ANIMATION_FRAME, true)
  --end
end

----------------------
-- setup animation for objectID
function WSCT:ObjectIDAnimation(adat, objectID)
  --set to world object first to get values
  --AttachWindowToWorldObject(adat.name, objectID)
  MoveWindowToWorldObject(adat.name, objectID, 1.0)
  --get screen postions
  --local screenx, screeny = GetScreenResolution()
  local x, y = WindowGetScreenPosition(adat.name)
  local currenty, currentx
  --check to see if off screen
  --  if y is greater than screen top or less than bottom of screen
  --  if x is greater than screen right or less than left of screen
  --d(x..", "..y.." | "..screenx..", "..screeny)
  if (x == 0) and (y == 0) then
  --if (y >= screeny) or (y < 0) or (x >= screenx) or (x < 0) then
    --DetachWindowFromWorldObject(adat.name, objectID)
    WindowClearAnchors(adat.name)
    WindowAddAnchor(adat.name, "center", "WSCTContainer", "center",  0, 0)
  else
    --check to see if needs to be moved down to perform full animation path
    if not adat.crit then
      adat.posY = 10
    end
    currenty = y - adat.posY
  	if currenty < WSCT_MAX_DISTANCE then
  		adat.posY = currenty - WSCT_MAX_DISTANCE
  	end
  	--set rest of defaults
    adat.objectID = objectID
    --adat.anitype = 1
    --adat.posX = 0
  	adat.offsetY = 0
  	--adat.offsetX = 0
  	adat.bottompoint = adat.posY
  	adat.toppoint = adat.posY + WSCT_MAX_DISTANCE
  	--adat.direction = nil
  end
end

----------------------
-- Upate animations that are being used
function WSCT.UpdateAnimation(elapsed)
  local anyActive = false
  for i = 1, #arrAniData do
    for key, value in pairs(arrAniData[i]) do
      if (DoesWindowExist(value.name)) then
        anyActive = true
        WSCT:DoAnimation(value, elapsed)
      end
    end
  end
  if WSCT.LowHpTime > 0 then
    WSCT.LowHpTime = WSCT.LowHpTime - elapsed
  else
    WSCT.LowHpTime = 0
  end
  --if none are active, stop onUpdate
  --if (anyActive ~= true and WindowGetShowing(WSCT_ANIMATION_FRAME)) then
  --  WindowSetShowing(WSCT_ANIMATION_FRAME, false)
  --end
end

----------------------
--Move text to get the animation
function WSCT:DoAnimation(adat, elapsed)
  local speed = db["ANIMATIONSPEED"] / 1000
  --If a crit
  adat.lastupdate = adat.lastupdate + elapsed
  if adat.objectID then
    MoveWindowToWorldObject(adat.name, adat.objectID, 1.0)
  end
  if (adat.crit) then
    adat.anim(self,adat,speed)
  --else normal text or event text
  else
    --if its time to update, move the text step positions
    while (adat.lastupdate > speed) do
      --do animation
      adat.anim(self, adat)
      --set update on FPS mode
      if (db["FPSMODE"]) then
        adat.lastupdate = adat.lastupdate - speed
      else
        adat.lastupdate = 0
      end
      --move text
      WindowSetFontAlpha(adat.textname, adat.alpha)
      WindowClearAnchors(adat.textname)
      WindowAddAnchor(adat.textname, arrAlign[2], adat.name, arrAlign[adat.align], adat.posX, -adat.posY)
      --update icon
      if adat.icon then WindowSetAlpha(adat.name, adat.alpha) end
      --reset when alpha is 0
      if (adat.alpha <= 0) then
        --d("normal reset")
        self:AniReset(adat)
      end
    end
  end
end

----------------------
--Initialize Side Type
function WSCT:SideInit(adat, etype)
  local curDir
  if adat.anitype ~= 1 then
    if (adat.sidedir == 1) then
      WSCT_DIRECTION = WSCT_DIRECTION * -1
      curDir = WSCT_DIRECTION
    elseif (adat.sidedir == 2) then
      if (etype=="event") then curDir = -1 else curDir = 1 end
    elseif (adat.sidedir == 3) then
      if (etype=="event") then curDir = 1 else curDir = -1 end
    elseif (adat.sidedir == 4) then
      curDir = 1
    elseif (adat.sidedir == 5) then
      curDir = -1
    end
    adat.sidedir = curDir
  end
  if (adat.align == 4) then
    if (adat.anitype == 7 or adat.anitype == 8) then
      adat.align = 2 - adat.sidedir
    else
      adat.align = 2
    end
  end
end

----------------------
--Initialize Crit Animation
function WSCT:CritInit(adat)
  adat.textsize = adat.textsize * WSCT_CRIT_SIZE_PERCENT
  if (db["STICKYCRIT"]) then
    adat.anim = self.CritAnimation
    adat.crit = true
    adat.align = 2
    adat.posY = (adat.toppoint + adat.posY)/2
    adat.randomposy = self:GetNextCritLoc(adat)
    adat.posY = adat.posY + (adat.randomposy*(WSCT_CRIT_Y_OFFSET+adat.textsize))
    --if flash crits are on
    if (db["FLASHCRIT"]) then
      adat.critsize = adat.textsize * WSCT_CRIT_FLASH_SIZE_PERCENT
    end
  end
end

----------------------
--Do Crit Animation
function WSCT:CritAnimation(adat,speed)
  local elapsedTime = adat.lastupdate
  local fadeInTime = WSCT_CRIT_FADEINTIME
  if ( elapsedTime < fadeInTime ) then
    local alpha = (elapsedTime / fadeInTime)
    alpha = alpha * adat.alpha
    --update icon
    if adat.icon then WindowSetAlpha(adat.name, alpha) end
    --if flash crits are on
    if (adat.critsize) then
      local critsize = floor(adat.critsize - ((adat.critsize - adat.textsize)*(elapsedTime/WSCT_CRIT_FADEINTIME)))
      WindowSetScale(adat.textname, adat.uiscale * (critsize/WSCT_TEXTSIZE_BASE))
      if adat.icon then 
        WindowSetScale(adat.iconname, .8 * adat.uiscale * (critsize/WSCT_TEXTSIZE_BASE))
      end
    end
    WindowSetFontAlpha(adat.textname, alpha)
    return
  end
  --if flash crits are on, reset size to make sure its clean for display
  if (adat.critsize) then
    WindowSetScale(adat.textname, adat.uiscale * WSCT_CRIT_SIZE_PERCENT * (adat.textsize/WSCT_TEXTSIZE_BASE))
    if adat.icon then 
      WindowSetScale(adat.iconname, .8 * adat.uiscale * WSCT_CRIT_SIZE_PERCENT * (adat.textsize/WSCT_TEXTSIZE_BASE))
    end
    adat.critsize = nil
  end
  local holdTime = (WSCT_CRIT_HOLDTIME * (speed/WSCT_MAX_SPEED))
  if ( elapsedTime < (fadeInTime + holdTime) ) then
    WindowSetFontAlpha(adat.textname, adat.alpha)
    --update icon
    if adat.icon then WindowSetAlpha(adat.name, adat.alpha) end
    return
  end
  local fadeOutTime = WSCT_CRIT_FADEOUTTIME
  if ( elapsedTime < (fadeInTime + holdTime + fadeOutTime) ) then
    local alpha = 1 - ((elapsedTime - holdTime - fadeInTime) / fadeOutTime)
    alpha = alpha * adat.alpha
    WindowSetFontAlpha(adat.textname, alpha)
    --update icon
    if adat.icon then WindowSetAlpha(adat.name, alpha) end
    return
  end
  --reset crit
  self:AniReset(adat)
end

----------------------
--Initialize Vertical Animation
function WSCT:VerticalInit(adat)
  --get the last known point of active items
  local lastpos = self:MinPoint(adat, 0, adat.anitype, adat.sidedir, adat.objectID)
  if (not adat.direction) then
    --move the position down
    if ((lastpos - adat.posY) <= adat.textsize) then
      adat.posY = adat.posY - (adat.textsize - (lastpos - adat.posY))
    end
    --if its gone too far down, stop and move all events up
    if (adat.posY < (adat.bottompoint - WSCT_MAX_DISTANCE)) then
      adat.posY = (adat.bottompoint - WSCT_MAX_DISTANCE)
      self:MoveFrameUp(adat.frame, adat.textsize, adat.sidedir )
    end
    adat.addY = db["MOVEMENT"]
  else
    adat.posY = adat.toppoint
    --move the position up
    if ((adat.posY - lastpos) <= adat.textsize) then
      adat.posY = adat.posY + (adat.textsize - (adat.posY - lastpos))
    end
    --if its gone too far up, stop and move all events down
    if (adat.posY > (adat.toppoint + WSCT_MAX_DISTANCE)) then
      adat.posY = (adat.toppoint + WSCT_MAX_DISTANCE)
      self:MoveFrameDown(adat.frame, adat.textsize, adat.sidedir )
    end
    adat.addY = -1*db["MOVEMENT"]
  end
end

----------------------
--Do Vertical Animation
function WSCT:VerticalAnimation(adat)
  local step = math_abs(adat.addY)
  local alphastep = 0.01 * step
  local max = WSCT_MAX_DISTANCE*.5
  adat.delay = adat.delay + 1
  if (adat.delay > (max/step)) then
    adat.alpha = adat.alpha - alphastep
  end
  adat.posY = adat.posY + adat.addY
end

----------------------
--Initialize Rainbow Animation
function WSCT:RainbowInit(adat)
  adat.addY = random(3,6)
  adat.posX = adat.posX - (20 * adat.sidedir)
end

----------------------
--Do Rainbow Animation
function WSCT:RainbowAnimation(adat)
  if (adat.addY > 0) then
      adat.addY = adat.addY - 0.22
  else
      adat.addY = adat.addY - (0.18 * (db["MOVEMENT"]/2))
  end
  if adat.addY < -7 then adat.addY = -7 end
  adat.posY = adat.posY + adat.addY
  adat.posX = adat.posX - 2.2 * adat.sidedir
  if ( adat.posY < (adat.bottompoint - WSCT_MAX_DISTANCE) ) then
    adat.alpha = adat.alpha - 0.05
  end
end

----------------------
--Initialize Horizontal Animation
function WSCT:HorizontalInit(adat)
  adat.posX = adat.posX - (55 * adat.sidedir)
  adat.posY = adat.bottompoint + (random(0,200) - 100)
  adat.addX = db["MOVEMENT"]
end

----------------------
--Do Horizontal Animation
function WSCT:HorizontalAnimation(adat)
  local step = math_abs(adat.addX)
  local alphastep = 0.01 * step
  local max = WSCT_SIDE_POINT*.5
  adat.delay = adat.delay + 1
  if (adat.delay > (max/step)) then
    adat.alpha = adat.alpha - alphastep
  end
  adat.posX = adat.posX - (adat.addX * adat.sidedir)
end

----------------------
--Initialize Angled Down Animation
function WSCT:AngledDownInit(adat)
  adat.posX = adat.posX - (20 * adat.sidedir)
  adat.addY = random(8,13)
  adat.addX = random(8,13)
end

----------------------
--Do Angled Down Animation
function WSCT:AngledDownAnimation(adat)
  if (adat.delay <= 13) then
      adat.delay = adat.delay + 1
      adat.posY = adat.posY - adat.addY
      adat.posX = adat.posX - adat.addX * adat.sidedir
  elseif (adat.delay <= 35) then
      adat.delay = adat.delay + 1
      adat.posY = adat.posY + (random(0,70) - 35) * 0.02
      adat.posX = adat.posX + (random(0,70) - 35) * 0.02
  elseif (adat.delay <= 50) then
      adat.delay = adat.delay + 1
  else
      adat.posY = adat.posY + db["MOVEMENT"]
      adat.posX = adat.posX - db["MOVEMENT"] * adat.sidedir
      adat.alpha = adat.alpha - 0.02
  end
end

----------------------
--Initialize Angled Up Animation
function WSCT:AngledUpInit(adat)
  adat.posX = adat.posX - (20 * adat.sidedir)
  adat.addY = random(10,15)
  adat.addX = random(10,15)
end

----------------------
--Do Angled Up Animation
function WSCT:AngledUpAnimation(adat)
  if (adat.delay <= 13) then
      adat.delay = adat.delay + 1
      adat.posY = adat.posY + adat.addY
      adat.posX = adat.posX - adat.addX * adat.sidedir
  elseif (adat.delay <= 35) then
      adat.delay = adat.delay + 1
      adat.posY = adat.posY + (random(0,70) - 35) * 0.02
      adat.posX = adat.posX + (random(0,70) - 35) * 0.02
  elseif (adat.delay <= 50) then
      adat.delay = adat.delay + 1
  else
      adat.posY = adat.posY + db["MOVEMENT"]
      adat.alpha = adat.alpha - 0.02
  end
end

----------------------
--Initialize Sprinkler Animation
function WSCT:SprinklerInit(adat)
  adat.addX = WSCT_SPRINKLER
  adat.addY = math_sqrt((WSCT_SPRINKLER_RADIUS ^ 2) - math_abs((WSCT_SPRINKLER ^ 2)))
  if ( adat.direction) then
    adat.addY = adat.addY * -1
  end
  WSCT_SPRINKLER = WSCT_SPRINKLER + WSCT_SPRINKLER_STEP
  if (WSCT_SPRINKLER < (WSCT_SPRINKLER_START * -1)) then
    WSCT_SPRINKLER = WSCT_SPRINKLER_START
  end
end

----------------------
--Do Sprinkler Animation
function WSCT:SprinklerAnimation(adat)
  if (adat.delay <= (db["MOVEMENT"] + 10)) then
      adat.delay = adat.delay + 1
      adat.posY = adat.posY + adat.addY
      adat.posX = adat.posX + adat.addX
  elseif (adat.delay <= 35) then
      adat.delay = adat.delay + 1
      adat.posY = adat.posY + (random(0,70) - 35) * 0.02
      adat.posX = adat.posX + (random(0,70) - 35) * 0.02
  elseif (adat.delay <= 55) then
      adat.delay = adat.delay + 1
  else
      adat.posY = adat.posY + (adat.addY * .1)
      adat.posX = adat.posX + (adat.addX * .1)
      adat.alpha = adat.alpha - 0.02
  end
end

----------------------
--Initialize Curved Animation
function WSCT:HUDInit(adat)
  local lastpos = self:MinPoint(adat, WSCT_HUD_DIST, adat.anitype, adat.sidedir, adat.objectID)
  --move toppoint to hud length
  adat.toppoint = adat.toppoint + WSCT_HUD_DIST
  if (not adat.direction) then
    --if overlap, move the whole frame events up
    if ((lastpos - adat.posY) <= adat.textsize) then
      self:MoveFrameUp(adat.frame, adat.textsize, adat.sidedir)
    end
    adat.addY = db["MOVEMENT"]
  else
    adat.posY = adat.toppoint
    --if overlap, move the whole frame events down
    if ((adat.posY - lastpos) <= adat.textsize) then
      self:MoveFrameDown(adat.frame, adat.textsize, adat.sidedir)
    end
    adat.addY = -1*db["MOVEMENT"]
  end
  if (adat.anitype == 7) then
    adat.posX = CalculateCircleCordX(adat)
  else
    adat.posX = CalculateAngleCordX(adat)
  end
end

----------------------
--Do HUD Curved Animation
function WSCT:HUDCurvedAnimation(adat)
  local step = math_abs(adat.addY)
  local alphastep = 0.01 * step
  local max = (adat.toppoint - adat.bottompoint)/2
  adat.delay = adat.delay + 1
  if (adat.delay > (max/step)) then
    adat.alpha = adat.alpha - alphastep
  end
  adat.posY = adat.posY + adat.addY
  adat.posX = CalculateCircleCordX(adat)
end

----------------------
--Do HUD Angled Animation
function WSCT:HUDAngledAnimation(adat)
  local step = math_abs(adat.addY)
  local alphastep = 0.01 * step
  local max = (adat.toppoint - adat.bottompoint)/2
  adat.delay = adat.delay + 1
  if (adat.delay > (max/step)) then
    adat.alpha = adat.alpha - alphastep
  end
  adat.posY = adat.posY + adat.addY
  adat.posX = CalculateAngleCordX(adat)
end

----------------------
--Initialize Icon
function WSCT:IconInit(adat, icon)
  --adjust/fix alignment HUD alignments
  if (adat.iconside == 3) then
    adat.iconside = -adat.sidedir
  elseif (adat.iconside == 4) then
    adat.iconside = adat.sidedir
  end
  if adat.iconside == 1 then
    WindowClearAnchors(adat.iconname)
    WindowAddAnchor(adat.iconname, "RIGHT", adat.textname, "LEFT", 5, 0)
  else
    WindowClearAnchors(adat.iconname)
    WindowAddAnchor(adat.iconname, "LEFT", adat.textname, "RIGHT", -5, 0)
  end
  WindowSetDimensions(adat.iconname, adat.textsize, adat.textsize)
  DynamicImageSetTextureDimensions(adat.iconname, 64, 64)
  DynamicImageSetTexture(adat.iconname, icon, 0, 0)
  WindowSetAlpha(adat.name, adat.alpha)
end

----------------------
--set Y pos by finding what crits spots are available
function WSCT:GetNextCritLoc(adat)
  local randomposy, critspot = 0,-1
  local array = arrAniCritData[adat.frame]
  for i = 0, WSCT_CRIT_MAX_COUNT do
    if not array[i] then
      array[i] = true
      critspot = i
      break
    end
  end
  --if none availble, get overflow
  if (critspot == -1) then
    critspot = array.Overflow or 0
    array.Overflow = math_fmod(critspot + 1,WSCT_CRIT_MAX_COUNT)
  end
  --set pos
  randomposy = math_ceil(critspot/2)
  if (math_fmod(critspot,2) == 0) then
    randomposy = randomposy * -1
  end
  return randomposy
end

----------------------
--move all animations up
function WSCT:MoveFrameUp(frame, textsize, sidedir)
  for key, value in pairs(arrAniData[frame]) do
    if (DoesWindowExist(value.name) and value.sidedir == sidedir) then
      value.delay = value.delay + math_ceil(value.textsize/math_abs(value.addY))
      value.posY = value.posY + textsize
    end
  end
end

----------------------
--move all animations up
function WSCT:MoveFrameDown(frame, textsize, sidedir)
  for key, value in pairs(arrAniData[frame]) do
    if (DoesWindowExist(value.name) and value.sidedir == sidedir) then
      value.delay = value.delay + math_ceil(value.textsize/math_abs(value.addY))
      value.posY = value.posY - textsize
    end
  end
end

----------------------
--get the min current min point
function WSCT:MinPoint(adat, offset, anitype, sidedir, objectID)
  local posY, key, value
  if (not adat.direction) then
    posY = adat.offsetY + WSCT_MAX_DISTANCE - offset
    for key, value in pairs(arrAniData[adat.frame]) do
      if ((DoesWindowExist(value.name)) and (value.posY < posY) and (value.anitype == anitype) and (not value.crit) and (value.sidedir == sidedir) and (value.objectID == objectID)) then
        posY = value.posY
      end
    end
  else
    posY = adat.offsetY + offset
    for key, value in pairs(arrAniData[adat.frame]) do
      if ((DoesWindowExist(value.name)) and (value.posY > posY) and (value.anitype == anitype) and (not value.crit) and (value.sidedir == sidedir) and (value.objectID == objectID)) then
        posY = value.posY
      end
    end
  end
  return posY
end

-------------------------
--gets the next available animation object
--can be used by WSCT addons since public
function WSCT:GetNextAniObj(frame)
  local adat, i
  local anyAvail = false
  --get first now shown
  for i=1, WSCT_TEXTCOUNT do
    adat = arrFrameTexts[i]
    if ( not DoesWindowExist(adat.name) ) then
      anyAvail = true
      break
    end
  end
  --if none availble, get oldest
  if (not anyAvail) then
    for i = 1, #arrAniData do
      adat = arrAniData[i][1]
      if (adat) then break end
    end
    self:AniReset(adat)
  end
  --create window (this could be bad for memory, but without it the windows behave strangely at times)
  CreateWindowFromTemplate(adat.name, "WSCTAnimationFrame", "WSCTContainer")
  WindowSetShowing(adat.name, false)

  --set defaults based on frame
  adat.frame = frame
  adat.posY = db[self.FRAMES_DATA_TABLE][frame]["YOFFSET"]
  adat.posX = db[self.FRAMES_DATA_TABLE][frame]["XOFFSET"]
  adat.offsetY = db[self.FRAMES_DATA_TABLE][frame]["YOFFSET"]
  adat.offsetX = db[self.FRAMES_DATA_TABLE][frame]["XOFFSET"]
  adat.gap = db[self.FRAMES_DATA_TABLE][frame]["GAPDIST"]
  adat.align = db[self.FRAMES_DATA_TABLE][frame]["ALIGN"]
  adat.bottompoint = adat.posY
  adat.toppoint = adat.posY + WSCT_MAX_DISTANCE
  adat.randomposy = nil
  adat.font = db[self.FRAMES_DATA_TABLE][frame]["FONT"]
  adat.fontshadow = db[self.FRAMES_DATA_TABLE][frame]["FONTSHADOW"]
  adat.textsize = db[self.FRAMES_DATA_TABLE][frame]["TEXTSIZE"]
  adat.alpha = db[self.FRAMES_DATA_TABLE][frame]["ALPHA"]/100
  adat.anitype = db[self.FRAMES_DATA_TABLE][frame]["ANITYPE"]
  adat.anisidetype = db[self.FRAMES_DATA_TABLE][frame]["ANISIDETYPE"]
  adat.direction = db[self.FRAMES_DATA_TABLE][frame]["DIRECTION"]
  adat.sidedir = db[self.FRAMES_DATA_TABLE][frame]["ANISIDETYPE"]
  adat.icon = db[self.FRAMES_DATA_TABLE][frame]["ICON"]
  adat.iconside = db[self.FRAMES_DATA_TABLE][frame]["ICONSIDE"]
  adat.atobject = db[self.FRAMES_DATA_TABLE][frame]["ATOBJECT"]
  adat.anim = nil
  adat.init = nil
  adat.uiscale = InterfaceCore.GetScale()
  return adat
end

----------------------
--Rest the text animation
function WSCT:AniReset(adat)
  local i, key, value
  --remove it from display table
  for i = 1, #arrAniData do
    for key, value in pairs(arrAniData[i]) do
      if ( value == adat ) then
        tremove(arrAniData[i], key)
        break
      end
    end
  end
  --reset random crit spot
  if adat.frame and adat.randomposy ~= nil then
    adat.randomposy = adat.randomposy * 2
    if adat.randomposy > 0 then
      adat.randomposy = adat.randomposy - 1
    end
    arrAniCritData[adat.frame][math_abs(adat.randomposy)] = false
  end
  --reset all setings
  adat.crit = false
  adat.critsize = nil
  adat.posY = 0
  adat.posX = 0
  adat.addY = 0
  adat.addX = 0
  adat.alpha = 0
  adat.lastupdate = 0
  adat.delay = 0
  adat.align = 2
  --if adat.objectID then
  --  DetachWindowFromWorldObject(adat.name, adat.objectID)
    adat.objectID = nil
    adat.atobject = nil
    adat.icon = nil
  --end
  --This could be bad for memory (create/destroy), but without it the windows behave
  --very strangely at times when they are attached to a world object
  --Built in code does it, so maybe it is tweaked. Will address once performance can be monitored
  if (DoesWindowExist(adat.name)) then
    DestroyWindow(adat.name)
  end
  --WindowSetFontAlpha(adat.textname, adat.alpha)
  --WindowSetShowing(adat.name, false)
  --WindowSetScale(adat.textname, InterfaceCore.GetScale())
  --WindowClearAnchors(adat.name)
  --WindowClearAnchors(adat.textname)
  --if adat.icon then
  --  WindowClearAnchors(adat.iconname)
  --  DynamicImageSetTexture(adat.iconname, nil, 0, 0)
  --end
end

----------------------
--Rest all the text animations
function WSCT:AniResetAll()
  for i=1, WSCT_TEXTCOUNT do
    self:AniReset(arrFrameTexts[i])
  end
end

----------------------
--Rest all the text animations
function WSCT:DestroyWindows()
  for i=1, WSCT_TEXTCOUNT do
    if (DoesWindowExist(arrFrameTexts[i].name)) then
      DestroyWindow(arrFrameTexts[i].name)
    end
  end
end

------------------------
--Initial animation settings
function WSCT:AniInit()
  --local the profile table
  db = self.db.profile
  --setup all animations
  animations = {
    [1] = {
      init = self.VerticalInit,
      anim = self.VerticalAnimation,
    },
    [2] = {
      init = self.RainbowInit,
      anim = self.RainbowAnimation,
    },
    [3] = {
      init = self.HorizontalInit,
      anim = self.HorizontalAnimation,
    },
    [4] = {
      init = self.AngledDownInit,
      anim = self.AngledDownAnimation,
    },
    [5] = {
      init = self.AngledUpInit,
      anim = self.AngledUpAnimation,
    },
    [6] = {
      init = self.SprinklerInit,
      anim = self.SprinklerAnimation,
    },
    [7] = {
      init = self.HUDInit,
      anim = self.HUDCurvedAnimation,
    },
    [8] = {
      init = self.HUDInit,
      anim = self.HUDAngledAnimation,
    },
  }
  --setup all animation objects
  self:AniResetAll()
end
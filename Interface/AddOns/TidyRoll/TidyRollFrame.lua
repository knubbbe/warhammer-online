if( TidyRoll == nil ) then
	TidyRoll = {}
end

if( TidyRollFrame == nil ) then
	TidyRollFrame = Frame:Subclass ("TidyRollFrame")
end


-----------------------------------
-- Constants
-----------------------------------

local BASE_ICON	= 1
local CAREER_ICON = 2
local TIMER	= 3
local TIMER_TEXT = 4
local FLASH_ANIM = 5
local GLOW_ANIM = 6

local USE_ENABLED_ICON  = 42
local USE_DISABLED_ICON = 84
local USE_EMPTY_ICON    = 168

local c_ROLL_CHOICE_GREED = GameData.LootRoll.GREED
local c_ROLL_CHOICE_NEED = GameData.LootRoll.NEED
local c_ROLL_CHOICE_PASS = GameData.LootRoll.PASS
local c_ROLL_CHOICE_INVALID  = GameData.LootRoll.INVALID
local c_MAX_ROLL_CHOICE_TIME = GameData.LootRoll.TIME_UNTIL_AUTO_ROLL

local c_MOUSE_NONE = 1
local c_MOUSE_LBU = 2
local c_MOUSE_RBU = 3
local c_MOUSE_MBU = 4

local c_MODIFICATOR_NONE = 0
local c_MODIFICATOR_SHIFT = 4
local c_MODIFICATOR_CTRL = 8
local c_MODIFICATOR_ALT = 32

local c_GREY = { r = 55,  g = 55,  b = 55 }
--local c_RED = DefaultColor.RED
local c_ZERO_TINT = DefaultColor.ZERO_TINT


-----------------------------------
-- Local variables
-----------------------------------

local TidyRoll = TidyRoll
local TidyRollFrame = TidyRollFrame
local pairs = pairs
local ipairs = ipairs

local GetSetting


local events

-----------------------------------
-- End local variables
-----------------------------------


function TidyRollFrame:Create (windowName)
	local rollFrame = self:CreateFromTemplate (windowName)
	
	rollFrame.isValidTidyRollFrame = false
	
	rollFrame.m_LootIndex = 0
	rollFrame.m_IconNum = 0
	rollFrame.m_AllowNeed = true

	buttonName = windowName .. "ItemButton"
	overlayName = windowName .. "Overlay"
	
	rollFrame.m_Windows = 
	{
		[BASE_ICON]	= DynamicImage:CreateFrameForExistingWindow (buttonName .. "Icon"),
		[CAREER_ICON] = DynamicImage:CreateFrameForExistingWindow (windowName .. "CareerIcon"),
		[TIMER]	= Frame:CreateFrameForExistingWindow(windowName .. "Timer"),
		[FLASH_ANIM] = AnimatedImage:CreateFrameForExistingWindow(overlayName .. "Flash"),
		[GLOW_ANIM] = AnimatedImage:CreateFrameForExistingWindow(overlayName .. "Glow"),
	}
	
	rollFrame.m_Windows[CAREER_ICON]:Show (false)
	
	rollFrame.m_Windows[FLASH_ANIM]:Show (false)
	rollFrame.m_Windows[GLOW_ANIM]:Show (false)
	
	FrameManager:ResolveWindowToFrame (buttonName, rollFrame)
	
	rollFrame:InitializeTimerBar()
	
	return (rollFrame) 
end


function TidyRollFrame:Destroy()
	FrameManager:Remove(self:GetName ())
	DestroyWindow (self:GetName ())
end


function TidyRollFrame:InitializeTimerBar()
	local timerBarName = self.m_Windows[TIMER]:GetName() .. "Bar"
	self.m_Windows[TIMER].m_BarText = L""
	
	StatusBarSetMaximumValue( timerBarName, c_MAX_ROLL_CHOICE_TIME )
	StatusBarSetForegroundTint( timerBarName, DefaultColor.GREEN.r, DefaultColor.GREEN.g, DefaultColor.GREEN.b )
	StatusBarSetBackgroundTint( timerBarName, DefaultColor.BLACK.r, DefaultColor.BLACK.g, DefaultColor.BLACK.b )
end


function TidyRollFrame:SetTimer( timer )
	local timerFrame = self.m_Windows[TIMER]
	
	StatusBarSetCurrentValue( timerFrame:GetName() .. "Bar", timer )
	
	local text
	if( GetSetting("timer-show-text") ) then
		text = towstring(math.floor(timer)) 
	else
		text = L""
	end
	
	if( timerFrame.m_BarText ~= text ) then
		LabelSetText( timerFrame:GetName() .. "BarText", text)
		timerFrame.m_BarText = text
	end
end


function TidyRollFrame:SetIcon (iconNum, iconType)
    local texture           = L""
    local disabledTexture   = L""
    local x                 = 0
    local y                 = 0
    
    self.m_IconNum = iconNum
    
    local iconWindow = self.m_Windows[BASE_ICON]
    local tintColor = c_ZERO_TINT
    
    if( iconNum > 0 ) 
    then
        texture, x, y, disabledTexture = GetIconData (iconNum)
                
        if (iconType == USE_DISABLED_ICON) 
        then
			-- tintColor = c_RED
			
            if (disabledTexture ~= "")
            then
                texture = disabledTexture
            else
                tintColor = c_GREY
                iconType = USE_ENABLED_ICON
            end
        end
        
        iconWindow:SetTexture (texture, x, y)
        --iconWindow:SetTint (tintColor)
        WindowSetTintColor (iconWindow:GetName (), tintColor.r, tintColor.g, tintColor.b)
    else
        -- NOTE: To avoid two function calls, potentially allow DynamicImageSetTextureSlice to take a texture name as well...
        --iconWindow:SetTexture ("EA_HUD_01", 0, 0)
        --iconWindow:SetTextureSlice ("Blank-Action-Bar-Icon-Slot", Frame.FORCE_OVERRIDE)
        
        iconWindow:SetTexture ("", 0, 0)
        
        iconType = USE_EMPTY_ICON
    end
    
    -- To allow callers to determine which icon type was actually displayed...
    return iconType
end


function TidyRollFrame:SetCareerIcon( careerIconNum )
	self.m_CareerIconNum = careerIconNum
	
	local careerIconWindow = self.m_Windows[CAREER_ICON]
	
	if( careerIconNum and careerIconNum > 0 ) then
		local texture, x, y = GetIconData( careerIconNum )
				
		careerIconWindow:SetTexture (texture, x, y)
		careerIconWindow:Show(true)
	else
		careerIconWindow:Show(false)
	end
end


function TidyRollFrame:SetLootData(lootIndex, iconNum, allowNeed, timer, borderColor, careerIconNum, flash, glow)
	local iconType = USE_ENABLED_ICON
	
	local buttonName = self:GetName() .. "ItemButton"
	
	local flashFrame = self.m_Windows[FLASH_ANIM]
	local glowFrame = self.m_Windows[GLOW_ANIM]
	
	self.isValidTidyRollFrame = lootIndex and lootIndex > 0
	
	self.m_LootIndex = lootIndex
	self.m_AllowNeed = allowNeed
	
	-- Set timer
	self:SetTimer( timer )
	
	
	-- Set border color
	WindowSetTintColor(buttonName, borderColor.r, borderColor.g, borderColor.b)
	
	
	-- Set base icon
	if( allowNeed == false ) then
        iconType = USE_DISABLED_ICON
    end
	iconType = self:SetIcon (iconNum, iconType)
	
	
	-- Set career icon
	self:SetCareerIcon(careerIconNum)
	
	
	-- Set animation on new item
	if( flash ) then		
		if( not WindowGetShowing (flashFrame:GetName ())) then
			flashFrame:StartAnimation (0, false, true, 0)
		end
	end
	
	if( glow == nil ) then
		-- do nothing
	elseif( glow == true ) then
		if( not glowFrame:IsShowing() ) then
			glowFrame:StartAnimation (0, true, false, 0)
		end
	else
		if( glowFrame:IsShowing() ) then
			glowFrame:StopAnimation (Frame.FORCE_HIDE)
		end
	end
end


--------------------------------------------------------------
-- UTILS
--------------------------------------------------------------

function TidyRollFrame.SetupLocals()
	GetSetting = TidyRoll.GetSetting
end


function TidyRollFrame.SetupLocalSettings()
	events = {
		[c_MOUSE_NONE] = {},
		[c_MOUSE_LBU] = {},
		[c_MOUSE_RBU] = {},
		[c_MOUSE_MBU] = {},
	}
	
	events[ GetSetting("managment-bind-need") ][ GetSetting("managment-bind-need-modificator") ] = c_ROLL_CHOICE_NEED
	events[ GetSetting("managment-bind-greed") ][ GetSetting("managment-bind-greed-modificator") ] = c_ROLL_CHOICE_GREED
	events[ GetSetting("managment-bind-pass") ][ GetSetting("managment-bind-pass-modificator") ] = c_ROLL_CHOICE_PASS
end


-----------------------------------
-- Events
-----------------------------------

function TidyRollFrame:OnMouseClick (event, flags)
	local rollChoice = events[event][flags] or events[event][c_MODIFICATOR_NONE]
	
	if( rollChoice ) then
		TidyRoll.SelectRollOption( self.m_LootIndex, rollChoice )
	end
end


function TidyRollFrame:OnLButtonUp (flags, mouseX, mouseY)
	self:OnMouseClick(c_MOUSE_LBU, flags)
end


function TidyRollFrame:OnRButtonUp (flags, mouseX, mouseY)
	self:OnMouseClick(c_MOUSE_RBU, flags)
end


function TidyRollFrame.OnMButtonUp (flags, mouseX, mouseY)
	local frame = FrameManager:GetMouseOverWindow ()
	
    if (frame)
    then
		frame:OnMouseClick(c_MOUSE_MBU, flags)
    end
end


function TidyRollFrame:OnMouseWheel (x, y, delta, flags)
	TidyRoll.OnMouseWheel (x, y, delta, flags, self)
end


function TidyRollFrame:OnMouseOver (flags, mouseX, mouseY)
	TidyRoll.UpdateTooltip(self)
end


function TidyRollFrame:OnMouseOverEnd (flags, mouseX, mouseY)

end
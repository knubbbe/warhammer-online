--[[
	This application is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    The applications is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with the applications.  If not, see <http://www.gnu.org/licenses/>.
--]]

local pairs						= pairs
local ipairs					= ipairs
local tonumber					= tonumber
local tinsert					= table.insert
local tsort						= table.sort

local nextUpdate			= 0
local lastUpdate			= 0

local function IsValidEffect( effectData )
    return ( effectData ~= nil and effectData.effectIndex ~= nil and effectData.iconNum ~= nil and effectData.iconNum > 0 )
end

local function CopyTable( source )
	local newTable = {}
	for k, v in pairs (source) 
    do
        if( type (v) == "table" ) then
            newTable[k] = CopyTable (v)
        else
            newTable[k] = v
        end
    end
    return newTable
end

local effectSortOrder = 
{
    INCREASING  = 1,
    DECREASING 	= 2,
}

local effectSortKeys =
{
    ["permanentUntilDispelled"] = { fallback = "duration", sortOrder = effectSortOrder.DECREASING },
    ["duration"] 				= { fallback = "name", sortOrder = effectSortOrder.DECREASING },
    ["name"]                    = { sortOrder = effectSortOrder.INCREASING }
}

local validOrderingValueTypes =
{
    ["number"]  = true, 
    ["string"]  = true, 
    ["wstring"] = true, 
    ["boolean"] = true
}

local selfCastExclusions =
{
	[414] 		= 1,		-- Immune to Stun, Knockdown, Disarm, and Silence
	[408] 		= 1,		-- Can not be knocked back
	[411] 		= 1,		-- Can not be rooted
}

local function OrderingFunction( table1, table2, sortKey, sortKeys )
    local value1        = table1[sortKey]
    local value2        = table2[sortKey]
    local value1Type    = type (value1)
    
    if( value1Type ~= type (value2) or not validOrderingValueTypes[value1Type] ) then return false end
    
    if( value1Type == "boolean" )then
    	local function NumberFromBoolean (b) 
            if (b) then return 1 end 
            return 0 
        end
        value1 = NumberFromBoolean (value1)
        value2 = NumberFromBoolean (value2)
    end
    
    assert( type (sortKeys[sortKey]) == "table" )
    
    if( sortKeys[sortKey].isNumeric ) then
        value1 = tonumber (value1)
        value2 = tonumber (value2)
    end
    
    if( value1 == value2 ) then
        if( sortKeys[sortKey].fallback ) then return OrderingFunction( table1, table2, sortKeys[sortKey].fallback, sortKeys ) end
    else
    	if( sortKeys[sortKey].sortOrder == effectSortOrder.INCREASING ) then return value1 < value2 end
		return value1 > value2
    end
    return false
end

local function sortEffects( effect1, effect2 )
    return OrderingFunction( effect1, effect2, "permanentUntilDispelled", effectSortKeys )
end

PureEffectTracker = {}
PureEffectTracker.__index = PureEffectTracker

PureEffectTracker.trackerType = 
{
	ALL			= 0,
	BUFF		= 1,
	DEBUFF		= 2
}

function PureEffectTracker:Create( effectWindowBase, effectParentWindow, effectTargetType, effectTrackerType, effectRows, effectCols, 
	effectAnchor, effectRowOffset, effectColOffset, effectLocation, effectFrame, effectThrottleRate, effectAnchoringFunc, effectSortingFunc )

	local tracker = {
		m_effectFrames    		= {},
        m_effectData      		= {},
        m_effectMapping   		= {},
        
        m_bIsShown				= true,
        
        m_effectWindowBase		= effectWindowBase,
        m_effectParent			= effectParentWindow,
        m_effectTargetType		= effectTargetType,
        m_effectTrackerType		= effectTrackerType,
        m_effectRows			= effectRows,
        m_effectCols			= effectCols,
        m_effectCount			= effectRows * effectCols,
        m_effectAnchor			= effectAnchor,
        
        -- The following arguments could be passed in as nil and would get defaults
        m_effectRowOffset		= effectRowOffset			or 0,
        m_effectColOffset		= effectColOffset			or 0,
        m_effectLocation		= effectLocation			or "top",
        m_effectBase			= effectFrame 				or PureEffect,
		m_anchoringFunc			= effectAnchoringFunc 		or self.AnchorEffectFrames,
		m_sortingFunc			= effectSortingFunc 		or sortEffects,
		m_effectThrottleRate	= effectThrottleRate		or 0,
		
		-- The following are our default settings that get changed via initialize
		m_windowDx					= 32,
    	m_windowDy					= 32,
    	m_frameAlpha				= 1.0,
		m_fontAlpha					= 1.0,
		m_fadeStartTime				= 10,
		m_fadeMinAlpha				= .5,
		m_bShowEffectDurations		= true,
		m_bShowCooldownSpinner		= false,
		m_bShowMythicEffectBorder	= false,
		m_bHandleInput				= true,
	}
	
	-- Create our new effect frames
	for slot = 1, tracker.m_effectCount
    do
    	local frameName = tracker.m_effectWindowBase .. slot
    	local frame = tracker.m_effectBase:Create( frameName, tracker.m_effectParent, tracker.m_effectTargetType )
    	if( frame == nil ) then d( "Error creating effect frame:  " .. tostring( frameName ) ) return nil end
		frame:Show( false, Frame.FORCE_OVERRIDE )
		tracker.m_effectFrames[slot] = frame
    end
    
    tracker = setmetatable( tracker, self )
    tracker.__index = self
    
    tracker:AnchorEffectFrames( effectWindowBase, effectWindowBaseeffectLocation, effectAnchor, effectRows, effectCols, effectRowOffset, effectColOffset )
    
    return tracker
end

function PureEffectTracker:AnchorEffectFrames( effectWindowBase, effectLocation, effectAnchor, effectRows, effectCols, effectRowOffset, effectColOffset )
	local currentAnchor = effectAnchor
	
	local nextSlot
	local remainder
	
	for slot, frame in ipairs( self.m_effectFrames )
    do
    	nextSlot = slot + 1
        remainder = math.fmod( nextSlot, effectCols )
        
    	frame:SetAnchor( currentAnchor )
    
		if( remainder == 1 ) then
        	currentAnchor.RelativeTo        = effectWindowBase .. ( nextSlot - effectCols )
        	
        	if( self.m_effectLocation == "bottom" ) then
        		currentAnchor.Point             = "bottomleft"
                currentAnchor.RelativePoint     = "topleft"
               	currentAnchor.XOffset           = 0 --effectColOffset
                currentAnchor.YOffset           = effectRowOffset
        	else
        		currentAnchor.Point             = "topleft"
                currentAnchor.RelativePoint     = "bottomleft"
                currentAnchor.XOffset           = 0 --effectColOffset * -1
                currentAnchor.YOffset           = effectRowOffset * -1
        	end
        else
        	currentAnchor.RelativeTo        = effectWindowBase .. slot
        	
        	if( self.m_effectLocation == "left" ) then
        		currentAnchor.Point             = "bottomleft"
                currentAnchor.RelativePoint     = "bottomright"
                currentAnchor.XOffset           = effectColOffset * -1
                currentAnchor.YOffset           = effectRowOffset * -1
        	else
        		currentAnchor.Point             = "bottomright"
                currentAnchor.RelativePoint     = "bottomleft"
                currentAnchor.XOffset           = effectColOffset
                currentAnchor.YOffset           = effectRowOffset
        	end
        end	
	end
end

function PureEffectTracker:ClearEffects()
	self:UpdateEffects( {}, true )
end

function PureEffectTracker:Destroy()
	for slot, frame in ipairs( self.m_effectFrames )
    do
    	frame:Show( false, Frame.FORCE_OVERRIDE )
		frame:Destroy()
    end
    
    self.m_effectFrames = {}
end

function PureEffectTracker:Initialize( windowDx, windowDy, frameAlpha, fontAlpha, fadeStartTime, fadeMinAlpha, selfCastOnly, showEffectDurations, showCooldownSpinner, showMythicEffectBorder, handleInput )
	
	self.m_windowDx					= windowDx
    self.m_windowDy					= windowDy
    self.m_frameAlpha				= frameAlpha
	self.m_fontAlpha				= fontAlpha
	self.m_fadeStartTime			= fadeStartTime
	self.m_fadeMinAlpha				= fadeMinAlpha
	self.m_bShowSelfCastOnly 		= selfCastOnly
	self.m_bShowEffectDurations		= showEffectDurations
	self.m_bShowCooldownSpinner		= showCooldownSpinner
	self.m_bShowMythicEffectBorder	= showMythicEffectBorder
	self.m_bHandleInput				= handleInput

	-- Propogate appropriate settings to the frames
	for _, frame in ipairs( self.m_effectFrames )
    do
		frame:Initialize( self.m_windowDx, self.m_windowDy, self.m_frameAlpha, self.m_fontAlpha, self.m_fadeStartTime, 
			self.m_fadeMinAlpha, self.m_bShowEffectDurations, self.m_bShowCooldownSpinner, self.m_bShowMythicEffectBorder, self.m_bHandleInput )
	end
end

function PureEffectTracker:IsShowing()
	return self.m_bIsShown
end

function PureEffectTracker:Show( bShow )
	self.m_bIsShown = bShow
	
	if( bShow ) then
		self:OnEffectsChanged()
	else
		for _, frame in ipairs( self.m_effectFrames )
		do
		    frame:Show( false )
		end
	end
end

function PureEffectTracker:OnEffectsChanged()
	if( not self:IsShowing() ) then return end

    local sortedEffectData = {}

	for k,v in pairs( self.m_effectData )
	do
		tinsert( sortedEffectData, v )
	end

    tsort( sortedEffectData, self.m_sortingFunc )

	local count = #sortedEffectData
    for slot, frame in ipairs( self.m_effectFrames )
    do
        if( slot <= count ) then
            frame:SetEffect( sortedEffectData[slot] )
            frame:Show( true )
        else
            frame:SetEffect( nil )
            frame:Show( false )
        end
    end
end

function PureEffectTracker:RefreshEffects()
    self:UpdateEffects( GetBuffs( self.m_effectTargetType ), true )
end

function PureEffectTracker:Update( elapsedTime )
	if( not self.m_bShowEffectDurations and not self.m_bShowCooldownSpinner ) then return end

	lastUpdate = lastUpdate + elapsedTime

	if( lastUpdate > nextUpdate ) then
		for effectId, effect in pairs( self.m_effectData )
	    do
	        if( IsValidEffect( effect ) ) then
	            if( effect.duration >= elapsedTime ) then
	                effect.duration = effect.duration - lastUpdate
	            else
	                effect.duration = 0
	            end
	        end
	    end
	    
	    -- Only update the frames if the tracker is displayed
	    if( self:IsShowing() ) then
	    	for slot, frame in ipairs( self.m_effectFrames )
	    	do
		    	if( frame:IsShowing() ) then frame:UpdateDuration() end
			end
		end
	    
	    nextUpdate = self.m_effectThrottleRate
	    lastUpdate = 0
	end
end

function PureEffectTracker:UpdateEffects( effects, isFullList )
	if( effects == nil ) then return end
	
	if( isFullList ) then 
		for k,_ in pairs( self.m_effectData )
		do
			self.m_effectData[k] = nil
		end
	end

	for effectId, effect in pairs( effects )
    do
        if( IsValidEffect( effect ) ) then
        	if( not self.m_bShowSelfCastOnly or ( ( effect.castByPlayer and self.m_bShowSelfCastOnly ) or ( selfCastExclusions[effectId] ~= nil ) ) ) then
        		self.m_effectData[effectId] = CopyTable( effect )
        		self.m_effectData[effectId].m_maxDuration = self.m_effectData[effectId].duration
            end
        else
            self.m_effectData[effectId] = nil
        end
    end

    self:OnEffectsChanged()
end
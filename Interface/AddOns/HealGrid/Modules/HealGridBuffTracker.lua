--[[

effectIndex = (number)
name = (wstring)
effectText = (wstring)
stackCount = (number)
iconNum = (number)
castByPlayer = (bool)
duration = (number)
abilityId = (number)

typeColorRed = (number)
typeColorGreen = (number)
typeColorBlue = (number)

permanentUntilDispelled = (bool)
isCasterDispellable = (bool)

isGranted = (bool)
isPassive = (bool)
isOffensive = (bool)
isDefensive = (bool)

isBuff = (bool)
isDebuff = (bool)

isAilment = (bool) [opt]
isCripple = (bool) [opt]
isCurse = (bool) [opt]
isDamaging = (bool)
isHex = (bool) [opt]

isBlessing = (bool)
isHealing = (bool)
isStatsBuff = (bool)

########## some indexes only per buff/debuff ######################################

]]

-- function DataUtils.GetAbilityTypeTextureAndColor(abilityData) in 7EC60B64_0E629A8F0ECBDCB3.lua

HealGridBuffTracker = {};

HealGridBuffTracker.MAX_BUFFS = 10;

HealGridBuffTracker.buffTrackers = {};								-- {frameName,object}
HealGridBuffTracker.currentTooltipBuff = nil;						-- object : the buff currently in the tooltip
HealGridBuffTracker.currentTooltipBuffIdx = 0;						-- int : the index of the buff currently in the tooltip

function HealGridBuffTracker:New( o )

	local t = {};

	if ( o ) then
		t.unitObj = o.unitObj;
		t.relativeTo = o.relativeTo;
		t.relativePoint = o.relativePoint; 
		t.maxBuffs = HealGridBuffTracker.MAX_BUFFS;
		t.settingBuffFilter = (o.settingBuffFilter or 'hudPlayerBuffFilter');			-- ALL / SELFCAST / NONE
		t.settingDebuffFilter = (o.settingDebuffFilter or 'hudPlayerDebuffFilter');		-- ALL / DISPELLABLE / SELFCAST / NONE
	end

	setmetatable( t, self );
	self.__index = self;

	HealGridBuffTracker.buffTrackers[t.unitObj:GetFrameName()] = t;

	return( t );

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function HealGridBuffTracker:GetUnitObj()

	return( self.unitObj );

end

function HealGridBuffTracker:GetRelativeTo()

	return( self.relativeTo );

end

function HealGridBuffTracker:GetRelativePoint()

	return( self.relativePoint );

end

-- ========================================================================================
-- Initialization
-- ========================================================================================

function HealGridBuffTracker:Initialize()

	-- is this called at all ???

end

-- ========================================================================================
-- Shutdown
-- ========================================================================================

function HealGridBuffTracker:Shutdown()

	HealGridBuffTracker.buffTrackers[self.unitObj:GetFrameName()] = nil;

end

-- ========================================================================================
-- Applies the skin
-- ========================================================================================

function HealGridBuffTracker:PrepareFrames( buffType, maxBuffs, size, border, textPadding, font )

	local j, frameName;

	for i=1,maxBuffs do
		frameName = self.unitObj:GetFrameName()..'_'..buffType..i;

		if ( not DoesWindowExist(frameName) ) then
			CreateWindowFromTemplate( frameName, "HG_HealGridBuffTrackBuffTemplate", 'Root' ); --self:GetRelativeTo() );		to get mouseOver events!
		end

		WindowSetDimensions( frameName, size, size );

		WindowClearAnchors( frameName..'IconBase' );
		WindowAddAnchor( frameName..'IconBase', 'topleft', frameName, 'topleft', border, border );
		WindowAddAnchor( frameName..'IconBase', 'bottomright', frameName, 'bottomright', border*-1, border*-1 );

		WindowClearAnchors( frameName..'Label' );
		WindowAddAnchor( frameName..'Label', 'topleft', frameName, 'topleft', textPadding, textPadding );
		WindowAddAnchor( frameName..'Label', 'bottomright', frameName, 'bottomright', textPadding*-1, textPadding*-1 );
		LabelSetFont( frameName..'Label', font, 10 );

		if ( self:GetRelativePoint():upper() == 'LEFT' ) then
			WindowClearAnchors( frameName );
			if ( i == 1 and buffType == 'BUFF' ) then
				WindowAddAnchor( frameName, 'topleft', self:GetRelativeTo(), 'topright', -3, 0 );
			elseif ( i == 1 and buffType == 'DEBUFF' ) then
				WindowAddAnchor( frameName, 'bottom', self.unitObj:GetFrameName()..'_BUFF1', 'top', 0, 2 );
			else
				WindowAddAnchor( frameName, 'left', self.unitObj:GetFrameName()..'_'..buffType..(i-1), 'right', -2, 0 );
			end
		elseif ( self:GetRelativePoint():upper() == 'RIGHT' ) then
			WindowClearAnchors( frameName );
			if ( i == 1 and buffType == 'BUFF' ) then
				WindowAddAnchor( frameName, 'topright', self:GetRelativeTo(), 'topleft', 3, 0 );
			elseif ( i == 1 and buffType == 'DEBUFF' ) then
				WindowAddAnchor( frameName, 'bottom', self.unitObj:GetFrameName()..'_BUFF1', 'top', 0, 2 );
			else
				WindowAddAnchor( frameName, 'right', self.unitObj:GetFrameName()..'_'..buffType..(i-1), 'left', 2, 0 );
			end
		elseif ( self:GetRelativePoint():upper() == 'BOTTOM' ) then
			WindowClearAnchors( frameName );
			if ( i == 1 and buffType == 'BUFF' ) then
				WindowAddAnchor( frameName, 'bottomleft', self:GetRelativeTo(), 'topleft', 0, 3 );
			elseif ( i == 1 and buffType == 'DEBUFF' ) then
				WindowAddAnchor( frameName, 'bottom', self.unitObj:GetFrameName()..'_BUFF1', 'top', 0, 2 );
			else
				WindowAddAnchor( frameName, 'right', self.unitObj:GetFrameName()..'_'..buffType..(i-1), 'left', 2, 0 );
			end
		end

		WindowSetScale( frameName, WindowGetScale(self:GetRelativeTo()) );
		WindowSetShowing( frameName, false );
	end

	-- clean up possible remaining windows (max-buffs decreased)
	j = maxBuffs + 1;
	frameName = self.unitObj:GetFrameName()..'_'..buffType..j;
	while ( DoesWindowExist(frameName) ) do
		WindowSetShowing( frameName, false );
		DestroyWindow( frameName );
		j = j + 1;
		frameName = self.unitObj:GetFrameName()..'_'..buffType..j;
	end

end

function HealGridBuffTracker:ApplySkin( skinID )

	local skinSize, skinBorder, skinTextPadding, skinFont;

	skinID = (skinID or self:GetSkinID());
	skinSize = HealGridSkin.GetSkinValue( skinID, 'hud', 'buffs', 'size' );
	skinBorder = HealGridSkin.GetSkinValue( skinID, 'hud', 'buffs', 'border' );
	skinTextPadding = HealGridSkin.GetSkinValue( skinID, 'hud', 'buffs', 'textPadding' );
	skinFont = HealGridSkin.GetSkinValue( skinID, 'hud', 'buffs', 'font' );

	self.maxBuffs = math.min( HealGridBuffTracker.MAX_BUFFS, HealGrid.SettingGet('hudShowBuffsMax') );

	self:PrepareFrames( 'BUFF', self.maxBuffs, skinSize + HealGrid.SettingGet('hudBuffFrameSizeAdjust'), skinBorder, skinTextPadding, skinFont );
	self:PrepareFrames( 'DEBUFF', self.maxBuffs, skinSize + HealGrid.SettingGet('hudBuffFrameSizeAdjust'), skinBorder, skinTextPadding, skinFont );

end

-- ========================================================================================
-- Hide all
-- ========================================================================================
function HealGridBuffTracker:Hide()

	local buffFrameIdx = 1;
	local debuffFrameIdx = 1;

	while ( buffFrameIdx <= self.maxBuffs and WindowGetShowing(self.unitObj:GetFrameName()..'_BUFF'..buffFrameIdx) ) do
		WindowSetShowing( self.unitObj:GetFrameName()..'_BUFF'..buffFrameIdx, false );
		buffFrameIdx = buffFrameIdx + 1;
	end

	while ( debuffFrameIdx <= self.maxBuffs and WindowGetShowing(self.unitObj:GetFrameName()..'_DEBUFF'..debuffFrameIdx) ) do
		WindowSetShowing( self.unitObj:GetFrameName()..'_DEBUFF'..debuffFrameIdx, false );
		debuffFrameIdx = debuffFrameIdx + 1;
	end

end

-- ========================================================================================
-- Should draw the buff
-- filter: ALL / DISPELLABLE / SELFCAST / CASTABLE / NONE
-- ========================================================================================

function HealGridBuffTracker:ShouldDrawBuff( buffData, filter, buffType )

	if ( filter == 'ALL' ) then
		return( true );
	elseif ( filter == 'NONE' ) then
		return( false );
	elseif ( filter == 'DISPELLABLE' and buffType == 'DEBUFF' ) then
		if ( buffData.isAilment and HealGrid.SettingGet('dispellableDebuffFlags','AILMENT') ) then
			return( true );
		elseif ( buffData.isCripple and HealGrid.SettingGet('dispellableDebuffFlags','CRIPPLE') ) then
			return( true );
		elseif ( buffData.isCurse and HealGrid.SettingGet('dispellableDebuffFlags','CURSE') ) then
			return( true );
		elseif ( buffData.isDamaging and HealGrid.SettingGet('dispellableDebuffFlags','DAMAGING') ) then
			return( true );
		elseif ( buffData.isDebuff and HealGrid.SettingGet('dispellableDebuffFlags','DEBUFF') ) then
			return( true );
		elseif ( buffData.isHex and HealGrid.SettingGet('dispellableDebuffFlags','HEX') ) then
			return( true );
		end
		return( false );
	elseif ( filter == 'SELFCAST' ) then
		return( buffData.castByPlayer );
	end

	d( 'HealGridBuffTracker:ShouldDrawBuff(): Unknown filter: '..(filter or 'NIL') );
	return( true );

end

-- ========================================================================================
-- Draw
-- ========================================================================================

function HealGridBuffTracker:Update()

-- function DataUtils.GetAbilityTypeTextureAndColor(abilityData) in 7EC60B64_0E629A8F0ECBDCB3.lua
-- us this to write HealGrid.IsBuff() / HealGrid.IsDebuff() !!! HealGrid.BuffType() = 'BUFF/DEBUFF/NEUTRAL'

	local buffFrameIdx = 1;
	local debuffFrameIdx = 1;
	local buffType, idx, duration;
    local frameName, texture, x, y;
	local buffSlice, buffTexDimsX, buffTexDimsY, buffRed, buffGreen, buffBlue, verticalSlop;
	local isValidBuff = false;
	local drawBuff = false;
	local buffFilter = HealGrid.SettingGet( self.settingBuffFilter );
	local debuffFilter = HealGrid.SettingGet( self.settingDebuffFilter );

	if ( self.unitObj:UnitExists() and buffFilter ~= 'NONE' and debuffFilter ~= 'NONE' ) then
		for buffIdx,buffData in pairs(self.unitObj.cachedBuffData) do
			isValidBuff = (buffData ~= nil and buffData.iconNum ~= nil and buffData.iconNum > 0);
			if ( isValidBuff ) then
				buffType = HealGridUtility.GetBuffDebuffNeutral( buffData );
				if ( buffType == 'DEBUFF' and self:ShouldDrawBuff(buffData,debuffFilter,buffType) ) then
					idx = debuffFrameIdx;
					debuffFrameIdx = debuffFrameIdx + 1;
					drawBuff = (idx <= self.maxBuffs);
				elseif ( (buffType == 'BUFF' or buffType == 'NEUTRAL') and self:ShouldDrawBuff(buffData,buffFilter,buffType) ) then
					buffType = 'BUFF';
					idx = buffFrameIdx;
					buffFrameIdx = buffFrameIdx + 1;
					drawBuff = (idx <= self.maxBuffs);
				else
					drawBuff = false;
				end

				if ( drawBuff ) then	
					frameName = self.unitObj:GetFrameName()..'_'..buffType..idx;
					texture,x,y = GetIconData( buffData.iconNum );
					DynamicImageSetTexture( frameName.."IconBase", texture, x, y );
	
					buffSlice, buffTexDimsX, buffTexDimsY, buffRed, buffGreen, buffBlue = DataUtils.GetAbilityTypeTextureAndColor( buffData );
					HealGridUtility.WindowSetTintColor( frameName..'Frame', buffRed, buffGreen, buffBlue );

					if ( buffData.stackCount > 1 ) then
						LabelSetText( frameName..'Label', L"x"..buffData.stackCount );
					else
						duration = buffData.duration + 1;
						if ( buffData.permanentUntilDispelled ) then
							LabelSetText( frameName..'Label', L"" );
						elseif ( duration > 60 ) then
							HealGridUtility.LabelSetTextColor( frameName..'Label', 'WHITE' );
							duration = math.ceil( duration / 60 );
							LabelSetText( frameName..'Label', L""..duration );
						else
							HealGridUtility.LabelSetTextColor( frameName..'Label', 'YELLOW' );
							LabelSetText( frameName..'Label', L""..duration );
						end
					end

					WindowSetId( frameName, buffIdx );
		
					WindowSetShowing( frameName, true );
				end
			end
		end
	end

	while ( buffFrameIdx <= self.maxBuffs and WindowGetShowing(self.unitObj:GetFrameName()..'_BUFF'..buffFrameIdx) ) do
		WindowSetShowing( self.unitObj:GetFrameName()..'_BUFF'..buffFrameIdx, false );
		buffFrameIdx = buffFrameIdx + 1;
	end

	while ( debuffFrameIdx <= self.maxBuffs and WindowGetShowing(self.unitObj:GetFrameName()..'_DEBUFF'..debuffFrameIdx) ) do
		WindowSetShowing( self.unitObj:GetFrameName()..'_DEBUFF'..debuffFrameIdx, false );
		debuffFrameIdx = debuffFrameIdx + 1;
	end

end

-- ========================================================================================
-- Tooltip handling
-- ========================================================================================

function HealGridBuffTracker:ShowTooltip( buffType, buffTypeIdx, buffIdx )

	HealGridBuffTracker.currentTooltipBuff = self;
	HealGridBuffTracker.currentTooltipBuffIdx = buffIdx;

	Tooltips.CreateTextOnlyTooltip( SystemData.ActiveWindow.name, nil );
	Tooltips.SetTooltipColorDef( 1, 1, Tooltips.COLOR_HEADING );
	Tooltips.SetTooltipColorDef( 1, 2, Tooltips.COLOR_HEADING );
	Tooltips.SetTooltipActionText( GetString(StringTables.Default.TEXT_R_CLICK_TO_REMOVE_EFFECT) );

	self:PopulateTooltip( buffIdx, 'ALL' );

	Tooltips.AnchorTooltip( Tooltips.ANCHOR_MOUSE_OVER_TARGET_WINDOW );
	Tooltips.SetUpdateCallback( HealGridBuffTracker.MouseOverUpdate );

end

function HealGridBuffTracker:PopulateTooltip( buffIdx, updateType )

	local buffData = self.unitObj.cachedBuffData[buffIdx];
	local durationText = TimeUtils.FormatTimeCondensed( buffData.duration );

	if ( updateType == 'ALL' ) then
		Tooltips.SetTooltipText( 1, 1, buffData.name );
		Tooltips.SetTooltipText( 3, 1, buffData.effectText );

		Tooltips.SetTooltipText( 1, 2, DataUtils.GetAbilityTypeText(buffData) );
	end

	Tooltips.SetTooltipText( 2, 1, durationText );

	Tooltips.Finalize();

end

-- ========================================================================================
-- MouseClick handing
-- ========================================================================================

function HealGridBuffTracker:RButtonDown( buffIdx, flags )

	if ( flags == SystemData.ButtonFlags.SHIFT ) then
		DUMP_TABLE( self.unitObj.cachedBuffData[buffIdx] );
	end

end

-- #################################################################################################
-- Static
-- #################################################################################################

function HealGridBuffTracker.OnMouseOver(  )

	local frameName,buffType,buffIdx = SystemData.MouseOverWindow.name:match( "^HG_HealGrid_(.*)_([A-Z]+)([0-9]+)$" );

	if ( HealGridBuffTracker.buffTrackers["HG_HealGrid_"..frameName] ~= nil ) then
		HealGridBuffTracker.buffTrackers["HG_HealGrid_"..frameName]:ShowTooltip( buffType, buffTypeIdx, WindowGetId(SystemData.MouseOverWindow.name) );
	end

end

function HealGridBuffTracker.OnMouseOverEnd()

	HealGridBuffTracker.currentTooltipBuff = nil;
	HealGridBuffTracker.currentTooltipBuffIdx = 0;

end

function HealGridBuffTracker.MouseOverUpdate()

	if ( HealGridBuffTracker.currentTooltipBuff ~= nil ) then
		HealGridBuffTracker.currentTooltipBuff:PopulateTooltip( HealGridBuffTracker.currentTooltipBuffIdx, 'TIME' );
	end

end

function HealGridBuffTracker.OnRButtonDown( flags )	

	if ( HealGridBuffTracker.currentTooltipBuff ~= nil ) then
		HealGridBuffTracker.currentTooltipBuff:RButtonDown( HealGridBuffTracker.currentTooltipBuffIdx, flags );
	end

end

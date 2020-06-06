RMetGuiSliderBar = RMetGuiObject:New();

function RMetGuiSliderBar:New( o )

	local t;
	
	if ( o ) then
		o.elementHeight = (o.elementHeight or 33);
	end

	t = RMetGuiObject:New( o );

	if ( o ) then
		t.minLabel = (o.minLabel or nil);
		t.maxLabel = (o.maxLabel or nil);
		t.midLabel = (o.midLabel or nil);
		t.minVal = (o.minVal or 1);
		t.maxVal = (o.maxVal or 100);
		t.midLabelFormat = (o.midLabelFormat or nil);
		t.divisor = (o.divisor or 1);
	end

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function RMetGuiSliderBar:GetElementFrameName()

	return( self.frameName..'Slider' );

end

function RMetGuiSliderBar:GetMinLabelName()

	return( self.frameName..'MinLabel' );

end

function RMetGuiSliderBar:GetMidLabelName()

	return( self.frameName..'MidLabel' );

end

function RMetGuiSliderBar:GetMaxLabelName()

	return( self.frameName..'MaxLabel' );

end

function RMetGuiSliderBar:GetMinLabel()

	return( self.minLabel );

end

function RMetGuiSliderBar:GetMidLabel()

	return( self.midLabel );

end

function RMetGuiSliderBar:GetMaxLabel()

	return( self.maxLabel );

end

function RMetGuiSliderBar:GetMidLabelFormat()

	return( self.midLabelFormat );

end

function RMetGuiSliderBar:GetMinVal()

	return( self.minVal );

end

function RMetGuiSliderBar:GetMaxVal()

	return( self.maxVal );

end

function RMetGuiSliderBar:GetDivisor()

	return( self.divisor );

end

-- ========================================================================================
-- Geometry
-- ========================================================================================

function RMetGuiSliderBar:GetTotalHeight()

	return( RMetGuiObject.GetTotalHeight(obj) + 20 );		-- the labels of the slider

end

-- ========================================================================================
-- Slider calculations
-- ========================================================================================

function RMetGuiSliderBar:ValToSliderPos( currVal )

	local sliderPos, val, range;
    local divisor = self:GetDivisor();
    local minVal = self:GetMinVal() * divisor;
    local maxVal = self:GetMaxVal() * divisor;

	currVal = currVal * divisor;
	range = maxVal - minVal;

	if ( currVal < minVal ) then
		currVal = minVal;
	elseif ( currVal > maxVal ) then
		currVal = maxVal;
	end

	val = math.abs( currVal - minVal );

	sliderPos = val / range;

	return( sliderPos );

end

function RMetGuiSliderBar:SliderPosToVal( sliderPos )

    local range, newVal;
    local divisor = self:GetDivisor();
    local minVal = self:GetMinVal() * divisor;
    local maxVal = self:GetMaxVal() * divisor;

    range = maxVal - minVal;

    newVal = math.floor( range * sliderPos + 0.5 ) + minVal;

    return( newVal / divisor );

end

-- ========================================================================================
-- Initialize
-- ========================================================================================

function RMetGuiSliderBar:Initialize()

	RMetGuiObject.Initialize( self );

end

-- ========================================================================================
-- Activate
-- ========================================================================================

function RMetGuiSliderBar:Activate()

	local currVal = self:GetSetting();
	local divisor = self:GetDivisor();

	WindowSetShowing( self:GetMinLabelName(), self:GetMinLabel() ~= nil );
	WindowSetShowing( self:GetMidLabelName(), self:GetMidLabel() ~= nil );
	WindowSetShowing( self:GetMaxLabelName(), self:GetMaxLabel() ~= nil );

	LabelSetText( self:GetMinLabelName(), self:GetMinLabel() or L"" );
	LabelSetText( self:GetMidLabelName(), self:GetMidLabel() or L"" );
	LabelSetText( self:GetMaxLabelName(), self:GetMaxLabel() or L"" );

	SliderBarSetCurrentPosition( self:GetElementFrameName(), self:ValToSliderPos(currVal) );

	if ( self:GetMidLabelFormat() ~= nil ) then
		LabelSetText( self:GetMidLabelName(), wstring.format(self:GetMidLabelFormat(),currVal/divisor) );
	end

end

-- ========================================================================================
-- ChangeValue
-- ========================================================================================

function RMetGuiSliderBar:ChangeValue( sliderPos )

	local currVal = self:GetSetting();
	local newVal = self:SliderPosToVal( sliderPos );

	if ( newVal ~= currVal ) then
		self:SetSetting( newVal );

		if ( self:GetMidLabelFormat() ~= nil ) then
			LabelSetText( self:GetMidLabelName(), wstring.format(self:GetMidLabelFormat(),newVal/self:GetDivisor()) );
		end

		self:ExecuteCallbackPostChange();	
	end

end

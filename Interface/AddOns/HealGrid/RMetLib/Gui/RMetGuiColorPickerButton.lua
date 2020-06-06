RMetGuiColorPickerButton = RMetGuiObject:New();

RMetGuiColorPickerButton.FOREGROUND_COLOR = 'WHITE';
RMetGuiColorPickerButton.BACKGROUND_COLOR = 'BLACK';

function RMetGuiColorPickerButton:New( o )

	local t;
	
	if ( o ) then
		o.elementHeight = (o.elementHeight or 31);
	end

	t = RMetGuiObject:New( o );

	if ( o ) then
		t.sign = o.sign;
		t.backgroundSettingObj = (o.backgroundSettingObj or nil);
		t.backgroundSettingKey = (o.backgroundSettingKey or nil);
		t.foregroundColor = (o.foregroundColor or RMetGuiColorPickerButton.FOREGROUND_COLOR);
		t.backgroundColor = (o.backgroundColor or RMetGuiColorPickerButton.BACKGROUND_COLOR);
	end

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function RMetGuiColorPickerButton:GetElementFrameName()

	return( self.frameName..'Button' );

end

function RMetGuiColorPickerButton:GetSignFrameName()

	return( self.frameName..'Sign' );

end

function RMetGuiColorPickerButton:GetForegroundColorFrameName()

	return( self.frameName..'Sign' );

end

function RMetGuiColorPickerButton:GetBackgroundColorFrameName()

	return( self.frameName..'Background' );

end

function RMetGuiColorPickerButton:GetForegroundColor()

	local color = self.foregroundColor;

	if ( self:GetSettingObj() ) then
		color = self:GetSetting();
	end

	return( color );

end

function RMetGuiColorPickerButton:GetBackgroundColor()

	local color = self.backgroundColor;

	if ( self:GetBackgroundColorSettingObj() ) then
		color = self:GetBackgroundColorSetting();
	end

	return( color );

end

-- ========================================================================================
-- Settings
-- ========================================================================================

function RMetGuiColorPickerButton:GetBackgroundColorSettingObj()

	return( self.backgroundSettingObj );

end

function RMetGuiColorPickerButton:GetBackgroundColorSettingKey()

	return( self.backgroundSettingKey );

end

function RMetGuiColorPickerButton:GetBackgroundColorSetting()

	return( _G[self:GetBackgroundColorSettingObj()].SettingGet(self:GetBackgroundColorSettingKey()) );

end

function RMetGuiColorPickerButton:SetBackgroundColorSetting( value )

	return( _G[self:GetBackgroundColorSettingObj()].SettingSet(self:GetBackgroundColorSettingKey(),value) );

end

-- ========================================================================================
-- Initialize
-- ========================================================================================

function RMetGuiColorPickerButton:Initialize()

	RMetGuiObject.Initialize( self );

	if ( self.sign ~= nil ) then
		LabelSetText( self:GetSignFrameName(), self.sign );
	else
		LabelSetText( self:GetSignFrameName(), L"Color" );
	end

end

-- ========================================================================================
-- Activate
-- ========================================================================================

function RMetGuiColorPickerButton:Activate()

	self:SetForegroundColor( self:GetForegroundColor() );
	self:SetBackgroundColor( self:GetBackgroundColor() );

end

-- ========================================================================================
-- ChangeValue
-- ========================================================================================

function RMetGuiColorPickerButton:ChangeValue( newColor )

	local currColor = self:GetSetting();

	if ( newColor ~= currColor ) then
		self:SetSetting( newColor );
		self:SetForegroundColor( newColor );
		self:ExecuteCallbackPostChange();
	end

end

function RMetGuiColorPickerButton:ChangeValueBackgroundColor( newColor )

	local currColor = self:GetBackgroundColorSetting();

	if ( newColor ~= currColor ) then
		self:SetBackgroundColorSetting( newColor );
		self:SetBackgroundColor( newColor );
		self:ExecuteCallbackPostChange();
	end

end

-- ========================================================================================
-- Edit foreground/background color
-- ========================================================================================

function RMetGuiColorPickerButton:EditForegroundColor()

	if ( self:GetSettingKey() ) then
		RMetColorPicker.Activate( self, "ChangeValue", true );
	end

end

function RMetGuiColorPickerButton:EditBackgroundColor()

	if ( self:GetBackgroundColorSettingKey() ) then
		RMetColorPicker.Activate( self, "ChangeValueBackgroundColor", true );
	end

end

-- ========================================================================================
-- Update colors of the buttoon
-- ========================================================================================

function RMetGuiColorPickerButton:SetForegroundColor( color )

	LabelSetTextColor( self:GetForegroundColorFrameName(), RMetColor[color].r, RMetColor[color].g, RMetColor[color].b );

	if ( self.sign == nil ) then
		LabelSetText( self:GetSignFrameName(), RMetColor[color].label );
	end

end

function RMetGuiColorPickerButton:SetBackgroundColor( color )

	WindowSetTintColor( self:GetBackgroundColorFrameName(), RMetColor[color].r, RMetColor[color].g, RMetColor[color].b );

end

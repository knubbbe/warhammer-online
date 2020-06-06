RMetGuiCheckButton = RMetGuiObject:New();

function RMetGuiCheckButton:New( o )

	local t;
	
	if ( o ) then
		o.elementHeight = 22;
		o.elementWidth = 22;
	end

	t = RMetGuiObject:New( o );

	if ( o ) then
		if ( o.valueOn == nil )  then t.valueOn = true;   else t.valueOn = o.valueOn;   end
		if ( o.valueOff == nil ) then t.valueOff = false; else t.valueOff = o.valueOff; end
	end

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function RMetGuiCheckButton:GetElementFrameName()

	return( self.frameName..'Button' );

end

function RMetGuiCheckButton:GetValueOn()

	return( self.valueOn );

end

function RMetGuiCheckButton:GetValueOff()

	return( self.valueOff );

end

-- ========================================================================================
-- Geometry
-- ========================================================================================

function RMetGuiCheckButton:SetTotalWidth( w )

	if ( not self:IsGeometryLocked() ) then
		self:SetLabelWidth( w - self:GetElementWidth() - 10 );
	end

end

function RMetGuiCheckButton:SetElementWidth( w )

	-- not allowed to change width

end

function RMetGuiCheckButton:SetElementHeight( h )

	-- not allowed to change height

end

-- ========================================================================================
-- Initialize
-- ========================================================================================

function RMetGuiCheckButton:Initialize()

	RMetGuiObject.Initialize( self );

	ButtonSetStayDownFlag( self:GetElementFrameName(), true );

end

-- ========================================================================================
-- Activate
-- ========================================================================================

function RMetGuiCheckButton:Activate()

	local flag = self:GetSetting();

	ButtonSetPressedFlag( self:GetElementFrameName(), flag == self:GetValueOn() );

end

-- ========================================================================================
-- ChangeValue
-- ========================================================================================

function RMetGuiCheckButton:ChangeValue( selected )

	local flag = self:GetSetting();

	if ( flag == self:GetValueOn() ) then
		self:SetSetting( self:GetValueOff() );
	else
		self:SetSetting( self:GetValueOn() );
	end

	ButtonSetPressedFlag( self:GetElementFrameName(), self:GetSetting() == self:GetValueOn() );

	self:ExecuteCallbackPostChange();

end

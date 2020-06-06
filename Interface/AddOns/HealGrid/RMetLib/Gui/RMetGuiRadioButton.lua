RMetGuiRadioButton = RMetGuiCheckButton:New();

function RMetGuiRadioButton:New( o )

	local t;
	
	if ( o ) then
		-- nop;
	end

	t = RMetGuiCheckButton:New( o );

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function RMetGuiRadioButton:GetElementFrameName()

	return( self.frameName..'Button' );

end

function RMetGuiRadioButton:GetValueOff()

	return( nil );

end

-- ========================================================================================
-- Initialize
-- ========================================================================================

function RMetGuiRadioButton:Initialize()

	RMetGuiCheckButton.Initialize( self );

	ButtonSetStayDownFlag( self:GetElementFrameName(), true );

end

-- ========================================================================================
-- Activate
-- ========================================================================================

-- USE INHERITED
--function RMetGuiRadioButton:Activate()
--
--	local flag = self:GetSetting();
--
--	ButtonSetPressedFlag( self:GetElementFrameName(), flag == self:GetValueOn() );
--
--end

-- ========================================================================================
-- ChangeValue
-- ========================================================================================

function RMetGuiRadioButton:ChangeValue( selected )

	local flag = self:GetSetting();

	if ( flag == self:GetValueOn() ) then
		self:SetSetting( self:GetValueOff() );
	else
		self:SetSetting( self:GetValueOn() );
	end

	ButtonSetPressedFlag( self:GetElementFrameName(), self:GetSetting() == self:GetValueOn() );

	self:ExecuteCallbackPostChange();

	RMetGuiBroker.SyncRadioGroup( self );

end

RMetGuiComboBox = RMetGuiObject:New();

function RMetGuiComboBox:New( o )

	local t;

	if ( o ) then 
		o.elementHeight = 28;
	end

	t = RMetGuiObject:New( o );

	if ( o ) then 
		t.valueList = (o.valueList or {});
	end

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function RMetGuiComboBox:GetElementFrameName()

	return( self.frameName..'ComboBox' );

end

function RMetGuiComboBox:GetValueList()

	return( self.valueList );

end

-- ========================================================================================
-- Initialize
-- ========================================================================================

function RMetGuiComboBox:Initialize()

	RMetGuiObject.Initialize( self );

	ComboBoxClearMenuItems( self:GetElementFrameName() );

    for k,v in ipairs(self:GetValueList()) do
        ComboBoxAddMenuItem( self:GetElementFrameName(), v.label );
    end

end

-- ========================================================================================
-- Activate
-- ========================================================================================

function RMetGuiComboBox:Activate()

	local selected = self:GetSetting();

    for k,v in ipairs(self:GetValueList()) do
		if ( v.key == selected ) then
	        ComboBoxSetSelectedMenuItem( self:GetElementFrameName(), k );
		end
	end

end

-- ========================================================================================
-- ChangeValue
-- ========================================================================================

function RMetGuiComboBox:ChangeValue( selected )

	local currVal = self:GetSetting();
	local newVal = self:GetValueList()[selected].key;

	if ( newVal ~= currVal ) then
		self:SetSetting( newVal );
		self:ExecuteCallbackPostChange();
	end

end

RMetGuiObject = {};

function RMetGuiObject:New( o )

	local t = {};
	
	if ( o ) then
		t.paneID = (o.paneID or "NONE");
		t.groupID = t.paneID .. (o.groupID or "NONE" );
		t.frameName = (o.frameName or "");
		t.settingObj = (o.settingObj or "");
		t.settingKey = (o.settingKey or "");
		t.label = (o.label or L"");

		t.isLabelVisible = true;
		t.isElementVisible = true;

		t.labelWidth = (o.labelWidth or 140);
		t.elementWidth = (o.elementWidth or 250);
		t.labelHeight = (o.labelHeight or 40);
		t.elementHeight = (o.elementHeight or 40);
		t.totalHeight = (o.totalHeight or 40);

		t.isGeometryLocked = false;
	end

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function RMetGuiObject:GetPaneID()

	return( self.paneID );

end

function RMetGuiObject:GetGroupID()

	return( self.groupID );

end

function RMetGuiObject:GetFrameName()

	return( self.frameName );

end

function RMetGuiObject:GetLabelFrameName()

	return( self:GetFrameName()..'Label' );

end

function RMetGuiObject:GetElementFrameName()

	d( "ABSTRACT RMetGuiObject:GetElementFrameName() must be overriden!" );
	return( nil );

end

function RMetGuiObject:GetLabel()

	return( self.label );

end

-- ========================================================================================
-- Visibility
-- ========================================================================================

function RMetGuiObject:SetLabelVisibility( visibility )

	self.isLabelVisible = visibity;
	self:UpdateGeometry();

end

function RMetGuiObject:SetElementVisibility( visibility )

	self.isElementVisible = visibity;
	self:UpdateGeometry();

end

function RMetGuiObject:GetLabelVisibility()

	return( self.isLabelVisible );

end

function RMetGuiObject:GetElementVisibility()

	return( self.isElementVisible );

end

-- ========================================================================================
-- Geometry
-- ========================================================================================

function RMetGuiObject:GetTotalWidth()

	if ( self:GetLabelVisibility() == false ) then
		return( self:GetElementWidth() );
	elseif ( self:GetElementVisibility() == false ) then
		return( self:GetLabelVisibility() );
	else
		return( self:GetLabelWidth() + self:GetElementWidth() + 10 );
	end

end

function RMetGuiObject:GetLabelWidth()

	return( self.labelWidth );

end

function RMetGuiObject:GetElementWidth()

	return( self.elementWidth );

end

function RMetGuiObject:SetTotalWidth( w )

	if ( not self:IsGeometryLocked() ) then
		self:SetElementWidth( w - self:GetLabelWidth() - 10 );
	end

end

function RMetGuiObject:SetLabelWidth( w )

	if ( not self:IsGeometryLocked() ) then
		self.labelWidth = w;
		self:UpdateGeometry();
	end

end

function RMetGuiObject:SetElementWidth( w )

	if ( not self:IsGeometryLocked() ) then
		self.elementWidth = w;
		self:UpdateGeometry();
	end

end

function RMetGuiObject:GetTotalHeight()

	return( self.totalHeight );

end

function RMetGuiObject:GetLabelHeight()

	return( self.labelHeight );

end

function RMetGuiObject:GetElementHeight()

	return( self.elementHeight );

end

function RMetGuiObject:IsGeometryLocked()

	return( self.isGeometryLocked );

end

function RMetGuiObject:LockGeometry()

	self.isGeometryLocked = true;

end

function RMetGuiObject:UpdateGeometry()

	WindowSetDimensions( self:GetFrameName(), self:GetTotalWidth(), self:GetTotalHeight() );

	WindowSetShowing( self:GetLabelFrameName(), self:GetLabelVisibility() );
	WindowSetDimensions( self:GetLabelFrameName(), self:GetLabelWidth(), self:GetLabelHeight() );

	WindowSetShowing( self:GetElementFrameName(), self:GetElementVisibility() );
	WindowSetDimensions( self:GetElementFrameName(), self:GetElementWidth(), self:GetElementHeight() );

end

-- ========================================================================================
-- Settings
-- ========================================================================================

function RMetGuiObject:GetSettingObj()

	return( self.settingObj );

end

function RMetGuiObject:GetSettingKey()

	return( self.settingKey );

end

function RMetGuiObject:GetSetting()

	local i1,i2,i3 = self:GetSettingKey():match( "([A-Za-z0-9_]+):?([A-Za-z0-9_]*):?([A-Za-z0-9_]*)" );

	if ( i3 ~= nil and i3 ~= "" ) then
		return( _G[self:GetSettingObj()].SettingGet(i1,i2,i3) );
	elseif ( i2 ~= nil and i2 ~= "" ) then
		return( _G[self:GetSettingObj()].SettingGet(i1,i2) );
	else
		return( _G[self:GetSettingObj()].SettingGet(i1) );
	end

end

function RMetGuiObject:SetSetting( value )

	local i1,i2,i3 = self:GetSettingKey():match( "([A-Za-z0-9_]+):?([A-Za-z0-9_]*):?([A-Za-z0-9_]*)" );

	if ( i3 ~= nil and i3 ~= "" ) then
		return( _G[self:GetSettingObj()].SettingSet(i1,i2,i3,value) );
	elseif ( i2 ~= nil and i2 ~= "" ) then
		return( _G[self:GetSettingObj()].SettingSet(i1,i2,value) );
	else
		return( _G[self:GetSettingObj()].SettingSet(i1,value) );
	end

end

-- ========================================================================================
-- Callbacks
-- ========================================================================================

function RMetGuiObject:AddCallbackPostChange( obj, func )

	if ( self.callbackPostChange == nil ) then
		self.callbackPostChange = {};
	end

	table.insert( self.callbackPostChange, {obj=obj,func=func} );

end

function RMetGuiObject:ExecuteCallbackPostChange()

	if ( self.callbackPostChange ~= nil ) then
		for k,v in ipairs(self.callbackPostChange) do
			if ( v.obj ) then
				v.obj[v.func]();
			else
				v.func();
			end
		end
	end

end

-- ========================================================================================
-- Initialize
-- ========================================================================================

function RMetGuiObject:Initialize()

	self:UpdateGeometry();

	if ( DoesWindowExist(self:GetLabelFrameName()) ) then
		LabelSetText( self:GetLabelFrameName(), self:GetLabel() );
	end

end

-- ========================================================================================
-- Shutdown
-- ========================================================================================

function RMetGuiObject:Shutdown()

end

-- ========================================================================================
-- Activate
-- ========================================================================================

function RMetGuiObject:Activate()


end

-- ========================================================================================
-- ChangeValue
-- ========================================================================================

function RMetGuiObject:ChangeValue()

	d( "ABSTRACT RMetGuiObject.ChangeValue() called" );

end

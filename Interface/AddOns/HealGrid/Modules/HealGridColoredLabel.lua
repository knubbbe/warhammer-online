-- ==========================================================================================================================
-- A label which can change color in mid-label
-- ==========================================================================================================================

HealGridColoredLabel = {};

HealGridColoredLabel.MAX_CHAR = 10;

function HealGridColoredLabel:New( o )

	local t = {};
	
	if ( o ) then
		t.frameName = o.frameName;
		t.parentFrameName = o.parentFrameName;
		t.frameLayer = (o.frameLayer or Window.Layers.DEFAULT);
		t.labelContent = {};
		t.insertIndex = 1;
		t.contentChanged = true;
		t.maxWidth = 20;

		if ( not DoesWindowExist(t.frameName) ) then
			CreateWindowFromTemplate( t.frameName, "HG_HealGridColoredLabelTemplate", t.parentFrameName );
			WindowSetLayer( t.frameName, t.frameLayer );
		end
	end

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ===========================================================================================================================
-- Trivials
-- ===========================================================================================================================

function HealGridColoredLabel:GetFrameName()

	return( self.frameName );

end

-- ===========================================================================================================================
-- Anchoring
-- ===========================================================================================================================

function HealGridColoredLabel:SetAnchor( point, relativeTo, relativePoint, offsetX, offsetY )

	-- ----- anchor the parent
	WindowClearAnchors( self:GetFrameName() );
--	WindowAddAnchor( self:GetFrameName(), point, relativeTo, relativePoint, (offsetX or 0), (offsetY or 0) );
--	TODO: temporary hack: gives the frame a size. otherwise use a "default" size for the frame which is large enough for the font!
--	width=maxWidth, height=fontHeight (+ margin), also "resize" in SetFont(), use default initial width !!! (eg. 20x20)
	WindowAddAnchor( self:GetFrameName(), 'TOPLEFT', relativeTo, 'TOPLEFT', (offsetX or 0), (offsetY or 0) );
	WindowAddAnchor( self:GetFrameName(), 'BOTTOMRIGHT', relativeTo, 'BOTTOMRIGHT', (offsetX or 0), (offsetY or 0) );

	-- ----- anchor the first frame to the enclosing frame, for alignment
	WindowClearAnchors( self:GetFrameName()..'Label1' );
	WindowAddAnchor( self:GetFrameName()..'Label1', point, self:GetFrameName(), relativePoint, 0, 0 );

	-- ----- also anchor the non-color frame to the enclosing frame, for alignment
	WindowClearAnchors( self:GetFrameName()..'LabelNoColor' );
	WindowAddAnchor( self:GetFrameName()..'LabelNoColor', point, self:GetFrameName(), relativePoint, 0, 0 );

end

-- ===========================================================================================================================
-- Sizes
-- ===========================================================================================================================

function HealGridColoredLabel:SetMaxWidth( w )

	self.maxWidth = w;

end

function HealGridColoredLabel:GetMaxWidth()

	return( self.maxWidth );

end

-- ===========================================================================================================================
-- Font
-- ===========================================================================================================================

function HealGridColoredLabel:SetFont( font, linespacing )

	for i=1,HealGridColoredLabel.MAX_CHAR do
		LabelSetFont( self:GetFrameName()..'Label'..i, font, linespacing );
	end

end

-- ===========================================================================================================================
-- Label content
-- ===========================================================================================================================

function HealGridColoredLabel:WipeText()

	self.contentChanged = false;
	self.insertIndex = 1;

end

function HealGridColoredLabel:SetText( text, textColor, backgroundColor )

	self:WipeText();

	self:AddText( text, textColor, backgroundColor );

end

function HealGridColoredLabel:AddText( text, textColor, backgroundColor )

	if ( self.insertIndex > HealGridColoredLabel.MAX_CHAR ) then
		return;
	end

	if ( type(text) == 'string' ) then
		text = StringToWString( text );
	end

	backgroundColor = (backgroundColor or 'TRANSPARENT');

	if ( self.labelContent[self.insertIndex] ~= nil and
         self.labelContent[self.insertIndex].text == text and
         self.labelContent[self.insertIndex].textColor == textColor and
         self.labelContent[self.insertIndex].backgroundColor == backgroundColor )
	then
		self.labelContent[self.insertIndex].hasChanged = false;
	else
		self.contentChanged = true;
		if ( self.labelContent[self.insertIndex] == nil ) then
			self.labelContent[self.insertIndex] = {};
		end
		self.labelContent[self.insertIndex].text = text;
		self.labelContent[self.insertIndex].textColor = textColor;
		self.labelContent[self.insertIndex].backgroundColor = backgroundColor;
		self.labelContent[self.insertIndex].hasChanged = true;
	end

	self.insertIndex = self.insertIndex + 1;

end

-- ===========================================================================================================================
-- Display
-- ===========================================================================================================================

function HealGridColoredLabel:Display()

	local txt = L'';
	local showBackground, labelName, w, h;
	local totalWidth = 0;
	local i = 1;

	-- content changed ? or wiped and nothing set
	if ( ((not self.contentChanged) and self.insertIndex > 1) or (self.insertIndex == 1 and self.labelContent[1] == nil) ) then
		return;
	end

	-- draw colored label
	if ( HealGrid.SettingGet('useColoredLabels') ) then
		while ( i < self.insertIndex ) do
			labelName = self:GetFrameName()..'Label'..i;
			if ( self.labelContent[i].hasChanged and totalWidth < self:GetMaxWidth() ) then
				WindowSetDimensions( labelName, 100, 100 );
				LabelSetText( labelName, self.labelContent[i].text );
				HealGridUtility.LabelSetTextColor( labelName, self.labelContent[i].textColor );
				if ( self.labelContent[i].backgroundColor ~= 'TRANSPARENT' ) then
					HealGridUtility.WindowSetTintColor( labelName..'Background', self.labelContent[i].backgroundColor );
				end
			end
	
			w,h = LabelGetTextDimensions( labelName );
--			w,h = WindowGetDimensions( labelName );					better results with LabelGetTextDimensions()
			totalWidth = totalWidth + w;
	
			WindowSetShowing( labelName, totalWidth <= self:GetMaxWidth() );
			WindowSetShowing( labelName..'Background', totalWidth <= self:GetMaxWidth() and self.labelContent[i].backgroundColor ~= 'TRANSPARENT' );
	
			i = i + 1;
		end
	-- draw non-colored label
	else
		while ( i < self.insertIndex ) do
			txt = txt .. self.labelContent[i].text;
			labelName = self:GetFrameName()..'Label'..i;
			if ( WindowGetShowing(labelName) ) then
				WindowSetShowing( labelName, false );
				WindowSetShowing( labelName..'Background', false );
			end
			i = i + 1;
		end
		labelName = self:GetFrameName()..'LabelNoColor';
		LabelSetText( labelName, txt );
		HealGridUtility.LabelSetTextColor( labelName, 'DEEP_SKY_BLUE' );
		WindowSetDimensions( labelName, self:GetMaxWidth(), 30 );
		WindowSetShowing( labelName, true );
	end

	-- wipe "old" entries
	while ( self.labelContent[i] ~= nil ) do
		self.labelContent[i] = nil;

		labelName = self:GetFrameName()..'Label'..i;
		WindowSetShowing( labelName, false );
		WindowSetShowing( labelName..'Background', false );

		i = i + 1;
	end

end

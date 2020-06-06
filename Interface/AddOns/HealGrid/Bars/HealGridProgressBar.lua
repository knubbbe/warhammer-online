HealGridProgressBar = {};

HealGridProgressBar.instances = {};				-- static list with all instances of this class  { [frameName] = obj, }

function HealGridProgressBar:New( o )

	local t = {};

	if ( o ) then
		t.frameName = o.frameName;
		t.frameSuffix = (o.frameSuffix or "");
		t.templateName = o.templateName;
		t.parentFrameName = o.parentFrameName;
		if ( o.usesSkinLabels == nil ) then
			t.usesSkinLabels = false;
		else
			t.usesSkinLabels = o.usesSkinLabels;
		end
	end

	t.statusBarCurrentValue = 100;
	t.statusBarMaximumValue = 100;
	t.statusBarMaximumWidth = 100;
	t.statusBarMaximumHeight = 10;

	t.labels =	{ LEFT	= {label=L"",isVisible=true,color='BLACK',cache='UNDEF'},
				  CENTER= {label=L"",isVisible=true,color='BLACK',cache='UNDEF'},
				  RIGHT	= {label=L"",isVisible=true,color='BLACK',cache='UNDEF'},
				};

	t.tooltipShown = false;						-- need this to trigger the OnMouseOver event (unfortunately)

	setmetatable( t, self );
	self.__index = self;

	return( t );

end

-- ========================================================================================================
-- Trivials
-- ========================================================================================================

function HealGridProgressBar:GetFrameName()

	return( self.frameName..self:GetFrameSuffix() );

end

function HealGridProgressBar:GetFrameSuffix()

	return( self.frameSuffix );

end

function HealGridProgressBar:GetTemplateName()

	return( self.templateName );

end

function HealGridProgressBar:GetParentFrameName()

	return( self.parentFrameName );

end

function HealGridProgressBar:UsesSkinLabels()

	return( self.usesSkinLabels );

end

-- ========================================================================================================
-- Initialization
-- ========================================================================================================

function HealGridProgressBar:Initialize()

	HealGridProgressBar.instances[self:GetFrameName()] = self;

	CreateWindowFromTemplate( self:GetFrameName(), self:GetTemplateName(), self:GetParentFrameName() );

	WindowSetScale( self:GetFrameName(), WindowGetScale(self:GetParentFrameName()) );
	WindowSetShowing( self:GetFrameName(), true );

end

-- ========================================================================================================
-- Shutdown
-- ========================================================================================================

function HealGridProgressBar:Shutdown()

	HealGridProgressBar.instances[self:GetFrameName()] = nil;

end

-- ===========================================================================================================
-- Update Handler
-- ===========================================================================================================

function HealGridProgressBar:Update( timePassed )

	-- update the labels
	if ( self:UsesSkinLabels() ) then
		self:UpdateLabelLeft();
		self:UpdateLabelCenter();
		self:UpdateLabelRight();
	end

	self:UpdateTooltip();

end

-- ===========================================================================================================
-- Status Bar handling
-- ===========================================================================================================

function HealGridProgressBar:SetMaximumValue( maxVal )

	if ( maxVal ~= self.statusBarMaximumValue ) then
		self.statusBarMaximumValue = maxVal;
		self:ResizeStatusBar();
	end

end

function HealGridProgressBar:SetCurrentValue( currVal )

	if ( currVal ~= self.statusBarCurrentValue ) then
		self.statusBarCurrentValue = currVal;
		self:ResizeStatusBar();
	end

end

function HealGridProgressBar:SetCurrMaxValue( currVal, maxVal )

	if ( currVal ~= self.statusBarCurrentValue or maxVal ~= self.statusBarMaximumValue ) then
		self.statusBarCurrentValue = currVal;
		self.statusBarMaximumValue = maxVal;
		self:ResizeStatusBar();
	end

end

function HealGridProgressBar:SetStatusBarTint( color )

	HealGridUtility.WindowSetTintColor( self:GetFrameName().."StatusBar", color );

end

function HealGridProgressBar:ResizeStatusBar()

	local w, h;

	if ( self.statusBarMaximumValue == 0 ) then
		w = 0;
	elseif ( self.statusBarCurrentValue > self.statusBarMaximumValue ) then
		w = self.statusBarMaximumWidth;
	else
		w = ( self.statusBarCurrentValue / self.statusBarMaximumValue ) * self.statusBarMaximumWidth;
		w = math.floor( w + 0.5 );
	end

	h = self.statusBarMaximumHeight;

	WindowSetDimensions( self:GetFrameName().."StatusBar", w, h );

end

-- ===========================================================================================================================
-- Labels
-- ===========================================================================================================================

function HealGridProgressBar:UpdateLabel( frameName, index )			-- final protected !

	-- --- label is invisble ----------
	if ( self.labels[index].label == L"" ) then
		if ( self.labels[index].isVisible ) then
			WindowSetShowing( frameName, false );
		end 
	-- --- label is visble ------------
	else
		if ( not self.labels[index].isVisible ) then
			WindowSetShowing( frameName, false );
		end 
		LabelSetText( frameName, HealGridTags.Parse(self.labels[index],HealGridHUDMain.Instance():GetUnit(1,HealGridHUD.PLAYER)) );
		self.labels[index].cache = HealGridUtility.SetColorPlus( frameName, HealGridHUDMain.Instance():GetUnit(1,HealGridHUD.PLAYER), 
																	self.labels[index].color, self.labels[index].cache, 'label', true );
	end

end

function HealGridProgressBar:UpdateLabelLeft()

	self:UpdateLabel( self:GetFrameName().."LabelLeft", 'LEFT' );

end

function HealGridProgressBar:UpdateLabelCenter()

	self:UpdateLabel( self:GetFrameName().."LabelCenter", 'CENTER' );

end

function HealGridProgressBar:UpdateLabelRight()

	self:UpdateLabel( self:GetFrameName().."LabelRight", 'RIGHT' );

end

-- ===========================================================================================================
-- Skinning and Display
-- ===========================================================================================================

function HealGridProgressBar:GetFrameSpan()

	return( 1 );

end

function HealGridProgressBar:GetHeight( skinID, skinSectionID, skinSubSectionID )

	return( HealGridSkin.GetSkinValue(skinID,(skinSectionID or 'hud'),skinSubSectionID,'height')  );

end

function HealGridProgressBar:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, frameName, labelIndex )      -- final protected

	local label, font, color;

	if ( self:UsesSkinLabels() ) then
		label = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'label' );
		font = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'font' );
		color = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'color' );

   		self.labels[labelIndex].label = label;
   		self.labels[labelIndex].isPrepared = false;
   		self.labels[labelIndex].isVisible = true;
   		self.labels[labelIndex].color = color;
   		self.labels[labelIndex].cache = 'UNDEF';

   		LabelSetFont( frameName, font, 10 );
		self.labels[labelIndex].cache = HealGridUtility.SetColorPlus( frameName, HealGridHUDMain.Instance():GetUnit(1,HealGridHUD.PLAYER), 
																		self.labels[labelIndex].color, self.labels[labelIndex].cache, 'label', true );
	else
    	font = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, skinLabelIndex, 'font' );
    	LabelSetFont( frameName, font, 10 );
	end

   	WindowSetShowing( frameName, true );

end

function HealGridProgressBar:ApplySkin( skinID, skinSectionID, skinSubSectionID, factory )

	local borderWidth = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'width' );
	local borderHeight = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'height' );
	local borderColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'border', 'color' );
	local barForegroundColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'foreground', 'color' );
	local barForegroundTexture = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'foreground', 'texture' );
	local barForegroundStyle = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'foreground', 'style' );
	local barBackgroundColor = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'background', 'color' );
	local barBackgroundTexture = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'background', 'texture' );
	local barBackgroundStyle = HealGridSkin.GetSkinValue( skinID, skinSectionID, skinSubSectionID, 'background', 'style' );

	-- border
	self:SetAnchor( self:GetFrameName().."Background", 
                              'topleft', self:GetFrameName(), 'topleft', borderWidth, borderHeight,
	                          'bottomright', self:GetFrameName(), 'bottomright', borderWidth*-1, borderHeight*-1 );
	WindowSetTintColor( self:GetFrameName().."Border", 0, 0, 0 );
	HealGridUtility.WindowSetTintColor( self:GetFrameName().."StatusBar", borderColor );

	-- foreground
	HealGridUtility.DynamicImageSetTexture( self:GetFrameName().."StatusBar", barForegroundTexture,  barForegroundStyle );
	HealGridUtility.WindowSetTintColor( self:GetFrameName().."StatusBar", barForegroundColor );

	-- background
	HealGridUtility.DynamicImageSetTexture( self:GetFrameName().."Background", barBackgroundTexture,  barBackgroundStyle );
	HealGridUtility.WindowSetTintColor( self:GetFrameName().."Background", barBackgroundColor );

	-- labels
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelLeft', self:GetFrameName()..'LabelLeft', 'LEFT' );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelCenter', self:GetFrameName()..'LabelCenter', 'CENTER' );
	self:ApplySkinLabel( skinID, skinSectionID, skinSubSectionID, 'labelRight', self:GetFrameName()..'LabelRight', 'RIGHT' );

end

function HealGridProgressBar:SetAnchor( frameName, point, relativeTo, relativePoint, x, y, point2, relativeTo2, relativePoint2, x2, y2 )

	frameName = (frameName or self:GetFrameName());
    point = (point or 'topleft');
    relativeTo = (relativeTo or self:GetParentFrameName());
    relativePoint = (relativePoint or 'topleft');
    x = (x or 0);
    y = (y or 0);

    WindowClearAnchors( frameName );
    WindowAddAnchor( frameName, point, relativeTo, relativePoint, x, y );

    if ( point2 ~= nil or relative2 ~= nil or relativePonit2 ~= nil or x2 ~= nil or y2 ~= nil ) then
        point2 = (point2 or 'topleft');
        relativeTo2 = (relativeTo2 or self:GetParentFrameName());
        relativePoint2 = (relativePoint2 or 'topleft');
        x2 = (x2 or 0);
        y2 = (y2 or 0);

        WindowAddAnchor( frameName, point2, relativeTo2, relativePoint2, x2, y2 );
    end

end

function HealGridProgressBar:InitializeStatusBar( ufw, ufh, bw, bh )

--	local x,y = WindowGetDimensions( self:GetFrameName()..'Background' );
--	d( 'win dim x='..x..' y='..y );

	self.statusBarMaximumWidth = ufw - bw * 2;
	self.statusBarMaximumHeight = ufh - bh * 2;
	self.statusBarCurrentValue = 100;
	self.statusBarMaximumValue = 100;

	self:ResizeStatusBar();

end

-- ===========================================================================================================================
-- Tooltip
-- ===========================================================================================================================

function HealGridProgressBar:StartTooltip()

	self.tooltipShown = true;

end

function HealGridProgressBar:StopTooltip()
	
	self.tooltipShown = false;

end

function HealGridProgressBar:UpdateTooltip()

	if ( self:IsTooltipShown() and WindowGetShowing(self:GetFrameName()) ) then
		WindowSetShowing( self:GetFrameName(), false );
		WindowSetShowing( self:GetFrameName(), true );
	end

end

function HealGridProgressBar:IsTooltipShown()

	return( self.tooltipShown );

end

-- ===========================================================================================================================
-- Central event-triggers (Update)
-- ===========================================================================================================================

function HealGridProgressBar.OnUpdate( timePassed )

	-- call the update of all my instances
    for k,_ in pairs(HealGridProgressBar.instances) do
        HealGridProgressBar.instances[k]:Update( timePassed );
    end

end

-- ===========================================================================================================================
-- Instances
-- ===========================================================================================================================

function HealGridProgressBar.GetInstance( frameName )

	return( HealGridProgressBar.instances[frameName] );

end

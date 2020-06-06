HGSESkinAttributeAnchorPoint = {};

HGSESkinAttributeAnchorPoint.anchorPointsList =
    {
		[1]  = {key='TOPLEFT',		label=L"TopLeft",		hidden=false, },
		[2]  = {key='TOP',			label=L"Top",			hidden=false, },
		[3]  = {key='TOPRIGHT',		label=L"TopRight",		hidden=false, },
		[4]  = {key='LEFT',			label=L"Left",			hidden=false, },
		[5]  = {key='CENTER',		label=L"Center",		hidden=false, },
		[6]  = {key='RIGHT',		label=L"Right",			hidden=false, },
		[7]  = {key='BOTTOMLEFT',	label=L"BottomLeft",	hidden=false, },
		[8]  = {key='BOTTOM',		label=L"Bottom",		hidden=false, },
		[9]  = {key='BOTTOMRIGHT',	label=L"BottomRight",	hidden=false, },
    };

HGSESkinAttributeAnchorPoint.anchorPoints = nil;

function HGSESkinAttributeAnchorPoint.Initialize()

	HGSESkinAttributeAnchorPoint.__index = HGSESkinAttributeAnchorPoint;
	setmetatable( HGSESkinAttributeAnchorPoint, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeAnchorPoint', 'HGSE_SkinAttributeAnchorPointTemplate', 'HGSE_SkinAttributePanel' );

--	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeAnchorPointValue", HGSESkinAttributeAnchorPoint.anchorPoints );

	WindowSetShowing( 'HGSE_SkinAttributeAnchorPoint', false );

end

function HGSESkinAttributeAnchorPoint.Shutdown()

end

function HGSESkinAttributeAnchorPoint.Activate( path, index, value, spec )

	local i, v, a;
	local add = false;

	HGSESkinAttributeAnchorPoint.anchorPoints = {};

	for i,v in ipairs(HGSESkinAttributeAnchorPoint.anchorPointsList) do
		add = false;
		if ( spec.include ) then
			for _,a in pairs(spec.include) do
				if ( a == v.key ) then
					add = true;
				end
			end
		elseif ( spec.exclude ) then
			add = true;
			for _,a in pairs(spec.exclude) do
				if ( a == v.key ) then
					add = false;
				end
			end
		else
			add = true;
		end
		if ( add == true ) then
			table.insert( HGSESkinAttributeAnchorPoint.anchorPoints, {key=v.key,label=v.label} );
		end
	end

	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeAnchorPointValue", HGSESkinAttributeAnchorPoint.anchorPoints );

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeAnchorPoint.SetValue( value );

	WindowSetShowing( 'HGSE_SkinAttributeAnchorPoint', true );

end

function HGSESkinAttributeAnchorPoint.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeAnchorPoint', false );

end

function HGSESkinAttributeAnchorPoint.SetValue( value )

	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeAnchorPointValue", HGSESkinAttributeAnchorPoint.anchorPoints, value );

end

function HGSESkinAttributeAnchorPoint.GetValue()

	return( HealGridGuiUtility.ComboBoxGetSelected("HGSE_SkinAttributeAnchorPointValue",HGSESkinAttributeAnchorPoint.anchorPoints) );

end

function HGSESkinAttributeAnchorPoint.CheckValue()

	return( HGSESkinAttributeAnchorPoint.GetValue() ~= nil );

end

function HGSESkinAttributeAnchorPoint.ValueToWString( value )

	return( StringToWString(value) );

end

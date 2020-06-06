HGSESkinAttributeAnchor = {};

HGSESkinAttributeAnchor.anchorPointsList =
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

HGSESkinAttributeAnchor.windowNameList = nil;
HGSESkinAttributeAnchor.relativeToList = nil;
HGSESkinAttributeAnchor.pointList = nil;
HGSESkinAttributeAnchor.relativePointList = nil;

function HGSESkinAttributeAnchor.Initialize()

	HGSESkinAttributeAnchor.__index = HGSESkinAttributeAnchor;
	setmetatable( HGSESkinAttributeAnchor, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeAnchor', 'HGSE_SkinAttributeAnchorTemplate', 'HGSE_SkinAttributePanel' );

	LabelSetText( 'HGSE_SkinAttributeAnchorLabelWindowName', L"Window" );
	LabelSetText( 'HGSE_SkinAttributeAnchorLabelRelativeTo', L"RelTo" );
	LabelSetText( 'HGSE_SkinAttributeAnchorLabelPoint', L"Point" );
	LabelSetText( 'HGSE_SkinAttributeAnchorLabelRelativePoint', L"RelPnt" );
	LabelSetText( 'HGSE_SkinAttributeAnchorLabelOffsetX', L"OffX" );
	LabelSetText( 'HGSE_SkinAttributeAnchorLabelOffsetY', L"OffY" );

	WindowSetShowing( 'HGSE_SkinAttributeAnchor', false );

end

function HGSESkinAttributeAnchor.Shutdown()

end

function HGSESkinAttributeAnchor.Activate( path, index, value, spec )

	local i, v, a;
	local add = false;

	-- reset the dropdown lists
	HGSESkinAttributeAnchor.windowNameList = {};
	HGSESkinAttributeAnchor.relativeToList = {};
	HGSESkinAttributeAnchor.pointList = {};
	HGSESkinAttributeAnchor.relativePointList = {};

	-- fill the dropdown lists according to spec
	HGSESkinAttributeAnchor.windowNameList = { {key="SELF", label=L"self"} };
	HGSESkinAttributeAnchor.relativeToList = { {key="PARENT", label=L"parent"} };

	for i,v in ipairs(HGSESkinAttributeAnchor.anchorPointsList) do
		table.insert( HGSESkinAttributeAnchor.pointList, {key=v.key,label=v.label} );
		table.insert( HGSESkinAttributeAnchor.relativePointList, {key=v.key,label=v.label} );
	end

	-- init the dropdown list widget
	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeAnchorValueWindowName", HGSESkinAttributeAnchor.windowNameList );
	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeAnchorValueRelativeTo", HGSESkinAttributeAnchor.relativeToList );
	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeAnchorValuePoint", HGSESkinAttributeAnchor.pointList );
	HealGridGuiUtility.ComboBoxInit( "HGSE_SkinAttributeAnchorValueRelativePoint", HGSESkinAttributeAnchor.relativePointList );

	HGSESkinAttribute.Activate( path, index );
	HGSESkinAttributeAnchor.SetValue( value );

	WindowSetShowing( 'HGSE_SkinAttributeAnchor', true );

end

function HGSESkinAttributeAnchor.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeAnchor', false );

end

function HGSESkinAttributeAnchor.SetValue( value )

	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeAnchorValueWindowName", HGSESkinAttributeAnchor.windowNameList, value.windowName );
	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeAnchorValueRelativeTo", HGSESkinAttributeAnchor.relativeToList, value.relativeTo );
	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeAnchorValuePoint", HGSESkinAttributeAnchor.pointList, value.point );
	HealGridGuiUtility.ComboBoxActivate( "HGSE_SkinAttributeAnchorValueRelativePoint", HGSESkinAttributeAnchor.relativePointList, value.relativePoint );

	TextEditBoxSetText( 'HGSE_SkinAttributeAnchorValueOffsetX', StringToWString(value.offsetX) );
	TextEditBoxSetText( 'HGSE_SkinAttributeAnchorValueOffsetY', StringToWString(value.offsetY) );

end

function HGSESkinAttributeAnchor.GetValue()

	local offsetX, offsetY;
    local offsetXRel = "";
    local offsetYRel = "";
	local windowName = HealGridGuiUtility.ComboBoxGetSelected( "HGSE_SkinAttributeAnchorValueWindowName", HGSESkinAttributeAnchor.windowNameList );
	local relativeTo = HealGridGuiUtility.ComboBoxGetSelected( "HGSE_SkinAttributeAnchorValueRelativeTo", HGSESkinAttributeAnchor.relativeToList );
	local point = HealGridGuiUtility.ComboBoxGetSelected( "HGSE_SkinAttributeAnchorValuePoint", HGSESkinAttributeAnchor.pointList );
	local relativePoint = HealGridGuiUtility.ComboBoxGetSelected( "HGSE_SkinAttributeAnchorValueRelativePoint", HGSESkinAttributeAnchor.relativePointList );
	local offsetXString = TextEditBoxGetText( 'HGSE_SkinAttributeAnchorValueOffsetX' );
	local offsetYString = TextEditBoxGetText( 'HGSE_SkinAttributeAnchorValueOffsetY' );

	if ( wstring.sub(offsetXString,-1) == L'%' ) then
		offsetXRel = "%";
	end

	if ( wstring.sub(offsetYString,-1) == L'%' ) then
		offsetYRel = "%";
	end

	offsetX = tonumber(offsetXString) .. offsetXRel;
	offsetY = tonumber(offsetYString) .. offsetYRel;

	return( { windowName=windowName, relativeTo=relativeTo, point=point, relativePoint=relativePoint, offsetX=offsetX, offsetY=offsetY } );

end

function HGSESkinAttributeAnchor.CheckValue()

	return( HGSESkinAttributeAnchor.GetValue() ~= nil );

end

function HGSESkinAttributeAnchor.ValueToWString( value )

	--	return( StringToWString(value) );
	return( L"Anchor" );

end

HGSESkinAttributeTexture = {};

HGSESkinAttributeTexture.textureList = {};
HGSESkinAttributeTexture.textureOrder = {};

HGSESkinAttributeTexture.selectedTexture = -1;
HGSESkinAttributeTexture.selectedTextureID = nil;

function HGSESkinAttributeTexture.Initialize()

	HGSESkinAttributeTexture.__index = HGSESkinAttributeTexture;
	setmetatable( HGSESkinAttributeTexture, HGSESkinAttribute );

	CreateWindowFromTemplate( 'HGSE_SkinAttributeTexture', 'HGSE_SkinAttributeTextureTemplate', 'HGSE_SkinAttributePanel' );

	WindowSetShowing( 'HGSE_SkinAttributeTexture', false );

end

function HGSESkinAttributeTexture.Shutdown()

end

function HGSESkinAttributeTexture.Activate( path, index, value, spec )

	local i, textureID, textureData;

	HGSESkinAttribute.Activate( path, index );

	-- initialize the list
	for i,textureID in ipairs(HealGridSkin.TextureGetList()) do
		textureData = HealGridSkin.TextureGet( textureID );

		if ( textureID == value ) then
			HGSESkinAttributeTexture.selectedTexture = i;
			HGSESkinAttributeTexture.selectedTextureID = value;
		end

		HGSESkinAttributeTexture.textureList[i] = {};
		HGSESkinAttributeTexture.textureList[i].textureID = textureID;
		HGSESkinAttributeTexture.textureList[i].label = textureData.label;

		HGSESkinAttributeTexture.textureOrder[i] = i;
	end

	-- editable ?
	if ( spec.editable == nil or spec.editable == true ) then
		-- may edit
	else
		--	may not edit
	end

	HGSESkinAttributeTexture.SetValue( value );

	WindowSetShowing( 'HGSE_SkinAttributeTexture', true );

end

function HGSESkinAttributeTexture.DeActivate()

	HGSESkinAttribute.DeActivate();

	WindowSetShowing( 'HGSE_SkinAttributeTexture', false );

end

function HGSESkinAttributeTexture.SetValue( value )

	HGSESkinAttributeTexture.selectedTextureID = value;

	ListBoxSetDisplayOrder( "HGSE_SkinAttributeTextureList", HGSESkinAttributeTexture.textureOrder );
	HGSESkinAttributeTexture.TextureDetails();

end

function HGSESkinAttributeTexture.GetValue()

	return( HGSESkinAttributeTexture.selectedTextureID );

end

function HGSESkinAttributeTexture.CheckValue()

	return( true );

end

function HGSESkinAttributeTexture.ValueToWString( value )

	return( StringToWString(value) );

end

function HGSESkinAttributeTexture.PopulateList()

	local color;

	-- highlight selected (and reset others)
	for row,item in ipairs(HGSE_SkinAttributeTextureList.PopulatorIndices) do
		if ( item == HGSESkinAttributeTexture.selectedTexture ) then
			color = RMetColor.DARK_GOLDENROD;
		else
			color = HealGridGuiUtility.GetAlternatingRowColor( math.mod(row,2) );
		end
		HealGridUtility.WindowSetTintColor( 'HGSE_SkinAttributeTextureListRow'..row..'Background', color );
	end

end

function HGSESkinAttributeTexture.TextureSelected()

	local rowNum, listItem;

	rowNum = WindowGetId( SystemData.ActiveWindow.name );
	listItem = HGSE_SkinAttributeTextureList.PopulatorIndices[rowNum];

	HGSESkinAttributeTexture.selectedTexture = listItem;
	HGSESkinAttributeTexture.selectedTextureID = HGSESkinAttributeTexture.textureList[listItem].textureID;

	HGSESkinAttributeTexture.PopulateList();
	HGSESkinAttributeTexture.TextureDetails();

end

function HGSESkinAttributeTexture.TextureDetails()

	local info = nil;
	local tag = nil;
	local textureData = HealGridSkin.TextureGet( HGSESkinAttributeTexture.selectedTextureID );

	WindowSetDimensions( 'HGSE_SkinAttributeTexturePreview', textureData.dims.w, textureData.dims.h );
	HealGridUtility.DynamicImageSetTexture( 'HGSE_SkinAttributeTexturePreview', HGSESkinAttributeTexture.selectedTextureID, 'TILE' );

	info = wstring.format( L"%dx%d : ", textureData.dims.w, textureData.dims.h );
	info = info .. StringToWString( table.concat(textureData.tags,", ") );
	LabelSetText( 'HGSE_SkinAttributeTextureInfo', info );

end

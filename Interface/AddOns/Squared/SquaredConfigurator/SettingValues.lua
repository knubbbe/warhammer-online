-- DO NOT CHANGE THESE FOR LOCALIZATION - change the ones below!

SquaredConfigurator.directions = {
    [1]="right",
    [2]="left",
    [3]="up",
    [4]="down",
}
for k,v in ipairs(SquaredConfigurator.directions) do
    SquaredConfigurator.directions[v]=k
end

SquaredConfigurator.modifierkeys = {
    [1]="alt",
    [2]="ctrl",
    [3]="shift",
}
for k,v in ipairs(SquaredConfigurator.modifierkeys) do
    SquaredConfigurator.modifierkeys[v]=k
end    

SquaredConfigurator.positions = {
    [1]="right",
    [2]="left",
    [3]="top",
    [4]="bottom",
    [5]="center",
    [6]="topleft",
    [7]="topright",
    [8]="bottomleft",
    [9]="bottomright",
}
for k,v in ipairs(SquaredConfigurator.positions) do
    SquaredConfigurator.positions[v]=k
end

SquaredConfigurator.textaligns = {
    [1]="rightcenter",
    [2]="leftcenter",
    [3]="top",
    [4]="bottom",
    [5]="center",
    [6]="left",
    [7]="right",
    [8]="bottomleft",
    [9]="bottomright",
}
for k,v in ipairs(SquaredConfigurator.textaligns) do
    SquaredConfigurator.textaligns[v]=k
end

SquaredConfigurator.textpositions = {
    [1]="center",
    [2]="top",
    [3]="bottom",
    [4]="none",
}
for k,v in ipairs(SquaredConfigurator.textpositions) do
    SquaredConfigurator.textpositions[v]=k
end

SquaredConfigurator.fonts = {
    [1]="font_clear_tiny",
    [2]="font_clear_small_bold",
    [3]="font_clear_small",
    [4]="font_clear_medium_bold",
    [5]="font_clear_medium",
    [6]="font_clear_large_bold",
    [7]="font_clear_large",
	[8]="font_default_text_small",
	[9]="font_default_text",
	[10]="font_default_text_large",
	[11]="font_default_text_huge",
	[12]="font_journal_text",
	[13]="font_heading_large",
}
for k,v in ipairs(SquaredConfigurator.fonts) do
    SquaredConfigurator.fonts[v]=k
end

SquaredConfigurator.colorsettings = {
    [1]="fgcolor",
    [2]="bgcolor",
    [3]="bordercolor",
    [4]="groupbordercolor",
    [5]="targetbordercolor",
    [6]="leaderbordercolor",
    [7]="assistbordercolor",
    [8]="textcolor-top",
    [9]="textcolor",
    [10]="textcolor-bottom",
}
for k,v in ipairs(SquaredConfigurator.colorsettings) do
    SquaredConfigurator.colorsettings[v]=k
end

SquaredConfigurator.statusposes = {
    [1]="topleft",
    [2]="topright",
    [3]="bottomleft",
    [4]="bottomright",
    [5]="none",
}
for k,v in ipairs(SquaredConfigurator.statusposes) do
    SquaredConfigurator.statusposes[v]=k
end

SquaredConfigurator.textures = {}
SquaredConfigurator.textureNames = {}
local LSA = LibStub("LibSharedAssets")
if LSA then
	SquaredConfigurator.textures = LSA:GetTextureList() or {}
	table.sort(SquaredConfigurator.textures)
	for k,v in ipairs(SquaredConfigurator.textures) do
		SquaredConfigurator.textures[v]=k
		local metadata= LSA:GetMetadata(v)
		if metadata and metadata.displayname then
			SquaredConfigurator.textureNames[k] = towstring(metadata.displayname)
		else
			SquaredConfigurator.textureNames[k] = towstring(v)
		end
	end
end

-- THE ONES BELOW CAN BE CHANGED FOR LOCALIZATION

SquaredConfigurator.directionNames = {
    [1]=L"right",
    [2]=L"left",
    [3]=L"up",
    [4]=L"down",
}

SquaredConfigurator.positionNames = {
    [1]=L"right",
    [2]=L"left",
    [3]=L"top",
    [4]=L"bottom",
    [5]=L"center",
    [6]=L"upper left",
    [7]=L"upper right",
    [8]=L"lower left",
    [9]=L"lower right",
}

SquaredConfigurator.textpositionNames = {
    [1]=L"middle",
    [2]=L"upper",
    [3]=L"lower",
    [4]=L"not shown",
}

SquaredConfigurator.fontNames = {
    [1]=L"tiny",
    [2]=L"small bold",
    [3]=L"small",
    [4]=L"medium bold",
    [5]=L"medium",
    [6]=L"large bold",
    [7]=L"large",
	[8]=L"small AoR",
	[9]=L"medium AoR",
	[10]=L"large AoR",
	[11]=L"huge AoR",
	[12]=L"cronos",
	[13]=L"heading",
}

SquaredConfigurator.colorsettingNames = {
    [1]=L"Bar Foreground",
    [2]=L"Bar Background",
    [3]=L"Border",
    [4]=L"Border (My Group)",
    [5]=L"Border (My Target)",
    [6]=L"Border (Group Lead)",
    [7]=L"Border (Main Assist)",
    [8]=L"Upper Text",
    [9]=L"Middle Text",
    [10]=L"Lower Text",
}

SquaredConfigurator.statusposNames = {
    [1]=L"upper left",
    [2]=L"upper right",
    [3]=L"lower left",
    [4]=L"lower right",
    [5]=L"disabled",
}
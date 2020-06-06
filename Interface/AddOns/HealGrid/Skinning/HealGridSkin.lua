HealGridSkin = {};

HealGridSkin.BASE_SKIN_ID = 'HEALGRID_BASE';

HealGridSkin.skins = {};							-- table with all registered skins
HealGridSkin.textures = {};							-- table with all textures
HealGridSkin.comboBoxList = nil;
HealGridSkin.textureList = {};						-- sorted list of textures { n = textureID, .. }

-- ==============================================================================================
-- Initializes the skin
-- type: PUBLIC
-- ==============================================================================================
function HealGridSkin.Initialize()

	if ( HealGridSkinModification == nil ) then
		HealGridSkinModification = {};
	end

	if ( HealGridSkinModification.skins == nil ) then
		HealGridSkinModification.skins = {};
	end

	HealGridSkin.PrepareSkinDefinition( HealGridSkinDefinition );

end

-- ==============================================================================================
-- program shutdown
-- type: PUBLIC
-- ==============================================================================================
function HealGridSkin.Shutdown()

end

-- ==============================================================================================
-- Prepares the skin defintion (e.g. merges the inherits)
-- recurses
-- type: PRIVATE
-- ==============================================================================================
function HealGridSkin.PrepareSkinDefinition( t )

	local k, h, i, v;

	for k,_ in ipairs(t) do
		if ( type(t[k]) == 'table' ) then
			if ( t[k]._inherit ~= nil ) then
				for h,_ in ipairs(t[k]._inherit) do
					for i,v in ipairs(HealGridSkinInherits[t[k]._inherit[h]]) do
						table.insert( t[k], RMetUtility.CopyTable(v) );
					end
				end
				t[k]._inherit = nil;
			end

			HealGridSkin.PrepareSkinDefinition( t[k] );
		end
	end

end

-- ==============================================================================================
-- Recursively sets the meta tables
-- type: PRIVATE
-- ==============================================================================================
function HealGridSkin.SetMetaTable( skin, parentSkin, idx )

	-- all the table/array entries of the passed skin
	for k,_ in pairs(skin) do
		if ( type(skin[k]) == 'table' and k ~= '__index' ) then
			if ( parentSkin == nil ) then
				skin[k].__index = skin[k];
				HealGridSkin.SetMetaTable( skin[k], nil, k );
			elseif ( parentSkin[k] == nil )  then
				d( 'HealGridSkin.SetMetaTable(): parent skin for index '..k..' is NIL' );
			else
				skin[k].__index = skin[k];
				setmetatable( skin[k], parentSkin[k] );
				HealGridSkin.SetMetaTable( skin[k], parentSkin[k], k );
			end
		end
	end

end

-- ==============================================================================================
-- checks params and raises error
-- type: PRIVATE
-- ==============================================================================================
function HealGridSkin.CheckParams( funcTxt, silent, skinTable, skinID, sectionID, s1, s2, s3, s4, s5, s6, s7, s8, s9 )

	local err = -1;

	if ( skinID ~= nil and skinTable.skins[skinID] == nil ) then
		err = 0;
	elseif ( sectionID ~= nil and skinTable.skins[skinID][sectionID] == nil ) then
		err = 0;
	elseif ( s1 ~= nil and skinTable.skins[skinID][sectionID][s1] == nil ) then
		err = 1;
	elseif ( s2 ~= nil and skinTable.skins[skinID][sectionID][s1][s2] == nil ) then
		err = 2;
	elseif ( s3 ~= nil and skinTable.skins[skinID][sectionID][s1][s2][s3] == nil ) then
		err = 3;
	elseif ( s4 ~= nil and skinTable.skins[skinID][sectionID][s1][s2][s3][s4] == nil ) then
		err = 4;
	elseif ( s5 ~= nil and skinTable.skins[skinID][sectionID][s1][s2][s3][s4][s5] == nil ) then
		err = 5;
	elseif ( s6 ~= nil and skinTable.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6] == nil ) then
		err = 6;
	elseif ( s7 ~= nil and skinTable.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7] == nil ) then
		err = 7;
	elseif ( s8 ~= nil and skinTable.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7][s8] == nil ) then
		err = 7;
	elseif ( s9 ~= nil and skinTable.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7][s8][s9] == nil ) then
		err = 9;
	end

	if ( err >= 0 and silent == false ) then
		d( "==============================================" );
		d( "HealGridSkin."..funcTxt..": Invalid index S"..err );
		d( (skinID or 'NIL')..'/'..(sectionID or 'NIL')..'/'..(s1 or 'NIL')..'/'..(s2 or 'NIL')..'/'..(s3 or 'NIL')..'/'..(s4 or 'NIL')..'/'..(s5 or 'NIL')..'/'..
																(s6 or 'NIL')..'/'..(s7 or 'NIL')..'/'..(s8 or 'NIL')..'/'..(s9 or 'NIL') );

	end

	return( err < 0 );

end

-- ==============================================================================================
-- Register a new skin
-- type: PUBLIC
--
-- The skin it is derived from or nil. Parent skins are used to lookup missing values
-- ==============================================================================================

function HealGridSkin.RegisterSkin( skin, parentSkinID )

	local skinID;

	if ( skin == nil ) then
		d( 'HealGridSkin.RegisterSkin(): parameter skin == nil' );
	elseif ( skin.skin == nil or skin.skin.name == nil or skin.skin.name == "" ) then
		d( 'HealGridSkin.RegisterSkin(): passed skin does not have a name' );
	elseif ( HealGridSkin.skins[skin.skin.name] ~= nil ) then
		d( 'HealGridSkin.RegisterSkin(): skin '..skin.skin.name..' already registered' );
	elseif ( parentSkinID == nil and skin.skin.id ~= HealGridSkin.BASE_SKIN_ID ) then
		d( 'HealGridSkin.RegisterSkin(): parameter parentSkin == nil' );
	else
		skinID = skin.skin.id;

		HealGridSkin.skins[skinID] = skin;

		HealGridSkin.skins[skinID].__index = HealGridSkin.skins[skinID];
		if ( parentSkinID ~= nil ) then
			setmetatable( HealGridSkin.skins[skinID], HealGridSkin.skins[parentSkinID] );
		end
		HealGridSkin.SetMetaTable( HealGridSkin.skins[skinID], HealGridSkin.skins[parentSkinID], 'ROOT' );			-- recursively apply to skin
	end

end

-- ==============================================================================================
-- Get the skin table
-- type: PUBLIC
--
-- returns the skin-table for the passed name of the skin
-- ==============================================================================================

function HealGridSkin.GetSkin( skinID )

	if ( skinID ~= nil and skinID ~= HealGridSkin.BASE_SKIN_ID and HealGridSkin.skins[skinID] ) then
		return( HealGridSkin.skins[skinID] );
	end

	return( HealGridSkin.skins['SHARP_MEDIUM'] );

end

-- ==============================================================================================
-- Returns a value (leaf) from a skin
-- type: PUBLIC
--
-- returns a leaf-value of the skin
-- ==============================================================================================

function HealGridSkin._GetSkinValue( raw, silent, skinID, sectionID, s1, s2, s3, s4, s5, s6, s7, s8, s9 )

 	local table;
	local rtc =  nil;
	local hasMod = false;

	if ( skinID == nil or skinID == HealGridSkin.BASE_SKIN_ID or (not HealGridSkin.skins[skinID]) ) then
		skinID = 'SHARP_MEDIUM';
	end

	if ( not HealGridSkin.CheckParams('_GetSkinValue',silent,HealGridSkin,skinID,sectionID,s1,s2,s3,s4,s5,s6,s7,s8,s9) ) then
		return( nil );
	end

	if ( raw == false and HealGridSkin.CheckParams('_GetSkinValue[2]',true,HealGridSkinModification,skinID,sectionID,s1,s2,s3,s4,s5,s6,s7,s8,s9) ) then
		hasMod = true;
	end

	if ( raw == false and hasMod ) then
		table = HealGridSkinModification;
	else
		table = HealGridSkin;
	end

	if ( s9 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7][s8][s9] );
	elseif ( s8 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7][s8] );
	elseif ( s7 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7] );
	elseif ( s6 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6] );
	elseif ( s5 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2][s3][s4][s5] );
	elseif ( s4 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2][s3][s4] );
	elseif ( s3 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2][s3] );
	elseif ( s2 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1][s2] );
	elseif ( s1 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID][s1] );
	elseif ( subSectionID ~= nil ) then
		rtc = HealGridUtility.CopyVariable( table.skins[skinID][sectionID] );
	else
		rtc = HealGridUtility.CopyVariable( table.skins[skinID] );
	end

	return( rtc );

end

function HealGridSkin.GetSkinValue( skinID, sectionID, s1, s2, s3, s4, s5, s6, s7, s8, s9 )

	return( HealGridSkin._GetSkinValue(false,false,skinID,sectionID,s1,s2,s3,s4,s5,s6,s7,s8,s9) );

end

function HealGridSkin.GetSkinValueRaw( skinID, sectionID, s1, s2, s3, s4, s5, s6, s7, s8, s9 )

	return( HealGridSkin._GetSkinValue(true,false,skinID,sectionID,s1,s2,s3,s4,s5,s6,s7,s8,s9) );

end

function HealGridSkin.GetSkinValueByPath( skinID, path )

	local elem;
	local arr = {};

	if ( path:sub(1,6) == '.root.' ) then
		path = path:sub( 7 );
	elseif ( path:sub(1,5) == 'root.' ) then
		path = path:sub( 6 );
	elseif ( path:sub(1,1) == '.' ) then
		path = path:sub( 2 );
	end

	for elem in path:gmatch("[^%.]+") do
		table.insert( arr, elem );
	end

	return( HealGridSkin.GetSkinValue(skinID,unpack(arr)) );
 
end

function HealGridSkin.GetSkinValueRawByPath( skinID, path )

	local elem;
	local arr = {};

	if ( path:sub(1,6) == '.root.' ) then
		path = path:sub( 7 );
	elseif ( path:sub(1,5) == 'root.' ) then
		path = path:sub( 6 );
	elseif ( path:sub(1,1) == '.' ) then
		path = path:sub( 2 );
	end

	for elem in path:gmatch("[^%.]+") do
		table.insert( arr, elem );
	end

	return( HealGridSkin.GetSkinValueRaw(skinID,unpack(arr)) );
 
end

-- ==============================================================================================
-- Returns a value (leaf) from a skin modification
-- type: PUBLIC
--
-- returns a leaf-value of the skin
-- ==============================================================================================

function HealGridSkin._GetSkinModificationValue( skinID, sectionID, s1, s2, s3, s4, s5, s6, s7, s8, s9 )

	local rtc =  nil;

	if ( not HealGridSkin.CheckParams('_GetSkinModificationValue',true,HealGridSkinModification,skinID,sectionID,s1,s2,s3,s4,s5,s6,s7,s8,s9) ) then
		return( nil );
	end

	if ( s9 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7][s8][s9] );
	elseif ( s8 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7][s8] );
	elseif ( s7 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6][s7] );
	elseif ( s6 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2][s3][s4][s5][s6] );
	elseif ( s5 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2][s3][s4][s5] );
	elseif ( s4 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2][s3][s4] );
	elseif ( s3 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2][s3] );
	elseif ( s2 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1][s2] );
	elseif ( s1 ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID][s1] );
	elseif ( subSectionID ~= nil ) then
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID][sectionID] );
	else
		rtc = HealGridUtility.CopyVariable( HealGridSkinModification.skins[skinID] );
	end

	return( rtc );

end

function HealGridSkin.GetSkinModificationValue( skinID, sectionID, s1, s2, s3, s4, s5, s6, s7, s8, s9 )

	return( HealGridSkin._GetSkinValue(skinID,sectionID,s1,s2,s3,s4,s5,s6,s7,s8,s9) );

end

function HealGridSkin.GetSkinModificationValueByPath( skinID, path )

	local elem;
	local arr = {};

	if ( path:sub(1,6) == '.root.' ) then
		path = path:sub( 7 );
	elseif ( path:sub(1,5) == 'root.' ) then
		path = path:sub( 6 );
	elseif ( path:sub(1,1) == '.' ) then
		path = path:sub( 2 );
	end

	for elem in path:gmatch("[^%.]+") do
		table.insert( arr, elem );
	end

	return( HealGridSkin.GetSkinValue(skinID,unpack(arr)) );
 
end

-- ==============================================================================================
-- sets (modifies) a skin value
-- type: PUBLIC
--
-- returns nothing
-- ==============================================================================================

function HealGridSkin.ModifySkinValue( skinID, value, skinSectionID, s1, s2, s3, s4, s5, s6, s7, s8, s9 )

	-- TODO (if required)

end

function HealGridSkin.ModifySkinValueByPath( skinID, value, path )

	local pos;
	local elem;
	local tablePtr;
	local valueIndex;

	-- --- valid skin
	if ( skinID == nil or skinID == HealGridSkin.BASE_SKIN_ID or (not HealGridSkin.skins[skinID]) ) then
		return;
	end

	-- --- check if the value is the same as the skin value
	if ( HealGridUtility.CompareValues( value, HealGridSkin.GetSkinValueRawByPath(skinID,path) ) == true ) then
		return;
	end

	-- --- normalize path
	if ( path:sub(1,6) == '.root.' ) then
		path = path:sub( 7 );
	elseif ( path:sub(1,5) == 'root.' ) then
		path = path:sub( 6 );
	elseif ( path:sub(1,1) == '.' ) then
		path = path:sub( 2 );
	end

	-- --- remove last field from path (value field)
	pos = path:len( path );
	while ( pos > 0 and path:sub(pos,pos) ~= '.' ) do
		pos = pos - 1;
	end

	valueIndex = path:sub( pos+1 );
	path = path:sub( 1, pos-1 );

	-- --- create skin-entry, if needed
	if ( HealGridSkinModification.skins[skinID] == nil ) then
		HealGridSkinModification.skins[skinID] = {};
	end

	-- --- create "path" in array
	tablePtr = HealGridSkinModification.skins[skinID];
	for elem in path:gmatch("[^%.]+") do
		if ( tablePtr[elem] == nil ) then
			tablePtr[elem] = {};
		end
		tablePtr = tablePtr[elem];
	end

	-- --- set the value
	tablePtr[valueIndex] = HealGridUtility.CopyVariable( value );

end

-- ==============================================================================================
-- removes a modification (tree)
-- type: PUBLIC
--
-- returns nothing
-- ==============================================================================================

function HealGridSkin.RemoveSkinModification( skinID )

	if ( HealGridSkinModification.skins and HealGridSkinModification.skins[skinID] ) then
		HealGridSkinModification.skins[skinID] = nil;
	end

end

-- ==============================================================================================
-- Sets the skins for a combo box
-- type: PUBLIC
--
-- returns nothing
-- ==============================================================================================

function HealGridSkin.ComboBoxSetChoices( comboBoxName, selectedSkinID )

	local k, i;

	if ( HealGridSkin.comboBoxList == nil ) then
		HealGridSkin.comboBoxList = {};
		for k,_ in pairs(HealGridSkin.skins) do
			if ( k ~= HealGridSkin.BASE_SKIN_ID ) then
				table.insert( HealGridSkin.comboBoxList, k );
			end
		end
		table.sort( HealGridSkin.comboBoxList, function(a,b) return( HealGridSkin.skins[a].skin.sortCriteria < HealGridSkin.skins[b].skin.sortCriteria ); end );
	end

	ComboBoxClearMenuItems( comboBoxName );
	
	for i,k in ipairs(HealGridSkin.comboBoxList) do
		ComboBoxAddMenuItem( comboBoxName, HealGridSkin.skins[k].skin.name );
		if ( selectedSkinID ~= nil and selectedSkinID == k ) then
			ComboBoxSetSelectedMenuItem( comboBoxName, i );
		end
	end

end

function HealGridSkin.ComboBoxGetSelected( comboBoxName )

	local item = ComboBoxGetSelectedMenuItem( comboBoxName );

	return( HealGridSkin.comboBoxList[item] );

end

-- ==============================================================================================
-- Register a texture
-- type: PUBLIC
--
-- returns nothing
-- ==============================================================================================

function HealGridSkin.TextureRegister( id, texture, label, dims, tags )

	HealGridSkin.textures[id] = { id=id, texture=texture, label=label, dims=dims, tags=tags };

	table.insert( HealGridSkin.textureList, id );

end

-- ==============================================================================================
-- Get a texture by its id
-- type: PUBLIC
--
-- returns nothing
-- ==============================================================================================

function HealGridSkin.TextureGet( id )

	if ( HealGridSkin.textures[id] ) then
		return( HealGridSkin.textures[id] );
	else
		d( 'HealGridSkin.TextureGet(): Unknown texture id: '..id );
		return( HealGridSkin.textures.WARTintSquare );
	end

end

-- ==============================================================================================
-- Get a sorted list of the textures (contains "pointers" to the real texture!)
-- type: PUBLIC
--
-- returns nothing
-- ==============================================================================================

function HealGridSkin.TextureGetList()

	return( HealGridSkin.textureList );

end

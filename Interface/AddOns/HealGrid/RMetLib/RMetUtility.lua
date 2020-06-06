RMetUtility = {};

RMetUtility.__index = RMetUtility;

-- =========================================================================================================================
--   Format Version
-- =========================================================================================================================

function RMetUtility.WFormatVersion( v )

	local major, minor, build;

	build = v % 1000;
	minor = math.floor( (v % 1000000) / 1000 );
	major = math.floor( v / 1000000 );

	return( wstring.format(L"v%d.%d.%d",major,minor,build) );

end

-- =========================================================================================================================
--   Table Utility
-- =========================================================================================================================

function RMetUtility.IsEmptyTable( t )

  if ( t == nil or next(t) == nil ) then
    return( true );
  end

  return( false );

end

function RMetUtility.TableSize( t )

  local s = 0;

  if ( not t ) then
    return( nil );
  end

  for _ in pairs(t) do
    s = s + 1;
  end

  return( s );

end


function RMetUtility.CloneTable( src, dest )

	local k;

	if ( next(dest) ~= nil ) then	
		for k,_ in pairs(dest) do						-- dest = {} DOES NOT WORK !
			dest[k] = nil;
		end
	end

	for k,_ in pairs(src) do
		if ( k == '__index' ) then
			dest[k] = src[k];
		elseif ( type(src[k]) == 'table' ) then
			dest[k] = {};
			RMetUtility.CloneTable( src[k], dest[k] );
		else
			dest[k] = src[k];
		end
	end

end

function RMetUtility.CopyTable( src )

  local k;
  local dest = {};

  for k,_ in pairs(src) do
    if ( k == '__index' ) then
      dest[k] = src[k];
    elseif ( type(src[k]) == 'table' ) then
      dest[k] = RMetUtility.CopyTable( src[k] );
    else
      dest[k] = src[k];
    end
  end

  return( dest );

end

function RMetUtility.CopyTableIntoTable( src, dest )

  local k;

  if ( not (src and dest) ) then
    return;
  end

  for k in pairs(src) do
    if ( k == '__index' ) then
      dest[k] = src[k];
    elseif ( type(src[k]) == 'table' ) then
      if ( type(dest[k]) ) then
        RMetUtility.CopyTableIntoTable( src[k], dest[k] );
      else
        d( "RMetUtility.CopyTableIntoTable(): Destination table misses subtable "..k.."." );
      end
    else
      dest[k] = src[k];
    end
  end

end

function RMetUtility.SwapTableElements( table, key1, key2 )

  local elem;

  elem = table[key1];
  table[key1] = table[key2];
  table[key2] = elem;

end

-- =====================================================================================================
-- CopyVariable
-- =====================================================================================================

function RMetUtility.CopyVariable( src )

	if ( type(src) == 'table' ) then
		return( RMetUtility.CopyTable(src) );
	else
		return( src );
	end

end

-- =====================================================================================================
-- CompareValue
-- =====================================================================================================

function RMetUtility.CompareValues( a, b )

    local rtc = true;

    if ( type(a) == 'table' and type(b) == 'table' ) then
        if ( #a ~= #b ) then
            return( false );
        end
        for k,_ in pairs(a) do
			if ( k == '__index' ) then
				-- nop;			-- could check if the meta-table are the same
			elseif ( RMetUtility.CompareValues(a[k],b[k]) == false ) then
                return( false );
            end
        end
        return( true );
    elseif ( type(a) == 'table' ) then
        return( false );
    elseif ( type(b) == 'table' ) then
        return( false );
    else
        return( a == b );
    end

end

-- =====================================================================================================
-- WStringChop
-- =====================================================================================================

function RMetUtility.WStringChop( ws )

	return( wstring.match(ws,L"([^\^]+).*") );
--	return( wstring.sub(ws,1,wstring.len(ws)-2) );

end

-- =====================================================================================================
-- TierToString
-- =====================================================================================================

function RMetUtility.TierToString( unitTier )

    if ( GameDefs.TIER_NAMES[unitTier] ~= nil ) then
        return( GameDefs.TIER_NAMES[unitTier] );
    end

    return( L'unknown' );

end

-- =====================================================================================================
-- Label color
-- =====================================================================================================

function RMetUtility.LabelSetTextColor( frameName, colorR, colorG, colorB )

    local t = type( colorR );

    if ( t == 'string' ) then
        LabelSetTextColor( frameName, RMetColor[colorR].r, RMetColor[colorR].g, RMetColor[colorR].b );
    elseif ( t == 'table' ) then
        LabelSetTextColor( frameName, colorR.r, colorR.g, colorR.b );
    else
        LabelSetTextColor( frameName, colorR, colorG, colorB );
    end

end

-- =====================================================================================================
-- Tint Color
-- =====================================================================================================

function RMetUtility.WindowSetTintColor( frameName, colorR, colorG, colorB )

    local t = type( colorR );

    if ( t == 'string' ) then
        WindowSetTintColor( frameName, RMetColor[colorR].r, RMetColor[colorR].g, RMetColor[colorR].b );
    elseif ( t == 'table' ) then
        WindowSetTintColor( frameName, colorR.r, colorR.g, colorR.b );
    else
        WindowSetTintColor( frameName, colorR, colorG, colorB );
    end

end

-- =====================================================================================================
-- Checking if certain modifier keys are pressed
-- =====================================================================================================

function RMetUtility.IsShiftPressed( flags )

	return( flags == SystemData.ButtonFlags.SHIFT or
	        flags == SystemData.ButtonFlags.SHIFT + SystemData.ButtonFlags.CONTROL or
	        flags == SystemData.ButtonFlags.SHIFT + SystemData.ButtonFlags.ALT or
	        flags == SystemData.ButtonFlags.SHIFT + SystemData.ButtonFlags.CONTROL + SystemData.ButtonFlags.ALT );

end

function RMetUtility.IsControlPressed( flags )

	return( flags == SystemData.ButtonFlags.CONTROL or
	        flags == SystemData.ButtonFlags.CONTROL + SystemData.ButtonFlags.SHIFT or
	        flags == SystemData.ButtonFlags.CONTROL + SystemData.ButtonFlags.ALT or
	        flags == SystemData.ButtonFlags.CONTROL + SystemData.ButtonFlags.SHIFT + SystemData.ButtonFlags.ALT );

end

function RMetUtility.IsAltPressed( flags )

	return( flags == SystemData.ButtonFlags.ALT or
	        flags == SystemData.ButtonFlags.ALT + SystemData.ButtonFlags.SHIFT or
	        flags == SystemData.ButtonFlags.ALT + SystemData.ButtonFlags.CONTROL or
	        flags == SystemData.ButtonFlags.ALT + SystemData.ButtonFlags.SHIFT + SystemData.ButtonFlags.CONTROL );

end

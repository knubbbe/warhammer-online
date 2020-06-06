HealGridTags = {


	tags = {};
	tagLabels = {};
	tagsGUI = {};
	paramFuncs = {	[L"len"]   = {funcName='ProcessTagLen',  func=nil},
					[L"pre"]   = {funcName='ProcessTagPre',  func=nil},
					[L"post"]  = {funcName='ProcessTagPost', func=nil},
					[L"empty"] = {funcName='ProcessTagEmpty',func=nil},
					[L"upper"] = {funcName='ProcessTagUpper',func=nil},
					[L"lower"] = {funcName='ProcessTagLower',func=nil},
				 };

}

-- =========================================================================================================================
--   Initialize
-- =========================================================================================================================

function HealGridTags.Initialize()

	local k, c;

	HealGridTags.tags.name				= { label=L'name',           
											chapter=1,  
											func=HealGridTags.Name,               
											description=L"The name of the player or monster"};
	HealGridTags.tags.name3				= { label=L'name3',          
											chapter=1,  
											func=HealGridTags.Name3,              
											description=L"The first three letters of the players or monsters name"};
	HealGridTags.tags.name5				= { label=L'name5',          
											chapter=1,  
											func=HealGridTags.Name5,              
											description=L"The first five letters of the players or monsters name"};
	HealGridTags.tags.career			= { label=L'career',          
											chapter=1,  
											func=HealGridTags.Career,              
											description=L"The career of the player or monster"};
	HealGridTags.tags.careershort		= { label=L'careershort',     
											chapter=1,  
											func=HealGridTags.CareerShort,         
											description=L"The abbrevation of the career"};
	HealGridTags.tags.currhealth		= { label=L'hp',     
											chapter=1,  
											func=HealGridTags.CurrentHealth,      
											description=L"The current health, as an absolute number"};
	HealGridTags.tags.maxhealth			= { label=L'hpmax',      
											chapter=1,  
											func=HealGridTags.MaxHealth,          
											description=L"The maximum health, as an absolute number"};
	HealGridTags.tags.perchealth		= { label=L'hpperc',     
											chapter=1,  
											func=HealGridTags.HealthPercentage,   
											description=L"The current health, as a percentage value"};
	HealGridTags.tags.missinghealth		= { label=L'hpmissing',  
											chapter=1,  
											func=HealGridTags.MissingHealth,      
											description=L"The missing health, as an absolute number"};
	HealGridTags.tags.curractionpoints	= { label=L'ap',       
											chapter=1,  
											func=HealGridTags.CurrentActionPoints,        
											description=L"The current action points, as an absolute number"};
	HealGridTags.tags.maxactionpoints	= { label=L'apmax',        
											chapter=1,  
											func=HealGridTags.MaxActionPoints,            
											description=L"The maximum action points, as an absolute number"};
	HealGridTags.tags.percactionpoints	= { label=L'apperc',       
											chapter=1,  
											func=HealGridTags.ActionPointsPercentage,     
											description=L"The current action points, as a percentage value"};
	HealGridTags.tags.missingactionpoints= { label=L'apmissing',    
											chapter=1,  
											func=HealGridTags.MissingActionPoints,        
											description=L"The missing action points, as an absolute number"};
	HealGridTags.tags.moraleLevel		= { label=L'ml',    
											chapter=1,  
											func=HealGridTags.MoraleLevel,        
											description=L"The current morale level of the unit (if provided)"};
	HealGridTags.tags.moraleLevelX		= { label=L'mlx',    
											chapter=1,  
											func=HealGridTags.MoraleLevelX,
											description=L"The current morale level of the unit as X'es"};
	HealGridTags.tags.careerpoints		= { label=L'cp',    
											chapter=1,  
											func=HealGridTags.CareerPoints,        
											description=L"The career points for careers with career points (AVATAR ONLY)"};
	HealGridTags.tags.careerpointsmax	= { label=L'cpmax',    
											chapter=1,  
											func=HealGridTags.CareerPointsMax,        
											description=L"The maximum career points for careers with career points (AVATAR ONLY)"};
	HealGridTags.tags.level				= { label=L'level',          
											chapter=1,  
											func=HealGridTags.Level,              
											description=L"The level of the unit"};
	HealGridTags.tags.levelDifference	= { label=L'leveldiff',      
											chapter=1,  
											func=HealGridTags.LevelDifference,    
											description=L"The level difference between the player and the unit"};
	HealGridTags.tags.tier				= { label=L'tier', 
											chapter=1,  
											func=HealGridTags.Tier,     
											description=L"The tier of the unit: elite, hero, rare, ..."};
	HealGridTags.tags.tiersign			= { label=L'tiersign', 
											chapter=1, 
											func=HealGridTags.TierSign, 
											description=L"The tier of the unit, in signs (+,x,*)"};
	HealGridTags.tags.lom				= { label=L'lom',            
											chapter=1, 
											func=HealGridTags.LowOnMana,           
											description=L"Prints a 'm' if the unit is low on mana (below 40%) and 'M' for oom"};
	HealGridTags.tags.oom				= { label=L'oom',            
											chapter=1, 
											func=HealGridTags.OutOfMana,           
											description=L"Prints a 'M' if the unit is out of mana (below 20%)"};
	HealGridTags.tags.groupleader		= { label=L'groupleader',            
											chapter=1, 
											func=HealGridTags.GroupLeader,           
											description=L"Prints a L if the unit is the group leader"};
	HealGridTags.tags.mainassist		= { label=L'mainassist',            
											chapter=1, 
											func=HealGridTags.MainAssist,           
											description=L"Prints an A if the unit is the main assist"};
	HealGridTags.tags.stance			= { label=L'stance',            
											chapter=1, 
											func=HealGridTags.Stance,           
											description=L"The stance of the unit. Returns nothing if the unit has no stances."};

	for k in pairs(HealGridTags.tags) do
		HealGridTags.tagLabels[HealGridTags.tags[k].label] = k;
		table.insert( HealGridTags.tagsGUI, k );
	end

	table.sort( HealGridTags.tagsGUI, HealGridTags.SortTagsGUI );

	for k in pairs(HealGridTags.paramFuncs) do
		HealGridTags.paramFuncs[k].func = HealGridTags[HealGridTags.paramFuncs[k].funcName];
	end

end

-- =========================================================================================================================
--   Shutdown
-- =========================================================================================================================

function HealGridTags.Shutdown()

end

-- =========================================================================================================================
--   Sorting for the GUI (helpers)
-- =========================================================================================================================

function HealGridTags.SortTagsGUI( a, b )

	if ( HealGridTags.tags[a].chapter == HealGridTags.tags[b].chapter ) then
		return( HealGridTags.tags[a].label < HealGridTags.tags[b].label );
	end

	return( HealGridTags.tags[a].chapter < HealGridTags.tags[b].chapter );

end

-- =========================================================================================================================
--   Parsing and preparing
-- =========================================================================================================================

function HealGridTags.FindLabel( s, i )

	local sub;
	local fs,ls,le,label;
	local len = wstring.len( s );

	i = (i or 1);

	-- find opening [
	while ( i <= len and wstring.sub(s,i,i) ~= L'[' ) do
		i = i + 1;
	end

	if ( i > len ) then
		return nil;
	end

	fs = i;
	i = i + 1;
	ls = i;

	-- find closing [ or ':'
	sub = wstring.sub( s, i, i );
	while ( i <= len and sub ~= L']' and sub ~= L':' ) do
		i = i + 1;
		sub = wstring.sub( s, i, i );
	end

	if ( i > len ) then
		return nil;
	end

	le = i - 1;
	if ( sub == L']' ) then
		return fs,i,wstring.sub(s,ls,le),nil;
	end

	-- parsing args (find ])
	i = i + 1;
	sub = wstring.sub( s, i, i );
	while ( i <= len and sub ~= L']' ) do
		i = i + 1;
		sub = wstring.sub( s, i, i );
	end

	if ( i > len ) then
		return nil;
	end

	return fs,i,wstring.sub(s,ls,le),wstring.sub(s,le+2,i-1);
	

end

function HealGridTags.ExtractArg( s, i )

	local sub;
	local ps,pe;
	local value = L'';
	local quoted = nil;
	local len = wstring.len( s );

	if ( i > len ) then
		return nil;
	end

	i = (i or 1);
	ps = i;

	-- find = or ,
	while ( i <= len and wstring.sub(s,i,i) ~= L'=' and wstring.sub(s,i,i) ~= L"," ) do
		i = i + 1;
	end

	pe = i - 1;
	-- get argument value, if there should be one
	if ( i <= len and wstring.sub(s,i,i) == L"=" ) then
		i = i + 1;
		sub = wstring.sub( s, i, i );
		while ( i <= len and (quoted or sub ~= L',') ) do
			if ( quoted and quoted == sub ) then
				quoted = nil;
			elseif ( (not quoted) and (sub == L'"' or sub == L"'") ) then
				quoted = sub;
			else
				value = value .. sub;
			end
			i = i + 1;
			sub = wstring.sub( s, i, i );
		end
	end

	return i,wstring.sub(s,ps,pe),value;

end

function HealGridTags.ExplodeArgs( a )

	local s,p,v;
	local args;
	local i = 1;
	local n = 1;

	if ( a == nil or a == L'' ) then
		return( nil );
	end

	n,p,v = HealGridTags.ExtractArg( a, n );
	while ( n ) do
		args = args or {};
		args[i] = {param=p,value=v};
		i = i + 1;
		n,p,v = HealGridTags.ExtractArg( a, n+1 );
	end

	return( args );

end

function HealGridTags.PrepareLabel( label )

	local s,e,f,n,l,a,fa,format;
	local i = 1;

	label.numFuncs = 0;
	label.funcs = {};
	label.args = {};
	label.pre = {};
	label.post = L"";

	format = label.label;
	s,e,l,a = HealGridTags.FindLabel( format );
	while ( s ) do
		f = HealGridTags.tagLabels[l];
		fa = HealGridTags.ExplodeArgs(a);
		if ( f ) then
			if ( label.pre[i] == nil ) then label.pre[i] = L''; end
			label.pre[i] = label.pre[i] .. wstring.sub(format,1,s-1);
			label.post = wstring.sub(format,e+1);
			format = wstring.sub(format,e+1);
			label.funcs[i] = f;
			label.args[i] = fa;
			label.numFuncs = i;
			i = i + 1;
		else
			if ( label.pre[i] == nil ) then label.pre[i] = L''; end
			label.pre[i] = label.pre[i] .. wstring.sub(format,1,e);
			format = wstring.sub(format,e+1);
			--n = e + 1;
		end
		s,e,l,a = HealGridTags.FindLabel( format, 1 );
	end

	label.isPrepared = true;

end

function HealGridTags.Parse( label, unitObj )

	local i = 1;
	local res = L'';

	if ( not label.isPrepared ) then
		HealGridTags.PrepareLabel( label );
	end

	if ( label.numFuncs < 1 ) then
		res = label.label;
	else
		for i=1, label.numFuncs do
			res = res .. label.pre[i];
			res = res .. HealGridTags.ProcessTag( HealGridTags.tags[label.funcs[i]].func(unitObj), label.args[i] );
		end
		res = res .. label.post;
	end

	return( res );

end

-- ======================================================================================================================
--   Tag processing
-- ======================================================================================================================

function HealGridTags.ProcessTagLen( str, len )

	return( wstring.sub(str,1,tonumber(len)) );

end

function HealGridTags.ProcessTagPre( str, pre )

	if ( str ~= L'' ) then
		str = pre..str;
	end

	return( str );

end

function HealGridTags.ProcessTagPost( str, post )

	if ( str ~= L'' ) then
		str = str..post;
	end

	return( str );

end

function HealGridTags.ProcessTagEmpty( str, empty )

	if ( str == L'' ) then
		str = empty;
	end

	return( str );

end

function HealGridTags.ProcessTagUpper( str, void )

	return( wstring.upper(str) );

end

function HealGridTags.ProcessTagLower( str, void )

	return( wstring.lower(str) );

end

function HealGridTags.ProcessTag( value, params )

	local i=1;

	if ( params ) then
		while ( params[i] ) do
			if ( HealGridTags.paramFuncs[params[i].param] ) then
			  value = HealGridTags.paramFuncs[params[i].param].func( value, params[i].value );
			end
			i = i + 1;
		end
	end

	return( value );

end

-- ======================================================================================================================
--   Tag resolve functions/methods
-- ======================================================================================================================

function HealGridTags.Name( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( unitObj:GetUnitName() );

end

function HealGridTags.Name3( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( wstring.sub(unitObj:GetUnitName(),1,3) );

end

function HealGridTags.Name5( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( wstring.sub(unitObj:GetUnitName(),1,5) );

end

function HealGridTags.Career( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( unitObj:GetCareerName() );

end

function HealGridTags.CareerShort( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( unitObj:GetCareerName() );				-- TODO: abbrevation

end

function HealGridTags.CurrentHealth( unitObj )

	local hpPercStr;

	if ( not unitObj ) then
		return( L"" );
	end

	hpStr =  unitObj:HitPointsPercentString( unitObj:HitPoints() );					-- HitPointsPercentString() does the formatting of the hp passed to it

	return( hpStr );

end

function HealGridTags.MaxHealth( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( L""..unitObj:HitPointsMax() );

end

function HealGridTags.HealthPercentage( unitObj )

	local hpPercStr;

	if ( not unitObj ) then
		return( L"" );
	end

	hpPercStr =  unitObj:HitPointsPercentString( unitObj:HitPointsPercent() );		-- HitPointsPercentString() does the formatting of the hp passed to it

	return( hpPercStr );

end

function HealGridTags.MissingHealth( unitObj )

	local hpDiffStr;
	
	if ( not unitObj ) then
		return( L"" );
	end

	hpDiffStr = L""..(unitObj:HitPointsMax()-unitObj:HitPoints());

	return( hpDiffStr );

end

function HealGridTags.CurrentActionPoints( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( L""..unitObj:ActionPoints() );

end

function HealGridTags.MaxActionPoints( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( L""..unitObj:ActionPointsMax() );

end

function HealGridTags.ActionPointsPercentage( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( L""..unitObj:ActionPointsPercent() );

end

function HealGridTags.MissingActionPoints( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( L""..(unitObj:ActionPointsMax()-unitObj:ActionPoints()) );

end

function HealGridTags.MoraleLevel( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( L""..unitObj:MoraleLevel() );

end

function HealGridTags.MoraleLevelX( unitObj )

	local ml = 0;
	local mlx = L"";

	if ( not unitObj ) then
		return( L"" );
	end

	ml = unitObj:MoraleLevel();

	if ( ml == 0 ) then
		mlx = L"";
	elseif ( ml == 1 ) then
		mlx = L"X";
	elseif ( ml == 2 ) then
		mlx = L"X X";
	elseif ( ml == 3 ) then
		mlx = L"X X X";
	elseif ( ml >= 4 ) then
		mlx = L"XXXX";
	end

	return( mlx );

end

function HealGridTags.CareerPoints( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( HealGridUtility.AdjustCareerPoints(unitObj:CareerPoints(),unitObj:GetCareerLine()) );

end

function HealGridTags.CareerPointsMax( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( unitObj:CareerPointsMax() );

end

function HealGridTags.Level( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( L""..unitObj:GetUnitLevel() );

end

function HealGridTags.LevelDifference( unitObj )

	local lvlDiff, lvlDiffStr, unitLvl;

	if ( not unitObj ) then
		return( L"" );
	end

	unitLvl = unitObj:GetUnitLevel();

	if ( unitLvl <= 0 ) then
		lvlDiffStr = L"?";
	else
		lvlDiff = unitLvl - GameData.Player.level;
		lvlDiffStr = wstring.format( L"%d", lvlDiff );
		if ( lvlDiff > 0 ) then
			lvlDiffStr = L'+' .. lvlDiffStr;
		end
	end

	return( lvlDiff );

end

function HealGridTags.Tier( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( HealGridUtility.TierToString(unitObj:GetUnitTier()) );

end

function HealGridTags.TierSign( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( HealGridUtility.TierToSign(unitObj:GetUnitTier()) );

end

function HealGridTags.LowOnMana( unitObj )

	local perc;

	if ( not unitObj ) then
		return( L"" );
	end

	perc = unitObj:GetActionPointsPercent();

	if ( perc <= 20 ) then
		return( L'M' );
	elseif ( perc <= 40 ) then
		return( L'm' );
	end

	return( L'' );

end

function HealGridTags.OutOfMana( unitObj )

	local perc;

	if ( not unitObj ) then
		return( L"" );
	end

	perc = unitObj:GetActionPointsPercent();

	if ( perc <= 20 ) then
		return( L'M' );
	end

	return( L'' );

end

function HealGridTags.GroupLeader( unitObj )

	if ( not unitObj or (not unitObj:IsGroupLeader()) ) then
		return( L"" );
	end

	return( L"L" );

end

function HealGridTags.MainAssist( unitObj )

	if ( not unitObj or (not unitObj:IsMainAssist()) ) then
		return( L"" );
	end

	return( L"A" );

end

function HealGridTags.Stance( unitObj )

	if ( not unitObj ) then
		return( L"" );
	end

	return( unitObj:GetStanceName() );

end

HealGridMouseClick = {};

HealGridMouseClick.frameToCleanUp = nil;

HealGridMouseClick.frameTypes =
	{
		UNIT		= {label=L"Unit",		sortIdx=1,	},
		PET			= {label=L"Pet",		sortIdx=2,	},
		APBAR		= {label=L"AP-Bar",		sortIdx=3,	},
		CPBAR		= {label=L"CP-Bar",		sortIdx=4,	},
		MORALEBAR	= {label=L"Morale Bar",	sortIdx=5,	},
		CASTBAR		= {label=L"Castbar",	sortIdx=6,	},
	};

HealGridMouseClick.targetTypes =
	{
		ANY			= {label=L"Any",		},
		FRIENDLY	= {label=L"Friendly",	},
		HOSTILE		= {label=L"Hostile",	},
	};

HealGridMouseClick.mouseButtons =
	{
		LMB = {label=L"Left",	},
		MMB = {label=L"Middle",	},
		RMB = {label=L"Right",	},
	};

HealGridMouseClick.modifierKeys =
	{
		SHIFT	= {label=L"Shift", code=11 },
		ALT		= {label=L"Alt",   code=11 },
		CTRL	= {label=L"Ctrl",  code=11 },
	};

HealGridMouseClick.actions =
	{
		TARGET		= {label=L"Target",			targetUnitFirst=false,	isLmbOnly=false,	buttonState='DOWN',	needDetail=false,	},
		ASSIST		= {label=L"Assist",			targetUnitFirst=false,	isLmbOnly=false,	buttonState='DOWN',	needDetail=false,	},
		UNITMENU	= {label=L"Unit Menu",		targetUnitFirst=false,	isLmbOnly=false,	buttonState='UP',	needDetail=false,	},
		SLASHCMD	= {label=L"Slash Command",	targetUnitFirst=false,	isLmbOnly=false,	buttonState='DOWN',	needDetail=true,	},
		ABILITY		= {label=L"Cast Spell",		targetUnitFirst=true,	isLmbOnly=true,		buttonState='DOWN',	needDetail=true,	},
		MORALE		= {label=L"Morale",			targetUnitFirst=true,	isLmbOnly=true,		buttonState='DOWN',	needDetail=true,	},
		COMMANDPET	= {label=L"Command Pet",	targetUnitFirst=false,	isLmbOnly=true,		buttonState='DOWN',	needDetail=true,	},
		PETABILITY	= {label=L"Pet Ability",	targetUnitFirst=false,	isLmbOnly=true,		buttonState='DOWN',	needDetail=true,	},
	};

HealGridMouseClick.actionMorale =
	{
		[0]	= {label=L"Undefined",		},
		[1]	= {label=L"Morale Level 1",	},
		[2]	= {label=L"Morale Level 2",	},
		[3]	= {label=L"Morale Level 3",	},
		[4]	= {label=L"Morale Level 4",	},
	};

HealGridMouseClick.actionCommandPet =
	{
		[GameData.PetCommand.STAY]			= {label=L"Stay",		},
		[GameData.PetCommand.FOLLOW]		= {label=L"Follow",		},
		[GameData.PetCommand.PASSIVE]		= {label=L"Passive",	},
		[GameData.PetCommand.DEFENSIVE]		= {label=L"Defensive",	},
		[GameData.PetCommand.AGGRESSIVE]	= {label=L"Aggressive",	},
		[GameData.PetCommand.ATTACK]		= {label=L"Attack",		},
		[GameData.PetCommand.RELEASE]		= {label=L"Release",	},
	};

HealGridMouseClick.comboBoxFrameTypeList =
	{
		[1] = {key="UNIT",		label=HealGridMouseClick.frameTypes.UNIT.label,			},
		[2] = {key="PET",		label=HealGridMouseClick.frameTypes.PET.label,			},
		[3] = {key="APBAR",		label=HealGridMouseClick.frameTypes.APBAR.label,		},
		[4] = {key="CPBAR",		label=HealGridMouseClick.frameTypes.CPBAR.label,		},
		[5] = {key="MORALEBAR",	label=HealGridMouseClick.frameTypes.MORALEBAR.label,	},
		[6] = {key="CASTBAR",	label=HealGridMouseClick.frameTypes.CASTBAR.label,		},
	};

HealGridMouseClick.comboBoxTargetTypeList =
	{
		[1] = {key="ANY",		label=HealGridMouseClick.targetTypes.ANY.label,			},
		[2] = {key="FRIENDLY",	label=HealGridMouseClick.targetTypes.FRIENDLY.label,	},
		[3] = {key="HOSTILE",	label=HealGridMouseClick.targetTypes.HOSTILE.label,		},
	};

HealGridMouseClick.comboBoxMouseButtonList =
	{
		[1] = {key="LMB",	label=HealGridMouseClick.mouseButtons.LMB.label, },
		[2] = {key="MMB",	label=HealGridMouseClick.mouseButtons.MMB.label, },
		[3] = {key="RMB",	label=HealGridMouseClick.mouseButtons.RMB.label, },
	};

HealGridMouseClick.comboBoxActionList =
	{
		[1] = {key="TARGET",		label=HealGridMouseClick.actions.TARGET.label,		},
		[2] = {key="ASSIST",		label=HealGridMouseClick.actions.ASSIST.label,		},
		[3] = {key="UNITMENU",		label=HealGridMouseClick.actions.UNITMENU.label,	},
		[4] = {key="ABILITY",		label=HealGridMouseClick.actions.ABILITY.label,		},
		[5] = {key="MORALE",		label=HealGridMouseClick.actions.MORALE.label,		},
		[6] = {key="COMMANDPET",	label=HealGridMouseClick.actions.COMMANDPET.label,	},
		[7] = {key="PETABILITY",	label=HealGridMouseClick.actions.PETABILITY.label,	},
		[8] = {key="SLASHCMD",		label=HealGridMouseClick.actions.SLASHCMD.label,	},
	};

HealGridMouseClick.comboBoxMoraleList =
	{
		[1] = {key=1,		label=HealGridMouseClick.actionMorale[1].label,	},
		[2] = {key=2,		label=HealGridMouseClick.actionMorale[2].label,	},
		[3] = {key=3,		label=HealGridMouseClick.actionMorale[3].label,	},
		[4] = {key=4,		label=HealGridMouseClick.actionMorale[4].label,	},
	};

HealGridMouseClick.comboBoxCommandPetList =
	{
		[1]	= {key=GameData.PetCommand.STAY,		label=HealGridMouseClick.actionCommandPet[GameData.PetCommand.STAY].label		},
		[2]	= {key=GameData.PetCommand.FOLLOW,		label=HealGridMouseClick.actionCommandPet[GameData.PetCommand.FOLLOW].label		},
		[3]	= {key=GameData.PetCommand.PASSIVE,		label=HealGridMouseClick.actionCommandPet[GameData.PetCommand.PASSIVE].label	},
		[4]	= {key=GameData.PetCommand.DEFENSIVE,	label=HealGridMouseClick.actionCommandPet[GameData.PetCommand.DEFENSIVE].label	},
		[5]	= {key=GameData.PetCommand.AGGRESSIVE,	label=HealGridMouseClick.actionCommandPet[GameData.PetCommand.AGGRESSIVE].label	},
		[6]	= {key=GameData.PetCommand.ATTACK,		label=HealGridMouseClick.actionCommandPet[GameData.PetCommand.ATTACK].label		},
		[7]	= {key=GameData.PetCommand.RELEASE,		label=HealGridMouseClick.actionCommandPet[GameData.PetCommand.RELEASE].label	},

	};

HealGridMouseClick.modifierCompareList =
	{
		ANY				= 1,
		NONE			= 2,
		SHIFT			= 3,
		CTRL			= 4,
		ALT				= 5,
		SHIFTCTRL		= 6,
		SHIFTALT		= 7,
		CTRLALT			= 8,
		SHIFTCTRLALT	= 9,
	};

-- ========================================================================================
-- Initialization
-- ========================================================================================

function HealGridMouseClick.Initialize()

end

-- ========================================================================================
-- Shutdown
-- ========================================================================================

function HealGridMouseClick.Shutdown()

end

-- ========================================================================================
-- Trivials
-- ========================================================================================

function HealGridMouseClick.GetFrameType( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].frameType );

end

function HealGridMouseClick.GetTargetType( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].targetType );

end

function HealGridMouseClick.GetMouseButton( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].mouseButton );

end

function HealGridMouseClick.GetModifierKey( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].modifierKey );

end

function HealGridMouseClick.GetAction( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].action );

end

function HealGridMouseClick.GetActionDetail( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].actionDetail );

end

function HealGridMouseClick.NeedModifierKey( key, modifier )

	local modifierKey = HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].modifierKey;

	if ( modifierKey == 'ANY' ) then
		return( false );
	elseif ( modifierKey == 'NONE' ) then
		return( false );
	else
		return( modifierKey:find(modifier) ~= nil );
	end

end

function HealGridMouseClick.IsAnyKey( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].modifierKey == 'ANY' );

end

function HealGridMouseClick.ActionIsLmbOnly( action )

	return( HealGridMouseClick.actions[action].isLmbOnly );

end

-- ==============================================================================================
-- Process a click event
-- ==============================================================================================

function HealGridMouseClick.UnitLButtonDown( flags, x, y )

	HealGridMouseClick.ProcessClick( 'LMB', 'DOWN', flags, SystemData.MouseOverWindow.name, x, y );

end

function HealGridMouseClick.UnitLButtonUp( flags, x, y )

	HealGridMouseClick.ProcessClick( 'LMB', 'UP', flags, SystemData.MouseOverWindow.name, x, y );

end

function HealGridMouseClick.UnitMButtonDown( flags, x, y )

	HealGridMouseClick.ProcessClick( 'MMB', 'DOWN', flags, SystemData.MouseOverWindow.name, x, y );

end

function HealGridMouseClick.UnitMButtonUp( flags, x, y )

	HealGridMouseClick.ProcessClick( 'MMB', 'UP', flags, SystemData.MouseOverWindow.name, x, y );

end

function HealGridMouseClick.UnitRButtonDown( flags, x, y )

	HealGridMouseClick.ProcessClick( 'RMB', 'DOWN', flags, SystemData.MouseOverWindow.name, x, y );

end

function HealGridMouseClick.UnitRButtonUp( flags, x, y )

	HealGridMouseClick.ProcessClick( 'RMB', 'UP', flags, SystemData.MouseOverWindow.name, x, y );

end

function HealGridMouseClick._UnitClickedGetKeyToProcess( frameType, targetType, mb, shiftPressed, ctrlPressed, altPressed )

	local key;
	local modifierKey = HealGridMouseClick.BuildModifierKey( shiftPressed, ctrlPressed, altPressed, false );

	key = HealGridMouseClick.BuildKey( frameType, targetType, mb, modifierKey );		-- TT MB MOD
	if ( not HealGridMouseClick.DoesKeyExist(key) ) then
		key = HealGridMouseClick.BuildKey( frameType, targetType, mb, 'ANY' );			-- TT MB ANY
		if ( not HealGridMouseClick.DoesKeyExist(key) ) then
			key = HealGridMouseClick.BuildKey( frameType, 'ANY', mb, modifierKey );		-- ANY MB MOD
			if ( not HealGridMouseClick.DoesKeyExist(key) ) then
				key = HealGridMouseClick.BuildKey( frameType, 'ANY', mb, 'ANY' );		-- ANY MB ANY
				if ( not HealGridMouseClick.DoesKeyExist(key) ) then
					return( nil );														-- no such key
				end
			end
		end
	end

	return( key );

end

function HealGridMouseClick.UnitClickedGetKeyToProcess( targetType, mb, shiftPressed, ctrlPressed, altPressed )

	return( HealGridMouseClick._UnitClickedGetKeyToProcess('UNIT',targetType,mb,shiftPressed,ctrlPressed,altPressed) );

end

function HealGridMouseClick.PetClickedGetKeyToProcess( targetType, mb, shiftPressed, ctrlPressed, altPressed )

	return( HealGridMouseClick._UnitClickedGetKeyToProcess('PET',targetType,mb,shiftPressed,ctrlPressed,altPressed) );

end

function HealGridMouseClick.NonUnitClickedGetKeyToProcess( frameType, mb, shiftPressed, ctrlPressed, altPressed )

	local key = nil;
	local modifierKey = HealGridMouseClick.BuildModifierKey( shiftPressed, ctrlPressed, altPressed, false );
	local haveFriendlyTarget = (HealGridHUDMain.Instance():GetUnit(1,HealGridHUD.FRIENDLY_TARGET) ~= nil);
	local haveHostileTarget = (HealGridHUDMain.Instance():GetUnit(1,HealGridHUD.HOSTILE_TARGET) ~= nil);

	if ( haveFriendlyTarget ) then
		key = HealGridMouseClick.BuildKey( frameType, 'FRIENDLY', mb, modifierKey );		-- FRIENDLY MB MOD
		if ( not HealGridMouseClick.DoesKeyExist(key) ) then
			key = HealGridMouseClick.BuildKey( frameType, 'FRIENDLY', mb, 'ANY' );			-- FRIENDLY MB ANY
		end
	end

	if ( (not HealGridMouseClick.DoesKeyExist(key)) and haveHostileTarget ) then
		key = HealGridMouseClick.BuildKey( frameType, 'HOSTILE', mb, modifierKey );			-- HOSTILE MB MOD
		if ( not HealGridMouseClick.DoesKeyExist(key) ) then
			key = HealGridMouseClick.BuildKey( frameType, 'HOSTILE', mb, 'ANY' );			-- HOSTILE MB ANY
		end
	end

	if ( (not HealGridMouseClick.DoesKeyExist(key)) ) then
		key = HealGridMouseClick.BuildKey( frameType, 'ANY', mb, modifierKey );				-- ANY MB MOD
		if ( not HealGridMouseClick.DoesKeyExist(key) ) then
			key = HealGridMouseClick.BuildKey( frameType, 'ANY', mb, 'ANY' );				-- ANY MB ANY
		end
	end

	if ( not HealGridMouseClick.DoesKeyExist(key) ) then
		key = nil;
	end

	return( key );

end

function HealGridMouseClick.ProcessClick( mb, mbState, modifier, mouseOverWindow, mx, my )

	local frameType = 'UNIT';
	local unitObj = nil;
	local action = nil;
	local key = nil;
	local targetType = nil;
	local unitName = nil;
	local shiftPressed = RMetUtility.IsShiftPressed( modifier );
	local ctrlPressed = RMetUtility.IsControlPressed( modifier );
	local altPressed = RMetUtility.IsAltPressed( modifier );

	-- need to cleanup a frame?
	HealGridMouseClick.FrameCleanUp();

	-- get the object of the clicked unit
	unitObj,frameType = HealGridUtility.FrameNameToUnit( mouseOverWindow );

	-- get the click-map key
	if ( frameType == 'UNIT' ) then															-- ----- Unit Frame
		if ( unitObj:UnitIsFriend() ) then
			targetType = 'FRIENDLY';
		else
			targetType = 'HOSTILE';
		end

		key = HealGridMouseClick.UnitClickedGetKeyToProcess( targetType, mb, shiftPressed, ctrlPressed, altPressed );
	elseif ( frameType == 'PET' ) then															-- ----- Pet Frame
		if ( unitObj:UnitIsFriend() ) then
			targetType = 'FRIENDLY';
		else
			targetType = 'HOSTILE';
		end

		key = HealGridMouseClick.PetClickedGetKeyToProcess( targetType, mb, shiftPressed, ctrlPressed, altPressed );
	else																					-- ----- non-Unit Frame
		key = HealGridMouseClick.NonUnitClickedGetKeyToProcess( frameType, mb, shiftPressed, ctrlPressed, altPressed );
		unitObj = nil;
	end

	-- anything assigned to the click?
	if ( key == nil ) then
		return;
	end

	-- check if action exists and needs button up/down event
	action = HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].action;
	if ( HealGridMouseClick.actions[action] == nil ) then
		return;
	elseif ( HealGridMouseClick.actions[action].buttonState ~= mbState ) then
		return;
	end

	-- check if I need to target the unit first
	if ( frameType == 'UNIT' and 
         HealGridMouseClick.actions[action].targetUnitFirst and 
		 (unitObj:GetUnitType() ~= 'selffriendlytarget' and unitObj:GetUnitType() ~= 'selfhostiletarget') and
         unitObj:GetRealUnitName() ~= HealGridUtility.WStringChop(TargetInfo:UnitName('selffriendlytarget')) )
	then
		action = 'TARGET';
	end

	-- process the event
	if ( action == 'ABILITY' ) then
		if ( unitObj and unitObj:UnitIsFriend() ) then
			unitName = unitObj:GetUnitName();
		end
		HealGridMouseClick.ProcessAbility( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].actionDetail, unitName, mouseOverWindow );
	elseif ( action == 'PETABILITY' ) then
		if ( unitObj and unitObj:UnitIsFriend() ) then
			unitName = unitObj:GetUnitName();
		end
		HealGridMouseClick.ProcessAbility( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].actionDetail, unitName, mouseOverWindow );
	elseif ( action == 'MORALE' ) then
		if ( unitObj and unitObj:UnitIsFriend() ) then
			unitName = unitObj:GetUnitName();
		end
		HealGridMouseClick.ProcessMorale( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].actionDetail, unitName, mouseOverWindow );
	elseif ( action == 'COMMANDPET' ) then
		if ( unitObj and unitObj:UnitIsFriend() ) then
			unitName = unitObj:GetUnitName();
		end
		HealGridMouseClick.ProcessCommandPet( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].actionDetail, unitName, mouseOverWindow );
	elseif ( action == 'TARGET' ) then
		HealGridMouseClick.ProcessTargetUnit( unitObj, mouseOverWindow );
	elseif ( action == 'ASSIST' ) then
		HealGridMouseClick.ProcessAssist( unitObj, mouseOverWindow );
	elseif ( action == 'UNITMENU' ) then
		if ( unitObj ) then
			unitObj:ShowDropdownMenu();
		end
	elseif ( action == 'SLASHCMD' ) then
		if ( unitObj ) then
			unitName = unitObj:GetUnitName();
		end
		HealGridMouseClick.ProcessSlashCmd( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].actionDetail, unitName );
	end

end

-- ========================================================================================
-- Execute target unit
-- ========================================================================================

function HealGridMouseClick.ProcessTargetUnit( unitObj, mouseOverWindow )

	-- NOTE: unitObj:GetFrameName() does not work at attached HUDs, as the I get the frameName of HUDMain !!!!

	if ( unitObj ~= nil ) then
		WindowSetGameActionData( mouseOverWindow, GameData.PlayerActions.SET_TARGET, 0, unitObj:GetUnitName() );

		HealGridMouseClick.frameToCleanUp = mouseOverWindow;

		-- mark the unit as "clicked" (pendingTarget)
		-- NOTE: HUD units do not allow to be set as pendingTargets, as they a) always can be targeted b) problems with attached HUDs (unitObj == HUDMain)
		unitObj:SetPendingTarget();
	end

end

-- ========================================================================================
-- Execute slash command
-- ========================================================================================

function HealGridMouseClick.ProcessSlashCmd( actionDetail, unitName )

	local fullCmd = actionDetail;
	local cmd = actionDetail:match( L"/?([^ ]+).*" );

	if ( unitName ~= nil ) then
		fullCmd = fullCmd:gsub( L"UNITNAME", unitName );
	end
	fullCmd = fullCmd:gsub( L"PLAYERNAME", GameData.Player.name );

	if ( cmd ) then
		cmd = WStringToString( cmd );
	end

	if ( LibSlash.IsSlashCmdRegistered(cmd) ) then
		if ( fullCmd:sub(1,1) == L'/' ) then
			fullCmd = fullCmd:sub( 2 );
		end
		slash( fullCmd );
	else
		if ( fullCmd:sub(1,1) ~= L'/' ) then
			fullCmd = L'/' .. fullCmd;
		end
	    message = fullCmd;
		 SendChatText(towstring(message), L"");
	end

end

-- ========================================================================================
-- Execute assist
-- ========================================================================================

function HealGridMouseClick.ProcessAssist( unitObj, mouseOverWindow )

	local ma = L"";

	if ( unitObj and unitObj:GetAssistTarget() == 'UNIT' ) then
		unitObj:AssistUnit();
	else
		WindowSetGameActionData( mouseOverWindow, GameData.PlayerActions.ASSIST_PLAYER, GameData.AssistType.MAIN_ASSIST, L"" );
		HealGridMouseClick.frameToCleanUp = mouseOverWindow;
	end

end

-- ========================================================================================
-- Execute a Morale
-- ========================================================================================

function HealGridMouseClick.ProcessMorale( moraleLevel, unitName, mouseOverWindow )

	local  _,abilityID = GetMoraleBarData( moraleLevel );

	HealGridMouseClick.ProcessAbility( abilityID, unitName, mouseOverWindow );

end

-- ========================================================================================
-- Execute a Pet Command
-- ========================================================================================

function HealGridMouseClick.ProcessCommandPet( petCommand, unitName, mouseOverWindow )

	WindowSetGameActionData( mouseOverWindow, GameData.PlayerActions.COMMAND_PET, petCommand, L"" );

	HealGridMouseClick.frameToCleanUp = mouseOverWindow;

end

-- ========================================================================================
-- Execute an Ability
-- ========================================================================================

function HealGridMouseClick.ProcessAbility( abilityID, unitName, mouseOverWindow )

	if ( abilityID <= 0 ) then
		return;
	end

--	WindowSetGameActionTrigger( mouseOverWindow, abilityID );
	WindowSetGameActionData( mouseOverWindow, GameData.PlayerActions.DO_ABILITY, abilityID, L"" );

	HealGridMouseClick.frameToCleanUp = mouseOverWindow;

end

-- ========================================================================================
-- Execute an Ability
-- ========================================================================================

function HealGridMouseClick.FrameNeedCleanUp()

	return( HealGridMouseClick.frameToCleanUp ~= nil );

end

function HealGridMouseClick.FrameCleanUp()

	if ( HealGridMouseClick.FrameNeedCleanUp() ) then
		WindowSetGameActionTrigger( HealGridMouseClick.frameToCleanUp, 0 );
		WindowSetGameActionData( HealGridMouseClick.frameToCleanUp, 0, 0, L"" );
	end

	HealGridMouseClick.frameToCleanUp = nil;

end

-- ========================================================================================
-- Helpers / builders
-- ========================================================================================

function HealGridMouseClick.BuildModifierKey( shift, ctrl, alt, any )

	local modifierKey = '';

	if ( any ) then
		return( 'ANY' );
	end

	if ( shift ) then	modifierKey = modifierKey .. 'SHIFT';	end
	if ( ctrl ) then	modifierKey = modifierKey .. 'CTRL';	end
	if ( alt ) then		modifierKey = modifierKey .. 'ALT';	end

	if ( modifierKey == '' ) then
		return( 'NONE' );
	end

	return( modifierKey );
	
end

function HealGridMouseClick.BuildKey( frameType, targetType, mouseButton, modifierKey )

	if ( frameType == nil ) then
		return( nil );
	elseif ( targetType == nil ) then
		return( nil );
	elseif ( mouseButton == nil ) then
		return( nil );
	elseif ( modifierKey == nil ) then
		return( nil )
	else
		return( frameType .. '_' .. targetType .. '_' .. mouseButton .. '_' .. modifierKey );
	end

end

function HealGridMouseClick.DoesKeyExist( key )

	return( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key] ~= nil );

end

function HealGridMouseClick.CompareFrameType( key1, key2 )

	if ( HealGridMouseClick.GetFrameType(key1) ~= HealGridMouseClick.GetFrameType(key2) ) then
		return( HealGridMouseClick.CompareFrameTypeOnly(key1,key2) );
	elseif ( HealGridMouseClick.GetTargetType(key1) ~= HealGridMouseClick.GetTargetType(key2) ) then
		return( HealGridMouseClick.GetTargetType(key1) < HealGridMouseClick.GetTargetType(key2) );
	elseif ( HealGridMouseClick.GetMouseButton(key1) ~= HealGridMouseClick.GetMouseButton(key2) ) then
		return( HealGridMouseClick.GetMouseButton(key1) < HealGridMouseClick.GetMouseButton(key2) );
	elseif ( HealGridMouseClick.GetModifierKey(key1) ~= HealGridMouseClick.GetModifierKey(key2) ) then
		return( HealGridMouseClick.CompareModifierKeyOnly(key1,key2) );
	else
		return( false );
	end

end

function HealGridMouseClick.CompareTargetType( key1, key2 )

	if ( HealGridMouseClick.GetTargetType(key1) ~= HealGridMouseClick.GetTargetType(key2) ) then
		return( HealGridMouseClick.GetTargetType(key1) < HealGridMouseClick.GetTargetType(key2) );
	elseif ( HealGridMouseClick.GetFrameType(key1) ~= HealGridMouseClick.GetFrameType(key2) ) then
		return( HealGridMouseClick.CompareFrameTypeOnly(key1,key2) );
	elseif ( HealGridMouseClick.GetMouseButton(key1) ~= HealGridMouseClick.GetMouseButton(key2) ) then
		return( HealGridMouseClick.GetMouseButton(key1) < HealGridMouseClick.GetMouseButton(key2) );
	elseif ( HealGridMouseClick.GetModifierKey(key1) ~= HealGridMouseClick.GetModifierKey(key2) ) then
		return( HealGridMouseClick.CompareModifierKeyOnly(key1,key2) );
	else
		return( false );
	end

end

function HealGridMouseClick.CompareMouseButton( key1, key2 )
	
	local m1, m2;

	if ( HealGridMouseClick.GetMouseButton(key1) ~= HealGridMouseClick.GetMouseButton(key2) ) then
		return( HealGridMouseClick.GetMouseButton(key1) < HealGridMouseClick.GetMouseButton(key2) );
	elseif ( HealGridMouseClick.GetTargetType(key1) ~= HealGridMouseClick.GetTargetType(key2) ) then
		return( HealGridMouseClick.GetTargetType(key1) < HealGridMouseClick.GetTargetType(key2) );
	elseif ( HealGridMouseClick.GetFrameType(key1) ~= HealGridMouseClick.GetFrameType(key2) ) then
		return( HealGridMouseClick.CompareFrameTypeOnly(key1,key2) );
	elseif ( HealGridMouseClick.GetModifierKey(key1) ~= HealGridMouseClick.GetModifierKey(key2) ) then
		return( HealGridMouseClick.CompareModifierKeyOnly(key1,key2) );
	else
		return( false );
	end

end

function HealGridMouseClick.CompareModifierKey( key1, key2 )
	
	local m1, m2;

	if ( HealGridMouseClick.GetModifierKey(key1) ~= HealGridMouseClick.GetModifierKey(key2) ) then
		return( HealGridMouseClick.CompareModifierKeyOnly(key1,key2) );
	elseif ( HealGridMouseClick.GetMouseButton(key1) ~= HealGridMouseClick.GetMouseButton(key2) ) then
		return( HealGridMouseClick.GetMouseButton(key1) < HealGridMouseClick.GetMouseButton(key2) );
	elseif ( HealGridMouseClick.GetTargetType(key1) ~= HealGridMouseClick.GetTargetType(key2) ) then
		return( HealGridMouseClick.GetTargetType(key1) < HealGridMouseClick.GetTargetType(key2) );
	elseif ( HealGridMouseClick.GetFrameType(key1) ~= HealGridMouseClick.GetFrameType(key2) ) then
		return( HealGridMouseClick.CompareFrameTypeOnly(key1,key2) );
	else
		return( false );
	end

end

function HealGridMouseClick.CompareAction( key1, key2 )

	if ( HealGridMouseClick.GetAction(key1) ~= HealGridMouseClick.GetAction(key2) ) then
		return( HealGridMouseClick.GetAction(key1) < HealGridMouseClick.GetAction(key2) );
	else
		return( HealGridMouseClick.CompareTargetType(key1,key2) );
	end

end

function HealGridMouseClick.CompareActionDetail( key1, key2 ) 

	return( HealGridMouseClick.CompareAction(key1,key2) );

end

function HealGridMouseClick.CompareFrameTypeOnly( key1, key2 )

	local m1 = HealGridMouseClick.GetFrameType( key1 );
	local m2 = HealGridMouseClick.GetFrameType( key2 );

	return( HealGridMouseClick.frameTypes[m1].sortIdx < HealGridMouseClick.frameTypes[m2].sortIdx );

end

function HealGridMouseClick.CompareModifierKeyOnly( key1, key2 )

	local m1 = HealGridMouseClick.GetModifierKey( key1 );
	local m2 = HealGridMouseClick.GetModifierKey( key2 );

	return( HealGridMouseClick.modifierCompareList[m1] < HealGridMouseClick.modifierCompareList[m2] );

end

-- ========================================================================================
-- Add / Remove
-- ========================================================================================

function HealGridMouseClick.AddOrReplace( frameType, targetType, mouseButton, modifierKey, action, actionDetail )

	local key = HealGridMouseClick.BuildKey( frameType, targetType, mouseButton, modifierKey );

	if ( action == 'SLASHCMD' ) then
		if ( actionDetail == nil ) then
			actionDetail = L"";
		elseif ( type(actionDetail) == 'string' ) then
			actionDetail = StringToWString( actionDetail );
		end
	elseif ( action == 'ABILITY' or action == 'PETABILITY' ) then
		if ( actionDetail == nil ) then
			actionDetail = 0;
		elseif ( type(actionDetail) ~= 'number' ) then
			actionDetail = 0;
		end
	elseif ( action == 'MORALE' ) then
		if ( actionDetail == nil ) then
			actionDetail = 0;
		elseif ( type(actionDetail) ~= 'number' ) then
			actionDetail = 0;
		end
	end

	if ( HealGridMouseClick.actions[action].needDetail ) then
		-- nop;
	else
		actionDetail = nil;
	end

	if ( key == nil ) then
		-- nop;
	elseif ( HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key] ) then
		HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].action = action;
		HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key].actionDetail = actionDetail;
	else
		HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key] = { frameType=frameType, targetType=targetType,
                                                                        mouseButton=mouseButton, modifierKey=modifierKey,
                                                                        action=action, actionDetail=actionDetail };
	end

end

function HealGridMouseClick.Remove( key )

	if ( key ~= nil and HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key] ) then
		HealGridSettings[HealGrid.settingsIndex].mouseClickMap[key] = nil;
	end

end

-- ========================================================================================
-- Labels
-- ========================================================================================

function HealGridMouseClick.GetFrameTypeLabel( key )

	local frameType = HealGridMouseClick.GetFrameType( key );

	return( HealGridMouseClick.FrameTypeToFrameTypeLabel(frameType) );

end

function HealGridMouseClick.GetTargetTypeLabel( key )

	local targetType = HealGridMouseClick.GetTargetType( key );

	return( HealGridMouseClick.TargetTypeToTargetTypeLabel(targetType) );

end

function HealGridMouseClick.GetMouseButtonLabel( key )

	local mb = HealGridMouseClick.GetMouseButton( key );

	return( HealGridMouseClick.MouseButtonToMouseButtonLabel(mb) );

end

function HealGridMouseClick.GetModifierKeyLabel( key )

	local modifierKey = HealGridMouseClick.GetModifierKey( key );

	return( HealGridMouseClick.ModifierKeyToModifierKeyLabel(modifierKey) );

end

function HealGridMouseClick.GetActionLabel( key )

	local action = HealGridMouseClick.GetAction( key );

	return( HealGridMouseClick.ActionToActionLabel(action) );

end

function HealGridMouseClick.GetActionDetailLabel( key )

	local action = HealGridMouseClick.GetAction( key );
	local actionDetail = HealGridMouseClick.GetActionDetail( key );

	return( HealGridMouseClick.ActionDetailToActionDetailLabel(action,actionDetail) );

end

function HealGridMouseClick.FrameTypeToFrameTypeLabel( frameType )

	if ( frameType ~= nil and HealGridMouseClick.frameTypes[frameType] ) then
		return( HealGridMouseClick.frameTypes[frameType].label );
	end

	return( L"" );

end

function HealGridMouseClick.TargetTypeToTargetTypeLabel( targetType )

	if ( targetType ~= nil and HealGridMouseClick.targetTypes[targetType] ) then
		return( HealGridMouseClick.targetTypes[targetType].label );
	end

	return( L"" );

end

function HealGridMouseClick.MouseButtonToMouseButtonLabel( mb )

	if ( mb ~= nil and HealGridMouseClick.mouseButtons[mb] ) then
		return( HealGridMouseClick.mouseButtons[mb].label );
	end

	return( L"" );

end

function HealGridMouseClick.ModifierKeyToModifierKeyLabel( mk )

	local res = L"";

	if ( mk == nil ) then
		return( L"" );
	elseif ( mk == 'ANY' ) then
		return( L"Any" );
	elseif ( mk == 'NONE' ) then
		return( L"None" );
	elseif ( HealGridMouseClick.modifierKeys[mk] ) then
		return( HealGridMouseClick.modifierKeys[mk].label );
	end

	if ( mk:find('SHIFT') ~= nil ) then
		res = res .. HealGridMouseClick.modifierKeys.SHIFT.label;
	end
	if ( mk:find('CTRL') ~= nil ) then
		res = res .. HealGridMouseClick.modifierKeys.CTRL.label;
	end
	if ( mk:find('ALT') ~= nil ) then
		res = res .. HealGridMouseClick.modifierKeys.ALT.label;
	end

	return( res );

end

function HealGridMouseClick.ActionToActionLabel( action )

	if ( action ~= nil and HealGridMouseClick.actions[action] ) then
		return( HealGridMouseClick.actions[action].label );
	end

	return( L"" );

end

function HealGridMouseClick.ActionDetailToActionDetailLabel( action, actionDetail )

	local abilityID, abilityData;

	if ( action == nil ) then
		return( L"" );
	elseif ( action == 'SLASHCMD' ) then
		return( actionDetail );
	elseif ( action == 'ABILITY' ) then
		abilityID,abilityData = HealGridUtility.GetAbilityData( actionDetail );
		if ( abilityID > 0 ) then
			return( HealGridUtility.WStringChop(abilityData.name) );
		else
			return( L"Unknown or invalid" );
		end
	elseif ( action == 'PETABILITY' ) then
		abilityID,abilityData = HealGridUtility.GetAbilityData( actionDetail, GameData.AbilityType.PET );
		if ( abilityID > 0 ) then
			return( HealGridUtility.WStringChop(abilityData.name) );
		else
			return( L"Unknown or invalid" );
		end
	elseif ( action == 'MORALE' ) then
		return( HealGridMouseClick.actionMorale[actionDetail].label );
	elseif ( action == 'COMMANDPET' ) then
		return( HealGridMouseClick.actionCommandPet[actionDetail].label );
	else
		return( actionDetail or L'' );
	end

end

-- ========================================================================================
-- Tooltip labels
-- ========================================================================================

function HealGridMouseClick.GetTooltipLabel( key )

	local action;

	if ( key == nil or (not HealGridMouseClick.DoesKeyExist(key)) ) then
		return( L"" );
	end

	action = HealGridMouseClick.GetAction( key );

	if ( action == 'SLASHCMD' or action == 'ABILITY' or action == 'PETABILITY' or action == 'MORALE' ) then
		return( HealGridMouseClick.GetActionDetailLabel(key) );
	elseif ( action == 'COMMANDPET' ) then
		return( L"Pet: "..HealGridMouseClick.GetActionDetailLabel(key) );
	end

	return( HealGridMouseClick.GetActionLabel(key) );

end

-- ==============================================================================================
-- ComboBox for frame-type
-- ==============================================================================================

function HealGridMouseClick.ComboBoxFrameTypeInitChoices( comboBoxName )

	ComboBoxClearMenuItems( comboBoxName );
	
	for k,v in ipairs(HealGridMouseClick.comboBoxFrameTypeList) do
		ComboBoxAddMenuItem( comboBoxName, v.label );
	end

end

function HealGridMouseClick.ComboBoxFrameTypeActivateChoices( comboBoxName, selectedFrameType )

	ComboBoxSetSelectedMenuItem( comboBoxName, 0 );

	for k,v in ipairs(HealGridMouseClick.comboBoxFrameTypeList) do
		if ( selectedFrameType ~= nil and selectedFrameType == v.key ) then
			ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function HealGridMouseClick.ComboBoxFrameTypeGetSelected( comboBoxName )

	local item = ComboBoxGetSelectedMenuItem( comboBoxName );

	if ( HealGridMouseClick.comboBoxFrameTypeList[item] ) then
		return( HealGridMouseClick.comboBoxFrameTypeList[item].key );
	end

end
-- ==============================================================================================
-- ComboBox for target-type
-- ==============================================================================================

function HealGridMouseClick.ComboBoxTargetTypeInitChoices( comboBoxName )

	ComboBoxClearMenuItems( comboBoxName );
	
	for k,v in ipairs(HealGridMouseClick.comboBoxTargetTypeList) do
		ComboBoxAddMenuItem( comboBoxName, v.label );
	end

end

function HealGridMouseClick.ComboBoxTargetTypeActivateChoices( comboBoxName, selectedTargetType )

	ComboBoxSetSelectedMenuItem( comboBoxName, 0 );

	for k,v in ipairs(HealGridMouseClick.comboBoxTargetTypeList) do
		if ( selectedTargetType ~= nil and selectedTargetType == v.key ) then
			ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function HealGridMouseClick.ComboBoxTargetTypeGetSelected( comboBoxName )

	local item = ComboBoxGetSelectedMenuItem( comboBoxName );

	if ( HealGridMouseClick.comboBoxTargetTypeList[item] ) then
		return( HealGridMouseClick.comboBoxTargetTypeList[item].key );
	end

end

-- ==============================================================================================
-- ComboBox for mouse-button
-- ==============================================================================================

function HealGridMouseClick.ComboBoxMouseButtonInitChoices( comboBoxName )

	ComboBoxClearMenuItems( comboBoxName );
	
	for k,v in ipairs(HealGridMouseClick.comboBoxMouseButtonList) do
		ComboBoxAddMenuItem( comboBoxName, v.label );
	end

end

function HealGridMouseClick.ComboBoxMouseButtonActivateChoices( comboBoxName, selectedMouseButton )

	ComboBoxSetSelectedMenuItem( comboBoxName, 0 );

	for k,v in ipairs(HealGridMouseClick.comboBoxMouseButtonList) do
		if ( selectedMouseButton ~= nil and selectedMouseButton == v.key ) then
			ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function HealGridMouseClick.ComboBoxMouseButtonGetSelected( comboBoxName )

	local item = ComboBoxGetSelectedMenuItem( comboBoxName );

	if ( HealGridMouseClick.comboBoxMouseButtonList[item] ) then
		return( HealGridMouseClick.comboBoxMouseButtonList[item].key );
	end

end

-- ==============================================================================================
-- ComboBox for actions
-- ==============================================================================================

function HealGridMouseClick.ComboBoxActionInitChoices( comboBoxName )

	ComboBoxClearMenuItems( comboBoxName );
	
	for k,v in ipairs(HealGridMouseClick.comboBoxActionList) do
		ComboBoxAddMenuItem( comboBoxName, v.label );
	end

end

function HealGridMouseClick.ComboBoxActionActivateChoices( comboBoxName, selectedAction )

	ComboBoxSetSelectedMenuItem( comboBoxName, 0 );

	for k,v in ipairs(HealGridMouseClick.comboBoxActionList) do
		if ( selectedAction ~= nil and selectedAction == v.key ) then
			ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function HealGridMouseClick.ComboBoxActionGetSelected( comboBoxName )

	local item = ComboBoxGetSelectedMenuItem( comboBoxName );

	if ( HealGridMouseClick.comboBoxActionList[item] ) then
		return( HealGridMouseClick.comboBoxActionList[item].key );
	end

end

-- ==============================================================================================
-- ComboBox for morale-levels
-- ==============================================================================================

function HealGridMouseClick.ComboBoxMoraleInitChoices( comboBoxName )

	ComboBoxClearMenuItems( comboBoxName );
	
	for k,v in ipairs(HealGridMouseClick.comboBoxMoraleList) do
		ComboBoxAddMenuItem( comboBoxName, v.label );
	end

end

function HealGridMouseClick.ComboBoxMoraleActivateChoices( comboBoxName, selectedMorale )

	ComboBoxSetSelectedMenuItem( comboBoxName, 0 );

	for k,v in ipairs(HealGridMouseClick.comboBoxMoraleList) do
		if ( selectedMorale ~= nil and selectedMorale == v.key ) then
			ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function HealGridMouseClick.ComboBoxMoraleGetSelected( comboBoxName )

	local item = ComboBoxGetSelectedMenuItem( comboBoxName );

	if ( HealGridMouseClick.comboBoxMoraleList[item] ) then
		return( HealGridMouseClick.comboBoxMoraleList[item].key );
	end

end

-- ==============================================================================================
-- ComboBox for pet-commands
-- ==============================================================================================

function HealGridMouseClick.ComboBoxCommandPetInitChoices( comboBoxName )

	ComboBoxClearMenuItems( comboBoxName );
	
	for k,v in ipairs(HealGridMouseClick.comboBoxCommandPetList) do
		ComboBoxAddMenuItem( comboBoxName, v.label );
	end

end

function HealGridMouseClick.ComboBoxCommandPetActivateChoices( comboBoxName, selectedPetCommand )

	ComboBoxSetSelectedMenuItem( comboBoxName, 0 );

	for k,v in ipairs(HealGridMouseClick.comboBoxCommandPetList) do
		if ( selectedPetCommand ~= nil and selectedPetCommand == v.key ) then
			ComboBoxSetSelectedMenuItem( comboBoxName, k );
		end
	end

end

function HealGridMouseClick.ComboBoxCommandPetGetSelected( comboBoxName )

	local item = ComboBoxGetSelectedMenuItem( comboBoxName );

	if ( HealGridMouseClick.comboBoxCommandPetList[item] ) then
		return( HealGridMouseClick.comboBoxCommandPetList[item].key );
	end

end

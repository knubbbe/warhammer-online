--[[

effectIndex = (number)
name = (wstring)
effectText = (wstring)
stackCount = (number)
iconNum = (number)
castByPlayer = (bool)
duration = (number)
abilityId = (number)

typeColorRed = (number)
typeColorGreen = (number)
typeColorBlue = (number)

permanentUntilDispelled = (bool)
isCasterDispellable = (bool)

isGranted = (bool)
isPassive = (bool)
isOffensive = (bool)
isDefensive = (bool)

isBuff = (bool)
isDebuff = (bool)

isAilment = (bool) [opt]
isCripple = (bool) [opt]
isCurse = (bool) [opt]
isDamaging = (bool)
isHex = (bool) [opt]

isBlessing = (bool)
isHealing = (bool)
isStatsBuff = (bool)

########## some indexes only per buff/debuff ######################################

]]



HealGridBuffTrack = {};

HealGridBuffTrack.trackedBuffsByName = {};						-- name index for HealGrid.trackedBuffs		[buffName] = [HealGridSettings.trackeBuffs[>>INDEX<<]]

-- ========================================================================================
-- Initialization
-- ========================================================================================

function HealGridBuffTrack.Initialize()

	HealGridBuffTrack.CreateBuffMap();																		-- when reloading addon

end

-- ========================================================================================
-- Shutdown
-- ========================================================================================

function HealGridBuffTrack.Shutdown()

end

-- ========================================================================================
-- Create buff map
-- ========================================================================================

function HealGridBuffTrack.CreateBuffMap()

	local abilityID, abilityData;

	HealGridBuffTrack.trackedBuffsByName = {};

	for k,_ in pairs(HealGridSettings[HealGrid.settingsIndex].trackedBuffs) do
		HealGridBuffTrack.trackedBuffsByName[HealGridSettings[HealGrid.settingsIndex].trackedBuffs[k].buffName] = k;
	end

end

-- ========================================================================================
-- Should I track the buff
--
-- filter true means: track it, NOT exclude it
-- ========================================================================================

function HealGridBuffTrack.ShouldTrack( tbi, unitObj, castByPlayer )			-- tbi = trackedBuffsIndex

	if ( castByPlayer and (not HealGridSettings[HealGrid.settingsIndex].trackedBuffs[tbi].filterCastBySelf) ) then
		return( false );
	end

	if ( (not castByPlayer) and (not HealGridSettings[HealGrid.settingsIndex].trackedBuffs[tbi].filterCastByOther) ) then
		return( false );
	end

	if ( unitObj:UnitIsFriend() and (not HealGridSettings[HealGrid.settingsIndex].trackedBuffs[tbi].filterCastOnFriendly) ) then
		return( false );
	end

	if ( unitObj:UnitIsHostile() and (not HealGridSettings[HealGrid.settingsIndex].trackedBuffs[tbi].filterCastOnHostile) ) then
		return( false );
	end

	return( true );

end

GuidanceCounselor = { }

GuidanceCounselor.CareerIconIdToColorLikeIcon =
{
	[20180] = { r = 175, g = 206, b = 234 },	-- | Archmage
	[20181] = { r =  88, g =  17, b =  76 },	-- | Blackguard
	[20182] = { r =  51, g = 115, b =  21 },	-- | Black Orc
	[20183] = { r = 255, g =  37, b =  10 },	-- | Bright Wizard
	[20184] = { r = 147, g = 200, b = 120 },	-- | Choppa
	[20185] = { r =  86, g =  89, b =  96 },	-- | Chosen
	[20186] = { r = 204, g =  43, b = 211 },	-- | Disciple of Khaine
	[20187] = { r = 232, g = 181, b = 128 },	-- | Engineer
	[20188] = { r = 179, g =   1, b =   1 },	-- | Slayer
	[20189] = { r = 155, g =  82, b =  65 },	-- | Ironbreaker
	[20190] = { r = 246, g = 106, b =  19 },	-- | Knight of the Blazing Sun
	[20191] = { r =  44, g =  81, b = 136 },	-- | Magus
	[20192] = { r = 177, g = 136, b = 134 },	-- | Marauder
	[20193] = { r = 246, g = 227, b = 148 },	-- | Rune Priest
	[20194] = { r =  60, g =  61, b =  78 },	-- | Shadow Warrior
	[20195] = { r = 147, g = 200, b = 120 },	-- | Shaman
	[20196] = { r =  92, g =  24, b = 125 },	-- | Sorcerer/Sorceress
	[20197] = { r =  60, g =  96, b =  48 },	-- | Squig Herder
	[20198] = { r =  52, g =  96, b = 159 },	-- | Swordmaster
	[20199] = { r = 237, g = 129, b = 100 },	-- | Warrior Priest
	[20200] = { r = 227, g = 240, b = 246 },	-- | White Lion
	[20201] = { r = 188, g = 106, b = 204 },	-- | Witch Elf
	[20202] = { r = 150, g =  26, b =  18 },	-- | Witch Hunter
	[20203] = { r = 144, g = 142, b = 145 },	-- | Zealot
}

GuidanceCounselor.CareerIconIdToArchetypeId =
{
	[20189] = "TANK",	-- | Ironbreaker
	[20198] = "TANK",	-- | Swordmaster
	[20185] = "TANK",	-- | Chosen
	[20182] = "TANK",	-- | Black Orc
	[20181] = "TANK",	-- | Blackguard
	[20190] = "TANK",	-- | Knight of the Blazing Sun
	
	[20184] = "MPDPS",	-- | Choppa
	[20188] = "MPDPS",	-- | Slayer
	[20200] = "MPDPS",	-- | White Lion
	[20202] = "MPDPS",	-- | Witch Hunter
	[20192] = "MPDPS",	-- | Marauder
	[20201] = "MPDPS",	-- | Witch Elf
	
	[20187] = "RPDPS",	-- | Engineer
	[20194] = "RPDPS",	-- | Shadow Warrior
	[20197] = "RPDPS",	-- | Squig Herder
	
	[20183] = "RMDPS",	-- | Bright Wizard
	[20191] = "RMDPS",	-- | Magus
	[20196] = "RMDPS",	-- | Sorcerer
	[20196] = "RMDPS",	-- | Sorceress
	
	[20199] = "MSUPP",	-- | Warrior Priest
	[20186] = "MSUPP",	-- | Disciple of Khaine
	
	[20193] = "RSUPP",	-- | Rune Priest
	[20180] = "RSUPP",	-- | Archmage
	[20203] = "RSUPP",	-- | Zealot
	[20195] = "RSUPP",	-- | Shaman
}

-- | Credit + Cookie (::) to Aiiane for CleanUnitFrames + Squared
-- | http://www.curseforge.com/profiles/Aiiane/
-- | archetype colors used in GuidanceCounselor are copied from the popular AddOns mentioned above

GuidanceCounselor.ArchetypeIdToArchetypeColor =
{
	TANK  = { r = 205, g = 140, b =  60 },	-- | Brown			-> Tanks
	MPDPS = { r = 255, g =  80, b =  80 },	-- | Red			-> Melee Physical DPS
	RPDPS = { r = 255, g = 180, b =   0 },	-- | Orange			-> Ranged Physical DPS
	RMDPS = { r = 255, g = 255, b =  60 },	-- | Yellow			-> Ranged Magical DPS
	MSUPP = { r = 180, g = 120, b = 255 },	-- | Lavender		-> Melee Support
	RSUPP = { r = 160, g = 170, b = 255 },	-- | Light Blue		-> Ranged Support
}

function GuidanceCounselor.Color( careerLine, colorType )
	
	local careerIconId		= Icons.GetCareerIconIDFromCareerLine( careerLine )
	local iconColor			= GuidanceCounselor.CareerIconIdToColorLikeIcon[careerIconId]
	local archetypeId		= GuidanceCounselor.CareerIconIdToArchetypeId[careerIconId]
	local archetypeColor	= GuidanceCounselor.ArchetypeIdToArchetypeColor[archetypeId]
	-- | local archetypeColor = GuidanceCounselor.ArchetypeIdToArchetypeColor[GuidanceCounselor.CareerIconIdToArchetypeId[careerIconId]]
	
	if colorType == "archetype" then
		return archetypeColor
	end
	
	if colorType == "icon" then
		return iconColor
	end
end

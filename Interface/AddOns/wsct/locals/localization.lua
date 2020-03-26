--Locals
WSCT.LOCALS = {}
WSCT.LOCALS.EXAMPLE = L"SCT"
WSCT.LOCALS.EXAMPLE2 = L"SCT2"
WSCT.LOCALS.EXAMPLE3 = L"SCT3"

--Everything From here on would need to be translated and put
--into if statements for each specific language.

--***********
--ENGLISH
--***********

WSCT.LOCALS.NAME = L"WSCT "..WSCT.Version

-- Static Messages
WSCT.LOCALS.LowHP = L"Low Health! (%d)"
WSCT.LOCALS.Combat = L"+Combat"
WSCT.LOCALS.NoCombat = L"-Combat"
WSCT.LOCALS.ComboPoint = L"CP"
WSCT.LOCALS.FiveCPMessage = L"Finish It!"
WSCT.LOCALS.Interrupted = L"Interrupted!"
WSCT.LOCALS.Dispel = L"Removed!"
WSCT.LOCALS.DispelFailed = L"Dispel Failed!"
WSCT.LOCALS.Pet = L"Pet: "
WSCT.LOCALS.Morale = L"Morale %d Ready!"
WSCT.LOCALS.AP = L"+%d AP"

--class resource message
WSCT.LOCALS.BlackOrc1 = L"Da Gud Plan"
WSCT.LOCALS.BlackOrc2 = L"Da Best Plan"

--Option messages
WSCT.LOCALS.STARTUP = WSCT.LOCALS.NAME..L" loaded. Type /wsct for options.";

--Warnings

--nouns
WSCT.LOCALS.PROFILE_RESET = "Profile Settings Reset";

--Fonts
WSCT.LOCALS.FONTS = {
  [1] = {font="font_journal_text_huge", label=L"Cronos Pro"},
  [2] = {font="font_clear_large", label=L"Myriad Pro"},
  [3] = {font="font_clear_large_bold", label=L"Myriad Pro Bold"},
  [4] = {font="font_journal_sub_heading", label=L"Age Of Reckoning"},
  [5] = {font="font_default_war_heading", label=L"Age Of Reckoning Outline"},
  [6] = {font="font_heading_small_no_shadow", label=L"Caslon"},
  [7] = {font="font_default_medium_heading", label=L"Caslon Outline"},
  [8] = {font="font_heading_default", label=L"Caslon Shadow"},
}

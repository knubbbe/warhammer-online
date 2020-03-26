WSCT.LOCALS.OPTION = {}
--titles
WSCT.LOCALS.OPTION.TITLE = {label=L"WSCT Options "..WSCT.Version, tooltiptext = L"Left Click to Drag"}
WSCT.LOCALS.OPTION.EVENTTITLE = {label=L"Event Category", tooltiptext = nil}
WSCT.LOCALS.OPTION.FRAMETITLE = {label=L"Current Frame", tooltiptext = nil}
WSCT.LOCALS.OPTION.PROFILETITLE = {label=L"Default Profiles", tooltiptext = nil}
WSCT.LOCALS.OPTION.CUSTOMPROFILETITLE = {label=L"More profile options coming soon...", tooltiptext = nil}

--tooltips
WSCT.LOCALS.OPTION.CRITMOUSE = L"Always make this event appear a crit"
WSCT.LOCALS.OPTION.FRAMEMOUSE = L"Select which frame to send this event to"

--Tabs
WSCT.LOCALS.OPTION.EVENT =   {label=L"Events",    tooltiptext = nil}
WSCT.LOCALS.OPTION.FRAME =   {label=L"Frames",    tooltiptext = nil}
WSCT.LOCALS.OPTION.ANIM =    {label=L"Animation", tooltiptext = nil}
WSCT.LOCALS.OPTION.MISC =    {label=L"Misc",      tooltiptext = nil}
WSCT.LOCALS.OPTION.PROFILE = {label=L"Profiles",  tooltiptext = nil}

--Events
WSCT.LOCALS.OPTION.CRIT           = {label=L"Crit", tooltiptext = L"Always shows this event as a crit"}
WSCT.LOCALS.OPTION.SHOWHIT        = {label=L"Incoming Damage", tooltiptext = L"Show damage done to you"}
WSCT.LOCALS.OPTION.SHOWPARRY      = {label=L"Incoming Parry",   tooltiptext = L"Show when you Parry an attack"}
WSCT.LOCALS.OPTION.SHOWDODGE      = {label=L"Incoming Dodge",   tooltiptext = L"Show when you Dodge an attack"}
WSCT.LOCALS.OPTION.SHOWBLOCK      = {label=L"Incoming Block",   tooltiptext = L"Show when you Block an attack"}
WSCT.LOCALS.OPTION.SHOWSPELL      = {label=L"Incoming Spells", tooltiptext = L"Show Spell/Skill damage done to you"}
WSCT.LOCALS.OPTION.SHOWHEAL       = {label=L"Incoming Heals", tooltiptext = L"Show heals done to you"}
WSCT.LOCALS.OPTION.SHOWRESIST     = {label=L"Incoming Disrupts", tooltiptext = L"Show when you disrupt an attack"}
WSCT.LOCALS.OPTION.SHOWABSORB     = {label=L"Incoming Absorb", tooltiptext = L"Show when you absorb an attack"}
WSCT.LOCALS.OPTION.SHOWLOWHP      = {label=L"Low Health", tooltiptext = L"Warn when you are low on health"}
WSCT.LOCALS.OPTION.SHOWCOMBAT     = {label=L"Combat", tooltiptext = L"Show when you enter or exit combat"}
WSCT.LOCALS.OPTION.SHOWXP         = {label=L"Experience", tooltiptext = L"Show when you gain Experience"}
WSCT.LOCALS.OPTION.SHOWRENOWN     = {label=L"Renown", tooltiptext = L"Show when you gain Renown"}
WSCT.LOCALS.OPTION.SHOWINF        = {label=L"Influence", tooltiptext = L"Show when you gain Influence"}
WSCT.LOCALS.OPTION.SHOWMORALE     = {label=L"Morale Alert", tooltiptext = L"Alert when a Morale Ability is ready"}
WSCT.LOCALS.OPTION.SHOWDEBUFF     = {label=L"Debuffs", tooltiptext = L"Show when you gain a debuff"}
WSCT.LOCALS.OPTION.SHOWDEBUFFFADE = {label=L"Debuff Fades", tooltiptext = L"Show when you lose a debuff"}
WSCT.LOCALS.OPTION.SHOWAP         = {label=L"Action Point Gain", tooltiptext = L"Show when you gain action points"}
WSCT.LOCALS.OPTION.SHOWRESOURCE   = {label=L"Career Resource", tooltiptext = L"Show when your career resource changes (doesn't show when it is empry or resets)"}
WSCT.LOCALS.OPTION.SHOWBUFF       = {label=L"Buffs", tooltiptext = L"Show when you gain a buff"}
WSCT.LOCALS.OPTION.SHOWBUFFFADE   = {label=L"Buff Fades", tooltiptext = L"Show when you lose a buff"}
WSCT.LOCALS.OPTION.SHOWHITOUT     = {label=L"Outgoing Damage", tooltiptext = L"Show damage you or your pet do"}
WSCT.LOCALS.OPTION.SHOWPARRYOUT   = {label=L"Outgoing Parry",   tooltiptext = L"Show when you or your pet Parry an attack"}
WSCT.LOCALS.OPTION.SHOWDODGEOUT   = {label=L"Outgoing Dodge",   tooltiptext = L"Show when you or your pet Dodge an attack"}
WSCT.LOCALS.OPTION.SHOWBLOCKOUT   = {label=L"Outgoing Block",   tooltiptext = L"Show when you or your pet Block an attack"}
WSCT.LOCALS.OPTION.SHOWSPELLOUT   = {label=L"Outgoing Spells", tooltiptext = L"Show Spell/Skill damage you or your pet do"}
WSCT.LOCALS.OPTION.SHOWHEALOUT    = {label=L"Outgoing Heals", tooltiptext = L"Show heals you do"}
WSCT.LOCALS.OPTION.SHOWRESISTOUT  = {label=L"Outgoing Disrupt", tooltiptext = L"Show when your or your pet attacks are disrupted"}
WSCT.LOCALS.OPTION.SHOWABSORBOUT  = {label=L"Outgoing Absorb", tooltiptext = L"Show when your or your pet attacks are absorbed"}

--CheckBoxes
WSCT.LOCALS.OPTION.STICKYCRIT     = {label=L"Sticky Crits", tooltiptext = L"Crits will stick out from normal text"}
WSCT.LOCALS.OPTION.FLASHCRIT      = {label=L"Flash Crits", tooltiptext = L"Crits Flash into view, showing from larger to smaller"}
WSCT.LOCALS.OPTION.FPSMODE        = {label=L"FPS Mode", tooltiptext = L"On - smooth animation, Off - consistent animation"}
WSCT.LOCALS.OPTION.PETFLAG        = {label=L"Flag Pet Damge", tooltiptext = L"Adds 'Pet:' to incoming pet damge"}
WSCT.LOCALS.OPTION.PLAYSOUND      = {label=L"Low Health Sound", tooltiptext = L"Plays a sound with a low health warning"}
WSCT.LOCALS.OPTION.DIRECTION      = {label=L"Scroll Text Down", tooltiptext = L"Scrolls text Down instead of the default Up"}
WSCT.LOCALS.OPTION.ATOBJECT       = {label=L"Display at 3D Object", tooltiptext = L"Displays events at the 3D World Object associated with it, intead of the X and Y location. If world object is not visible, event will fall back to the X and Y location. "}
WSCT.LOCALS.OPTION.FLAGDAMAGE     = {label=L"Negative Flag", tooltiptext = L"Displays a negative sign on outgoing damage."}
WSCT.LOCALS.OPTION.OUTDMGNAME     = {label=L"Outgoing Damage Names", tooltiptext = L"Show ability names on outgoing damage."}
WSCT.LOCALS.OPTION.INDMGNAME      = {label=L"Incoming Damage Names", tooltiptext = L"Show ability names on incoming damage."}
WSCT.LOCALS.OPTION.OUTHEALNAME    = {label=L"Outgoing Healing Names", tooltiptext = L"Show ability names on outgoing heals."}
WSCT.LOCALS.OPTION.INHEALNAME     = {label=L"Incoming Healing Names", tooltiptext = L"Show ability names on incoming heals."}
WSCT.LOCALS.OPTION.BUFFTYPE       = {label=L"Buff Types", tooltiptext = L"Shows the type of buff/debuff."}
WSCT.LOCALS.OPTION.TRUNCATE       = {label=L"Truncate Names", tooltiptext = L"Truncate the ability names based on length."}
WSCT.LOCALS.OPTION.ICON           = {label=L"Skill Icons", tooltiptext = L"Show icons for your skills. (doesn't work for pets or others skills currently)"}

--Sliders
WSCT.LOCALS.OPTION.ANIMATIONSPEED = {label=L"Animation Speed", tooltiptext = L"Controls the speed at which the animation scrolls", minLabel=L"Faster", maxLabel=L"Slower"}
WSCT.LOCALS.OPTION.MOVEMENT       = {label=L"Movement Distance", tooltiptext = L"Controls the movement distance of the animation between each update", minLabel=L"Smaller", maxLabel=L"Larger"}
WSCT.LOCALS.OPTION.LOWHP          = {label=L"Low Health Percent", tooltiptext = L"Controls the percent of health needed to give a low health warning", minLabel=L"10%", maxLabel=L"90%"}
WSCT.LOCALS.OPTION.HEALFILTER     = {label=L"Heal Filter", tooltiptext = L"Controls the minimum amount a heal needs to heal for in order to appear", minLabel=L"0", maxLabel=L"500"}
WSCT.LOCALS.OPTION.DMGFILTER      = {label=L"Damage Filter", tooltiptext = L"Controls the minimum amount damage needs to be in order to appear", minLabel=L"0", maxLabel=L"500"}
WSCT.LOCALS.OPTION.TEXTSIZE       = {label=L"Font Size", tooltiptext = L"Controls the size of the font", minLabel=L"Smaller", maxLabel=L"Larger"}
WSCT.LOCALS.OPTION.ALPHA          = {label=L"Font Opacity", tooltiptext = L"Controls the opacity of the font", minLabel=L"0%", maxLabel=L"100%"}
WSCT.LOCALS.OPTION.XOFFSET        = {label=L"Center X Position", tooltiptext = L"Controls the placement of the text center", minLabel=L"-600", maxLabel=L"600"}
WSCT.LOCALS.OPTION.YOFFSET        = {label=L"Center Y Position", tooltiptext = L"Controls the placement of the text center", minLabel=L"-600", maxLabel=L"600"}
WSCT.LOCALS.OPTION.GAPDIST        = {label=L"HUD Text Gap Distance", tooltiptext = L"Controls the distance from the center for the HUD animation. Useful when wanting to keep eveything centered but adjust the distance from center", minLabel=L"0", maxLabel=L"400"}
WSCT.LOCALS.OPTION.TRUNCATESIZE   = {label=L"Truncate Size", tooltiptext = L"Set the length for an ability name to begin truncates", minLabel=L"0", maxLabel=L"15"}

--Buttons
WSCT.LOCALS.OPTION.COLORBUTTON = L"Color"
WSCT.LOCALS.OPTION.TESTBUTTON = {label=L"Test", tooltiptext = nil}
WSCT.LOCALS.OPTION.LOADBUTTON = {label=L"Load", tooltiptext = nil}

--Defined ComboBoxes
--Frames
WSCT.LOCALS.OPTION.FRAMECOMBO = {
  [1] = L"Frame 1",
  [2] = L"Frame 2",
  [3] = L"Frame 3",
}
--Event categories
WSCT.LOCALS.OPTION.EVENTCOMBO = {
  [1] = L"Incoming",
  [2] = L"Outgoing",
  [3] = L"Notifications",
}
--Animation Types
WSCT.LOCALS.OPTION.ANITYPECOMBO = {
  [1] = L"Vertical",
  [2] = L"Rainbow",
  [3] = L"Horizontal",
  [4] = L"Angled Down",
  [5] = L"Angled Up",
  [6] = L"Sprinkler",
  [7] = L"HUD Curved",
  [8] = L"HUD Angled",
}
--Alignments
WSCT.LOCALS.OPTION.ALIGNCOMBO = {
  [1] = L"Left",
  [2] = L"Center",
  [3] = L"Right",
  [4] = L"HUD Centered",
}
--Side types
WSCT.LOCALS.OPTION.ANISIDETYPECOMBO = {
  [1] = L"Alternating",
  [2] = L"Damage Left",
  [3] = L"Damage Right",
  [4] = L"All Left",
  [5] = L"All Right",
}
--Default Profiles
WSCT.LOCALS.OPTION.PROFILECOMBO = {
  [1] = L"Default",
  [2] = L"Warhammer",
  [3] = L"Classic",
  [4] = L"Split",
  [5] = L"Triangle",
}

--Truncate Types
WSCT.LOCALS.OPTION.TRUNCATETYPECOMBO = {
  [1] = L"Truncate",
  [2] = L"Abbreviate",
}

--Icons Side Types
WSCT.LOCALS.OPTION.ICONSIDECOMBO = {
  [1] = L"Right",
  [2] = L"Left",
  [3] = L"HUD Outer",
  [4] = L"HUD Inner",
}

--ComboBoxes
WSCT.LOCALS.OPTION.FONT = { label=L"Font", tooltiptext = L"What font to use", data = WSCT.LOCALS.FONTS}
WSCT.LOCALS.OPTION.ANITYPE = { label=L"Animation Type", tooltiptext = L"What animation to use", data = WSCT.LOCALS.OPTION.ANITYPECOMBO}
WSCT.LOCALS.OPTION.ALIGN = { label=L"Text Alignment", tooltiptext = L"How the text aligns itself. Most useful for vertical or HUD animations. HUD alignment will make left side right-aligned and right side left-aligned.", data = WSCT.LOCALS.OPTION.ALIGNCOMBO}
WSCT.LOCALS.OPTION.ANISIDETYPE = { label=L"Side Style", tooltiptext = L"How multi-side animations should assign text side", data = WSCT.LOCALS.OPTION.ANISIDETYPECOMBO}
WSCT.LOCALS.OPTION.TRUNCATETYPE = { label=L"Truncate Type", tooltiptext = L"How to truncate ability names", data = WSCT.LOCALS.OPTION.TRUNCATETYPECOMBO}
WSCT.LOCALS.OPTION.ICONSIDE = { label=L"Icon Side", tooltiptext = L"Which side of text icons should appear on", data = WSCT.LOCALS.OPTION.ICONSIDECOMBO}

--examples
WSCT.LOCALS.OPTION.EXAMPLES = {
  [1] = {name="WSCTExample1", label=WSCT.LOCALS.OPTION.FRAMECOMBO[1], frame=WSCT.FRAME1},
  [2] = {name="WSCTExample2", label=WSCT.LOCALS.OPTION.FRAMECOMBO[2], frame=WSCT.FRAME2},
  [3] = {name="WSCTExample3", label=WSCT.LOCALS.OPTION.FRAMECOMBO[3], frame=WSCT.FRAME3},
}



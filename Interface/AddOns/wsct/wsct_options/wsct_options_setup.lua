WSCT.OPTIONS = {}

WSCT.OPTIONS.Windows = {}
WSCT.OPTIONS.Windows.WSCTOptionsTitle= { type="title", label = WSCT.LOCALS.OPTION.TITLE.label, tooltiptext = WSCT.LOCALS.OPTION.TITLE.tooltiptext}

--Labels
WSCT.OPTIONS.Windows.WSCTOptionsEventWindowLabel= { type="label", label = WSCT.LOCALS.OPTION.EVENTTITLE.label, tooltiptext = WSCT.LOCALS.OPTION.EVENTTITLE.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsFrameWindowLabel= { type="label", label = WSCT.LOCALS.OPTION.FRAMETITLE.label, tooltiptext = WSCT.LOCALS.OPTION.FRAMETITLE.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsProfileWindowLabel= { type="label", label = WSCT.LOCALS.OPTION.PROFILETITLE.label, tooltiptext = WSCT.LOCALS.OPTION.PROFILETITLE.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsProfileWindowCustomLabel= { type="label", label = WSCT.LOCALS.OPTION.CUSTOMPROFILETITLE.label, tooltiptext = WSCT.LOCALS.OPTION.CUSTOMPROFILETITLE.tooltiptext}

--Tabs
WSCT.OPTIONS.Windows.WSCTOptionsTabEvent = { type="button", label = WSCT.LOCALS.OPTION.EVENT.label, tooltiptext = WSCT.LOCALS.OPTION.EVENT.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsTabFrame = { type="button", label = WSCT.LOCALS.OPTION.FRAME.label, tooltiptext = WSCT.LOCALS.OPTION.FRAME.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsTabAnim = { type="button", label = WSCT.LOCALS.OPTION.ANIM.label, tooltiptext = WSCT.LOCALS.OPTION.ANIM.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsTabMisc = { type="button", label = WSCT.LOCALS.OPTION.MISC.label, tooltiptext = WSCT.LOCALS.OPTION.MISC.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsTabProfile = { type="button", label = WSCT.LOCALS.OPTION.PROFILE.label, tooltiptext = WSCT.LOCALS.OPTION.PROFILE.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsTestButton = { type="button", label = WSCT.LOCALS.OPTION.TESTBUTTON.label, tooltiptext = WSCT.LOCALS.OPTION.TESTBUTTON.tooltiptext}
WSCT.OPTIONS.Windows.WSCTOptionsLoadProfileButton = { type="button", label = WSCT.LOCALS.OPTION.LOADBUTTON.label, tooltiptext = WSCT.LOCALS.OPTION.LOADBUTTON.tooltiptext}

--Events
WSCT.INCOMING = 1
WSCT.OUTGOING = 2
WSCT.NOTIFY = 3
WSCT.OPTIONS.Windows.WSCTEventSHOWHIT = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWHIT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWHIT.tooltiptext, var = "SHOWHIT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWPARRY = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWPARRY.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWPARRY.tooltiptext, var = "SHOWPARRY"}
WSCT.OPTIONS.Windows.WSCTEventSHOWDODGE = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWDODGE.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWDODGE.tooltiptext, var = "SHOWDODGE"}
WSCT.OPTIONS.Windows.WSCTEventSHOWBLOCK = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWBLOCK.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWBLOCK.tooltiptext, var = "SHOWBLOCK"}
WSCT.OPTIONS.Windows.WSCTEventSHOWSPELL = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWSPELL.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWSPELL.tooltiptext, var = "SHOWSPELL"}
WSCT.OPTIONS.Windows.WSCTEventSHOWHEAL = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWHEAL.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWHEAL.tooltiptext, var = "SHOWHEAL"}
WSCT.OPTIONS.Windows.WSCTEventSHOWRESIST = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWRESIST.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWRESIST.tooltiptext, var = "SHOWRESIST"}
WSCT.OPTIONS.Windows.WSCTEventSHOWABSORB = { type="event", category=WSCT.INCOMING, label = WSCT.LOCALS.OPTION.SHOWABSORB.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWABSORB.tooltiptext, var = "SHOWABSORB"}
WSCT.OPTIONS.Windows.WSCTEventSHOWLOWHP = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWLOWHP.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWLOWHP.tooltiptext, var = "SHOWLOWHP"}
WSCT.OPTIONS.Windows.WSCTEventSHOWCOMBAT = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWCOMBAT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWCOMBAT.tooltiptext, var = "SHOWCOMBAT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWXP = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWXP.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWXP.tooltiptext, var = "SHOWXP"}
WSCT.OPTIONS.Windows.WSCTEventSHOWRENOWN = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWRENOWN.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWRENOWN.tooltiptext, var = "SHOWRENOWN"}
WSCT.OPTIONS.Windows.WSCTEventSHOWINF = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWINF.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWINF.tooltiptext, var = "SHOWINF"}
WSCT.OPTIONS.Windows.WSCTEventSHOWMORALE = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWMORALE.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWMORALE.tooltiptext, var = "SHOWMORALE"}
WSCT.OPTIONS.Windows.WSCTEventSHOWDEBUFF = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWDEBUFF.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWDEBUFF.tooltiptext, var = "SHOWDEBUFF"}
WSCT.OPTIONS.Windows.WSCTEventSHOWDEBUFFFADE= { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWDEBUFFFADE.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWDEBUFFFADE.tooltiptext, var = "SHOWDEBUFFFADE"}
WSCT.OPTIONS.Windows.WSCTEventSHOWBUFF = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWBUFF.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWBUFF.tooltiptext, var = "SHOWBUFF"}
WSCT.OPTIONS.Windows.WSCTEventSHOWBUFFFADE = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWBUFFFADE.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWBUFFFADE.tooltiptext, var = "SHOWBUFFFADE"}
WSCT.OPTIONS.Windows.WSCTEventSHOWAP = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWAP.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWAP.tooltiptext, var = "SHOWAP"}
WSCT.OPTIONS.Windows.WSCTEventSHOWRESOURCE = { type="event", category=WSCT.NOTIFY, label = WSCT.LOCALS.OPTION.SHOWRESOURCE.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWRESOURCE.tooltiptext, var = "SHOWRESOURCE"}
WSCT.OPTIONS.Windows.WSCTEventSHOWHITOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWHITOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWHITOUT.tooltiptext, var = "SHOWHITOUT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWPARRYOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWPARRYOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWPARRYOUT.tooltiptext, var = "SHOWPARRYOUT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWDODGEOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWDODGEOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWDODGEOUT.tooltiptext, var = "SHOWDODGEOUT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWBLOCKOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWBLOCKOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWBLOCKOUT.tooltiptext, var = "SHOWBLOCKOUT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWSPELLOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWSPELLOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWSPELLOUT.tooltiptext, var = "SHOWSPELLOUT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWHEALOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWHEALOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWHEALOUT.tooltiptext, var = "SHOWHEALOUT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWRESISTOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWRESISTOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWRESISTOUT.tooltiptext, var = "SHOWRESISTOUT"}
WSCT.OPTIONS.Windows.WSCTEventSHOWABSORBOUT = { type="event", category=WSCT.OUTGOING, label = WSCT.LOCALS.OPTION.SHOWABSORBOUT.label, tooltiptext = WSCT.LOCALS.OPTION.SHOWABSORBOUT.tooltiptext, var = "SHOWABSORBOUT"}

--Check Boxes
WSCT.OPTIONS.Windows.WSCTCheckboxSTICKYCRIT = {type="check", label = WSCT.LOCALS.OPTION.STICKYCRIT.label, tooltiptext = WSCT.LOCALS.OPTION.STICKYCRIT.tooltiptext, table = nil, var = "STICKYCRIT"}
WSCT.OPTIONS.Windows.WSCTCheckboxFLASHCRIT = {type="check", label = WSCT.LOCALS.OPTION.FLASHCRIT.label, tooltiptext = WSCT.LOCALS.OPTION.FLASHCRIT.tooltiptext, table = nil, var = "FLASHCRIT"}
WSCT.OPTIONS.Windows.WSCTCheckboxFPSMODE = {type="check", label = WSCT.LOCALS.OPTION.FPSMODE.label, tooltiptext = WSCT.LOCALS.OPTION.FPSMODE.tooltiptext, table = nil, var = "FPSMODE"}
WSCT.OPTIONS.Windows.WSCTCheckboxPETFLAG = {type="check", label = WSCT.LOCALS.OPTION.PETFLAG.label, tooltiptext = WSCT.LOCALS.OPTION.PETFLAG.tooltiptext, table = nil, var = "PETFLAG"}
WSCT.OPTIONS.Windows.WSCTCheckboxPLAYSOUND = {type="check", label = WSCT.LOCALS.OPTION.PLAYSOUND.label, tooltiptext = WSCT.LOCALS.OPTION.PLAYSOUND.tooltiptext, table = nil, var = "PLAYSOUND"}
WSCT.OPTIONS.Windows.WSCTCheckboxDIRECTION = {type="check", label = WSCT.LOCALS.OPTION.DIRECTION.label, tooltiptext = WSCT.LOCALS.OPTION.DIRECTION.tooltiptext, table = WSCT.FRAME1, var = "DIRECTION"}
WSCT.OPTIONS.Windows.WSCTCheckboxATOBJECT = {type="check", label = WSCT.LOCALS.OPTION.ATOBJECT.label, tooltiptext = WSCT.LOCALS.OPTION.ATOBJECT.tooltiptext, table = WSCT.FRAME1, var = "ATOBJECT"}
WSCT.OPTIONS.Windows.WSCTCheckboxFLAGDAMAGE = {type="check", label = WSCT.LOCALS.OPTION.FLAGDAMAGE.label, tooltiptext = WSCT.LOCALS.OPTION.FLAGDAMAGE.tooltiptext, table = nil, var = "FLAGDAMAGE"}
WSCT.OPTIONS.Windows.WSCTCheckboxOUTDMGNAME = {type="check", label = WSCT.LOCALS.OPTION.OUTDMGNAME.label, tooltiptext = WSCT.LOCALS.OPTION.OUTDMGNAME.tooltiptext, table = nil, var = "OUTDMGNAME"}
WSCT.OPTIONS.Windows.WSCTCheckboxINDMGNAME = {type="check", label = WSCT.LOCALS.OPTION.INDMGNAME.label, tooltiptext = WSCT.LOCALS.OPTION.INDMGNAME.tooltiptext, table = nil, var = "INDMGNAME"}
WSCT.OPTIONS.Windows.WSCTCheckboxOUTHEALNAME = {type="check", label = WSCT.LOCALS.OPTION.OUTHEALNAME.label, tooltiptext = WSCT.LOCALS.OPTION.OUTHEALNAME.tooltiptext, table = nil, var = "OUTHEALNAME"}
WSCT.OPTIONS.Windows.WSCTCheckboxINHEALNAME = {type="check", label = WSCT.LOCALS.OPTION.INHEALNAME.label, tooltiptext = WSCT.LOCALS.OPTION.INHEALNAME.tooltiptext, table = nil, var = "INHEALNAME"}
WSCT.OPTIONS.Windows.WSCTCheckboxBUFFTYPE = {type="check", label = WSCT.LOCALS.OPTION.BUFFTYPE.label, tooltiptext = WSCT.LOCALS.OPTION.BUFFTYPE.tooltiptext, table = nil, var = "BUFFTYPE"}
WSCT.OPTIONS.Windows.WSCTCheckboxTRUNCATE = {type="check", label = WSCT.LOCALS.OPTION.TRUNCATE.label, tooltiptext = WSCT.LOCALS.OPTION.TRUNCATE.tooltiptext, table = nil, var = "TRUNCATE"}
WSCT.OPTIONS.Windows.WSCTCheckboxICON = {type="check", label = WSCT.LOCALS.OPTION.ICON.label, tooltiptext = WSCT.LOCALS.OPTION.ICON.tooltiptext, table = WSCT.FRAME1, var = "ICON"}


--Sliders
WSCT.OPTIONS.Windows.WSCTSliderANIMATIONSPEED  = {type="slider", label = WSCT.LOCALS.OPTION.ANIMATIONSPEED.label, tooltiptext = WSCT.LOCALS.OPTION.ANIMATIONSPEED.tooltiptext, table = nil, var = "ANIMATIONSPEED", minValue = 5, maxValue = 25, valueStep = 5, minLabel=WSCT.LOCALS.OPTION.ANIMATIONSPEED.minLabel, maxLabel=WSCT.LOCALS.OPTION.ANIMATIONSPEED.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderMOVEMENT = {type="slider", label = WSCT.LOCALS.OPTION.MOVEMENT.label, tooltiptext = WSCT.LOCALS.OPTION.MOVEMENT.tooltiptext, table = nil, var = "MOVEMENT", minValue = 1, maxValue = 5, valueStep = 1, minLabel=WSCT.LOCALS.OPTION.MOVEMENT.minLabel, maxLabel=WSCT.LOCALS.OPTION.MOVEMENT.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderLOWHP = {type="slider", label = WSCT.LOCALS.OPTION.LOWHP.label, tooltiptext = WSCT.LOCALS.OPTION.LOWHP.tooltiptext, table = nil, var = "LOWHP", minValue = 10, maxValue = 90, valueStep = 5, minLabel=WSCT.LOCALS.OPTION.LOWHP.minLabel, maxLabel=WSCT.LOCALS.OPTION.LOWHP.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderHEALFILTER = {type="slider", label = WSCT.LOCALS.OPTION.HEALFILTER.label, tooltiptext = WSCT.LOCALS.OPTION.HEALFILTER.tooltiptext, table = nil, var = "HEALFILTER", minValue = 0, maxValue = 500, valueStep = 25, minLabel=WSCT.LOCALS.OPTION.HEALFILTER.minLabel, maxLabel=WSCT.LOCALS.OPTION.HEALFILTER.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderDMGFILTER = {type="slider", label = WSCT.LOCALS.OPTION.DMGFILTER.label, tooltiptext = WSCT.LOCALS.OPTION.DMGFILTER.tooltiptext, table = nil, var = "DMGFILTER", minValue = 0, maxValue = 500, valueStep = 25, minLabel=WSCT.LOCALS.OPTION.DMGFILTER.minLabel, maxLabel=WSCT.LOCALS.OPTION.DMGFILTER.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderTEXTSIZE = {type="slider", label = WSCT.LOCALS.OPTION.TEXTSIZE.label, tooltiptext = WSCT.LOCALS.OPTION.TEXTSIZE.tooltiptext, table = WSCT.FRAME1, var = "TEXTSIZE", minValue = 12, maxValue = 48, valueStep = 2, minLabel=WSCT.LOCALS.OPTION.TEXTSIZE.minLabel, maxLabel=WSCT.LOCALS.OPTION.TEXTSIZE.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderALPHA = {type="slider", label = WSCT.LOCALS.OPTION.ALPHA.label, tooltiptext = WSCT.LOCALS.OPTION.ALPHA.tooltiptext, table = WSCT.FRAME1, var = "ALPHA", minValue = 0, maxValue = 100, valueStep = 10, minLabel=WSCT.LOCALS.OPTION.ALPHA.minLabel, maxLabel=WSCT.LOCALS.OPTION.ALPHA.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderXOFFSET = {type="slider", label = WSCT.LOCALS.OPTION.XOFFSET.label, tooltiptext = WSCT.LOCALS.OPTION.XOFFSET.tooltiptext, table = WSCT.FRAME1, var = "XOFFSET", minValue = -600, maxValue = 600, valueStep = 10, minLabel=WSCT.LOCALS.OPTION.XOFFSET.minLabel, maxLabel=WSCT.LOCALS.OPTION.XOFFSET.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderYOFFSET = {type="slider", label = WSCT.LOCALS.OPTION.YOFFSET.label, tooltiptext = WSCT.LOCALS.OPTION.YOFFSET.tooltiptext, table = WSCT.FRAME1, var = "YOFFSET", minValue = -600, maxValue = 600, valueStep = 10, minLabel=WSCT.LOCALS.OPTION.YOFFSET.minLabel, maxLabel=WSCT.LOCALS.OPTION.YOFFSET.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderGAPDIST = {type="slider", label = WSCT.LOCALS.OPTION.GAPDIST.label, tooltiptext = WSCT.LOCALS.OPTION.GAPDIST.tooltiptext, table = WSCT.FRAME1, var = "GAPDIST", minValue = 0, maxValue = 400, valueStep = 10, minLabel=WSCT.LOCALS.OPTION.GAPDIST.minLabel, maxLabel=WSCT.LOCALS.OPTION.GAPDIST.maxLabel}
WSCT.OPTIONS.Windows.WSCTSliderTRUNCATESIZE = {type="slider", label = WSCT.LOCALS.OPTION.TRUNCATESIZE.label, tooltiptext = WSCT.LOCALS.OPTION.TRUNCATESIZE.tooltiptext, table = nil, var = "TRUNCATESIZE", minValue = 0, maxValue = 15, valueStep = 1, minLabel=WSCT.LOCALS.OPTION.TRUNCATESIZE.minLabel, maxLabel=WSCT.LOCALS.OPTION.TRUNCATESIZE.maxLabel}

--ComboBoxes
WSCT.OPTIONS.Windows.WSCTComboFONT = {type="combo", label = WSCT.LOCALS.OPTION.FONT.label, tooltiptext = WSCT.LOCALS.OPTION.FONT.tooltiptext, table = WSCT.FRAME1, data = WSCT.LOCALS.OPTION.FONT.data, var = "FONT"}
WSCT.OPTIONS.Windows.WSCTComboANITYPE = {type="combo", label = WSCT.LOCALS.OPTION.ANITYPE.label, tooltiptext = WSCT.LOCALS.OPTION.ANITYPE.tooltiptext, table = WSCT.FRAME1, data = WSCT.LOCALS.OPTION.ANITYPE.data, var = "ANITYPE"}
WSCT.OPTIONS.Windows.WSCTComboALIGN = {type="combo", label = WSCT.LOCALS.OPTION.ALIGN.label, tooltiptext = WSCT.LOCALS.OPTION.ALIGN.tooltiptext, table = WSCT.FRAME1, data = WSCT.LOCALS.OPTION.ALIGN.data, var = "ALIGN"}
WSCT.OPTIONS.Windows.WSCTComboANISIDETYPE = {type="combo", label = WSCT.LOCALS.OPTION.ANISIDETYPE.label, tooltiptext = WSCT.LOCALS.OPTION.ANISIDETYPE.tooltiptext, table = WSCT.FRAME1, data = WSCT.LOCALS.OPTION.ANISIDETYPE.data, var = "ANISIDETYPE"}
WSCT.OPTIONS.Windows.WSCTComboTRUNCATETYPE = {type="combo", label = WSCT.LOCALS.OPTION.TRUNCATETYPE.label, tooltiptext = WSCT.LOCALS.OPTION.TRUNCATETYPE.tooltiptext, table = nil, data = WSCT.LOCALS.OPTION.TRUNCATETYPE.data, var = "TRUNCATETYPE"}
WSCT.OPTIONS.Windows.WSCTComboICONSIDE = {type="combo", label = WSCT.LOCALS.OPTION.ICONSIDE.label, tooltiptext = WSCT.LOCALS.OPTION.ICONSIDE.tooltiptext, table = WSCT.FRAME1, data = WSCT.LOCALS.OPTION.ICONSIDE.data, var = "ICONSIDE"}

--Tab windows
WSCT.OPTIONS.TABS = { 
  WSCTOptionsTabEvent = "WSCTOptionsEventWindow",
  WSCTOptionsTabFrame = "WSCTOptionsFrameWindow",
  WSCTOptionsTabAnim = "WSCTOptionsAnimWindow",
  WSCTOptionsTabMisc = "WSCTOptionsMiscWindow",
  WSCTOptionsTabProfile = "WSCTOptionsProfileWindow",
}

--Frame option windows
WSCT.OPTIONS.FRAME_OPTIONS = {
  [1] = "WSCTComboFONT",
  [2] = "WSCTSliderTEXTSIZE",
  [3] = "WSCTSliderALPHA",
  [4] = "WSCTSliderXOFFSET",
  [5] = "WSCTSliderYOFFSET",
  [6] = "WSCTComboANITYPE",
  [7] = "WSCTCheckboxDIRECTION",
  [8] = "WSCTCheckboxATOBJECT",
  [9] = "WSCTComboALIGN",
  [10]= "WSCTComboANISIDETYPE",
  [11]= "WSCTSliderGAPDIST",
  [12]= "WSCTCheckboxICON",
  [13]= "WSCTComboICONSIDE",
}

--Profile info
WSCT.OPTIONS.PROFILE_FUNCS = {
  [1] = WSCT.ResetProfile,
  [2] = function() WSCT:CopyProfile(WSCT.GetWARConfig()) end,
  [3] = function() WSCT:CopyProfile(WSCT.GetClassicConfig()) end,
  [4] = function() WSCT:CopyProfile(WSCT.GetSplitConfig()) end,
  [5] = function() WSCT:CopyProfile(WSCT.GetTriangleConfig()) end,
}












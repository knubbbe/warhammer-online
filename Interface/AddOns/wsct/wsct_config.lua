local WSCT = WSCT

local pairs = pairs
local string_find = string.find
local tonumber = tonumber

--Table Constants
WSCT.SPELL_COLORS_TABLE = "SPELLCOLORS"
WSCT.COLORS_TABLE = "COLORS"
WSCT.CRITS_TABLE = "CRITS"
WSCT.FRAMES_TABLE = "FRAMES"
WSCT.FRAMES_DATA_TABLE = "FRAMESDATA"
WSCT.FRAME1 = 1
WSCT.FRAME2 = 2
WSCT.FRAME3 = 3
WSCT.MSG = 10

------------------------------
--Copy table to table
--Taken from AceDB-3.0
local function copyTable(src, dest)
  if not type(dest) == "table" then dest = {} end
  for k,v in pairs(src) do
    if type(v) == "table" then
      -- try to index the key first so that the metatable creates the defaults, if set, and use that table
      v = copyTable(v, dest[k])
    end
    dest[k] = v
  end
  return dest
end

------------------------------
--Copy one profile to another, any type
function WSCT:CopyProfile(from)
  self:ResetProfile()
  copyTable(from, self.db.profile);
end

-------------------------
--Get the default Config
function WSCT:GetDefaultConfig()
  local default = {
    profile = {
      ["VERSION"] = WSCT.Version,
      ["ENABLED"] = 1,
      ["SHOWHIT"] = 1,
      ["SHOWHITOUT"] = 1,
      ["SHOWPARRY"] = 1,
      ["SHOWPARRYOUT"] = 1,
      ["SHOWDODGE"] = 1,
      ["SHOWDODGEOUT"] = 1,
      ["SHOWBLOCK"] = 1,
      ["SHOWBLOCKOUT"] = 1,
      ["SHOWSPELL"] = 1,
      ["SHOWSPELLOUT"] = 1,
      ["SHOWHEAL"] = 1,
      ["SHOWHEALOUT"] = 1,
      ["SHOWRESIST"] = 1,
      ["SHOWRESISTOUT"] = 1,
      ["SHOWABSORB"] = 1,
      ["SHOWABSORBOUT"] = 1,
      ["SHOWLOWHP"] = 1,
      ["SHOWCOMBAT"] = 1,
      ["SHOWXP"] = 1,
      ["SHOWRENOWN"] = 1,
      ["SHOWINF"] = 1,
      ["SHOWINTERRUPT"] = 1,
      ["SHOWMORALE"] = 1,
      ["SHOWDEBUFF"] = 1,
      ["SHOWBUFF"] = 1,
      ["SHOWDEBUFFFADE"] = false,
      ["SHOWBUFFFADE"] = false,
      ["SHOWAP"] = false,
      ["SHOWRESOURCE"] = false,
      ["STICKYCRIT"] = 1,
      ["FLASHCRIT"] = 1,
      ["FPSMODE"] = 1,
      ["ANIMATIONSPEED"] = 15,
      ["MOVEMENT"] = 1,
      ["LOWHP"] = 40,
      ["HEALFILTER"] = 0,
      ["DMGFILTER"] = 0,
      ["PLAYSOUND"] = 1,
      ["PETFLAG"] = 1,
      ["PETATOBJECT"] = 1,
      ["FLAGDAMAGE"] = false,
      ["OUTDMGNAME"] = false,
      ["INDMGNAME"] = false,
      ["OUTHEALNAME"] = false,
      ["INHEALNAME"] = false,
      ["BUFFTYPE"] = false,
      ["TRUNCATE"] = true,
      ["TRUNCATESIZE"] = 8,
      ["TRUNCATETYPE"] = 2,
      [WSCT.FRAMES_DATA_TABLE] = {
        [WSCT.FRAME1] = {
          ["FONT"] = 3,
          ["ALPHA"] = 100,
          ["ANITYPE"] = 7,
          ["ANISIDETYPE"] = 4,
          ["XOFFSET"] = 0,
          ["YOFFSET"] = -150,
          ["DIRECTION"] = 1,
          ["TEXTSIZE"] = 24,
          ["GAPDIST"] = 150,
          ["ALIGN"] = 3,
          ["ICONSIDE"] = 2,
          ["ATOBJECT"] = false,
          ["ICON"] = false,
        },
        [WSCT.FRAME2] = {
          ["FONT"] = 3,
          ["ALPHA"] = 100,
          ["ANITYPE"] = 7,
          ["ANISIDETYPE"] = 5,
          ["XOFFSET"] = 0,
          ["YOFFSET"] = -150,
          ["DIRECTION"] = 1,
          ["TEXTSIZE"] = 24,
          ["GAPDIST"] = 150,
          ["ALIGN"] = 1,
          ["ICONSIDE"] = 1,
          ["ATOBJECT"] = false,
          ["ICON"] = false,
        },
        [WSCT.FRAME3] = {
          ["FONT"] = 3,
          ["ALPHA"] = 100,
          ["ANITYPE"] = 1,
          ["ANISIDETYPE"] = 1,
          ["XOFFSET"] = 0,
          ["YOFFSET"] = 300,
          ["DIRECTION"] = false,
          ["TEXTSIZE"] = 24,
          ["GAPDIST"] = 40,
          ["ALIGN"] = 2,
          ["ICONSIDE"] = 2,
          ["ATOBJECT"] = 1,
          ["ICON"] = false,
        },
      },
      [WSCT.COLORS_TABLE] = {
        ["SHOWHIT"] = {r = 255, g = 0, b = 0},
        ["SHOWHITOUT"] = {r = 255, g = 255, b = 255},
        ["SHOWPARRY"] = {r = 100, g = 150, b = 200},
        ["SHOWPARRYOUT"] = {r = 0, g = 128, b = 255},
        ["SHOWDODGE"] = {r = 100, g = 150, b = 200},
        ["SHOWDODGEOUT"] = {r = 0, g = 128, b = 255},
        ["SHOWBLOCK"] = {r = 100, g = 150, b = 200},
        ["SHOWBLOCKOUT"] = {r = 0, g = 128, b = 255},
        ["SHOWSPELL"] = {r = 255, g = 128, b = 255},
        ["SHOWSPELLOUT"] = {r = 255, g = 255, b = 0},
        ["SHOWHEAL"] = {r = 0, g = 255, b = 0},
        ["SHOWHEALOUT"] = {r = 0, g = 175, b = 0},
        ["SHOWRESIST"] = {r = 128, g = 0, b = 128},
        ["SHOWRESISTOUT"] = {r = 255, g = 0, b = 255},
        ["SHOWABSORB"] = {r = 255, g = 255, b = 0},
        ["SHOWABSORBOUT"] = {r = 255, g = 255, b = 0},
        ["SHOWLOWHP"] = {r = 255, g = 128, b = 128},
        ["SHOWCOMBAT"] = {r = 255, g = 255, b = 255},
        ["SHOWINTERRUPT"] = {r = 75, g = 75, b = 255},
        ["SHOWXP"] = {r = 255, g = 255, b = 0},
        ["SHOWRENOWN"] = {r = 128, g = 128, b = 255},
        ["SHOWINF"] = {r = 128, g = 200, b = 200},
        ["SHOWMORALE"] = {r = 64, g = 128, b = 255},
        ["SHOWDEBUFF"] = {r = 0, g = 128, b = 128},
        ["SHOWBUFF"] = {r = 180, g = 180, b = 0},
        ["SHOWDEBUFFFADE"] = {r = 0, g = 128, b = 128},
        ["SHOWBUFFFADE"] = {r = 180, g = 180, b = 0},
        ["SHOWAP"] = {r = 180, g = 255, b = 0},
        ["SHOWRESOURCE"] = {r = 180, g = 180, b = 255},
      },
      [WSCT.SPELL_COLORS_TABLE] = {
        ["SPIRIT"] = {r=255,g=0,b=0},
        ["ELEMENT"] = {r=255,g=255,b=0},
        ["COPREAL"] = {r=255,g=75,b=0},
      },
      [WSCT.CRITS_TABLE] = {
        ["SHOWLOWHP"] = 1,
        ["SHOWINTERRUPT"] = 1,
        ["SHOWMORALE"] = 1,
      },
      [WSCT.FRAMES_TABLE] = {
        ["SHOWHIT"] = WSCT.FRAME1,
        ["SHOWPARRY"] = WSCT.FRAME1,
        ["SHOWDODGE"] = WSCT.FRAME1,
        ["SHOWBLOCK"] = WSCT.FRAME1,
        ["SHOWSPELL"] = WSCT.FRAME1,
        ["SHOWHEAL"] = WSCT.FRAME2,
        ["SHOWRESIST"] = WSCT.FRAME2,
        ["SHOWABSORB"] = WSCT.FRAME2,
        ["SHOWHITOUT"] = WSCT.FRAME3,
        ["SHOWPARRYOUT"] = WSCT.FRAME3,
        ["SHOWDODGEOUT"] = WSCT.FRAME3,
        ["SHOWBLOCKOUT"] = WSCT.FRAME3,
        ["SHOWSPELLOUT"] = WSCT.FRAME3,
        ["SHOWHEALOUT"] = WSCT.FRAME3,
        ["SHOWRESISTOUT"] = WSCT.FRAME3,
        ["SHOWABSORBOUT"] = WSCT.FRAME3,
        ["SHOWLOWHP"] = WSCT.FRAME1,
        ["SHOWCOMBAT"] = WSCT.FRAME1,
        ["SHOWINTERRUPT"] = WSCT.FRAME1,
        ["SHOWXP"] = WSCT.FRAME2,
        ["SHOWRENOWN"] = WSCT.FRAME2,
        ["SHOWINF"] = WSCT.FRAME2,
        ["SHOWMORALE"] = WSCT.FRAME2,
        ["SHOWDEBUFF"] = WSCT.FRAME2,
        ["SHOWBUFF"] = WSCT.FRAME2,
        ["SHOWDEBUFFFADE"] = WSCT.FRAME2,
        ["SHOWBUFFFADE"] = WSCT.FRAME2,
        ["SHOWAP"] = WSCT.FRAME2,
        ["SHOWRESOURCE"] = WSCT.FRAME2,
      }
    }
  }
  return default
end

-------------------------
--Get the Warhammer Config
function WSCT:GetWARConfig()
	local default = {
	  ["FLAGDAMAGE"] = 1,
		[WSCT.FRAMES_DATA_TABLE] = {
		  [WSCT.FRAME1] = {
		    ["ANITYPE"] = 1,
		    ["ANISIDETYPE"] = 1,
        ["XOFFSET"] = -150,
        ["YOFFSET"] = -150,
        ["DIRECTION"] = 1,
        ["ALIGN"] = 2,
        ["ATOBJECT"] = false,
      },
      [WSCT.FRAME2] = {
        ["ANITYPE"] = 1,
        ["ANISIDETYPE"] = 1,
        ["XOFFSET"] = 0,
        ["YOFFSET"] = 150,
        ["ALIGN"] = 2,
        ["DIRECTION"] = false,
      },
      [WSCT.FRAME3] = {
        ["ANITYPE"] = 1,
        ["ANISIDETYPE"] = 1,
        ["XOFFSET"] = 100,
        ["DIRECTION"] = false,
        ["ALIGN"] = 2,
        ["ATOBJECT"] = 1,
      },
		},
		[WSCT.COLORS_TABLE] = {
      ["SHOWHIT"] =  {r = 255, g = 0, b = 0},
      ["SHOWHITOUT"] =  {r = 255, g = 255, b = 255},
      ["SHOWPARRY"] =  {r = 150, g = 150, b = 150},
      ["SHOWPARRYOUT"] =  {r = 150, g = 150, b = 150},
      ["SHOWDODGE"] =  {r = 150, g = 150, b = 150},
      ["SHOWDOGEOUT"] =  {r = 150, g = 150, b = 150},
      ["SHOWBLOCK"] =  {r = 150, g = 150, b = 150},
      ["SHOWBLOCKOUT"] =  {r = 150, g = 150, b = 150},
      ["SHOWSPELL"] =  {r = 128, g = 255, b = 128},
      ["SHOWSPELLOUT"] =  {r = 128, g = 255, b = 128},
      ["SHOWHEAL"] =  {r = 0, g = 255, b = 0},
      ["SHOWHEALOUT"] =  {r = 0, g = 175, b = 0},
      ["SHOWRESIST"] =  {r = 150, g = 150, b = 150},
      ["SHOWRESISTOUT"] =  {r = 150, g = 150, b = 150},
      ["SHOWABSORB"] =  {r = 150, g = 150, b = 150},
      ["SHOWABSORBOUT"] =  {r = 150, g = 150, b = 150},
      ["SHOWLOWHP"] =  {r = 255, g = 128, b = 128},
      ["SHOWCOMBAT"] =  {r = 255, g = 255, b = 255},
      ["SHOWINTERRUPT"] = {r = 75, g = 75, b = 255},
      ["SHOWXP"] = {r = 255, g = 255, b = 0},
      ["SHOWRENOWN"] = {r = 128, g = 128, b = 255},
      ["SHOWINF"] = {r = 128, g = 200, b = 200},
    },
		[WSCT.FRAMES_TABLE] = {
      ["SHOWHIT"] = WSCT.FRAME1,
      ["SHOWPARRY"] = WSCT.FRAME1,
      ["SHOWDODGE"] = WSCT.FRAME1,
      ["SHOWBLOCK"] = WSCT.FRAME1,
      ["SHOWSPELL"] = WSCT.FRAME1,
      ["SHOWHEAL"] = WSCT.FRAME1,
      ["SHOWRESIST"] = WSCT.FRAME1,
      ["SHOWABSORB"] = WSCT.FRAME1,
      ["SHOWHITOUT"] = WSCT.FRAME3,
      ["SHOWPARRYOUT"] = WSCT.FRAME3,
      ["SHOWDODGEOUT"] = WSCT.FRAME3,
      ["SHOWBLOCKOUT"] = WSCT.FRAME3,
      ["SHOWSPELLOUT"] = WSCT.FRAME3,
      ["SHOWHEALOUT"] = WSCT.FRAME3,
      ["SHOWRESISTOUT"] = WSCT.FRAME3,
      ["SHOWABSORBOUT"] = WSCT.FRAME3,
      ["SHOWLOWHP"] = WSCT.FRAME1,
      ["SHOWCOMBAT"] = WSCT.FRAME1,
      ["SHOWINTERRUPT"] = WSCT.FRAME1,
      ["SHOWXP"] = WSCT.FRAME2,
      ["SHOWRENOWN"] = WSCT.FRAME2,
      ["SHOWINF"] = WSCT.FRAME2,
     }
	};
	return default;
end

-------------------------
--Get the Classic Config
function WSCT:GetClassicConfig()
	local default = {
		[WSCT.FRAMES_DATA_TABLE] = {
			[WSCT.FRAME1] = {
        ["ANITYPE"] = 1,
        ["ALIGN"] = 2,
        ["DIRECTION"] = false,
        ["YOFFSET"] = 0,
        ["XOFFSET"] = 0,
      },
      [WSCT.FRAME2] = {
        ["ANITYPE"] = 1,
        ["ALIGN"] = 2,
        ["DIRECTION"] = 1,
        ["YOFFSET"] = -150,
        ["XOFFSET"] = 0,
      },
		},
	};
	return default;
end

-------------------------
--Get the Classic Config
function WSCT:GetSplitConfig()
	local default = {
		[WSCT.FRAMES_DATA_TABLE] = {
      [WSCT.FRAME2] = {
        ["ANITYPE"] = 1,
        ["ANISIDETYPE"] = 1,
        ["YOFFSET"] = 150,
        ["XOFFSET"] = 0,
        ["ALIGN"] = 2,
        ["DIRECTION"] = false,
      },
      [WSCT.FRAME3] = {
        ["FONT"] = 3,
        ["ALPHA"] = 100,
        ["ANITYPE"] = 7,
        ["ANISIDETYPE"] = 5,
        ["XOFFSET"] = 0,
        ["YOFFSET"] = -150,
        ["DIRECTION"] = false,
        ["TEXTSIZE"] = 24,
        ["GAPDIST"] = 150,
        ["ALIGN"] = 1,
        ["ICONSIDE"] = 2,
        ["ATOBJECT"] = false,
      },
		},
		[WSCT.FRAMES_TABLE] = {
        ["SHOWHEAL"] = WSCT.FRAME1,
        ["SHOWRESIST"] = WSCT.FRAME1,
        ["SHOWABSORB"] = WSCT.FRAME1,
      }
	};
	return default;
end

-------------------------
--Get the Classic Config
function WSCT:GetTriangleConfig()
	local default = {
		[WSCT.FRAMES_DATA_TABLE] = {
			[WSCT.FRAME1] = {
        ["ANITYPE"] = 4,
        ["ALIGN"] = 2,
        ["XOFFSET"] = 0,
        ["YOFFSET"] = 0,
      },
      [WSCT.FRAME2] = {
        ["ANITYPE"] = 4,
        ["ALIGN"] = 2,
        ["XOFFSET"] = 0,
        ["YOFFSET"] = 0,
      },
      [WSCT.FRAME3] = {
        ["ATOBJECT"] = false,
      },
		},
	};
	return default;
end

function WSCT:SlashHandler(args)
  local opt, opt2, opt3, val, val2, val3
  local ttable, option
  opt, val = args:match("(%w+)[ ]?(.*)")

  if opt == "reset" then
    self:Reset()
  elseif opt == "menu" then
    self:OpenMenu()
  else
    self:Print(self.LOCALS.NAME)
    self:Print("----------------")
    self:Print("/wsct menu")
    self:Print("/wsct reset")
  end
end
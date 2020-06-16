if not Squared then Squared = {} end

function Squared.InitializeDefaults()
    
    Squared.Defaults = {
        ["anchor-point"]                = "topleft",
        ["anchor-relpoint"]             = "topleft",
        ["anchor-relwin"]               = "Root",
        ["anchor-x"]                    = 300,
        ["anchor-y"]                    = 200,
        ["anchor-scale"]                = 0.75,
		
		["anchoricon-point"]                = "left",
        ["anchoricon-relpoint"]             = "right",
        ["anchoricon-relwin"]               = "EA_Window_OverheadMapMapDisplay",
        ["anchoricon-x"]                    = 5,
        ["anchoricon-y"]                    = 0,
		["anchoricon-show"]					= true,
        
        ["testmode"]                    = false,
        
        ["fgcolor"]                     = {0, 150, 0},
        ["bgcolor"]                     = {0, 0, 0},
        ["bordercolor"]                 = {50, 50, 50},
        ["groupbordercolor"]            = {200, 200, 200},
        ["targetbordercolor"]           = {255, 255, 255},
        ["leaderbordercolor"]           = {50, 50, 255},
        ["assistbordercolor"]           = {200,50,200},
        ["textcolor"]                   = {255, 255, 255},
        ["textcolor-top"]               = {255, 255, 255},
        ["textcolor-bottom"]            = {255, 255, 255},
        ["boxheight"]                   = 50,
        ["boxwidth"]                    = 50,
        ["bordersize"]                  = 2,
        ["alpha"]                       = 1.0,
        
        ["texture-border"]              = "squared_tint",
        ["texture-background"]          = "squared_tint",
        ["texture-foreground"]          = "squared_tint",
        ["texture-offline"]             = "squared_tint",
        
        ["icon-scale"]                  = 0,
        ["icon-position"]               = "center",
        ["icon-alpha"]                  = 0.5,
        ["icon-offset-x"]               = 0,
        ["icon-offset-y"]               = 0,
        
        ["showicon"]                    = true,
        ["showmenu"]                    = true,
        
        ["columnsize"]                  = 0,
        
        ["direction-group"]             = "down",
        ["direction-member"]            = "right",
        ["direction-fill"]              = "up",
        ["direction-column"]            = "down",
        
        ["spacing-group"]               = 0,
        ["spacing-member"]              = 0,
        ["spacing-column"]              = 0,
        
        ["disable-default"]             = false,
        ["disable-group"]               = false,
        ["disable-warband"]             = false,
        ["disable-scenario"]            = false,
        
        ["disable"]                     = false,
        
        ["invert-bars"]                 = false,
        
        ["rangefading"]                 = true,
        ["rangefading-freq"]            = 0, -- default to updating every frame
        
        ["rangefading-min"]             = 0.2, -- fade multiplier for less-visible end of fading
        ["rangefading-max"]             = 0.5, -- fade multiplier for more-visible end of fading
        
        ["rangefading-noautounfade"]    = false,
        
        ["color-classnames"]            = false,
        ["color-classbars"]             = false,
        ["color-hpnames"]               = false,
        ["color-hpbars"]                = false,
        ["color-hpborders"]             = false,
        
        ["hp-high"]                     = 80,
        ["hp-medium"]                   = 50,
        ["hp-low"]                      = 25,
        
        ["colortype-ironbreaker"]       = "tank",
        ["colortype-swordmaster"]       = "tank",
        ["colortype-chosen"]            = "tank",
        ["colortype-blackorc"]          = "tank",
        ["colortype-kotbs"]             = "tank",
        ["colortype-blackguard"]        = "tank",
        ["colortype-choppa"]            = "mpdps",
        ["colortype-slayer"]            = "mpdps",
        ["colortype-witchhunter"]       = "mpdps",
        ["colortype-whitelion"]         = "mpdps",
        ["colortype-marauder"]          = "mpdps",
        ["colortype-witchelf"]          = "mpdps",
        ["colortype-brightwizard"]      = "rmdps",
        ["colortype-magus"]             = "rmdps",
        ["colortype-sorcerer"]          = "rmdps",
        ["colortype-engineer"]          = "rpdps",
        ["colortype-shadowwarrior"]     = "rpdps",
        ["colortype-squigherder"]       = "rpdps",
        ["colortype-warriorpriest"]     = "msupp",
        ["colortype-discipleofkhaine"]  = "msupp",
        ["colortype-archmage"]          = "rsupp",
        ["colortype-shaman"]            = "rsupp",
        ["colortype-runepriest"]        = "rsupp",
        ["colortype-zealot"]            = "rsupp",
        
        ["colorgroup-tank"]             = { 150, 100, 50 }, -- brown for tanks
        ["colorgroup-mpdps"]            = { 255, 80, 80 }, --red for melee physical dps
        ["colorgroup-rpdps"]            = { 255, 180, 0 }, --orange for ranged physical dps
        ["colorgroup-rmdps"]            = { 255, 255, 60 }, -- yellow for ranged magical dps
        ["colorgroup-msupp"]            = { 180, 120, 255 }, --lavender for melee support
        ["colorgroup-rsupp"]            = { 100, 150, 255 }, --bluish-purple for ranged support
        
        ["colorgroup-hphigh"]           = { 200, 200, 0 }, -- yellow for fairly high hp people
        ["colorgroup-hpmedium"]         = { 200, 100, 0 }, -- orange for medium hp people
        ["colorgroup-hplow"]            = { 200, 0, 0 }, -- red for low hp people
        ["colorgroup-hpdead"]           = { 100, 0, 0 }, --darkred for dead people
        
        ["status-buff"]                 = "topleft",
        ["status-debuff"]               = "topright",
        ["status-hot"]                  = "bottomright",
        ["status-hot-selfonly"]         = true,
        ["status-buff-selfonly"]        = true,
        ["status-debuff-selfonly"]      = true,
        
        ["status-size"]                 = 10,
        
        ["bufftracking-freq"]           = 0.5,
        ["bufftracking-render-freq"]    = 0.3,
        
        ["update-freq"]                 = 0.5,
        
        ["text-position-name"]          = "center",
		["text-position-career"]		= "none",
        ["text-position-hp"]            = "none",
        ["text-position-ap"]            = "none",
        ["text-position-group"]         = "none",
        ["text-position-level"]         = "none",
        
        ["text-font-center"]            = "font_clear_small_bold",
        ["text-font-top"]               = "font_clear_small_bold",
        ["text-font-bottom"]            = "font_clear_small_bold",
        
        ["text-align-center"]           = "center",
        ["text-align-top"]              = "center",
        ["text-align-bottom"]           = "center",
        
        ["namelength"]                  = 5,
        
        ["deplete-off"]                 = false,
        
        ["key-assist"]                  = "alt",
        ["key-assist-final"]            = false,
        
        ["always-draw"]                 = false,
    }
end

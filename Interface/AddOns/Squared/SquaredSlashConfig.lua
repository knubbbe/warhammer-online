if not Squared then Squared = {} end

local function print(text)
    EA_ChatWindow.Print(towstring(tostring(text)), ChatSettings.Channels[SystemData.ChatLogFilters.SAY].id);
end

local function mysort(alpha, bravo)
    if type(alpha) ~= type(bravo) then
        return type(alpha) < type(bravo)
    end
    if alpha == bravo then
        return false
    end
    if type(alpha) == "string" or type(alpha) == "wstring" then
        return alpha:lower() < bravo:lower()
    end
    if type(alpha) == "number" then
        return alpha < bravo
    end
    return false
end

local recursions = {}
local function better_toString(data, depth)
    if type(data) == "string" then
        return ("%q"):format(data)
    elseif type(data) == "wstring" then
        return ("w%q"):format(WStringToString(data))
    elseif type(data) ~= "table" then
        return ("%s"):format(tostring(data))
    else
        if recursions[data] then
            return "{<recursive table>}"
        end
        recursions[data] = true
        if next(data) == nil then
            return "{}"
        elseif next(data, next(data)) == nil then
            return "{ [" .. better_toString(next(data), depth) .. "] = " .. better_toString(select(2, next(data)), depth) .. " }"
        else
            local t = {}
            t[#t+1] = "{\n"
            local keys = {}
            for k in pairs(data) do
                keys[#keys+1] = k
            end
            table.sort(keys, mysort)
            for _, k in ipairs(keys) do
                local v = data[k]
                for i = 1, depth do
                    t[#t+1] = "    "
                end
                t[#t+1] = "["
                t[#t+1] = better_toString(k, depth+1)
                t[#t+1] = "] = "
                t[#t+1] = better_toString(v, depth+1)
                t[#t+1] = ",\n"
            end
            
            for i = 1, depth do
                t[#t+1] = "    "
            end
            t[#t+1] = "}"
            return table.concat(t)
        end
    end
end

local function pformat(...)
    local n = select('#', ...)
    local t = {''}
    for i = 1, n do
        if i > 1 then
            t[#t+1] = ", "
        end
        t[#t+1] = better_toString((select(i, ...)), 0)
    end
    for k in pairs(recursions) do
        recursions[k] = nil
    end
    return table.concat(t), n
end

-- Because string.gmatch is borken in 1.3.1 :(    
local gmatch = function( str, pattern )
    local init = 1
    local function gmatch_it()
        if init <= str:len() then 
            local s, e = str:find(pattern, init)
            if s then
                local res = {str:match(pattern, init)}
                init = e+1
                return unpack(res)
            end
        end
    end
    return gmatch_it
end

function Squared.SlashHandler(input)
    local opt, val = input:match("([a-z0-9_-]+)[ ]?(.*)")
    if opt then
    
        --special case handler for 'changed'
        if opt == "options" then
            local optString = nil
            for k,_ in pairs(Squared.Settings) do
                if not k:find("anchor") and (not val or val == "" or k:find(val)) then
                    if optString then
                        optString = optString .. ", " .. k
                    else
                        optString = k
                    end
                end
            end
            if optString then
                if not val or val == "" then
                    print("[Squared] Currently known options: "..optString.." (Use '/squared options <searchtext>' to filter.)")
                else
                    print("[Squared] Currently known options matching '"..val.."': "..optString)
                end
            else
                print("[Squared] No options have been modified from defaults.")
            end
            return
        end
    
        if not val or val == "" then
            print("[Squared] '"..opt.."' has value: "..pformat(Squared.GetSetting(opt)))
        else
            local oldSetting = Squared.GetSetting(opt)
            if type(oldSetting) == "number" then
                val = tonumber(val)
                if val then Squared.SetSetting(opt, val) end
            elseif type(oldSetting) == "boolean" then
                if val == "true" or val == "1" or val == "yes" or val == "on" then
                    Squared.SetSetting(opt, true)
                elseif val == "toggle" then
                    Squared.SetSetting(opt, not oldSetting)
                else
                    Squared.SetSetting(opt, false)
                end
            elseif type(oldSetting) == "wstring" then
                Squared.SetSetting(opt, towstring(val))
            elseif type(oldSetting) == "string" then
                Squared.SetSetting(opt, val)
            elseif type(oldSetting) == "table" then
                local tab = {}
                for word in gmatch(val, "%w+") do
                    if tonumber(word) then
                        table.insert(tab, tonumber(word))
                    else
                        table.insert(tab, word)
                    end
                end
                Squared.SetSetting(opt, tab)
            else
                print("WARNING: An existing setting of this name was not found, creating new setting. (Did you make a typo?)")
                -- if we can't figure out something else, then see if the input could be a number, if so set it that way
                -- otherwise, set it to just the string
                if tonumber(val) then
                    Squared.SetSetting(opt, tonumber(val))
                else
                    Squared.SetSetting(opt, val)
                end
            end
                
            Squared.ChangeMode(true)
            print("[Squared] '"..opt.."' set value: "..pformat(Squared.GetSetting(opt)))
        end
    else
        if SquaredConfigurator then
            print("Opening Squared GUI...")
            SquaredConfigurator.Show()
        else
            print("[Squared] is installed. Use '/squared <option>' to view a setting, and '/squared <option> <value>' to change one. To get a list of known options, use '/squared options'.")
        end
    end
end
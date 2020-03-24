local MAJOR, MINOR = "LibSharedAssets", 1

local LSA, oldminor = LibStub:NewLibrary(MAJOR, MINOR)
if not LSA then return end

-- Initialize data storage (if necessary)

--- Stores info about registered textures
-- 
-- The textures table is indexed by the names of the textures (strings), and the values
-- are the metadata tables corresponding to each texture. A metadata table is indexed by
-- string keys for each metadata field (standard fields are "name", "tags", and "size").
--
-- The "name" field contains a string, which is the name of the texture for easier reference.
--
-- The "tags" field, if present, contains an associative table of tag names, so that if
-- LSA.textures["texName"].tags["tagName"] is a true value, then the texture named "texName"
-- is tagged with the tag named "tagName".
--
-- The "size" field, if present, is an integer indexed table of two values, the first being the
-- width of the texture, and the second being the height.
LSA.textures = LSA.textures or {}

--- Caches the results of GetTexturesWithTag()
--
-- LSA.tagCache[Q] should be either nil (for no valid cached value) or equal
-- to the results that would be returned from GetTexturesWithTag(Q)
LSA.tagCache = LSA.tagCache or {}

-- Make some functions local for performance
local tinsert = table.insert
local tremove = table.remove
local pairs = pairs
local ipairs = ipairs

-- generic deepcopy
local function deepcopy(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for index, value in pairs(object) do
            new_table[_copy(index)] = _copy(value)
        end
        return new_table
    end
    return _copy(object)
end

--- Gets the textures tagged with a certain tag
--
-- (Internal function.)
-- 
-- @param tag The tag to search for.
--
-- @return A non-volatile, integer-indexed list of texture names matching the specified tag.
local function GetTexturesWithTag(tag)
    local textures = LSA.textures
    local tagcache = LSA.tagCache
    
    if not tagcache[tag] then
    
        local list = {}
        for k,v in pairs(textures) do
            if v.tags and v.tags[tag] then
                tinsert(list, k)
            end
        end
        tagcache[tag] = list
    
    end
    
    return deepcopy(tagcache[tag])
end


--- Registers a texture for use by any addon using LibSharedAssets
--
-- @param texName The name of the texture (as loaded in XML)
-- @param metadata A table of metadata about the texture being registered.
--
-- @return The name of the registered texture if successful, or nil if the texture already was registered.
function LSA:RegisterTexture(texName, metadata)
    local textures = self.textures
    local tagcache = self.tagCache
    
    -- Return nil if the texture is already registered, or if the specified texName is invalid
    if type(texName) ~= "string" or texName == "" or textures[texName] then return nil end
    
    local texData = {}
    
    -- If no metadata is provided, use a blank table
    if metadata then
        -- Use a copy of the table to prevent interference issues from
        -- addons that don't create a new table for each texture
    
        for k,v in pairs(metadata) do
            texData[k] = deepcopy(v)
            
            -- Invalidate tag cache
            tagcache[k] = nil
        end        
    end
    
    -- Make sure the 'name' field of the metadata is set, for easier use
    texData.name = texName
    
    textures[texName] = texData
    
    return texName
end

--- Adds metadata for a texture already registered with LibSharedAssets
--
-- @param texName The name of the texture (as previously registered)
-- @param metadata A table of metadata to be added for the specified texture
--
-- @return The newly updated metadata table if successful, or nil if the texture was not found.
function LSA:AddMetadata(texName, metadata)
    local textures = self.textures
    local tagcache = self.tagCache
    
    -- Return nil if the texture name is invalid or not registered
    if type(texName) ~= "string" or texName == "" or not textures[texName] then return nil end
    
    -- Also return nil if the metadata is not a table
    if type(metadata) ~= "table" then return nil end
    
    for k,v in pairs(metadata) do
        textures[texName][k] = deepcopy(v)
        
        -- Invalidate tag cache
        tagcache[k] = nil
    end
    
    return textures[texName]
end

--- Returns the metadata for an already registered texture
--
-- @param texName The name of the texture (as previously registered)
--
-- @return A table of metadata about the specified texture, or nil if the texture was not found.
function LSA:GetMetadata(texName)
    local textures = self.textures

    -- Return nil if the texture name is invalid or not registered
    if type(texName) ~= "string" or texName == "" or not textures[texName] then return nil end
    
    return textures[texName]
end


--- Returns a list of textures currently registered by LSA
--
-- The query parameter can be nil, if so, a list of all registered textures will be returned.
--
-- If the query parameter is a string, a list of all textures tagged with a matching string will be returned.
--
-- If the query parameter is a table, then a list of all textures tagged with each string in the table will be returned.
--
-- If the query parameter is a number, then a list of all textures with the specified square size will be returned. A second number may also be passed as a height for rectangular sizes, in which case the first will be used as the width to look for.
--
-- @param query Specifies what textures to return
-- @param height (optional)
--
-- @return A table of currently registered texture names matching the query
function LSA:GetTextureList(query, height)
    local textures = self.textures
    
    if query == nil then
        
        -- If the query is nil, return a list of all registered textures
        local list = {}
        for k,_ in pairs(textures) do tinsert(list, k) end
        return list

    elseif type(query) == "string" and query ~= "" then
    
        -- If the query is a string, treat it as a single tag and return all textures
        -- with that particular tag.
        return GetTexturesWithTag(query) -- This needs implementing (should make use of caching)

    elseif type(query) == "table" then
    
        -- If the query is a table, treat it as a list of tags, and return any textures
        -- which have all of the specified tags.
        
        local list = nil
        for _,v in ipairs(query) do
            -- Only accept strings, toss out anything else
            if type(v) == "string" and v ~= "" then
                -- Is this the first tag?
                if not list then
                    list = GetTexturesWithTag(v)
                else
                    for i=#list,1,-1 do
                        if not textures[list[i]].tags or not textures[list[i]].tags[v] then
                            tremove(list, i)
                        end
                    end
                end
            end
        end
        return list -- Note that this will return nil if none of the elements in the table were strings.

    elseif type(query) == "number" then
    
        -- If query
        local width = query
        height = height or query
        
        local list = {}
        for k,v in pairs(textures) do
            
            if v.size and #v.size == 2 then
                if v.size[1] == width and v.size[2] == height then
                    tinsert(list, k)
                end
            end
            
        end
        return list
        
    else
        return nil
    end
end

-- And finally, make sure all of the LSA-based texture collection/library addons are
-- loaded before any addon which uses their textures.
local strsub = string.sub
local mods = ModulesGetData()
for k,v in ipairs(mods) do
    if strsub(v.name, 1, 12) == "SharedAssets" then
        if v.isEnabled and not v.isLoaded then
            ModuleInitialize(v.name);
        end
    end
end
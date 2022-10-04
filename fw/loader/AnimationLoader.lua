--- Load specic fields from the JSON file that is exported from Aseprite
-- @classmod fw.loader.AnimationLoader
local class = require "libs.middleclass"
local AnimationLoader = class("AnimationLoader")
local JsonReader = require "fw.io.JsonReader"


function AnimationLoader:initialize(json_file)
    self.json_file = json_file
    self.reader = JsonReader:new(json_file)
end

function AnimationLoader:load(json_file)
    self.json_file = json_file
    self.reader = AnimationLoader(json_file)
end

--- Get the "meta" table from the JSON Aseprite file.
--
function AnimationLoader:getMeta()
    return self.reader.json.meta
end

--- Get the "frameTags" ARRAY from the JSON Aseprite file.
--
function AnimationLoader:getFrameTagsRaw()
    return self.reader.json.meta.frameTags
end

--- Get the specific values that are usefil from the frame tags
--  entry in the JSON file supplied to the constructor.
--
function AnimationLoader:getFrameTags()
    local frameTags = {}
    local tags = self.reader.json.meta.frameTags

    for k,v in pairs(tags) do
        frameTags[v.name] = {
            name = v.name,
            from = v.from,
            to = v.to
        }
    end

    return frameTags
end

--- Get the "frames" table from the JSON Aseprite file.
--
function AnimationLoader:getFrames()
    return self.reader.json.frames
end

--- Extract all of the useful info from Aseprite's json file.
--
function AnimationLoader:getConfig()
    local config = {}

    config.frameTags = self.reader.json.meta.frameTags
    config.image = self.reader.json.meta.image

    -- Size should workout to be the size of an individual tile.
    config.size = self.reader.json.meta.size.h

    config.tags = {}

    -- Order isn't guaranteed so I extract all of the fields that
    -- I need explicitly here to use in animation system.
    for i = 1,#config.frameTags do
        local tag = {}
        local row = config.frameTags[i]
        tag.name = row.name
        tag.to = row.to
        tag.from = row.from

        table.insert(config.tags, tag)

    end

    return config
end

return AnimationLoader

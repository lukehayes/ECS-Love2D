--- Class that reads in the contents of a JSON file.
-- @module fw.io
--
local class = require "libs.middleclass"
local json = require "libs.json"
local FileReader = require "fw.io.FileReader"
local JsonReader = class("JsonReader", FileReader)

function JsonReader:initialize(path)
    FileReader:initialize(path)
    self.json = json.decode(self:contents())
end

--- Get the "meta" table from the JSON Aseprite file.
--
function JsonReader:getMeta()
    return self.json.meta
end

--- Get the "frameTags" ARRAY from the JSON Aseprite file.
--
function JsonReader:getFrameTags()
    return self.json.meta.frameTags
end

--- Extract all of the useful info from Aseprite's json file.
--
function JsonReader:getConfig()
    local config = {}

    config.frameTags = self.json.meta.frameTags
    config.image = self.json.meta.image

    -- Size should workout to be the size of an individual tile.
    config.size = self.json.meta.size.h

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

return JsonReader

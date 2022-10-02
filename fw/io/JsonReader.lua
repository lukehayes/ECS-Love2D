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

return JsonReader

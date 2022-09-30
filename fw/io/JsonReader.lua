--- Class that reads in the contents of a JSON file.
-- @module fw.io
--
local class = require "libs.middleclass"
local json = require "libs.json"
local FileReader = require "fw.io.FileReader"
local JsonReader = class("JsonReader")

function JsonReader:initialize(path)
    local contents = FileReader:new(path)
    print(contents)
    self.json = json.decode(contents:contents())
end

return JsonReader

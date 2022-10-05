--- Class that reads in the contents of a JSON file.
--
--  Dependencies: 'fw.io.FileReader'
--
--  @classmod fw.io.JsonReader
--
local class = require "libs.middleclass"
local json = require "libs.json"
local FileReader = require "fw.io.FileReader"
local JsonReader = class("JsonReader", FileReader)

--- Constructor - calling :new() runs this method.
--
--  Sets the internal json member to the contents  of the path argument 
--  (should be a json file).
--
-- @param path The full path to the JSON file.
function JsonReader:initialize(path)
    FileReader:initialize(path)
    self.json = json.decode(self:contents())
end


return JsonReader

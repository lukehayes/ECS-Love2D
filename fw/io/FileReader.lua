-------------------------------------------------------------------------------
--- Class that reads in the contents of a file regardless of type.
--
--  @classmod fw.io.FileReader
--
local class= require "libs.middleclass"
local FileReader = class("FileReader")

-------------------------------------------------------------------------------
--- Create a new instance of FileReader.
--
-- @raise Assertion thrown if path is not a string.
--
-- @param path The file path to read from
--
function FileReader:initialize(path)
    assert(type(path) == 'string', 'Path is not a string.')
    self.path = path or "Path not set!"
end


-------------------------------------------------------------------------------
--- Read entire contents of a file into a string.
--
-- @raise Assertion thrown if self.path is not a string.
--
-- @return string The contents of the file.
--
function FileReader:contents()

    assert(type(self.path) == 'string', 'Path is not a string.')

    local fh = io.open(self.path, "r")
    local contents = fh:read("*all")
    fh:close()

    return contents
end

return FileReader



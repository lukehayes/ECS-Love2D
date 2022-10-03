--- Utility helpers
-- @module fw.util

local utils = {}

--- Get the number of elements inside a table
--
-- @param table The table
--
-- @return number The number of entries in the table.
function utils.tableLength(table)
    assert(type(table) == "table", "table argument must be a table")

    local count = 0

    for _,v in pairs(table) do
        count = count + 1
    end

    return count
end

return utils


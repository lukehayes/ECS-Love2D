--- Utility helpers
-- @module fw.util

local utils = {}

--- Is the argument a table or not?
--
-- @param t The value to check.
--
-- @return Bool
function isTable(t)
    return type(t) == "table"
end


--- Get the number of elements inside a table.
--
-- @param table The table
--
-- @return number The number of entries in the table.
function utils.tableSize(table)
    assert(type(table) == "table", "Argument passed in must be a table.")

    local count = 0

    for _,v in pairs(table) do
        count = count + 1
    end

    return count
end

--- Get the number of elements inside a table recursively.
--
-- @param table The table
--
-- @return number The number of entries in the table.
function utils.tableLengthRec(table)
    assert(type(table) == "table", "table argument must be a table")

    local count = 0

    for _,v in pairs(table) do

        count = count + 1

        if(type(v) == "table") then
            count = count + utils.tableLengthRec(v)
        end
    end

    return count
end

return utils


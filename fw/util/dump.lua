--- Dump the contents of a table in a human readable way.
-- @module fw.util
--

local function lines(count, style)
    count = count or 50
    style = style or "#"

    for i = 1,count do
        io.write("#")
    end

    io.write("\n")
end


local function indent(level)
    local tab_str = ""
    for i = 1,level do
        tab_str = tab_str .. "\t"
    end

    io.write(tab_str)
    io.write("\n")
end


function dump(table, level)
    assert(type(table) == "table", "table argument should be a table.")

    indent(level)

    for k,v in pairs(table) do
        print(k,v)
        if type(v) == "table" then
            print("Level " ,level)
            dump(v, level )
        end
    end

    level = level + 1
end

return dump

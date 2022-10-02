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


--- Dump the contents of a table to the console - order is not guaranteed.
--
-- @param table
-- @param level
-- 
-- @return void
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

function d(table)
    local length = #table

    print(#table)
    print(table)

    for i = 1, #table do
        print(i)
    end

    print("Done")
end


--- Pretty Print
--
-- @param table The table to print.
--
-- @return void
function pp(table)
    local cache, stack, output = {},{},{}
    local depth = 1
    local output_str = "{\n"

    while true do
        local size = 0
        for k,v in pairs(table) do
            size = size + 1
        end

        local cur_index = 1
        for k,v in pairs(table) do
            if (cache[table] == nil) or (cur_index >= cache[table]) then

                if (string.find(output_str,"}",output_str:len())) then
                    output_str = output_str .. ",\n"
                elseif not (string.find(output_str,"\n",output_str:len())) then
                    output_str = output_str .. "\n"
                end

                -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
                table.insert(output,output_str)
                output_str = ""

                local key
                if (type(k) == "number" or type(k) == "boolean") then
                    key = "["..tostring(k).."]"
                else
                    key = "['"..tostring(k).."']"
                end

                if (type(v) == "number" or type(v) == "boolean") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                elseif (type(v) == "table") then
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = {\n"
                    table.insert(stack,table)
                    table.insert(stack,v)
                    cache[table] = cur_index+1
                    break
                else
                    output_str = output_str .. string.rep('\t',depth) .. key .. " = '"..tostring(v).."'"
                end

                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                else
                    output_str = output_str .. ","
                end
            else
                -- close the table
                if (cur_index == size) then
                    output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
                end
            end

            cur_index = cur_index + 1
        end

        if (size == 0) then
            output_str = output_str .. "\n" .. string.rep('\t',depth-1) .. "}"
        end

        if (#stack > 0) then
            table = stack[#stack]
            stack[#stack] = nil
            depth = cache[table] == nil and depth + 1 or depth - 1
        else
            break
        end
    end

    -- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
    table.insert(output,output_str)
    output_str = table.concat(output)

    print(output_str)
end

return d

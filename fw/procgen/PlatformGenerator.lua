-------------------------------------------------------------------------------
--- Generate a grid of platform tiles.
--
--  @classmod fw.procgen.PlatformGenerator
--
local class = require "libs.middleclass"
local PlatformGenerator = class("PlatformGenerator")


-------------------------------------------------------------------------------
--- Constructor - calling :new() runs this method.
--
--  @param tile_size The size of an individual tile.
--  @param block_width  The width of a single grid block.
--  @param block_height The height of a single grid block.
--  @param grid_width   The width of the entire grid of grids.
--  @param grid_height  The width of the entire grid of grids.
--
function PlatformGenerator:initialize(tile_size, block_width, block_height, grid_width, grid_height)
    self.tile_size   = tile_size or 16
    self.block_width  = block_width or 10
    self.block_height = block_height or 10
    self.grid_width  = grid_width or 10
    self.grid_height = grid_height or 10
    self.grid = {}
end

-------------------------------------------------------------------------------
--- Generate a simple tile grid consisting of solid and empty tiles.
--
--  @param weight The chance of generating a solid block. Default is 0.5.
--
--  @return self.block
function PlatformGenerator:generateBlock(weight)

    local weight = weight or 16
    local block = {}

    for x = 1, self.block_width do
        local row = {}
        for y = 1, self.block_height do
            local rn = math.random()
            local cell = {}

            if(rn > weight) then
                cell.solid = true
            else
                cell.solid = false
            end

            table.insert(row, cell)
       end

       table.insert(row, block)
    end

    return block

end

-------------------------------------------------------------------------------
--- Generate a grid of grids.
--
--  @param w The number of complete grids on the x axis.
--  @param h The number of complete grids on the y axis.
--
function PlatformGenerator:generateGrid()

    for x = 1, self.grid_width do

        local row = {}

        for y = 1, self.grid_height do
            local block = self:generateBlock(0.5)
            table.insert(row, block)
        end

        table.insert(self.grid, row)
    end
end

-------------------------------------------------------------------------------
--- Draw the generated grid.
--
--  @param x X axis position of the grid.
--  @param y Y axis position of the grid.
--
function PlatformGenerator:draw(x,y)
    local SPACE = self.tile_size + 1

    for xx = 1, self.grid_width - 1 do
        for yy = 1, self.grid_height - 1 do

            local cell = self.grid[xx][yy]


            if cell.solid then
                love.graphics.rectangle("fill", x + xx * SPACE, y + yy * SPACE, self.tile_size, self.tile_size)
            end
        end
    end

end


return PlatformGenerator

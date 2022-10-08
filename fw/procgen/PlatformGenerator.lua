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
--  @param w The width of the grid.
--  @param h The height of the grid.
--
function PlatformGenerator:initialize(tile_size, w,h)
    self.tile_size = tile_size or 16
    self.w = w or 10
    self.h = h or 10
    self.grid = {}
end

-------------------------------------------------------------------------------
--- Generate a simple tile grid consisting of solid and empty tiles.
--
--  @param tile_size The size of an individual tile.
--  @param w The width of the grid.
--  @param h The height of the grid.
--
function PlatformGenerator:generate()

    for x = 1, self.w do
        for y = 1, self.h do
            local rn = math.random(0,1)
            local cell = {}

            if(rn > 0) then
                cell.solid = true
            else
                cell.solid = false
            end

            table.insert(self.grid, cell)
       end
    end

end

return PlatformGenerator

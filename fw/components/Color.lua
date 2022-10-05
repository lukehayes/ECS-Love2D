-------------------------------------------------------------------------------
--- A component for adding color values.
--
--  @classmod components.Color
--
local class = require('libs.middleclass')
local Color = class("Color")

-------------------------------------------------------------------------------
--- Constructor.
--
--  @param r Red value.
--  @param g Green value.
--  @param b Blue value.
--
function Color:initialize(r,g,b)
    self.r = r or 1
    self.g = g or 1
    self.b = b or 1
end

-------------------------------------------------------------------------------
--- Call as a function and return all three values (r,g,b).
--
--  @return self.r, self.g, self.b
--
function Color:__call()
    return self.r, self.g, self.b
end

return Color

-------------------------------------------------------------------------------
--- Velocity component.
--
--  @classmod components.Velocity
--
local class = require "libs.middleclass"
local Velocity = class("Velocity")

-------------------------------------------------------------------------------
--- Constructor.
--
-- @param x X axis velocity value.
-- @param y Y axis velocity value.
-- @param solid Is the entity a solid object?
--
function Velocity:initialize(x,y, solid)
    self.x      = x or 0
    self.y      = y or 0
    self.solid  = solid or false
    self.ax     = 5
    self.ay     = 5
    self.drag   = 5
    self.mx     = 100
    self.my     = 100
    self.moving = false
end

return Velocity

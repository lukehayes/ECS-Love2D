
local class = require "libs.middleclass"
local Velocity = class("Velocity")

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

local class = require('libs.middleclass')
local Collision = class("Collision")

function Collision:initialize()
    self.bound_x= 16
    self.bound_y= 16
    hit = false
end

return Collision

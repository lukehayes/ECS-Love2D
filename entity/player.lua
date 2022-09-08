local position = require("components/position")
local velocity = require("components/velocity")

local player = {
    position = position(400,400),
    size = size(20,20),
    sprite = true,
    velocity = velocity(0,0, math.random(-2.0, 2.0), math.random(1,5))
}

return player

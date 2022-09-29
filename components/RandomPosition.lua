local lovetoys = require "libs.lovetoys"
local RandomPosition = lovetoys.class("RandomPosition")


function RandomPosition:initialize()
    self.x = math.random(10,500),
    self.y = math.random(10,500)
end

return RandomPosition

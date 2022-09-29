local lovetoys = require('libs.lovetoys')
local Sprite = lovetoys.class("Sprite")

function Sprite:initialize(path)
    self.path = path
    self.image = love.graphics.newImage(self.path)
    self.scale = 2
    self.image:setFilter("nearest", "nearest")
end

return Sprite

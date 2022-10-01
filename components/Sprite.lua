local lovetoys = require('libs.lovetoys')
local Sprite = lovetoys.class("Sprite")

function Sprite:initialize(path)
    self.path = path
    self.image = love.graphics.newImage(self.path)
    self.image:setFilter("nearest", "nearest")

    -- TODO Move this table into a mixin.
    self.config = {
        rotation = 0,
        scale_x = 5,
        scale_y = 5,
        offset_x = 0,
        offset_y = 0
    }
end

return Sprite

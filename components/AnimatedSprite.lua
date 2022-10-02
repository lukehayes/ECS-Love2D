local lovetoys = require('libs.lovetoys')
local Sprite = require "components.Sprite"
local AnimatedSprite = lovetoys.class("AnimatedSprite", Sprite)

function Sprite:initialize(path)
    self.path = path
    self.image = love.graphics.newImage(self.path)
    self.image:setFilter("nearest", "nearest")

    -- TODO Move this table into a mixin.
    self.config = {
        rotation = 0,
        scale_x = 2,
        scale_y = 2,
        offset_x = 0,
        offset_y = 0
    }

    self.anim = {
        size = 16,
        count = 4,
        duration = 0.1,

        frames =
        {
            love.graphics.newQuad(0,0,16,16, self.image),
            love.graphics.newQuad(16,0,16,16,self.image),
            love.graphics.newQuad(32,0,16,16,self.image),
            love.graphics.newQuad(48,0,16,16,self.image)
        }
    }
end

return Sprite

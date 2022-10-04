local lovetoys = require('libs.lovetoys')
local Sprite = require "components.Sprite"
local AnimatedSprite = lovetoys.class("AnimatedSprite", Sprite)
local AnimationLoader = require "fw.loader.AnimationLoader"
local Util = require "fw.util.Util"

function AnimatedSprite:initialize(path)
    self.path = path
    self.image = love.graphics.newImage(self.path)
    self.image:setFilter("nearest", "nearest")
    self.loader = AnimationLoader:new("assets/Bob.json")

     --TODO Move this table into a mixin.
    self.config = {
        rotation = 0,
        scale_x = 2,
        scale_y = 2,
        offset_x = 0,
        offset_y = 0
    }

    self.frameTags = self.loader:getFrameTags()

    self.anim = {
        size = 16,
        count = 4,
        speed = 0.1,
        frames = self:generateQuads()
    }

end


--- Generate every Quad needed for each frame of animation.
--
function AnimatedSprite:generateQuads()

    local quads = {}
    
    for i = 0,7 do
        table.insert(
        quads,
        love.graphics.newQuad(i * 16,0,16,16, self.image)
        )
    end

    return quads
end

return AnimatedSprite

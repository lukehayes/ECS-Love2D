local lovetoys = require('libs.lovetoys')
local Sprite = require "components.Sprite"
local AnimatedSprite = lovetoys.class("AnimatedSprite", Sprite)
local JsonReader = require "fw.io.JsonReader"
local JSON = JsonReader:new("assets/Bob.json")
local Util = require "fw.util.Util"
local d = require "libs.dump"

function AnimatedSprite:initialize(path)
    self.path = path
    self.image = love.graphics.newImage(self.path)
    self.image:setFilter("nearest", "nearest")

     --TODO Move this table into a mixin.
    self.config = {
        rotation = 0,
        scale_x = 2,
        scale_y = 2,
        offset_x = 0,
        offset_y = 0
    }

    self.frameTags = JSON:getFrameTags()

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

    for k,v in pairs(self.frameTags) do

        local t = quads[v.name] = {}

        for i = v.from, v.to do
            table.insert(
                t,
                love.graphics.newQuad(i * 16,0,16,16, self.image)
            )

            table.insert(quads[v.name], t)
        end
    end


    return quads
end

return AnimatedSprite

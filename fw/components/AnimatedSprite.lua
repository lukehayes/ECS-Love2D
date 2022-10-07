-------------------------------------------------------------------------------
--- An animated sprite, a subclass of the Sprite component.
--
--  @classmod components.AnimatedSprite
--
local lovetoys = require('libs.lovetoys')
local Sprite = require "fw.components.Sprite"
local AnimatedSprite = lovetoys.class("AnimatedSprite", Sprite)
local AnimationLoader = require "fw.loader.AnimationLoader"
local Util = require "fw.util.Util"


-------------------------------------------------------------------------------
--- Constructor - calling :new() runs this method.
--
-- @param path The full path to the JSON file.
--
function AnimatedSprite:initialize(path)
    self.path = path
    self.image = love.graphics.newImage(self.path)
    self.image:setFilter("nearest", "nearest")
    self.loader = AnimationLoader:new("assets/Bob-Disco.json")

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
        tile_size = 16,
        count = 4,
        speed = 0.1,
        current_frame = 8,
        current_name = "Idle",
        iter = 0,
        frames = self:generateQuads()
    }

end

-------------------------------------------------------------------------------
--- Play the animation - just logic for playing each frame.
--
-- @param animation The animation key to play.
--
function AnimatedSprite:play(animation)
    assert(type(animation) == "string", "animation argument should be a string.")
    
    local anim = self.anim
    local tags = self.loader:getFrameTags()
    local frames = tags[animation]
    anim.current_name = animation

     anim.iter = anim.iter + _G.dt

     if anim.iter > anim.speed then
         anim.current_frame = anim.current_frame + 1
         anim.iter = 0
     end

     if anim.current_frame > frames.to + 1 then
         anim.current_frame = frames.from + 1
     end
end

-------------------------------------------------------------------------------
--- Generate every Quad needed for each frame of animation.
--
function AnimatedSprite:generateQuads()

    local quads = {}
    
    for i = 0, 12 do
        table.insert(
        quads,
        love.graphics.newQuad(i * 16,0,16,16, self.image)
        )
    end

    return quads
end

return AnimatedSprite

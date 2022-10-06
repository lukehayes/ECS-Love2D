-- Create a draw System.
local DrawSystem = class("DrawSystem", System)
local size = 5
local iter = 0
local frame = 1

-- Define this System requirements.
function DrawSystem:requires()
    return {"Position"}
end

function DrawSystem:draw(dt)
    for _, entity in pairs(self.targets) do

        local position = entity:get("Position")
        local color    = entity:get("Color")

        if(entity:has("timer")) then
            local timer = entity:get("timer")

            if(timer.finished) then
                entity:get("Color").b = 0
            end
        end

        if entity:has("AnimatedSprite") then
            local sprite = entity:get("AnimatedSprite")
            local config = sprite.config
            local anim = sprite.anim
            local duration = sprite.anim.duration
            local frameTags = sprite.frameTags
            local frameStart = frameTags["Walk"].from
            local frameEnd = frameTags["Walk"].to

            sprite:play("Disco")
            print("Current Frame ", anim.current_frame)
            print("Current Animation ", anim.current_name)

            love.graphics.setColor(color())

            love.graphics.draw(
                sprite.image,
                sprite.anim.frames[anim.current_frame],
                position.x,
                position.y,
                config.rotation,
                config.scale_x,
                config.scale_y,
                config.offset_x,
                config.offset_y
            )

        else
            love.graphics.setColor(
                entity:get("Color").r,
                entity:get("Color").g,
                entity:get("Color").b
            )

            love.graphics.rectangle("fill", position.x, position.y, position.w, position.h)
        end
    end
end

return DrawSystem

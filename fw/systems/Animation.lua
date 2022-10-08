-- Create a draw System.
local AnimationSystem = class("AnimationSystem", System)
local size = 5
local iter = 0
local frame = 1

-- Define this System requirements.
function AnimationSystem:requires()
    return {"Position","AnimatedSprite"}
end

function AnimationSystem:draw(dt)

    for _, entity in pairs(self.targets) do

            local position = entity:get("Position")
            local sprite = entity:get("AnimatedSprite")
            local config = sprite.config

            sprite:play("Walk")

            --love.graphics.setColor(color())

            love.graphics.draw(
                sprite.image,
                sprite.anim.frames[sprite.anim.current_frame],
                position.x,
                position.y,
                config.rotation,
                config.scale_x,
                config.scale_y,
                config.offset_x,
                config.offset_y
            )
    end
end

return AnimationSystem

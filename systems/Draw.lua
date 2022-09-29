-- Create a draw System.
local DrawSystem = class("DrawSystem", System)
local size = 5

-- Define this System requirements.
function DrawSystem:requires()
    return {"Position"}
end

function DrawSystem:draw()
    for _, entity in pairs(self.targets) do

        local position = entity:get("Position")
        local color    = entity:get("Color")

        if(entity:has("timer")) then
            local timer = entity:get("timer")

            if(timer.finished) then
                entity:get("Color").b = 0
            end
        end

        if entity:has("Sprite") then
            local sprite = entity:get("Sprite")
            love.graphics.setColor(color())
            love.graphics.draw(sprite.image, position.x, position.y, 0, 10,10)
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

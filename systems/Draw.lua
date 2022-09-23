-- Create a draw System.
local DrawSystem = class("DrawSystem", System)
local size = 5

-- Define this System requirements.
function DrawSystem:requires()
    return {"position"}
end

function DrawSystem:draw()
    for _, entity in pairs(self.targets) do

        local position = entity:get("position")

        if(entity:has("timer")) then
            local timer = entity:get("timer")

            if(timer.finished) then
                entity:get("color").b = 0
            end
        end

        love.graphics.setColor(
            entity:get("color").r,
            entity:get("color").g,
            entity:get("color").b
        )

        love.graphics.rectangle("fill", position.x, position.y, position.w, position.h)
    end
end

return DrawSystem

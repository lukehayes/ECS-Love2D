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

        love.graphics.setColor(
            entity:get("color").r,
            entity:get("color").g,
            entity:get("color").b
        )

        love.graphics.rectangle("fill", position.x, position.y, size, size)
    end
end

return DrawSystem

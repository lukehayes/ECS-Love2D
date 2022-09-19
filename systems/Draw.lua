-- Create a draw System.
local DrawSystem = class("DrawSystem", System)
local size = 1

-- Define this System requirements.
function DrawSystem:requires()
    return {"position"}
end

function DrawSystem:draw()
    for _, entity in pairs(self.targets) do

        love.graphics.setColor(
            entity:get("color").r,
            entity:get("color").g,
            entity:get("color").b
        )

        love.graphics.rectangle("fill", entity:get("position").x, entity:get("position").y, size, size)
    end
end

return DrawSystem

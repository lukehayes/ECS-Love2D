-- Create a draw System.
local DrawSystem = class("DrawSystem", System)

-- Define this System requirements.
function DrawSystem:requires()
    return {"Position", "Color"}
end

function DrawSystem:draw(dt)
    for _, entity in pairs(self.targets) do

        local position = entity:get("Position")
        local color    = entity:get("Color")

        love.graphics.setColor(
            entity:get("Color").r,
            entity:get("Color").g,
            entity:get("Color").b
        )

        love.graphics.rectangle("fill", position.x, position.y, position.w, position.h)
    end
end

return DrawSystem

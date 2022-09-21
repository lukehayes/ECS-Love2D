-- Create a System class as lovetoys.System subclass.
local MoveSystem = class("MoveSystem", System)
local mathUtil = require("libs.math")

local count = 0

-- Define this System's requirements.
function MoveSystem:requires()
    return {"position", "velocity"}
end

function MoveSystem:update(dt)
    for _, entity in pairs(self.targets) do
        local position = entity:get("position")
        local velocity = entity:get("velocity")
        position.x = position.x + velocity.vx * dt
        position.y = position.y + velocity.vy * dt

        -- TODO Collision detection not working at all atm.
        -- Collision Detection
        --
        for _, other in pairs(self.targets) do
            if mathUtil.collides(entity, other) then
                engine:removeEntity(entity)
            end
        end

        -- Bounds Checking
        --
        if(position.x < 0 or position.x > 790) then
            velocity.vx = -velocity.vx
        end

        if(position.y < 0 or position.y > 590) then
            velocity.vy = -velocity.vy
        end
    end
end

return MoveSystem

-- Create a System class as lovetoys.System subclass.
local MoveSystem = class("MoveSystem", System)
local mathUtil = require("libs.math")

-- Define this System's requirements.
function MoveSystem:requires()
    return {"position", "velocity"}
end

function MoveSystem:update(dt)
    for i, entity in pairs(self.targets) do
        local position = entity:get("position")
        local velocity = entity:get("velocity")
        position.x = position.x + velocity.vx * dt
        position.y = position.y + velocity.vy * dt

        -- TODO Build a move efficient collision detection.
        -- Collision Detection
        --
        for j, other in pairs(self.targets) do

            -- Check if the current entity(i) is the same entity
            -- as in the inner loop(j), if it is, move on
            -- because it will always be true.
            if i == j then
                break
            end

            if mathUtil.collides(entity, other) then
                position.w = math.random(2,150)
                position.h = math.random(2,150)
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

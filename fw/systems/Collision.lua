-- Create a System class as lovetoys.System subclass.
local CollisionSystem = class("CollisionSystem", System)
local mathUtil = require("libs.math")

-- Define this System's requirements.
function CollisionSystem:requires()
    return {"Position", "Velocity", "Collision"}
end

function CollisionSystem:update(dt)
    for i, entity in pairs(self.targets) do

        local position = entity:get("Position")
        local col      = entity:get("Collision")

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

            if not col.hit and mathUtil.collides(entity, other)then
                position.w = math.random(2,150)
                position.h = math.random(2,150)
                col.hit = true
            end

            if col.hit then
                col.hit = false
            end

        end
    end
end

return CollisionSystem

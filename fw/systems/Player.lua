-- Create a System class as lovetoys.System subclass.
local PlayerSystem = class("PlayerSystem", System)
local mathUtil = require("libs.math")

-- Define this System's requirements.
function PlayerSystem:requires()
    return {"player"}
end

function PlayerSystem:update(dt)
    local player = self.targets[1]
    local position = player:get("position")
    local velocity = player:get("velocity")
    --position.x = position.x + velocity.vx * dt
    --position.y = position.y + velocity.vy * dt

    --if love.keyboard.isDown('a') then
        --position.x = position.x + velocity.vx * dt
    --end

    --if love.keyboard.isDown('d') then
        --position.x = position.x - velocity.vx * dt
    --end

    --if love.keyboard.isDown('w') then
        --position.y = position.y + velocity.vy * dt
    --end

    --if love.keyboard.isDown('s') then
        --position.y = position.y - velocity.vy * dt
    --end

end

return PlayerSystem

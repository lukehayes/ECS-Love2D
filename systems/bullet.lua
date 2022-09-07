local tiny = require("libs/tiny")
local system = require("systems/system")
local mathUtils = require("libs/math")
local game   = require("core/game")

system.bullet = tiny.processingSystem()
system.bullet.filter = tiny.requireAll("bullet", "position", "velocity")
function system.bullet:process(entity, dt)

    local angle = mathUtils.angle(
        entity.position.x,
        entity.position.y,
        entity.target.position.x,
        entity.target.position.y
        )
    entity.position.x = entity.position.x + math.cos(angle) + entity.velocity.acceleration * dt
    entity.position.y = entity.position.y + math.sin(angle) + entity.velocity.acceleration * dt

    -- Remove out of bounds bullets
    if(entity.position.x < 0 or entity.position.x >= (600) - 20 ) then

        -- FIX Bullets should be removed but isn't'working for some reason.
        self.world:removeEntity(game.world, entity)
    end
end

return system

local tiny = require("libs/tiny")
local system = require("systems/system")
local mathUtils = require("libs/math")

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
end

return system

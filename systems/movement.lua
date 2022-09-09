local tiny = require("libs/tiny")
local game = require("core/game")
local system = require("systems/system")

system.movement = tiny.processingSystem()
system.movement.filter = tiny.requireAll("velocity", "position")
system.movement.filter = tiny.rejectAny("bullet")
function system.movement:process(entity, dt)

    if(entity.velocity.x >= entity.velocity.max_speed) then
        entity.velocity.x = entity.velocity.max_speed
    end

    if(entity.velocity.y >= entity.velocity.max_speed) then
        entity.velocity.y = -entity.velocity.y
    end

    entity.velocity.x = entity.velocity.x + entity.velocity.acceleration * dt
    entity.velocity.y = entity.velocity.y + entity.velocity.acceleration * dt

    entity.position.x = entity.position.x + entity.velocity.x
    entity.position.y = entity.position.y + entity.velocity.y
end

return system


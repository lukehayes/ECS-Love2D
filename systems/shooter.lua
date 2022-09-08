local tiny = require("libs/tiny")
local system = require("systems/system")

system.shooter = tiny.processingSystem()
system.shooter.filter = tiny.requireAll("shooter")
function system.shooter:process(entity, dt)

    local bullet = {
        position = position(entity.position.x, entity.position.y),
        velocity = velocity(10,20, 30, 130),
        color = {r=1,g=0.3,b=0.5},
        bullet = true,
        target = self.world.entities[math.random(1, #self.world.entities)]
   }

    entity.shooter.charge = entity.shooter.charge + dt

    if(entity.shooter.charge >= entity.shooter.rate)then
        self.world:addEntity(bullet)
        entity.shooter.charge = 0
    end
end

return system

local tiny = require("libs/tiny")
local game = { world = tiny.world()}
local system = {}

local e1 = {
    position = {x = 100,y = 100},
    velocity = {x = 10,y = 20}
}

local e2 = {
    position = {x = 400,y = 200},
    velocity = {x = 10,y = -20}
}

system.movement = tiny.processingSystem()
system.movement.filter = tiny.requireAll("velocity", "position")
function system.movement:process(entity, dt)
    entity.position.x = entity.position.x + entity.velocity.x * dt
    entity.position.y = entity.position.y + entity.velocity.y * dt
end

system.draw = tiny.processingSystem()
system.draw.filter = tiny.requireAll("position")
function system.draw:process(entity)
    love.graphics.rectangle("fill", entity.position.x, entity.position.y, 10,10)
end

function love.load()

    tiny.addSystem(game.world, system.movement)
    tiny.addSystem(game.world, system.draw)

    tiny.addEntity(game.world, e1)
    tiny.addEntity(game.world, e2)
end


function love.update(dt)
    game.world:update(dt)
end
function love.draw(dt)
    system.draw:update(dt)
end


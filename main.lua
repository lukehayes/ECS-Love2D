local tiny = require("libs/tiny")
local game = { world = tiny.world()}
local system = {}
local position = require("components/position")
local velocity = require("components/velocity")

local e1 = {
    position = position(100,100),
    velocity = velocity(10,20, 0.5, 30),
}

local e2 = {
    position = position(400,200),
    velocity = velocity(10,-20, 0.9,30)
}


system.movement = tiny.processingSystem()
system.movement.filter = tiny.requireAll("velocity", "position")
function system.movement:process(entity, dt)

    entity.velocity.x  = entity.velocity.x + entity.velocity.acceleration
    entity.velocity.y  = entity.velocity.y + entity.velocity.acceleration

    if(entity.velocity.x >= entity.velocity.max_speed) then
        entity.velocity.x = entity.velocity.max_speed
    end

    if(entity.velocity.y >= entity.velocity.max_speed) then
        --entity.velocity.y = entity.velocity.max_speed
        entity.velocity.y = -entity.velocity.y
    end

    print(entity.velocity.x)

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

    for i = 1,100,1 do
        local e = {
            position = position(math.random(0,500), math.random(0,500)),
            velocity = velocity(-40,-20, 0.9, math.random(100,200))
        }

        tiny.addEntity(game.world, e)
    end
end

function love.update(dt)
    game.world:update(dt)
end

function love.draw(dt)
    system.draw:update(dt)
end

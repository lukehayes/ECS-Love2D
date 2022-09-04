local tiny = require("libs/tiny")
local game = {}
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
    love.graphics.rectangle("fill", entity.position.x, entity.position.y, 1,1)
end

function love.load()
    game.world = tiny.world(
    e1,
    e2,
    system.draw,
    system.movement
    )

    for i = 1,10000,1 do
        local e = {}
        e.position = {x = math.random(100,300), y = math.random(200,500)}

        if(math.random(0,1) == 1) then
        e.velocity = {x = math.random(-100,300), y = math.random(-200,500)}
        end

        game.world:add(e)
    end
end


function love.update(dt)
    game.world:update(dt)
end
function love.draw(dt)
    print(system.draw:update(dt))
end


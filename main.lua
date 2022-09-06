local tiny = require("libs/tiny")
local game = { world = tiny.world()}
local system = {}
local position = require("components/position")
local velocity = require("components/velocity")

local e1 = {
    position = position(100,100),
    velocity = velocity(10,20),
}

local e2 = {
    position = position(400,200),
    velocity = velocity(10,-20)
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

    if(entity.color)then
        love.graphics.setColor(entity.color.r, entity.color.g, entity.color.b)
        love.graphics.rectangle("fill", entity.position.x, entity.position.y, 5,5)
        --love.graphics.print("Pew", entity.position.x + 5, entity.position.y + 5)
    else
        love.graphics.setColor(1,1,1, 0.5)
        love.graphics.rectangle("fill", entity.position.x, entity.position.y, entity.size.w,entity.size.h)
    end

end

function love.load()

    tiny.addSystem(game.world, system.movement)
    tiny.addSystem(game.world, system.draw)

    tiny.addEntity(game.world, e1)
    tiny.addEntity(game.world, e2)

    --for i = 1,100,1 do
        --local e = {
            --position = position(100 + math.random(0,500), 100 + math.random(0,500)),
            --velocity = velocity(-40,-20, math.random(10,100), math.random(100,200)),
            --size     = size(math.random(5,20), math.random(5,20))
        --}

        --if(math.random(0,1) == 1) then
            --e.shooter = shooter(math.random(1.0, 5.0), 2)
        --end

        --tiny.addEntity(game.world, e)
    --end
end

function love.update(dt)
    game.world:update(dt)
end

function love.draw(dt)
    system.draw:update(dt)
end

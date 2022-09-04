local tiny = require("libs/tiny")
local game = {}
local system = {}

local e1 = {
    position = {x = 100,y = 100}
}

local e2 = {
    position = {x = 400,y = 200}
}

system.draw = tiny.processingSystem()
system.draw.filter = tiny.requireAll("position")
function system.draw:process(entity)
    love.graphics.rectangle("fill", entity.position.x, entity.position.y, 10,10)
end

function love.load()
    game.world = tiny.world(
    e1,
    e2,
    system.draw
    )
end


function love.update(dt)
    game.world:update(dt)
end
function love.draw(dt)
    print(system.draw:update(dt))
end


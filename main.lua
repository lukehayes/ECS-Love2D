local tiny      = require("libs/tiny")
local mathUtils = require("libs/math")
local game      = require("core/game")

-- Components
local position = require("components/position")
local size     = require("components/size")
local velocity = require("components/velocity")
local shooter  = require("components/shooter")

-- Systems
local drawSystem     = require("systems/draw")
local movementSystem = require("systems/movement")
local shooterSystem  = require("systems/shooter")
local bulletSystem   = require("systems/bullet")

local e1 = {
    position = position(100,100),
    velocity = velocity(0,0, 0.5, 1),
    size     = size(10,10),
    shooter  = shooter(2, 2)
}

local e2 = {
    position = position(400,200),
    velocity = velocity(0,0, 0.5, 1),
    size     = size(10,10),
}


function love.load()

    tiny.addSystem(game.world, system.movement)
    tiny.addSystem(game.world, system.draw)
    tiny.addSystem(game.world, system.shooter)
    tiny.addSystem(game.world, system.bullet)

    tiny.addEntity(game.world, e1)
    tiny.addEntity(game.world, e2)

    for i = 1,10,1 do
        local e = {
            position = position(100 + math.random(0,500), 100 + math.random(0,500)),
            velocity = velocity(0,0, math.random(0.2,1), math.random(2,5)),
            size     = size(10,10)
        }

        if(math.random(0,1) == 1) then
            e.shooter = shooter(math.random(1.0, 5.0), 2)
        end

        tiny.addEntity(game.world, e)
    end
end

function love.update(dt)
    game.world:update(dt)
end

function love.draw(dt)
    system.draw:update(dt)
end

local tiny      = require("libs/tiny")
local mathUtils = require("libs/math")
local game      = require("core/game")


-- Components
local position = require("components/position")
local size     = require("components/size")
local velocity = require("components/velocity")
local shooter  = require("components/shooter")
local sound    = require("components/sound")

-- Systems
local drawSystem     = require("systems/draw")
local movementSystem = require("systems/movement")
local shooterSystem  = require("systems/shooter")
local bulletSystem   = require("systems/bullet")
require("utils/createEntities")

-- Entities
local player = require("entity/player")

function love.load()

    tiny.addSystem(game.world, system.draw)
    tiny.addSystem(game.world, system.movement)
    --tiny.addSystem(game.world, system.shooter)
    --tiny.addSystem(game.world, system.bullet)

    local e1 = {
        position = position(100,100),
        velocity = velocity(0,0, 0.5, 1),
        size     = size(10,10),
        shooter  = shooter(1, 2),
        sprite = 1
    }

    tiny.addEntity(game.world, e1)
    tiny.addEntity(game.world, player)

    createTestEntities(5)
end

function love.update(dt)
    game.world:update(dt)

    tiny.refresh(game.world)
    if(love.keyboard.isDown("right")) then
        tiny.removeEntity(game.world, player)
        --tiny.clearEntities(game.world)
    end

    print("Systems ", tiny.getSystemCount(game.world))
    print("Entities ", tiny.getSystemCount(game.world))
end

function love.draw(dt)
    system.draw:update(dt)
end

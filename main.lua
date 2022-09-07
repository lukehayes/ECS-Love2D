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

function love.load()

    tiny.addSystem(game.world, system.draw)
    tiny.addSystem(game.world, system.movement)
    tiny.addSystem(game.world, system.shooter)
    tiny.addSystem(game.world, system.bullet)


    local e1 = {
        position = position(100,100),
        velocity = velocity(0,0, 0.5, 1),
        size     = size(10,10),
        shooter  = shooter(1, 2),
        sound    = {
            jump = sound("assets/sounds/powerUp.mp3"),
            fire = sound("assets/sounds/laser.mp3")
        }
        }

    tiny.addEntity(game.world, e1)

    createTestEntities(10)
end

function love.update(dt)
    game.world:update(dt)
    print(tiny.getSystemCount(game.world))
end

function love.draw(dt)
    system.draw:update(dt)
end

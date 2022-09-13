local tiny      = require("libs/tiny")
local game      = require("core/game")
local sound    = require("components/sound")
local color     = require("components/color")

function createTestEntities(count)

    assert(type(count) == "number", "count argument should be a number")

    for i = 1,count,1 do
        local e = {
            position = position(100 + math.random(0,500), 100 + math.random(0,500)),
            velocity = velocity(0,0, math.random(0.2,1), math.random(2,5)),
            size     = size(10,10),
            color    = color(),
            sound    = {
                jump = sound("assets/sounds/powerUp.mp3"),
                fire = sound("assets/sounds/laser.mp3")
            },
            sprite = true
        }

        if(math.random(0,1) == 1) then
            e.shooter = shooter(math.random(5.0, 10.0), 2)
        end

        tiny.addEntity(game.world, e)
    end
end

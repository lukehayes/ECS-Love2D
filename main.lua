-- Include the library.
local lovetoys = require('libs.lovetoys')

-- Make lovetoys libs global for now.
lovetoys.initialize({globals = true, debug = true})

-- Components

-- Systems
local MoveSystem   = require('fw.systems.Move')
local DrawSystem   = require('fw.systems.Draw')
local TimerSystem  = require('fw.systems.Timer')
local PlayerSystem = require('fw.systems.Player')
local CollisionSystem = require('fw.systems.Collision')

-- Entities
local player = require('fw.entities.Player')
local entity_factory = require('fw.factories.EntityFactory')

-- Initialize:
-- debug = true will enable library console logs
-- globals = true will register lovetoys classes in the global namespace
-- so you can access i.e. Entity() in addition to lovetoys.Entity()

function love.load()

    -- Finally, we setup an Engine.
    engine = Engine()
    engine:addEntity(player)

    local tt = {

        a = 1,
        b = 2,
        c = {
            d = 4,
            e = 5,
            f = {
                g = 6,
                h = 7
            }
        }
    }



    local JsonReader = require "fw.io.JsonReader"
    local dump = require "fw.util.dump"
    local reader = JsonReader:new("assets/player-anim.json")
    local json = reader.json

    local AnimationLoader = require "fw.loader.AnimationLoader"
    local Loader = AnimationLoader:new("assets/Bob.json")

    local tags = Loader:getFrameTags()

    for i = tags["Walk"].from, tags["Walk"].to do
        print(i)
    end

    for k,v in pairs(tags["Walk"]) do
        print(k,v)
    end


    for k,v in pairs(Loader:getFrames()) do
        print(k,v.frame.x)
    end

    --print(#json)

    --print(reader.json)


    -- Generate some test entities.
    --entity_factory.generate(10)
    --entity_factory.generateVelTest(2)

    -- Let's add the MoveSystem to the Engine. Its update() 
    -- method will be invoked within any Engine:update() call.
    engine:addSystem(MoveSystem())
    
    -- This will be a 'draw' System, so the
    -- Engine will call its draw method.
    engine:addSystem(DrawSystem(), "draw")

    engine:addSystem(CollisionSystem())

    --engine:addSystem(PlayerSystem(), "update")

    --engine:addSystem(TimerSystem())
end

function love.update(dt)

    -- Hacky but it works
    _G.dt = dt

    -- Will run each system with type == 'update'
    engine:update(dt)
end

function love.draw()
    -- Will invoke the draw() method on each system with type == 'draw'
    engine:draw()
end



-- Include the library.
local lovetoys = require('libs.lovetoys')

-- Make lovetoys libs global for now.
lovetoys.initialize({globals = true, debug = true})

-- Components

-- Systems
local MoveSystem   = require('systems.Move')
local DrawSystem   = require('systems.Draw')
local TimerSystem  = require('systems.Timer')
local PlayerSystem = require('systems.Player')
local CollisionSystem = require('systems.Collision')

-- Entities
local player = require('entities.Player')
local entity_factory = require('factories.EntityFactory')

-- Initialize:
-- debug = true will enable library console logs
-- globals = true will register lovetoys classes in the global namespace
-- so you can access i.e. Entity() in addition to lovetoys.Entity()

function love.load()

    -- Finally, we setup an Engine.
    engine = Engine()
    engine:addEntity(player)

    -- Generate some test entities.
    entity_factory.generate(10)
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
    -- Will run each system with type == 'update'
    engine:update(dt)
end

function love.draw()
    -- Will invoke the draw() method on each system with type == 'draw'
    engine:draw()
end



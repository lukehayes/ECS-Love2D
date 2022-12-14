-- Include the library.
local lovetoys = require('libs.lovetoys')

-- Make lovetoys libs global for now.
lovetoys.initialize({globals = true, debug = true})

-- Systems
local MoveSystem   = require('fw.systems.Move')
local DrawSystem   = require('fw.systems.Draw')
local TimerSystem  = require('fw.systems.Timer')
local PlayerSystem = require('fw.systems.Player')
local CollisionSystem = require('fw.systems.Collision')
local AnimationSystem = require('fw.systems.Animation')

-- Entities
local player = require('fw.entities.Player')
local entity_factory = require('fw.factories.EntityFactory')

-- Procgen
--
local PlatformGenerator = require('fw.procgen.PlatformGenerator')
local pg = PlatformGenerator:new(16,10,10,10,10)
pg:generateGrid()

-- Initialize:
-- debug = true will enable library console logs
-- globals = true will register lovetoys classes in the global namespace
-- so you can access i.e. Entity() in addition to lovetoys.Entity()

function love.load()

    -- Finally, we setup an Engine.
    engine = Engine()
    engine:addEntity(player)

    -- Generate some test entities.
     --entity_factory.generate(10)
    -- entity_factory.generateVelTest(2)

    -- Let's add the MoveSystem to the Engine. Its update() 
    -- method will be invoked within any Engine:update() call.
    engine:addSystem(MoveSystem())
    
    -- This will be a 'draw' System, so the
    -- Engine will call its draw method.
    engine:addSystem(DrawSystem(), "draw")
end

function love.update(dt)

    -- Hacky but it works - make delta time global.
    _G.dt = dt

    -- Will run each system with type == 'update'
    engine:update(dt)
end

function love.draw()
    -- Will invoke the draw() method on each system with type == 'draw'
    engine:draw()

    --pg:draw(10,10)

    local g = pg:generateBlock(0.5)


    for x = 1, 2 do
        for y = 1, 2 do
            local cell = g[x][y]

            if cell.solid then
                love.graphics.rectangle("fill", x * SPACE, y * SPACE, pg.tile_size, pg.tile_size)
            end
        end
    end

end



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
local pg = PlatformGenerator:new()
pg:generateBlock(0.5)

local a = PlatformGenerator:new()
a:generateBlock(0.3)
local b = PlatformGenerator:new()
b:generateBlock(0.5)
local c = PlatformGenerator:new()
c:generateBlock(0.9)

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

    if(love.keyboard.isDown('r')) then
        a:generateBlock(math.random())
        b:generateBlock(math.random())
        c:generateBlock(math.random())
    end
end

function love.draw()
    -- Will invoke the draw() method on each system with type == 'draw'
    engine:draw()

    a:draw(0,0)
    b:draw(a.w * (a.tile_size * 1),0)
    c:draw(b.w * (b.tile_size * 2),0)
end



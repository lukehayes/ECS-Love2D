-- Components
local Position  = require('fw.components.Position')
local Velocity  = require('fw.components.Velocity')
local Color     = require('fw.components.Color')
local Collision = require('fw.components.Collision')
local Timer     = require('fw.components.Timer')

-- Entity Factory Table
local entity_factory = {}

function entity_factory.generateVelTest()
       a = Entity()
       a:add(Position(10,10))
       a:add(Velocity(130,0, false))
       a:add(Color(1,0,0))
       a:add(Collision())

       b = Entity()
       b:add(Position(160,20))
       b:add(Velocity(0,0, false))
       b:add(Color(0,1,0))
       b:add(Collision())

       --egine:addEntity(a)
       engine:addEntity(b)
end

function entity_factory.generate(count)
    local entities = {}

    for i = 1,count do
        local ent = Entity()

        ent:add(Position(
            math.random(10,400),
            math.random(10,500))
        )

        --ent:add(Timer(math.random(2,5)))

        ent:add(Collision())

        ent:add(Velocity(
            math.random(-100,100),
            math.random(-100,100)
        ))

        ent:add(Color(
            math.random(0.0,0.0),
            math.random(0.4,1.0),
            math.random(0.6,1.0)
        ))

        engine:addEntity(ent)
    end

    return entities
end

return entity_factory


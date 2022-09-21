-- Components
local Position = require('components.Position')
local Velocity = require('components.Velocity')
local Color    = require('components.Color')
local Collision = require('components.Collision')
local Timer    = require('components.Timer')

-- Entity Factory Table
local entity_factory = {}

function entity_factory.generate(count)
    local entities = {}

    for i = 1,count do
        local ent = Entity()

        ent:add(Position(
            math.random(10,400),
            math.random(10,500))
        )

        ent:add(Timer(math.random(2,5)))

        --ent:add(Collison())

        ent:add(Velocity(
            math.random(-600,600),
            math.random(-600,600)
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


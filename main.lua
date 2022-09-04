
local ENTITIES =
{
    [1] = { position = true, velocity = true },
    [2] = { position = true, velocity = true },
    [3] = { position = true, velocity = true }
}

local COMPONENTS =
{
    position =
    {
        [1] = { x = 40, y = 40},
        [2] = { x = 140, y = 440},
        [3] = { x = 240, y = 330},
    },

    velocity =
    {
        [1] = { max_speed = 10, x = 20,  y = 30,  friction = 0.5, },
        [2] = { max_speed = 30, x = 10,  y = 10,  friction = 3,   },
        [3] = { max_speed = 30, x = -30, y = -20, friction = 3,   }
    },

}

function hasComponent(entity_id, component)
    local entity = ENTITIES[entity_id]
    return entity[component]
end

function hasComponentAll(ent, comp)
    for entity_id, entity in pairs(ENTITIES) do
        --print(entity[comp])
    end
end

function love.update(dt)

    for entity_id, velocity in pairs(COMPONENTS.velocity) do
        --print(entity_id)
        local position = COMPONENTS["position"][entity_id]

        position.x = position.x + velocity.x * dt
        position.y = position.y + velocity.y * dt

    end
    --
    --for entity_id, component in pairs(COMPONENTS.velocity) do
        ----print(component.max_speed)
       --component.speed_x = component.speed_x + component.max_speed * component.friction * dt
       --component.speed_y = component.speed_x + component.max_speed * component.friction * dt
    --end
end

function love.draw()
    for id, entity in pairs(ENTITIES) do
        if(hasComponent(id, "position")) then
            local entity = COMPONENTS["position"][id]
            love.graphics.rectangle("fill",
            entity.x,
            entity.y,
            10,
            10
            )
        end
    end
end

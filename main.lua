
local ENTITIES =
{
    [1] = { velocity = true, collision = true, position = true },
    [2] = { velocity = true, collision = true, position = true},
    [3] = { velocity = true, collision = true }
}

local COMPONENTS =
{
    velocity =
    {
        [1] = { max_speed = 10, speed_x = 1, speed_y = 1, friction = 0.5, base_speed = 1 },
        [2] = { max_speed = 30, speed_x = 10, speed_y = 10, friction = 3, base_speed = 10 },
        [3] = { max_speed = 30, speed_x = -10, speed_y = 10, friction = 3, base_speed = 10 }
    },

    position =
    {
        [1] = { x = 40, y = 40},
        [2] = { x = 140, y = 440},
    }
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
    for entity_id, component in pairs(COMPONENTS.velocity) do
        --print(component.max_speed)
       component.speed_x = component.speed_x + component.max_speed * component.friction * dt
       component.speed_y = component.speed_x + component.max_speed * component.friction * dt
    end
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

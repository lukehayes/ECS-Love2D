
local ENTITIES =
{
    [1] = { velocity = true, collision = true },
    [2] = { velocity = true, collision = true },
}

local COMPONENTS =
{
    velocity =
    {
        [1] = { max_speed = 10, speed_x = 1, speed_y = 1, friction = 0.5, base_speed = 1 },
        [2] = { max_speed = 30, speed_x = 10, speed_y = 10, friction = 3, base_speed = 10 }
    }
}

function love.update(dt)
    for entity_id, component in pairs(COMPONENTS.velocity) do
        --print(component.max_speed)
       component.speed_x = component.speed_x + component.max_speed * component.friction * dt
       component.speed_y = component.speed_x + component.max_speed * component.friction * dt
    end

    for entity_id, component in pairs(COMPONENTS.collision) do
        --print(component.max_speed)
       component.speed_x = component.speed_x + component.max_speed * component.friction * dt
       component.speed_y = component.speed_x + component.max_speed * component.friction * dt
    end
end

function love.draw()
    for entity_id, component in pairs(COMPONENTS.velocity) do
        love.graphics.rectangle("fill", component.speed_x, component.speed_y,10,10)
    end
end

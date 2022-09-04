
local ENTITIES =
{
    [1] = {
        position = { x = 340, y = 40},
        velocity = { x = 220, y = 230},
        color    = {0,0,200}
    },

    [2] = {
        position  = { x = 40, y = 240},
        velocity  = { x = 2, y = 23},
        color    = {0,200,0}
    },
}

for i = 1,10,1 do
    local e = {
        position = {x = math.random(0,500), y = math.random(0,500)},
        color = {math.random(255,255), math.random(0,255), math.random(0,255)}
    }

    if(math.random(0,1) == 1) then
        local velocity = {x = math.random(-800,800), y = math.random(-600,600)}
        e.velocity = velocity
    end

    table.insert(ENTITIES, e)
end


function hasComponent(entity_id, component)
    local entity = ENTITIES[entity_id]
    return entity[component]
end

function love.update(dt)

    for id, entity  in pairs(ENTITIES) do
        if(hasComponent(id, "velocity")) then
            entity.position.x = entity.position.x + entity.velocity.x *  dt
            entity.position.y = entity.position.y + entity.velocity.y *  dt
        end
    end
end

function love.draw()
    for id, entity in pairs(ENTITIES) do
        if(hasComponent(id, "position")) then
            love.graphics.rectangle("fill",
            entity.position.x,
            entity.position.y,
            10,
            10
            )
        end
    end
end

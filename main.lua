
function PositionComp(x,y)
    return {x=x, y=y, name="Position"}
end

function ColorComp(id, r,g,b,a)
    return {r=r,g=g,b=b,a=a, name="Color"}
end

local components = {
    position = {},
    color    = {}
}

local tt = {}


table.insert(components.position,1, PositionComp(100,100))
table.insert(components.position,2, PositionComp(200,200))
table.insert(components.position,3, PositionComp(800,800))
table.insert(components.position,4, PositionComp(440,400))
table.insert(components.position,5, PositionComp(140,400))

table.insert(components.color, 1, ColorComp(1,0,1,1))
table.insert(components.color, 2, ColorComp(0,1,0,1))
table.insert(components.color, 4, ColorComp(1,0,0,1))
table.insert(components.color, 5, ColorComp(1,0.4,1,1))

local entts = {1,2,3,4, 5}

function hasComponent(e, component)
    local components = components[component]
    local componentExists = components[e]
    return componentExists
end

function systemMove(delta)
    for i=1, #entts,1 do
        pos = hasComponent(i, "position")

        pos.x = pos.x + 100 * delta;
    end
end

function systemDraw()
    for i=1, #entts,1 do
        pos = hasComponent(i, "position")
        color = hasComponent(i, "color")

        if(color) then
            love.graphics.setColor(color.r, color.g, color.b, color.a)
            love.graphics.rectangle("fill", pos.x, pos.y,100,100)
        else
            love.graphics.setColor(1,0,1,1)
            love.graphics.rectangle("fill", pos.x, pos.y,100,100)
        end
    end
end


function love.load()
end

function love.update(dt)
    systemMove(dt)
end

function love.draw()

    systemDraw()

    --for i,compTable in pairs(components) do
        --for k,comp in pairs(compTable) do
            --for tk,tv in pairs(comp) do
                --print(tk, tv)
                --print("|")
            --love.graphics.rectangle("fill", comp.position.x, comp.position.y,10,10)
            --end
        --end
    --end
    --print("---")

end



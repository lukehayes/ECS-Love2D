
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
table.insert(components.position,3, PositionComp(300,400))

table.insert(components.color, 1, ColorComp(1,0,1,1))
table.insert(components.color, 2, ColorComp(0,1,1,1))

local entts = {1,2,3}

function hasComponent(e, component)
    local components = components[component]
    local componentExists = components[e]
    return componentExists
end


function love.load()


    --print("-x-x-x-x-x-")
    --for i = 1,3,1 do
        --print(hasComp(i, "position"))
        --print(hasComp(i, "color"))
    --end
    --print("-x-x-x-x-x-")
end

function love.update(dt)
end

function love.draw()

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



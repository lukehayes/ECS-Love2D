
function PositionComp(id,x,y)
    return {id=id, x=x, y=y}
end

function ColorComp(id, r,g,b,a)
    return {id=id, r=r,g=g,b=b,a=a}
end

local e1 = {}
e1.id = 1
e1.position = PositionComp(e1.id,100,100)
e1.color = ColorComp(e1.id, 0,1,1,1)

local e2 = {}
e2.id = 2
e2.position = PositionComp(e2.id,300,300)
e2.color = ColorComp(e2.id, 1,1,0,1)

local e3 = {}
e3.id = 3
e3.position = PositionComp(e3.id,200,400)
--e3.color = ColorComp(e3.id, 1,0,0,1)

local entts = {}
table.insert(entts, e1)
table.insert(entts, e2)
table.insert(entts, e3)

function love.load()
end

function love.update(dt)
    for _,ent in pairs(entts) do
        ent.position.x = ent.position.x + 100 * dt
    end
end

function love.draw()
    
    for _,ent in pairs(entts) do
        
        if(ent.color) then
            love.graphics.setColor(
                ent.color.r,
                ent.color.g,
                ent.color.b,
                ent.color.a
            )
        else
            love.graphics.setColor(1,0,1,1)
        end

        love.graphics.rectangle("fill", ent.position.x,ent.position.y,10,10)
    end

end



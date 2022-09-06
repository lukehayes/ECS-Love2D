local tiny = require("libs/tiny")
local system = require("systems/system")

system.draw = tiny.processingSystem()
system.draw.filter = tiny.requireAll("position")
function system.draw:process(entity)

    if(entity.color)then
        love.graphics.setColor(entity.color.r, entity.color.g, entity.color.b)
        love.graphics.rectangle("fill", entity.position.x, entity.position.y, 1,1)
        --love.graphics.print("Pew", entity.position.x + 5, entity.position.y + 5)
    else
        love.graphics.setColor(1,1,1, 0.5)
        love.graphics.rectangle("fill", entity.position.x, entity.position.y, entity.size.w,entity.size.h)
    end
end

print(#system)

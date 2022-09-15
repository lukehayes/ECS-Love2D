local lovetoys = require('/libs/lovetoys')
local class = lovetoys.class
local Component = require('libs.lovetoys.src.Component')

print(class)


return Component.create("position", {"x", "y"}, {x = 0, y = 0})

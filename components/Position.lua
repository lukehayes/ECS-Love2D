local class = require('libs.middleclass')
local Position = class("Position")

function Position:initialize(x,y,w,h)
    self.x = x or 1
    self.y = y or 1
    self.w = w or 8
    self.h = h or 8
end


return Position

local class = require('libs.middleclass')
local Color = class("Color")

function Color:initialize(r,g,b)
    self.r = r or 1
    self.g = g or 1
    self.b = b or 1
end

function Color:__call()
    return self.r, self.g, self.b
end

return Color

local class = require "libs.middleclass"
local Timer = class("Timer")

function Timer:initialize()
    self.duration = 1
    self.elapsed  = 0
    self.repeats  = true
    self.finished = false
    self.active   = true
end

return Timer

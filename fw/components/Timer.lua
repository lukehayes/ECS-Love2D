-------------------------------------------------------------------------------
--- Timer component.
--
--  @classmod components.Timer
--
local class = require "libs.middleclass"
local Timer = class("Timer")

-------------------------------------------------------------------------------
--- Constructor - calling :new() runs this method.
--
--  @table
--  @field finished Has the timer finished?
function Timer:initialize()
    self.duration = 1
    self.elapsed  = 0
    self.repeats  = true
    self.finished = false
    self.active   = true
end

return Timer

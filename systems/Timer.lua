--
-- Create a draw System.
local TimerSystem = class("TimerSystem", System)
local size = 5

-- Define this System requirements.
function TimerSystem:requires()
    return {"timer"}
end

function TimerSystem:update(dt)
    for _, entity in pairs(self.targets) do

        local timer = entity:get("timer")

        timer.elapsed = timer.elapsed + dt

        if(timer.elapsed >= timer.duration) then
            timer.finished = true
        end
    end
end

return TimerSystem

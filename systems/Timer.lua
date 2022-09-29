--
-- Create a draw System.
local TimerSystem = class("TimerSystem", System)

-- Define this System requirements.
function TimerSystem:requires()
    return {"Timer"}
end

function TimerSystem:update(dt)
    for _, entity in pairs(self.targets) do

        local timer = entity:get("timer")

        if timer.active then
            timer.elapsed = timer.elapsed + dt

            if timer.elapsed >= timer.duration then
                print("Boom")
            end
        end
    end
end

return TimerSystem

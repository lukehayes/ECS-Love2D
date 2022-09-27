-- Create a System class as lovetoys.System subclass.
local MoveSystem = class("MoveSystem", System)
local mathUtil = require("libs.math")

-- Define this System's requirements.
function MoveSystem:requires()
    return {"position", "velocity"}
end

function MoveSystem:update(dt)
    for i, entity in pairs(self.targets) do

        --if(entity:has("player")) then break end

        local position = entity:get("position")
        local velocity = entity:get("velocity")

        -- TODO Player Movement should be extracted out into player system at some point.
        -- Player Movement
        -- 
        if(entity:has("player")) then

            if love.keyboard.isDown('d') then
                velocity.vx = velocity.vx + velocity.ax

            elseif love.keyboard.isDown('a') then
                velocity.vx = velocity.vx - velocity.ax
                --velocity.vx = velocity.vx - velocity.drag
            elseif love.keyboard.isDown('s') then
                velocity.vy = velocity.vy + velocity.ay

            elseif love.keyboard.isDown('w') then
                velocity.vy = velocity.vy - velocity.ay

            else
                -- TODO Friction drag code.
                -- Empty else statement is working fine for now.
                --
            end

                print(velocity.vx, velocity.mx)
                print(velocity.vy, velocity.my)

            position.x = position.x + velocity.vx * dt
            position.y = position.y + velocity.vy * dt
        end

        -- Bounds Checking
        --
        if(position.x < 0 or position.x > 790) then
            velocity.vx = -velocity.vx
        end

        if(position.y < 0 or position.y > 590) then
            velocity.vy = -velocity.vy
        end
    end
end

return MoveSystem

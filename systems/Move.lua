-- Create a System class as lovetoys.System subclass.
local MoveSystem = class("MoveSystem", System)
local mathUtil = require("libs.math")
local keyDown = false

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

            if(love.keyboard.isDown('a')) then
                velocity.x = velocity.x - velocity.ax

            elseif(love.keyboard.isDown('d')) then
                velocity.x = velocity.x + velocity.ax

            elseif(love.keyboard.isDown('w')) then
                velocity.y = velocity.y - velocity.ay

            elseif(love.keyboard.isDown('s')) then
                velocity.y = velocity.y + velocity.ay

            else
                local sign_x = mathUtil.sign(velocity.x)
                local sign_y = mathUtil.sign(velocity.y)

                if sign_x == 1 then
                    velocity.x = velocity.x - velocity.drag
                elseif sign_x == -1 then
                    velocity.x = velocity.x + velocity.drag
                end

                if sign_y == 1 then
                    velocity.y = velocity.y - velocity.drag
                elseif sign_y == -1 then
                    velocity.y = velocity.y + velocity.drag
                end
                --Find the sign (+/-) of velocity and then Velocity = velocity + (const * -sign)
            end
        end

        -- Move the entity regardless if it is a player or not.
        position.x = position.x + velocity.x * dt
        position.y = position.y + velocity.y * dt

        -- Bounds Checking
        --
        if(position.x < 0 or position.x > 790) then
            velocity.x = -velocity.x
        end

        if(position.y < 0 or position.y > 590) then
            velocity.y = -velocity.y
        end
    end
end

return MoveSystem

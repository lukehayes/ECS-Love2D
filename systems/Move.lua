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

            if love.keyboard.isDown('a') then
                velocity.x = velocity.x - velocity.ax
            else

                velocity.x = velocity.x + velocity.ax

                if (velocity.x > -0.4 and velocity.x < 0) or (velocity.x < 0.5 and velocity.x > 0) then
                    velocity.x = 0
                end
            end

            if love.keyboard.isDown('d') then
                velocity.x = velocity.x + velocity.ax
            else
                velocity.x = velocity.x - 1

                --if (velocity.x > -0.4 and velocity.x < 0) or (velocity.x < 0.5 and velocity.x > 0) then
                    --velocity.x = 0
                --else
                    --velocity.x = velocity.x - velocity.ax
                --end

            end

            --if love.keyboard.isDown('d') then
                --velocity.x = velocity.x + velocity.ax
            --else

                --if velocity.x < -0.5 or velocity.x > 0.5 then
                    --velocity.x = 0
                --end
            --end

            --if love.keyboard.isDown('d') then

                ---- Increase velocity on key press.
                --velocity.vx = velocity.vx + velocity.ax

                ---- Stop increasing velocity when max reached
                --if velocity.vx > velocity.mx then
                    --velocity.vx = velocity.mx
                --end

                --keyDown = true
            --else
                --velocity.vx = velocity.vx + velocity.drag
            --end

            --keyDown = false

            --elseif love.keyboard.isDown('a') then
                --velocity.vx = velocity.vx - velocity.ax

                --if velocity.vx < -velocity.mx then
                    --velocity.vx = -velocity.mx
                --end

                --keyDown = true
                ----velocity.vx = velocity.vx - velocity.drag
            --elseif love.keyboard.isDown('s') then
                --velocity.vy = velocity.vy + velocity.ay
                --keyDown = true

            --elseif love.keyboard.isDown('w') then
                --velocity.vy = velocity.vy - velocity.ay

            --else
                --keyDown = false
                ---- TODO Friction drag code.
                ---- Empty else statement is working fine for now.
                ----
                ----velocity.vx = velocity.vx - velocity.drag
            --end


            --if not keyDown then
                --velocity.vx = velocity.vx - velocity.drag
            --end


            print("----")
            print("VX ", velocity.x, velocity.mx)
            print("VY ", velocity.y, velocity.my)

            position.x = position.x + velocity.x * dt
            position.y = position.y + velocity.y * dt
        end

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

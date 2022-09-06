local tiny = require("libs/tiny")
local mathUtils = require("libs/math")
local system = require("systems/system")
local game = { world = tiny.world()}
local position = require("components/position")
local size     = require("components/size")
local velocity = require("components/velocity")
local shooter  = require("components/shooter")

local draw = require("systems/draw")
--local movement = require("systems/movement")
--system.movement = movement
--tiny.addSystem(game.world, system.movement)


--print(movement)
--print(#system)

local e1 = {
    position = position(100,100),
    velocity = velocity(10,20, 10, 30),
    size     = size(10,10),
    shooter  = shooter(2, 2)
}

local e2 = {
    position = position(400,200),
    velocity = velocity(10,-20, 20,10),
    size     = size(10,10),
}



--system.shooter = tiny.processingSystem()
--system.shooter.filter = tiny.requireAll("shooter")
--function system.shooter:process(entity, dt)

    --local bullet = {
        --position = position(entity.position.x, entity.position.y),
        --velocity = velocity(10,20, 30, 130),
        --color = {r=1,g=0.3,b=0.5},
        --bullet = true,
        --target = self.world.entities[math.random(1, #self.world.entities)]
   --}

    --entity.shooter.charge = entity.shooter.charge + dt

    --if(entity.shooter.charge >= entity.shooter.rate)then
        --self.world:addEntity(bullet)
        --entity.shooter.charge = 0
    --end

--end

--system.bullet = tiny.processingSystem()
--system.bullet.filter = tiny.requireAll("bullet", "position", "velocity")
--function system.bullet:process(entity, dt)

    --local angle = mathUtils.angle(
        --entity.position.x,
        --entity.position.y,
        --entity.target.position.x,
        --entity.target.position.y
        --)
    --entity.position.x = entity.position.x + math.cos(angle) + entity.velocity.acceleration * dt
    --entity.position.y = entity.position.y + math.sin(angle) + entity.velocity.acceleration * dt
--end

function love.load()

    --tiny.addSystem(game.world, system.movement)
    tiny.addSystem(game.world, draw)
    --tiny.addSystem(game.world, system.draw)
    --tiny.addSystem(game.world, system.shooter)
    --tiny.addSystem(game.world, system.bullet)

    --tiny.addEntity(game.world, e1)
    --tiny.addEntity(game.world, e2)

    --for i = 1,100,1 do
        --local e = {
            --position = position(100 + math.random(0,500), 100 + math.random(0,500)),
            --velocity = velocity(-40,-20, math.random(10,100), math.random(100,200)),
            --size     = size(math.random(5,20), math.random(5,20))
        --}

        --if(math.random(0,1) == 1) then
            --e.shooter = shooter(math.random(1.0, 5.0), 2)
        --end

        --tiny.addEntity(game.world, e)
    --end
end

function love.update(dt)
    game.world:update(dt)
end

function love.draw(dt)
    system.draw:update(dt)
end

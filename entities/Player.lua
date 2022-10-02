local Position  = require('components.Position')
local Player    = require('components.Player')
local Velocity  = require('components.Velocity')
local Color     = require('components.Color')
local Collision = require('components.Collision')
local Sprite    = require('components.Sprite')
local AnimatedSprite    = require('components.AnimatedSprite')

-- Create and initialize a new Entity.
-- Note we can access Entity() in the global
-- namespace since we used globals = true in 
-- the lovetoys initialization.
local player = Entity()
player:initialize()

-- Add position and velocity components. We are passing custom default values.
player:add(Position(love.graphics.getWidth()/2, love.graphics.getHeight() / 2))
player:add(Velocity(0,0, solid, 10,10, 5, 100,100))
player:add(Color(1,1,1))
player:add(Collision())
player:add(Player())
player:add(AnimatedSprite("assets/Bob.png"))

return player


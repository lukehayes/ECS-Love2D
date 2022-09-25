local Position = require('components.Position')
local Player   = require('components.Player')
local Velocity = require('components.Velocity')
local Color    = require('components.Color')

-- Create and initialize a new Entity.
-- Note we can access Entity() in the global
-- namespace since we used globals = true in 
-- the lovetoys initialization.
local player = Entity()
player:initialize()

-- Add position and velocity components. We are passing custom default values.
player:add(Position(150, 25))
player:add(Velocity(300, 300))
player:add(Color())
player:add(Player())


return player

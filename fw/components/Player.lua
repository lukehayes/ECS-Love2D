-------------------------------------------------------------------------------
--- Player component class. Use this simply to set the current entity to
--  the player.
--
--  @classmod components.Player
--
local class = require('libs.middleclass')
local Player = class("Player")

-------------------------------------------------------------------------------
--- Constructor.
--
-- @param path The full path to the JSON file.
--
function Player:initialize()
end

return Player

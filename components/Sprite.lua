--return Component.create("sprite",
--{"path", "image"},
--{
    --path = path or "assets/face.png",
    --image = love.graphics.newImage(path)
--})


-- TODO This whole idea doesn't work.
local lovetoys = require('libs.lovetoys')
local Sprite = lovetoys.class("Sprite")

function Sprite:intialize(path)
    print("Sprite initialized")
    self.path = path
    --self.image = love.graphics.newImage(self.path)
end

return Sprite

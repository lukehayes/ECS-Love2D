function sound(path)
    return {
        love.audio.newSource(path, "static")
    }
end

return sound

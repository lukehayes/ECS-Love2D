function color(r,g,b)
    return {
        r = math.random(0.3, 0.6) or 1.0,
        g = math.random(0.3, 0.3) or 1.0,
        b = math.random(0.8, 1.0) or 1.0
    }
end

return color

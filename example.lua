function renderToCanvas(t, tilesheet)
    local inc = 0
    local quads = {}
    local d = t.data

    local tsWidth = {
        pixel = tilesheet:getWidth(),
        tile = tilesheet:getWidth() / d.tileWidth
    }
    local tsHeight = {
        pixel = tilesheet:getHeight(),
        tile = tilesheet:getHeight() / d.tileHeight
    }
    for i = 0, tsHeight.tile - 1 do
        for j = 0, tsWidth.tile - 1 do
            quads[inc] = love.graphics.newQuad(j * d.tileWidth,
                                               i * d.tileHeight, d.tileWidth,
                                               d.tileHeight, tsWidth.pixel,
                                               tsHeight.pixel)
            inc = inc + 1
        end
    end
    local res = love.graphics.newCanvas(d.width * d.tileWidth, d.height * d.tileHeight)

    love.graphics.setColor(1, 1, 1, 1)
    for i, layer in ipairs(t.layers) do
        for y, row in ipairs(layer) do
            for x, tile in ipairs(row) do
                res:renderTo(function()
                    love.graphics.draw(tilesheet, quads[tile], (x - 1) * d.tileWidth, (y - 1) * d.tileHeight)
                end)
            end
        end
    end

    return res
end

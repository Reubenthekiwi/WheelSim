X = 0
Y = 0

function love.draw()
    if(love.keyboard.isDown("w")) then
        Y = Y - 1
    end
    if(love.keyboard.isDown('a')) then
        X = X - 1
    end
    if(love.keyboard.isDown('s')) then
        Y = Y + 1
    end
    if(love.keyboard.isDown('d')) then
        X = X + 1
    end

    local quad = love.graphics.newQuad(Y, Y, 10, 10, 10, 10)
    local quadTexture = love.graphics.newImage("res/white.png")

    love.graphics.draw(quadTexture, quad, X, Y)
end
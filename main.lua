-- load the objects
function love.load()
  -- importing the reqired library and objects
  Object = require "lib/classic"
  require "entities/box"
  
  -- initialize the box object
  box = Box(100, 100, 100, 100, 150, love.graphics.newImage("res/white.png"))
end

-- update the simulation
function love.update(dt)
  -- updating the box object
  box:update(dt)
end

-- draw to the screen
function love.draw()
  -- drawing the box texture
  box:draw()
end

io.stdout:setvbuf("no")
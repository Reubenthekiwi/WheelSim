-- to make things easier
p = love.physics
g = love.graphics
k = love.keyboard

-- load the objects
function love.load()
  -- importing the reqired library and objects
  Object = require "lib/classic"
  Box = require "entities/box"
  Ground = require "entities/ground"
  Wheel = require "entities/wheel"
  
  -- setting up the physics simulation
  p.setMeter(100)
  world = p.newWorld(0, 9.8 * p.getMeter(), true)
  -- create the ground (world, x, y, bodyType, width, height, angle)
  ground = Ground(world, -g.getWidth()/2, 300, "static", g.getWidth()*2, 100, math.rad(0))
  -- create the world borders (although we will use the Ground class again)
  borderLeft = Ground(world, 0, 0, "static", 10, 300, math.rad(0))
  borderTop = Ground(world, 0, 0, "static", g.getWidth(), 10, math.rad(0))
  borderRight = Ground(world, g.getWidth() - 10, 0, "static", 10, 300, math.rad(0))
  worldBorders = {borderLeft, borderRight, borderTop}
  
  -- create the wheel (user) - (world, x, y, bodyType, radius, angle)
  wheel = Wheel(world, 100, 200, "dynamic", 30)
  
  -- create the boxes object (world, x, y, bodyType, width, height, angle)
  boxes = {}
  for i = 1, 5 do
    local box = Box(world, 150 + 75*i, 100, "dynamic", 25, 100)
    table.insert(boxes, box)
  end
end

-- update the simulation
function love.update(dt)
  world:update(dt)
  ground:update(dt)
  -- update the world borders
  for _, border in pairs(worldBorders) do
    border:update(dt)
  end
  wheel:update(dt)
  -- update the boxes
  for _, box in pairs(boxes) do
    box:update(dt)
  end
end

-- draw to the screen
function love.draw()
  g.setBackgroundColor(170/255, 230/255, 255/255)
  ground:draw()
  -- draw the world borders
  for _, border in pairs(worldBorders) do
    border:draw()
  end
  wheel:draw()
  -- draw the boxes
  for _, box in pairs(boxes) do
    box:draw()
  end
end

io.stdout:setvbuf("no")
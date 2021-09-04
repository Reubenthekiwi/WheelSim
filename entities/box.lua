local p = love.physics
local g = love.graphics

-- importing the classic.lua library
local Object = require "../lib/classic"

-- initializing the Box class
local Box = Object:extend()

-- creating the Box constructor
function Box:new(world, x, y, bodyType, width, height, angle)
  self.body = p.newBody(world, x + width/2, y + height/2, bodyType)
  self.body:setAngle(angle or 0)
  self.shape = p.newRectangleShape(width, height)
  self.fixture = p.newFixture(self.body, self.shape)
end

-- the Box update() function
function Box:update(dt)
  -- nothing here currently
end

-- and the draw() function
function Box:draw()
  g.setColor(100/255, 175/255, 145/255)
  g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end

return Box
-- to make things easier
local p = love.physics
local g = love.graphics

-- importing the classic library
local Object = require "../lib/classic"

-- creating the Ground class
local Ground = Object:extend()

-- constructor
function Ground:new(world, x, y, bodyType, width, height, angle)
  self.angle = angle
  self.body = p.newBody(world, x + width/2, y + height/2, bodyType)
  self.body:setAngle(angle or 0)
  self.shape = p.newRectangleShape(width, height)
  self.fixture = p.newFixture(self.body, self.shape)
end

-- these two functions are self-explanatory

function Ground:update(dt)
  -- nothing useful here currently
  --[[ make the ground rotate :D
  self.angle = self.angle + 2 * dt
  self.body:setAngle(math.rad(self.angle))
  ]]--
end

function Ground:draw()
  g.setColor(100/255, 220/255, 100/255)
  g.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
end

return Ground
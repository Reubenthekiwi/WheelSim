local p = love.physics
local g = love.graphics
local k = love.keyboard

local Object = require "../lib/classic"

local Wheel = Object:extend()

function Wheel:new(world, x, y, bodyType, radius, angle)
  self.angle = angle
  self.body = p.newBody(world, x + radius/2, y + radius/2, bodyType)
  self.body:setAngle(angle or 0)
  self.shape = p.newCircleShape(radius)
  self.fixture = p.newFixture(self.body, self.shape)
end

function Wheel:update(dt)
  if(k.isDown("w")) then
      self.body:applyForce(0, -400)
  end
  if(k.isDown('s')) then
      self.body:applyForce(0, 400)
  end
  if(k.isDown('a')) then
      self.body:applyForce(-100, 0)
  end
  if(k.isDown('d')) then
      self.body:applyForce(100, 0)
  end
end

function Wheel:draw()
  g.setColor(100/255, 125/255, 225/255)
  g.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end

return Wheel
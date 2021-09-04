--[[ !!!!!!!!!!!!!!!!!
  Why are we using a quad if we can just use the love.graphics.rectangle() function?
]]--

-- importing the classic.lua library
Object = require "../lib/classic"

-- initializing the Box class
Box = Object:extend(Object)

-- creating the Box constructor
function Box:new(x, y, width, height, speed, texture)
  self.x = x or 0
  self.y = y or 0
  self.width = width or 0
  self.height = height or 0
  self.speed = speed
  self.dt = 0
  self.rotation = 0 -- in radians
  
  self.quad = love.graphics.newQuad(self.x, self.y, self.width, self.height, 10, 10)
  self.texture = texture
end

-- the Box update() function
function Box:update(dt)
  -- processing user input to move the box
  if(love.keyboard.isDown("w")) then
        self.y = self.y - self.speed * dt
  end
  if(love.keyboard.isDown('s')) then
      self.y = self.y + self.speed * dt
  end
  if(love.keyboard.isDown('a')) then
      self.x = self.x - self.speed * dt
  end
  if(love.keyboard.isDown('d')) then
      self.x = self.x + self.speed * dt
  end

  self.dt = dt
end

function toRadians(degrees)
  return degrees * 0.01745329251994329576923690768489
end

-- and the draw() function
function Box:draw()
  self.rotation = self.rotation + self.dt * 50

  love.graphics.rotate(toRadians(self.rotation))
  love.graphics.draw(self.texture, self.quad, self.x, self.y)
end
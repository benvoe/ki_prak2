require "turtle"

pncl(colr(100,100,100))

--[[
local dist = 0.01
local angle = 89.5
local incr = 0.01
local side = size()/2

for i = 1, 184 do
  move(dist * side)
  turn(angle)
  dist = dist + incr
  wait(0.002)
end
--]]

local width = 200
local x, y = 0, 0 -- starting point
local dx, dy = 5, 3 -- x and y velocity of the box
local side = 300
local color = "#AAAAAA"
pncl(color)

size(side*2, side*2)

local function square(side, color)
  for i = 1, 4 do
    move(side)
    turn(90)
  end
  if color then fill(color, 2, 2) end
end

-- draw a large square around the entire field

posn(-side*0.8, -0.8*side)
square(side*2*0.8)


for i = -0.8, 0.6, 0.2 do
  for j = -0.8, 0.6, 0.2 do
  posn(i*side, j*side)
  square(side*0.2, color)
  updt()
end
end

local width = 66 -- width of each color in the rainbow
local adjustment = (width-1)*0.019 -- make each next color a bit shorter
local angle = 1

  pncl(color)
  move(angle*3-adjustment)
  turn(angle)

print("Your Chess is ready!")



--[[

posn(-0.8*side, -0.8*side)
square(side*0.2, color)

posn(-0.6*side, -0.8*side)
square(side*0.2, color)

posn(-0.4*side, -0.8*side)
square(side*0.2, color)

posn(-0.2*side, -0.8*side)
square(side*0.2, color)

posn(0, -0.8*side)
square(side*0.2, color)

posn(0.2*side, -0.8*side)
square(side*0.2, color)

posn(0.4*side, -0.8*side)
square(side*0.2, color)

posn(0.6*side, -0.8*side)
square(side*0.2, color)



posn(-0.8*side, -0.6*side)
square(side*0.2, color)

posn(-0.6*side, -0.6*side)
square(side*0.2, color)

posn(-0.4*side, -0.6*side)
square(side*0.2, color)

posn(-0.2*side, -0.6*side)
square(side*0.2, color)

posn(0, -0.6*side)
square(side*0.2, color)

posn(0.2*side, -0.6*side)
square(side*0.2, color)

posn(0.4*side, -0.6*side)
square(side*0.2, color)

posn(0.6*side, -0.6*side)
square(side*0.2, color)

--]]


updt()









save("squared-spiral")

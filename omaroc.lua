local robot = require("robot")
local term = require("term")

function superExplode()
  robot.select(1)
  robot.place()
  robot.suck()
  robot.swing()
  robot.select(1)
  robot.place()
  robot.placeUp()
  robot.placeDown()
  robot.back()
  robot.select(2)
  robot.place()
end

function pillarExplode(times)
  robot.select(1)
  robot.place()
  robot.suck()
  robot.swing()
  robot.select(1)
  robot.up()
  for i = 1, times do
     robot.placeDown()
	 robot.up()
  end
  robot.select(2)
  robot.placeDown()
end

function superPillarExplode(times)
  robot.swingDown()
  robot.select(1)
  robot.place()
  robot.suck()
  robot.swing()
  robot.select(1)
  robot.up()
  for i = 1, times / 5 do
     robot.place()
	 robot.placeDown()
	 robot.turnRight()
	 robot.place()
     robot.turnRight()
	 robot.place()
	 robot.turnRight()
	 robot.place()
	 robot.turnRight()
	 robot.up()
  end
  robot.select(2)
  robot.placeDown()
end
-- WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
local turning = false
function topBar()
term.clear()
term.setTextColor(colors.red)
io.write("##################################################\n")
io.write("#    Omar's Terrorist Tool Kit  OC v1            #\n")
io.write("##################################################\n\n\n")
term.setTextColor(colors.blue)
end
term.setBackgroundColor(colors.white)
topBar()
io.write("Please enter how many blocks you would like the robot to go forward: ")
local straight = read()
topBar()
io.write("Please enter if you would like the robot to turn left or right: ")
local turn = read()
topBar()
io.write("Please enter how many blocks you would like the robot to go forward after turning: ")
local turnmove = read()
topBar()
io.write("If using pillar explode, how many blocks of Explosives?: ")
local times = read()
topBar()
io.write("Which mode do you want to use?\n1: Super Explode\n2: Pillar Explode\n3: Super Pillar Explode\n~: ")
local mode = io.read()
 
if straight ~= nil then
    straight = tonumber(straight)
    for i = 1, straight do
	    robot.swing()
        robot.forward()
    end
    if turn == "left" then
        print("Turned left")
        robot.turnLeft()
		turning = true
    elseif turn == "right" then
        print("Turned right")
        robot.turnRight()
		turning = true
    elseif turn ~= nil then
        print("No direction will be used.")
    end
	if turning == true then
	    for i = 1, turnmove do
            robot.swing()
            robot.forward()
        end
    end
end

if mode == "1" then
   superExplode()
elseif mode == "2" then
   pillarExplode(times)
elseif mode == "3" then
   superPillarExplode(times)
end
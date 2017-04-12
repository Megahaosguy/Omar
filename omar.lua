function superExplode()
  turtle.select(1)
  turtle.place()
  turtle.suck()
  turtle.dig()
  turtle.select(1)
  turtle.place()
  turtle.placeUp()
  turtle.placeDown()
  turtle.back()
  turtle.select(2)
  turtle.place()
end

function pillarExplode(times)
  turtle.select(1)
  turtle.place()
  turtle.suck()
  turtle.dig()
  turtle.select(1)
  turtle.up()
  for i = 1, times do
     turtle.placeDown()
	 turtle.up()
  end
  turtle.select(2)
  turtle.placeDown()
end

function superPillarExplode(times)
  turtle.digDown()
  turtle.select(1)
  turtle.place()
  turtle.suck()
  turtle.dig()
  turtle.select(1)
  turtle.up()
  for i = 1, times / 5 do
     turtle.place()
	 turtle.placeDown()
	 turtle.turnRight()
	 turtle.place()
     turtle.turnRight()
	 turtle.place()
	 turtle.turnRight()
	 turtle.place()
	 turtle.turnRight()
	 turtle.up()
  end
  turtle.select(2)
  turtle.placeDown()
end
-- WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
local turning = false
function topBar()
term.clear()
term.setTextColor(colors.red)
io.write("#######################################\n")
io.write("#    Omar's Terrorist Tool Kit        #\n")
io.write("#######################################\n\n\n")
term.setTextColor(colors.blue)
end
term.setBackgroundColor(colors.white)
topBar()
io.write("Please enter how many blocks you would like the turtle to go forward: ")
local straight = read()
topBar()
io.write("Please enter if you would like the turtle to turn left or right: ")
local turn = read()
topBar()
io.write("Please enter how many blocks you would like the turtle to go forward after turning: ")
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
	    turtle.dig()
        turtle.forward()
    end
    if turn == "left" then
        print("Turned left")
        turtle.turnLeft()
		turning = true
    elseif turn == "right" then
        print("Turned right")
        turtle.turnRight()
		turning = true
    elseif turn ~= nil then
        print("No direction will be used.")
    end
	if turning == true then
	    for i = 1, turnmove do
            turtle.dig()
            turtle.forward()
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
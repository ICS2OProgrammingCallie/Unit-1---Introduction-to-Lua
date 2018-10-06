-----------------------------------------------------------------------------------------
-- Title: TouchAndDrag
-- Name: Callie McWaters
-- Course:ICS20
-- This program displays images that react to a person's finger.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local pinkGirl = display.newImageRect("Images/girl1.png", 150, 150)
local pinkGirlWidth = pinkGirl.width 
local pinkGirlHeight = pinkGirl.height 

local blueGirl = display.newImageRect("Images/girl2.png", 150,150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

local yellowGirl = display.newImageRect("Images/girl3.png", 150,150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

-- my boolean variable to keep track of which object I touched first
local alreadyTouchedPinkGirl = false
local alreadyTouchedBlueGirl = false
local alreadyTouchedYellowGirl = false

-- set the intial x and y position of myImage
pinkGirl.x = 400
pinkGirl.y = 500

blueGirl.x = 300
blueGirl.y = 200

yellowGirl.x = 700
yellowGirl.y = 600

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPinkGirl == false) then
			alreadyTouchedBlueGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
	   blueGirl.x = touch.x
	   blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", BlueGirlListener)

-------------------------------------------------------------------------------------------

-- Function: PinkGirlListener
-- Input: touch listener
-- Output: none
-- Description: when pink girl is touched, move her
local function PinkGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedPinkGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPinkGirl == true) ) then
	   pinkGirl.x = touch.x
	   pinkGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedPinkGirl = false
		alreadyTouchedBlueGirl = false
	end
end

-- add the respective listeners to each object
pinkGirl:addEventListener("touch", PinkGirlListener)

-------------------------------------------------------------------------------------------

-- Function: YellowGirlListener
-- Input: touch listener
-- Output: none
-- Description: when yellow girl is touched, move her
local function yellowGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPinkGirl == false) then
			alreadyTouchedYellowGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
	   yellowGirl.x = touch.x
	   yellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedPinkGirl = false
	end
end

-- add the respective listeners to each object
yellowGirl:addEventListener("touch", yellowGirlListener)
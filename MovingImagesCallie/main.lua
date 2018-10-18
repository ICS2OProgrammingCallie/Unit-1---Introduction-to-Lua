-- Title: MovingImages
-- Name: Callie McWaters
-- Course: ICS2O/3C
-- This program displays an image that moves across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- local variables for sound
local carSound = audio.loadSound( "Sounds/carSound.WAV")
local carSoundChannel
-- play the sound as the car moves
carSoundChannel = audio.play(carSound)

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transpearent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight*1/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- adds the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transperency of the ship every time it moves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-------------------------------------------------------------------------------------------------------------

-- global variables
scrollSpeedStar = 2

-- character image with width and height
local star = display.newImageRect("Images/star.png", 500, 500)

-- set the image to be transperent
star.alpha = 0

-- set the initial x and y position of star
star.x = 1000
star.y = display.contentHeight*2/3

-- Function: MoveStar
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the star
local function MoveStar(event)
	-- adds the scroll speed to the x-value of the star
	star.x = star.x - scrollSpeedStar
	-- change the transperency of the star every time it moves so that it fades out
	star.alpha = star.alpha + 0.01
end

Runtime:addEventListener("enterFrame", MoveStar)
-- Title: MovingImages
-- Name: Callie McWaters
-- Course: ICS2O/3C
-- This program displays an image that moves across the screen

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect ("Images/beetleship.png", 200, 200)

-- set the image to be transpearent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: this function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- adds the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transperency of the ship every time it ,mpoves so that it fades out
	beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
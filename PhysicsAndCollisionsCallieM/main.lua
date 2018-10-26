-----------------------------------------------------------------------------------------
-- Title: Physics and Collisions
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays a ball that bounces down a beam using physics
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()

-----------------------------------------------------------------------------------------
-- objects
-----------------------------------------------------------------------------------------

-- ground
local ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentWidth/2
ground.y = display.contentHeight
-- set width to be same as the screen
ground.width = display.contentWidth
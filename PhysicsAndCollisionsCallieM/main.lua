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
-- SOUNDS
-----------------------------------------------------------------------------------------

-- add background music
local backgroundMusic = audio.loadSound ("Sounds/backgroundMusic.mp3")
local backgroundMusicChannel

-- play the background music
backgroundMusicChannel = audio.play(backgroundMusic)

-----------------------------------------------------------------------------------------
-- objects
-----------------------------------------------------------------------------------------

-- display the ground
local ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentWidth/2
ground.y = display.contentHeight
-- set width to be same as the screen
ground.width = display.contentWidth

-- add physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-- display the beam
local beam1 = display.newImage("Images/beam.png", 0, 0)
beam1.x = display.contentCenterX/5
beam1.y = display.contentCenterY*1.65
beam1.width = display.contentWidth/2
beam1.height = display.contentHeight/10

-- display the second beam
local beam2 = display.newImage("Images/beam.png", 0, 0)
beam2.x = display.contentCenterX/.5
beam2.y = display.contentCenterY*1.65
beam2.width = display.contentWidth
beam2.height = display.contentHeight/10

-- rotate the beam -60 degrees so its an angle
beam1:rotate(45)
beam2:rotate(90)

-- send it to the back layer
beam1:toBack()
beam2:toBack()

-- add physics
physics.addBody(beam1, "static", {friction=0.5, bounce=0.3})
physics.addBody(beam2, "static", {friction=0.5, bounce=0.3})

-- create bkg
local bkg = display.newImage("Images/bkg.png", 0, 0)
bkg.x = display.contentCenterX
bkg.y = display.contentCenterY
bkg.width = display.contentWidth
bkg.height = display.contentHeight

-- send to back
bkg:toBack()

-----------------------------------------------------------------------------------------
--FUNCTIONS
-----------------------------------------------------------------------------------------

-- create the first ball
local function  firstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)
	-- add physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.7, radius=12.5})
	-- scale the ball
	ball1:scale(0.5, 0.5)
end

-- create the second ball
local function secondBall()
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)
	-- add physics
	physics.addBody(ball2, {density=1.5, friction=0.3, bounce=0.9, radius=25})
	-- scale the ball
	ball2:scale(1.0, 1.0)
end

--create the third ball
local function thridBall()
	local ball3 = display.newImage("Images/super_ball.png", 0, 0)
	--add physics
	physics.addBody(ball3, {density=1.7, friction=0.3, bounce=1.7, radius=30})
	-- scale the ball
	ball3:scale(1.5, 1.5)
end

-- create the fourth ball
local function fourthBall()
	local ball4 = display.newImage("Images/super_ball.png", 0, 0)
	-- add physics
	physics.addBody(ball4, {density=2.0, friction=1.5, bounce=1.0, radius=50})
	-- scale the ball
	ball4:scale(2.0, 2.0)
end
-----------------------------------------------------------------------------------------
--TIMER DELAYS - call each function after the given millisecond
-----------------------------------------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)
timer.performWithDelay( 1300, thridBall)
timer.performWithDelay( 2000, fourthBall)
-----------------------------------------------------------------------------------------
-- Title: Buttons in Lua 
-- Name: Callie McWaters
-- Course: ICS20
-- This program shows a blue button and when i click on it a red button replaces it.
-----------------------------------------------------------------------------------------

-- set background colour
display.setDefault ("background", 177/255, 88/255, 80/255)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- variables for sound
local whackSound = audio.loadSound( "Sounds/whackSound.WAV" )
local whackSoundChannel

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it visible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (0.3, 0.9, 0.4)
textObject.isVisible = false

-- create checkmark, set its position and make it visible
local checkmark = display.newImageRect("Images/checkmark.png", 108, 100)
checkmark.x = display.contentWidth/1.5
checkmark.y = display.contentHeight/3
checkmark.isVisible = false


-- Function: BlueButtonlistener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener (touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		whackSoundChannel = audio.play(whackSound)
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end

-- Function: RedButtonlistener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function RedButtonListener (touch)
	if (touch.phase == "began") then
		redButton.isVisible = true
		blueButton.isVisible = false
		textObject.isVisible = false
		checkmark.isVisible = false
	end

	if (touch.phase == "ended") then
		redButton.isVisible = false
		blueButton.isVisible = true
		textObject.isVisible = false
		checkmark.isVisible = false
	end
end

-- add the respective listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)

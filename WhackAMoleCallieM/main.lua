-----------------------------------------------------------------------------------------
-- Title: Whack A Mole
-- Name: Callie McWaters 
-- Course: ICS20
-- This program places a random object on the screen. If the user clicks on it in time,
-- the score increases by 1
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Creating background
display.setDefault("background", 34/255, 236/255, 229/255)

-- adding sound
local whackSound = audio.loadSound( "Sounds/whackSound.mp3")
local whackSoundChannel
local bkgMusic = audio.loadSound( "Sounds/bkgMusic.mp3")
local bkgMusicChannel

-- play the background music
bkgMusicChannel = audio.play(bkgMusic)

-- Creating Bird

local tweetyBird = display.newImage( "Images/tweetyBird.png" , 0, 0)

-- set the image position
tweetyBird.x = display.contentCenterX
tweetyBird.y = display.contentCenterY
tweetyBird:scale(2.5/10, 2.5/10)
tweetyBird.isVisible = false

-----------------------------------------------------------------------------------------
-- Score
-----------------------------------------------------------------------------------------

local score
local numberOfPoints = 0

-- display text for the score
score = display.newText( "Score = ".. numberOfPoints, display.contentWidth/3.5, display.contentHeight/1.5, nil, 75)
score:setTextColor(185/255, 118/255, 243/255)

-----------------------------------------------------------------------------------------
-- Local Functions
-----------------------------------------------------------------------------------------

-- Make the mole appear in a random position
function PopUp()

	-- Choosing a random position on the screen
	tweetyBird.x = math.random( 0, display.contentWidth )
	tweetyBird.y = math.random( 0, display.contentHeight )
	tweetyBird.isVisible = true
	timer.performWithDelay( 700, Hide)
end

-- this function calls the pop up after 2 seconds
function PopUpDelay()
	timer.performWithDelay( 2000, PopUp )
end

-- This function makes the mole invisible and then calls the PopUpDelay function
function Hide()
	tweetyBird.isVisible = false
	PopUpDelay()
end

-- This function starts the game
function GameStart()
	PopUpDelay()
end

-- This function increments the score only if the mole is clicked. It then displays the
-- new score.
function Whacked( event )

	if (event.phase == "began") then
		whackSoundChannel = audio.play(whackSound)
		numberOfPoints = numberOfPoints + 1
		score.text = "Score = ".. numberOfPoints		
	
	end
end

-- event listener for when the mole is whacked
tweetyBird:addEventListener( "touch", Whacked )

-- start the game
GameStart()
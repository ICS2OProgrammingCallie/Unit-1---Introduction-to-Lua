-----------------------------------------------------------------------------------------
-- Title: Numeric Textfield
-- Name: Callie McWaters
-- Course: ICS20
-- This program displays a math question and asks the user to answer in a numeric textfield
----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 163/255, 222/255, 243/255)

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer
local numberOfPoints = 0
local points

-- variables for the timer
local totalSeconds = 7
local secondsLeft = 7
local clockText
local countDownTimer
local lives = 5
local heart1
local heart2
local heart3
local heart4
----------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------

local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3")
local incorrectSoundChannel

----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------------


local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 15)
	randomNumber2 = math.random(0, 15)
	randomOperator = math.random(1, 3)

	if ( randomOperator == 1) then
		correctAnswer = randomNumber1 + randomNumber2
	
		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif ( randomOperator == 2) then

		correctAnswer = randomNumber1 - randomNumber2
	
		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "

	elseif (randomOperator == 3) then

		correctAnswer = randomNumber1 * randomNumber2
	
		-- create question in text object
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "
    end
end

local function UpdateHearts()

	if (lives == 4) then

		heart4.isVisible = false

	elseif (lives == 3) then

		heart3.isVisible = false

	elseif (lives == 2) then

		heart2.isVisible = false

	elseif (lives == 1) then

		heart1.isVisible = false

	elseif (lives == 0) then
		heart1.isVisible = false
		heart2.isVisible = false
		heart3.isVisible = false
		heart4.isVisible = false
	end

	lives = lives -1

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2100, HideCorrect)
			numberOfPoints = numberOfPoints + 1
			points.text = "Correct = ".. numberOfPoints

		-- if the users answer and the incorrect answer are the same:
		else
			incorrectObject.isVisible = true
			incorrectSoundChannel = audio.play(incorrectSound)
			timer.performWithDelay(2100, HideIncorrect)
			lives = lives - 1
			UpdateHearts()
		end
		event.target.text = ""
	end
end


local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = "Time: ".. secondsLeft  

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		UpdateHearts()
		AskQuestion()
	end
end

-- function that calls the timer
local function StartTimer()
	-- create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

----------------------------------------------------------------------------------------
-- OBJECT CREATION
----------------------------------------------------------------------------------------

-- displays an object and sets the colour
questionObject = display.newText( "", display.contentWidth/2, display.contentHeight/2, nil, 75 )
questionObject:setTextColor(204/255, 153/255, 255/255)

-- create the correct text and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2.5/3, nil, 75 )
correctObject:setTextColor(230/255, 51/255, 51/255)
correctObject.isVisible = false

-- create the incorrect text object make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2.5/3, nil, 75)
incorrectObject:setTextColor(51/255, 123/255, 230/255)
incorrectObject.isVisible = false

-- Create numeric field
NumericField = native.newTextField( display.contentWidth/2, display.contentHeight/1.5, 200, 80)
NumericField.inputType = "display"

-- add the event listener for the numeric field
NumericField:addEventListener( "userInput", NumericFieldListener )

-- display text for points
points = display.newText( "Correct = ".. numberOfPoints, display.contentWidth/3.5, display.contentHeight/5, nil, 50)
points:setTextColor(30/255, 219/255, 188/255)

-- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

heart4 = display.newImageRect("Images/heart.png", 100, 100)
heart4.x = display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

clockText = display.newText ("", display.contentWidth/3, display.contentHeight*1/3, nil, 75)
----------------------------------------------------------------------------------------
-- FUNCTION CALLS
----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

-- call the function to remove hearts
UpdateHearts()

-- Call the timer
StartTimer()




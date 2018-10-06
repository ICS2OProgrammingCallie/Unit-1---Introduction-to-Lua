-----------------------------------------------------------------------------------------
-- Title: Area Rectangle/Circle
-- Name: Callie McWaters
-- Course: ICS20/3C
-- This program displays a rectangle and shows its area

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 350
local heightOfRectangle = 200
local areaOfRectangle
local myCircle 
local pi = 3.14
local radius = 100
local areaOfCircle

-- set the background colour of my screen.Remember that colors are between 0 and 1.
display.setDefault("background", 155/255, 30/255, 25/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set width of the border
myRectangle.strokeWidth = 20

--set the colour of the rectangle
myRectangle:setFillColor(0.7, 0.1, 0.3)

-- set color of the border
myRectangle:setStrokeColor(0, 1, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels². " , 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)

-- draw the circle that is half the width and height of the screen size.
myCircle = display.newCircle(0, 0, radius)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 500
myCircle.y = 20

-- set width of the border
myCircle.strokeWidth = 20

--set the colour of the rectangle
myCircle:setFillColor(0.9, 0.2, 0.3)

-- set color of the border
myCircle:setStrokeColor(0, 1, 2)

-- calculate the area
areaOfCircle = radius * radius * pi

-- write the area on the screen take into consideration the size of the font when positioning it on the screen
areaText = display.newText("The area of this circle with a radius of \n" ..
	radius .. " is " .. areaOfCircle .. " pixels². " , 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 20
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)
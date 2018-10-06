-- Name: Callie McWaters
-- Course: ICS20/3C
-- This program displays Hello, World on the ipad simulator and "Hellooooooo!" to the command
-- terminal.
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Hellooooooooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 154/255, 249/255, 199/255)

-- create a local variable
local textObject1
local textObject2

-- displays text on the screen at position x = 500 and y = 500 with
-- a deafult font style and font size of 50
textObject1 = display.newText( "Hello, World!", 500, 225, nil, 85)

-- sets the color of the text
textObject:setTextColor(155/255, 42/255, 198/255)

-- displays text on the screen at position x = 500 and y = 500 with
-- a deafult font style and font size of 50
textObject2 = display.newText( "By: Callie", 500, 400, nil, 85)

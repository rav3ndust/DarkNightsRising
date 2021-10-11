'''
This is the beginning of the Python port of DarkNightsRising. 

We are going to try to make it into a Python package so it can be easily portable across systems. 

This is the first welcome screen
'''
#initial Welcome Window for DarkNightsRising
import PySimpleGUI as gui
import os
# import the theming for the window
gui.theme('Dark')
# define the functions
def playButton():                   # when the user clicks "Play"
    os.system('cd .. && cd .. && ./intro.sh')
    os.system('notify-send "Dark Nights Rising" "Launching the game..."')
def deletePreviousGame():           # when the user clicks "Delete Previous Game"
    os.system('notify-send "Dark Nights Rising" "Deleting previous data..."')
    os.system('cd .. && cd .. && rm -r variables.txt')
    os.system('notify-send "Dark Nights Rising" "Save data deleted."')
'''
We need to build out the functionality for how the user will load their previous progress in the game.

The previous data should be able to be called when the user selects the "Load Previous Game."
'''
#def loadPreviousGame():
    #expressions
# add the stuff inside the window
windowLayout = [[gui.Text("Welcome to Dark Nights Rising!")],
                [gui.Text("Can you handle your inner demons?")],
                [gui.Text("Select an option below to get started.")],
                [gui.Button('Play'), gui.Button('Load Previous Game')],
                [gui.Button('Delete Previous Game'), gui.Button('Exit the Game')]]   
# spawn the window
welcomeWindow = gui.Window('Dark Nights Rising', windowLayout)
# loop for processing events and taking inputs 
while True:
    event, values = welcomeWindow.read()
    if event == gui.WIN_CLOSED or event == 'Exit the Game':
        break
    elif event == 'Play':
        playButton()
    elif event == 'Delete Previous Game':
        deletePreviousGame()
    #else event == 'Load Previous Game:'
        #loadPreviousGame()
    print('Exiting the game!')
# close the window, notify the user the program successfully exited
welcomeWindow.close()
os.system('notify-send "Dark Nights Rising" "Program closed."')

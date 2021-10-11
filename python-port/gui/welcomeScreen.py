'''
This is the beginning of the Python port of DarkNightsRising. 

We are going to try to make it into a Python package so it can be easily portable across systems. 

This is the first welcome screen. We're using PySimpleGUI to easily build out the UI.
'''
#initial Welcome Window for DarkNightsRising
import PySimpleGUI as gui
import os
# import the theming for the window
gui.theme('Dark')
# define the functions
def installButton():                # when the user clicks "Install"
    os.system('python3 installingScreen.py')
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
                [gui.Text("Install the game's dependencies by clicking the 'Install' button below.")],
                [gui.Button('Install Dark Nights Rising')],
                [gui.Text("Ready? Select an option below to get started.")],
                [gui.Button('Play'), gui.Button('Load Previous Game')],
                [gui.Button('Delete Previous Game'), gui.Button('Exit the Game')]]   
# create a window ("welcomeWindow"), and assign it to our window layout ("windowLayout")
welcomeWindow = gui.Window('Dark Nights Rising', windowLayout)
# loop for processing events and taking inputs 
while True:
    event, values = welcomeWindow.read()
    if event == gui.WIN_CLOSED or event == 'Exit the Game':
        break
    elif event == 'Install Dark Nights Rising':
        installButton()         # run the installButton function
    elif event == 'Play':   
        playButton()            # run the playButton function
    elif event == 'Delete Previous Game':
        deletePreviousGame()    # run the deletePreviousGame function    
    #else event == 'Load Previous Game:'
        #loadPreviousGame()     # run the loadPreviousGame function
    print('Exiting the game!')
# close the window, notify the user the program successfully exited
welcomeWindow.close()
os.system('notify-send "Dark Nights Rising" "Program closed."')

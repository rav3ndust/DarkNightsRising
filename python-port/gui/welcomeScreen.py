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
# add the stuff inside the window
windowLayout = [[gui.Text("Welcoe to Dark Nights Rising!")],
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
    print('Exiting the game!')

welcomeWindow.close()
os.system('notify-send "Dark Nights Rising" "Program closed."')

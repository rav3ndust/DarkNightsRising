'''
This is the installation window that shows a handy progress bar alerting the user that the game is
installing.

When this is ran, the game's scripts are marked as executable by the system, and the dependences that the
game relies on are installed if they don't already exist on the system.
'''
import PySimpleGUI as gui
import os
# send a notification to let the user know the game is being installed.
os.system('notify-send "Dark Nights Rising" "The game is being installed. Please wait..."')
# run the installation bash script
os.system('cd .. && cd .. && ./install.sh')
os.system('notify-send "Dark Nights Rising" "The game and its dependencies have been installed."')
# make the progress bar with a custom message letting the user know DNR is being installed.
for i in range(2500):
    if not gui.OneLineProgressMeter('Dark Nights Rising', i+1, 2500, 'Installing the game for you.'):
        break

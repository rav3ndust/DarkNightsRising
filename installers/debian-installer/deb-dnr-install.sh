#!/bin/bash
set -euo pipefail
# this is an installation script for the DarkNightsRising game. 
#
# this script will make DarkNightsRising globally executable on your linux system. 
#
# after installation, just type "darknightsrising" in your terminal to play the game from anywhere in your system. 
#
# at the moment, the game assumes a Debian/Ubuntu-based distribution
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
notify-send "DarkNightsRising Installer" "Currently installing Dark Nights Rising. Hold tight..."
echo "Installing Dark Nights Rising..."
# install the dependencies for the games
#
# the required deps are flite, mpg123, python, pip, pysimplegui, and dialog
#
# - flite is used for vocal synthesis
# - mpg123 is used to control the game's soundtrack 
# - dialog is used to present the game's GUI elements
# - python and pysimplegui for the python port
# - libnotify for sending user notifications 
# 
# more deps may be required as development goes on, but I am striving to keep things as minimal as possible. 
core_pkgs=(
    "libnotify-bin"
    "python3" 
    "python-tk" 
    "python3-pip"
    "flite" 
    "dialog" 
    "mpg123"
)
sudo apt-get update && sudo apt-get install $core_pkgs -y
pip install PySimpleGUI
# make each script (Game Scene) executable
# all Game Scenes live in the DarkNightsRising/scenes folder
chmod +x ../scenes/deathScript.sh
chmod +x ../scenes/intro.sh 
chmod +x ../scenes/first-scene.sh
chmod +x ../scenes/second-scene.sh
chmod +x ../scenes/third-scene.sh
chmod +x ../scenes/fourth-scene.sh
chmod +x ../scenes/fifth-scene.sh
chmod +x ../scenes/sixth-scene.sh
chmod +x ../scenes/seventh-scene.sh
chmod +x ../scenes/eighth-scene.sh
# make the game invokeable systemwide. 
# NOTE:
# - calling the game will begin it from the intro scene until we make some sort of saving function.
sudo cp ../scenes/intro.sh /usr/bin/darknightsrising
# notify the user that the process is complete
notify-send "DarkNightsRising Installer" "Thanks for installing Dark Nights Rising! Enjoy."
echo "Dark Nights Rising is installed. Please start it by executing the intro.sh script or typing darknightsrising from anywhere on your GNU/Linux system."
echo "Enjoy the game! If you need any help, please see https://github.com/rav3ndust/DarkNightsRising to file bugs or learn more."
exit

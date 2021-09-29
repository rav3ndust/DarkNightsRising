#!/bin/bash

# this is an installation script for the DarkNightsRising game. 

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
# the required deps are flite, mpg123 and dialog
#
# - flite is used for vocal synthesis
# - mpg123 is used to control the game's soundtrack 
# - dialog is used to present the game's GUI elements
#
# more deps may be required as development goes on, but I am striving to keep things as minimal as possible. 
sudo apt install flite dialog mpg123 -y

# make each script (Game Scene) executable
chmod +x deathScript.sh
chmod +x intro.sh 
chmod +x first-scene.sh
chmod +x second-scene.sh
chmod +x third-scene.sh
chmod +x fourth-scene.sh
chmod +x fifth-scene.sh
################################
# make the animations executable
cd animations 
chmod +x testani.sh && cd ..chmod  # return the previous working dir 
################################
# make the game invokeable systemwide. 
#
# calling the game will begin it from the intro scene until we make some sort of saving function.

sudo cp intro.sh /usr/bin/darknightsrising

# notify the user that the process is complete
notify-send "DarkNightsRising Installer" "Thanks for installing Dark Nights Rising! Enjoy."
echo "Dark Nights Rising is installed. Please start it by executing the intro.sh script or typing darknightsrising from anywhere on your GNU/Linux system."
echo "Enjoy the game! If you need any help, please see https://github.com/rav3ndust/DarkNightsRising to file bugs or learn more."
sleep 1
exit

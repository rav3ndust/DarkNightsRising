#!/bin/bash

# this is an installation script for the DarkNightsRising game. 

# this script will make DarkNightsRising globally executable on your linux system. 
#
# after installation, just type "darknightsrising" in your terminal to play the game from anywhere in your system. 
#
# at the moment, the game assumes a Debian/Ubuntu-based distribution
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

echo "Installing Dark Nights Rising..."

# install the dependencies for the games
#
# the required deps are flite and dialog

sudo apt install flite dialog -y

# make each script (Game Scene) executable
sudo chmod +x intro.sh && sudo chmod +x first-scene.sh && sudo chmod +x second-scene.sh

# make the game invokeable systemwide. 
#
# calling the game will begin it from the intro scene until we make some sort of saving function.

sudo cp intro.sh /usr/bin/darknightsrising

# notify the user that the process is complete

echo "Dark Nights Rising is installed. Please start it by executing the intro.sh script or typing darknightsrising from anywhere on your GNU/Linux system."
echo "Enjoy the game! If you need any help, please see https://github.com/rav3ndust/DarkNightsRising to file bugs or learn more."

exit

#!/bin/sh
#	DarkNightsRising installer
#	- installs the needed packages for running Dark Nights Rising. 
#	- makes the game scripts executable. 
# This script assumes an Arch Linux environment.
###########################
dnr="Dark Nights Rising"
pkgs="python3 python-pip flite dialog mpg123" 
gui="PySimpleGUI" 
err="Sorry - something went wrong. Pleae check logs." 
nTitle="$dnr Helper Script" 
notif1="$dnr installing." 
notif2="$dnr installation complete. Enjoy!"
# game scripts (scenes) 
# add other scripts here as they are created.
sc0="scenes/intro.sh" 		 # intro scene
sc1="scenes/first-scene.sh"	 # first scene
sc2="scenes/second-scene.sh"	 # second scene
sc3="scenes/third-scene.sh"	 # third scene
sc4="scenes/fourth-scene.sh"	 # fourth scene
sc5="scenes/fifth-scene.sh"	 # fifth scene
death_sc="scenes/deathScript.sh" # death scene (game over)
bin="/usr/bin/darknightsrising"  # bin location
#########################
# - - - Functions - - - 
#########################
install_pkgs() {
	# installs the packages needed for Dark Nights Rising.
	echo "Installing $dnr dependencies..."
	sleep 1
	sudo pacman -Sy $pkgs || $err
	pip install $gui || $err
	echo "$dnr dependencies installed."
	sleep 1
}
make_exec() {
	# makes scripts executable.
	echo "Making needed scripts executable..."
	sleep 1
	chmod +x $sc0 $sc1 $sc2 $sc3 $sc4 $sc5 $death_sc
	# copy intro.sh to /usr/bin/darknightsrising
	sudo cp $sc0 $bin
	echo "All $dnr scripts marked as executable."
	sleep 1
}
###########################
# - - - Script Entry - - - 
###########################
echo "$dnr Installation Helper" 
notify-send $nTitle $notif1
sleep 1
# run the install_pkgs() function. 
# this will install the needed dependencies. 
# dependencies are outlined in '$pkgs' var
install_pkgs
# mark all scripts as executable with make_exec() function.
# these scripts are 'scenes' and should all be placed in `/scenes`
make_exec
echo "$dnr installation complete."
notify-send $nTitle $notif2
sleep 1
# finishing
fin="Installation of $dnr is finished! You can start the game by running the command 'darknightsrising' from anywhere in your terminal. Enjoy the game!" 
echo $fin 
sleep 1
echo "Exiting..."
sleep 1 && exit 

#!/bin/bash

#
# Dark Night Rising by rav3ndust
#
# A text-based adventure game guided by a robot. 
#
# this aims to be a simple adventure game that is written in nothing but shell script.
#
# a very odd way to write a game to be sure, but I am bored and need a side project. 
#
# someone help me make this awesome. it could even be fun to play on Linux phones. 
#
# ...maybe.
#
# This is the introduction and character-creation stage of this game.
#
# global variables for this game will be: 
# NAME: the name of the player
# CHARNAME: the player's desired character name
# RACE: the player's desired character race
# PLACE: the player's desired fictional hometown
#
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#
# Present the player with the introduction. 
flite -voice rms "Hello. Welcome to Dark Night Rising. This is a game about finding yourself, but keep in mind that the journey is not about the destination, but the path it takes to get there." & dialog --msgbox "Hello. Welcome to Dark Night Rising. This is a game about finding yourself, but keep in mind that the journey is not about the destination, but the path it takes to get there." 100 50  

# Next, we want the player to introduce themselves to us, and select what kind of experience they would like to have. 
flite -voice rms "I am Raven, your guide through this game. Please tell me a little bit about yourself." & dialog --msgbox "I am Raven, your guide through this game. Please tell me a little bit about yourself." 100 50 
#
# start with NAME. the script should read the user's input as their name, and the variable can be called using NAME from now on.
# 
# we are using a *read* command instead of an inputbox so that we can retain the input as a variable, instead of a temporary piece of data. 
#
# we will then ask the player what they would like to name their character, what race their character is, and to come up with a location name. 
#
# we will store all of these values as variables using the read command, allowing us to call them again later in dialog boxes.
#
flite -voice rms "So, wanderer. What is your name? Press enter to continue." & dialog --msgbox "So, wanderer - what is your name? Press ENTER to continue." 100 50  
read -p "Please enter your name: " NAME

# accept and verify NAME, move onto the next step 
flite -voice rms "It is nice to meet you, $NAME. Now, let us learn a little more about you." &  dialog --msgbox "It is nice to meet you, $NAME. Now, let us learn a little bit more about you." 100 50 

flite -voice rms "So, tell me, $NAME, what would you like to call your character? Press enter to continue." & dialog --msgbox "So, tell me, $NAME, what would you like to call your character? Press ENTER to continue." 100 50 

# take the input for the character name. it will be stored as a variable called CHARNAME. 
read -p "Please enter a character name now: " CHARNAME 

# accept the input, move onto the next
flite -voice rms "Excellent. What race will $CHARNAME hail from? Be creative. Press enter to continue." & dialog --msgbox "Excellent. What race will $CHARNAME hail from? Be creative. Press ENTER to continue." 100 50

# take input for the race. it will be stored as a variable called RACE. 
read -p "Please enter your desired race for $CHARNAME: " RACE

# verify the input, move on to the next
flite -voice rms "Cool, so $CHARNAME is from the $RACE race." & dialog --msgbox "Cool, so $CHARNAME is from the $RACE race." 100 50  
flite -voice rms "Next, let us decide where $CHARNAME hails from. What should their home kingdom be called? Press enter to continue." & dialog --msgbox "Next, let us decide where $CHARNAME hails from. What should their home kingdom be called? Press ENTER to continue." 100 50 

# take input for the location. the data will be stored as a variable called PLACE
read -p "Where does $CHARNAME come from? Come up with a creative name for a location: " PLACE

# take all of the desired input, verify it. if the player is happy, move onto Scene 1 of the game by invoking scene1.sh. if not, exit so the player can restart the game. 
flite -voice rms "So, $NAME. We have decided that your character is named $CHARNAME, is of the $RACE race, and comes from the kingdom of $PLACE." & dialog --msgbox "So, $NAME. We have decided that your character is named $CHARNAME, is of the $RACE race, and comes from the kingdom of $PLACE." 100 50 

# ask the user if they are happy with these choices using an if-then condition
flite -voice rms "Are you happy with this character, $NAME? Type yes or no on the next screen to decide. Press enter to continue." & dialog --msgbox "Are you happy with this character, $NAME? Type YES or NO on the next screen to decide. Press ENTER to continue." 100 50 

read -p "Are you happy with this configuration? Please enter YES or NO: " ANSWER

	if [[ $ANSWER = "YES" ]]
		then touch variables.txt	# create a textfile to call variables from other scripts, append all of them 
		echo "NAME='$NAME'" >> variables.txt  # append the NAME variable to the textfile
		echo "CHARNAME='$CHARNAME'" >> variables.txt # append the CHARNAME variable to the textfile
		echo "RACE='$RACE'" >> variables.txt	  # append the RACE variable to the textfile
		echo "PLACE='$PLACE'" >> variables.txt   # append the PLACE variable to the textfile
		./first-scene.sh		# launch into the first scene of the game
	else flite -voice rms "Oh no! Let us start again until you get it right." & dialog --msgbox "Oh no! Let us start again until you get it right." 100 50 && exit && ./scene-1.sh
	# if an answer other than YES is given, the script will exit and reload, giving the player the chance to begin their character creation process again.
	fi
exit 

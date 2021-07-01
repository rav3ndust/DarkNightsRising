#!/bin/bash

source variables.txt	# link the variables.txt file in so we can call the variables we made earlier. 

# This is the First Scene of the game. 
# In this scene, the character will learn about the story and how they can begin progressing through it. 
# We will begin building out various choices the character can make in this game. 
#
# Remember the variables: 
# NAME is the player's name. CHARNAME is the characters name. RACE is the race of the character, and PLACE is the kingdom the character is from. 
#
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#
# begin by defining the functions
function voice1 {
	flite -voice rms "Let us get started."	
}

function menu1 {
	dialog --msgbox "Let us get started." 100 50
}
# The next part of the story will involve the player learning about their location
function voice2 {
	flite -voice rms "$CHARNAME wakes up in their home, feeling isolated and lethargic."	
}

function menu2 {
	dialog --msgbox "$CHARNAME wakes up in their home, feeling isolated and lethargic." 100 50 
}

function voice3 {
	flite -voice rms "The area around you begins to swirl, almost as if you are in a haze."	
}

function menu3 {
	dialog --msgbox "The area around you begins to swirl, almost as if you were in a haze." 100 50 	
}
 
function voice4 {
	flite -voice rms "$CHARNAME wakes up in front of a mirror, with a sinister looking reflection staring back at them."	
}

function menu4 {
	dialog --msgbox "$CHARNAME wakes up in front of a mirror, with a sinister-looking reflection staring back at them." 100 50  
}

function voice5 {
	flite -voice rms "You feel a sense of dread as you look into the mirror. What do you do?"	
}

function menu5 {
	dialog --msgbox "You feel a sense of dread as you look into the mirror. What do you do?" 100 50 
}

function firstVoicePrompt {
	flite -voice rms "Would you like to look into the mirror, or back away? Press enter to continue."	
}

function firstMenuPrompt {
	dialog --msgbox "Would you like to look into the mirror, or back away? Press ENTER to continue." 100 50 
}
# the player will then be presented with a choice in the script. let's move on. 
# we now need to build out some functions for the if/then condition that will be coming. 
################
# if conditional functions:
function conditionalVoice1 { 								# first vocal part
	flite -voice rms "You stare into the mirror, and see a demonic face looking back at you."
}

function conditionalMenu1 { 							# first menu option
	 dialog --msgbox "You stare into the mirror, and see a demonic face looking back at you." 100 50
}

function conditionalVoice2 { 							# second vocal part
	flite -voice rms "The demon says the following:"
}

function conditionalMenu2 {  							# second menu option
	dialog --msgbox "The Demon says the following:" 100 50 
}

function conditionalVoice3 { 							# third vocal part
	flite -voice kal "Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way.Together, we can help you realize your true potential."	
}

function conditionalMenu3 { 							# third menu option
	dialog --msgbox "'Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way. Together, we can help you realize your true potential.'" 100 50
}

function conditionalVoice4 { 							# fourth vocal part
	flite -voice rms "You feel terrified. You do not know what to do next, only that your heart feels like it is sinking into your chest."
}

function conditionalMenu4 { 							# fourth menu option
	dialog --msgbox "You feel terrified. You do not know what to do next, only that your heart feels like it is sinking into your chest." 100 50
}

function conditionalVoice5 { 							# fifth vocal part
	flite -voice rms "You hear the sound of a gust of wind as you are seemingly pulled into the mirror."
}

function conditionalMenu5 { 							# fifth menu option
	dialog --msgbox "You hear the sound of a gust of wind as you are seemingly pulled into the mirror." 100 50
}
# this is the part that leads into launching the second-scene script
function conditionalVocalEnd {
	flite -voice rms "It is time to explore your inner demons, $NAME. Press enter to continue."
}

function conditionalMenuEnd {
	dialog --msgbox "It is time to explore your inner demons, $NAME. Press ENTER to continue." 100 50 
}
# make the "else" functions for the if/then condition
##############################################################
# else conditional functions: 
function elseVoice1 {
	flite -voice rms "You begin to back away slowly, only to hear a huge howl."
}

function elseMenu1 {
	dialog --msgbox "You begin to back away slowly, only to hear a huge howl." 100 50
}

function elseVoice2 {
	flite -voice rms "You wonder what it could have been, only to see a demonic face appearing in the mirror."
}

function elseMenu2 {
	dialog --msgbox "You wonder what it could have been, only to see a demonic face appearing in the mirror." 100 50
}

function elseVoice3 {
	 flite -voice rms "Out of the blue, you hear an evil voice shout the following. Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way. Together, we can help you realize your true potential."	
}

function elseMenu3 {
	dialog --msgbox "Out of the blue, you hear an evil voice shout the following: 'Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way. Together, we can help you realize your true potential.'" 100 50 
}

function elseVoice4 {
	flite -voice rms "Suddenly, a gust of wind grabs you out of nowhere, and you are forced headfirst into the mirror, whether you like it or not."
}

function elseMenu4 {
	dialog --msgbox "Suddenly, a gust of wind grabs you out of nowhere, and you are forced headfirst into the mirror, whether you like it or not." 100 50
}

function elseClosingVoice {
	flite -voice rms "It is time to explore your inner demons, $NAME. Press enter to continue."
}

function elseClosingMenu {
	dialog --msgbox "It is time to explore your inner demons, $NAME. Press ENTER to continue." 100 50 
}
# soundtrack-related functions
function executeFirstSceneTrack {			# execute the First Scene song through mpg123
	mpg123 -q soundtrack/time_space.mp3
}
function muteTrack { 						# kill any running instances of mpg123
	killall mpg123
}
###################################################################################################
# run the script
###################################################################################################
executeFirstSceneTrack & voice1 & menu1
voice2 & menu2
voice3 & menu3
voice4 & menu4
voice5 & menu5
firstVoicePrompt & firstMenuPrompt
# present input allowing player to decide, execute an if/then condition based on that condition
read -p "Please enter LOOK or BACK AWAY to decide: " LOOKORBACK

	if [[ $LOOKORBACK = 'LOOK' ]]
		then conditionalVoice1 & conditionalMenu1
			 conditionalVoice2 & conditionalMenu2
			 conditionalVoice3 & conditionalMenu3
			 conditionalVoice4 & conditionalMenu4 
        	 conditionalVoice5 & conditionalMenu5     	 
			 conditionalVocalEnd & conditionalMenuEnd
             killall mpg123 && ./second-scene.sh		# kill running soundtrack instances and run the 'second-scene.sh' script to launch into the second scene of the game
        else elseVoice1 & elseMenu1
             elseVoice2 & elseMenu2
             elseVoice3 & elseMenu3
			 elsevoice4 & elseMenu4
		     elseClosingVoice & elseClosingMenu
             muteTrack && ./second-scene.sh		# kill running soundtrack instances and run the 'second-scene.sh' script to launch into the second scene of the game
        fi
exit

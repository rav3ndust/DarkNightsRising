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

flite -voice rms "Let us get started." & dialog --msgbox "Let us get started." 100 50 

# The next part of the story will involve the player learning about their location
flite -voice rms "$CHARNAME wakes up in their home, feeling isolated and lethargic." & dialog --msgbox "$CHARNAME wakes up in their home, feeling isolated and lethargic." 100 50 

flite -voice rms "The area around you begins to swirl, almost as if you are in a haze." & dialog --msgbox "The area around you begins to swirl, almost as if you were in a haze." 100 50 

flite -voice rms "$CHARNAME wakes up in front of a mirror, with a sinister looking reflection staring back at them." & dialog --msgbox "$CHARNAME wakes up in front of a mirror, with a sinister-looking reflection staring back at them." 100 50  

flite -voice rms "You feel a sense of dread as you look into the mirror. What do you do?" & dialog --msgbox "You feel a sense of dread as you look into the mirror. What do you do?" 100 50 

flite -voice rms "Would you like to look into the mirror, or back away? Press enter to continue." & dialog --msgbox "Would you like to look into the mirror, or back away? Press ENTER to continue." 100 50 
# present input allowing player to decide, execute an if/then condition based on that condition
read -p "Please enter LOOK or BACK AWAY to decide: " LOOKORBACK

	if [[ $LOOKORBACK = 'LOOK' ]]
		then flite -voice rms "You stare into the mirror, and see a demonic face looking back at you." & dialog --msgbox "You stare into the mirror, and see a demonic face looking back at you." 100 50 
		flite -voice rms "The demon says the following:" & dialog --msgbox "The Demon says the following:" 100 50 
		flite -voice kal "Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way.Together, we can help you realize your true potential." & dialog --msgbox "'Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way. Together, we can help you realize your true potential.'" 100 50
		flite -voice rms "You feel terrified. You do not know what to do next, only that your heart feels like it is sinking into your chest." & dialog --msgbox "You feel terrified. You do not know what to do next, only that your heart feels like it is sinking into your chest." 100 50 
             	flite -voice rms "You hear the sound of a gust of wind as you are seemingly pulled into the mirror." & dialog --msgbox "You hear the sound of a gust of wind as you are seemingly pulled into the mirror." 100 50 
             	flite -voice rms "It is time to explore your inner demons, $NAME. Press enter to continue." & dialog --msgbox "It is time to explore your inner demons, $NAME. Press ENTER to continue." 100 50 
             	./second-scene.sh		# run the 'second-scene.sh' script to launch into the second scene of the game
        else flite -voice rms "You begin to back away slowly, only to hear a huge howl." & dialog --msgbox "You begin to back away slowly, only to hear a huge howl." 100 50
             flite -voice rms "You wonder what it could have been, only to see a demonic face appearing in the mirror." & dialog --msgbox "You wonder what it could have been, only to see a demonic face appearing in the mirror." 100 50
             flite -voice rms "Out of the blue, you hear an evil voice shout the following. Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way. Together, we can help you realize your true potential." & dialog --msgbox "Out of the blue, you hear an evil voice shout the following: 'Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way. Together, we can help you realize your true potential.'" 100 50 
             flite -voice rms "Suddenly, a gust of wind grabs you out of nowhere, and you are forced headfirst into the mirror, whether you like it or not." & dialog --msgbox "Suddenly, a gust of wind grabs you out of nowhere, and you are forced headfirst into the mirror, whether you like it or not." 100 50
             flite -voice rms "It is time to explore your inner demons, $NAME. Press enter to continue." & dialog --msgbox "It is time to explore your inner demons, $NAME. Press ENTER to continue." 100 50 
             ./second-scene.sh		# run the 'second-scene.sh' script to launch into the second scene of the game
        fi
exit

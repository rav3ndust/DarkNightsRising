#!/bin/bash

source variables.txt		# source our textfile for the global variables

# This script is the Third Scene of the game. 
#
# In this scene, the player will begin to become more familiar with their surroundings and the Demons
#
# Global variables are NAME for player name, CHARNAME for character name, RACE for player race, and PLACE for character kingdom. 
#
# Begin the Scene: 

flite -voice rms "As the darkness dissapates and the voices fade away, you start to realize that you are in a sort of cave with a linear path forward, with only the dimmest of lights at the end." & dialog --msgbox  "As the darkness dissapates and the voices fade away, you start to realize that you are in a sort of cave with a linear path forward, with only the dimmest of lights at the end." 100 50

flite -voice rms "With an audible rise in pitch, you hear one last voice begin to speak. The voice says:" & dialog --msgbox "With an audible rise in pitch, you hear one last voice begin to speak. The voice says:" 100 50

flite -voice awb "Welcome to Lament, the Cave of Despair. Here, you will be forced to face your deepest nightmares and innermost fears as you progress. You will surely be trying to find your way out, but you will have no chance unless you are able to confront and defeat the Seven Demons." & dialog --msgbox "'Welcome to Lament, the Cave of Despair. Here, you will be forced to face your deepest nightmares and innermost fears as you progress. You will surely be trying to find your way out, but you will have no chance unless you are able to confront and defeat the Seven Demons.'" 100 50

flite -voice awb "This is not a place for the faint of heart, and you will surely wish yourself dead. However, here, there is one trick. You cannot die." & dialog --msgbox "'This is not a place for the faint of heart, and you will surely wish yourself dead. However, here, there is one trick. You cannot die.'" 100 50

flite -voice awb "There are Seven Demons you must face on your journey. They are the Demons of Lust, Gluttony, Greed, Sloth, Wrath, Envy, and Pride. To progress on your journey, you must face each one and will be presented with a choice - will you make the right one? You will have to decide for yourself, $CHARNAME!" & dialog --msgbox "'There are Seven Demons you must face on your journey. They are the Demons of Lust, Gluttony, Greed, Sloth, Wrath, Envy, and Pride. To progress on your journey, you must face each one and will be presented with a choice - will you make the right one? You will have to decide for yourself, $CHARNAME!'" 100 50

flite -voice rms "Finally, the voice fades away, leaving a cacophony of emotions in its wake. You don't know how you feel about the information you have just been presented. Do you attempt to continue on your journey, or do you try to figure out another plan of action?" & dialog --msgbox "Finally, the voice fades away, leaving a cacophony of emotions in its wake. You don't know how you feel about the information you have just been presented. Do you attempt to continue on your journey, or do you try to figure out another plan of action?" 100 50

# make an if-then condition to progress to the next scene

flite -voice rms "You could either continue on your path, or you could try to investigate the odd mirror to attempt to escape. What would you like to do? Press enter to continue." & dialog --msgbox "You could either continue on your path, or you could try to investigate the odd mirror to attempt to escape. What would you like to do? Press ENTER to continue." 100 50

read -p "What would you like to do? Please choose CONTINUE or ESCAPE: " CONTESCAPE

	if [[ $CONTESCAPE = "CONTINUE" ]];
		then flite -voice rms "With a deep breath and a fast-beating heart, you decide that your best course of action will be to press on." & dialog --msgbox "With a deep breath and a fast-beating heart, you decide that your best course of action will be to press on." 100 50
		flite -voice rms "Your footsteps echoing through the narrow corridor as you slowly step towards the dim light in front of you, you wonder what could possibly be in store for you amidst the presence of the so-called Seven Demons." & dialog --msgbox "Your footsteps echoing through the narrow corridor as you slowly step towards the dim light in front of you, you wonder what could possibly be in store for you amidst the presence of the so-called Seven Demons." 100 50
		flite -voice rms "It is too late to turn back now, you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press enter to continue." & dialog --msgbox "'It is too late to turn back now,' you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press ENTER to continue." 100 50
		./fourth-scene.sh	# launch into the Fourth Scene of the game
	else flite -voice rms "You decide that you are not interested in seeing how this event unfolds. You want out. Doubling back to the other side of the cave, you begin walking back to the mirror that seemingly brought you to this desolate world in the first place." & dialog --msgbox "You decide that you are not interested in seeing how this event unfolds. You want out. Doubling back to the other side of the cave, you begin walking back to the mirror that seemingly brought you to this desolate world in the first place." 100 50
	     flite -voice rms "As you approach the glass, you hear the voice begin to pipe up once again. It says:" & dialog --msgbox "As you approach the glass, you hear the voice begin to pipe up once again. It says:" 100 50
	     flite -voice awb "Nice try, $CHARNAME, but there is no escape from this prison. You cannot run from your fears, $CHARNAME. You must face them. What would the rest of the $RACE people think of you? You cannot be this much of a coward. Nice try, however." & dialog --msgbox "'Nice try, $CHARNAME, but there is no escape from this prison. You cannot run from your fears, $CHARNAME. You must face them. What would the rest of the $RACE people think of you? You cannot be this much of a coward. Nice try, however.'" 100 50
	     flite -voice rms "With a howl, the glass in the mirror shatters to pieces, and the voice of the demon fades away once again. You officially have no choice." & dialog --msgbox "With a howl, the glass in the mirror shatters to pieces, and the voice of the demon fades away once again. You officially have no choice." 100 50
	     flite -voice rms "It is too late to turn back now, you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press enter to continue." & dialog --msgbox "'It is too late to turn back now,' you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press ENTER to continue." 100 50 
	     ./fourth-scene.sh		# launch into the Fourth Scene of the game
	fi 
exit

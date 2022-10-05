#!/bin/bash

source variables.txt		# source our textfile for the global variables

# This script is the Third Scene of the game. 
#
# In this scene, the player will begin to become more familiar with their surroundings and the Demons
#
# Global variables are NAME for player name, CHARNAME for character name, RACE for player race, and PLACE for character kingdom. 
#
# let's begin by defining the functions for the game: 
function voice1 {
	flite -voice rms "As the darkness dissapates and the voices fade away, you start to realize that you are in a sort of cave with a linear path forward, with only the dimmest of lights at the end."
}
function menu1 {
	dialog --msgbox  "As the darkness dissapates and the voices fade away, you start to realize that you are in a sort of cave with a linear path forward, with only the dimmest of lights at the end." 0 0
}
function voice2 {
	flite -voice rms "With an audible rise in pitch, you hear one last voice begin to speak. The voice says:"
}
function menu2 {
	dialog --msgbox "With an audible rise in pitch, you hear one last voice begin to speak. The voice says:" 0 0
}
function voice3 {
	flite -voice awb "Welcome to Lament, the Cave of Despair. Here, you will be forced to face your deepest nightmares and innermost fears as you progress. You will surely be trying to find your way out, but you will have no chance unless you are able to confront and defeat the Seven Demons."
}
function menu3 {
	dialog --msgbox "'Welcome to Lament, the Cave of Despair. Here, you will be forced to face your deepest nightmares and innermost fears as you progress. You will surely be trying to find your way out, but you will have no chance unless you are able to confront and defeat the Seven Demons.'" 0 0
}
function voice4 {
	flite -voice awb "This is not a place for the faint of heart, and you will surely wish yourself dead. However, here, there is one trick. You cannot die."
}
function menu4 {
	dialog --msgbox "'This is not a place for the faint of heart, and you will surely wish yourself dead. However, here, there is one trick. You cannot die.'" 0 0
}
function voice5 {
	flite -voice awb "There are Seven Demons you must face on your journey. They are the Demons of Lust, Gluttony, Greed, Sloth, Wrath, Envy, and Pride. To progress on your journey, you must face each one and will be presented with a choice - will you make the right one? You will have to decide for yourself, $CHARNAME!"
}
function menu5 {
	dialog --msgbox "'There are Seven Demons you must face on your journey. They are the Demons of Lust, Gluttony, Greed, Sloth, Wrath, Envy, and Pride. To progress on your journey, you must face each one and will be presented with a choice - will you make the right one? You will have to decide for yourself, $CHARNAME!'" 0 0
}
function voice6 {
	flite -voice rms "Finally, the voice fades away, leaving a cacophony of emotions in its wake. You don't know how you feel about the information you have just been presented. Do you attempt to continue on your journey, or do you try to figure out another plan of action?"
}
function menu6 {
	dialog --msgbox "Finally, the voice fades away, leaving a cacophony of emotions in its wake. You don't know how you feel about the information you have just been presented. Do you attempt to continue on your journey, or do you try to figure out another plan of action?" 0 0
}
# make the functions for the if-then condition
function conditionVocal1 {
	flite -voice rms "You could either continue on your path, or you could try to investigate the odd mirror to attempt to escape. What would you like to do? Press enter to continue."
}
function conditionMenu1 {
	dialog --msgbox "You could either continue on your path, or you could try to investigate the odd mirror to attempt to escape. What would you like to do? Press ENTER to continue." 0 0
}
# 'then' functions
function thenConditionVocal1 {
	flite -voice rms "With a deep breath and a fast-beating heart, you decide that your best course of action will be to press on."
}
function thenConditionMenu1 {
	dialog --msgbox "With a deep breath and a fast-beating heart, you decide that your best course of action will be to press on." 0 0
}
function thenConditionVocal2 {
	flite -voice rms "Your footsteps echoing through the narrow corridor as you slowly step towards the dim light in front of you, you wonder what could possibly be in store for you amidst the presence of the so-called Seven Demons."
}
function thenConditionMenu2 {
	dialog --msgbox "Your footsteps echoing through the narrow corridor as you slowly step towards the dim light in front of you, you wonder what could possibly be in store for you amidst the presence of the so-called Seven Demons." 0 0
}
function thenConditionVocal3 {
	flite -voice rms "It is too late to turn back now, you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press enter to continue."
}
function thenConditionMenu3 {
	dialog --msgbox "'It is too late to turn back now,' you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press ENTER to continue." 0 0
}
# 'else' functions
function elseConditionVocal1 {
	flite -voice rms "You decide that you are not interested in seeing how this event unfolds. You want out. Doubling back to the other side of the cave, you begin walking back to the mirror that seemingly brought you to this desolate world in the first place."
}
function elseConditionMenu1 {
	dialog --msgbox "You decide that you are not interested in seeing how this event unfolds. You want out. Doubling back to the other side of the cave, you begin walking back to the mirror that seemingly brought you to this desolate world in the first place." 0 0
}
function elseConditionVocal2 {
	flite -voice rms "As you approach the glass, you hear the voice begin to pipe up once again. It says:"
}
function elseConditionMenu2 {
	dialog --msgbox "As you approach the glass, you hear the voice begin to pipe up once again. It says:" 0 0
}
function elseConditionVocal3 {
	flite -voice awb "Nice try, $CHARNAME, but there is no escape from this prison. You cannot run from your fears, $CHARNAME. You must face them. What would the rest of the $RACE people think of you? You cannot be this much of a coward. Nice try, however."
}
function elseConditionMenu3 {
	dialog --msgbox "'Nice try, $CHARNAME, but there is no escape from this prison. You cannot run from your fears, $CHARNAME. You must face them. What would the rest of the $RACE people think of you? You cannot be this much of a coward. Nice try, however.'" 0 0
}
function elseConditionVocal4 {
	flite -voice rms "With a howl, the glass in the mirror shatters to pieces, and the voice of the demon fades away once again. You officially have no choice."
}
function elseConditionMenu4 { 
	dialog --msgbox "With a howl, the glass in the mirror shatters to pieces, and the voice of the demon fades away once again. You officially have no choice." 0 0
}
function closingVocal {
	flite -voice rms "It is too late to turn back now, you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press enter to continue."
}
function closingMenu {
	dialog --msgbox "'It is too late to turn back now,' you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway. Press ENTER to continue." 0 0
}
# soundtrack-related functions
function executeThirdTrack {
	mpg123 -q soundtrack/haunted.mp3		# test the audio
}
function muteTrack {
	killall mpg123							# kill any running instance of mpg123
}
###########################################################
# run the script										  #
###########################################################
# Begin the Scene: 
executeThirdTrack & voice1 & menu1
voice2 & menu2
voice3 & menu3
voice4 & menu4
voice5 & menu5
voice6 & menu6
# prepare to ask for input from the user
conditionVocal1 & conditionMenu1
# take the user's input
read -p "What would you like to do? Please choose CONTINUE or ESCAPE: " CONTESCAPE
# make an if-then condition to progress to the next scene
	if [[ $CONTESCAPE = "CONTINUE" ]];
		then thenConditionVocal1 & thenConditionMenu1
		thenConditionVocal2 & thenConditionMenu2
		thenConditionVocal3 & thenConditionMenu3
		muteTrack && ./fourth-scene.sh		# kill the music and launch into the Fourth Scene of the game
	else elseConditionVocal1 & elseConditionMenu1
	     elseConditionVocal2 & elseConditionMenu2
	     elseConditionVocal3 & elseconditionMenu3
	     elseConditionVocal4 & elseConditionMenu4
	     closingVocal & closingMenu
	     muteTrack && ./fourth-scene.sh		# kill the music and launch into the Fourth Scene of the game
	fi 
exit

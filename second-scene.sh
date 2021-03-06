#!/bin/bash

source variables.txt	#link the variables.txt file we made earlier

# this is the Second Scene of the Dark Nights Rising game.
# In this scene, we will begin building up the plot of the game. 
# the player will meet the Demons in this Scene. 
# the Demons are meant to be euphemisms for the inner demons we all face every day. 
# we can have some fun with this concept. let me know in the github repo if you come up with something cool that would fit this concept. 

# as a reminder, the global variables for the game are: 
# NAME for the player name. CHARNAME for the character name. RACE for the character race. PLACE for the characters home kingdom.
# these values can be found anytime in the variables.txt file we generated in the Intro Scene.
#############################################################
# let's define the functions for this Scene
#############################################################
function voice1 {
	flite -voice rms "After a strong sensation of being lifted into the air, and a general feeling of being dazed, and confused, you wonder if the whole experience was real or not."
}
function menu1 {
	dialog --msgbox "After a strong sensation of being lifted into the air, and a general feeling of being dazed, and confused, you wonder if the whole experience was real or not." 0 0
}
function voice2 {
	flite -voice rms "Suddenly, with no warning at all, you hear the sound of laughter and a shrill collection of voices calling out to you, as if they know exactly who you are."
}
function menu2 {
	dialog --msgbox "Suddenly, with no warning at all, you hear the sound of laughter and a shrill collection of voices calling out to you, as if they know exactly who you are." 0 0
}
function voice3 {
	flite -voice rms "The voices spoke the following:"
}
function menu3 {
 	dialog --msgbox "The voices spoke the following:" 0 0
}
function voice4 {
	flite -voice kal "Hello, $CHARNAME. We have always known you, we have always followed you. We know your every thought, we know every single move you make. You cannot hide anything from us, and you can have no secrets." & flite -voice slt  "Hello, $CHARNAME. We have always known you, we have always followed you. We know your every thought, we know every single move you make. You cannot hide anything from us, and you can have no secrets."
}
function menu4 {
	dialog --msgbox "Hello, $CHARNAME. We have always known you, we have always followed you. We know your every thought, we know every single move you make. You cannot hide anything from us, and you can have no secrets." 0 0 
}
function voice5 {
	flite -voice kal "Now, $CHARNAME of the $RACE race, from the land of $PLACE, don't try to hide your true character. Allow yourself to be assimilated by your deepest desires. We can help you feel like you have a purpose again." & flite -voice slt   "Now, $CHARNAME of the $RACE race, from the land of $PLACE, do not try to hide your true character. Allow yourself to be assimilated by your deepest desires. We can help you feel like you have a purpose again."	
}
function menu5 {
	dialog --msgbox "Now, $CHARNAME of the $RACE race, from the land of $PLACE, do not try to hide your true character. Allow yourself to be assimilated by your deepest desires. We can help you feel like you have a purpose again." 0 0
}
function voice6 {
	flite -voice rms "You do not know what to do. You are conflicted. Are these demons telling you the truth? Or are they conspiring against you in order to take control of your mind?"
}
function menu6 {
	dialog --msgbox "You do not know what to do. You are conflicted. Are these demons telling you the truth? Or are they conspiring against you in order to take control of your mind?" 0 0
}
function vocalPrompt {
	flite -voice rms "Think carefully, because you only get one chance here. What would you like to say to the demons? Do you choose to resist, or assimilate? Press Enter to continue."	
}
function menuPrompt {
	dialog --msgbox "Think carefully, because you only get one chance here. What would you like to say to the demons? Do you choose to RESIST, or ASSIMILATE? Press ENTER to continue." 0 0
}
# make the conditional functions
function statementVoice1 {
	flite -voice rms "I refuse, you say calmly to the demons. I will not assimilate with you. I refuse to give you any control over my brain."
}
function statementMenu1 {
	dialog --msgbox "'I refuse.' You say calmy to the Demons. 'I will not assimilate with you. I refuse to give you any control over my brain.'" 0 0
}
function statementVoice2 {
	flite -voice rms "The demons are not happy about your decision. They shout a shrill, hellish scream, bringing the very feeling of dread itself into your soul."
}
function statementMenu2 {
	dialog --msgbox "The Demons are not happy about your decision. They shout a shrill, hellish scream, bringing the very feeling of dread itself into your soul." 0 0 
}
function statementVoice3 {
	flite -voice rms "Next, the demons have this to say."
}
function statementMenu3 {
	dialog --msgbox "Next, the Demons have this to say:" 0 0
}
function vocalCollective {
	flite -voice kal "How dare you defy us! You will pay for this with the ultimate retribution. We already have control over your mind, don't you see? We exist within you, a part of your very being!" & flite -voice slt  "How dare you defy us! You will pay for this with the ultimate retribution. We already have control over your mind, don't you see? We exist within you, a part of your very being!"
}
function menuCollective {
	dialog --msgbox "'How dare you defy us! You will pay for this with the ultimate retribution. We already have control over your mind, don't you see? We exist within you, a part of your very being!'" 0 0
}
function collective2 {
	flite -voice kal "You will roam the dark halls of your disturbed mind for years, and you will never find a true escape. We will torment you in a prison of your own creation until the day you die." & flite -voice slt "You will roam the dark halls of your disturbed mind for years, and you will never find a true escape. We will torment you in a prison of your own creation until the day you die." 
}
function collective2Menu {
	dialog --msgbox "'You will roam the dark halls of your disturbed mind for years, and you will never find a true escape. We will torment you in a prison of your own creation until the day you die.'" 0 0
}
function statementVoice4 {
	flite -voice rms "You breathe a sigh of relief. The demons have vanished, for now. Knowing they will be back, you take a deep sigh, and press on through the dark corridor in front of you, feeling as though you are being watched the whole time."
}
function statementMenu4 {
	dialog --msgbox "You breathe a sigh of relief. The demons have vanished, for now. Knowing they will be back, you take a deep sigh, and press on through the dark corridor in front of you, feeling as though you are being watched the whole time." 0 0
}
function statementVoice5 {
	flite -voice rms "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press enter to continue."
}
function statementMenu5 {
	dialog --msgbox "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press ENTER to continue." 0 0 
}
# define some of the "else" functions
function elseVocal1 {
	flite -voice rms "I will join you, you say to the demons. I have been facing this mental lapse for far too long. I am ready for some kind of reprieve. The demons laugh, staring at you with intent. They then scream in yet another shrill scream:"
}
function elseMenus1 {
	dialog --msgbox "'I will join you,' you say to the demons. 'I have been facing this mental lapse for far too long. I am ready for some kind of reprieve.' The demons laugh, staring at you with intent. They then shout in yet another shrill scream:" 0 0
}
function collective3 {
	flite -voice kal "You really thought it would be that easy? We owe you a lifetime of darkness and retribution for the sins you have committed in your life. This is your own mental prison that you have constructed for yourself, and we are the gatekeepers." & flite -voice slt  "You really thought it would be that easy? We owe you a lifetime of darkness and retribution for the sins you have committed in your life. This is your own mental prison that you have constructed for yourself, and we are the gatekeepers."
}
function collective3menu {
	dialog --msgbox "'You really thought it would be that easy? We owe you a lifetime of darkness and retribution for the sins you have committed in your life. This is your own mental prison that you have constructed for yourself, and we are the gatekeepers.'" 0 0
}
function collective4 {
	flite -voice kal "Just wait. We are going to force you to traverse the hallways of your disturbed mind, and allow you to see exactly the circumstances of the sins you have committed throughout the years." & flite -voice slt  "Just wait. We are going to force you to traverse the hallways of your disturbed mind, and allow you to see exactly the circumstances of the sins you have committed throughout the years."
}
function collective4menu {
	dialog --msgbox "'Just wait. We are going to force you to traverse the hallways of your disturbed mind, and allow you to see exactly the circumstances of the sins you have committed throughout the years.'" 0 0
}
function voice7 {
	flite -voice kal "We will be back. Your day of reckoning is upon you, $CHARNAME." & flite -voice slt "We will be back. Your day of reckoning is upon you, $CHARNAME."
}
function menu7 {
	dialog --msgbox "'We will be back. Your day of reckoning is upon you, $CHARNAME!'" 0 0
}
function voice8 {
	flite -voice rms "You take a deep breath as the Demons finally stop shouting, and vanish into thin air. With a fast beating heart and no idea what to expect next, you know it is time to press on."
}
function menu8 {
	dialog --msgbox "You take a deep breath as the Demons finally stop shouting, and vanish into thin air. With a fast beating heart and no idea what to expect next, you know it is time to press on." 0 0
}
function closingVoice {
	flite -voice rms "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press enter to continue."
}
function closingMenu {
	dialog --msgbox "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press ENTER to continue." 0 0
}
# soundtrack-related functions
function executeSecondTrack {
	mpg123 -q soundtrack/time_space.mp3		# test the soundtrack 
}
function muteTrack {
	killall mpg123
}
#################################################
#run the script									#
#################################################
# let's begin the second scene of the game
executeSecondTrack & voice1 & menu1
voice2 & menu2 
voice3 & menu3
voice4 & menu4
voice5 & menu5
voice6 & menu6
vocalPrompt & menuPrompt
#take the user's input, then make an if-then condition depending on the decision they made
read -p "What would you like to do with the Demons? Please type RESIST or ASSIMILATE: " CHOICE1

	if [[ $CHOICE1 = "RESIST" ]];
		then statementVoice1 & statementMenu1
		statementVoice2 & statementMenu2
		statementVoice3 & statementMenu3
		vocalCollective & menuCollective
		collective2 & collective2Menu
		statementVoice4 & statementMenu4
		statementVoice5 & statementMenu5
		muteTrack && ./third-scene.sh	# kill the music and launch into the Third Scene of the game
	else elseVocal1 & elseMenus1
		collective3 & collective3menu
		collective4 & collective4menu
		voice7 & menu7
		voice8 & menu8
		closingVoice & closingMenu
		muteTrack && ./third-scene.sh	# kill the music and launch into the Third Scene of the game
	fi	#end the if-then condition, exit the script
exit

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

# let's begin the second scene of the game

flite -voice rms "After a strong sensation of being lifted into the air, and a general feeling of being dazed, and confused, you wonder if the whole experience was real or not." & dialog --msgbox  "After a strong sensation of being lifted into the air, and a general feeling of being dazed, and confused, you wonder if the whole experience was real or not." 100 50

flite -voice rms "Suddenly, with no warning at all, you hear the sound of laughter and a shrill collection of voices calling out to you, as if they know exactly who you are." & dialog --msgbox  "Suddenly, with no warning at all, you hear the sound of laughter and a shrill collection of voices calling out to you, as if they know exactly who you are." 100 50

flite -voice rms "The voices spoke the following:" & dialog --msgbox "The voices spoke the following:" 100 50

flite -voice kal "Hello, $CHARNAME. We have always known you, we have always followed you. We know your every thought, we know every single move you make. You cannot hide anything from us, and you can have no secrets." & flite -voice slt  "Hello, $CHARNAME. We have always known you, we have always followed you. We know your every thought, we know every single move you make. You cannot hide anything from us, and you can have no secrets." & dialog --msgbox  "Hello, $CHARNAME. We have always known you, we have always followed you. We know your every thought, we know every single move you make. You cannot hide anything from us, and you can have no secrets." 100 50

flite -voice kal "Now, $CHARNAME of the $RACE race, from the land of $PLACE, don't try to hide your true character. Allow yourself to be assimilated by your deepest desires. We can help you feel like you have a purpose again." & flite -voice slt   "Now, $CHARNAME of $RACE, from the land of $PLACE, do not try to hide your true character. Allow yourself to be assimilated by your deepest desires. We can help you feel like you have a purpose again." & dialog --msgbox  "Now, $CHARNAME of $RACE, from the land of $PLACE, do not try to hide your true character. Allow yourself to be assimilated by your deepest desires. We can help you feel like you have a purpose again." 100 50

flite -voice rms "You do not know what to do. You are conflicted. Are these demons telling you the truth? Or are they conspiring against you in order to take control of your mind?" & dialog --msgbox   "You do not know what to do. You are conflicted. Are these demons telling you the truth? Or are they conspiring against you in order to take control of your mind?" 100 50

flite -voice rms "Think carefully, because you only get one chance here. What would you like to say to the demons? Do you choose to resist, or assimilate? Press Enter to continue." & dialog --msgbox "Think carefully, because you only get one chance here. What would you like to say to the demons? Do you choose to RESIST, or ASSIMILATE? Press ENTER to continue." 100 50

#take the user's input, then make an if-then condition depending on the decision they made
read -p "What would you like to do with the Demons? Please type RESIST or ASSIMILATE: " CHOICE1

	if [[ $CHOICE1 = "RESIST" ]];
		then flite -voice rms "I refuse, you say calmly to the demons. I will not assimilate with you. I refuse to give you any control over my brain." & dialog --msgbox "'I refuse.' You say calmy to the Demons. 'I will not assimilate with you. I refuse to give you any control over my brain.'" 100 50
		flite -voice rms "The demons are not happy about your decision. They shout a shrill, hellish scream, bringing the very feeling of dread itself into your soul." & dialog --msgbox   "The Demons are not happy about your decision. They shout a shrill, hellish scream, bringing the very feeling of dread itself into your soul." 100 50 
		flite -voice rms "Next, the demons have this to say." & dialog --msgbox "Next, the Demons have this to say:" 100 50
		flite -voice kal "How dare you defy us! You will pay for this with the ultimate retribution. We already have control over your mind, don't you see? We exist within you, a part of your very being!" & flite -voice slt  "How dare you defy us! You will pay for this with the ultimate retribution. We already have control over your mind, don't you see? We exist within you, a part of your very being!" & dialog --msgbox  "'How dare you defy us! You will pay for this with the ultimate retribution. We already have control over your mind, don't you see? We exist within you, a part of your very being!'" 100 50
		flite -voice kal "You will roam the dark halls of your disturbed mind for years, and you will never find a true escape. We will torment you in a prison of your own creation until the day you die." & flite -voice slt "You will roam the dark halls of your disturbed mind for years, and you will never find a true escape. We will torment you in a prison of your own creation until the day you die." & dialog --msgbox  "'You will roam the dark halls of your disturbed mind for years, and you will never find a true escape. We will torment you in a prison of your own creation until the day you die.'" 100 50
		flite -voice rms "You breathe a sigh of relief. The demons have vanished, for now. Knowing they will be back, you take a deep sigh, and press on through the dark corridor in front of you, feeling as though you are being watched the whole time." & dialog --msgbox  "You breathe a sigh of relief. The demons have vanished, for now. Knowing they will be back, you take a deep sigh, and press on through the dark corridor in front of you, feeling as though you are being watched the whole time." 100 50
		flite -voice rms "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press enter to continue." & dialog --msgbox "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press ENTER to continue." 100 50 
		./third-scene.sh	# launch into the Third Scene of the game
	else flite -voice rms "I will join you, you say to the demons. I have been facing this mental lapse for far too long. I am ready for some kind of reprieve. The demons laugh, staring at you with intent. They then scream in yet another shrill scream:" & dialog --msgbox  "'I will join you,' you say to the demons. 'I have been facing this mental lapse for far too long. I am ready for some kind of reprieve.' The demons laugh, staring at you with intent. They then shout in yet another shrill scream:" 100 50
	flite -voice kal "You really thought it would be that easy? We owe you a lifetime of darkness and retribution for the sins you have committed in your life. This is your own mental prison that you have constructed for yourself, and we are the gatekeepers." & flite -voice slt  "You really thought it would be that easy? We owe you a lifetime of darkness and retribution for the sins you have committed in your life. This is your own mental prison that you have constructed for yourself, and we are the gatekeepers." & dialog --msgbox  "'You really thought it would be that easy? We owe you a lifetime of darkness and retribution for the sins you have committed in your life. This is your own mental prison that you have constructed for yourself, and we are the gatekeepers.'" 100 50
	flite -voice kal "Just wait. We are going to force you to traverse the hallways of your disturbed mind, and allow you to see exactly the circumstances of the sins you have committed throughout the years." & flite -voice slt  "Just wait. We are going to force you to traverse the hallways of your disturbed mind, and allow you to see exactly the circumstances of the sins you have committed throughout the years." & dialog --msgbox  "'Just wait. We are going to force you to traverse the hallways of your disturbed mind, and allow you to see exactly the circumstances of the sins you have committed throughout the years.'" 100 50
	flite -voice kal "We will be back. Your day of reckoning is upon you, $CHARNAME." & flite -voice slt "We will be back. Your day of reckoning is upon you, $CHARNAME." & dialog --msgbox "'We will be back. Your day of reckoning is upon you, $CHARNAME!'" 100 50
	flite -voice rms "You take a deep breath as the Demons finally stop shouting, and vanish into thin air. With a fast beating heart and no idea what to expect next, you know it is time to press on." & dialog --msgbox  "You take a deep breath as the Demons finally stop shouting, and vanish into thin air. With a fast beating heart and no idea what to expect next, you know it is time to press on." 100 50
	flite -voice rms  "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press enter to continue." & dialog --msgbox  "It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again? Press ENTER to continue." 100 50
	./third-scene.sh	# launch into the Third Scene of the game
	fi	#end the if-then condition, exit the script
exit

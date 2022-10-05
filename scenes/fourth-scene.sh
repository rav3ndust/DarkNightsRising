#!/bin/bash

source variables.txt            # source our textfile for the global variables

# This script is the Fourth Scene of the game. 
#
# In this scene, the player will meet the First Demon, the Demon of Lust. 
#
# Remember, global variables are NAME for player name, CHARNAME for character name, RACE for player race, and PLACE for character kingdom. 
#############################################
# define the functions
function voice1 {
    flite -voice rms "After reaching the end of the overwhelmingly long hallway, you feel as if you are freezing cold. As you look around you, you notice ice on the walls and clouds forming from your breath."
}
function menu1 {
    dialog --msgbox "After reaching the end of the overwhelmingly long hallway, you feel as if you are freezing cold. As you look around you, you notice ice on the walls and clouds forming from your breath." 0 0
}
function voice2 {
    flite -voice rms "As you approach the farthest wall, you notice a locked door. There appear to be words inscribed on the wall above it."
}
function menu2 {
    dialog --msgbox "As you approach the farthest wall, you notice a locked door. There appear to be words inscribed on the wall above it." 0 0 
}
function voice3 {
    flite -voice rms "As you lean closer to read the words, you can see that it says the following."
}
function menu3 {
    dialog --msgbox "As you lean closer to read the words, you can see that it says the following:" 0 0
}
function voice4 {
    flite -voice rms "Welcome to the Hall of the Demon of Lust."
}
function menu4 {
    dialog --msgbox "WELCOME TO THE HALL OF THE DEMON OF LUST" 0 0
}
function voice5 {
    flite -voice rms "You notice that the sign is aged and cracking. Suddenly the atmosphere in the hall changes. You feel as though you are being watched, and then you see a figure materialize in front of you."
}
function menu5 {
    dialog --msgbox "You notice that the sign is aged and cracking. Suddenly the atmosphere in the hall changes. You feel as though you are being watched, and then you see a figure materialize in front of you." 0 0
}
function voice6 {
    flite -voice rms "Taking on the shape of a tall, human-like figure, you hear the following echo throughout this frozen hall."
}
function menu6 {
    dialog --msgbox "Taking on the shape of a tall, human-like figure, you hear the following echo throughout this frozen hall." 0 0
}
# switch to the demon voice
function voice7 { 
    flite -voice kal "Hello, $NAME. I was told you would be coming, and I have been waiting for your arrival. I can look into your eyes and know every sin you have ever committed, and I can see that you are one who has experienced the sin of Lust before. You have lived your live in $PLACE as a sinful, lustful creature, and this is a sin that cannot go unpunished."
}
function menu7 {
    dialog --msgbox "'Hello, $NAME. I was told you would be coming, and I have been waiting for your arrival. I can look into your eyes and know every sin you have ever committed, and I can see that you are one who has experienced the sin of Lust before. You have lived your live in $PLACE as a sinful, lustful creature, and this is a sin that cannot go unpunished.'" 0 0
}
function voice8 {
    flite -voice kal "So, $NAME, you should know that I have a particularly interesting way of punishing sinful souls such as yourself. Instead of passing you onto the next member of my family, I am going to trap your soul here in the Ice Caverns for eternity! I hope you have said your prayers."
}
function menu8 {
    dialog --msgbox "'So, $NAME, you should know that I have a particularly interesting way of punishing sinful souls such as yourself. Instead of passing you onto the next member of my family, I am going to trap your soul here in the Ice Caverns for eternity! I hope you have said your prayers.'" 0 0 
}
function voice9 {
    flite -voice rms "Looking around frantically, you wonder what you are going to do to fight. Are you even going to fight? Taking note of your surroundings, you see what appears to be a sharp stalagmite poking from the floor of the ice cavern. You also take note of a series of sharp, icy stalactites hanging from the cavern's ceiling. Ideas form in your mind, but you only have seconds to act, if you plan to act at all."
}
function menu9 {
    dialog --msgbox "Looking around frantically, you wonder what you are going to do to fight. Are you even going to fight? Taking note of your surroundings, you see what appears to be a sharp stalagmite poking from the floor of the ice cavern. You also take note of a series of sharp, icy stalactites hanging from the cavern's ceiling. Ideas form in your mind, but you only have seconds to act, if you plan to act at all." 0 0
}
# prepare the functions for the lead-up to the if-then condition
function decisionVocal {
    flite -voice rms "The Demon of Lust begins to charge up what appears to be an energy blast, preparing to fire it right at you. What do you do? Do you fight with the possible weapons at your disposal, or do you resign yourself to your fate? Press enter to continue."
}
function decisionMenu {
    dialog --msgbox "The Demon of Lust begins to charge up what appears to be an energy blast, preparing to fire it right at you. What do you do? Do you fight with the possible weapons at your disposal, or do you resign yourself to your fate? Press ENTER to continue." 0 0 
}
# then conditional functions
function thenConditionVocal1 { 
    flite -voice rms "You quickly dodge out of the way, right as the Demon of Lust fires the energetic blast right at you. As the energy goes right past you, you quickly kick the stalagmite with all of your might, forcing it out of the ground and into your hands. You then direct your attention to the ceiling, taking aim at the stalactites hanging directly above the Demon of Lust."
}
function thenConditionMenu1 {
    dialog --msgbox "You quickly dodge out of the way, right as the Demon of Lust fires the energetic blast right at you. As the energy goes right past you, you quickly kick the stalagmite with all of your might, forcing it out of the ground and into your hands. You then direct your attention to the ceiling, taking aim at the stalactites hanging directly above the Demon of Lust." 0 0 
}
function thenConditionVocal2 {
    flite -voice rms "The Demon sees what you are doing before you make your final swing. You hear a shriek as you plunge your newfound weapon into the stalactites, sending all of them plunging into the Demon of Lust, forcing him to the icy ground. As he lies on the ground, you hear his dying words."
}
function thenConditionMenu2 {
    dialog --msgbox "The Demon sees what you are doing before you make your final swing. You hear a shriek as you plunge your newfound weapon into the stalactites, sending all of them plunging into the Demon of Lust, forcing him to the icy ground. As he lies on the ground, you hear his dying words." 0 0 
}
function demonWordsVocal {
    flite -voice kal "So, you were able to dodge my attack. I misinterpreted your resolve, $CHARNAME. In fact, with determination like this, it is possible that you might be able to overcome your sins once and for all. Show this kind of courage as you face my brethren, and you might have a chance at escaping. Until next time, goodbye, $CHARNAME of $PLACE."
}
function demonWordsMenu {
    dialog --msgbox "So, you were able to dodge my attack. I misinterpreted your resolve, $CHARNAME. In fact, with determination like this, it is possible that you might be able to overcome your sins once and for all. Show this kind of courage as you face my brethren, and you might have a chance at escaping. Until next time, goodbye, $CHARNAME of $PLACE." 0 0
}
function nextSceneVocal {
    flite -voice rms "With a sigh of relief, you sit down. You know you have only defeated one of these demons, and there are still six more to go. Knowing you still have quite a ways to go, you prepare to move onto whatever lies behind the next door."
}
function nextSceneMenu {
    dialog --msgbox "With a sigh of relief, you sit down. You know you have only defeated one of these demons, and there are still six more to go. Knowing you still have quite a ways to go, you prepare to move onto whatever lies behind the next door." 0 0 
}
# 'else' conditional functions
function elseVocal1 {
    flite -voice rms "You resign yourself to your fate, and let the Demon know that you are aware your time has come. He looks at you right in the eyes, with one last thing to say."
}
function elseMenu1 {
    dialog --msgbox "You resign yourself to your fate, and let the Demon know that you are aware your time has come. He looks at you right in the eyes, with one last thing to say:" 0 0 
}
function elseVocal2 {
    flite -voice kal "I knew you were not the kind to have any fight in you, $CHARNAME. Accept your punishment, and die!"
}
function elseMenu2 {
    dialog --msgbox "'I knew you were not the kind to have any fight in you, $CHARNAME. Accept your punishment, and die!'" 0 0
}
function elseVocal3 {
    flite -voice rms "The last thing you see is a charged ball of energy speeding toward you, before the world goes black."
}
function elseMenu3 {
    dialog --msgbox "The last thing you see is a charged ball of energy speeding toward you, before the world goes black." 0 0 
}
# soundtrack-related functions
function executeFourthTrack {
    mpg123 -q soundtrack/a_quiet_place.mp3      # the Fourth Scene's song
}
function muteTrack {
    killall mpg123                              # used to kill any running instance of mpg123
}
#############################################
# run the script                            #
#############################################
# Begin the Scene: 
voice1 & menu1
voice2 & menu2
voice3 & menu3
voice4 & menu4
voice5 & menu5 
voice6 & menu6
voice7 & menu7
voice8 & menu8  
voice9 & menu9 
# go into the lead-up to the if-then condition
decisionVocal & decisionMenu 
# present the user with the choice, and then take their input
read -p "What would you like to do? Please type FIGHT or RESIGN: " FIGHTRESIGN
# start the if-then condition
    if [[ $FIGHTRESIGN = "FIGHT" ]];
        then thenConditionVocal1 & thenConditionMenu1
        thenConditionVocal2 & thenConditionMenu2
        demonWordsVocal & demonWordsMenu
        nextSceneVocal & nextSceneMenu
        muteTrack & ./fifth-scene.sh    # kill the music and launch into the Fifth Scene of the game
    else elseVocal1 & elseMenu1
        elseVocal2 & elseMenu2 
        elseVocal3 & elseMenu3 
        muteTrack & clear && ./deathScript.sh          # launch into the game's 'Death Scene'
    fi
exit

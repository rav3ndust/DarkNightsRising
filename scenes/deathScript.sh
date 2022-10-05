#!/bin/bash
source variables.txt        #source our textfile with all of our variables
# this is the 'Death Scene' of DarkNightsRising. 
#
# this Scene will be played when the player makes certain decisions in the game that might end up
# killing their character. 
#
# we will aim to keep this simple, making the script explain to the player that they died and give
# them the option to restart the game or quit. 
#
###########################################################
# define functions
function voice1 {
    flite -voice rms "They say if you die in a dream, you die in real life. This turned out to be true for $CHARNAME, who, after being killed by a Demon in the horrific state they had fallen into, slipped away from this life."
}
function menu1 {
    dialog --msgbox "They say if you die in a dream, you die in real life. This turned out to be true for $CHARNAME, who, after being killed by a Demon in the horrific state they had fallen into, slipped away from this life." 0 0 
}
function voice2 {
    flite -voice rms "No one ever forgot $CHARNAME of $PLACE. The $RACE people always remembered them as someone who met their untimely end far too soon."
}
function menu2 {
    dialog --msgbox "No one ever forgot $CHARNAME of $PLACE. The $RACE people always remembered them as someone who met their untimely end far too soon." 0 0 
}
function choiceVoice1 {
    flite -voice rms "It might be too late for $CHARNAME, but it isn't too late for you, $NAME! Would you like to restart Dark Nights Rising, or would you like to quit for now? Quitting the game will clear your data."
}
function choiceMenu1 {
    dialog --msgbox "It might be too late for $CHARNAME, but it isn't too late for you, $NAME! Would you like to restart Dark Nights Rising, or would you like to quit for now? Quitting the game will clear your data." 0 0 
}
# 'then' conditional functions
function thenVoice1 {
    flite -voice rms "Restarting the game. Good luck!"
}
function thenMenu1 {
    dialog --msgbox "Restarting the game. Good luck!" 0 0 
}
# 'else' conditional functions
function elseVoice1 {
    flite -voice rms "Great, thanks for playing, $NAME! Your data will be cleared."
}
function elseMenu1 {
    dialog --msgbox "Great, thanks for playing, $NAME! Your data will be cleared." 0 0
}
# soundtrack-related functions
function executeDeathSceneTrack {
    mpg123 -q soundtrack/deaths_door.mp3        # play the song for the Death Scene
}
function muteTrack {
    killall mpg123                              # kills any running instance of mpg123
}
############################################################
# run the script                                           #
############################################################
executeDeathSceneTrack & voice1 & menu1
voice2 & menu2
choiceVoice1 & choiceMenu1
# present the user with the choice
read -p "What would you like to do? Please type RESTART or QUIT." RESPAWN
# start the if-then condition
    if [[ $RESPAWN = "RESTART" ]];
        then thenVoice1 & thenMenu1
        muteTrack & clear && ./first-scene.sh          # kill music, clear the screen, restart the game with current settings.
    else elseVoice1 & elseMenu1
    rm -r variables.txt                                 # delete the variables file from this playthrough
    muteTrack & clear && exit                           # kill music, clear the screen, and exit the script
    fi
exit

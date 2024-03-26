#!/bin/bash
# Dark Nights Rising - Intro Scene
############################################333
set -e pipefail
source library/libdnr.sh
declare -i SAVE_STATE_TAG=0
readonly storyfile="stories/intro.txt"
soundtrack_audio="soundtrack/haunted.mp3"
title_text="$(cat << EOF
##################################################
#                                                #
#              DARK NIGHTS RISING                #
#                                                #
EOF
)"
# initial line variables for this scene
line1="Hello. Welcome to Dark Nights Rising. This is a game about finding yourself, but keep in mind that the journey is not about the destination, but the path it takes to get there."
line2="I am Raven, your guide through this game. Please tell me a little about yourself."
line3="So, wanderer. What is your name? Please enter it to continue."
# we have to split the other lines below, to make them available for variable declaration provided by the player
# - - - - - - - - - - - - - - - - - -
# functions
small_loader_progression () {
	local chars=" * - - - * * - - - * * - - - * * - - - * * - - - * "
	printchars () {
		printf '%s\n' "${chars}"
	}
	printchars; sleep 2; printchars; sleep 2; printchars; sleep 2
}
main () {
	clear
	execute_track $soundtrack_audio
	printf '%s\n' "${title_text}"; sleep 3; small_loader_progression
	echo "${line1}" & say rms "${line1}"; sleep 1
	echo "${line2}" & say rms "${line2}"; sleep 1
	echo "${line3}" & say rms "${line3}"; read -p "Please enter your name: " NAME
	line4="It is nice to meet you, $NAME. Now let us learn a little more about you."
	line5="So, tell me, $NAME, what would you like to call your character? Please enter it to continue."
	# - - - - - - - - - - - - - - - - - - 2
	echo "${line4}" & say rms "${line4}"; sleep 1
	echo "${line5}" & say rms "${line5}"; read -p "Please enter your character's name: " CHARNAME
	line6="Excellent. What race will $CHARNAME hail from? Be creative. Please enter it to continue."
	echo "${line6}" & say rms "${line6}"; read -p "Please enter desired character race: " RACE
	line7="Cool, so $CHARNAME is from the $RACE race."
	echo "${line7}" & say rms "${line7}"; sleep 1
	line8="Next, let us decide where $CHARNAME hails from. What should their home kingdom be called? Please enter it to continue."
	echo "${line8}" & say rms "${line8}"; read -p "Please enter desired character's home: " PLACE
	line9="So, $NAME. We have decided that your character is named $CHARNAME, is of the $RACE race, and comes from the kingdom of $PLACE."
	echo "${line9}" & say rms "${line9}"; sleep 1
	line10="Are you happy with this character, $NAME? Type 'yes' or 'no' to continue."
	echo "$line10" & say rms "${line10}"; read -p "Are you happy with this configuration? " PLAYERCONFIG_FINALISE
	if [[ $PLAYERCONFIG_FINALISE = "yes" ]]; then
		# save the player config in a file for reference by other files
		local playerconfig="playerconfig.txt"
		touch $playerconfig
		echo "NAME='${NAME}'" >> $playerconfig
		echo "CHARNAME='${CHARNAME}'" >> $playerconfig
		echo "RACE='${RACE}'" >> $playerconfig
		echo "PLACE='${PLACE}'" >> $playerconfig
		kill_audio; bash first_scene.sh 		# launch into the first scene of the game
	else
		local oops="Oh no! Let's start again until you get it the way you want."
		kill_audio
		printf '%s\n' "${oops}" & say rms "${oops}"; sleep 1; bash intro.sh
	fi
}
# - - - entry
main
# NOTE:
#	- this is a new testing version of DNR to clean up its codebase.
#	- we are working to organize the code and keep it as maintainable as possible for our small team working on it.

#!/bin/bash
# Dark Nights Rising - Intro Scene
############################################333
set -e pipefail
declare -i SAVE_STATE_TAG=0
readonly storyfile="stories/intro.txt"
title_text="$(cat << EOF
##################################################
#                                                #
#              DARK NIGHTS RISING                #
#                                                #
EOF
)"
# line variables for this scene
line1="Hello. Welcome to Dark Nights Rising. This is a game about finding yourself, but keep in mind that the journey is not about the destination, but the path it takes to get there."
line2="I am Raven, your guide through this game. Please tell me a little about yourself."
line3="So, wanderer. What is your name? Please enter it to continue."
line4="It is nice to meet you, $NAME. Now let us learn a little more about you."
line5="So, tell me, $NAME, what would you like to call your character? Please enter it to continue."
line6="Excellent. What race will $CHARNAME hail from? Be creative. Please enter it to continue."
line7="Cool, so $CHARNAME is from the $RACE race."
line8="Next, let us decide where $CHARNAME hails from. What should their home kingdom be called? Please enter it to continue."	
line9="So, $NAME. We have decided that your character is named $CHARNAME, is of the $RACE race, and comes from the kingdom of $PLACE."
line10="Are you happy with this character, $NAME? Type 'yes' or 'no' to continue."	
# functions
say () {
	# uses flite to speak to the user
	local line="$1"
	flite -voice rms "$line"
}
execute_track () {
	# starts music
	local track="soundtrack/haunted.mp3"
	mpg123 -q ${track} > /dev/null 2>&1 &
}
kill_audio () {
	# stops the music
	killall mpg123
}
small_loader_progression () {
	local chars=" * - - - * * - - - * * - - - * * - - - * * - - - * "
	printchars () {
			printf '%s\n' "${chars}"
	}
	printchars; sleep 2; printchars; sleep 2; printchars; sleep 2
}
main () {
	clear
	execute_track
	printf '%s\n' "${title_text}"; sleep 3; small_loader_progression
	printf '%s\n' "${line1}" & say "${line1}"; sleep 1
	printf '%s\n' "${line2}" & say "${line2}"; sleep 1
	printf '%s\n' "${line3}" & say "${line3}"; read -p "Please enter your name: " NAME
	printf '%s\n' "${line4}" & say "${line4}"; sleep 1
	printf '%s\n' "${line5}" & say "${line5}"; read -p "Please enter your character's name: " CHARNAME
	printf '%s\n' "${line6}" & say "${line6}"; read -p "Please enter desired character race: " RACE
	printf '%s\n' "${line7}" & say "${line7}"; sleep 1
	printf '%s\n' "${line8}" & say "${line8}"; read -p "Please enter desired character's home: " PLACE
	printf '%s\n' "${line9}" & say "${line9}"; sleep 1
	printf '%s\n' "$line10" & say "${line10}"; read -p "Are you happy with this configuration? " CONFIG_FINAL
	if [[ $CONFIG_FINAL = "yes" ]]; then
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
		printf '%s\n' "${oops}" & say "${oops}"; sleep 1; bash intro.sh
	fi
}
# - - entry
main
# TODO: 
#	- this is a new testing version of DNR to clean up its codebase.
#	- we are working to organize the code and keep it as maintainable as possible for our small team working on it.

#!/usr/bin/env bash
# fifth_scene.sh
set -e
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STATE_TAG=5
readonly storyfile="stories/fifth_scene.txt"
soundtrack_audio=""
title_scene="$(cat << EOF
#############################################
#                                           #
#             CHAPTER 5                     #
#         TEMPERATURE OF ICE                #
#                                           #
EOF
)"
# Fifth Scene of Dark Nights Rising.
# initial line vars
line1="As the Demon of Lust breathes his last breath, you hear a cracking sound behind you. You turn to see that the door in the cavern wall is sliding open."
line2="You feel a warm breeze come through as the door opens wider, a reprieve from the icy cavern. Darkness is all that can be seen beyond. Will you continue on through the door?"
# LINES - "Continue through the door."
x_line1="You approach the now open door and peer into the inky depths beyond. The air is warm and dry, however it is too dark to see beyond the doorway."
x_line2="Taking a deep breath and reminding yourself that there is no going back, you cross the threshold. The door slides closed behind you and you are envoloped in heat and darkness."
# LINES - "Stop and rest."
y_line1="Instead of approaching the door, you lean against the icy side of the cavern wall, shock taking over your body after almost losing your life. You tell yourself that you just need to rest before moving on."
y_line2="You lose track of time as you sit, eyes growing heavy. You can no longer feel the cold seeping into your bones and your body has a thin layer of ice covering it. You hear a chilling laugh as the Demon of Lust rises and approaches you as your vision fades to black."
# functions
save_state () {
	# saves state in playerconfig
	# runs before transitioning to new scenes
	local playerconfig="playerconfig.txt"
	sed -i 's/5/6/g' $playerconfig
}
go_through_door () {
	# option-based function.
	# this function runs when player selects "Continue through the door".
	echo "${x_line1}" & say rms "${x_line1}"; sleep 1
	echo "${x_line2}" & say rms "${x_line2}"; sleep 1
	save_state; kill_audio; bash sixth_scene.sh
}
rest_awhile () {
	# option-based function.
	# this function runs when player selects "Stop and rest."
	echo "${y_line1}" & say rms "${y_line1}"; sleep 1
	echo "${y_line2}" & say rms "${y_line2}"; sleep 1
	kill_audio; bash game_over.sh
}
main () {
	clear
	execute_track $soundtrack_audio
	printf '%s\n' "${title_scene}"; sleep 3; small_loader_progression
	echo "${line1}" & say rms "${line1}"; sleep 1
	echo "${line2}" & say rms "${line2}"; sleep 1
	PS3="What will you do? "
	select opt in "Go through the door." "Stop and rest." "Quit."; do
	   case $opt in
	      "Go through the door.")
	         go_through_door
	         ;;
	      "Stop and rest.")
	         rest_awhile
	         ;;
	      "Quit.")
	         local quitting="Quitting Dark Nights Rising..."
  	   	   echo "${quitting}" & say rms "${quitting}"; sleep 1
  	   	   kill_audio; exit 
  	   	   ;;
  	      *)
           # this section is in case the user selects an invalid opt.
           echo "This isn't a valid selection. Please try again."
           ;;
     esac
  done 
}
# - - - entry
main

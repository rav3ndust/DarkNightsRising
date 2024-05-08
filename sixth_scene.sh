#!/bin/bash
# sixth_scene.sh
set -e
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STATE_TAG=6
readonly storyfile="stories/sixth_scene.txt"
soundtrack_audio="" 	#todo! ADD TRACK HERE
title_scene="$(cat << EOF
#############################################
#                                           #
#             CHAPTER 6                     #
#           SKELETON CREW                   #
#                                           #
EOF
)"
# Sixth Scene of Dark Nights Rising.
# initial line vars
line1="You stand with your back to the door as your vision slowly adjusts to darkness. You eventually see that you are in another long passageway."
line2="Where the walls of the last cave passage were icy, this passageway was hot and damp. Condensation collected and ran down walls that had large ruts and holes, as if something were taking large bites out of them."
line3="You continue walking slowly down the passageway, the darkness never giving way to see farther than 10 feet ahead. The carved walls create shadowy figures that put you on edge. Occasionally, you pass sections with what look like human bones littering the floor."
line4="You have been walking for a while when you notice the passageway begins to widen and there are now so many bones littering the floor that they crunch beneath your feet. You feel dread surging up within you."
line5="As you finally enter the cavern, you have difficulty making out the surroundings. It would appear as if a large boulder sat in the center of the room and you can hear a crunching noise coming from near the boulder."
line6="As you near the boulder you realize that it is actually a pile of rocks and bones. At the foot of the pile with it's back to you is a tall, emaciated, human-like creature. You realize that this is where the crunching sound is coming from."
line7="The creature senses your approach, and the crunching stops. The creature slowly turns toward you. You see that it's face is completely smooth, no eye sockets, and it's grinning mouth is full of razor sharp teeth. The creature speaks to you in a depraved voice:"
line8="'It's been so long since I've had a visitor. Nothing but stones and bones for my ravenous hunger. Welcome to The Glutton's Exile, I am the Demon of Gluttony. You have been very gluttonous indeed.'"
line9="The Demon of Gluttony howls with laughter for a few seconds. Finally, laughter fades and you are hit with the idea that this demon reminds you of the beggars that fill the streets of $PLACE. You remember how you used to flinch away from their filthy, groping hands as they begged for food or money. The demon smiles as if it sees your thoughts and says:"
line10="'Ignorance may be bliss, but it is also the easiest way to sin. You sit in luxury with food served to you on platters of silver and gold as those less fortunate starve in the wake of your gluttonous desire. It is no matter, you will be punished for your gluttonous sins.'"
line11="The demon's voice takes on a terrifying, gleeful tone as he finishes. You realize now that another fight is imminent. You quickly scan your surroundings for options and see nothing but bones, rocks, and darkness. Do you fight the demon, or give in to despair?" 
 # opt 1 - Fight the Demon
x_line1="'I will not perish here with you only to satisfy your gluttonous desire. I already feel shame at the sins of gluttony that I have committed but I cannot atone for that stuck in this cavern with you.' Your defiant shout echoes across the dark cavern."
x_line2="The demon howls at this declaration, standing quickly. The darkness makes it difficult to follow his movements and he fades out of view. You try to listen for his approach but sound of crunching and sliding bones echoes off the cavern walls. You suddenly feel damp, warm breath on the back of your neck and the stench of rotten flesh is stiffling. The demon's voice purrs in your ear as you feel bony fingers grip your arms from behind."
x_line3="'It is a fitting end for one glutton to feed another. It's been soo long since I've tasted flesh instead of rock and bone.'"
x_line4="At the last moment, before the demon sinks it's sharp teeth into your neck, you spot a bone within reach that has broken into a jagged point. You grasp for the bone and manage to grab it and thrust it blindly behind you. You feel it connect and the demon howls before falling to the floor. As you turn you see that you managed to thrust the bone into it's mouth, piercing through the roof. It gurgles as blood begins to fill it's mouth, unable to form words."
x_line5="As the Demon perishes, you feel a sense of liberation, as if you had just defeated your own Gluttony. With a newfound sense of confidence, you continue your journey to find a way out of this nightmare."
 # opt 2 - Surrender
 y_line1="You begin to try to back away, terror taking over and urging you to flee. The Demon stands quickly, moving faster than you expected. The darkness makes it difficult to follow his movements and he fades from view. The scattering and crunching of bones makes it impossible to hear his approach as the sound echoes off the cavern walls. You suddenly feel damp, warm breath on the back of your neck and the stench of rotten flesh  is stiffling. The demon's voice purrs in your ear as you feel boney fingers grip your arms from behind."
 y_line2="'It is a fitting end for one glutton to feed another. It's been soo long since I've tasted flesh instead of rock and bone.'"
 y_line3="Unable to move from fear, the demon's teeth sink into your neck, bones crunching with the force of his jaws. You only hear your screaming and the sickening sound of rending flesh and bone reverbrating off the cavern walls as you black out from pain. The Demon gleefully devours you alive."
# functions 
save_state () {
	# saves state in playerconfig
	# runs before transitioning to new scenes
	local playerconfig="playerconfig.txt"
	sed -i 's/6/7/g' $playerconfig
}
fight_demon () {
	# option-based function.
	# this function runs when player selects "Fight the Demon"
	echo "${x_line1}" && say rms "${x_line1}"; sleep 1
	echo "${x_line2}" && say rms "${x_line2}"; sleep 1
	echo "${x_line3}" && say kal "${x_line3}"; sleep 1
	echo "${x_line4}" && say rms "${x_line4}"; sleep 1
	save_state; kill_audio; bash seventh_scene.sh
}
surrender () {
	# option-based function.
	# this function runs when player selects "Surrender"
	echo "${y_line1}" && say rms "${y_line1}"; sleep 1
	echo "${y_line2}" && say kal "${y_line2}"; sleep 1
	echo "${y_line3}" && say rms "${y_line3}"; sleep 1
	kill_audio; bash game_over.sh
}
main () {
	clear
	execute_track $soundtrack_audio
	printf '%s\n' "${title_scene}"; sleep 3; small_loader_progression
	# lines go here
	echo "${line1}" && say rms "${line1}"; sleep 1
	echo "${line2}" && say rms "${line2}"; sleep 1
	echo "${line3}" && say rms "${line3}"; sleep 1
	echo "${line4}" && say rms "${line4}"; sleep 1
	echo "${line5}" && say rms "${line5}"; sleep 1
	echo "${line6}" && say rms "${line6}"; sleep 1 
	echo "${line7}" && say rms "${line7}"; sleep 1
	echo "${line8}" && say kal "${line8}"; sleep 1
	echo "${line9}" && say rms "${line9}"; sleep 1
	echo "${line10}" && say kal "${line10}"; sleep 1
	echo "${line11}" && say rms "${line11}"; sleep 1
	PS3="What will you do? "
	select opt in "Fight the Demon." "Surrender." "Quit."; do
		case $opt in 
			"Fight the Demon.")
				fight_demon
				;;
			"Surrender.")
				surrender
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
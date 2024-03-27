#!/usr/bin/env bash
# fourth_scene.sh
set -e 
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STATE_TAG=4
readonly storyfile="stories/fourth_scene.txt"
soundtrack_audio="soundtrack/sinful.mp3"
title_scene="$(cat << EOF
#############################################
#                                           #
#             CHAPTER 4                     #
#               LUST                        #
#                                           #
EOF
)"
# Fourth Scene of Dark Nights Rising.
# initial line vars
line1="After reaching the end of the overwhelmingly long hallway, you feel as if you are freezing cold. As you look around you, you notice ice on the walls and clouds forming from your breath."
line2="As you approach the farthest wall, you notice a locked door. There appear to be words inscribed on the wall above it."
line3="As you lean closer to read the words, you can see that it says the following:"
line4="Welcome to the Hall of the Demon of Lust"
line5="You notice that the sign is aged and cracking. Suddenly the atmosphere in the hall changes. You feel as though you are being watched, and then you see a figure materialise in front of you."
line6="Taking on the shadowy shape of a tall, human-like figure, you hear the following echo throughout this frozen hall."
line7="Hello, $NAME. I was told you would be coming, and I have been waiting for your arrival. I can look into your eyes and know every sin you have ever committed, and I can see that you are one who has experienced the sin of Lust before. You have lived your live in $PLACE as a sinful, lustful creature, and this is a sin that cannot go unpunished."
line8="So, $NAME, you should know that I have a particularly interesting way of punishing sinful souls such as yourself. Instead of passing you onto the next member of my family, I am going to trap your soul here in the Ice Caverns for eternity! I hope you have said your prayers."
line9="Looking around frantically, you wonder what you are going to do to fight. Are you even going to fight? Taking note of your surroundings, you see what appears to be a sharp stalagmite poking from the floor of the ice cavern. You also take note of a series of sharp, icy stalactites hanging from the cavern's ceiling. Ideas form in your mind, but you only have seconds to act, if you plan to act at all."
line10="The Demon of Lust begins to charge up what appears to be an energy blast, preparing to fire it right at you. What do you do? Do you fight with the possible weapons at your disposal, or do you resign yourself to your fate?"
# LINES - "Let's fight!" 
x_line1="You quickly dodge out of the way, right as the Demon of Lust fires the energetic blast right at you. As the energy goes right past you, you quickly kick the stalagmite with all of your might, forcing it out of the ground and into your hands. You then direct your attention to the ceiling, taking aim at the stalactites hanging directly above the Demon of Lust."
x_line2="The Demon sees what you are doing before you make your final swing. You hear a shriek as you plunge your newfound weapon into the stalactites, sending all of them plunging into the Demon of Lust, forcing him to the icy ground. As he lies on the ground, you hear his dying words."
x_line3="So, you were able to dodge my attack. I misinterpreted your resolve, $CHARNAME. In fact, with determination like this, it is possible that you might be able to overcome your sins once and for all. Show this kind of courage as you face my brethren, and you might have a chance at escaping. Until next time, goodbye, $CHARNAME of $PLACE."
x_line4="With a sigh of relief, you sit down. You know you have only defeated one of these demons, and there are still six more to go. Knowing you still have quite a ways to go, you prepare to move onto whatever lies behind the next door."
# LINES - "Let's give up."
y_line1="You resign yourself to your fate, and let the Demon know that you are aware your time has come. He looks at you right in the eyes, with one last thing to say."
y_line2="I knew you were not the kind to have any fight in you, $CHARNAME. Accept your punishment, and die!"
y_line3="The last thing you see is a charged ball of energy speeding toward you, before the world goes black."
# functions
save_state () {
  # saves state in playerconfig.
  # runs before transitioning to new scenes.
  local playerconfig="playerconfig.txt"
  sed -i 's/4/5/g' $playerconfig
}
fight_opt () {
   # option-based function.
   # this function runs when the player chooses "Let's fight!" 
   echo "${x_line1}" & say rms "${x_line1}"; sleep 1
   echo "${x_line2}" & say rms "${x_line2}"; sleep 1
   echo "${x_line3}" & say kal "${x_line3}"; sleep 1
   echo "${x_line4}" & say rms "${x_line4}"; sleep 1
   save_state; kill_audio; bash fifth_scene.sh
}
resign_opt () {
   # option-based function.
   # this function runs when the player chooses "Let's give up."
   echo "${y_line1}" & say rms "${y_line1}"; sleep 1
   echo "${y_line2}" & say kal "${y_line2}"; sleep 1
   echo "${y_line3}" & say rms "${y_line3}"; sleep 1
   kill_audio; bash game_over.sh
}
main () {
  clear
  execute_track $soundtrack_audio
  printf '%s\n' "${title_scene}"; sleep 3; small_loader_progression
  echo "${line1}" & say rms "${line1}"; sleep 1
  echo "${line2}" & say rms "${line2}"; sleep 1
  echo "${line3}" & say rms "${line3}"; sleep 1
  echo "${line4}" & say rms "${line4}"; sleep 1
  echo "${line5}" & say rms "${line5}"; sleep 1
  echo "${line6}" & say rms "${line6}"; sleep 1
  echo "${line7}" & say kal "${line7}"; sleep 1
  echo "${line8}" & say kal "${line8}"; sleep 1
  echo "${line9}" & say rms "${line9}"; sleep 1
  echo "${line10}" & say rms "${line10}"; sleep 1
  PS3="Will you fight the Demon of Lust, or will you surrender? "
  select opt in "Let's fight!" "Let's give up." "Quit."; do
    case $opt in 
  	  "Let's fight!")
  		  fight_opt
  		  ;;
  	  "Let's give up.")
  		  resign_opt
  		  ;;
  	  "Quit.")
  	  	local quitting="Quitting Dark Nights Rising..."
  	  	echo "${quitting}" & say "${quitting}"; sleep 1
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

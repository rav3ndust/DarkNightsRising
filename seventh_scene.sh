#!/usr/bin/env bash
# seventh_scene.sh
set -e 
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STATE_TAG=7
readonly storyfile="stories/seventh_scene.txt"
soundtrack_audio=""     #todo! ADD TRACK HERE
title_scene="$(cat << EOF 
#############################################
#                                           #
#             CHAPTER 7                     #
#               GLYPHS                      #
#                                           #
EOF
)"
# Seventh Scene of Dark Nights Rising
# initial line vars
line1="As the Demon of Gluttony breathes his last breath a faint glimmer can be seen on the wall opposite from the cavern opening. You approach the wall and see letters in a language you don't recognize glowing faintly on the wall. A crack echoes through the cavern as another door begins to slide open. Blinding light pours though the crack as the door slides open leaving you momentarily blind."
line2="Once the door is open, and your eyes have adjusted, you see that the passage beyond looks like a guilded palace. The cave walls are smooth and coated in gold, jewels jutting out in intricate patterns. If not for the musty, thick air, you would not realize that you were still stuck in a cave." 
line3="You look back to where the Demon of Gluttony lies and wonder what could be beyond the door. While the passageway looks more inviting than the hot, damp cavern that you are standing in, the ever present dread rises up again. You have died almost twice and you feel that there will be more close calls as you continue through the caves. Will you push on or give up?"
# opt 1 - Keep going.
x_line1="After a moment's debate you decide that moving forward is the only option. You know that if you die, you will be stuck in the cave with the demons forever, but maybe there is a chance to escape. You step through the threshold into the golden hall and the door begins to slide shut behind you. The musty air sticks in your lungs as if the passageway had not been opened for some time."
x_line2="An eerie feeling settles over you as you walk farther into the passageway. The hall looks like it was designed for a grand king but there is no life anywhere in sight. Your footsteps echo down the hall in the silence as you press on."
# opt 2 - Give up.
y_line1="You feel your heart pounding as you decide on what to do. Panic rises in your chest and you begin to shake with fear. The idea of moving forward is too much for you to handle after surviving a brush with death for the second time. Your legs give out and you collapse on the door. The glimmer from the writing above the door flickers out and the door begins to slide shut as you rock back and forth in your panic." 
y_line2="You faintly hear the rattle of bones as the Demon of Gluttony removes the bone from it's mouth and crawls towards you with a sharp toothed grin. You begin to scream and try to scramble away, but the demon lunges and drags you back towards him. You utter one final, guttural scream as he sinks his teeth into your neck."
# functions 
save_state () {
    # saves state in playerconfig
    # runs before transitioning to new scenes
    local playerconfig="playerconfig.txt"
    sed -i 's/7/8/g' $playerconfig 
}
keep_going () {
    # option-based function.
    # this function runs when player selects "Keep going."
    echo "${x_line1}" & say rms "${x_line1}"; sleep 1
    echo "${x_line2}" & say rms "${x_line2}"; sleep 1
    save_state; kill_audio; bash eighth_scene.sh
}
give_up () {
    # option-based function.
    # this function runs when player selects "Give up."
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
    echo "${line3}" & say rms "${line3}"; sleep 1
    PS3="What will you do?"
    select opt in "Keep going." "Give up." "Quit."; do
        case $opt in 
            "Keep going.")
                keep_going
                ;;
            "Give up.")
                give_up
                ;;
            "Quit.")
                local quitting="Quitting Dark Nights Rising..."
                echo "${quitting}" & say rms "${quitting}"; sleep 1
                kill_audio; exit
                ;;
            *)
            # this section is in case the user selects an invalid opt
                echo "This isn't a valid selection. Please try again."
                ;;
        esac
    done 
}
# - - - entry
main

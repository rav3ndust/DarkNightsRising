#!/usr/bin/env bash
# third_scene.sh
set -e 
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STAGE_TAG=3
readonly storyfile="stories/third_scene.txt"
soundtrack_audio="soundtrack/kasper_the_deadly_gh0st.mp3"
title_scene="$(cat << EOF
#############################################
#                                           #
#             CHAPTER 3                     #
#               LAMENT                      #
#                                           #
EOF
)"
# Second Scene of Dark Nights Rising.
# initial line vars
line1="As the darkness dissapates and the voices fade away, you start to realize that you are in a sort of cave with a linear path forward, with only the dimmest of lights at the end."
line2="With an audible rise in pitch, you hear one last voice begin to speak. The voice says:"
line3="Welcome to Lament, the Cave of Despair. Here, you will be forced to face your deepest nightmares and innermost fears as you progress. You will surely be trying to find your way out, but you will have no chance unless you are able to confront and defeat the Seven Demons."
line4="This is not a place for the faint of heart, and you will surely wish yourself dead. However, here, there is one trick. You cannot die."
line5="There are Seven Demons you must face on your journey. They are the Demons of Lust, Gluttony, Greed, Sloth, Wrath, Envy, and Pride. To progress on your journey, you must face each one and will be presented with a choice - will you make the right one? You will have to decide for yourself, $CHARNAME!"
line6="Finally, the voice fades away, leaving a cacophony of emotions in its wake. You don't know how you feel about the information you have just been presented. Do you attempt to continue on your journey, or do you try to figure out another plan of action?"
line7="You could either continue on your path, or you could try to investigate the odd mirror to attempt to escape. What would you like to do?"
# LINES - "Continue"
x_line1="With a deep breath and a fast-beating heart, you decide that your best course of action will be to press on."
x_line2="Your footsteps echoing through the narrow corridor as you slowly step towards the dim light in front of you, you wonder what could possibly be in store for you amidst the presence of the so-called Seven Demons."
x_line3="'It is too late to turn back now', you think to yourself. With an overwhelming sensation of dread, you reluctantly press on, wondering what awaits you on the other end of this long hallway."
# LINES - "Escape"
y_line1="You decide that you are not interested in seeing how this event unfolds. You want out. Doubling back to the other side of the cave, you begin walking back to the mirror that seemingly brought you to this desolate world in the first place."
y_line2="As you approach the glass, you hear the voice begin to pipe up once again. It says:"
y_line3="Nice try, $CHARNAME, but there is no escape from this prison. You cannot run from your fears, $CHARNAME. You must face them. What would the rest of the $RACE people think of you? You cannot be this much of a coward."
y_line4="With a howl, the glass in the mirror shatters to pieces, and the voice of the demon fades away once again. You officially have no choice."
y_line5="${x_line3}"
# functions
save_state () {
    # saves state in playerconfig.
  # runs before transitioning to new scenes.
  local playerconfig="playerconfig.txt"
  sed -i 's/3/4/g' $playerconfig
}
opt_continue () {
    # option-based function.
    # this function runs when the player selects "Continue."
    echo "${x_line1}" & say rms "${x_line1}"; sleep 1
    echo "${x_line2}" & say rms "${x_line2}"; sleep 1
    echo "${x_line3}" & say rms "${x_line3}"; sleep 1
    save_state; kill_audio; bash fourth_scene.sh
}
opt_escape () {
    # option-based function.
    # this function runs if the player selects "Escape."
    echo "${y_line1}" & say rms "${y_line1}"; sleep 1
    echo "${y_line2}" & say rms "${y_line2}"; sleep 1
    echo "${y_line3}" & say awb "${y_line3}"; sleep 1
    echo "${y_line4}" & say rms "${y_line4}"; sleep 1
    echo "${y_line5}" & say rms "${y_line5}"; sleep 1
    save_state; kill_audio; bash fourth_scene.sh
}
main () {
    clear 
    execute_track $soundtrack_audio 
    printf '%s\n' "${title_scene}"; sleep 3; small_loader_progression
    echo "${line1}" & say rms "${line1}"; sleep 1
    echo "${line2}" & say rms "${line2}"; sleep 1
    echo "${line3}" & say awb "${line3}"; sleep 1
    echo "${line4}" & say awb "${line4}"; sleep 1
    echo "${line5}" & say awb "${line5}"; sleep 1
    echo "${line6}" & say rms "${line6}"; sleep 1
    echo "${line7}" & say rms "${line7}"; sleep 1
    PS3="What will you do next? "
    select opt in "Continue." "Escape." "Quit."; do 
        case $opt in
            "Continue.")
                opt_continue
                ;;
            "Escape.")
                opt_escape 
                ;;
            "Quit.")
                local quitting="Quitting Dark Nights Rising..."
                echo "${quitting}" & say rms "${quitting}"; sleep 1
                kill_audio; exit 
                ;;
        esac
    done 
}
# - - - entry
main

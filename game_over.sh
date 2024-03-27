#!/usr/bin/env bash
# game_over.sh
set -e
source playerconfig.txt
source library/libdnr.sh
soundtrack_audio="soundtrack/deaths_door.mp3"
title_scene="$(cat << EOF
#############################################
#                                           #
#              	  GAME                      #
#                 OVER                      #
#                                           #
EOF
)"
# Game Over screen for Dark Nights Rising.
# line vars
line1="They say if you die in a dream, you die in real life." 
line2="This turned out to be true for $CHARNAME, who, after being killed by a Demon in the horrific state they had fallen into..."
line3="...slipped from this life."
line4="Nobody ever forgot $CHARNAME of $PLACE."
line5="The $RACE people always remembered them as someone who met their untimely end far too soon."
line6="It might be too late for $CHARNAME, but it isn't too late for you, $NAME!"
line7="Would you like to restart Dark Nights Rising, or would you like to quit for now?"
line8="Quitting the game will clear your data from this session."
# functions 
restart_game () {
    # restarts from the First Scene.
    # leaves player data intact.
    local rs="Restarting the game..."
    echo "${rs}" & say rms "${rs}"; sleep 1
    kill_audio; bash first_scene.sh
}
quit_clear_session () {
    # quits the game, and deletes player data.
    playerconfig="playerconfig.txt"
    local quitting="Quitting Dark Nights Rising..."
    echo "${quitting}" & say rms "${quitting}"; sleep 1
    rm $playerconfig; kill_audio; exit
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
    echo "${line7}" & say rms "${line7}"; sleep 1
    echo "${line8}" * say rms "${line8}"; sleep 1
    PS3="Would you like to restart the game, or quit? "
    select opt in "Restart!" "Quit."; do
        case $opt in 
            "Restart!")
                restart_game
                ;;
            "Quit.")
                quit_clear_session
                ;;
            *)
                # this section is for when the user selects invalid option
                echo "This isn't a valid selection. Please try again."
                ;;
        esac
    done
}
# - - - entry 
main

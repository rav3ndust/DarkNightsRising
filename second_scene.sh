#!/usr/bin/env bash
# second_scene.sh
set -e 
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STATE_TAG=2
readonly storyfile="stories/second_scene.txt" 
soundtrack_audio="soundtrack/time_space.mp3"
title_scene="$(cat << EOF
#############################################
#                                           #
#             CHAPTER 2                     #
#         A DEMONIC PRESENCE                #
#                                           #
EOF
)"
# Second Scene of Dark Nights Rising.
# initial line vars
line1="After a strong sensation of being lifted into the air, and a general feeling of being dazed, and confused, you wonder if the whole experience was real or not."
line2="Suddenly, with no warning at all, you hear the sound of laughter and a shrill collection of voices calling out to you, as if they know exactly who you are."
line3="The voices speak the following words:"
line4="Hello, $CHARNAME. We have always known you, we have always followed you. We know your every thought, we know every single move you make. You cannot hide anything from us, and you can have no secrets."
line5="Now, $CHARNAME of the $RACE race, from the land of $PLACE, don't try to hide your true character. Allow yourself to be assimilated by your deepest desires. We can help you feel like you have a purpose again."
line6="You do not know what to do. You are conflicted. Are these demons telling you the truth? Or are they conspiring against you in order to take control of your mind?"
line7="Think carefully, because you only get one chance here. What would you like to say to the demons? Do you choose to resist, or assimilate?"
# LINES - "Resist"
x_line1="'I refuse', you say calmly to the demons. 'I will not assimilate with you. I refuse to give you any control over my brain.'"
x_line2="The demons are not happy about your decision. They shout a shrill, hellish scream, bringing the very feeling of dread itself into your soul."
x_line3="Next, the demons have this to say:"
x_line4="How dare you defy us! You will pay for this with the ultimate retribution. We already have control over your mind, don't you see? We exist within you, a part of your very being!"
x_line5="You will roam the dark halls of your disturbed mind for years, and you will never find a true escape. We will torment you in a prison of your own creation until the day you die."
x_line6="You breathe a sigh of relief. The demons have vanished, for now. Knowing they will be back, you take a deep breath, determined, and press on through the dark corridor in front of you, feeling as though you are being watched the whole time."
x_line7="It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again?"
# LINES - "Assimilate"
y_line1="'I will join you', you say to the demons. 'I have been facing this mental lapse for far too long. I am ready for some kind of reprieve.' The demons laugh, staring at you with intent. They then scream in yet another shrill scream:"
y_line2="'You really thought it would be that easy? We owe you a lifetime of darkness and retribution for the sins you have committed in your life. This is your own mental prison that you have constructed for yourself, and we are the gatekeepers.'"
y_line3="'Just wait. We are going to force you to traverse the hallways of your disturbed mind, and allow you to see exactly the circumstances of the sins you have committed throughout the years.'"
y_line4="'We will be back. Your day of reckoning is upon you, $CHARNAME.'"
y_line5="You take a deep breath as the Demons finally stop shouting, and vanish into thin air. With a fast beating heart and no idea what to expect next, you know it is time to press on."
y_line6="It is not over yet. To get out of this nightmare, it is going to truly take confronting these demons at some point. The question is, will you be ready when you encounter them again?"
# functions
save_state () {
  # saves state in playerconfig.
  # runs before transitioning to new scenes.
  local playerconfig="playerconfig.txt"
  sed -i 's/2/3/g' $playerconfig
}
resist_opt () {
    # option-based function.
    # this function runs if the player chooses "Resist"
    echo "${x_line1}" & say rms "${x_line1}"; sleep 1
    echo "${x_line2}" & say rms "${x_line2}"; sleep 1
    echo "${x_line3}" & say rms "${x_line3}"; sleep 1
    echo "${x_line4}" & say kal "${x_line4}" & say slt "${x_line4}"; sleep 1
    echo "${x_line5}" & say kal "${x_line5}" & say slt "${x_line5}"; sleep 1
    echo "${x_line6}" & say rms "${x_line6}"; sleep 1
    echo "${x_line7}" & say rms "${x_line7}"; sleep 1
    save_state; kill_audio; bash third_scene.sh
}
assimilate_opt () {
    # option-based function.
    # this function runs if the player chooses "Assimilate"
    echo "${y_line1}" & say rms "${y_line1}"; sleep 1
    echo "${y_line2}" & say kal "${y_line2}" & say slt "${y_line2}"; sleep 1
    echo "${y_line3}" & say kal "${y_line3}" & say slt "${y_line3}"; sleep 1
    echo "${y_line4}" & say kal "${y_line4}" & say slt "${y_line4}"; sleep 1
    echo "${y_line5}" & say rms "${y_line5}"; sleep 1
    echo "${y_line6}" & say rms "${y_line6}"; sleep 1
    save_state; kill_audio; bash third_scene.sh
}
main () {
    clear
    execute_track $soundtrack_audio
    printf '%s\n' "${title_scene}"; sleep 3; small_loader_progression
    echo "${line1}" & say rms "${line1}"; sleep 1
    echo "${line2}" & say rms "${line2}"; sleep 1
    echo "${line3}" & say rms "${line3}"; sleep 1
    echo "${line4}" & say kal "${line4}" & say slt "${line4}"; sleep 1
    echo "${line5}" & say kal "${line5}" & say slt "${line5}"; sleep 1
    echo "${line6}" & say rms "${line6}"; sleep 1
    echo "${line7}" & say rms "${line7}"; sleep 1
    PS3="What do you choose to do? "
    select opt in "Resist" "Assimilate" "Quit"; do
        case $opt in 
            "Resist")
                resist_opt 
                ;;
            "Assimilate")
                assimilate_opt
                ;;
            "Quit")
                local quitting="Quitting Dark Nights Rising..."
                echo "${quitting}" & say rms "${quitting}"; sleep 1
                kill_audio; exit 
                ;;
        esac
    done
}
# - - - entry
main

#!/usr/bin/env bash
# eighth_scene.sh
set -e
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STATE_TAG=8
readonly storyfile="stories/eighth_scene.txt"
soundtrack_audio=""     #todo! ADD TRACK HERE
title_scene="$(cat << EOF
#############################################
#                                           #
#             CHAPTER 8                     #
#           CROWN OF GLORY                  #
#                                           #
EOF
)"
# Eighth Scene of Dark Nights Rising
# initial line vars
line1="You continue down the hall, admiring the intricately carved golden walls and wonder what may lie ahead. A small part of you hopes that this is the end of the cave and that you have finally found freedom, however, the uneasy feeling in your gut tells you that more danger lies ahead."
line2="You have been walking for some time when you notice the tunnel begins to widen into another large cavern. You step into what looks to be a grand throne room. There are piles of gold coins and jewels that cover every inch of the cavern floor and in the center of the room sits a large golden throne. On the throne sits a skeleton of what looks to have once been a very large man wearing a crown of carved dragons with rubies for eyes."
line3="The room is quiet and the skeleton makes no movement. You begin to wander around the room in search of a way out. The gold and jewels rustle as you attempt to quietly walk about the room. After several minutes of searching, you give up looking for an exit in the smooth golden walls and lie down in the center of the room to wait for whatever will happen next."
line4="As you lie there, you begin to think about what it would be like to have so many riches back home. You think of the comfort that you could live in and the delicacies that you would be able to indulge in. As you lie there, you begin to subconsciously run your hands through the treasures on the floor allowing the gold coins and jewels to slip through your fingers and clink together as they fall back to the floor."
line5="You catch a glimpse of a red flash and notice the eyes of the dragons on the crown glimmering in the light. As you look at the crown, you feel a growing urge to try it on, even if just for a moment."
line6="You are mesmerized by the crown and the desire to wear it. Before you realize it, you have risen from the floor and are shambling your way to where the skeleton king is perched on his throne, the dragons eyes still glimmering with an ethereal glow. It is only when you see your outstretched hands grasping for the crown that you take pause, realizing what you are doing."
# opt 1 - Resist.
x_line1="You feel the urge to grab the crown trying to surge up more strongly within you and the glimmering eyes become brighter. You realize that you must be under a spell cast by the crown and begin to back away."
x_line2="'Come closer and take the crown of glory.'" # kal
x_line3="You hear a soft voice say in your head. The pull of the crown is very strong but you resist and move back to the center of the room. 'I have no need for glory and gold, only freedom.' You say aloud. You feel the urge lessen slightly but the voice attempts to tempt you again,"
x_line4="'With me you could obtain all the freedom you wish for.'" # kal
x_line5="You sit down firmly in the center of the room. While the idea of having all the riches you could wish for is a tempting idea, you also know that true freedom means to be free also of influence. 'What you offer me is not true freedom, but freedom wrapped in a gilded cage. The freedom I desire has no ulterior motive,' you say with defiance."
x_line6="You feel a strong wave wash over you that fills you with the desire to take the crown. You feel your legs trying to force you to stand but you remain firmly planted on the floor. You feel the strain of your body attempting to answer the call of the crown but mentally force yourself to stay rooted. You stay this way for what seems like hours, perspiration building up on your skin as you force yourself to stay rooted and resist the crown. As you feel your body beginning to give out to exhaustion, you scream out one final time, with all your might, 'I WILL NOT BE SWAYED!'. You see the glow of the dragons eyes dim before blacking out from exhaustion."
# opt 2 - Take the crown.
y_line1="The urge to take the crown is irresistable. You carefully lift the crown from the skeletal king's brow. The crown is warm in your hands and glows with ethereal light."
y_line2="'Yes. Place the crown upon your brow and claim the glory you deserve.'"
y_line3="You hear a soft voice hiss inside your head. You carefully place the crown upon your head and the skeletal king's body disappears. You see that the once empty room is now filled with servants and trays of delectable food."
y_line4="You sit upon the throne and are immediately surrounded by beautiful young women bearing trays of food that you have only ever imagined tasting. A plate is presented to you, piled high with juicy meats and other delights. You eagerly grasp for the plate, mouth already watering. You grab a large turkey drum and tear into the meat, savoring the flavor and chewing slowly."
y_line5="You barely hear the soft hissing voice in your head speaking, 'The ritual  is complete.' Between mouthfuls of food, you ask offhandedly 'So am I free to leave now?'. One of the women closest to you laughs softly and replies cheerfully:" 
y_line6="'Oh, of course not! You are the new Demon of Greed's host. We will keep you fed and healthy so that your life force will sustain him. We expect that you will be able to feed our master for many centuries. You have such a strong spirit!'"
y_line7="You drop the food you are holding and you hear a soft hissing laughter inside your head. You attempt to stand from the throne but find that you cannot move. As you begin to panic and struggle, you feel a wave of fog and sleep invade your mind. You see the beautiful women before you take on the form of hags before you are pulled into a deep eternal sleep."
# functions
save_state () {
    # saves state in playerconfig
    # runs before transitioning to new scenes
    local playerconfig="playerconfig.txt"
    sed -i 's/8/9/g' $playerconfig
}
resist () {
    # option-based function.
    # this function runs when player selects "Resist."
    # todo! fill out the rest of the logic in this function
    save_state; kill_audio; bash ninth_scene.sh
}
take_crown () {
    # option-based function.
    # this function runs when player selects "Take the crown."
    # todo! fill out the rest of the logic in this function
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
    PS3="What will you do?"
    select opt in "Resist." "Take the crown." "Quit."; do
        case $opt in
            "Resist.")
                resist
                ;;
            "Take the crown.")
                take_crown
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
# - - entry
main

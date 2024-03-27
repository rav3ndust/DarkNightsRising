#!/usr/bin/env bash
# first_scene.sh
set -e
source playerconfig.txt
source library/libdnr.sh
declare -i SAVE_STATE_TAG=1
readonly storyfile="stories/first_scene.txt"
soundtrack_audio="soundtrack/awakening.mp3"
title_scene1="$(cat << EOF
#############################################
#                                           #
#             CHAPTER 1                     #
#             THE MIRROR                    #
#                                           #
EOF
)"
# First Scene of Dark Nights Rising.
# initial line vars
line1="Let us get started..."
line2="You are in your home - feeling different, rather isolated and lethargic."
line3="The area around you begins to swirl, almost as if you are in a haze."
line4="You wake up in front of an ancient mirror, with a sinister-looking reflection staring back at you with black, deadpan eyes."
line5="You feel a sense of dread as you approach the mirror closer. What do you do?"
# LINES: Stare into the mirror.
x_line1="You stare closer into the mirror, and the clear face of the demonic figure stares right back. It knows you're there."
x_line2="The Demon says the following:"
x_line3="Hello, $CHARNAME of $PLACE. I know your heart, and I know your spirit. You are not the only one of the $RACE kind feeling this way.Together, we can help you realize your true potential."
x_line4="You feel terrified. You do not know what to do next, only that your heart feels like it is sinking into your chest."
x_line5="You hear the unmistakable sound of a large gust of wind, as you are seemingly pulled into the mirror."
x_line6="It is time to explore your inner demons, $NAME. I can only hope that you are ready."
# LINES: Back away from the mirror.
y_line1="As you begin to back away slowly, you hear a loud howl."
y_line2="As you wonder what it could have been, the mirror turns alight, with a demonic face staring right into your eyes."
y_line3="Suddenly, out of nowhere, you hear a demonic voice say the following:"
y_line4="${x_line3}" # same line from the Demon
y_line5="Suddenly, a huge gust of wind sucks you in from out of nowhere, and you are forced headfirst into the mirror, whether you like it or not."
y_line6="${x_line6}"  # same line, ending the Scene
# functions
save_state () {
  # saves state in playerconfig.
  # runs before transitioning to new scenes.
  local playerconfig="playerconfig.txt"
  sed -i 's/1/2/g' $playerconfig
}
stare_into_mirror () {
  # option-based function.
  # runs if player selects 'stare into the mirror'
  echo "${x_line1}" & say rms "${x_line1}"; sleep 1
  echo "${x_line2}" & say rms "${x_line2}"; sleep 1
  echo "${x_line3}" & say kal "${x_line3}"; sleep 1
  echo "${x_line4}" & say rms "${x_line4}"; sleep 1
  echo "${x_line5}" & say rms "${x_line5}"; sleep 1
  echo "${x_line6}" & say rms "${x_line6}"; sleep 1
  save_state; kill_audio; bash second_scene.sh
}
back_away_from_mirror () {
  # option-based function.
  # runs if player selects 'back away from mirror'
  echo "${y_line1}" & say rms "${y_line1}"; sleep 1
  echo "${y_line2}" & say rms "${y_line2}"; sleep 1
  echo "${y_line3}" & say rms "${y_line3}"; sleep 1
  echo "${y_line4}" & say kal "${y_line4}"; sleep 1
  echo "${y_line5}" & say rms "${y_line5}"; sleep 1
  echo "${y_line6}" & say rms "${y_line6}"; sleep 1
  save_state; kill_audio; bash second_scene.sh
}
main () {
  clear
  execute_track $soundtrack_audio
  printf '%s\n' "${title_scene1}"; sleep 3; small_loader_progression
  echo "${line1}" & say rms "${line1}"; sleep 1
  echo "${line2}" & say rms "${line2}"; sleep 1
  echo "${line3}" & say rms "${line3}"; sleep 1
  echo "${line4}" & say rms "${line4}"; sleep 1
  echo "${line5}" & say rms "${line5}"; sleep 1
  PS3="What will you do? "
  select opt in "Stare closer into the mirror." "Back away from the mirror." "Quit"; do
    case $opt in
      "Stare closer into the mirror.")
        stare_into_mirror
        ;;
      "Back away from the mirror.")
        back_away_from_mirror
        ;;
      "Quit")
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

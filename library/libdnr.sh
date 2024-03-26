#!/usr/bin/env bash
set -e
#   libdnr.sh
# A library of functions we use throughout the Dark Nights Rising game.
# Docs are provided through comments for each function explaining how to use it within DNR scripts.
say () {
  # 'say' is a function we use to generate voice synthesis for ingame lines.
  # we use 'flite' as our TTS engine, and different voices for different scenes.
  # in this function, you provide two arguments:
  #   - vox (voice selection)
  #   - line (the line to be spoken)
  # In DNR, lines are referenced from the /stories folder and hardcoded to scenes.
  # Due to this, we reference them by variable name when passing args.
  #       example: `say rms "${line6}"`
  local vox=$1
  local line=$2
  flite -voice ${vox} "${line}"
}
execute_track () {
  # we have an original soundtrack for Dark Nights Rising.
  # it is stored in the /soundtrack folder.
  # we use 'mpg123' to play the track in bg as the game goes on.
  # this function is for beginning a track.
  # pass a tune from the /soundtrack folder as the $track arg when using this function.
  #     example: `execute_track "soundtrack/haunted.mp3"`
  local track=$1
  mpg123 -q ${track} > /dev/null 2>&1 &
}
kill_audio () {
  # this function is simple, and requires no args.
  # it simply kills any running instance of mpg123 when the music needs stopped ingame.
  killall mpg123
}

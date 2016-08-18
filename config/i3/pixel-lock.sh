#!/bin/sh
# scrot /tmp/screen.png
# convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
# [[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png
# dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
# deadbeef --pause
# i3lock -u -i /tmp/screen.png
# rm /tmp/screen.png
#
scrot /tmp/screen.png

convert /tmp/screen.png -filter Gaussian -resize 50% -define filter:sigma=3 -resize 200% /tmp/screen.png

# feh /tmp/screen.png
i3lock -u -i /tmp/screen.png

rm /tmp/screen.png


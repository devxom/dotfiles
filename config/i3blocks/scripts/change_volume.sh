#!/bin/sh

if pgrep pulseaudio > /dev/null
then
    if test "$1" = down
    then
        amixer -q -D pulse sset Master 1%-
    elif test "$1" = up
    then
        amixer -q -D pulse sset Master 1%+
    fi
else
    if test "$1" = down
    then
        amixer -q set PCM 1%-
    elif test "$1" = up
    then
        amixer -q set PCM 1%+
    fi
fi

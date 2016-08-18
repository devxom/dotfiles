#!/bin/bash

xwininfo -root -tree \
    | grep -P 'Google Play Music' \
    | cut -d '"' -f 2 | rev | cut -d "-" -f 3- | rev \
    | sed 's/ (.*Remaster.*)//g'

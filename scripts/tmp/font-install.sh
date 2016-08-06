#!/bin/bash
#
# This script helps to install fonts
#
# Set your default font storage directory here
##DEFAULT_DIR="$HOME/fonts"
DEFAULT_DIR=`pwd`
# Set the default font installation directory here
DEFAULT_DEST="/usr/share/fonts/truetype/font-install"


# Don't edit anything below unless you know what you're doing.

echo "In which directory are the fonts?"
echo -n "[$DEFAULT_DIR] "
read DIR

echo
echo "What is the extention (without the dot) of the fonts?"
echo -n "[ttf] "
read EXT

echo
echo "Where should the fonts be installed?"
echo "DO NOT CHANGE THIS UNLESS YOU KNOW WHAT YOU'RE DOING!"
echo -n "[$DEFAULT_DEST] "
read DEST

if [ -z "$DIR" ]; then
    DIR="$DEFAULT_DIR"
fi

if [ -z "$EXT" ]; then
    EXT="ttf"
fi

if [ -z "$DEST" ]; then
    DEST="$DEFAULT_DEST"
fi

sudo -v
if [ $? != 0 ]; then
    echo "Unable to obtain the necessary privileges. Exiting..."
    echo -n "Press <Enter> to continue. "
    read WER
    exit $?
fi

echo
echo

if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist. Exiting..."
    echo -n "Press <Enter> to continue. "
    read SDF
    exit 2
fi

if [ ! -d "$DEST" ]; then
    echo "Directory $DEST does not exist. Exiting..."
    echo -n "Press <Enter> to continue. "
    read DFG
    exit 1
fi

echo "Copying fonts..."
cd "$DIR"

for i in *."$EXT"; do
    sudo cp -iv "$i" "$DEST"
done

echo
echo
echo "Updating the font cache..."
sudo fc-cache -fv

if [ $? != 0 ]; then
    echo "Error updating the font cache. Your fonts haven't been completely installed. Try running sudo fc-cache -fv manually. Exiting..."
    echo -n "Press <Enter> to continue."
    read FSF
    exit $?
fi

echo
echo
echo "Finished."
echo
echo "You will probably need to restart running programs to use the new fonts."
echo -n "Press <Enter> to exit. "
read WERT
exit 0

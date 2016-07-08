#!/bin/bash

# Enables Sublime settings syncronization

# if [ `uname` == 'Darwin' ]; then
# 	DIR=~/Library/Application\ Support/Sublime\ Text\ 3
# else
# 	DIR=~/AppData/Roaming/Sublime\ Text\ 3
# fi

if [ `uname` == 'Linux' ]; then
  DIR=~~/.config/sublime-text-3/


[ ! -d "$DIR" ] && mkdir -p "$DIR/Packages"
if [ -d "$DIR/Packages/User" ]; then
	mkdir "$DIR/Packages.bak"
	mv "$DIR/Packages/User" "$DIR/Packages.bak/User"
fi
ln -s ~/git-repos/dotfiles/.dotfiles/sublime/User "$DIR/Packages/User"

#!/usr/bin/env bash

case $- in
*i*) ;; # interactive
*) return ;;
esac

# ----------------------- environment variables ----------------------
export TZ=Europe/Lisbon
# long date format in ls(1)
export TIME_STYLE="long-iso" 

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export SCRIPTS="$HOME/Scripts"
export VIRTUALMACHINES="$HOME/VirtualMachines"
export WORKSPACES="$HOME/Workspaces" # container home dirs for mounting
export TERM=xterm-256color

export EDITOR=vi
export VISUAL=vi
export PAGER='less -R';
export EDITOR_PREFIX=vi

# User specific environment and startup programs
export PATH="${PATH}:${HOME}/.local/bin:${HOME}/bin:${HOME}/dev/bin:${BIN_HOME}";

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

# Highlight section titles in manual pages.
export LESS="-cRSx4M~#1PMFile\: ?f%F:stdin. | Line\: %lt-%lB?L/%L. ?PB(%PB\%) .| Page\: %d?L/%D.";
export LESS_TERMCAP_md="${yellow}";

# export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

# -------------------------------- gpg -------------------------------
# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# [ -n "$PS1" ] && source ~/.bash_profile;

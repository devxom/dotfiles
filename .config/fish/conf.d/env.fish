# default apps
set -gx EDITOR nvim
set -gx TERMINAL kitty
set -gx BROWSER firefox

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

set -x LESSHISTFILE "-"
set -x MANPAGER "less -R --use-color -Dd+r -Du+b"

# Adds ~/.local/bin and subfolders to $PATH
# export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"

# cleaning up home folder
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache

set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

set -gx NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -gx NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

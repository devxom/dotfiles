#!/usr/bin/zsh

# ================================================
# Exports
# ================================================

export LANG=en_US.UTF-8
export HOSTNAME="dhoner"
export ARCHFLAGS="-arch x86_64"

export VISUAL=vim
export EDITOR="$VISUAL"
export PAGER='less -R'
export TERM=rxvt-unicode

export SSH_KEY_PATH="~/.ssh/"

export HISTFILE=$HOME/.zsh/history
export HISTSIZE=5000
export SAVEHIST=5000
export HISTIGNORE="&:ls:[bf]g:history:exit:reset:clear:cd*"

export TIME_STYLE=long-iso   # long date format in ls(1)
export ZSH_ACTIVE_COMPLETIONS="$( echo ${(kv)_comps[@]} )"
export DEVEL_HOME="$HOME/repos"
export BIN_HOME="$HOME/dev/bin"
export NODE="~/.nvm/versions/node/v7.2.1/bin/"
export PATH="$PATH:$HOME/dev/bin:$NODE"
export LESS="-cRSx4M~#1PMFile\: ?f%F:stdin. | Line\: %lt-%lB?L/%L. ?PB(%PB\%) .| Page\: %d?L/%D."
export NVM_DIR="/home/dhoner/.nvm"

# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# nvm use 7.2.1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export GIST_DIR=$HOME/dev/_gists/
# export GOROOT=$HOME/go
# export GOOS='linux'
# export GO_ARCH=386

# export LP_DEST="Hewlett-Packard-HP-LaserJet-1018"
# export PRINTER="Hewlett-Packard-HP-LaserJet-1018"

# vim: set ts=2 expandtab sw=2:

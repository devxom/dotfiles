## This file is sourced by all *interactive* bash shells on startup.  This
## file *should generate no output* or it will break the scp and rcp commands.
############################################################

if [ -e /etc/bashrc ] ; then
  . /etc/bashrc
fi

############################################################
## Terminal behavior
############################################################

# Do not put duplicate lines in the history
HISTCONTROL=erasedups:ignorespace
HISTSIZE=1000
HISTTIMEFORMAT='%Y-%m-%d %H-%M    '
HISTIGNORE="cd:pwd:ls:l:ll:fg:bg:jobs:j"
HISTFILESIZE=3000

############################################################
## Optional shell behavior
############################################################

# Double check of history substitutions.
shopt -s histverify
# All terminals use .bash_history file wothout overwriting it.
shopt -s histappend

shopt -s cdspell
shopt -s extglob
shopt -s checkwinsize

export PAGER="less"
export EDITOR="gedit"
#"emacsclient -nw"

############################################################
## Command prompts and titles
############################################################

# Change the window title of X terminals
case $TERM in
  xterm*|rxvt|Eterm|eterm)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
    ;;
  screen|tmux)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
    ;;
esac

# Show the git branch and dirty state in the prompt.
function parse_git_dirty {
  [[ -n $(git status -s 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git rev-parse --abbrev-ref HEAD 2> /dev/null
}

if [ `which git 2> /dev/null` ]; then
  function git_prompt {
    echo $(parse_git_branch)$(parse_git_dirty)
  }
else
  function git_prompt {
    echo ""
  }
fi

if [ `which node 2> /dev/null` ]; then
  function node_prompt {
    echo $(node -v | cut -d'v' -f2)
  }
else
  function node_prompt {
    echo ""
  }
fi

if [ -n "$BASH" ]; then
  export PS1='\[\033[32m\]\n[\s: \w] (⬢ $(node_prompt)) $(git_prompt)\n\[\033[31m\][\u@\h]\$ \[\033[00m\]'
fi

############################################################
## Aliases
############################################################

if [ -e ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

############################################################
## Misc
############################################################

shopt -s autocd
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Unbind C-s and C-u.
# stty -ixon
stty kill ^- stop ^-
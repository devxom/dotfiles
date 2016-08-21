# Path to your oh-my-zsh installation.
export ZSH=/home/dhoner/.oh-my-zsh

ZSH_CUSTOM=$HOME/.zsh
ZSH_THEME="devxom"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git, git-flow)
#  zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

# User configuration
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$HOME/.zsh/history

setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt EXTENDED_HISTORY
setopt notify
setopt correct

if [[ "${USER}" == "root" ]]; then
  userStyle="${red}";
else
  userStyle="${orange}";
fi;

if [[ "${SSH_TTY}" ]]; then
  hostStyle="${bold}${red}";
else
  hostStyle="${yellow}";
fi;

for r in $HOME/.zsh/*.zsh; do
  if [[ $DEBUG > 0 ]]; then
    echo "zsh: sourcing $r"
  fi
  source $r
done

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}


export NVM_DIR="/home/dhoner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

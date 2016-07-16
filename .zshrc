# Path to your oh-my-zsh installation.
export ZSH=/home/dhoner/.oh-my-zsh

ZSH_THEME="dieter"
# philips
# honukai
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

plugins=(git, git-flow, fedora, zsh-navigation-tools, systemadmin, sudo)

# User configuration
zsh_wifi_signal(){
        local signal=$(nmcli device wifi | grep yes | awk '{print $8}')
        local color='%F{yellow}'
        [[ $signal -gt 75 ]] && color='%F{green}'
        [[ $signal -lt 50 ]] && color='%F{red}'
        echo -n "%{$color%}\uf230  $signal%{%f%}" # \uf230 is 
}

export EDITOR="subl -w"

export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/dhoner/.local/bin:/home/dhoner/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

zstyle :omz:plugins:ssh-agent agent-forwarding on
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

alias ytdla='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Highlight the user name when logged in as root.
if [[ "${USER}" == "root" ]]; then
	userStyle="${red}";
else
	userStyle="${orange}";
fi;

# Highlight the hostname when connected via SSH.
if [[ "${SSH_TTY}" ]]; then
	hostStyle="${bold}${red}";
else
	hostStyle="${yellow}";
fi;

# ZSH standalone npm install autocompletion. Add this to ~/.zshrc file.
_npm_install_completion() {
  local si=$IFS

  # if 'install' or 'i ' is one of the subcommands, then...
  if [[ ${words} =~ 'install' ]] || [[ ${words} =~ 'i ' ]]; then

    # add the result of `ls ~/.npm` (npm cache) as completion options
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
      COMP_LINE=$BUFFER \
      COMP_POINT=0 \
      ls ~/.npm -- "${words[@]}" \
      2>/dev/null)
  fi

  IFS=$si
}

compdef _npm_install_completion 'npm'
## END ZSH npm install autocompletion

startup(){
  GET[1]="$(systemctl --no-legend --no-pager list-unit-files | grep -vE "static[\ ]*$")"
  systemd-analyze | awk '{print \
    "╔══════ STARTUP ══════" \
    "\n╟ firmware:  " $4 \
    "\n╟ loader:    " $7 \
    "\n╟ kernel:    " $10 \
    "\n╟ userspace: " $13 \
    "\n╟ TOTAL:     " $16 \
    "\n╚═════════════════════" \
  }'
  echo -e "\nUnit files. E:$(echo "${GET[1]}" | grep -E "enabled[\ ]*" | wc -l); D:$(echo "${GET[1]}" | grep -E "disabled[\ ]*" | wc -l)."
  systemd-analyze critical-chain --no-pager \
    | grep -E ".* \@+.* \+.*$" \
    | awk '{print $2 "\t" $3 "\t" $1}' \
    | sed -e "s|└─| - |g"
}

function f_notifyme {
  LAST_EXIT_CODE=$([ $? = 0 ] && echo terminal || echo error)
  CMD=$(fc -ln -1)
  notify-send --urgency=low -i "$CMD" "$LAST_EXIT_CODE" &
}

function server() {
    local port="${1:-8000}"
    xdg-open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

# #alias
alias g='git'
alias gi='git init && git add . && git commit -m "first commit"'
alias gc='git add -A && git commit -a'
alias op3000="xdg-open http://localhost:3000/"
alias op4567="xdg-open http://localhost:4567/"
alias op8000="xdg-open http://localhost:8000/"
alias re="source ~/.zshrc"
alias extract="tar -xvf $1 $1"
alias ls='ls -FHG'
alias ll='ls -lh'
alias la='ls -la'
alias l='ls'
alias lls='ll -Sr'
alias less='less -imJMW'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ping='ping -c 5'
alias c='clear'
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"

EIP="$(curl -s icanhazip.com)"
IIP="$(hostname -I)"

echo "Loading Aliases"

echo "-----------------------------------------"
echo "External IP:      $EIP"
echo "Internal IP:      $IIP"

echo "-----------------------------------------"

alias df='df -h'
alias du='du -h'
alias clip='xclip -sel clip'
alias static='python -m SimpleHTTPServer 8080'

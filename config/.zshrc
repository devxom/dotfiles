# Path to your oh-my-zsh installation.
  export ZSH=/home/dhoner/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, colorize, command-not-found, fabric, fedora, git-extras, github, gitignore, sublime, node, npm, nvm, sudo, copydir, cp)

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

# alias dnfl="dnf list"                       # List packages
# alias dnfli="dnf list installed"            # List installed packages
# alias dnfgl="dnf grouplist"                 # List package groups
# alias dnfmc="dnf makecache"                 # Generate metadata cache
# alias dnfp="dnf info"                       # Show package information
# alias dnfs="dnf search"                     # Search package

# alias dnfu="sudo dnf upgrade"               # Upgrade package
# alias dnfi="sudo dnf install"               # Install package
# alias dnfgi="sudo dnf groupinstall"         # Install package group
# alias dnfr="sudo dnf remove"                # Remove package
# alias dnfgr="sudo dnf groupremove"          # Remove package group
# alias dnfc="sudo dnf clean all"             # Clean cache

# Install dependencies globally
alias npmg="npm i -g "

# npm package names are lowercase
# Thus, we've used camelCase for the following aliases:

# Install and save to dependencies in your package.json
# npms is used by https://www.npmjs.com/package/npms
alias npmS="npm i -S "

# Install and save to dev-dependencies in your package.json
# npmd is used by https://github.com/dominictarr/npmd
alias npmD="npm i -D "

# Execute command from node_modules folder based on current directory
# i.e npmE gulp
alias npmE='PATH="$(npm bin)":"$PATH"'

# Check which npm modules are outdated
alias npmO="npm outdated"
export NVM_DIR="/home/dhoner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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

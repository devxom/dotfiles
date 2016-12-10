# ███████╗███████╗██╗  ██╗
# ╚══███╔╝██╔════╝██║  ██║
#   ███╔╝ ███████╗███████║
#  ███╔╝  ╚════██║██╔══██║
# ███████╗███████║██║  ██║
# ╚══════╝╚══════╝╚═╝  ╚═╝

# ================================================
# Default settings
# ================================================

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="odin"

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, zsh-autosuggestions, fedora)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# User configuration
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$HOME/.zsh/history

# for r in $HOME/.zsh/*.zsh; do
#   if [[ $DEBUG > 0 ]]; then
#     echo "zsh: sourcing $r"
#   fi
#   source $r
# done

export NVM_DIR="/home/dhoner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

LESS="-cRSx4M~#1PMFile\: ?f%F:stdin. | Line\: %lt-%lB?L/%L. ?PB(%PB\%) .| Page\: %d?L/%D."

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ================================================
# Aliases
# ================================================

# common commands
alias tree="tree -dA"
alias c="clear"
alias cls=' echo -ne "\033c"'
alias l='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='l -Sr'
alias la='ls -lha --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias hist='history | grep'
alias r="ranger"
alias t="tmux"
alias v="vim"
alias o='xdg-open'
alias e='$EDITOR'
alias die='kill -9 $$'
alias :q="exit"

# Safety features
alias md='mkdir -p -v'
alias mv='mv -i -v'
alias rm='rm -i'

# tmux
alias tls="tmux ls"
alias tnew="tmux new -s"
alias ta="tmux a"
alias tat="tmux a -t"
alias tkill="tmux kill-session -t"

# tmux session, with single quotes so PWD works
alias tses='tmux new -As $(basename $PWD | tr . -)'

# paths
alias p="cd ~/repos"
alias d="cd ~/.dotfiles"

# grep
alias -g G="| grep"
alias -g H="| head"
alias -g T="| tail"
alias grep='grep --color=auto'
alias less='less -imJMW'
alias qfind='find . -name '

# rules
alias chmod="chmod -c"
alias rw-="chmod 600"
alias rwx="chmod 700"
alias r--="chmod 644"
alias r-x="chmod 755"

# networks
alias netCons="lsof -i"                                        # Show all open TCP/IP sockets
alias flushDNS="sudo service dnsmasq restart"                  # Flush out the DNS Cache
alias lsock="sudo lsof -i -P"                                  # Display open sockets
alias lsockU="sudo lsof -nP | grep UDP"                        # Display only open UDP sockets
alias lsockT="sudo lsof -nP | grep TCP"                        # Display only open TCP sockets
alias openPorts="sudo /usr/bin/lsof -i | grep LISTEN"          # All listening connections
alias openports="ss --all --numeric --processes --ipv4 --ipv6" # All listening connections
alias showBlocked="sudo ipfw list"                             # All ipfw rules inc/blocked IPs
# alias myip='curl -s icanhazip.com'
alias ping='ping -c 5'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias op3000="o http://localhost:3000/"
alias op4567="o http://localhost:4567/"
alias op8000="o http://localhost:8000/"
alias ytdl='youtube-dl --embed-subs --embed-thumbnail'
alias ytdla='ytdl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'

# alias feh='feh -Fzrd'
alias jsc="node"
alias re="source ~/.zshrc"
alias zshconfig='e ~/.zshrc'
alias ohmyzsh="e -w ~/.oh-my-zsh"

alias g="git"
alias gc="git add -A && git commit -a"
alias gi="git init && git add . && git commit -m \"first commit\""

# alias cal="cal -3m"
alias clip="xclip -sel clip"
alias cp="cp -i"
alias da="date \"+%A, %B %d, %Y [%T]\""
alias df="df -h"
alias du="du -c -h"
alias bc="bc -q"
alias p="ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias personalmail="mutt -F ~/.mutt/devxom.rc"
alias devmail="mutt -F ~/.mutt/dev.devxom.rc"

# alias    vimsh='vim *.sh'
# alias    vimpm='vim *.pm'
# alias    vimpl='vim *.pl'
# alias     vimc='vim *.{c,h}'
# alias todo='$HOME/dev/time-spent-in-vim/vim $HOME/doc/TODO'
# alias feh='feh -q -g 1880x980 --scale-down --auto-zoom'

# ================================================
# Exports
# ================================================

export VISUAL=vim
export EDITOR="$VISUAL"
export SSH_KEY_PATH="~/.ssh/id_rsa"
# export SSH_KEY_PATH="~/.ssh/id_rsa_github"
export TERM=rxvt-unicode
export NVM_DIR="/home/dhoner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# printf "  %s\n  %s\n  %s\n" "Ilya Reshetnikov" "... ID: Reshetnikov" "devxom@gmail.com"
nvm use 7.2.1

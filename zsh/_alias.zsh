#!/usr/bin/zsh

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

# vim: set ts=2 expandtab sw=2:

#!/usr/bin/zsh

# Alias
alias -s {go,txt,cfg,c,cpp,rb,asm,nim,conf,d}=subl
alias -s {avi,mpeg,mpg,mov,m2v}=mpv
alias -s {html,htm}=google-chrome-unstable
alias -s {png,jpg,gif,svg}=feh
alias feh='feh -q -g 1880x980 --scale-down --auto-zoom'

alias jsc='node'

alias feh='feh -Fzrd'
alias :q='exit'
alias less='vimpager'
alias tree=tree -dA

alias qfind="find . -name "                      # qfind:    Quickly search for file
alias netCons='lsof -i'                          # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'         # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/bin/lsof -i -P'           # lsock:        Display open sockets
alias lsockU='sudo /usr/bin/lsof -nP | grep UDP' # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/bin/lsof -nP | grep TCP' # lsockT:       Display only open TCP sockets
# alias openPorts='sudo lsof -i | grep LISTEN'     # openPorts:    All listening connections
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias chmod='chmod -c'
alias rw-='chmod 600'
alias rwx='chmod 700'
alias r--='chmod 644'
alias r-x='chmod 755'
# alias vim='nvim'
# Safety features
alias -g G="| grep"
alias -g H="| head"
alias -g T="| tail"
alias bc='bc -q'
alias c='clear'
alias cal="cal -3m"
alias clip='xclip -sel clip'
alias cls=' echo -ne "\033c"'
alias cp='cp -i'
alias da='date "+%A, %B %d, %Y [%T]"'
alias da='date "+%A, %B %d, %Y [%T]"'
alias df='df -h'
alias du='du -c -h'
alias g='git'
alias gc='git add -A && git commit -a'
alias gi='git init && git add . && git commit -m "first commit"'
alias grep='grep --color=auto'
alias hist='history | grep'
alias hist='history | grep'
alias la='ls -lha --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias less='less -imJMW'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias lls='ll -Sr'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias mkdir='mkdir -p -v'
alias mkdir='mkdir -p'
alias mv='mv -i'
# alias myip='curl -s icanhazip.com'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias o='xdg-open'
alias ohmyzsh="subl -w ~/.oh-my-zsh"
alias op3000="xdg-open http://localhost:3000/"
alias op4567="xdg-open http://localhost:4567/"
alias op8000="xdg-open http://localhost:8000/"
alias p='ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args'
alias ping='ping -c 5'
alias ping='ping -c 5'
alias re="source ~/.zshrc"
alias rm='rm -i'
alias ytdla='youtube-dl --extract-audio --newline --embed-thumbnail --audio-format mp3 -o "%(title)s.%(ext)s"'
alias ytdl='youtube-dl --cache-dir "~/Videos/.cache" --download-archive "~/.config/youtube-dl/archive" --print-traffic --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1" --embed-subs'

alias zshconfig='e ~/.zshrc'
alias e='$EDITOR'
alias die='kill -9 $$'

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

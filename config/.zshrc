# Path to your oh-my-zsh installation.
export ZSH=/home/dhoner/.oh-my-zsh

ZSH_THEME="devxom" # sonicradish, honukai, sunrise


HIST_STAMPS="mm/dd/yyyy"

plugins=(git, git-flow, sudo)

source $ZSH/oh-my-zsh.sh

# User configuration
HISTSIZE=4000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt COMPLETE_IN_WORD

export EDITOR="subl -w"
export PAGER='less -R'
# export VISUAL='vim'
export VTYSH_PAGER='cat'

# long date format in ls(1)
export TIME_STYLE=long-iso

# prety Less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[00;32m'


export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/dhoner/.local/bin:/home/dhoner/bin"
# export MANPATH="/usr/local/man:$MANPATH"
# prefer library/system calls/programming manuals
export MANSECT="8:3:2:3posix:3pm:3perl:1:n:l:5:4:9:6:7"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export GIT_COMMITTER_EMAIL=devxom@gmail.com
export GIT_AUTHOR_EMAIL=devxom@gmail.com

# zsh_wifi_signal(){
#   local signal=$(nmcli device wifi | grep Mbit/s | awk '{print $7}')
#   local color='\e[33m'
#   [[ $signal -gt 75 ]] && color='\e[32m'
#   [[ $signal -lt 50 ]] && color='\e[31m'
#         echo "$color \uf230  $signal %" # \uf230 is 
#       }


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
# ssh
export SSH_KEY_PATH="~/.ssh/"

zstyle :omz:plugins:ssh-agent agent-forwarding on

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
DISABLE_UNTRACKED_FILES_DIRTY="true"

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

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
   echo "'$1' is not a valid file"
fi
}

#   ---------------------------------------
#   .  WEB DEVELOPMENT
#   ---------------------------------------

httpHeaders () { /usr/bin/curl -I -L $@ ; }

#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

#      SEARCHING
#   ---------------------------------------
alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   my_ps: List processes owned by my user:
#   ---------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


# #alias
alias vim='nvim'
alias ytdla='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias g='git'
alias gi='git init && git add . && git commit -m "first commit"'
alias gc='git add -A && git commit -a'
alias op3000="xdg-open http://localhost:3000/"
alias op4567="xdg-open http://localhost:4567/"
alias op8000="xdg-open http://localhost:8000/"
alias 6='s ip -6'
alias 4='s ip -4'

alias re="source ~/.zshrc"
# alias extract="tar -xvf $1 $1"

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -la'
alias l='ll'
alias lls='ll -Sr'
alias rt='ls -hltr'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias less='less -imJMW'

alias ping='ping -c 5'
alias c='clear'
alias h='cat ~/.zsh_history | grep --text --color '
alias cal='cal -y'
alias zshconfig="subl ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias p='ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args'
alias ds='dnf search'

alias smi='sudo make install'

alias -g T="| tail"
alias -g G="| grep"
alias -g H="| head"
alias myip='curl -s icanhazip.com'
IIP="$(hostname -I)"

alias df='df -h'
alias du='du -h'
alias clip='xclip -sel clip'

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word

# Node.js nvm
[[ -d ~/.nvm ]] && source ~/.nvm/nvm.sh

export NVM_DIR="/home/dhoner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}


echo "Loading Aliases..."

# echo "-----------------------------------------"
# echo "External IP:      $EIP"
# echo "Internal IP:      $IIP"

# echo "-----------------------------------------"

#   ---------------------------
#   6.  NETWORKING
#   ---------------------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs


alias chmod='chmod -c'
alias rw-='chmod 600'
alias rwx='chmod 700'
alias r--='chmod 644'
alias r-x='chmod 755'

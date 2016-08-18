# Path to your oh-my-zsh installation.
export ZSH=/home/dhoner/.oh-my-zsh

ZSH_THEME="devxom" # sonicradish, honukai, sunrise
HIST_STAMPS="mm/dd/yyyy"

plugins=(git, git-flow, zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt   HIST_IGNORE_DUPS
setopt   INC_APPEND_HISTORY
setopt   COMPLETE_IN_WORD
setopt   CORRECT
setopt   EXTENDED_HISTORY
setopt   notify
setopt   correct

export EDITOR="subl -w"
export BROWSER="google-chrome-unstable"
export PAGER='less -R'
export VISUAL='vim'
export VTYSH_PAGER='less'
export TIME_STYLE=long-iso   # long date format in ls(1)
export PATH="/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/dhoner/.local/bin:/home/dhoner/bin"
# export MANPATH="/usr/local/man:$MANPATH"
# prefer library/system calls/programming manuals
export MANSECT="8:3:2:3posix:3pm:3perl:1:n:l:5:4:9:6:7"
# You may need to manually set your language environment
export LANG=en_US.UTF-8
export GIT_COMMITTER_EMAIL=devxom@gmail.com
export GIT_AUTHOR_EMAIL=devxom@gmail.com

# infinality (Kori)
export INFINALITY_FT_FILTER_PARAMS='25 30 40 30 25'
#export INFINALITY_FT_FILTER_PARAMS='15 25 45 25 15'
export INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH=0
export INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS=true
export INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT=0
export INFINALITY_FT_GAMMA_CORRECTION='0 100'
export INFINALITY_FT_BRIGHTNESS=0
export INFINALITY_FT_CONTRAST=0
export INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH=5
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH=0
export INFINALITY_FT_FRINGE_FILTER_STRENGTH=0
export INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH=10
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH=0
export INFINALITY_FT_STEM_FITTING_STRENGTH=25
export INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE=50
export INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS=true
export INFINALITY_FT_USE_VARIOUS_TWEAKS=true

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;40;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

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

# use incremental search
bindkey "^R" history-incremental-search-backward
# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

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

function server() {
  local port="${1:-8000}"
  xdg-open "http://localhost:${port}/"
  python -m SimpleHTTPServer "$port"
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1 C extract/   ;;
      *.tar.gz)    tar xzf $1 C extract/   ;;
      *.tar.xz)    tar xvf $1 C extract/   ;;
      *.bz2)       bunzip2 $1 C extract/   ;;
      *.rar)       unrar e $1 C extract/   ;;
      *.gz)        gunzip $1  C extract/   ;;
      *.tar)       tar xf $1  C extract/   ;;
      *.tbz2)      tar xjf $1 C extract/   ;;
      *.tgz)       tar xzf $1 C extract/   ;;
      *.zip)       unzip $1   C extract/   ;;
      *.Z)         uncompress C extract/1  ;;
      *.7z)        7z x $1    C extract/   ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
   echo "'$1' is not a valid file"
fi
}

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

ggr() {
  query=""
  for q in $@
  do
    query="${query}${q}+"
  done
  xdg-open "http://encrypted.google.com/search?q=${query}"
}

gmail() { xdg-open "https://mail.google.com/mail/#inbox"; }

ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory

ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string

ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

yt() {
    IFS='&' read -r URL LIST <<< "$@"
    mpv $(youtube-dl -g "$URL")
}

note() {
    case $@ in
        "-e") vim ~/.note;;
          "") cat ~/.note|less;;
           *) echo -e "$@\n" >> ~/.note
              echo -e "\033[0;37m\"$@\" \033[1;30madded to your notes.\033[0m\n";;
    esac
}

secrets() {
    if [ ! -f ~/.secrets ]; then touch ~/.secrets; fi
    case $@ in
        "-e") cat ~/.secrets|xxd -r -p|base64 -d > ~/secrets.open; rm -f ~/.secrets
              vim ~/secrets.open
              cat ~/secrets.open|base64|xxd -p -c 16 > ~/.secrets; rm -f ~/secrets.open;;
           *) cat ~/.secrets|xxd -r -p|base64 -d|less;;
    esac
}

httpHeaders () { /usr/bin/curl -I -L $@ ; }

httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

# creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
# create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

function shred {
    mv "$@" /dev/null
}

function f_notifyme {
  LAST_EXIT_CODE=$([ $? = 0 ] && echo terminal || echo error)
  CMD=$(fc -ln -1)
  notify-send --urgency=low -i "$CMD" "$LAST_EXIT_CODE" &
}

# thx https://github.com/anmoljagetia/dotfiles/blob/master/bash/bashrc#L116
colorTerminal () {
    # echo ""
    #black
    echo -e "\e[0;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 01 0;30m"
    #red
    echo -e "\e[0;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 02 0;31m"
    #green
    echo -e "\e[0;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 03 0;32m"
    #yellow
    echo -e "\e[0;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 04 0;33m"
    #blue
    echo -e "\e[0;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 05 0;34m"
    #purple
    echo -e "\e[0;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 06 0;35m"
    #cyan
    echo -e "\e[0;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 07 0;36m"
    #white
    echo -e "\e[0;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 08 0;37m"
    echo ""
    #black
    echo -e "\e[1;30m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 09 1;30m"
    #red
    echo -e "\e[1;31m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 10 1;31m"
    #green
    echo -e "\e[1;32m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 11 1;32m"
    #yellow
    echo -e "\e[1;33m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 12 1;33m"
    #blue
    echo -e "\e[1;34m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 13 1;34m"
    #purple
    echo -e "\e[1;35m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 14 1;35m"
    #cyan
    echo -e "\e[1;36m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 15 1;36m"
    #white
    echo -e "\e[1;37m ███ *** AaBbCs ---  ███ \\e[0m   ---> Color 16 1;37m"
    echo ""
    echo -e "\e[0;30m█████\\e[0m\e[0;31m█████\\e[0m\e[0;32m█████\\e[0m\e[0;33m█████\\e[0m\e[0;34m█████\\e[0m\e[0;35m█████\\e[0m\e[0;36m█████\\e[0m\e[0;37m█████\\e[0m"
    echo -e "\e[0m\e[1;30m█████\\e[0m\e[1;31m█████\\e[0m\e[1;32m█████\\e[0m\e[1;33m█████\\e[0m\e[1;34m█████\\e[0m\e[1;35m█████\\e[0m\e[1;36m█████\\e[0m\e[1;37m█████\\e[0m"
}

# Alias
alias -s {go,txt,cfg,c,cpp,rb,asm,nim,conf,d}=subl3
alias -s {avi,mpeg,mpg,mov,m2v}=mpv
alias -s {html,htm}=chromium
alias -s {png,jpg,gif,svg}=feh
alias feh='feh -q -g 1880x980 --scale-down --auto-zoom'

alias qfind="find . -name "                 # qfind:    Quickly search for file
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/bin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/bin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/bin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
# alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
# alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias chmod='chmod -c'
alias rw-='chmod 600'
alias rwx='chmod 700'
alias r--='chmod 644'
alias r-x='chmod 755'
#alias vim='nvim'
alias ytdla='youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s"'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias g='git'
alias gi='git init && git add . && git commit -m "first commit"'
alias gc='git add -A && git commit -a'
alias op3000="xdg-open http://localhost:3000/"
alias op4567="xdg-open http://localhost:4567/"
alias op8000="xdg-open http://localhost:8000/"
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -lha --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias lls='ll -Sr'
# Safety features
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls=' echo -ne "\033c"'
alias c='clear'
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias less='less -imJMW'
alias ping='ping -c 5'
alias re="source ~/.zshrc"
alias zshconfig="subl -w ~/.zshrc"
alias ohmyzsh="subl -w ~/.oh-my-zsh"
alias p='ps -A f -o user:12,pid,priority,ni,pcpu,pmem,args'
alias -g T="| tail"
alias -g G="| grep"
alias -g H="| head"
alias myip='curl -s icanhazip.com'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias ping='ping -c 5'
alias bc='bc -q'
alias cal="cal -3m"
alias clip='xclip -sel clip'
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep'

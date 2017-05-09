#!/usr/bin/zsh

# ================================================
# Functions
# ================================================

function server() {
  local port="${1:-8000}"
  xdg-open "http://localhost:${port}/"
  python -m SimpleHTTPServer "$port"
}


function extract() {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1    ;;
          *.tar.gz)    tar xzf $1    ;;
          *.tar.xz)    tar xJf $1    ;;
          *.bz2)       bunzip2 $1    ;;
          *.rar)       rar x $1      ;;
          *.gz)        gunzip $1     ;;
          *.tar)       tar xf $1     ;;
          *.tbz2)      tar xjf $1    ;;
          *.tgz)       tar xzf $1    ;;
          *.zip)       unzip $1      ;;
          *.Z)         uncompress $1 ;;
          *.7z)        7z x $1       ;;
          *)           echo "'$1' cannot be extracted via extract()" ;;
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

banner () {
  echo "$(uname -o) ($(uname -sr)) $(date)"
}

todo() {
  git commit --allow-empty -m "TODO: $*"
}

# vim: set ts=2 expandtab sw=2:

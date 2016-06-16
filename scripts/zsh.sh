# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e

bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/guest/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


#If not running interactively, don't do anything
[[ $- != *i* ]] && return


# -- Variables
export EDITOR=vim
export BROWSER="firefox-nightly"

export GNUSTEP_USER_ROOT="${HOME}/GNUstep"

#AUTO_TITLE=true
# -- Window title
case $TERM in
    screen|screen*)
        preexec () {
            print -Pn "\ek${1%% *}\e\\"
        }
    ;;

    xterm*|rxvt*|urxvt*)
        precmd () {
            print -Pn "\e]0;%n %~\a"
        }
        preexec () {
            print -Pn "\e]0;%n %~ {$1}\a"
        }
    ;;
esac


# -- coloured manuals
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


# -- Dircolors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

#alias ls='ls --color -F'
#alias ll='ls --color -1h'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -lh --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -lha --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'

# Modified commands  {{{
	alias grep='grep --color=auto'
	alias more='less'
	alias df='df -h'
	alias du='du -c -h'
	alias mkdir='mkdir -p -v'
	alias ping='ping -c 5'
    alias bc='bc -q'
    alias dvtm='DVTM_TERM=rxvt dvtm -M'
    alias cal="cal -3m"
    alias mpdviz="mpdviz -iv wave"
    alias cacafire="CACA_DRIVER=ncurses cacafire"
    alias cacafire-old="CACA_DRIVER=ncurses cacafire-old"
    alias cacademo="CACA_DRIVER=ncurses cacademo"
    alias cacaball="CACA_DRIVER=ncurses cacaball"
    alias cacaplas="CACA_DRIVER=ncurses cacaplas"
    alias cacamoir="CACA_DRIVER=ncurses cacamoir"
# }}}
#
## New commands  {{{
	alias da='date "+%A, %B %d, %Y [%T]"'
	alias du1='du --max-depth=1'
	alias hist='history | grep'
	alias openports='ss --all --numeric --processes --ipv4 --ipv6'
	alias sf='cls;screenfetch;~/scripts/colors-hex'
    #alias sfs='cls;sh ~/Div/screenfetch'
    alias sfs='echo "";sh ~/Div/screenfetch'
	alias scrot="scrot -e 'optipng $f'"
    alias scrotw='sh ~/scripts/scrotw'
	alias fehslide="feh -.zZD5 --keep-zoom-vp -Bblack -^feh"
	alias nightly="firefox-nightly"
	alias tsaver="sh ~/scripts/pipes.x -n 2"
    alias calc="galculator"
    alias sc="screen -S"
    alias sx="screen -x"
    alias sl="screen -ls"
    alias sd="screen -d"
    alias sr="screen -d -r"
    alias 4cdl="sh ~/scripts/4cdl"
    alias 4trips="sh ~/scripts/4trips"
    alias usrmnt="/home/guest/scripts/usrmount"
# }}}
#
## Privileged access
if [ $UID -ne 0 ]; then
	alias scat='sudo cat'
	alias svim='sudo vim'
	alias root='sudo su'
fi

#Safety features  {{{
#	alias cp='cp -i'
#	alias mv='mv -i'
#	alias rm='rm -I'
	alias cls=' echo -ne "\033c"'
#}}}

# Make errors tollerant # {{{
	alias :q=' exit'
	alias :Q=' exit'
	alias :x=' exit'
    alias quit=' exit'
	alias cd..='cd ..'
    alias vi='vim'
    alias vmi='vim'
#}}}

alias ncmpcppr='ncmpcpp -h twily'

alias fancy="sh ~/scripts/compton"
alias fortune-send="sh ~/scripts/fortune-send"

# -- Prompt/PS1
autoload -U promptinit
promptinit

autoload -U colors && colors
setopt promptsubst
setopt nonomatch

#PROMPT="%{$fg[red]%}%n%{$reset_color%} %{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%M %{$fg_no_bold[yellow]%}%~ %{$reset_color%}%# "
#RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
#export PS1="%{[38;05;0;48;05;7m%} %3~ %{[38;05;7;48;05;4m%}⮀%{[00m%}%{[38;05;8;48;05;4m%}%{[00m%}%{[38;05;4m%}⮀ %{[00m%}"

PROMPT="%{$fg_bold[grey]%}%{$reset_color%}> "
RPROMPT="%{$fg_bold[blue]%}%~%{$reset_color%}"


export PATH=$PATH:/home/twily/.gem/ruby/2.1.0/bin

#framebuffer colors
if [ "$TERM" = "linux" ]; then
    /home/guest/scripts/tty-colorize
fi


#functions
yt() {
    IFS='&' read -r URL LIST <<< "$@"
    mpv $(youtube-dl -g "$URL")
}

countdown() {
    secs=$(($1 * 60))
    while [ $secs -gt 0 ]; do
        echo -ne "Counting down from $1 minutes, \033[1;31m$secs seconds\033[0m remaining... \033[1;30m(Ctrl+C to Cancel)\033[0m\r"
        sleep 1
        : $((secs--));
    done; echo -e "\n\033[1;30m$(date)\033[1;31m Countdown has finished!\033[0m\n"
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

run_bg() {
    nohup $@ > /dev/null 2>&1 &
}

th() { resize -s $1 $COLUMNS > /dev/null }
tw()  { resize -s $LINES $1 > /dev/null }
td() {
    getwindowgeometry
    cH=$h
    resize -s $1 $COLUMNS > /dev/null
    getwindowgeometry
    nH=`expr $cH - $h`
    xdotool getactivewindow windowmove $x `expr $y + $nH - 24`
}

getwindowgeometry() {
    unset x y w h
    eval $(xwininfo -id $(xdotool getactivewindow) | 
        sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
               -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
               -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
               -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )
}

function shred {
    mv "$@" /dev/null
}

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


# Enable Zsh command highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
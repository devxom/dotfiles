#!/usr/bin/zsh
export HOSTNAME="f24-lc"
export ZSH_THEME="devxom"
# export ZSH_ACTIVE_COMPLETIONS="$( echo ${(kv)_comps[@]} )"
export EDITOR="subl"
export PAGER='less -R'
# export EDITOR=vim
# export PAGER=vimpager
# export VISUAL='vim'
export TIME_STYLE=long-iso   # long date format in ls(1)

export ARCHFLAGS="-arch x86_64"
export SSH_KEY_PATH="~/.ssh/"
export GIST_DIR=$HOME/dev/_gists/

# export GOROOT=$HOME/go
# export GOOS='linux'
# export GO_ARCH=386

export HISTFILE=$HOME/.zsh/history
export HISTSIZE=5000
export SAVEHIST=10000
export HISTIGNORE="&:ls:[bf]g:history:exit:reset:clear:cd*"

export NODE="~/.nvm/versions/node/v6.3.1/bin/"
export PATH="$HOME/dev/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/dhoner/.local/bin:/home/dhoner/bin:$NODE"
export MANPATH="$MANPATH:/usr/local/man:/opt/local/share/man"
export MANPAGER="less -X"
# export MANSECT="8:3:2:3posix:3pm:3perl:1:n:l:5:4:9:6:7"

export LANG=en_US.UTF-8
# infinality (Kori)
export INFINALITY_FT_FILTER_PARAMS='25 30 40 30 25'
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

# export LSCOLORS="Gxfxcxdxbxegedabagacad"
# export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:*.patch=00;34:*.o=00;32:*.so=01;35:*.ko=01;31:*.la=00;33'
# export GREP_COLOR='1;33'

# vim: set ts=2 expandtab sw=2:

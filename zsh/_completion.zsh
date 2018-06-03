#!/usr/bin/zsh
zstyle :omz:plugins:ssh-agent agent-forwarding on

# zstyle ':completion:*'                       accept-exact '*(N)'
# zstyle ':completion:*'                       separate-sections 'yes'
# zstyle ':completion:*'                       list-dirs-first true
# zstyle ':completion:*:default'               list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*'                       menu select=200
# zstyle ':completion:*'                       squeeze-slashes true
# zstyle ':completion:*:cd:*'                  ignore-parents parent pwd
# #zstyle ':completion:*:cd:*'                  tag-order 'named-directories'
# zstyle ':completion:*:(all-|)files'          ignored-patterns '*.un~'
# zstyle ':completion:*:*:kill:*:processes' \
#   list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' group-name            ''
zstyle ':completion:*:*:mpv:*'           tag-order files
zstyle ':completion:*:*:mpv:*'           file-patterns   \
       '*.(rmvb|mkv|mpg|wmv|mpeg|avi|flv|mp3|mp4|flac|ogg):video' \
       '*:all-files' '*(-/):directories'

# zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*:*files' \
#   ignored-patterns '*~|*.(old|bak|zwc|viminfo|rxvt-*|zcompdump)|pm_to_blib|cover_db|blib' \
#   file-sort modification
# zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' \
#   file-sort modification
# zstyle ':completion:*:*:(vim|rview|vimdiff|xxd):*' \
#   tag-order files

zstyle ':completion:*:*:(scp):*' \
  file-sort modification

zstyle ':completion:*:*:(cd):*:*files' ignored-patterns '*~' file-sort access
zstyle ':completion:*:*:(cd):*'        file-sort access
zstyle ':completion:*:*:(cd):*'        menu select
zstyle ':completion:*:*:(cd):*'        completer _history

zstyle ':completion:*:descriptions' \
  format $'%{- \e[38;5;137;1m\e[48;5;234m%}%B%d%b%{\e[m%}'
zstyle ':completion:*:warnings' \
  format $'%{No match for \e[38;5;240;1m%}%d%{\e[m%}'

zstyle ':completion:*:*:apvlv:*'             tag-order files
zstyle ':completion:*:*:apvlv:*'             file-patterns '*.pdf'

# zstyle ':completion:most-accessed-file:*' match-original both
# zstyle ':completion:most-accessed-file:*' file-sort access
# zstyle ':completion:most-accessed-file:*' file-patterns '*:all\ files'
# zstyle ':completion:most-accessed-file:*' hidden all
# zstyle ':completion:most-accessed-file:*' completer _files

#zstyle ':completion:*:options'               menu search

# ZSH npm install autocompletion.
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

go_prefixes=(5 6 8)
for p in $prefixes; do
  compctl -g "*.${p}" ${p}l
  compctl -g "*.go"   ${p}g
done
compctl -g "*.go" gofmt
compctl -g "*.go" gccgo


#zstyle ':completion:*:*:kill:*' menu yes select
#zstyle ':completion:*:kill:*'   force-list always
#zstyle ':completion:*' menu select=10 interactive list-dirs-first

# vim: set ts=2 expandtab sw=2:

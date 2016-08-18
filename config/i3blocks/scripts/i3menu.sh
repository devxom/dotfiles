#!/bin/sh

# menu icon
echo ""
# ☰  

# case $BLOCK_BUTTON in
#     1) i3-dmenu-desktop --dmenu="/usr/bin/rofi -dmenu -i -p 'apps:' -width 25 -padding 19 -yoffset -180 -xoffset 500" ;; #left click rofi
#     2) rofi-logout ;; #middle click, logout menu
#     3) rofi-s  #right click, rofi web search
# esac

mouse buttons
# Left click
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
  i3-dmenu-desktop --dmenu="/usr/bin/rofi -dmenu -i -p 'apps:' -width 25 -padding 19 -yoffset -180 -xoffset 500" ;; #left click rofi
# Middle click
elif [[ "${BLOCK_BUTTON}" -eq 2 ]]; then
  rofi-logout ;; #middle click, logout menu
# Right click
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
  rofi-s  #right click, rofi web search
fi

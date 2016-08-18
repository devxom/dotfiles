# i3blocksblocks config file
#
# Please see man i3blocksblocks for a complete reference!
# The man page is also hosted at http://vivien.github.io/i3blocksblocks
#
# List of valid properties:
#
# align
# color
# command
# full_text
# instance
# interval
# label
# min_width
# name
# separator
# separator_block_width
# short_text
# signal
# urgent

# Global properties
separator_block_width=15

[keystate]
label=
command=~/.config/i3blocks/scripts/keystate.sh
instance=caps
interval=1

# [keyboard]
# label=
# command=~/.config/i3blocks/scripts/keyboard_layout.sh
# interval=10
# signal=1

[load]
label=
command=~/.config/i3blocks/scripts/load_average.sh
interval=2

[memory]
label=
instance=mem;used
command=~/.config/i3blocks/scripts/memory.sh
interval=5

[transmission]
label=
command=~/.config/i3blocks/scripts/transmission.sh
interval=10

[mpd]
label=
command=~/.config/i3blocks/scripts/music.sh
interval=3
signal=2

# [countdown]
# instance=tomorrow 05:00:00
# label= 
# command=~/.config/i3blocks/scripts/countdown.sh
# interval=1

[vnstat]
label=
command=vnstat -d -i eno1 | grep `date +%x`|awk '{print $2 $3}'
interval=5

# [dropbox]
# label=
# command=~/.config/i3blocks/scripts/dropbox.sh
# interval=3

[gmail]
label=
command=~/.config/i3blocks/scripts/gmail.sh
interval=60

[audio]
label=
command=~/.config/i3blocks/scripts/audio.sh
interval=1

[microphone]
label=
command=~/.config/i3blocks/scripts/microphone.sh
interval=5

[webcam]
label=
command=~/.config/i3blocks/scripts/webcam.sh
interval=5

# [i3menu]
# # label=
# interval=once
# command=~/.config/i3blocks/scripts/i3menu.sh
# align=left
# min_width=14

# [time]
# label=
# command=date '+%a, %b %d, %H:%M'
# interval=10

# [google_music]
# label=
# command=~/.config/i3blocks/scripts/google_music.sh
# interval=3
# signal=2

# [ethernet]
# label=
# command=~/.config/i3blocks/scripts/ethernet.sh
# interval=3

# [wlan]
# label=
# command=~/.config/i3blocks/scripts/wlan.sh
# interval=3

# [battery]
# label=
# command=~/.config/i3blocks/scripts/battery
# interval=10

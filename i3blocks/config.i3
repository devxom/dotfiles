# i3blocks config file
# Global properties
separator_block_width=15

# [keystate]
# label=
# command=~/.config/i3blocks/scripts/keystate.sh
# instance=caps
# interval=1

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

[vnstat]
label=
command=vnstat -d -i eno1 | grep `date +%x`|awk '{print $2 $3}'
interval=5


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

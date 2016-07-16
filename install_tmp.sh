#!/bin/bash
# Init colors
# Reset
Color_off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

# utils
need_cmd () {
    if ! command -v "$1" > /dev/null 2>&1
    then printf "${Red}need '$1' (command not found)${Color_off}\n"
    fi
}

# Symlinks the configs
# Manager func
symlink () {
    TARGET=$PWD/$1
    FILE=$HOME/.$1
    if [ -e "$FILE" ]
    then
        if file $FILE | grep $PWD &> /dev/null;then
            printf "Installed $Red$FILE${Color_off}\n"
        else
            printf "Skipping $Red$FILE${Color_off}\n"
        fi
    else
        printf "Linking $Cyan$FILE${Color_off} -> $Blue$TARGET${Color_off}\n"
        ln -s "$TARGET" "$FILE"
    fi
}

# Create directorys
if [ ! -d "$HOME/.irssi/scripts/autorun" ];then
    mkdir -p ~/.irssi/scripts/autorun
fi

if [ ! -d "$HOME/.weechat" ];then
    mkdir ~/.weechat
fi

if [ ! -d "$HOME/.config" ];then
    mkdir ~/.config
fi

if [ ! -d "$HOME/.config/termite" ];then
    mkdir ~/.config/termite
fi

if [ ! -d "$HOME/.config/i3status" ];then
    mkdir ~/.config/i3status
fi

if [ $# -eq 1 ]
then
    case $1 in
        nvim)
            symlink 'config/nvim'
            exit 0
            ;;
        vim)
            if [ -e ~/.vimrc ]
            then
                mv ~/.vimrc ~/.vimrc_back
                printf "Move $Red~/.vimrc to ~/.vimrc_back$Color_off\n"
            fi
            if file ~/.vim | grep $PWD &> /dev/null;then
                printf "Installed $Red~/.vim$Color_off\n"
            else
                if [ -e ~/.vim ]
                then
                    mv ~/.vim ~/.vim_back
                    printf "Move $Red~/.vim to ~/.vim_back$Color_off\n"
                fi
                printf "Linking $Cyan~/.vim$Color_off -> $Blue$PWD/config/nvim$Color_off\n"
                ln -s $PWD/config/nvim ~/.vim
            fi
            exit 0
            ;;
        rust)
            if [ ! -e `which rustc` ]
            then
                printf "curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly\n"
                curl -sSf https://static.rust-lang.org/rustup.sh | sh -s -- --channel=nightly
            fi
            exit 0;
    esac
fi
# Install configuration
symlink 'fonts'
# mail
symlink 'mutt'
symlink 'getmail'
symlink 'muttrc'
symlink 'msmtprc'
symlink 'procmailrc'
symlink 'mailcap'
# windows manager
symlink 'config/i3/config'
symlink 'config/i3status/config'
symlink 'config/vifm'
symlink 'config/nvim'
symlink 'config/lilyterm'
# fcitx
symlink 'config/fcitx/config'
symlink 'config/fcitx/conf'
symlink 'config/fcitx/data'
symlink 'config/fcitx/pinyin/pySym.mb'
# termite
symlink 'config/termite/config'
# npm
symlink 'npmrc'
# weechat
symlink 'weechat/plugins.conf'
symlink 'weechat/weechat.conf'
symlink 'irssi/config'
symlink 'irssi/default.theme'
symlink 'profile'
symlink 'bashrc'
symlink 'bash_logout'
symlink 'bash_profile'
symlink 'gitconfig'
symlink 'gitignore'
symlink 'gtkrc-2.0'
symlink 'inputrc'
symlink 'zshrc'
symlink 'vimperatorrc'
symlink 'backgrounds'
symlink 'scripts'

if cat /etc/issue | grep Ubuntu &> /dev/null;then
    printf "$Red""Warning ""$Color_off""$Blue""This is ubuntu,and will skip xinitrc$Color_off\n"
else
    symlink 'xinitrc'
    symlink 'xprofile'
fi

if [ -e ~/.vim ]
then
    printf "Installed $Red~/.vim$Color_off\n"
else
    printf "Linking $Cyan~/.vim$Color_off -> $Blue$PWD/config/nvim$Color_off\n"
    ln -s $PWD/config/nvim ~/.vim
fi

# Install bash-git-prompt
if [ -e ~/.bash-git-prompt ]
then
    printf "Installed $Red~/.bash-git-prompt$Color_off\n"
else
    printf "$Cyan Downloading  bash-git-prompt -> $Blue$HOME/.bash-git-prompt$Color_off\n"
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
    printf "$Blue Finished Downloading$Color_off\n"
fi
======
#!/bin/bash

# Todo - xorg.conf, saml alle .config filer osv i samme mappe, så det hele kan automatiseres. Themes/icons. Delete ZOMBPONIES, fontawesome. Infinality. Saml alt på D-drev.

echo "Installerer RPMFusion"
sleep 5
cd ~/Downloads/
wget http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-21.noarch.rpm
wget http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-21.noarch.rpm
sudo rpm -i rpmfusion-free-release-21.noarch.rpm rpmfusion-nonfree-release-21.noarch.rpm
sudo dnf -y update

echo "Installerer Nvidia-driver"
sleep 5
sudo dnf -y install akmod-nvidia "kernel-devel-uname-r == $(uname -r)"
sudo dnf -y install xorg-x11-drv-nvidia.x86_64 xorg-x11-drv-nvidia-cuda.x86_64 xorg-x11-drv-nvidia-kmodsrc.x86_64 xorg-x11-drv-nvidia-libs.i686 xorg-x11-drv-nvidia-libs.x86_64 xorg-x11-drv-nvidia-libs.x86_64

echo "Fjerner linuxkernen + nvidia fra opdateringslisten"
sleep 5
sudo echo "exclude=kernel* *nvidia" >> /etc/yum.conf

#echo "Opdater hostname"
#sleep 5
#echo "Bragi" > /etc/hostname

echo "Installerer depedencies"
sleep 5
sudo dnf -y install icedtea-web p7zip zip unzip i3 xfce4-notifyd xfce4-volumed numlockx redshift nitrogen lxappearance file-roller scrot libXinerama-devel libXft-devel ruby ruby-ronn ruby-devel rubygem-ronn xcb-util-keysyms-devel pango-devel xcb-util-devel xcb-util-cursor-devel xcb-util-renderutil-devel xcb-util-wm-devel yajl-devel startup-notification-devel pcre-devel libev-devel cmake clang gcc-c++ xdotool xfce4-terminal xprop asciidoc libXcomposite-devel libXrandr-devel libconfig-devel dbus-devel lm_sensors firefox hexchat thunar thunar-archive-plugin thunar-volman vim zsh gtk-murrine-engine
sudo gem install --no-ri --no-rdoc wombat

echo "Installer i3gaps og accesories"
sleep 5
cd ~/Downloads/

git clone https://github.com/vivien/i3blocks.git
cd i3blocks/
sudo make clean
sudo make install

cd ~/Downloads/

git clone https://github.com/Airblader/i3.git
cd i3
make
sudo make install

cd ~/Downloads/

git clone https://github.com/enkore/j4-dmenu-desktop.git
cd j4-dmenu-desktop
cmake .
sudo make install

cd ~/Downloads/

wget https://bitbucket.org/melek/dmenu2/downloads/dmenu2-0.2.tar.gz
tar -xf dmenu2-0.2.tar.gz
cd dmenu2-0.2/
sudo make clean install

cd ~/Downloads/

git clone https://github.com/chjj/compton.git
cd compton
make
make docs
sudo make install

cd

cd .i3/scripts
sudo chmod +x *

cd

cd Bin
sudo chmod +x *

echo "Ordner fstab."
sleep 5
sudo mkdir /media/WinD
sudo echo "/dev/sdb1 /media/WinD ntfs-3g defaults 0 0" >> /etc/fstab

echo "Installerer Flash"
sleep 5
sudo rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
sudo dnf -y update
yum install flash-plugin nspluginwrapper alsa-plugins-pulseaudio libcurl

echo "Installerer Wine+OpenMW, fjerner bloatware."
sleep 5
sudo dnf -y install wine openmw xboxdrv
sudo dnf -y remove nautilus rhythmbox gedit evolution shotwell

echo "Installerer nu Dropbox. Kopier efterfølgende xorg.conf fra Dropbox til /etc/X11/xorg.conf. Installer efterfølgende infinality"

cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
/.dropbox-dist/dropboxd

echo "Færdig. Genstart efter dette."


#!/bin/bash

echo -e "[mongodb-org-3.3]
name=MongoDB Repository
baseurl=http://repo.mongodb.org/yum/redhat/7/mongodb-org/3.3/x86_64/
gpgcheck=0
enabled=1
sudo chkconfig mongod on" >> /etc/yum.repos.d/mongodb.repo

sudo dnf install -y mongodb-org

## LaTeX
# dnf -y groups install "Authoring and Publishing"
# dnf -y install texstudio vim-latex texlive-collection-langcyrillic texlive-t2 texlive-cm-super texlive-textgreek texlive-langcode

## docker
# curl -sSL https://get.docker.com/ | sh

## Disable SELinux
# sed -i '/^SELINUX=/s/enforcing/disabled/' /etc/selinux/config

# Spotify
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo

dnf -y install spotify-client

# Sublime Text 3 
CACHEDIR="/var/cache/fedy/sublimetext"

if [[ "$(uname -m)" = "x86_64" ]]; then
	ARCH="x64"
else
	ARCH="x32"
fi

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL="http://download.sublimetext.com/$(wget http://www.sublimetext.com/3 -O - | grep -Po sublime_text_3_build_[0-9]{4}_$ARCH.tar.bz2)"
FILE=${URL##*/}

wget -c "$URL" -O "$FILE"

if [[ ! -f "$FILE" ]]; then
	exit 1
fi

tar -xjf "$FILE"

if [[ ! -d "sublime_text_3" ]]; then
	exit 1
fi

rm -rf "/opt/sublime_text_3/"
cp -af "$CACHEDIR/sublime_text_3" "/opt/"

for dir in /opt/sublime_text_3/Icon/*; do
    size="${dir##*/}"
    xdg-icon-resource install --novendor --size "${size/x*}" "$dir/sublime-text.png" "sublime-text"
done

gtk-update-icon-cache -f -t /usr/share/icons/hicolor

ln -sf "/opt/sublime_text_3/sublime_text" "/usr/bin/subl"

cat <<EOF | tee /usr/share/applications/sublime-text-3.desktop
[Desktop Entry]
Name=Sublime Text 3
GenericName=Text Editor
Icon=sublime-text
Comment=Sophisticated text editor \for code, markup and prose
Exec=subl %F
MimeType=text/plain;
Terminal=false
Type=Application
StartupNotify=true
Categories=Development;Utility;TextEditor;
Keywords=Text;Editor;
EOF

# Telegram

dnf copr -y enable rommon/telegram

dnf -y install telegram-desktop

#fontconfig
run-as-root dnf -y --setopt clean_requirements_on_remove=1 erase fedy-font-config

gsettings reset org.gnome.settings-daemon.plugins.xsettings antialiasing
gsettings reset org.gnome.settings-daemon.plugins.xsettings hinting

# MS Fonts
dnf -y install curl cabextract xorg-x11-font-utils fontconfig
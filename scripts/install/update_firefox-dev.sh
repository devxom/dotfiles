#!/bin/sh

# Firefox Developer Edition install
# Based https://gist.github.com/grenade/3b3c5b17586881d01142
#  $ curl -L https://git.io/vo0ow | sh

START_CMD="firefox"
INSTALLATION_DIR="/opt/firefox-dev"

# Detect the architecture
if [ "$(uname -m)" = "x86_64" ]; then
  ARCHITECTURE="x86_64"
else
  ARCHITECTURE="i686"
fi

# Set the locale
LOCALE=en-GB

# Detect the latest build version
BUILD=$(echo $(curl -S https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora-l10n/linux-$ARCHITECTURE/xpi/) | sed -r "s/.*firefox-([0-9\.a]+)\.$LOCALE\.langpack\.xpi.*/\1/")

URL="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora-l10n/firefox-$BUILD.$LOCALE.linux-$ARCHITECTURE.tar.bz2"

# Download the tarball, unpack and install
curl -o $HOME/$START_CMD.tar.bz2 $URL
if tar -xf $HOME/$START_CMD.tar.bz2 --directory=$HOME; then
  echo "Create an application launcher file based on the regular firefox launcher"
  cat /usr/share/applications/firefox.desktop | sed -r 's/Name=Firefox/Name=Firefox Developer Edition/g' | sed -r 's/Exec=firefox %u/Exec=ffd %u/g' | sed -r "s/Icon=firefox/Icon=$(echo $INSTALLATION_DIR | sed -r 's/\//\\\//g')\/browser\/icons\/mozicon128.png/g" > $HOME/firefox/firefox.desktop

  echo "Remove the installation folder and the symlink, they might already exist"
  sudo rm -rf $INSTALLATION_DIR /bin/$START_CMD
  sudo mv $HOME/firefox $INSTALLATION_DIR
  sudo ln -s $INSTALLATION_DIR/firefox /bin/$START_CMD
fi
rm $HOME/$START_CMD.tar.bz2

echo "Add firefox to applications list"
sudo ln -s $INSTALLATION_DIR/firefox.desktop /usr/share/applications/$START_CMD.desktop

echo ""
echo "Firefox Developer Edition installed successfully!"
echo "Version Mozila Firefox Developer Edition $BUILD($LOCALE)"
echo "Architecture Linux-$ARCHITECTURE"
echo "Destination $INSTALLATION_DIR"
echo "Run with: $START_CMD"
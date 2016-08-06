#!/bin/sh

usage()
{
    echo "bootstrap a new system for development"
    echo "Supporting:"
    echo " Ubuntu"
    echo ""
    echo "./bootstrap.sh"
    echo "\t-h --help"
    echo "\t--docker"
    echo "\t--etcd"
    echo "\t--gcloud"
    echo "\t--golang"
    echo "\t--kubernetes"
    echo "\t--mongodb"
    echo "\t--mysql"
    echo "\t--neovim"
    echo "\t--nodejs"
    echo "\t--redis"
    echo "\t--rethinkdb"
    echo "\t--skip-system-install"
    echo "\t--vagrant"
    echo "\t--x11"
    echo ""
}

install()
{
  DISTRO=`cat /etc/lsb-release | head -n 1 | awk 'BEGIN {FS="="} {print $2}'`
  case "${DISTRO}" in
      Ubuntu) ubuntuInstall
    ;; 
      *) echo "Unsupported bootstrap system ${DISTRO}"
    exit 1
    ;;
  esac
}

ubuntuInstall()  
{
    echo "Ubuntu install"
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install vcsh mr neovim git zsh curl git build-essential \
      libssl-dev ssh python-pip zsh silversearcher-ag cmake python2.7-dev \
      figlet weechat wget mongodb-clients redis-tools mysql-client ctags \
      taskwarrior jq ngrep dstat multitail mtr lynx
    if [ $NODEJS = yes ]; then
      curl https://raw.githubusercontent.com/creationix/nvm/v0.24.0/install.sh | bash
      source ~/.nvm/nvm.sh
        nvm install stable 
        pip install neovim
    fi
    if [ $VAGRANT = yes ]; then
      sudo apt-get install vagrant
      sudo vagrant plugin install vagrant-triggers
    fi
    if [ $DOCKER = yes ]; then
      wget -q0 https://get.docker.com/ | bash
    fi
    if [ $GOLANG = yes ]; then
			  sudo apt-get install bzr subversion mercurial
        wget https://storage.googleapis.com/golang/go1.5.1.linux-amd64.tar.gz
        tar -C ~/ -xzf /tmp/go1.5.1.linux-amd64.tar.gz
    fi
    if [ $ETCD = yes ]; then
      curl -L  https://github.com/coreos/etcd/releases/download/v2.1.0-rc.0/etcd-v2.1.0-rc.0-linux-amd64.tar.gz -o etcd-v2.1.0-rc.0-linux-amd64.tar.gz
      tar xzvf etcd-v2.1.0-rc.0-linux-amd64.tar.gz
      cd etcd-v2.1.0-rc.0-linux-amd64
      cp etcdctl ~/bin
      cp etcd ~/bin
    fi
    if [ $KUBERNETES = yes ]; then
      curl -sS https://get.k8s.io | bash
    fi
    if [ $GCLOUD = yes ]; then
      curl https://sdk.cloud.google.com | bash
    fi
    if [ $RETHINKDB = yes ]; then
      source /etc/lsb-release && echo "deb http://download.rethinkdb.com/apt $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
      wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | sudo apt-key add -
      sudo apt-get update
      sudo apt-get install rethinkdb
    fi
    if [ $X11 = yes ]; then
       wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
       sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
       sudo apt-get --allow-unauthenticated install sur5r-keyring 
       sudo apt-get update
       sudo apt-get install i3 conky acpi xbacklight google-chrome-stable
       sudo mkdir -p /usr/share/fonts/truetype/font-install
       mkdir -p ~/fonts
       cd ~/fonts
       wget -q https://github.com/chrissimpkins/Hack/releases/download/v2.010/Hack-v2_010-ttf.zip
       unzip Hack*ttf.zip
       ~/bin/font-install
    fi
    if [ $DEIS = yes ]; then
      curl -sSL http://deis.io/deis-cli/install.sh | sh
      mv deis ~/bin
    fi
    if [ $AWS = yes ]; then
      sudo pip install awscli
    fi
    if [ $MYSQL = yes ]; then
      sudo apt-get install mysql 
    fi
    if [ $REDIS = yes ]; then
      sudo apt-get install redis 
    fi
    if [ $MONGODB = yes ]; then
      sudo apt-get install mongodb 
    fi
    if [ $RUBY = yes ]; then
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        curl -sSL https://get.rvm.io | bash -s stable --ruby
        source ~/.rvm/scripts/rvm
        rvm install ruby-2.2.1
        rvm use ruby-2.2.1 --default
        rvm user gemsets
    fi
}

# NeoVim Setup
neoVim()
{
    pip install --user neovim

    curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall 
		cd ~/.nvim/plugged/YouCompleteMe
		./install.sh --clang-completer --gocode-completer
}

SKIP="no"
AWS="no"
DEIS="no"
DOCKER="no"
ETCD="no"
GCLOUD="no"
GOLANG="no"
KUBERNETES="no"
MYSQL="no"
MONGODB="no" 
NEOVIM="no"
NODEJS="no"
REDIS="no"
RETHINKDB="no"
RUBY="no" 
VAGRANT="no"
X11="no"
while [ "$1" != "" ]; do
    PARAM=`echo $1 | awk -F= '{print $1}'`
    VALUE=`echo $1 | awk -F= '{print $2}'`
    case $PARAM in
        -h | --help)
            usage
            exit
            ;;
        --skip-system-install)
            SKIP="yes" 
            ;;
        --golang)
            GOLANG="yes" 
            ;;
        --gcloud)
            GCLOUD="yes" 
            ;;
        --docker)
            DOCKER="yes" 
            ;;
        --kubernetes)
            DOCKER="yes" 
            GOLANG="yes" 
            ETCD="yes"
            ;;
        --deis)
            DEIS="yes"
            ETCD="yes"
            DOCKER="yes"
            ;;
        --etcd)
            ETCD="yes" 
            DOCKER="yes" 
            ;;
        --nodejs)
            NODEJS="yes"
            ;;
        --vagrant)
            VAGRANT="yes"
            ;;
        --rethinkdb)
            RETHINKDB="yes"
            ;;
        --ruby)
            RUBY="yes"
            ;;
        --x11)
            X11="yes"
            ;;
        --aws)
            AWS="yes"
            ;;
        --mongodb)
            MONGODB="yes"
            ;;
        --redis)
            REDIS="yes"
            ;;
        --mysql)
            MYSQL="yes"
            ;;
        --neovim)
            NEOVIM="yes"
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done


if [ $SKIP = no ]; then
  install
fi
if [ $NEOVIM = yes ]; then
  neoVim
fi

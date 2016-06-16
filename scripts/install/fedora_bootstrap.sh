#!/bin/sh
dnf upgrade

# RPMFusion (http://rpmfusion.org/Configuration/)
dnf install --nogpgcheck \
    http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

su -c 'dnf copr enable alunux/zeal'

echo -e "[google-chrome-unstable]
name=google-chrome-unstable
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub" >> /etc/yum.repos.d/google-chrome-unstable.repo

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash
sudo chsh -s $(which zsh) $(whoami)

curl -sL https://rpm.nodesource.com/setup_6.x | bash -

dnf groupinstall "Development Tools"
dnf install $(grep fedora_packages.txt -v -e '^#' -e '^$' | tr '\n' ' ')
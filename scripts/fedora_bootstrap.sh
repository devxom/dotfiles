#!/bin/sh

dnf upgrade

dnf install --nogpgcheck \
    http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf groupinstall "Development Tools"
dnf install $(grep fedora_packages.txt -v -e '^#' -e '^$' | tr '\n' ' ')
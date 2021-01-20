#!/bin/bash
#install kernel module for Anbox for ubuntu versions < 19.04
add-apt-repository ppa:morphis/anbox-support
apt update
apt install -y linux-headers-generic anbox-modules-dkms
modprobe ashmem_linux
modprobe binder_linux

#install Anbox software
snap install --devmode --beta anbox

#for installing playstore
apt install -y wget curl lzip tar unzip squashfs-tools
wget https://raw.githubusercontent.com/geeks-r-us/anbox-playstore-installer/master/install-playstore.sh
chmod +x install-playstore.sh

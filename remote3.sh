#!/bin/bash
apt update
####tasksel install ubuntu-desktop
apt --reinstall install gnome-terminal
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
apt -y install  ~/google-chrome-stable_current_amd64.deb ~/chrome-remote-desktop_current_amd64.deb

cat <<EOF >/etc/default/apport
# set this to 0 to disable apport, or to 1 to enable it
# you can temporarily override this with
# sudo service apport start force_start=1
enabled=0
EOF

cat <<EOF >/etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

cat <<EOF >/etc/polkit-1/localauthority/50-local.d/46-allow-update-repo.pkl
[Allow Package Management all Users]
Identity=unix-user:*
Action=org.freedesktop.packagekit.system-sources-refresh
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF

#!/bin/bash
apt update
####tasksel install ubuntu-desktop
apt --reinstall install gnome-terminal
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
apt -y install  /home/user1/google-chrome-stable_current_amd64.deb /home/user1/chrome-remote-desktop_current_amd64.deb

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

cat <<EOF >/etc/gdm3/custom.conf
# GDM configuration storage
#
# See /usr/share/gdm/gdm.schemas for a list of available options.

[daemon]
# Uncoment the line below to force the login screen to use Xorg
#WaylandEnable=false

# Enabling automatic login
  AutomaticLoginEnable = true
  AutomaticLogin = user1

# Enabling timed login
#  TimedLoginEnable = true
#  TimedLogin = user1
#  TimedLoginDelay = 10

[security]

[xdmcp]

[chooser]

[debug]
# Uncomment the line below to turn on debugging
# More verbose logs
# Additionally lets the X server dump core if it crashes
#Enable=true
EOF

su user1 -l -c "gsettings set org.gnome.desktop.screensaver lock-enabled false"
# -l --login is crucial, it login as user1 and -c lets execute command 
apt install language-pack-ja libreoffice-help-ja gnome-user-docs-ja language-pack-gnome-ja thunderbird-locale-ja mozc-utils-gui firefox-locale-ja ibus-mozc fonts-noto-cjk-extra libreoffice-l10n-ja gnome-getting-started-docs-ja

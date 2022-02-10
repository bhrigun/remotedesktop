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

su user1 -l -c "gsettings set org.gnome.desktop.screensaver lock-enabled false"
su user1 -l -c "gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'"
# -l --login is crucial, it login as user1 and -c lets execute command 
#apt -y install language-pack-ja libreoffice-help-ja gnome-user-docs-ja language-pack-gnome-ja thunderbird-locale-ja mozc-utils-gui firefox-locale-ja ibus-mozc fonts-noto-cjk-extra libreoffice-l10n-ja gnome-getting-started-docs-ja

apt -y install language-pack-ja libreoffice-help-ja gnome-user-docs-ja language-pack-gnome-ja thunderbird-locale-ja mozc-utils-gui firefox-locale-ja ibus-mozc fonts-noto-cjk-extra libreoffice-l10n-ja gnome-getting-started-docs-ja hunspell-en-ca thunderbird-locale-en-us wbritish libreoffice-l10n-en-gb mythes-en-au language-pack-gnome-en libreoffice-help-en-us hyphen-en-gb hyphen-en-us hunspell-en-za mythes-en-us hyphen-en-ca hunspell-en-au libreoffice-help-en-gb language-pack-en hunspell-en-gb thunderbird-locale-en-gb firefox-locale-en libreoffice-l10n-en-za thunderbird-locale-en



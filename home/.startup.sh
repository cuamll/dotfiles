#!/bin/zsh
rfkill block bluetooth
git config --global credential.helper cache
syndaemon -i 1 -K -d
exit

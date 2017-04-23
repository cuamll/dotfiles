#!/bin/bash
git config --global credential.helper cache
# syndaemon -i 1 -K -d
conky -c ~/.conky/conkyrc1 &
conky -c ~/.conky/conkyrc2 &
conky -c ~/.conky/conkyrc3 &
exit

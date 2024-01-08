#!/bin/sh

#pkill bspwm
#pkill picom
#bspc quit

#bspwm &

# lower panels. desktop must be underneath everything else
xdo lower -n plasmashell
xdo raise -n plasmashell
xdo lower -n plasmashell
xdo lower -n plasmashell -a Desktop

# bspwm root prevents clicking on desktop icons/panels when focus_follows_mouse is active (?)
# it should be either lowered or hidden
xdo hide -N Bspwm

# try to hide 'get new widgets' panel glitch (if you're lucky with grep :) )
xdo id -n plasmashell | while read -r id; do xprop -id "$id" | grep 'size: 20' && xdo hide "$id"; done

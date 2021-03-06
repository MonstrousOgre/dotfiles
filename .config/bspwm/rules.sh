#!/usr/bin/zsh

wid=$1
class=$2
instance=$3
title=$(xwininfo -id $wid | sed -n '2p' | cut -d\" -f2)

# fix vlc control window not showing up in fullscreen
if [[ $instance = "vlc" && $title = "vlc" ]]; then
    echo layer=above border=off
fi

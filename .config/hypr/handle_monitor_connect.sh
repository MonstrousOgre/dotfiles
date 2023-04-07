#!/bin/sh

function handle {
  if [[ ${1:0:12} == "monitoradded" ]]; then
    hyprctl dispatch moveworkspacetomonitor 1 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 2 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 3 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 4 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 5 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 6 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 7 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 8 HDMI-A-1
    hyprctl dispatch moveworkspacetomonitor 9 HDMI-A-1
    #hyprctl keyword wsbind 1,HDMI-A-1
    #echo "Working?"
  fi
  if [[ ${1:0:12} == "monitorremoved" ]]; then
    hyprctl dispatch moveworkspacetomonitor 1 eDP-1
    hyprctl dispatch moveworkspacetomonitor 2 eDP-1
    hyprctl dispatch moveworkspacetomonitor 3 eDP-1
    hyprctl dispatch moveworkspacetomonitor 4 eDP-1
    hyprctl dispatch moveworkspacetomonitor 5 eDP-1
    hyprctl dispatch moveworkspacetomonitor 6 eDP-1
    hyprctl dispatch moveworkspacetomonitor 7 eDP-1
    hyprctl dispatch moveworkspacetomonitor 8 eDP-1
    hyprctl dispatch moveworkspacetomonitor 9 eDP-1
    (hyprpaper &)
  fi
}

socat - UNIX-CONNECT:/tmp/hypr/$(echo $HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | while read line; do handle $line; done

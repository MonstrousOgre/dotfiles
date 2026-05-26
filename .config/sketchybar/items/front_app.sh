#!/bin/sh

sketchybar --add item front_app center                             \
           --set front_app       script="$PLUGIN_DIR/front_app.sh" \
                                 label.font="SF Pro:Bold:15.0"     \
                                 icon.drawing=off                  \
           --subscribe front_app front_app_switched

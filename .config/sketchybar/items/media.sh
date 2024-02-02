#!/bin/bash

sketchybar --add item media left \
           --set media label.max_chars=80 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=􀑪             \
                       background.drawing=off \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change

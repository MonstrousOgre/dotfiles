#!/bin/sh

##### Adding Mission Control Space Indicators #####
# Now we add some mission control spaces:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item
# to indicate active and available mission control spaces

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
# SPACE_ICONS=("􀪏" "􀵲" "􀤙" "􀈖" "􀆪" "􀌥" "7" "􀊚" "􀑪" "􀙗")

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  sketchybar --add space space.$sid left                                 \
             --set space.$sid space=$sid                                 \
                              icon=${SPACE_ICONS[i]}                     \
                              background.color=0xffc84646                \
                              background.corner_radius=5                 \
                              background.height=20                       \
                              background.drawing=off                     \
                              label.drawing=off                          \
                              script="$PLUGIN_DIR/space.sh"              \
                              click_script="yabai -m space --focus $sid"
done



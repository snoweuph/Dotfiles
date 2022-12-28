#!/bin/bash

RICE_CAVA_PATH=$RICE_DIR_CONFIG/cava

echo "# $RICE_GENERATED_HEADER

[output]
method = ncurses
[color]
gradient = 1
gradient_count = 8
gradient_color_1 = '$RICE_COLOR_BLUE'
gradient_color_2 = '$RICE_COLOR_LIGHT_BLUE'
gradient_color_3 = '$RICE_COLOR_CYAN'
gradient_color_4 = '$RICE_COLOR_GREEN'
gradient_color_5 = '$RICE_COLOR_LIME'
gradient_color_6 = '$RICE_COLOR_YELLOW'
gradient_color_7 = '$RICE_COLOR_ORANGE'
gradient_color_8 = '$RICE_COLOR_RED'
" > $RICE_CAVA_PATH/config

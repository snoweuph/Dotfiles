#!/bin/bash

RICE_ALACRITTY_PATH=$RICE_DIR_CONFIG/alacritty
RICE_ALACRITTY_DIR_CONFIG=$RICE_ALACRITTY_PATH/config

echo "# $RICE_GENERATED_HEADER
#Import  Config
import:
  - $RICE_ALACRITTY_DIR_CONFIG/colors.nogit.yml
  - $RICE_ALACRITTY_DIR_CONFIG/fonts.nogit.yml
  - $RICE_ALACRITTY_DIR_CONFIG/styling.nogit.yml
" >  $RICE_ALACRITTY_PATH/alacritty.yml

# Generate colors.yml
echo "# $RICE_GENERATED_HEADER
colors:
  primary:
    background: '$RICE_COLOR_DARK_4'
    foreground: '$RICE_COLOR_LIGHT_1'
  normal:
    white: '$RICE_COLOR_LIGHT_1'
    black: '$RICE_COLOR_DARK_4'
    red: '$RICE_COLOR_RED'
    yellow: '$RICE_COLOR_ORANGE'
    green: '$RICE_COLOR_GREEN'
    cyan: '$RICE_COLOR_CYAN'
    blue: '$RICE_COLOR_BLUE'
    magenta: '$RICE_COLOR_PURPLE'
  bright:
    white: '$RICE_COLOR_LIGHT_3'
    black: '$RICE_COLOR_DARK_2'
    yellow: '$RICE_COLOR_YELLOW'
    green: '$RICE_COLOR_LIME'
    blue: '$RICE_COLOR_LIGHT_BLUE'
    magenta: '$RICE_COLOR_MAGENTA'

" > $RICE_ALACRITTY_DIR_CONFIG/colors.nogit.yml

# Generate fonts.yml
echo "# $RICE_GENERATED_HEADER
font:
  normal:
    family: \"$RICE_FONT_MONO\"
" > $RICE_ALACRITTY_DIR_CONFIG/fonts.nogit.yml

# Generate styling.yml
echo "# $RICE_GENERATED_HEADER
window:
  padding:
    x: $RICE_PADDING
    y: $RICE_PADDING
  opacity: $RICE_OPACITY_FLOAT
" > $RICE_ALACRITTY_DIR_CONFIG/styling.nogit.yml

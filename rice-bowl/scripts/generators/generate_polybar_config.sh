#!/bin/bash

RICE_POLYBAR_PATH=$RICE_DIR_CONFIG/polybar
RICE_POLYBAR_CONFIG_PATH=$RICE_POLYBAR_PATH/config.d
mkdir -p $RICE_POLYBAR_PATH
mkdir -p $RICE_POLYBAR_CONFIG_PATH

# Generate colors.ini
echo "# $RICE_GENERATED_HEADER
[colors]
primary-background = $RICE_COLOR_DARK_3
secondary-background = $RICE_COLOR_DARK_1

primary-accent = $RICE_COLOR_PRIMARY_ACCENT
secondary-accent = $RICE_COLOR_SECONDARY_ACCENT
tertiary-accent = $RICE_COLOR_TERTIARY_ACCENT

white = $RICE_COLOR_LIGHT_1
black = $RICE_COLOR_DARK_4
red = $RICE_COLOR_RED
orange = $RICE_COLOR_ORANGE
yellow = $RICE_COLOR_YELLOW
lime = $RICE_COLOR_LIME
green = $RICE_COLOR_GREEN
cyan = $RICE_COLOR_CYAN
light-blue = $RICE_COLOR_LIGHT_BLUE
blue = $RICE_COLOR_BLUE
purple = $RICE_COLOR_PURPLE
magenta = $RICE_COLOR_MAGENTA

warn = \${colors.orange}
alert = \${colors.red}

" > $RICE_POLYBAR_CONFIG_PATH/colors.nogit.ini

# Generate fonts.ini
echo "# $RICE_GENERATED_HEADER
[fonts]
font-small = $RICE_FONT_MONO:pixelsize=$RICE_FONT_SIZE_SMALL;4
font-normal = $RICE_FONT_MONO:pixelsize=$RICE_FONT_SIZE_NORMAL;5
font-big = $RICE_FONT_MONO:pixelsize=$RICE_FONT_SIZE_BIG;6

" > $RICE_POLYBAR_CONFIG_PATH/fonts.nogit.ini

# Generate exec.ini
echo "# $RICE_GENERATED_HEADER
[exec]
cava = $RICE_POLYBAR_PATH/scripts/cava.sh \"$RICE_COLOR_PURPLE\" \"$RICE_COLOR_BLUE\" \"$RICE_COLOR_CYAN\" \"$RICE_COLOR_GREEN\" \"$RICE_COLOR_LIME\" \"$RICE_COLOR_YELLOW\" \"$RICE_COLOR_ORANGE\" \"$RICE_COLOR_RED\"
dunst-snooze = $RICE_POLYBAR_PATH/scripts/dunst-snooze.sh \"$RICE_COLOR_SECONDARY_ACCENT\" \"$RICE_COLOR_RED\"

" > $RICE_POLYBAR_CONFIG_PATH/exec.nogit.ini

# Generate style.ini
echo "# $RICE_GENERATED_HEADER
[style]
gaps = $RICE_GAPS
border-radius = $RICE_BORDER_RADIUS

" > $RICE_POLYBAR_CONFIG_PATH/style.nogit.ini

# Generate base-settings.ini
echo "# $RICE_GENERATED_HEADER
[base/bar]

height = ${RICE_ELEMENT_HEIGHT_SMALL}pt
dpi = $RICE_DPI

monitor = \${env:MONITOR:}
locale = it_IT.UTF-8
screenchange-reload = true

width = 100%
line-size = 0pt

padding-bottom = 0
padding-left = 0
padding-right = 0

module-margin-left = 0
module-margin-right = 0

border-size = \${style.gaps}
border-bottom-size = 0

pseudo-transparency = true

radius = \${style.border-radius}

foreground = \${colors.white}
background = \${colors.primary-background}

font-0 = \${fonts.font-normal}
font-1 = \${fonts.font-big}
" > $RICE_POLYBAR_PATH/settings.nogit.ini

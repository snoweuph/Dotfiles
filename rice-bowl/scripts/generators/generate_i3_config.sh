#!/bin/bash

RICE_I3_PATH=$RICE_DIR_CONFIG/i3
RICE_I3_DIR_CONF=$RICE_I3_PATH/conf

# Generate colors.conf
echo "# $RICE_GENERATED_HEADER
set \$color_d4 \"$RICE_COLOR_DARK_4\"
set \$color_d3 \"$RICE_COLOR_DARK_3\"
set \$color_d2 \"$RICE_COLOR_DARK_2\"
set \$color_d1 \"$RICE_COLOR_DARK_1\"

set \$color_l1 \"$RICE_COLOR_LIGHT_1\"
set \$color_l2 \"$RICE_COLOR_LIGHT_2\"
set \$color_l3 \"$RICE_COLOR_LIGHT_3\"
set \$color_l4 \"$RICE_COLOR_LIGHT_4\"

set \$color_red \"$RICE_COLOR_RED\"
set \$color_orange \"$RICE_COLOR_ORANGE\"
set \$color_yellow \"$RICE_COLOR_YELLOW\"
set \$color_lime \"$RICE_COLOR_LIME\"
set \$color_green \"$RICE_COLOR_GREEN\"
set \$color_cyan \"$RICE_COLOR_CYAN\"
set \$color_light_blue \"$RICE_COLOR_LIGHT_BLUE\"
set \$color_blue \"$RICE_COLOR_BLUE\"
set \$color_purple \"$RICE_COLOR_PURPLE\"
set \$color_magenta \"$RICE_COLOR_MAGENTA\"

set \$color_accent_primary \"$RICE_COLOR_PRIMARY_ACCENT\"
set \$color_accent_secondary \"$RICE_COLOR_SECONDARY_ACCENT\"
set \$color_accent_tertiary \"$RICE_COLOR_TERTIARY_ACCENT\"
" > $RICE_I3_DIR_CONF/colors.conf

# Generate fonts.conf
echo "# $RICE_GENERATED_HEADER
set \$font_normal $RICE_FONT_NORMAL
set \$font_mono $RICE_FONT_MONO
set \$font_icons $RICE_FONT_ICONS

set \$font_size_small $RICE_FONT_SIZE_SMALL
set \$font_size_normal $RICE_FONT_SIZE_NORMAL
set \$font_size_big $RICE_FONT_SIZE_BIG

set \$font_size_icons_normal $RICE_FONT_SIZE_ICONS_NORMAL
set \$font_size_icons_big $RICE_FONT_SIZE_ICONS_BIG

" > $RICE_I3_DIR_CONF/fonts.conf

# Generate styling2.conf
echo "# $RICE_GENERATED_HEADER
set \$padding $RICE_PADDING
set \$gap_size $RICE_GAPS

set \$border_radius $RICE_BORDER_RADIUS
set \$border_size $RICE_BORDER_THICKNESS

set \$opacity $RICE_OPACITY_FLOAT
" > $RICE_I3_DIR_CONF/styling2.conf

# Generate apps2.conf
echo "# $RICE_GENERATED_HEADER

# start a terminal
bindsym \$mod+Return exec alacritty

# start rofi
bindsym \$mod+d exec --no-startup-id rofi -show drun

# open the powermenu
bindsym \$mod+Shift+e exec \"$RICE_DIR_CONFIG/scripts/powermenu.sh\"

# take a screenshot
bindsym \$mod+Shift+s exec --no-startup-id flameshot gui --clipboard --accept-on-select --path $RICE_DIR_SCREENSHOTS

# start picom
exec --no-startup-id picom -b --config $RICE_DIR_CONFIG/picom/picom.conf --experimental-backend

# start polybar
exec_always $RICE_DIR_CONFIG/polybar/launch.sh

# set wallpaper
exec --no-startup-id $RICE_DIR_CONFIG/.fehbg
" > $RICE_I3_DIR_CONF/apps2.conf

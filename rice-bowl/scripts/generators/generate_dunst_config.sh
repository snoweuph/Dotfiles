#!/bin/bash

RICE_DUNST_PATH=$RICE_DIR_CONFIG/dunst
RICE_DUNST_DIR_CONFIG=$RICE_DUNST_PATH/dunstrc.d

# Generate 00.colors.conf
echo "# $RICE_GENERATED_HEADER
[global]
    background = \"$RICE_COLOR_DARK_2\"
    foreground = \"$RICE_COLOR_LIGHT_1\"
    frame_color = \"$RICE_COLOR_SECONDARY_ACCENT\"
[urgency_low]
  	background = \"$RICE_COLOR_DARK_2\"
    foreground = \"$RICE_COLOR_LIGHT_1\"
    frame_color = \"$RICE_COLOR_SECONDARY_ACCENT\"
[urgency_normal]
    background = \"$RICE_COLOR_DARK_2\"
    foreground = \"$RICE_COLOR_LIGHT_1\"
    frame_color = \"$RICE_COLOR_PRIMARY_ACCENT\"
[urgency_critical]
    background = \"$RICE_COLOR_DARK_4\"
    foreground = \"$RICE_COLOR_RED\"
    frame_color = \"$RICE_COLOR_RED\"
" > $RICE_DUNST_DIR_CONFIG/00.colors.nogit.conf

# Generate 60.offset.conf
echo "# $RICE_GENERATED_HEADER
[global]
    offset = ${RICE_GAPS}x$(($((RICE_GAPS*2))+RICE_ELEMENT_HEIGHT_SMALL))
" > $RICE_DUNST_DIR_CONFIG/60.offset.nogit.conf

# Generate 70.size.conf
echo "# $RICE_GENERATED_HEADER
[global]
width = $((RICE_ELEMENT_HEIGHT_MEDIUM*3))
height = $((RICE_ELEMENT_HEIGHT_MEDIUM*2))

" > $RICE_DUNST_DIR_CONFIG/70.size.nogit.conf

# Generate 80.font.conf
echo "# $RICE_GENERATED_HEADER
[global]
    font = $RICE_FONT_NORMAL $RICE_FONT_SIZE_SMALL
" > $RICE_DUNST_DIR_CONFIG/80.font.nogit.conf

# Generate 99.style.conf
echo "# $RICE_GENERATED_HEADER
[global]
    gap_size = $RICE_GAPS
    corner_radius = $RICE_BORDER_RADIUS
    frame_width = $RICE_BORDER_THICKNESS
" > $RICE_DUNST_DIR_CONFIG/99.style.nogit.conf

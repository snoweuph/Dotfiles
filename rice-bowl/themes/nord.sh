#!/bin/bash

RICE_ROFI_THEME=
RICE_GTK_THEME=
RICE_QT_THEME=

# Dark Tones. 4 is Darkest, 1 is Lightest
RICE_COLOR_DARK_4=#2e3440
RICE_COLOR_DARK_3=#3b4252
RICE_COLOR_DARK_2=#434c5e
RICE_COLOR_DARK_1=#4c566a

# Light Tones. 1 is Darkest, 4 is Lightests
RICE_COLOR_LIGHT_1=#ced4de
RICE_COLOR_LIGHT_2=#d8dee9
RICE_COLOR_LIGHT_3=#e5e9f0
RICE_COLOR_LIGHT_4=#eceff4

# Accent Colors
RICE_COLOR_RED=#bf616a
RICE_COLOR_ORANGE=#d08770
RICE_COLOR_YELLOW=#ebcb8b
RICE_COLOR_LIME=#adbf7c
RICE_COLOR_GREEN=#80bf83
RICE_COLOR_CYAN=#7ebdbc
RICE_COLOR_LIGHT_BLUE=#7db0d1
RICE_COLOR_BLUE=#5e81ac
RICE_COLOR_PURPLE=#937db5
RICE_COLOR_MAGENTA=#b5779c

# Choice of Primary, Secundary and Tertiary
RICE_COLOR_PRIMARY_ACCENT=$RICE_COLOR_LIGHT_BLUE
RICE_COLOR_SECONDARY_ACCENT=$RICE_COLOR_PURPLE
RICE_COLOR_TERTIARY_ACCENT=$RICE_COLOR_BLUE

# Choice Whether this is a Dark or Light Theme
RICE_IS_LIGHT_THEME=false

# If Light Theme then switch Dark and Light Values
if ($RICE_IS_LIGHT_THEME); then
   RICE_TEMP=$RICE_COLOR_DARK_4
   RICE_COLOR_DARK_4=$RICE_COLOR_LIGHT_4
   RICE_COLOR_LIGHT_4=$RICE_TEMP

   RICE_TEMP=$RICE_COLOR_DARK_3
   RICE_COLOR_DARK_3=$RICE_COLOR_LIGHT_3
   RICE_COLOR_LIGHT_3=$RICE_TEMP

   RICE_TEMP=$RICE_COLOR_DARK_2
   RICE_COLOR_DARK_2=$RICE_COLOR_LIGHT_2
   RICE_COLOR_LIGHT_2=$RICE_TEMP

   RICE_TEMP=$RICE_COLOR_DARK_1
   RICE_COLOR_DARK_1=$RICE_COLOR_LIGHT_1
   RICE_COLOR_LIGHT_1=$RICE_TEMP
fi

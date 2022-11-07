#!/usr/bin/bash

I3_CONF_PATH=~/.config/themes/active/i3.conf
POLYBAR_CONF_PATH=~/.config/themes/active/polybar_conf.ini
POLYBAR_COLOR_CONF_PATH=~/.config/themes/active/polybar_color_conf.ini
ALACRITTY_CONF_PATH=~/.config/themes/active/alacritty_conf.yml
PICOM_CONF_PATH=~/.config/themes/active/picom.conf

# Functions
get_variable() {
	local variable=$(cat ~/.config/themes/$2 | sed -n -e "/$1/ s/.*\= *//p")
	echo $variable
}
# I3
append_variable_i3() {
	echo "set \$$1 $2" >> $I3_CONF_PATH
}
# Polybar
append_variable_polybar() {
	echo "$1 = $2" >> $POLYBAR_CONF_PATH
}
append_variable_polybar_color() {
	echo "$1 = $2" >> $POLYBAR_COLOR_CONF_PATH
}
# Allacritty
append_variable_alacritty() {
	echo "$1: $2" >> $ALACRITTY_CONF_PATH
}
# Picom
append_variable_picom() {
	echo "$1 = $2;" >> $PICOM_CONF_PATH
}

# Read Base.txt
THEME="$(get_variable "theme" "base.txt")"
GAPS="$(get_variable "gaps" "base.txt")"
RADIUS="$(get_variable "radius" "base.txt")"
FONT_FAMILY="$(get_variable "font-family" "base.txt")"
FONT_SIZE="$(get_variable "font-size" "base.txt")"
OPACITY="$(get_variable "opacity" "base.txt")"
PADDING="$(get_variable "padding" "base.txt")"

# Read Picom Base

# Read Bar Settings
BAR_FONT_LINE_HEIGHT="$(get_variable "bar-font-line-height" "base.txt")"

# Read Colors
C_D1="$(get_variable "d1" "color_schemes/$THEME.txt")"
C_D2="$(get_variable "d2" "color_schemes/$THEME.txt")"
C_D3="$(get_variable "d3" "color_schemes/$THEME.txt")"
C_D4="$(get_variable "d4" "color_schemes/$THEME.txt")"

C_L1="$(get_variable "l1" "color_schemes/$THEME.txt")"
C_L2="$(get_variable "l2" "color_schemes/$THEME.txt")"
C_L3="$(get_variable "l3" "color_schemes/$THEME.txt")"

C_RED="$(get_variable "red" "color_schemes/$THEME.txt")"
C_ORANGE="$(get_variable "orange" "color_schemes/$THEME.txt")"
C_YELLOW="$(get_variable "yellow" "color_schemes/$THEME.txt")"
C_GREEN="$(get_variable "green" "color_schemes/$THEME.txt")"
C_CYAN="$(get_variable "cyan" "color_schemes/$THEME.txt")"
C_LIGHT_BLUE="$(get_variable "light_blue" "color_schemes/$THEME.txt")"
C_BLUE="$(get_variable "dark_blue" "color_schemes/$THEME.txt")"
C_PURPLE="$(get_variable "purple" "color_schemes/$THEME.txt")"

# Generate I3 Config File
echo "" > $I3_CONF_PATH

# write Colors
append_variable_i3 "c_d1" "\"$C_D1\""
append_variable_i3 "c_d2" "\"$C_D2\""
append_variable_i3 "c_d3" "\"$C_D3\""
append_variable_i3 "c_d4" "\"$C_D4\""

append_variable_i3 "c_l1" "\"$C_L1\""
append_variable_i3 "c_l2" "\"$C_L2\""
append_variable_i3 "c_l3" "\"$C_L3\""

append_variable_i3 "c_red" "\"$C_RED\""
append_variable_i3 "c_orange" "\"$C_ORANGE\""
append_variable_i3 "c_yellow" "\"$C_YELLOW\""
append_variable_i3 "c_green" "\"$C_GREEN\""
append_variable_i3 "c_cyan" "\"$C_CYAN\""
append_variable_i3 "c_light_blue" "\"$C_LIGHT_BLUE\""
append_variable_i3 "c_blue" "\"$C_BLUE\""
append_variable_i3 "c_purple" "\"$C_PURPLE\""

# write Other Variables
append_variable_i3 "c_gapSize" "$GAPS"
append_variable_i3 "c_borderRadius" "$RADIUS"
append_variable_i3 "c_fontFamily" "$FONT_FAMILY"
append_variable_i3 "c_fontSize" "$FONT_SIZE"

# Generate Polybar Config File
echo "[conf]" > $POLYBAR_CONF_PATH
echo "[conf_colors]" > $POLYBAR_COLOR_CONF_PATH

# write Colors
append_variable_polybar_color "c_d1" "$C_D1"
append_variable_polybar_color "c_d2" "$C_D2"
append_variable_polybar_color "c_d3" "$C_D3"
append_variable_polybar_color "c_d4" "$C_D4"

append_variable_polybar_color "c_l1" "$C_L1"
append_variable_polybar_color "c_l2" "$C_L2"
append_variable_polybar_color "c_l3" "$C_L3"

append_variable_polybar_color "c_red" "$C_RED"
append_variable_polybar_color "c_orange" "$C_ORANGE"
append_variable_polybar_color "c_yellow" "$C_YELLOW"
append_variable_polybar_color "c_green" "$C_GREEN"
append_variable_polybar_color "c_cyan" "$C_CYAN"
append_variable_polybar_color "c_light_blue" "$C_LIGHT_BLUE"
append_variable_polybar_color "c_blue" "$C_BLUE"
append_variable_polybar_color "c_purple" "$C_PURPLE"

# write Other Variables
append_variable_polybar "gap-size" "$GAPS"
append_variable_polybar "border-radius" "$RADIUS"
append_variable_polybar "font" "$FONT_FAMILY:pixelsize=$FONT_SIZE;$BAR_FONT_LINE_HEIGHT"

# Generate Alacritty Config File
echo "" > $ALACRITTY_CONF_PATH

# write base variables
append_variable_alacritty "#Window Config"
append_variable_alacritty "window"
append_variable_alacritty "  padding"
append_variable_alacritty "    x" "$PADDING"
append_variable_alacritty "    y" "$PADDING"
append_variable_alacritty "  opacity" "$OPACITY"

# write Font Variables
append_variable_alacritty "# Font Config"
append_variable_alacritty "font"
append_variable_alacritty "  normal"
append_variable_alacritty "    family" "\"$FONT_FAMILY Mono\""

# write Colors
append_variable_alacritty "# Color Config"
append_variable_alacritty "colors"
append_variable_alacritty "  primary"
append_variable_alacritty "    background" "'$C_D1'"
append_variable_alacritty "    foreground" "'$C_L1'"
append_variable_alacritty "  normal"
append_variable_alacritty "    black" "'$C_D1'"
append_variable_alacritty "    red" "'$C_RED'"
append_variable_alacritty "    green" "'$C_GREEN'"
append_variable_alacritty "    yellow" "'$C_YELLOW'"
append_variable_alacritty "    blue" "'$C_BLUE'"
append_variable_alacritty "    magenta" "'$C_PURPLE'"
append_variable_alacritty "    cyan" "'$C_CYAN'"
append_variable_alacritty "    white" "'$C_L1'"

# Generate Picom Config File
cp ~/.config/themes/picom.txt $PICOM_CONF_PATH

append_variable_picom "# Generated Config Part"
append_variable_picom "corner-radius" "$RADIUS"
append_variable_picom "round-borders" "$RADIUS"

# Configure Flameshot Colors
flameshot config -k $C_BLUE -m $C_LIGHT_BLUE

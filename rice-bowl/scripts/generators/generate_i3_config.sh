#!/bin/bash

RICE_I3_PATH=$RICE_DIR_CONFIG/i3
RICE_I3_DIR_CONF=$RICE_I3_PATH/conf
mkdir -p $RICE_I3_PATH
mkdir -p $RICE_I3_DIR_CONF

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

# Set Window Title Font
font pango:\$font_mono \$font_size_small
" > $RICE_I3_DIR_CONF/fonts.nogit.conf

# Generate styling.conf
echo "# $RICE_GENERATED_HEADER

# Configure Gaps
gaps inner $RICE_GAPS
# Configure Border Size
default_border pixel $RICE_BORDER_THICKNESS
default_floating_border pixel $RICE_BORDER_THICKNESS

# Confgire Colors
# class                 border          		        backgr.         		text            		indicator               			child_border
client.focused          $RICE_COLOR_PRIMARY_ACCENT		$RICE_COLOR_DARK_2		$RICE_COLOR_LIGHT_1		$RICE_COLOR_PRIMARY_ACCENT			$RICE_COLOR_PRIMARY_ACCENT
client.focused_inactive $RICE_COLOR_SECONDARY_ACCENT		$RICE_COLOR_DARK_2		$RICE_COLOR_LIGHT_1		$RICE_COLOR_SECONDARY_ACCENT			$RICE_COLOR_SECONDARY_ACCENT
client.unfocused        $RICE_COLOR_DARK_1			$RICE_COLOR_DARK_3		$RICE_COLOR_LIGHT_1		$RICE_COLOR_DARK_1				$RICE_COLOR_DARK_1
client.urgent           $RICE_COLOR_RED			       	$RICE_COLOR_ORANGE		$RICE_COLOR_RED			$RICE_COLOR_ORANGE				$RICE_COLOR_RED
client.placeholder	$RICE_COLOR_LIGHT_1		   	$RICE_COLOR_LIGHT_3		$RICE_COLOR_DARK_1		$RICE_COLOR_LIGHT_1				$RICE_COLOR_LIGHT_1

client.background	    $RICE_COLOR_LIGHT_1
" > $RICE_I3_DIR_CONF/styling.nogit.conf

# Generate apps2.conf
echo "# $RICE_GENERATED_HEADER

bindsym \$mod+Shift+e exec $RICE_DIR_CONFIG/rofi/scripts/powermenu/powermenu.sh # open the power Menu

bindsym \$mod+Shift+h exec $RICE_DIR_CONFIG/rofi/scripts/bindings/bindings.sh # open the bindings/help Menu

bindsym \$mod+Shift+s exec --no-startup-id flameshot gui --clipboard --accept-on-select --path $RICE_DIR_SCREENSHOTS # take a Screenshot

# start picom
exec --no-startup-id picom -b --config $RICE_DIR_CONFIG/picom/picom.nogit.conf --experimental-backend

# start polybar
exec_always $RICE_DIR_CONFIG/polybar/scripts/launch.sh

# set wallpaper
exec --no-startup-id $RICE_DIR_CONFIG/.fehbg
" > $RICE_I3_DIR_CONF/apps.nogit.conf

#!/bin/bash

RICE_PICOM_PATH=$RICE_DIR_CONFIG/picom

# Generate picom.conf
echo "# $RICE_GENERATED_HEADER" > $RICE_PICOM_PATH/picom.nogit.conf
cat $RICE_PICOM_PATH/picom.conf >> $RICE_PICOM_PATH/picom.nogit.conf
echo "


#################################
#       Generated Part          #
#################################

frame-opacity = $RICE_OPACITY_FLOAT;
active-opacity = $RICE_OPACITY_FLOAT;
inactive-opacity = $RICE_INACTIVE_OPACITY_FLOAT;

corner-radius = $RICE_BORDER_RADIUS;
round-borders = $RICE_BORDER_RADIUS;
" >> $RICE_PICOM_PATH/picom.nogit.conf

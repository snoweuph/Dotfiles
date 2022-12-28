#!/bin/bash

# Get Working Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# File Path to theme Changes for the rofi theme for this script
theme=${SCRIPT_DIR}/powermenu.rasi

# Load Active Rofi theme into temp file
rofi -dump-theme > $SCRIPT_DIR/temp.rasi
# Append Rofi Theme Changes to Themp File
cat $theme >> $SCRIPT_DIR/temp.rasi

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p "Phrase" \
        -mesg "message" \
        -theme "${SCRIPT_DIR}/temp.rasi"
}

rofi_cmd



# Clear Temp Rofi Theme File
rm $SCRIPT_DIR/temp.rasi
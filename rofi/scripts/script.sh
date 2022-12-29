#!/bin/bash

# Get Working Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# File Path to theme Changes for the rofi theme for this script
theme=${SCRIPT_DIR}/script.rasi

# Loading Rice Envoirement Config Vaiables
source ~/.config/rice-bowl/config.sh

# Load Active Rofi theme into temp file
rofi -dump-theme > $SCRIPT_DIR/temp.rasi
# Append Rofi Theme Changes to Themp File
cat $theme >> $SCRIPT_DIR/temp.rasi

# Get Uptime
uptime="`uptime -p | sed -e 's/up //g'`"

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -i
        -mesg "祥 Uptime: $uptime" \
        -theme "${SCRIPT_DIR}/temp.rasi"
}

rofi_cmd



# Clear Temp Rofi Theme File
rm $SCRIPT_DIR/temp.rasi

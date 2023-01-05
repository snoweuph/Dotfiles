#!/bin/bash

# Get Working Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# File Path to theme Changes for the rofi theme for this script
theme=${SCRIPT_DIR}/confirm.rasi

# Loading Rice Envoirement Config Vaiables
source ~/.config/rice-bowl/config.sh

# Load Active Rofi theme into temp file
rofi -dump-theme > $SCRIPT_DIR/temp.rasi
# Append Rofi Theme Changes to Themp File
cat $theme >> $SCRIPT_DIR/temp.rasi

mesg="Are you Sure?"

yes=''
no=''

if [[ -n "$1" ]]; then
  mesg=$1
fi
if [[ -n "$2" ]]; then
  yes=$2
fi
if [[ -n "$3" ]]; then
  no=$3
fi



# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -u 1 \
        -dmenu \
        -p "$mesg" \
        -theme "${SCRIPT_DIR}/temp.rasi"
}

echo -e "$yes\n$no" |rofi_cmd

# Clear Temp Rofi Theme File
rm $SCRIPT_DIR/temp.rasi
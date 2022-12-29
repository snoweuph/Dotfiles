#!/bin/bash

# Get Working Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# File Path to theme Changes for the rofi theme for this script
theme=${SCRIPT_DIR}/bindings.rasi

# Loading Rice Envoirement Config Vaiables
source ~/.config/rice-bowl/config.sh

# Load Active Rofi theme into temp file
rofi -dump-theme > $SCRIPT_DIR/temp.rasi
# Append Rofi Theme Changes to Themp File
cat $theme >> $SCRIPT_DIR/temp.rasi
# Append Custom Calculated part to Theme
echo "entry {width: calc(33% - $(($((RICE_PADDING + RICE_GAPS)) * 2))px);}" >> $SCRIPT_DIR/temp.rasi 

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -i \
        -theme "${SCRIPT_DIR}/temp.rasi"
}

# Generate Bindings Array
EntryString=""
BindingsI3=()

#Icons
ICON_I3="i3"

# Get I3 Bindings
while read -r line; do
    BindingsI3+=( "${line}" )
done < <(cat ~/.config/i3/conf/bindings.conf |  grep "^bindsym" | sed 's/[^ ]* //')
# Apps
while read -r line; do
    BindingsI3+=( "${line}" )
done < <(cat ~/.config/i3/conf/apps.conf |  grep "^bindsym" | sed 's/[^ ]* //')
# Apps2
while read -r line; do
    BindingsI3+=( "${line}" )
done < <(cat ~/.config/i3/conf/apps.nogit.conf |  grep "^bindsym" | sed 's/[^ ]* //')

# Make Exec Entrys look better
f=0
for i in "${BindingsI3[@]}"; do
    STRING=$( echo $i | grep exec)
    if [[ -n "$STRING" ]]; then
        DESCRIPTIOR=${STRING##*#}
        Action=${STRING%exec*}
        BindingsI3[$f]="${Action} ${DESCRIPTIOR}";
    fi
    f=$((f+1))
done


# Append To Entry String
for i in "${BindingsI3[@]}"; do
  EntryString="${EntryString}i3 ${i}\n"
done

echo -en $EntryString | rofi_cmd

#\0icon\x1f<span color='red'>i3</span>\n

# Clear Temp Rofi Theme File
rm $SCRIPT_DIR/temp.rasi



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

EntryString=""
SPLIT_SIGN=" | "

###########################
##           I3          ##
###########################

# Generate Bindings Array
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
        BindingsI3[$f]="${Action}${SPLIT_SIGN}${DESCRIPTIOR}";
    else
        BINDING=$(echo $i | awk '{print $1}')
        DESCRIPTIOR=$(echo $i | awk '{print $2}')
        BindingsI3[$f]="${BINDING}${SPLIT_SIGN}${DESCRIPTIOR}"
    fi
    f=$((f+1))
done

# Append To Entry String
for i in "${BindingsI3[@]}"; do
  EntryString="${EntryString}${ICON_I3} ${i}\n"
done

###########################
##         ROFI          ##
###########################


# Generate Bindings Array
BindingsRofi=()

#Icons
ICON_ROFI="Rofi"

# Get I3 Bindings
while read -r line; do
    BindingsRofi+=( "${line}" )
done < <(cat ~/.config/rofi/bindings.txt | grep -v -e '^$')

f=0
for i in "${BindingsRofi[@]}"; do
    BINDING=$(echo $i | awk '{print $1}')
    DESCRIPTIOR=$(echo $i | awk '{sub($1 FS,"")}7')
    BindingsRofi[$f]="${BINDING}${SPLIT_SIGN}${DESCRIPTIOR}"
    f=$((f+1))
done

# Append To Entry String
for i in "${BindingsRofi[@]}"; do
  EntryString="${EntryString}${ICON_ROFI} ${i}\n"
done


###########################
echo -en $EntryString | rofi_cmd

#\0icon\x1f<span color='red'>i3</span>\n

# Clear Temp Rofi Theme File
rm $SCRIPT_DIR/temp.rasi



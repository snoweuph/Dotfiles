#!/bin/bash

# Get Working Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# File Path to theme Changes for the rofi theme for this script
theme=${SCRIPT_DIR}/powermenu.rasi

# Load Active Rofi theme into temp file
rofi -dump-theme > $SCRIPT_DIR/temp.rasi
# Append Rofi Theme Changes to Themp File
cat $theme >> $SCRIPT_DIR/temp.rasi

# Get Uptime
uptime="`uptime -p | sed -e 's/up //g'`"

# Options icons
hibernate=''
shutdown=''
reboot=''
lock=''
sleep=''
logout='﫼'

yes=''
no=''

# Rofi CMD
rofi_cmd() {
    rofi -dmenu \
        -p " $USER" \
        -mesg "祥 Uptime: $uptime" \
        -theme "${SCRIPT_DIR}/temp.rasi"
}

# Ask for confirmation
confirm_exit() {
	$SCRIPT_DIR/../confirm/confirm.sh "Are you Sure?" "$yes" "$no"
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$logout\n$sleep\n$reboot\n$lock\n$hibernate\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--hibernate' ]]; then
			systemctl hibernate
		elif [[ $1 == '--sleep' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $hibernate)
		run_cmd --hibernate
        ;;
    $lock)
		i3lock -i ~/Bilder/Wallpaper/Landscape/Nord/nord-rainbow-waves-long.png -t
        ;;
    $sleep)
		run_cmd --sleep
        ;;
    $logout)
		run_cmd --logout
        ;;
esac

# Clear Temp Rofi Theme File
rm $SCRIPT_DIR/temp.rasi

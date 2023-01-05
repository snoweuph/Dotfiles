#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

yes=''
no=''

confirm_kill() {
	$SCRIPT_DIR/../confirm/confirm.sh "Kill Window?" "$yes" "$no"
}

selected="$(confirm_kill)"

if [[ "$selected" == "$yes" ]]; then
    wmctrl -lp | grep -i `echo "obase=16; $1" | bc ` | awk '{print $3}' | xargs kill
else
	exit 0
fi

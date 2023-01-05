#!/bin/bash
wmctrl -lp | grep -i `echo "obase=16; $1" | bc ` | awk '{print $3}' | xargs kill
#!/bin/bash

#bar="▁▂▃▄▅▆▇█"

# make sure to clean pipe
pipe="/tmp/cava.fifo"
if [ -p $pipe ]; then
    unlink $pipe
fi
mkfifo $pipe

# write cava config
config_file="/tmp/polybar_cava_config"
echo "
[general]
bars = 12

[output]
method = raw
raw_target = $pipe
data_format = ascii
ascii_max_range = 7
" > $config_file

# run cava in the background
cava -p $config_file &

#bar="▁▂▃▄▅▆▇█"
# reading data from fifo
while read -r cmd; do
    i=0
    output=""
    while [ $i -lt $((${#cmd}/2)) ]
    do
      	number="${cmd:$i*2:1}"
        i=$((i=i+1))
        case "$number" in
           0)
              output="$output$(echo "%{F$1}▁")"
              ;;
           1)
              output="$output$(echo "%{F$2}▂")"
              ;;
           2)
              output="$output$(echo "%{F$3}▃")"
              ;;
           3)
              output="$output$(echo "%{F$4}▄")"
              ;;
           4)
              output="$output$(echo "%{F$5}▅")"
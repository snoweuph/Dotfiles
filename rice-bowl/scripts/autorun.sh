#!/bin/bash

SH_DIR_generateconfig=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SH_DIR_generateconfig/../config.sh

find $RICE_DIR_AUTORUN -type f -executable | while read line ; do source $line ; done

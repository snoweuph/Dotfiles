#!/bin/bash

SH_DIR_generateconfig=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SH_DIR_generateconfig/../config.sh

# Move Whole Repo Folder to Rice Location
sudo mv $SH_DIR_generateconfig/../../* -t=$RICE_DIR_CONFIG
# Move All Hiden Files
sudo mv $SH_DIR_generateconfig/../../.* -t=$RICE_DIR_CONFIG
# Copy Over Fonts to /usr/share/fonts
sudo cp -r $RICE_DIR_RICE_BOWL/resources/fonts/* /usr/share/fonts

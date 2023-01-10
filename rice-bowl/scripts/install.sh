#!/bin/bash

SH_DIR_INSTALL=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SH_DIR_INSTALL/../config.sh

# Move Whole Repo Folder to Rice Location
sudo mv $SH_DIR_INSTALL/../../* -t=$RICE_DIR_CONFIG
# Move All Hiden Files
sudo mv $SH_DIR_INSTALL/../../.* -t=$RICE_DIR_CONFIG

# Install Resources
source $SH_DIR_INSTALL/install_resources.sh

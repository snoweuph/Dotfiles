#!/bin/bash

SH_DIR_INSTALL_RESOURCES=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SH_DIR_INSTALL_RESOURCES/../config.sh

# Copy Over Fonts to /usr/share/fonts
sudo cp -r $RICE_DIR_RICE_BOWL/resources/fonts/* /usr/share/fonts

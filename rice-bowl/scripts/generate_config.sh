#!/bin/bash

SH_DIR_generateconfig=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source $SH_DIR_generateconfig/../config.sh
source $RICE_DIR_RICE_BOWL/themes/$RICE_THEME.sh

source $SH_DIR_generateconfig/generators/generate_alacritty_config.sh
source $SH_DIR_generateconfig/generators/generate_picom_config.sh
source $SH_DIR_generateconfig/generators/generate_dunst_config.sh
source $SH_DIR_generateconfig/generators/generate_polybar_config.sh
source $SH_DIR_generateconfig/generators/generate_i3_config.sh
source $SH_DIR_generateconfig/generators/generate_rofi_config.sh
source $SH_DIR_generateconfig/generators/generate_cava_config.sh

#!/bin/bash

SH_DIR_config=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

RICE_GENERATED_HEADER="This File is Automaticly Generated. Changes inside of this won't persist. For more Information Look into $SH_DIR_config"

source $SH_DIR_config/config/paths.sh
source $SH_DIR_config/config/fonts.sh
source $SH_DIR_config/config/styling.sh

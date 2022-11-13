#!/bin/bash

RICE_I3_PATH=$RICE_DIR_CONFIG/i3
RICE_I3_DIR_CONF=$RICE_I3_PATH/conf

# Generate colors.conf
echo "# $RICE_GENERATED_HEADER
set \$color_d4 \"$RICE_COLOR_DARK_4\"
set \$color_d3 \"$RICE_COLOR_DARK_3\"
set \$color_d2 \"$RICE_COLOR_DARK_2\"
set \$color_d1 \"$RICE_COLOR_DARK_1\"

set \$color_l1 \"$RICE_COLOR_LIGHT_1\"
set \$color_l2 \"$RICE_COLOR_LIGHT_2\"
set \$color_l3 \"$RICE_COLOR_LIGHT_3\"
set \$color_l4 \"$RICE_COLOR_LIGHT_4\"

set \$color_red \"$RICE_COLOR_RED\"
set \$color_orange \"$RICE_COLOR_ORANGE\"
set \$color_yellow \"$RICE_COLOR_YELLOW\"
set \$color_lime \"$RICE_COLOR_LIME\"
set \$color_green \"$RICE_COLOR_GREEN\"
set \$color_cyan \"$RICE_COLOR_CYAN\"
set \$color_light_blue \"$RICE_COLOR_LIGHT_BLUE\"
set \$color_blue \"$RICE_COLOR_BLUE\"
set \$color_purple \"$RICE_COLOR_PURPLE\"
set \$color_magenta \"$RICE_COLOR_MAGENTA\"

set \$color_accent_primary \"$RICE_COLOR_PRIMARY_ACCENT\"
set \$color_accent_secondary \"$RICE_COLOR_SECONDARY_ACCENT\"
set \$color_accent_tertiary \"$RICE_COLOR_TERTIARY_ACCENT\"
" > $RICE_I3_DIR_CONF/colors.conf

# Generate fonts.conf
echo "# $RICE_GENERATED_HEADER

" > $RICE_I3_DIR_CONF/fonts.conf

# Generate styling.conf
echo "# $RICE_GENERATED_HEADER

" > $RICE_I3_DIR_CONF/styling.conf

# Generate apps2.conf
echo "# $RICE_GENERATED_HEADER

" > $RICE_I3_DIR_CONF/apps2.conf

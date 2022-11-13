#!/bin/bash

# Generate Fehbg
echo "#!/bin/bash
feh --no-fehbg --bg-scale $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_1 $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_2 $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_3
" > $RICE_DIR_CONFIG/.fehbg

$RICE_DIR_CONFIG/.fehbg

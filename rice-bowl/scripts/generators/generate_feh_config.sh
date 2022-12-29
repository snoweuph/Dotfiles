#!/bin/bash

# Generate Fehbg
echo "#!/bin/bash
# $RICE_GENERATED_HEADER

feh --no-fehbg --bg-scale $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_1 $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_2 $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_3
" > ~/.fehbg

# Mark as Executable
chmod +x ~/.fehbg

# Execute
~/.fehbg

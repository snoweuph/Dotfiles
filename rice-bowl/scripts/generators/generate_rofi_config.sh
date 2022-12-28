#!/bin/bash

RICE_ROFI_PATH=$RICE_DIR_CONFIG/rofi
RICE_ROFI_SCRIPTS_PATH=$RICE_ROFI_PATH/scripts

# Coppy Over First Wallpaper to be used by scripts
cp $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_1 $RICE_ROFI_SCRIPTS_PATH/image.nogit.jpg

# Generate Rasi File
echo "/** $RICE_GENERATED_HEADER **/
* {
    font:               \"$RICE_FONT_NORMAL $RICE_FONT_SIZE_SMALL\";
    font-icon:          \"$RICE_FONT_NORMAL $RICE_FONT_SIZE_ICONS_BIG\";
    
    theme-dark-4:   $RICE_COLOR_DARK_4;
    theme-dark-3:   $RICE_COLOR_DARK_3;
    theme-dark-2:   $RICE_COLOR_DARK_2;
    theme-dark-1:   $RICE_COLOR_DARK_1;

    theme-light-1:   $RICE_COLOR_LIGHT_1;
    theme-light-2:   $RICE_COLOR_LIGHT_2;
    theme-light-3:   $RICE_COLOR_LIGHT_3;
    theme-light-4:   $RICE_COLOR_LIGHT_4;

    theme-accent-red:           $RICE_COLOR_RED;
    theme-accent-orange:        $RICE_COLOR_ORANGE;
    theme-accent-yellow:        $RICE_COLOR_YELLOW;
    theme-accent-lime:          $RICE_COLOR_LIME;
    theme-accent-green:         $RICE_COLOR_GREEN;
    theme-accent-cyan:          $RICE_COLOR_CYAN;
    theme-accent-light-blue:    $RICE_COLOR_LIGHT_BLUE;
    theme-accent-blue:          $RICE_COLOR_BLUE;
    theme-accent-purple:        $RICE_COLOR_PURPLE;
    theme-accent-magenta:       $RICE_COLOR_MAGENTA;

    theme-accent-primary:       $RICE_COLOR_PRIMARY_ACCENT;
    theme-accent-secondary:     $RICE_COLOR_SECONDARY_ACCENT;
    theme-accent-tertiary:      $RICE_COLOR_TERTIARY_ACCENT;
    
    background-color:   transparent;
    text-color:         @theme-light-1;

    margin:     0px;
    padding:    0px;
    spacing:    0px;
}

window {
    background-color:   @theme-dark-4;
    border-color:	@theme-accent-primary;

    location:   center;
    width:      480px;
    border:     1px;
}

inputbar {
    padding:    8px 12px;
    spacing:    12px;
    children:   [ prompt, entry ];
}

prompt, entry, element-text, element-icon {
    vertical-align: 0.5;
}

prompt {
    text-color: @theme-accent-primary;
}

listview {
    lines:	8;
    columns:    1;

    fixed-height:   false;
}

element {
    padding:    8px;
    spacing:    8px;
}

element normal urgent {
    text-color: @theme-accent-tertiary;
}

element normal active {
    text-color: @theme-accent-primary;
}

element selected {
    text-color: @theme-dark-4;
}

element selected normal {
    background-color:   @theme-accent-primary;
}

element selected urgent {
    background-color:   @theme-accent-tertiary;
}

element selected active {
    background-color:   @theme-accent-secondary;
}

element-icon {
    size:   0.75em;
}

element-text {
    text-color: inherit;
}
" > $RICE_ROFI_PATH/themes/$RICE_THEME.rasi

# Generate Rofi config.rasi, to use the theme
echo "// $RICE_GENERATED_HEADER
@theme \"$RICE_ROFI_PATH/themes/$RICE_THEME.rasi\"
" > $RICE_ROFI_PATH/config.rasi
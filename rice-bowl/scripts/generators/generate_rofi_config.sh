#!/bin/bash

RICE_ROFI_PATH=$RICE_DIR_CONFIG/rofi
RICE_ROFI_SCRIPTS_PATH=$RICE_ROFI_PATH/scripts

# Coppy Over First Wallpaper to be used by scripts
cp $RICE_DIR_WALLPAPER/$RICE_WALLPAPER_1 $RICE_ROFI_SCRIPTS_PATH/image.nogit.jpg

# Generate Rasi File
echo "/** $RICE_GENERATED_HEADER **/
configuration {
    modi:                       \"drun,filebrowser,window\";
    show-icons:                 true;
    display-drun:               \"\";
    display-filebrowser:        \"\";
    display-window:             \"\";
	drun-display-format:        \"{name}\";
	window-format:              \"{w} · {c} · {t}\";
    window-command:             \"$RICE_ROFI_SCRIPTS_PATH/killwindowbyid/killbyid.sh {window}\";          

    kb-move-char-forward:       \"\";
    kb-move-char-back:          \"\";
    kb-remove-char-forward:     \"\";


    kb-accept-entry:            \"Return\";
    kb-mode-next:               \"Right\";
    kb-mode-previous:           \"Left\";


    kb-accept-alt:            \"Delete\";
}

* {
    font:               \"$RICE_FONT_NORMAL $RICE_FONT_SIZE_SMALL\";
    font-icon-small:    \"$RICE_FONT_MONO $RICE_FONT_SIZE_ICONS_SMALL\";
    font-icon:          \"$RICE_FONT_MONO $RICE_FONT_SIZE_ICONS_BIG\";

    
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

    theme-border-radius:	${RICE_BORDER_RADIUS}px;
    theme-padding:		${RICE_PADDING}px;
    theme-gaps:			${RICE_GAPS}px;
}

/*****----- Main Window -----*****/
window {
    /* properties for window widget */
    location:                    center;
    width:                       33%;
    enabled:                     true;
    border-radius:               @theme-border-radius;
    border:                      ${RICE_BORDER_THICKNESS}px;
    border-color:                @theme-accent-primary;
    background-color:            @theme-dark-4;
}

/*****----- Main Box -----*****/
mainbox {
    enabled:                     true;
    spacing:                     0px;
    background-color:            transparent;
    orientation:                 vertical;
    children:                    [ \"inputbar\", \"listbox\" ];
}

listbox {
    spacing:                     @theme-gaps;
    padding:                     @theme-gaps;
    background-color:            transparent;
    orientation:                 vertical;
    children:                    [ \"message\", \"listview\" ];
}

/*****----- Inputbar -----*****/
inputbar {
    enabled:                     true;
    spacing:                     @theme-gaps;
    padding:                     @theme-gaps;
    background-color:            transparent;
    text-color:                  @text-color;
    orientation:                 horizontal;
    children:                    [ \"entry\", \"dummy\", \"mode-switcher\" ];
}
entry {
    enabled:                     true;
    expand:                      false;
    width:                       calc(33% - $(($((RICE_FONT_SIZE_ICONS_SMALL * 3)) + $((RICE_GAPS * 13))))px);
    padding:                     @theme-gaps;
    border-radius:               @theme-border-radius;
    background-color:            @theme-dark-1;
    text-color:                  inherit;
    cursor:                      text;
    placeholder:                 \"Search\";
    placeholder-color:           inherit;
}
dummy {
    expand:                      true;
    background-color:            transparent;
}

/*****----- Mode Switcher -----*****/
mode-switcher{
    enabled:                     true;
    spacing:                     @theme-gaps;
    background-color:            transparent;
    text-color:                  @text-color;
}
button {
    font:                        @font-icon-small;
    width:                       45px;
    padding:                     @theme-padding;
    border-radius:               @theme-border-radius;
    background-color:            @theme-dark-1;
    text-color:                  inherit;
    cursor:                      pointer;
}
button selected {
    background-color:            @theme-accent-primary;
    text-color:                  @text-color;
}

/*****----- Listview -----*****/
listview {
    enabled:                     true;
    columns:                     1;
    lines:                       7;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;
    
    spacing:                     @theme-gaps;
    background-color:            transparent;
    text-color:                  @text-color;
    cursor:                       \"default\";
}

/*****----- Elements -----*****/
element {
    enabled:                     true;
    spacing:                     @theme-gaps;
    padding:                     @theme-padding;
    border-radius:               @theme-border-radius;
    background-color:            inherit;
    text-color:                  @text-color;
    cursor:                      pointer;
}

element normal.urgent {
    background-color:            @theme-accent-tertiary;
    text-color:                  @text-color;
}
element normal.active {
    background-color:            @theme-accent-secondary;
    text-color:                  @text-color;
}
element selected.normal {
    background-color:            @theme-accent-primary;
    text-color:                  @theme-dark-1;
}
element selected.urgent {
    background-color:            @theme-accent-tertiary;
    text-color:                  @text-color;
}
element selected.active {
    background-color:            @theme-accent-tertiary;
    text-color:                  @text-color;
}
element-icon {
    background-color:            transparent;
    text-color:                  inherit;
    size:                        ${RICE_FONT_SIZE_ICONS_NORMAL}px;
    cursor:                      inherit;
}
element-text {
    background-color:            transparent;
    text-color:                  inherit;
    cursor:                      inherit;
    vertical-align:              0.5;
    horizontal-align:            0.0;
}

/*****----- Message -----*****/
message {
    background-color:            transparent;
}
textbox {
    padding:                     @theme-padding;
    border-radius:               @theme-border-radius;
    background-color:            @theme-dark-1;
    text-color:                  @text-color;
    vertical-align:              0.5;
    horizontal-align:            0.0;
}
error-message {
    padding:                     @theme-padding;
    border-radius:               @theme-border-radius;
    background-color:            @theme-dark-4;
    text-color:                  @text-color;
}

" > $RICE_ROFI_PATH/themes/$RICE_THEME.rasi

# Generate Rofi config.rasi, to use the theme
echo "// $RICE_GENERATED_HEADER
@theme \"$RICE_ROFI_PATH/themes/$RICE_THEME.rasi\"
" > $RICE_ROFI_PATH/config.rasi

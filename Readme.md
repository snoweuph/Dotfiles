## Rice Bowl

I've created a Dir under .config called Rice Bowl which is something like the Rice Controller / Master

## Install Dependencies

### Fedora

```
sudo dnf install i3 zsh alacritty polybar rofi picom htop neofetch cava
```

## Software Used

### Base

- Shell: ZSH
- Terminal: Alacritty
- Display Manager:
- Window Manager: I3
- Compositor: Picom
- Program Launcher: Rofi
- Panel: Polybar
- Notification Server: Dunst
- Audio Server: Pipewire

### CLI

- System Monitor: HTop
- Music Visualizer: Cava
- Markdown Viewer: Glow
- Image Viewer: Feh
- Fetch: Neofetch

### GUI

## Dir

### Tree

```
".config/"
|__"rice-bowl/"
|  |__"demon.sh"
|  |__"config.sh"
|  |
|  |__"config/"
|  |  |__"paths.sh"
|  |  |__"fonts.sh"
|  |  |__"styling.sh"
|  |
|  |__"scripts/"
|  |  |__"generate_config.sh"
|  |  |
|  |  |__"generators/"
|  |     |__"generate_<generator>_config.sh"
|  |
|  |__"themes/"
|     |__"<theme>.sh"
|
|__"rofi/"
|  |__"scripts/"
|  |  |__"<script-name>/"
|  |     |__"<script-name>.sh"
|  |     |__"<script-name>.rasi" 
|  |  
|  |__"themes/"
|     |__"<theme-name>.rasi"
|
|__"i3/"
|  |__"config"
|  |
|  |__"conf/"
|  |  |__"colors.conf"
|  |  |__"fonts.conf"
|  |  |__"bindings.conf"
|  |  |__"apps.conf"
|  |  |__"apps2.conf"
|  |  |__"workspaces.conf"
|  |  |__"styling.conf"
|  |  |__"styling1.conf
|  |  |__"rules.conf"
|  |
|  |__"scripts"
|     |__"polybar.sh"
|     |__"<script-name>.sh"
|
|__"picom/"
|  |__"picom.conf"
|
|__"dunst/"
|  |__"dunstrc"
|  |
|  |__"dunstrc.d"
|     |__"00-colors.conf"
|     |__"10-fonts.conf"
|     |__"50-bindings.conf"
|     |__"80-styling.conf"
|
|__"polybar/"
|  |__"launch.sh"
|  |__"config.ini"
|  |
|  |__"config/"
|  |  |__"colors.ini"
|  |  |__"fonts.ini"
|  |  |__"styling.ini"
|  |
|  |__"modules/"
|  |  |__"<module-name>/"
|  |     |__"<module-name>.ini"
|  |     |__"?<module-name>.sh"
|  |     |
|  |     |__"?config/"
|  |     |__"<module-name>.conf"
|  |
|  |__"bars/"
|     |__"<bar-name>.ini"
|  
|__"alacritty/"
|  |__"alacritty.yml"
|     |
|     |__"config/"
|        |__"colors.yml"
|        |__"fonts.yml"
|        |__"styling.yml"
```

### Files

#### rice-bowl/config/paths.txt

```
config-dir =
images-dir =
wallpaper-dir =
screenshot-dir =
```

## Themeing Engines
- GTK
   - gtkrc
   - gtk 2
   - gtk 3
   - gtk 4

### Important Envoirment Variables

- GTK_RC_FILES
- GTK2_RC_FILES

### Tools 
*All of these are their names under fedora*

- qt5 - qt5ct
- qt4 - qtconfig-qt4 (provided by qtconfig)
- gtk - lxappearance

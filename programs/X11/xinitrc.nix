/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &

# Set custom env variables that are needed in i3
export WINIT_X11_SCALE_FACTOR=1 # To fix DPI resolution in alacritty
export XDG_DATA_HOME=/home/$USER/.local/share # To fix that rofi does not find any program

# Start i3
exec i3

# Moves the current window to the given space number
yabai -m window --space "$1" && yabai -m space --focus "$1" && yabai -m window --focus first

# Donne la main a chromium pour lancer un rafraichissement
WID=$(xdotool search --onlyvisible --class chromium|head -1)
xdotool windowactivate ${WID}
xdotool key ctrl+F5
# Rend la main à terminator qui exécute le vim
WID=$(xdotool search --onlyvisible --class terminator|head -1)
xdotool windowactivate ${WID}

# Update settings
xrdb -merge .Xresources

# Background
# feh --bg-fill ~/Pictures/Desktops/evergreen.jpg
xsetroot -solid "#0b0a06"

# Calibrate monitor
xcalib -d :0 /usr/share/color/icc/dell_u2412m_standard.icc

# Include other font dirs
# xset +fp /usr/local/share/fonts/
# xset fp rehash

# Activate BSPWM Window Manager
sxhkd &
# exec bspwm
# Panel (also in /etc/profile)
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
exec bspwm -s "$PANEL_FIFO" -p W 2>~/.bspwm.log

# Update settings
xrdb -merge .Xresources

# Background
eval $(cat ~/.fehbg)
# xsetroot -solid "#050505"
# mplayer -noconsolecontrols -rootwin -ss 15 -endpos 60 -vo gl -nosound -loop 60 ~/tmp/darklens.mp4 < /dev/null &

# Calibrate monitor
# xcalib -d :0 /usr/share/color/icc/dell_u2412m_standard.icc
# xcalib -d :1 /usr/share/color/icc/dell_u2412m_standard.icc
dispwin -d1 /usr/share/color/icc/dell_u2412m_standard.icc
dispwin -d2 /usr/share/color/icc/dell_u2312hm_custom_color.icc

# Include other font dirs
xset +fp /usr/share/fonts/bitmap
xset fp rehash

# Stop sleep
xset -dpms s off
xset s off &
xset s noblank &

# Activate BSPWM Window Manager
sxhkd &
# exec bspwm
# Panel (also in /etc/profile)
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
exec bspwm W 2>~/.bspwm.log

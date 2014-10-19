# Link [theme].sh and [theme.xr] to current.sh, current.xr respectively
if [ -n "$1" ]
then
    rm current-sh;
    rm current-xr;
    ln -s $1.sh current-sh;
    ln -s $1.xr current-xr;
    xrdb -merge ~/.Xresources;
else
    echo "Please provide a theme to use"
fi

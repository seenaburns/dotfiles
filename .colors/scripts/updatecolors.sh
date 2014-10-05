# Macro for updating colors when working on a new scheme
. ~/.colors/scripts/gen-xr $1; xrdb -merge ~/.Xresources;

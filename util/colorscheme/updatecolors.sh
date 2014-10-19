# Macro for updating colors when working on a new scheme
. ~/util/colorscheme/gen-xr $1; xrdb -merge ~/.Xresources;

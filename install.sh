# 
# Install script to add standard dotfiles to ~/
# Checks for already existing and system to remove / include certain
# elements
# 

# Color function
# color_text message $GREEN|$RED
GREEN="0;32m";
RED="0;31m";
function color_text () {
    # Print color
    echo -ne  "\033[$2$1";
    
    # Reset attributes
    tput sgr0;
}
SPACING="           ";
FAILED=$(echo -n "[  "; color_text FAILED $RED; echo -n " ]");
SKIP=$(echo -n "[    SKIP ]");
INSTALL=$(echo -n "[ "; color_text INSTALL $GREEN; echo -n   " ]")

# Custom install for bash_profile
# Make existing bash_profile to bash_private
if [ -f ~/.bash_profile ]
then
    echo "$SPACING .bash_profile exists, attempting to move to .bash_private"
    if [ -f ~/.bash_private ]
    then
        echo  "$FAILED .bash_private exists, aborting"
        exit 1
    else
        "$SPACING Moved .bash_profile to .bash_private"
    fi
    echo "$INSTALL .bash_profile to ~/"
fi

# For other files
# Check existence, if not copy
for f in $(ls -a standard/ | tail -n +3);
do
    # Skip .bash files (have separate installer above)
    [ ${f:0:5} == ".bash" ] && continue

    if [ -f ~/$f ] || [ -d ~/$f ]
    then
        echo "$SKIP $f exists";
    else
        echo "$INSTALL $f"
    fi
done;

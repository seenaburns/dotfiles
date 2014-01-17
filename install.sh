# 
# Install script to add standard dotfiles to ~/
# Checks for already existing and system to remove / include certain
# elements
# 

# Color function
# color_text message $GREEN|$RED
GREEN="0;32m"
RED="0;31m"
function color_text () {
    # Print color
    echo -ne  "\033[$2$1"
    
    # Reset attributes
    tput sgr0;
}
FAILED=$(echo -n "[ "; color_text FAILED $RED; echo -n " ]")

# Custom install for bash_profile
# Make existing bash_profile to bash_private
if [ -f ~/.bash_profile ]
then
    echo ".bash_profile already exists, moving to .bash_private"
    if [ -f ~/.bash_private ]
    then
        echo  "$FAILED .bash_private already exists, aborting"
        exit 1
    else
        color_text "Moved .bash_profile to .bash_private"
    fi
    echo "Installing standard/.bash_profile to ~/"
fi

# For other files 
for f in $(ls -a standard/ | tail -n +3);
do
    echo $f;
    if [ -f ~/$f ] || [ -d ~/$f ]
    then
        echo "exists"
    fi
done;

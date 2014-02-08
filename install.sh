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

function check_diff() {
    for f in $(find standard -type f);
    do
        # Check gitignore
        ignored=0
        for ign in $(cat .gitignore)
        do
            [ ${f#$ign} != $f ] && ignored=1
        done
        [ $ignored == 1 ] && continue

        ff=${f#standard/}
        if [ -f ~/$ff ]
        then
            dout=$(diff -u ~/$ff $f)
            if [ ! -z "$dout" ]
            then
                echo -n "[ "; color_text DIFF $RED; echo -n " ] "; echo "~/$ff"
            else
                echo "[ SAME ] ~/$ff"
            fi
        fi
    done
}

# -c Check files for differences
while getopts ":c" opt;
do
    case $opt in
        c)
            check_diff
            exit
            ;;
    esac
done

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
        mv ~/.bash_profile ~/.bash_private;
        echo "$SPACING Moved .bash_profile to .bash_private"
    fi
    cp standard/.bash_profile ~/.bash_profile;
    echo "$INSTALL .bash_profile"
else
    cp standard/.bash_profile ~/.bash_profile;
    echo "$INSTALL .bash_profile"
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
        cp -r standard/$f ~/$f
        echo "$INSTALL $f"
    fi
done;

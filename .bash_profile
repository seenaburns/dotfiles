# Private for stuff not on github (if exists)
[ -f ~/.bash_private ] && source ~/.bash_private

# Colors for LS and Grep
export CLICOLOR=1 # LS Color
alias grep="grep --color=auto"
export GREP_COLOR='1;32'

# Better Bash History
shopt -s histappend # session appends not overwrites to history
HISTFILESIZE=10000
HISTSIZE=10000
HISTCONTROL=ignoreboth # ignore dup commands, commands starting with space
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# export PROMPT_COMMAND="history -a; history -c; $PROMPT_COMMAND"

# Use nvim or vim as editor
if hash nvim 2>/dev/null;
then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

if [ -e ~/dev/util/lesspipe.sh ];
then
  export LESS='-R'
  export LESSOPEN='|~/dev/util/lesspipe.sh %s'
fi

# ------------------------------------------------------
#            OSX Only
# ------------------------------------------------------
# Use Terminal's colors for emacs (Mac OS X)
[[ "$OSTYPE" == "darwin"* ]] && export TERM='xterm-256color'
# Disable brew analytics
[[ "$OSTYPE" == "darwin"* ]] && export HOMEBREW_NO_ANALYTICS=1
# pbcopy / pbpaste for OSX clipboard
if [[ "$OSTYPE" == "darwin"* ]]
then
    alias pp=pbpaste
    alias pc=pbcopy
fi
# Load bash completions from brew
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# ------------------------------------------------------
#            Custom Prompt
# ------------------------------------------------------
GIT_PS1_SHOWDIRTYSTATE=true
COLOR="\[\e[0;34m\]"
NORMAL="\[\e[0m\]"

# Construct PS1
# Commands need to be in single quotes or they will expand on PS1 creation, not each time the prompt
# runs
PS1="${COLOR}"
[ -n "$SSH_CLIENT" ] && PS1+="\u@\h :: "
PS1+="\W/"
hash __git_ps1 2>/dev/null && PS1+='$(__git_ps1)'
PS1+=" > ${NORMAL}"

# ------------------------------------------------------
#            Command Aliases / Functions
# ------------------------------------------------------
alias la="ls -lah"
alias igrep="grep -ir"
if hash rg 2>/dev/null; then alias rgi="rg -i"; fi
alias aliases="cat ~/.bash_private ~/.bash_profile | grep '^alias\|^function'";

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }
# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' -exec ${2:-file} {} \;  ; }

sorted-du () {
  paste -d '#' <(du -cs *) <(du -chs *) | sort -rn | cut -d '#' -f 2
}

# Notes
NOTES_BASE_PATH=""
[ -d "$HOME/Documents/notes" ] && NOTES_BASE_PATH="$HOME/Documents/notes"
[ -d "$HOME/docs/notes" ]      && NOTES_BASE_PATH="$HOME/docs/notes"

if [ -n "NOTES_BASE_PATH" ]
then
  alias todo="(cd $NOTES_BASE_PATH; nvim todo.txt)"
  alias lstodo="rg --no-line-number ' *(\[.\].*\*)$' $NOTES_BASE_PATH/notes/todo.txt --replace '\$1' | sort"

  # Daily journal
  # Currently set to a file per month, uncomment to make a file per day
  function journal() {
    # today=$(date +"%m-%d-%y")
    thismonth=$(date +"%m-%y")
    # [ ! -f $file ] && echo "# $today" > $file
    (cd $NOTES_BASE_PATH; nvim "journal/$thismonth.txt")
  }
fi

# ------------------------------------------------------
#                       PATH
# ------------------------------------------------------
# Include
# - local executables
# - local python
# - util
export PATH=$PATH:~/.local/bin
export PYTHONPATH=$PYTHONPATH:~/.local/python
export PATH=$PATH:~/dev/util

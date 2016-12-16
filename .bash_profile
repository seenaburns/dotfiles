# Custom Prompt
# Working directory, username, hostname if ssh
# Bright blue for username, white for command
if [ -n "$SSH_CLIENT" ]; then
    PS1='\[\e[0;34m\]\u@\h :: \W/ > \[\e[0m\]'
else
    PS1='\[\e[0;34m\]\u :: \W/ > \[\e[0m\]'
fi

# Private for stuff not on github (if exists)
[ -f ~/.bash_private ] && source ~/.bash_private

# Colors for LS and Grep
export CLICOLOR=1 # LS Color
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Better Bash History
shopt -s histappend # session appends not overwrites to history
HISTFILESIZE=10000
HISTSIZE=10000
HISTCONTROL=ignoreboth # ignore dup commands, commands starting with space

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

# ------------------------------------------------------
#            Command Aliases / Functions
# ------------------------------------------------------
alias la="ls -lah"
alias igrep="grep -ir"
alias aliases="cat ~/.bash_private ~/.bash_profile | grep '^alias\|^function'";

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

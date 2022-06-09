
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ------------------------------------------------------------------

# Resolve dotfiles repository absolute path 
SCRIPT_PATH=$(readlink -n $BASH_SOURCE)
export DOTFILES_PATH=$(dirname $SCRIPT_PATH)

# A list of dotfiles to load in order
files='
  .env
  .path
  .function
  .prompt
  .git-completion.bash
  .alias
'

# Exectue all files present in the source directory
for file in $files
do 
  DOTFILE="$DOTFILES_PATH/source/$file"
  
  [ -f $DOTFILE ] && source $DOTFILE
done

# Force create symlinks in the ln directory
for DOTFILE in $(find $DOTFILES_PATH/ln)
do
  [ -f $DOTFILE ] && ln -sf $DOTFILE "$HOME/$(basename $DOTFILE)"
done

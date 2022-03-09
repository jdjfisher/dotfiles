
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
PROFILE_PATH=$(readlink -n $BASH_SOURCE)
DOTFILES_PATH=$(dirname $PROFILE_PATH)

# Exectue all files in the source directory
for DOTFILE in $(find $DOTFILES_PATH/source)
do
  [ -f $DOTFILE ] && source $DOTFILE
done

# Force create symlinks in the ln directory
for DOTFILE in $(find $DOTFILES_PATH/ln)
do
  [ -f $DOTFILE ] && ln -sf $DOTFILE "$HOME/$(basename $DOTFILE)"
done

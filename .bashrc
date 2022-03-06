
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

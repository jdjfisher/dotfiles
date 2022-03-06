
# TODO: Only delete if symlink to dotfiles

# Remove symlink
rm -f "$HOME/.bashrc"

# TODO: Remove symlinks in the ln dir

# Restore skeleton
cp /etc/skel/.bashrc $HOME

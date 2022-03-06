
# TODO: Prompt file replacement

# Resolve dotfiles repository absolute path 
DOTFILES_PATH=$(dirname $(realpath -s $0))

# Create profile symlink in the home directory 
ln -sfv "$DOTFILES_PATH/.bashrc" "$HOME/.bashrc"

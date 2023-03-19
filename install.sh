#!/bin/bash

# Display message when install script starts
echo "Setting up dotfiles..."

# Create backups of existing files
backup_dir="$HOME/.dotfiles_backup/$(date +%Y%m%d)"
mkdir -p "$backup_dir"
backup_file() {
    if [ -f "$1" ]; then
        echo "Backing up $1 to $backup_dir/$(basename $1)"
        mv "$1" "$backup_dir/$(basename $1)"
    fi
}

backup_file "$HOME/vimrc"
backup_file "$HOME/.vim/plugins.vim"
backup_file "$HOME/.vim/remaps.vim"
backup_file "$HOME/.vim/settings.vim"
backup_file "$HOME/.tmux.conf"

# Create symlinks for files
ln -sfv $PWD/vim/vimrc $HOME/.vimrc
ln -sfv $PWD/vim/plugins.vim $HOME/.vim/plugins.vim
ln -sfv $PWD/vim/remaps.vim $HOME/.vim/remaps.vim
ln -sfv $PWD/vim/remaps.vim $HOME/.vim/settings.vim
ln -sfv $PWD/tmux/tmux.conf $HOME/.tmux.conf

# Display message when setup script is finished
echo "Done setting up dotfiles!"

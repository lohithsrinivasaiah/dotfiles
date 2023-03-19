#!/bin/bash

# Display message when delete script starts
echo "Deleting dotfiles..."

# Restore backups of original files
backup_dir="$HOME/.dotfiles_backup/$(ls -1 $HOME/.dotfiles_backup | tail -n 1)"
if [ -d "$backup_dir" ]; then
    restore_file() {
        if [ -f "$1" ]; then
            echo "Restoring $1 from backup"
            cp "$backup_dir/$(basename $1)" "$1"
        fi
    }

    restore_file "$HOME/.vimrc"
    restore_file "$HOME/.vim/plugins.vim"
    restore_file "$HOME/.vim/remaps.vim"
    restore_file "$HOME/.vim/settings.vim"
    restore_file "$HOME/.tmux.conf"

    # Remove backup directory
    echo "Deleting backup directory $backup_dir"
    rm -r "$backup_dir"
else
    echo "Backup directory not found, no dotfiles to restore"
fi

# Display message when delete script is finished
echo "Done deleting dotfiles!"

#!/bin/bash

# Function to remove a symlink if it exists
remove_symlink() {
    local symlink="$1"
    if [ -L "$symlink" ]; then
        echo "Removing symlink: $symlink"
        rm "$symlink"
    fi
}

# Restore backups of original files
backup_dir="$HOME/.dotfiles_backup/$(ls -1 "$HOME/.dotfiles_backup" | tail -n 1)"
if [ -d "$backup_dir" ]; then
    restore_file() {
        local file="$1"
        if [ -f "$file" ]; then
            echo "Restoring $file from backup"
            cp "$backup_dir/$(basename "$file")" "$file"
        fi
    }

    restore_file "$HOME/.vimrc"
    restore_file "$HOME/.vim/plugins.vim"
    restore_file "$HOME/.vim/remaps.vim"
    restore_file "$HOME/.vim/settings.vim"
    restore_file "$HOME/.tmux.conf"
    restore_file "$HOME/.bash_aliases"

    # Remove backup directory
    echo "Deleting backup directory $backup_dir"
    rm -r "$backup_dir"
else
    echo "Backup directory not found, no dotfiles to restore"
fi

# Remove symlinks
echo "Removing symlinks..."
remove_symlink "$HOME/.vimrc"
remove_symlink "$HOME/.vim/plugins.vim"
remove_symlink "$HOME/.vim/remaps.vim"
remove_symlink "$HOME/.vim/settings.vim"
remove_symlink "$HOME/.tmux.conf"
remove_symlink "$HOME/.bash_aliases"

exec bash

# Display message when delete script is finished
echo "Done deleting dotfiles!"


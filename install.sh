#!/bin/bash

# Display messages during the installation process
echo "Setting up dotfiles..."

# Parameterize the backup directory name (default to a timestamp)
backup_dir="$HOME/.dotfiles_backup/$(date +%Y%m%d)"

# Check if the backup directory already exists
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
    echo "Backup directory created: $backup_dir"
fi

# Function to create a backup of a file if it exists
backup_file() {
    local file="$1"
    if [ -f "$file" ]; then
        echo "Backing up $file to $backup_dir/$(basename "$file")"
        mv "$file" "$backup_dir/$(basename "$file")"
    fi
}

# Function to create a directory if it doesn't exist
create_directory() {
    local directory="$1"
    if [ ! -d "$directory" ]; then
        mkdir -p "$directory"
    fi
}

# Backup files before creating symlinks
backup_file "$HOME/.vimrc"
backup_file "$HOME/.vim/plugins.vim"
backup_file "$HOME/.vim/remaps.vim"
backup_file "$HOME/.vim/settings.vim"
backup_file "$HOME/.tmux.conf"
backup_file "$HOME/.bash_aliases"

# Create missing directories
create_directory "$HOME/.vim"

# Create symlinks for files
echo "Creating symlinks..."
ln -sfv "$PWD/vim/vimrc" "$HOME/.vimrc"
ln -sfv "$PWD/vim/plugins.vim" "$HOME/.vim/plugins.vim"
ln -sfv "$PWD/vim/remaps.vim" "$HOME/.vim/remaps.vim"
ln -sfv "$PWD/vim/settings.vim" "$HOME/.vim/settings.vim"
ln -sfv "$PWD/tmux/tmux.conf" "$HOME/.tmux.conf"
ln -sfv "$PWD/bash/alias.sh" "$HOME/.bash_aliases"

# Add the alias to bashrc if not already present
if ! grep -q "$alias_line" "$HOME/.bashrc"; then
    echo "Adding alias to .bashrc..."
    echo "$alias_line" >> "$HOME/.bashrc"
else
    echo "Alias already exists in .bashrc, skipping..."
fi

# Display message when the setup script is finished
echo "Done setting up dotfiles!"


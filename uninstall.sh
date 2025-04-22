#!/bin/bash
set -e

echo "Removing symlinks..."
rm -fv "$HOME/.vimrc"
rm -fv "$HOME/.vim/plugins.vim"
rm -fv "$HOME/.vim/remaps.vim"
rm -fv "$HOME/.vim/settings.vim"
rm -fv "$HOME/.tmux.conf"
rm -fv "$HOME/.bash_aliases"

echo "Done removing dotfile symlinks!"
